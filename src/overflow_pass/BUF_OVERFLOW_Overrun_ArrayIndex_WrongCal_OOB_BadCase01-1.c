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


#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "stdbool.h"
extern void bug_assert(bool);

/*
 * @Scene: 数组下标未检查，可能造成缓冲区溢出
 * @SubScene: dest缓冲区下标使用有误
 */
int main(int argc, char **argv)
{
    int size;
    int index;
    char dest[2] = {0};
    char tmp[4] = "012";

    size = sizeof(tmp); //size: 32
    index = size - 1; //index:31
    // index 超出dest有效范围
    /* POTENTIAL FLAW:index 超出dest有效范围 */
    dest[index] = tmp[index];  //dest[31>16]

    return 0;
}
