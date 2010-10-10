

const char *test_name = "goto.c";

extern int test()
{
    int a = 0;
    
    goto l3;
l1:
    goto l2;
l2:
    return (a != 1);
l3:
    a++;
    goto l1;
}

