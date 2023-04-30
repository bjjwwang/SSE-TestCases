
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>


struct SS {
    int a;
    int b;
}s1;
          
/*
* @Scene: 由malloc申请内存，然后通过索引访问内存
* @SubScene: 循环内访问内存，超过上边界（结果体）
*/
void TestCaseBad03(int n, int i) 
{
    struct SS  *p = malloc(n * sizeof(struct SS));
    if (i <= n) {   //  "i" can be equal to n
        struct SS obj;
        obj.a = 0;
        obj.b = 0;
        /* overrun of buffer p  */
        p[i] = obj;  
    } 
}

int main() {
    TestCaseBad03(2,2);
}

