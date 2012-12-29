

int test()
{
	char a = -128, b = -128;
	short c, d;
	unsigned char e, f;
	unsigned short g, h;


	if (a + b != 0)
		return 1;

	a = 'a', b = 'b';

	if (a + b > 0)
		return 2;


	c = 1 << 15;
	d = 1 << 15;
	if (c + d != 0)
		return 3;

	c = 20000, d = 20000;
	if (c + d > 0)
		return 4;


	e = 128, f = 128;
	if (e + f > 0)
		return 5;


	g = 40000, h = 50000;
	if (g+h > 30000 || g+h <0)
		return 6;

	return 0;
}

