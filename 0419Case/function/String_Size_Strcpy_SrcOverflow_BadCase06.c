

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// 返回值被污染
char* GetInfoByAddr(char* addr)
{
#ifdef __COVERITY__
    return __coverity_string_size_return__();
#endif
	return addr;
}


/*
* @Scene: strcpy源缓冲区来自外部输入，长度不确定，可能存在buffer overflow
* @SubScene: 源缓冲区来自不可信数据
*/
void TestCaseBad06(char *addr)
{
    char tempDst[10] = {0x00};
	char *src = GetInfoByAddr(addr);
	
    /* POTENTIAL FLAW: message长度不定 */
    strcpy(tempDst, src);  
}

