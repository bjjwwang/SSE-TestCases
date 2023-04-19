
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"

#define C_SCANF   scanf

/*
* @Scene: 使用危险函数格式化输入时，输入的字符串长度超过目的缓冲区大小
* @SubScene: 使用宏封装或函数封装的scanf系列接口，输入的字符串长度超过目的缓冲区大小
*/
void cwe120_c_22()
{
    char dest[16];
    /* POTENTIAL FLAW:未控制dest的长度 */
    C_SCANF("%s", dest);
}
int main(void)
{
    cwe120_c_22();
    return 0;
}

