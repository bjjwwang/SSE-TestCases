#include "ctype.h"
#include "stdbool.h"
extern void svf_assert(bool);
int main ()
{
    int i;
    char a = ' ';
    char b = '\t';
    char c = '+';
    svf_assert(isblank(a) && isblank(b) && (!isblank(c)));
    return 0;
}
