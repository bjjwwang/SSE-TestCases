
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include "securec.h"

/*
* @Scene: 使用危险函数格式化输出时，长度参数和格式化后的字符串长度均超过目的缓冲区实际大小
* @SubScene: 使用vsprintf系列危险函数，长度参数超过目的缓冲区实际大小，且格式化后的字符串长度超过目的缓冲区大小
*/
int cwe120_c_30(char *buf, const char *fmt)
{
    va_list args;
    int n;

    /* POTENTIAL FLAW:fmt 缓冲区溢出 */
    n = vsprintf(buf, fmt, args);
    va_end(args);
    return n;
}
int main(int argc, char *argv[])
{
    if (argc < 2) {
        return 0;
    }    
    char * buf = argv[1];
    const char *fmt;
    cwe120_c_30(buf, fmt);
    return 0;
}

