


#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"

/*
* @Scene: 使用危险函数格式化输入时，输入的字符串长度超过目的缓冲区大小
* @SubScene: 使用scanf系列危险函数，输入的字符串长度超过目的缓冲区大小
*/
void cwe120_c_20(char *p)
{
    /* POTENTIAL FLAW: 未检测p的长度 */
    scanf("%s", p); 
}
int main(int argc, char **argv)
{
    if (argc < 2) {
        return 0;
    }
    char *p = argv[1];
    cwe120_c_20(p);

    return 0;
}

