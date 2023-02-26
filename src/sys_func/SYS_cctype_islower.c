#include "ctype.h"
#include "stdbool.h"
extern void svf_assert(bool);
int main ()
{
    int i;
    char a = 'a';
    char b = 'B';
    svf_assert(islower(a) && (!islower(b)));
    return 0;
}
