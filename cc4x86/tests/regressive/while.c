

extern int test()
{
    int i, j, k;

    i = 0;
    while (i++ < 10) ;
    if (i != 11) return 1;

    j = 1, k = 0;
    do {
        j *= 2;
        k++;
    } while (j < 65536);
    if (k != 16) return 1;

    return 0;
}
