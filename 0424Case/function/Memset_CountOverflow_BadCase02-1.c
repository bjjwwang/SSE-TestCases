

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"


#define MAX_LEN 128
#define DEST_LEN 128

#define ACPI_MEMSET(d, n, count)        (void) memset((d), (n), (count)) // 宏封装
#define MSG_MAX_SIZE 10
/*
* @Scene: 使用危险函数内存初始化时，长度参数超过目的缓冲区实际大小
* @SubScene: 使用宏封装或函数封装的memset接口，长度参数超过目的缓冲区实际大小
*/
int cwe120_c_50()
{
    char temp[MSG_MAX_SIZE] = { 0x00 };
    /* POTENTIAL FLAW:DestStr 剩余空间不足 */
    ACPI_MEMSET(temp, 0, MSG_MAX_SIZE);
    return 0;
}

typedef struct {
    int a;
    char b[MAX_LEN];// \0
}DEST, *PDEST;
char dest[DEST_LEN];
/*
* @Scene: 使用危险函数内存初始化时，长度参数超过目的缓冲区实际大小
* @SubScene: 使用memset函数，长度参数超过目的缓冲区实际大小
*/
void cwe120_c_49()
{
    PDEST dest;
     /* POTENTIAL FLAW:DestStr 剩余空间不足 */  
    memset(dest, 0, sizeof(PDEST));
}

int main(void)
{
    cwe120_c_49();
    cwe120_c_50();
    return 0;
}

