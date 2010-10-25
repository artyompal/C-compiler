

const char *test_name = "simple_test.c";

extern int test()
{
    int a = 2;
    int b = 2;
    int res = a * b;

    if (res == 4)
        return 0;
    else
        return 1;
}

