#include <ctype.h>
#include "stdbool.h"
extern void svf_assert(bool);
int main ()
{
    int i;
    char a = ',';
    char b = 'a';
    svf_assert(ispunct(a) && (!ispunct(b)));
    return 0;
}
