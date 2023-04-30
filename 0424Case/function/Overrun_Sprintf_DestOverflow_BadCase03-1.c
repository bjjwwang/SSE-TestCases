
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"


#define C_SPRINTF   sprintf
/*
 * @Scene：sprintf未校验源缓冲区长度，造成缓冲区溢出（sprintf来自宏封装）
 * @SubScene: 源长度大于目的长度
 */
void TestBadCase02()
{
    char dest1[8] = {0};
    char printStr[] = "Hello world, good morning!";
    /* POTENTIAL FLAW:未控制dest的 长度 */
    C_SPRINTF(dest1, "%s", printStr);
}

extern char dest[8];
/*
 * @Scene：sprintf未校验源缓冲区长度，造成缓冲区溢出（extern进来的全局数组）
 * @SubScene: 源长度大于目的长度
 */
void TestBadCase01()
{
    char printStr[] = "Hello world, good morning!";
    /* POTENTIAL FLAW:未控制dest的 长度 */
    sprintf(dest, "%s", printStr);
}
int main(void)
{
    TestBadCase01();
    TestBadCase02();
    return 0;
}

