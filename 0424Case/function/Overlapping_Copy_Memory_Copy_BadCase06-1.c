#include <stdio.h>
#include <string.h>


struct S1 {
    int i;
};

struct S2 {
    long l;
};

/*
 * @mainScene overlapping_assignment，直接赋值造成重叠
 * @subScene 结构体类型指针s2等于s1（入参），第一个成员进行赋值操作，导致重叠赋值
 */
void TestBad6(void *p)
{
    struct S1 *s1 = (struct S1 *)p;
    struct S2 *s2 = (struct S2 *)p;
    /* POTENTIAL FLAW:  重叠赋值，应该使用memmove */
    s2->l = s1->i;
}

int main() {
    int p = 3456;
    TestBad6((void*) &p);
}

