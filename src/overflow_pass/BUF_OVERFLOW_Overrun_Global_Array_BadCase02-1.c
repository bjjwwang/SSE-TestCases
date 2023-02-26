/*
 * Copyright (c)  2021-2021. All rights reserved.
 *
 * @description
 * 可查找越界访问缓冲区的很多情况。不当的缓冲区访问可能损坏内存，导致进程崩溃、安全漏洞和其他严重的系统问题。OVERRUN
 * 可查找到堆缓冲区和栈缓冲区的越界索引。
 *
 * @good
 *
 * @bad OverrunGlobalArrayBadCase02;
 *
 * @tool
 *
 * @CWE 119;
 *
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "stdbool.h"

typedef struct Flts {
    unsigned char uc1;
    unsigned char uc2;
    unsigned short us;
    unsigned char arr[100];
} Flts;

enum {
    INDEX_A = 100,
    INDEX_END
};

Flts g_data[INDEX_A] = {0};

void Init(Flts *p)
{
    p[INDEX_END].uc1 = 0;
}
/*
 * @scene：全局变量是静态数组类型，数组访问越界
 * @subscene：跨函数越界
 */
int main()
{
    /* POTENTIAL FLAW: 数组访问越界 */
    Init(g_data);
}
