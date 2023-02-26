#include "stdbool.h"
extern void svf_assert(bool);
int main() {

    int val = 1234567;
    int neg_val = ~val;
    svf_assert(neg_val == -1234568);
    return 0;
}