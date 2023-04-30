
 
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>

// @Scene：使用strcat()函数对字符串缓冲区访问
void Unsafe_IoFunction_of_String_Buffer_case01_Bad_01(char* userinput)
{
	char cmd[20] = "/usr/bin/cat";
    /* POTENTIAL FLAW: 禁止使用字符串缓冲区的函数：strcat() */
	strcat(cmd, userinput); 
}

int main() {
    char userinput[10] = "hello";
    Unsafe_IoFunction_of_String_Buffer_case01_Bad_01(userinput);
}

