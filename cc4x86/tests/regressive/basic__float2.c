

static float test1(float x)
{
	float t;

	t = x;
	t += 2;
	x = t;

	return x;
}

static float test2(float x)
{
	return x+2;
}

int test()
{
	if (test1(1) != 3) return 1;
	if (test2(2) != 4) return 2;
	return 0;
}
