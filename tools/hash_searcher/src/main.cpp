
#include "stdafx.h"


strings			words("res_word.txt");
uint			length;

vector<uint>	val;
vector<uchar>	busy;


char inifile[MAX_PATH + 5];
char *sec_common = "Common data";
char *sec_range  = "Analyzed range";

uint			max_length;
uint			rounded_max_length;

uchar unordering_factor;
uint maximum;
uint record;

uint start_a;
uint delta_a;
uint end_a;
uint start_m;
uint delta_m;
uint end_m;


typedef uint (*unique_func)(uint res, uint x);

enum func_code {
	code_none,

	code_xor,
	code_add,
};


void find_inifile()
{
    GetModuleFileName(NULL, inifile, MAX_PATH);
    char *par = strrchr(inifile, '\\');
	strcpy(par ? par + 1 : inifile + strlen(inifile), "hashing.ini");
}


uint load_parameter(char *section, char *param, uint def = 0)
{
	return GetPrivateProfileInt(section, param, def, inifile);
}

void store_parameter(char *section, char *param, uint x)
{
	char buf[20];
	sprintf(buf, "%d", x);
	WritePrivateProfileString(section, param, buf, inifile);
}


void load_main_parameters()
{
	record		= load_parameter(sec_common, "max_ever_seen");
	unordering_factor = load_parameter(sec_common, "unordering_factor", 2);

	start_a		= load_parameter(sec_range, "a_range_beginning", 0);
	end_a		= load_parameter(sec_range, "a_range_ending", 1000000);
	delta_a		= load_parameter(sec_range, "a_delta", 10000);
	start_m		= load_parameter(sec_range, "m_range_beginning", words.size() );
	end_m		= load_parameter(sec_range, "m_range_ending", start_m + 1);
}

void store_main_parameters()
{
    store_parameter(sec_common, "max_ever_seen", record);
	store_parameter(sec_common, "unordering_factor", unordering_factor);

	store_parameter(sec_range, "a_range_beginning", end_a);
	store_parameter(sec_range, "a_range_ending", end_a + (end_a - start_a) );
	store_parameter(sec_range, "a_delta", delta_a);
	store_parameter(sec_range, "m_range_beginning", start_m);
	store_parameter(sec_range, "m_range_ending", end_m);
}


void store_settings(uint a, uint m)
{
    store_parameter(sec_common, "max_ever_seen", record);

    store_parameter(sec_range, "a_range_beginning", a);
	store_parameter(sec_range, "m_range_beginning", m);
}

void store_record()
{
    store_parameter(sec_common, "max_ever_seen", record);
}


void error(const char *msg)
{
	throw msg;
}

void warning(const char *msg)
{
	cout << msg << endl;
}


void store_results(uint a, uint m, char *msg)
{
	ofstream file("results.txt", ios_base::app);

	file << a << '\t' << m << '\t' << msg << endl;
	cout << a << '\t' << m << '\t' << msg << endl;
}


uint find_max_length()
{
	uint m = 0;

	for (strings::iterator i = words.begin(); i != words.end(); ++i) {
		uint s = (*i).size();
		if (m < s) m = s;
	}

	sort( words.begin(), words.end() );
	if ( adjacent_find(words.begin(), words.end() ) != words.end() ) return 0;

	while (--m > 0)
		for (strings::iterator i = words.begin() + 1; i != words.end(); ++i)
			if ( !strncmp((*i).c_str(), (*(i - 1)).c_str(), m) ) return (m + 1);

	return 0;
}


uint func_xor(uint res, uint x)
{
	return (res ^ x);
}

uint func_add(uint res, uint x)
{
	return (res + x);
}


unique_func decode_func(func_code code)
{
	switch ( code ) {
	case code_xor:
		return func_xor;
	case code_add:
		return func_add;
	default:
		error("no unique function");
		return NULL;
	}
}


