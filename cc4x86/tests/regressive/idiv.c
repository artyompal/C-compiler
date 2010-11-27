
const char *test_name = "idiv.c";

extern int test()
{
    int a = 2, b = 3, c = 4, d = 5;
    int res;

    res = ((a/b) * (a/b)) + ((c/d) * (c/d));
//    res = (a+b) * ((a+b) * (a+b)) * ((a+b) * (a+b)) * (a+b) * (a+b) * (d * d) * d * d * d * d * (a * b + c);

    return res - 156250;
}
