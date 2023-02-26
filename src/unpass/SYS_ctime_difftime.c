#include "stdbool.h"
#include <time.h>
extern void svf_assert(bool);
int main ()
{
    time_t now;
    struct tm newyear;
    struct tm newyear2;
    double seconds;

    time(&now);  /* get current time; same as: now = time(NULL)  */
    newyear = *localtime(&now);

    newyear.tm_hour = 0; newyear.tm_min = 0; newyear.tm_sec = 0;
    newyear.tm_mon = 0;  newyear.tm_mday = 1;

    newyear2 = *localtime(&now);

    newyear2.tm_hour = 0; newyear2.tm_min = 0; newyear2.tm_sec = 1;
    newyear2.tm_mon = 0;  newyear2.tm_mday = 1;

    seconds = difftime(mktime(&newyear2),mktime(&newyear));

    svf_assert(seconds == 1);

    return 0;
}