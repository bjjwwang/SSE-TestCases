/*
 * Copyright (c)  2021-2021. All rights reserved.
 *
 * @description BUFFER_SIZE
 * 可查找由于将不正确的长度参数传递给缓冲区处理函数而可能发生缓冲区溢出的很多情况。如果将此类不正确的参数传递给
 * strncpy() 或 memcpy() 等函数，可能导致内存损坏、安全缺陷以及程序崩溃。
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
#include <errno.h>
#include <string.h>
#include "stdbool.h"
extern void bug_assert(bool);

struct MY_SS1 {
    char name1[9];
    char name2[11];
};


struct MY_SS2{
    char name1[11];
    char name2[9];
};
/*
 * @Scene: memcpy结构体内缓冲区溢出
 * @SubScene: 使用memcpy/memmove函数，长度参数超过目的缓冲区实际大小或源缓冲区实际大小
 */
int main()
{
    struct MY_SS1 ss1;
    struct MY_SS2 ss2;
    memcpy(ss1.name2, ss2.name2, 11);
}
