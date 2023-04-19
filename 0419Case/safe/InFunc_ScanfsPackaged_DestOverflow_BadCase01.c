

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include "securec.h"

int SRC_sscanf_s(char *buf, char *format, ...)
{
    int ret = 0;
    va_list arglist;
    va_start(arglist, format);
    ret = vsscanf_s(buf, format, arglist);
    va_end(arglist);
    return ret;
}
/*
* @Scene: 使用安全函数格式化输入时，变参中的缓冲区长度参数超过目的缓冲区实际大小
* @SubScene: 使用函数封装的vsscanf_s时, %s、%c、%[格式对应的长度参数超过目的缓冲区实际大小
*/
void cwe120_c_197(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    SRC_sscanf_s(msg, "%s", buf, len);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    SRC_sscanf_s(msg, "%3c", buf, len);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    SRC_sscanf_s(msg, "%[a-z]", buf, len);
}
int main(int argc, char **argv)
{
    char buf[16];
    if (argc > 1) {
        cwe120_c_197(buf, sizeof(buf), argv[1]);
    }
    return 0;
}

