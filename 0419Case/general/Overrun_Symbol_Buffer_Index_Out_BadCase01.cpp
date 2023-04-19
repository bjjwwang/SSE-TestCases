
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

/*
* @Scene: 由new申请内存，然后通过索引访问内存
* @SubScene: 索引是经过判断的，但判断可能不正确，可能超过了上边界
*/
void TestCaseBad01(int n, int i) 
{
    int *x = new int[n];
    if (i <= n) {
        /* POTENTIAL FLAW: OVERRUN when i == n   */
        x[i] = 1;
    }
    delete[] x;
}
