#include "ctype.h"
#include "stdbool.h"
extern void svf_assert(bool);
int main ()
{
    int i;
    char a = 'a';
    char b = '+';
    svf_assert(isalpha(a) && (!isalpha(b)));
    return 0;
}
