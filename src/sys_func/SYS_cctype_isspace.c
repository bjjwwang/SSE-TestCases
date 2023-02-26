#include <ctype.h>
#include "stdbool.h"
extern void svf_assert(bool);
int main ()
{
    int i;
    char a = '\t';
    char b = '\n';
    char c = '+';
    svf_assert(isspace(a) && isspace(b) && (!isspace(c)));
    return 0;
}
