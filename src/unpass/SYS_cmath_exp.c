#include "stdbool.h"
#include <math.h>
extern void svf_assert(bool);


int main ()
{
    double param, result;
    param = log(2.0);
    result = sinh (param);
    svf_assert(result - 0.75 < 0.01);
    return 0;
}