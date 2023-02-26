#include "stdbool.h"
#include <math.h>
extern void svf_assert(bool);

#define PI 3.14159265

int main ()
{
    double param, result;
    param = 60.0;
    result = cos ( param * PI / 180.0 );
    svf_assert(result - 0.50 < 0.001);
    return 0;
}