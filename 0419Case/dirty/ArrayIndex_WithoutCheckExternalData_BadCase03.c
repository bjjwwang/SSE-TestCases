
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


/*
* @Scene: 外部数据未经校验进行固定大小偏移或数组下标访问
* @SubScene: 通过指针偏移访问 error
*/
void test_bad_03(unsigned char *p, int len)
{
    int i;
    for (i = 0; i < len; i++) {
        /* POTENTIAL FLAW: Access buffer may be out of bounds */
        *(p + i) = i;      // 通过指针偏移访问 error
    }
}


int main()
{
    return 0;
}
