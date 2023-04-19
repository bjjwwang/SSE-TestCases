
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


void test_bad_1()
{
    int num = 123456789;
    char ch[5] = "";
    /* POTENTIAL FLAW: 目标缓冲区大小不足 */
    itoa(num, ch, 10);
}


int main()
{
    test_bad_1();
    return 0;
}
