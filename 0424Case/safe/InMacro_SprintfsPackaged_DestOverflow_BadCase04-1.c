

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include "securec.h"

extern int VOS_vsprintf_s(char *buf, size_t destMax, char *format, va_list arglist);
int callvsprintf_s2(char *buf, size_t destMax, char *format, ...)
{
    int ret = 0;
    va_list arglist;
    va_start(arglist, format);
    ret = VOS_vsprintf_s(buf, destMax, format, arglist);
    va_end(arglist);
    return ret;
}
/*
* @Scene: 使用安全函数格式化输出时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用函数封装的vsprintf_s时,destMax参数超过目的缓冲区实际大小
*/
void cwe120_c_222(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    /* POTENTIAL FLAW:len的长度可能大于buf的长度 */
    callvsprintf_s2(buf, len, "%s", msg);
}

int callvsprintf_s1(char *buf, size_t destMax, char *format, ...)
{
    int ret = 0;
    va_list arglist;
    va_start(arglist, format);
    ret = vsprintf_s(buf, destMax, format, arglist);
    va_end(arglist);
    return ret;
}

/*
* @Scene: 使用安全函数格式化输出时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用安全函数vsprintf_s时,destMax参数超过目的缓冲区实际大小
*/
void cwe120_c_212(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    /* POTENTIAL FLAW:destmax的长度可能大于dest的长度 */
    callvsprintf_s1(buf, len, "%s", msg);
}

#define XXX_vsprintf_s vsprintf_s
/*
* @Scene: 使用安全函数格式化输出时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用宏封装的vsprintf_s时,destMax参数超过目的缓冲区实际大小
*/
int callvsprintf_s(char *buf, size_t destMax, char *format, ...)
{
    int ret = 0;
    va_list arglist;
    va_start(arglist, format);
    ret = XXX_vsprintf_s(buf, destMax, format, arglist);
    va_end(arglist);
    return ret;
}
void cwe120_c_216(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    /* POTENTIAL FLAW:len的长度比buf的长度长 */
    callvsprintf_s(buf, len, "%s", msg);
}
int main(int argc, char **argv)
{
    char buf[16];
    if (argc > 1) {
        cwe120_c_212(buf, sizeof(buf), argv[1]);
        cwe120_c_216(buf, sizeof(buf), argv[1]);
        cwe120_c_222(buf, sizeof(buf), argv[1]);
    }
    return 0;
}

