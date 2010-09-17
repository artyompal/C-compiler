
#include "stdafx.h"


strings::strings(string filename)
{
	ifstream file( filename.c_str() );
	copy( istream_iterator<string>(file), istream_iterator<string>(), 
		back_inserter(*this) );
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

