


#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"


extern int  XXX_memcpy_sp(void *dest, size_t destMax, void *src, size_t count);
/*
* @Scene: 使用安全函数内存复制时，destMax参数超过目的缓冲区实际大小或count参数超过源缓冲区实际大小
* @SubScene: 使用函数封装的memcpy_sp接口时, destMax长度参数超过目的缓冲区实际大小
*/
void cwe120_c_118(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    XXX_memcpy_sp(buf, len, msg, len);
}
int main(int argc, char **argv)
{
    char buf[16];
    if (argc > 1) {
        cwe120_c_118(buf, sizeof(buf), argv[1]);
    }
    return 0;
}

