


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

enum { ARRAY_SIZE = 32 };


/*
* @Scene: for循环将src中的数据拷贝到dst中，然而未考虑’\0’结束符写入数组的位置，经过循环后，’\0’会写越界，超出数组dst一个字节，从而造成缓冲区溢出和内存改写。
*/
void TestCaseBad01(void) 
{
    char dst[ARRAY_SIZE + 1] = {0x00};
    char src[ARRAY_SIZE + 1] = {0x00};
    size_t i;

    /* 结束符会写越界dst一个字节 */
    for (i = 0; src[i] != '\0' && (i < (ARRAY_SIZE + 1)); ++i) {
        dst[i] = src[i];
    }
    
    /* POTENTIAL FLAW: 【错误】 结束符写越界 */
    dst[i] = '\0';
}

