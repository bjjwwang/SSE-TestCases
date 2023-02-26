#include "ctype.h"
#include "stdbool.h"
extern void svf_assert(bool);
int main ()
{
    int i;
    char a = '3';
    char b = 'a';
    svf_assert(isdigit(a) && (!isdigit(b)));
    return 0;
}
