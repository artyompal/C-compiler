
static char hash_codes_table[37] = {
	18,
	5,
	4,
	12,
	21,
	2,
	3,
	9,
	19,
	24,
	8,
	20,
	6,
	-1,
	30,
	26,
	-1,
	25,
	28,
	0,
	31,
	17,
	1,
	7,
	16,
	10,
	15,
	23,
	13,
	-1,
	-1,
	29,
	11,
	27,
	22,
	-1,
	14,
};


int keywords_hash_function(const char *text, int text_len)
{
	union {
		unsigned int int_val;
		char raw[4];
	} value;

	int len = (text_len < 4 ? text_len : 4);
	int i;


	value.int_val = 0;

	for (i = 0; i < len; i++) {
		value.raw[i] = text[i];
	}

	return hash_codes_table[507988306 * value.int_val % 37];
}

