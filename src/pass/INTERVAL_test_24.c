#include "stdbool.h"
extern void svf_assert(bool);
#include <assert.h>

int main() {
    int a;
    if (a >= 0) {
        int b = a;
        int i;
        for (i = 0; i < 5; i++) {
            b++;
            if(b > 10) {
                break;
            }
        }
        if (a > 0 && i == 5 && b % 2 == 0) {
            svf_assert(a % 2 == 1 && a <= 5);
        }
    }
}