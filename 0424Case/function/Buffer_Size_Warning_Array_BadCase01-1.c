

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <netdb.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>


 // 产品代码场景
/*
* @Scene: Strncpy, 当长度参数与缓冲区目标完全相同（导致没有空间用于放置 null 终止符）（数组）
* @SubScene: 源缓冲区来自参数，不确定大小
*/
void BadCase01(char *argv)
{
    char testName[10] = { 0 };

    /* POTENTIAL FLAW: 当长度参数与缓冲区目标完全相同（导致没有空间用于放置 null 终止符） */
    strncpy(testName, argv, 10);// \0
}

int main() {
    char* argv = "abcdefghij";
    BadCase01(argv);
}
