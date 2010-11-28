

extern int test()
{
    int a = 2, b = 3, c = 4, d = 5;
    int res;

    res = ((b/a) * (b/a)) + ((d/c) * (d/c));
    if (res != 2) return 1;

    c /= a;
    if (c != 2) return 2;

    d %= b;
    if (d != 2) return 3;

    return 0;
}

