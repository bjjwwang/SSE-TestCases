
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include "securec.h"

/*
* @Scene: 使用危险函数格式化输入时，输入的字符串长度超过目的缓冲区大小
* @SubScene: 使用vscanf系列危险函数，输入的字符串长度超过目的缓冲区大小
*/
int cwe120_c_24()
{
    int ret = 0;
    va_list args;
    char const* const fmt = "ab";
    /* POTENTIAL FLAW:未控制fmt的 长度 */
    vscanf(fmt, args);
    va_end(args);
    return ret;
}
int main(void)
{
    cwe120_c_24();
    return 0;
}

