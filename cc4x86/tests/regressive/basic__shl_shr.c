

int test()
{
    int x = -16;
    unsigned y = -16;

    if (x >> 4 != -1)
        return 1;

    if (y >> 4 != 0x0fffffff)
        return 2;

    x = 0x40000000, y = 0x40000000;

    if (x << 1 >= 0)
        return 3;

    if (y << 1 != 0x80000000)
        return 4;

    x = 1, y = 1;

    if (x << (y + 3) != 16) {
        return 5;
    }

    x <<= (y + 5);

    if (x != 64) {
        return 6;
    }

    return 0;
}

