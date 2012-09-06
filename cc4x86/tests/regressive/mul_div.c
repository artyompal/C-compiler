

int test()
{
    unsigned a = 2, b = 3, c = 4, d = 5;
    unsigned res;

    res = ((b/a) * (b/a)) + ((d/c) * (d/c));
    if (res != 2) return 1;

    c /= a;
    if (c != 2) return 2;

    d %= b;
    if (d != 2) return 3;

    c = a * b;
    if (c != 6) return 4;

    d = a;
    d *= b;
    if (d != 6) return 5;

    a = 0x10000, b = 0x10000;
    if (a*b != 0) return 6;

    a = 2, b = 3, c = 4, d = 5;
    res = ((b/a) * (c/a));
    if (res != 2) return 7;

    return 0;
}

