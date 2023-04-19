#include <stdio.h>
#include <string.h>

/*
* @Scene: memcpy缓冲区长度使用错误，将目的缓冲区的长度填写到了源缓冲区上
*/
void TestCaseBad01()
{
    char dest[10] = {0};
    char *src = "hello world!";
    /* POTENTIAL FLAW: src > dest */
    memcpy(dest, src, sizeof(src));
}


int main()
{
    return 0;
}
