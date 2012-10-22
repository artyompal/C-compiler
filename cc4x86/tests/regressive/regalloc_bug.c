

static int f(int a, int b) { return a + b; }
static int g(int a, int b) { return a - b; }

int test()
{
    int a = 2;
    int b = 3;
    int res;

    if (a > b)
        res = f(a, b);
    else
        res = g(a, b);

    return res + 1;
}

