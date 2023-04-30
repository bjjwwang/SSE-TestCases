

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"
char g_overflow_st[8];
extern void copy_from_user(char *, const char *, size_t);
/*
* @Scene: 内核代码使用专有拷贝函数读写用户态数据时，未检查长度参数或检查不正确
* @SubScene: 用户态数据未校验直接作为copy_from_user函数的长度参数
*/
ssize_t  cwe120_c_225(char * file, const char* buffer, size_t buflen, loff_t * fpos)
{
    /* POTENTIAL FLAW:没有校验buflen是否超过g_overflow_st的大小 */
    copy_from_user((void *)&g_overflow_st[0], buffer, buflen);
    return buflen;
}
int main(int argc, char **argv)
{
    const char* buffer;
    size_t buflen;
    loff_t * fposl;
    cwe120_c_225(NULL, buffer, buflen, fposl);
    return 0;
}

