

const char *test_name = "for.c";

extern int test()
{
    int i, j, k;

    for (i = 0; i < 8; ) {
        if (i == 4) break;
        i++;
    }

    return (i != 4);
}
