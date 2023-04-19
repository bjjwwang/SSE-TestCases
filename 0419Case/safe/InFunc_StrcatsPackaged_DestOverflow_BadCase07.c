
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"


extern int VOS_strncat_s(void *dest, size_t destMax, void *src);
/*
* @Scene: 使用安全函数字符串拼接时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用函数封装的strncat_s接口时, destMax长度参数超过目的缓冲区实际大小
*/
void cwe120_c_179(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    size_t count = (len > 0 ? len - 1 : 0);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    VOS_strncat_s(buf, len, msg);
}
int main(int argc, char **argv)
{
    char buf[16];
    if (argc > 1) {
        cwe120_c_179(buf, sizeof(buf), argv[1]);
    }
    return 0;
}

