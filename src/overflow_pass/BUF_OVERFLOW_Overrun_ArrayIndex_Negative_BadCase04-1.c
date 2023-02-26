#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "stdbool.h"
extern void bug_assert(bool);

int main()
{
    int buffer[3] = {0};
    /* POTENTIAL FLAW: 数组下标为负数常数 */
    buffer[-1] = 0;
    return 0;
}
