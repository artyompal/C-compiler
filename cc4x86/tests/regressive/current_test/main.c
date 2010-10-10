
#include <stdio.h>

extern const char *test_name;
extern int test();

int main()
{
    int res;
    
    printf("performing regressive test '%s'... ", test_name);
    res = test();
    printf("%s\n", res == 0 ? "SUCCEEDED" : "FAILED");
    return 0;
}
