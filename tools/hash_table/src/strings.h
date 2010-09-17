
#pragma once


struct strings : public vector<string> {
public:
	strings() {}
	strings(const string &filename);

	void fucking_sort();
	void fucking_append(const strings &another);
	void fucking_dump(ostream &stream, string delim = "\n");

	bool fucking_search(const string &key, iterator &i);
};

