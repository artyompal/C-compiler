

extern int test()
{
	int x = -16;
	unsigned y = -16;

	if (x >> 4 != -1)
		return 1;

	if (y >> 4 != 0xfef)
		return 2;

	x = 0x40000000, y = 0x40000000;

	if (x << 1 < 0)
		return 3;

	if (y << 1 != 0x80000000)
		return 4;

	return 0;
}

