
#include "stdafx.h"


char inifile[MAX_PATH + 5];
const char *sec_common	= "Common data";


uint max_possible_length;
uint max_length;
uint rounded_max_length;


struct word {
	string			str;
	uint			num;

	word()
	{
	}
	word(const string &s) : str(s)
	{
	}
	bool operator ==(const word &another)
	{
		return (str == another.str);
	}
};

vector<word>			words;
uint					length;

uint					found_a;
uint					found_m;

vector<int>				xlat_table;


typedef uint (*unique_func)(uint res, uint x);

enum func_code {
	code_none,

	code_xor,
	code_add,
};

func_code code;


void find_inifile()
{
    GetModuleFileName(NULL, inifile, MAX_PATH);
    char *par = strrchr(inifile, '\\');
	strcpy(par ? par + 1 : inifile + strlen(inifile), "hashing.ini");
}

uint load_parameter(const char *section, const char *param, uint def = 0)
{
	return GetPrivateProfileInt(section, param, def, inifile);
}


void error(const char *msg)
{
	throw msg;
}

void warning(const char *msg)
{
	cout << msg << endl;
}


uint find_max_length()
{
	uint m = 0;

	for (vector<word>::iterator i = words.begin(); i != words.end(); ++i) {
		uint s = (*i).str.size();
		if (m < s) m = s;
	}

	return m;
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

	for (uint i = 0; i < length; i++) {
		for (uint j = 0; j < rounded_max_length; j++) raw[j] = 0;
		strncpy(reinterpret_cast<char *>( &raw[0] ), words[i].str.c_str(), rounded_max_length * 4);

		uint res = raw[0];
		for (uint j = 1; j < rounded_max_length; j++) res = func(res, raw[j]);
		words[i].num	= res;
	}
}


void prepare_words()
{
	strings file("res_word.txt");
	if ( file.empty() ) error("unable to access words list -- file res_word.txt");

	length = file.size();
	if (length > 127) error("this program is intended only for using on input sets not longer then 127 words");
	words.resize(length);

	for (uint i = 0; i < length; i++)
		words[i] = file[i];
}

void prepare_hash_function()
{
	strings file("results.txt");
	if ( file.empty() ) error("unable to access candidates list -- file results.txt");

	for (uint i = 0; i < file.size(); i++) {
		const char *str = file[i].c_str();
		if ( strstr(str, "ideal") ) {
			sscanf(str, "%d %d", &found_a, &found_m);
			return;
		}
	}

	error("no ideal function found");
}

void calculate_results()
{
	xlat_table.resize(found_m);
	for (uint i = 0; i < found_m; i++) xlat_table[i] = -1;

	for (uint i = 0; i < length; i++) {
	    int code = found_a * words[i].num % found_m;
	    int &res = xlat_table[code];

	    if (res != -1) {
	        error("bogus algorithm detected: values duplcated");
	    }

	    res = i;
	}
}

void store_function(ofstream &module)
{
    const int len = rounded_max_length * 4;
    
	if (rounded_max_length != 1) {
	    error("this program generates code with assumption that rounded_max_length==1");
	}

	module << "int keywords_hash_function(const char *text, int text_len)\n";
	module << "{\n";
    module << "\tunion {\n";
    module << "\t\tunsigned int int_val;\n";
    module << "\t\tchar raw[4];\n";
    module << "\t} value;\n";
    module << "\n";
    module << "\tint len = (text_len < " << len <<  " ? text_len : " << len <<  ");\n";
    module << "\tint i;\n";
    module << "\n";
    module << "\n";
    module << "\tvalue.int_val = 0;\n";
    module << "\n";
    module << "\tfor (i = 0; i < len; i++) {\n";
    module << "\t\tvalue.raw[i] = text[i];\n";
    module << "\t}\n";
    module << "\n";
    module << "\treturn hash_codes_table[" << found_a << " * value.int_val % " << found_m << "];\n";
	module << "}\n";
	module << "\n";
}

void store_tables()
{
	ofstream header("keywords_hash.h");
	header << "\n";
	header << "#pragma once\n";
	header << "\n";
	header << "\n";
	header << "int keywords_hash_function(const char *text, int text_len);\n";
	header << "\n";

	ofstream module("keywords_hash.cpp");
	module << "\n";

	module << "static char hash_codes_table[" << found_m << "] = {\n";

	for (uint i = 0; i < found_m; i++) {
		module << '\t' << xlat_table[i] << ",\n";
	}

	module << "};\n";
	module << "\n";
	module << "\n";


	store_function(module);
}


void init_aux_parameters()
{
	find_inifile();

	prepare_words();
	prepare_hash_function();

	max_possible_length = find_max_length();

	max_length = load_parameter(sec_common, "max_length", 0);
	if ( !max_length ) error("unable to access file hashing.ini");
	rounded_max_length = (max_length + 3) / 4;

	code = static_cast<func_code>( load_parameter(sec_common, "uniquing_func", code_none) );
	apply_unique_func( decode_func(code) );
}


int main()
{
	try {
		cout << endl;
		init_aux_parameters();
		calculate_results();
		store_tables();

		cout << "Hash function generated.\n\n";
	}
	catch (const char *err) {
		cout << "error: " << err << "\n";
		cout << endl;
	};

	return 0;
}

