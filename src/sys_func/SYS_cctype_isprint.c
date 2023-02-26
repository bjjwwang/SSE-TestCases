#include "ctype.h"
#include "stdbool.h"
extern void svf_assert(bool);
int main ()
{
    int i;
    char a = 0x10;
    char b = 0x30;
    svf_assert(!isprint(a) && isprint(b));
    return 0;
}
