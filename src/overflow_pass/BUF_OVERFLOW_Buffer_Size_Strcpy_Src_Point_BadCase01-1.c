#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "stdbool.h"
extern void bug_assert(bool);

int main()
{
    char dest[10] = {0};
    char *src = "hello world!";
    /* POTENTIAL FLAW: src > dest */
    strcpy(dest, src);
}