void apply_unique_func(unique_func func)
{
	vector<uint> raw(rounded_max_length);
	val.resize(length);

	for (uint i = 0; i < length; i++) {
		for (uint j = 0; j < rounded_max_length; j++) raw[j] = 0;
		strncpy(reinterpret_cast<char *>( &raw[0] ), words[i].c_str(), rounded_max_length * 4);

		uint res = raw[0];
		for (uint j = 1; j < rounded_max_length; j++) res = func(res, raw[j]);
		val[i] = res;
	}
}

bool test_function(unique_func func)
{
	apply_unique_func(func);
	sort( val.begin(), val.end() );
	return ( adjacent_find(val.begin(), val.end() ) == val.end() );
}

func_code detect_uniquing_func()
{
	if ( test_function(func_xor) )
		return code_xor;
	else if ( test_function(func_add) )
		return code_add;
	else {
		error("unable to find unique function");
		// is never accessed but is required by compiler
		return code_none;
	}
}


void report_results(uint a, uint m, uint i)
{
	char txt[100];
	maximum = i;

	if (record < maximum) {
		record = maximum;
        store_record();

		sprintf(txt, "-- %d matched - never seen (%d total)", maximum, length);
	}
	else
		sprintf(txt, "-- %d matched (%d total)", maximum, length);

	store_results(a, m, txt);
}

void report_ideal_results(uint a, uint m)
{
	maximum = length;

	if (record < maximum) {
		record = maximum;
        store_record();

		store_results(a, m, "-- ideal match - never seen");
	}
	else
		store_results(a, m, "-- ideal match");
}


bool search_a(uint start_a, uint end_a, uint mod)
{
    uint i;
    uint a;
	uint *val_ptr	= &*val.begin();
    uchar *busy_ptr = &*busy.begin();
    uchar *busy_cell;

    for (a = start_a; a != end_a; a++) {
        memset(busy_ptr, 0, mod);

        for (i = 0; ; i++) {
            if (i == length) {
                report_ideal_results(a, mod);
                return true;
            }

            busy_cell = busy_ptr + a * val_ptr[i] % mod;
            if ( *busy_cell >= unordering_factor) {
                if (i > maximum) report_results(a, mod, i);
                break;
            }
            else
                ++*busy_cell;
        }
    }

	return false;
}

void find_solutions()
{
	uint a = start_a;
    uint next_a;

    for (uint m = start_m; m < end_m; m++) {
        cout << "analyzing m = " << m << endl;
        busy.resize( (m + 3) & ~3);

	    for (; a != end_a; a = next_a) {
		    next_a = a + delta_a;
        	if (next_a > end_a || next_a < delta_a) next_a = end_a;

			if ( search_a(a, next_a, m) ) return;

        	if (next_a != end_a) {
	            cout << "analyzed a < " << next_a << endl;
		        store_settings(next_a, m);
			}
			else {
			    cout << "all range analyzed" << endl;
		        store_settings(start_a, m + 1);
	        }
		}

		a = 0;
    }
}


void init_aux_parameters()
{
	find_inifile();

	length	= words.size();
	if ( !length ) error("unable to access words list -- file res_word.txt");

	maximum	= 2;

	max_length = find_max_length();
	if ( !max_length ) error("some string in words list is duplicated -- exit now");
	store_parameter(sec_common, "max_length", max_length);
	rounded_max_length = (max_length + 3) / 4;

	func_code code = static_cast<func_code> (
		load_parameter(sec_common, "uniquing_func", code_none) );
	unique_func func;

	if ( !code ) {
		warning("parameter \'uniquing_func\' is missing -- regenerating");
		code = detect_uniquing_func();
		store_parameter(sec_common, "uniquing_func", code);
		func = decode_func(code);
	}
	else {
		func = decode_func(code);
		if ( !test_function(func) ) {
			warning("erroneous uniquing function -- regenerating");
			code = detect_uniquing_func();
			store_parameter(sec_common, "uniquing_func", code);
		}
	}
}


int main()
{
	try {
		init_aux_parameters();
		load_main_parameters();
		find_solutions();
		store_main_parameters();
	}
	catch (const char *err) {
		cout << "\n";
		cout << "error: " << err << "\n";
		cout << endl;
	};

	return 0;
}

