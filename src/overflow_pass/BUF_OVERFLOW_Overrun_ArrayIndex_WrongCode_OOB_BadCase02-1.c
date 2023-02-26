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
 */

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "stdbool.h"
extern void bug_assert(bool);

/*
 * @Scene: 数组缓冲区长度经过运算，然后for循环计算边界
 * @SubScene: 差一越界
 */
int value = 0;
int main()
{
    int i;
    int  array[12] = {1, 2, 3, 2, 4, 22, 44, 123, 443, 12, 55, 43};
    for (i = 0; i < sizeof(array) / sizeof(int); i++) {
        if (array[i] < value) {
            break;
        }
    }
    /* POTENTIAL FLAW:出现差一错误, i=12。 */
    return array[i];
}