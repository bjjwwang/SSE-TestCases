#include "stdbool.h"
#include <math.h>
extern void svf_assert(bool);


int main ()
{
    double param, result;
    param = 5.5;
    result = log (param);
    svf_assert(result - 1.704 < 0.01);
    return 0;
}