
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
* @Scene: malloc申请内存，索引通过赋值为申请的长度，然后用作下标，存在差1的缓冲区溢出
*/
void TestCaseBad01(int n) 
{
    char *p = malloc(n);   
    int y = n;
    if (p) {
        /* POTENTIAL FLAW: 超出长度上限 */
        p[y] = 'a'; 
        free(p);
    }
}

int main() {
    TestCaseBad01(10);
}