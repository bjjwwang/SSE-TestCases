#include "ctype.h"
#include "stdbool.h"
extern void svf_assert(bool);
int main ()
{
    int i;
    char a = 'a';
    char b = 'B';
    svf_assert((!isupper(a)) && isupper(b));
    return 0;
}
