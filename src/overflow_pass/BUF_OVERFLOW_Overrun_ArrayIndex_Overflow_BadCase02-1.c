/*
 * Copyright (c)  2021-2021. All rights reserved.
 *
 * @description
 * 可查找越界访问缓冲区的很多情况。不当的缓冲区访问可能损坏内存，导致进程崩溃、安全漏洞和其他严重的系统问题。OVERRUN
 * 可查找到堆缓冲区和栈缓冲区的越界索引。
 *
 * @cwe 119
 *
 * @secureCoding
 *
 * @tool
 *
 *
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "stdbool.h"
extern void bug_assert(bool);
#define ALLOCA alloca
/*
 * @Scene: malloc缓冲区上溢出，长度来自用户输入，经过校验
 * @SubScene: 差一越界
 */
void main()
{
    int n;
    int ret = scanf("%d", &n);
    char *p = (char *)ALLOCA(n);
    int y = n;
    if (p == NULL) {
        return;
    }
    /* POTENTIAL FLAW: 数组下标越界 */
    p[y] = 'a';
    free(p);
}
