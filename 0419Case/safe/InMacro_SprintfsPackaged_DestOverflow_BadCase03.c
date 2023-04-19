

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"

extern int VOS_snprintf_s(char *buf, size_t destMax, size_t count, char *format, ...);
/*
* @Scene: 使用安全函数格式化输出时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用函数封装的snprintf_s时,destMax参数超过目的缓冲区实际大小
*/
void cwe120_c_221(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    size_t count = (len > 0 ? len - 1 : 0);
    /* POTENTIAL FLAW:len的长度可能大于buf的长度 */
    VOS_snprintf_s(buf, len, count, "%s", msg);
}

/*
* @Scene: 使用安全函数格式化输出时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用安全函数snprintf_s时,destMax参数超过目的缓冲区实际大小
*/
void cwe120_c_211(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    size_t count = (len > 0 ? len - 1 : 0);
    /* POTENTIAL FLAW:destmax的长度可能大于dest的长度 */
    snprintf_s(buf, len, count, "%s", msg);
}

#define XXX_snprintf_s snprintf_s
/*
* @Scene: 使用安全函数格式化输出时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用宏封装的snprintf_s时,destMax参数超过目的缓冲区实际大小
*/
void cwe120_c_215(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    size_t count = (len > 0 ? len - 1 : 0);
    /* POTENTIAL FLAW:len的长度比buf的长度长 */
    XXX_snprintf_s(buf, len, count, "%s", msg);
}
int main(int argc, char **argv)
{
    char buf[16];
    if (argc > 1) {
        cwe120_c_211(buf, sizeof(buf), argv[1]);
        cwe120_c_215(buf, sizeof(buf), argv[1]);
        cwe120_c_221(buf, sizeof(buf), argv[1]);
    }
    return 0;
}

