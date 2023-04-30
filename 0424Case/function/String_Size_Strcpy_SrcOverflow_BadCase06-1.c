

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/*
* @Scene: strcpy源缓冲区来自外部输入，长度不确定，可能存在buffer overflow
* @SubScene: 源缓冲区来自不可信数据
*/
void TestCaseBad06()
{
    char tempDst[10] = {0x00};
	char addr[] = "0x7f000001";
	
    /* POTENTIAL FLAW: message长度不定 */
    strcpy(tempDst, addr);
}

int main() {
    TestCaseBad06();
}