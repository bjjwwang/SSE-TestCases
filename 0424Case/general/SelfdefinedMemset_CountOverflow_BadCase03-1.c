

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"

/*
* @Scene: 使用安全函数内存初始化时，destMax参数超过目的缓冲区实际大小
* @SubScene: 使用产品自定义实现的内存初始化安全函数时, destMax长度参数超过目的缓冲区实际大小
*/
void *(cwe120_c_53)(void *s, int c, int * n)
{
    const unsigned char uc = c;
    unsigned char *su;
    /* POTENTIAL FLAW:长度参数计算错误 */
    for (su = (unsigned char *)s; 0 < n; ++su, --n) {
        *su = uc;        
    }

    return s;
}
int main(int argc, char *argv[])
{
    if (argc < 2) {
        return 0;
    }
    
    unsigned char dest[5];
    int * n = (int *)argv[1];
    scanf("%d", n);
    cwe120_c_53(dest, 0, n);
    return 0;
}

