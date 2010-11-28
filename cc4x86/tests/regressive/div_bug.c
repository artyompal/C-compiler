

extern int test()
{
    int a = 4, b = 2;
    int c = 1, *ptr;
    int x;

    ptr = &c;
    x = a / b + *ptr;

    return x - 3;
}

