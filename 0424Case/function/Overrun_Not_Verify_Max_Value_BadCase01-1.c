
 

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>

/*
* @Scene: 由数组分配内存，索引未正确校验
* @SubScene: 只对返回值和-1进行了比较，没有返回值小于bufsize长度
*/
void TestCaseBad01() 
{
    char filePath[128] = {0};
    int r = readlink("some_file_path", filePath, sizeof(filePath));
    if (r == -1) {
        printf("read_link error\n");
        return;
    }
    /* POTENTIAL FLAW: 没有检查readlink的返回值是否等于-1和返回值小于 bufsize长度 */
    filePath[r] = '\0';
    
}

int main() {
    TestCaseBad01();
}