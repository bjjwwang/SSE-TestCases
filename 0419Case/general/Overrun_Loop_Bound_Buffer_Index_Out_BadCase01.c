
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>



/*
* @Scene: 由malloc申请内存，然后通过索引访问内存
* @SubScene: 索引由循环计算，计算不正确，超过了上边界
*/
void TestCaseBad01(int n) 
{
    if (n < 1) {
        return;
    }

    char *p = malloc(n);  
    if (p == NULL) {
        return;
    }

    int i = 0; 
    for (; i < n; i++) {
        p[i] = 1;
    }

    /* POTENTIAL FLAW: overrun */
    p[i] = 1;
    
    free(p);
}


