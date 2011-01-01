
float test2(float x)
{
	float t;

	t = x;
	t += 2;
	x = t;

	return x;
}

int test()
{
	return (test2(1) == 3 ? 0 : 1);
}
