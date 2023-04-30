
 
#include <stdio.h> 
#include <stdlib.h>


// @Scene：使用fscanf()函数对数据流缓冲区访问
void Unsafe_IoFunction_of_Stream_Buffer_case01_Bad_03()
{
	FILE *fp;
	char buffer[10] = {0};
	fp = fopen("file.txt","w+");
    /* POTENTIAL FLAW: 禁止使用stdin流输入函数：fscanf() */
    fscanf(fp,"%s",buffer);
}
int main() {
    Unsafe_IoFunction_of_Stream_Buffer_case01_Bad_03();
}

