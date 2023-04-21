
#include <stdio.h>
#include <string.h>

/*
* @Scene: 数组缓冲区溢出，下标为负数
* @SubScene: 下标为常量
*/
void TestBadCase04()
{
    int buffer[10] = {0};
    /* POTENTIAL FLAW: 数组下标为负数常数 */    
    buffer[-1] = 0;
}

int main() {
    TestBadCase04();
}

