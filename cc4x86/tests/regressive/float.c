

static float fabs(float x) { return (x >= 0 ? x : -x); }
static int eq(double a, double b) { return (fabs(a-b) < 0.001f); }

int test()
{
	float x = 2.0f;
	double y = 3.0, z;

	z = x + y;
	if (!eq(z, 5.0)) return 1;

	z = x - y;
	if (!eq(z, -1.0)) return 2;

	z = x * y;
	if (!eq(z, 6.0)) return 3;

	z = x / y;
	if (!eq(z, 0.666)) return 4;


	x += 2.0f;
	if (!eq(x, 4.0)) return 5;

	x -= 1.0f;
	if (!eq(x, 3.0)) return 6;

	x *= 2.0f;
	if (!eq(x, 6.0)) return 7;

	x /= 3.0f;
	if (!eq(x, 2.0)) return 8;

	return 0;
}

