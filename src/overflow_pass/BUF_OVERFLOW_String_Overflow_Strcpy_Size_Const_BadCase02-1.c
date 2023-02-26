/*
 * Copyright (c)  2021-2021. All rights reserved.
 *
 * @description STRING_OVERFLOW 可查找字符串处理函数（例如
 * strcpy）可能越过已分配数组界限写入的情况。它根据字符串处理函数的调用位置上所涉及数组的大小确定此类情况。如果发现源字符串大于目标字符串的缓冲区复制函数，该检查器会报告缺陷。它会针对所有其它可能的字符串溢出发出告警。
 *
 * @cwe 119
 *
 * @secureCoding
 *
 * @tool
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

/*
 * @Scene: 目的字符串的缓冲长度为已知，但源冲区长度未知
 */
void TestCaseBad02(char *source_buffer)
{
    char destination_buffer[10] = {0};

    memset(destination_buffer, '1', 9);
    destination_buffer[9] = 0;

    /* POTENTIAL FLAW: 源缓冲区长度可能大于目的缓冲区的长度  */
    strcpy(destination_buffer, source_buffer);
}

int main(int argc, char *argv[])
{
    if (argc < 2) {
        return 0;
    }

    char source_buffer[20] = {0};
    TestCaseBad02(source_buffer);
    return 0;
}
