#include "stdbool.h"
extern void svf_assert(bool);
int main() {
    int val1 = 1234567;
    int val2 = 7654321;
    int and_val = val1 & val2;
    svf_assert(and_val == 1098369);

    return 0;
}