

void memset(void *ptr, char c, unsigned sz)
{
    char *dst = (char*)ptr;

    while (sz--) *dst++ = c;
}

int test()
{
    struct {
        int a, b, c;
    } s;

    s.a = 1, s.b = 2, s.c = 3;
    memset((void*)&s, 0, sizeof(s));

    return s.b;
}
