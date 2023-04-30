
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


/*
* @Scene: 指针偏移数值外部可控，未校验或校验不足导致缓冲区溢出
* @SubScene: 缓冲区指针为外部报文，for循环中有一个判断条件，校验不足导致缓冲区溢出
*/
void test_bad_04()
{
    char * ptr;
    char arr[6] = {'1', '2', '3', '4', '5'};
    ptr = arr;
    for (; ptr != NULL; ptr++) {
        if (*ptr++ == 5) {
            /* POTENTIAL FLAW: THIS WILL SKIP PAST NULL-TERMINATOR */
            ptr++;
        }
    }
}


int main()
{
    Øtest_bad_04();
    return 0;
}
