#include "stdbool.h"
#include <stdio.h>
int func(int b) {
    if (b == 0) {
        return 0;
    }
    return func(b-1) + 1;
}
int main() {
    int a = 0;
    a  = func(3);
    printf("a=%d", a);
}