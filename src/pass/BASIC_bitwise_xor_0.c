#include "stdbool.h"
extern void svf_assert(bool);
int main() {
    int val3 = 1234567;
    int val4 = 7654321;
    int xor_val = val3 ^ val4;
    svf_assert(xor_val == 6692150);
    return 0;
}