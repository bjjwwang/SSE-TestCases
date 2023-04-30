

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"



typedef unsigned char UCHAR;
typedef unsigned long ULONG;
typedef unsigned short USHORT;
typedef void VOID;

typedef char VOS_CHAR;
typedef char CHAR;
typedef void VOS_VOID;
typedef long VOS_INT32;


extern VOS_VOID *VosMemChr(const VOS_VOID *pvBuf, VOS_CHAR scChar, VOS_INT32 siSize);

/*
 * @Scene： 由内置宏展开的字符串，长度基本固定，填写0x100会越界
 */
const VOS_CHAR * MyGetFileName(const VOS_CHAR * strDest)
{
    /* POTENTIAL FLAW: 由内置宏展开的字符串，长度基本固定，填写0x100会越界 */
    VOS_CHAR *pcTemp = VosMemChr(strDest, '\0', 0x100);
}


void MyLogTimeMonitor(const CHAR *pucFileName)
{
    MyGetFileName(pucFileName);
}


void MyStartTimeMonitor(const CHAR *pucFileName)
{
    MyLogTimeMonitor(pucFileName);
}

#define MY_START_TIME_MONITOR(a)  MyStartTimeMonitor(__FUNCTION__)

int main(int argc, char *argv[])
{
    MY_START_TIME_MONITOR(1);
    return 0;
}
