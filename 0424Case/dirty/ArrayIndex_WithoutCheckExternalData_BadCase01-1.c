
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"

#define MAX 100

/*
* @Scene: 外部数据未经校验进行固定大小偏移或数组下标访问
* @SubScene: 通过数组下标访问可能越界
*/
void test_bad_01(char *p, char *q)
{
    char *src = "hello";
    char *tmp, *tmp1;
    tmp = q;  // 别名
    // tmp = q + i ; 或者 tmp = q + 10；// 指针偏移是加变量和加数值
    tmp1 = p;
    int i;
    for (i = 0; i < MAX; i++) {
        /* POTENTIAL FLAW: Access buffer may be out of bounds */
        tmp[i] = i;   // 通过数组下标访问 error
    }
    memcpy_s(tmp1, strlen(src), src, strlen(src));
}


int main()
{
    char p[100], q[99];
    test_bad_01(p,q);
    return 0;
}
