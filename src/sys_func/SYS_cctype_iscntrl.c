#include "ctype.h"
#include "stdbool.h"
extern void svf_assert(bool);
int main ()
{
    int i;
    char a = 0x00;
    char b = '+';
    svf_assert(iscntrl(a) && (!iscntrl(b)));
    return 0;
}
