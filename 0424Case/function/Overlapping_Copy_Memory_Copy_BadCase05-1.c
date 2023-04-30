#include <stdio.h>
#include <string.h>


/*
 * @mainScene overlapping_copy，使用拷贝函数造成重叠
 * @subScene 基础类型指针q是p（入参）的offset，使用memcpy进行重叠拷贝
 */
void TestBad2(char *p)
{
    char *q = p + 2; // offset是2
    /* POTENTIAL FLAW:  重叠拷贝，应该使用memmove */
    memcpy(p, q, 3); // 拷贝大小是3
}

/*
 * @mainScene overlapping_copy，使用拷贝函数造成重叠
 * @subScene 基础类型指针q等于p（动态分配），使用memcpy进行重叠拷贝
 */
void TestBad5()
{
    char *p = (char *)malloc(60); // 分配大小内存是60
    if (p == NULL) {
        return;
    }
    char *q = p;
    /* POTENTIAL FLAW:  重叠拷贝，应该使用memmove */
    memcpy(p, q, 3); // 拷贝大小是3
    free(p);
}

int main() {
    TestBad5();
}
