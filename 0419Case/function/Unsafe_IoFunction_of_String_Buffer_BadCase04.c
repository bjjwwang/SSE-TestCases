
 
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>

#define C_SSCANF sscanf
// @Scene：使用宏封装sscanf函数对字符串缓冲区访问
void Unsafe_IoFunction_of_String_Buffer_case01_Bad_05()
{
    char buffer[10] = {0};
    /* POTENTIAL FLAW: 禁止使用字符串缓冲区的函数：sscanf() */
    C_SSCANF("123","%s",buffer);
}

// @Scene：使用sscanf()函数对字符串缓冲区访问
void Unsafe_IoFunction_of_String_Buffer_case01_Bad_04()
{
	char buffer[10] = {0};
    /* POTENTIAL FLAW: 禁止使用字符串缓冲区的函数：sscanf() */
    sscanf("123","%s",buffer);
}


