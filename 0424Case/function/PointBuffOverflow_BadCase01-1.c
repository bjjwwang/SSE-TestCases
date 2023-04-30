
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"

/*
* @Scene: 指针偏移越界
* @SubScene: 缓冲区长度为变量
*/
void cwe823_c_02()
{
    char szLineText[32] = { 0 };
    char *pszLineText = szLineText;
    int iRetCh;
    FILE *fp = fopen("file", "r");
    while (!feof(fp) && ('\n' != iRetCh)) {
        /* POTENTIAL FLAW: pointer buffer overflow */
        *pszLineText = (char)iRetCh;
        iRetCh = fgetc(fp);
        pszLineText++;  
    }
    fclose(fp);
}
int main(void)
{
    cwe823_c_02();
    return 0;
}

