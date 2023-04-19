

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

/*
* @Scene: 由malloc申请内存，然后通过索引访问内存
* @SubScene: 索引通过赋值传递，超过了上边界
*/
void TestCaseBad02(int n) 
{
    char *p = malloc(n);     
    if (p == NULL) {
        return;
    }  
    int y = n;    //  Valid indices are buffer[0] to buffer[y - 1]
    /* POTENTIAL FLAW: writing to buffer[y] overruns local buffer  */
    p[y] = 'a';   
    
    free(p);
}
