
#include <stdio.h>
#include <string.h>

/*
* @Scene: 数组缓冲区上溢出
* @SubScene: 长度来自参数，经过校验，但校验不正确
*/
void TestCaseBad03(int *x, int n)
{    
    /* POTENTIAL FLAW: 偏移（加上元素大小）的边界超过了缓冲区大小的上边界 */
    x[n - 1] = 1;
}

void MyFunc(int n) 
{
    int array[10] = {0};
    if (n < 100) {
        /* 偏移（加上元素大小）的边界超过了缓冲区大小的上边界 */
        TestCaseBad03(array, n);
    }
}
