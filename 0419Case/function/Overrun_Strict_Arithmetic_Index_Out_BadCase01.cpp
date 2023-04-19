

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <algorithm>
using namespace std;


/*
* @Scene: 由数组开辟内存，但在对数据使用std::sort排序时传入了错误的索引
*/
void TestCaseBad01() 
{
    int array[10] = {0};
    // not reported, no bug here
    std::sort(array, array + 10); // std::sort will access array[9]
    // reported if 'strict_arithmetic' is enabled
    /* POTENTIAL FLAW: std::sort will access array[10], OVERRUN  */
    std::sort(array, array + 11); // std::sort will access array[10]
}
