


#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"

int SRC_memset_sp(void *dest, size_t destMax, int c, size_t count)
{
    return memset_sp(dest, destMax, c, count);
}
/*
* @Scene: 使用安全函数内存初始化时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用函数封装的memset_sp接口时, destMax长度参数超过目的缓冲区实际大小
*/
void cwe120_c_141(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    SRC_memset_sp(buf, len, 0, len);
}

extern int  XXX_memset_sp(void *dest, size_t destMax, void *src, size_t count);
/*
* @Scene: 使用安全函数内存初始化时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用函数封装的memset_sp接口时, destMax长度参数超过目的缓冲区实际大小
*/
void cwe120_c_143(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    XXX_memset_sp(buf, len, msg, len);
}
int main(int argc, char **argv)
{
    char buf[16];
    if (argc > 1) {
        cwe120_c_143(buf, sizeof(buf), argv[1]);
        cwe120_c_141(buf, sizeof(buf), argv[1]);
    }
    return 0;
}

