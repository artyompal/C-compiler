
#include <stdio.h>

extern const char *test_name;
extern int test();

int main()
{
    int res;
    
    printf("performing regressive test '%s'... ", test_name);
    res = test();

    if (res == 0) {
        printf("SUCCEEDED\n");
    } else {
        printf("FAILED, code=%d\n", res);
    }

    return 0;
}
