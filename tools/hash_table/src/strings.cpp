
#include "stdafx.h"


strings::strings(const string &filename)
{
	FILE *file = fopen(filename.c_str(), "r");
	if ( !file ) return;

	char buf[1024];
	while ( fgets(buf, 1024, file) ) {
		if (buf[0] == '\0' || buf[0] == '\n') continue;
		char *ptr = buf + strlen(buf) - 1;
		if (*ptr == '\n') *ptr = '\0';
		push_back(buf);
	}

	fclose(file);
}

void strings::fucking_sort()
{
	sort( begin(), end() );
}

void strings::fucking_append(const strings &another)
{
	copy( another.begin(), another.end(), back_inserter(*this) );
}

void strings::fucking_dump(ostream &stream, string delim)
{
	copy( begin(), end(), ostream_iterator<string>(stream, delim.c_str() ) );
}

bool strings::fucking_search(const string &key, iterator &i)
{
	iterator place = lower_bound(begin(), end(), key);
	if (place == end() || *place != key) return false;

	i = place;
	return true;
}

