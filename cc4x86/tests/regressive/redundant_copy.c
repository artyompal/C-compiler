
static int test1(int a, int b, int c)
{
    return (a * b - c);
}

static int test2(int a, int b, int c)
{
    int x = a;
    int y = b;

    return (x + y - c);
}

static int test3(int a, int b, int c)
{
    int x = 0;

    x = a;

    if (c > 0) {
        a = b;
    } else {
        x = c;
    }

    return (x + a + b - c);
}

static int test4(int a, int b, int c)
{
    int x = a;
    int y = b;

    x++;

    return (x + y - c);
}

static int test5(int a, int b, int c)
{
    int x = 0;

    x = a;

    if (c > 0) {
        x = b;
    } else {
        x = a;
    }

    return (x + b - c);
}


int test()
{
    if (test1(256, 512, 1<<17)) {
        return 1;
    }

    if (test2(555, 666, 1221)) {
        return 2;
    }

    if (test3(222, 111, 444)) {
        return 3;
    }

    if (test4(5,4,10)) {
        return 4;
    }

    if (test5(222, 444, 888)) {
        return 3;
    }

    return 0;
}
