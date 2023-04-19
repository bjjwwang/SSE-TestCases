

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"

/*
* @Scene: 循环体中内存操作，循环条件与外部数据相关，且循环退出条件未做约束或约束不正确。
* @SubScene: 循环中，逐个字符按外部报文提供的长度拷贝导致的缓冲区溢出
*/
void * cwe120_c_85(void *dest, const void *src, size_t count)
{

	char *tmp = (char *)dest, *s = (char *)src;
	while (count--)
		/* POTENTIAL FLAW:循环上线来自外部，缓冲区长度未知，可能造成缓冲区溢出 */
		*tmp++ = *s++;
	return dest;
}
int main(int argc,char *argv[])
{
	void * dest;
	const void *src;
	size_t count;
	cwe120_c_85(dest, src, count);
	return 0;
}

