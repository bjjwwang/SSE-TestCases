
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include "securec.h"


extern int VOS_vsnprintf_s(char*, size_t, char *, va_list);
int SRC_vsnprintf_s(char *buf, size_t destMax, size_t count, char *format, ...)
{
    int ret = 0;
    va_list arglist;
    va_start(arglist, format);
    ret = VOS_vsnprintf_s(buf, destMax, format, arglist);
    va_end(arglist);
    return ret;
}
/*
* @Scene: 使用安全函数格式化输出时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用函数封装的vsnprintf_s时,destMax参数超过目的缓冲区实际大小
*/
void cwe120_c_219(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    size_t count = (len > 0 ? len - 1 : 0);
    /* POTENTIAL FLAW:len的长度可能大于buf的长度 */
    SRC_vsnprintf_s(buf, len, count, "%s", msg);
}

int callvsnprintf_s1(char *buf, size_t destMax, size_t count, char *format, ...)
{
    int ret = 0;
    va_list arglist;
    va_start(arglist, format);
    ret = vsnprintf_s(buf, destMax, count, format, arglist);
    va_end(arglist);
    return ret;
}
/*
* @Scene: 使用安全函数格式化输出时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用函数封装的vsnprintf_s时,destMax参数超过目的缓冲区实际大小
*/
void cwe120_c_213(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    size_t count = (len>0 ? len - 1 : 0);
    /* POTENTIAL FLAW:len的长度比buf的长度长 */
    callvsnprintf_s1(buf, len, count, "%s", msg);
}

#define XXX_vsnprintf_s vsnprintf_s
int callvsnprintf_s(char *buf, size_t destMax, size_t count, char *format, ...)
{
    int ret = 0;
    va_list arglist;
    va_start(arglist, format);
    ret = XXX_vsnprintf_s(buf, destMax, count, format, arglist);
    va_end(arglist);
    return ret;
}
/*
* @Scene: 使用安全函数格式化输出时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用宏封装的vsnprintf_s时,destMax参数超过目的缓冲区实际大小
*/
void cwe120_c_217(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    size_t count = (len > 0 ? len - 1 : 0);
    /* POTENTIAL FLAW:len的长度可能大于buf的长度 */
    callvsnprintf_s(buf, len, count, "%s", msg);
}
int main(int argc, char **argv)
{
    char buf[16];
    if (argc > 1) {
        cwe120_c_217(buf, sizeof(buf), argv[1]);
        cwe120_c_213(buf, sizeof(buf), argv[1]);
        cwe120_c_219(buf, sizeof(buf), argv[1]);
    }
    return 0;
}

