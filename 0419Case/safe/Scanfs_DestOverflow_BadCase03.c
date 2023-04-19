

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"

extern int VOS_fscanf_s(FILE* stream, const char* format, ...);
#define XXX_fscanf_s fscanf_s
/*
* @Scene: 使用安全函数格式化输入时，变参中的缓冲区长度参数超过目的缓冲区实际大小
* @SubScene: 使用宏封装的fscanf_s时,格式串类型大小超出实际变参类型大小
*/
void cwe120_c_196(char *buf, size_t bufSize, char *msg)
{
    char c;
    /* POTENTIAL FLAW:%d格式写入4字节数据，超出char类型的大小，char对应的格式为%hhd */
    XXX_fscanf_s(stdin, "%d", &c);
}
/*
* @Scene: 使用安全函数格式化输入时，变参中的缓冲区长度参数超过目的缓冲区实际大小
* @SubScene: 使用函数封装的fscanf_s时, %s、%c、%[格式对应的长度参数超过目的缓冲区实际大小
*/
void cwe120_c_202(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    VOS_fscanf_s(stdin, "%s", buf, len);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    VOS_fscanf_s(stdin, "%3c", buf, len);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    VOS_fscanf_s(stdin, "%[a-z]", buf, len);
}

/*
* @Scene: 使用安全函数格式化输入时，变参中的缓冲区长度参数超过目的缓冲区实际大小
* @SubScene: 使用安全函数fscanf_s时, %s、%c、%[格式对应的长度参数超过目的缓冲区实际大小
*/
void cwe120_c_187(char *buf, size_t bufSize, char *msg)
{
    size_t len = strlen(msg);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    fscanf_s(stdin, "%s", buf, len);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    fscanf_s(stdin, "%3c", buf, len);
    /* POTENTIAL FLAW:len的值可能大于buf的大小 */
    fscanf_s(stdin, "%[a-z]", buf, len);
}
int main(int argc, char **argv)
{
    char buf[16];
    if (argc > 1) {
        cwe120_c_187(buf, sizeof(buf), argv[1]);
		cwe120_c_196(buf, sizeof(buf), argv[1]);
		cwe120_c_202(buf, sizeof(buf), argv[1]);
    }
    return 0;
}

