
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


void test_bad_1()
{
    char path[5] = "";
    char *src = "test.txt";
    /* POTENTIAL FLAW: 目标缓冲区大小不足 */
    realpath(src, path);
}

int main()
{
    test_bad_1();
    return 0;
}
