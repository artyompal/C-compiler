

int test()
{
    union {
        int a;
        int b;
    } u;

    u.a = 2;
    u.b = 1;
    u.a--;

    return u.a;
}
