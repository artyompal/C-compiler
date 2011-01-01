

int test_case()
{
    int a = 3;

    switch (a) {
    case 1:
    case 2:
        return -1;
    case 3:
        return 0;
    default:
        return 1;
    }
}

int test_case2()
{
    int a = 3;

    switch (a) {
    case 0:
        return -1;
    case 1:
    case 2:
    case 3:
        return 0;
    default:
        return 1;
    }
}

int test_default()
{
    int a = 100;

    switch (a) {
    case 1:
    case 2:
        return -1;
    default:
    case 3:
        return 0;
    case 4:
        return 1;
    }
}

int test()
{
    if (test_case() != 0)
        return 1;

    if (test_case2() != 0)
        return 1;

    if (test_default() != 0)
        return 1;

    return 0;
}

