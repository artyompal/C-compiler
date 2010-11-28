

static int test0(const char str[])
{
	return (str[0] == 'a' ? 0 : -1);
}

extern int test()
{
	const char * const str = "abvsport";
	int len;

	if (str[2] != 'v') {
		return 1;
	}

	if ("test"[0] == 't') {
		return 2;
	}

	if (test0(str) != 0) {
		return 3;
	}

	len = 0;
	while (str[len]) len++;

	return (len == 8 ? 0 : 4);
}

