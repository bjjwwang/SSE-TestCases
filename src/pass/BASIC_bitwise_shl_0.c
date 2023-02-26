#include "stdbool.h"
extern void svf_assert(bool);
int main() {

    int val7 = 1234567;
    int val8 = 7654321;
    int new_val = (val7 >> 2) & (val8 << 2);
    svf_assert(new_val == 9344);

    return 0;
}