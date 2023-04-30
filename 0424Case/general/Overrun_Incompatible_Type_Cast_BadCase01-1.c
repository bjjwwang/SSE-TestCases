

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>


/*
* @Scene: 将指针转换为不兼容类型访问内存中可能越界
* @SubScene: unsigned short*显示或者隐式为unsigned int*传给函数作为参数，不同类型大小数据存在越界访问
*/
void TestCaseBad01(unsigned int *x) 
{
    /* POTENTIAL FLAW: 将指针转换为不兼容类型访问内存中可能越界 */
    *x = 60;
}

void MyFunc1() 
{
    unsigned int y; //4B
    TestCaseBad01(&y);     
}


void MyFunc2() 
{
    unsigned short y; //2B
    // unsigned short*强转为int*,再隐式转换为unsigned int*
    TestCaseBad01((int*)&y); // out-of-bounds memory access
}


void MyFunc3() 
{
    unsigned short y;
    // unsigned short*隐式转为int*
    TestCaseBad01(&y);
}

/*
* @Scene: 将指针转换为不兼容类型访问内存中可能越界
* @SubScene: unsigned short*隐式转为int*，不同类型大小数据存在越界访问
*/
void TestCaseBad02(int *p)
{
    /* POTENTIAL FLAW: 将指针转换为不兼容类型访问内存中可能越界 */
    *p = 10;
}

void MyFunc4()
{
    unsigned short a;
    // unsigned short*隐式转为int*
    TestCaseBad02(&a);
}


int main() 
{
    MyFunc1();
    MyFunc2();
    MyFunc3();
    MyFunc4();
    return 0;
}
