#include "ctype.h"
#include "stdbool.h"
extern void svf_assert(bool);
int main ()
{
    char a = 'a';
    svf_assert(isalnum(a));
    return 0;
}
