

int test()
{
    float f = 1.0f;
    int i = *(int*)&f;

    return i - 0x3f800000;
}
