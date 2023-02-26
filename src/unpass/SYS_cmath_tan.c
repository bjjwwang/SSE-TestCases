#include "stdbool.h"
#include <math.h>
extern void svf_assert(bool);

#define PI 3.14159265

int main ()
{
    double param, result;
    param = 45.0;
    result = tan ( param * PI / 180.0 );
    svf_assert(result - 1.0 < 0.01);
    return 0;
}