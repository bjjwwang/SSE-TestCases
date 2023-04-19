
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#define COUNT_MAX 16
typedef struct IVP_DEV {
    int sect_count; 
    char sects[16][8];
}IVP_DEV;
/*
* @Scene: 外部数据未经校验进行固定大小偏移或数组下标访问
* @SubScene: 校验不充分导致数组越界
*/
void printSect(int index, IVP_DEV *ivp_dev)
{

    if (index > ivp_dev->sect_count) {
        return;
    }

    /* POTENTIAL FLAW:当 index == ivp_dev->sect_count时，出现数组越界的情况 */
    printf("%s\n", ivp_dev->sects[index]);
}
int main(int argc, char** argv)
{

    char buf[2048] = { 0 };
    fscanf(stdin, "%s", buf);
    printSect(COUNT_MAX, (IVP_DEV *)buf);
    return 0;
}
