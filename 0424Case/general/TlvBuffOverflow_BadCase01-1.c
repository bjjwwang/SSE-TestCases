

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"

typedef struct _s {
	int ucIdLength;
	char data[0];
}Req;

/*
* @Scene: 结构体域值访问越界
* @SubScene: 指针偏移未超过缓冲区长度，偏移后结构体域值访问越界
*/
void cwe823_c_01(Req *pstReq)
{
	char *pucData = (char *)pstReq;
	unsigned int ulLen = 0;
	ulLen = pstReq->ucIdLength;
	/* POTENTIAL FLAW: 结构体来自外部，成员长度未校验作为偏移长度，偏移后未校验是否还在结构体域内*/
	pucData = pucData + ulLen; 
}
int main(int argc, char **argv)
{
	Req *pstReq;
	cwe823_c_01(pstReq);
	return 0;
}

