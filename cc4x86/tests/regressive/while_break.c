

const char *test_name = "while_break.c";

extern int test()
{
    int i, j, k;

    i = 0;
    while (i < 10) {
        if (i == 5) break;
        i++;
   	}

    if (i != 5) return 1;

    j = 0, k = 0;
    do {
        if (j == 50) {
            j+= 50;
            continue;
        }
        j++, k++;
    } while (j < 100);

    if (k != 50) return 1;

    return 0;
}
