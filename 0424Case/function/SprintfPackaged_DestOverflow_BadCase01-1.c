

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"

#define ARGS "abc"
#define C_SPRINTF(buf, szie, fmt) sprintf(buf, fmt, ARGS)

/*
* @Scene: 使用危险函数格式化输出时，格式化后的字符串长度超过目的缓冲区大小
* @SubScene: 使用宏封装或函数封装的sprintf接口，格式化后的字符串长度超过目的缓冲区大小
*/
void cwe120_c_29()
{
    char dest[8];
    char printStr[] = "Hello world, good morning!";
    /* POTENTIAL FLAW:未控制dest的 长度*/
    C_SPRINTF(dest, "%s", printStr);
}
int main(void)
{
    cwe120_c_29();
    return 0;
}

