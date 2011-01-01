

int test()
{
    int i, j = 0, k;

    for (i = 0; i < 8; i++, j++) {
        if (i == 4) break;
        i++;
    }

    return (i == 4 && j == 2) ? 0 : 1;
}
