#include "stdbool.h"
#include <stdio.h>
int func(int b, int *c) {
    *c = 4;
    if (b == 0) {
        return 0;
    }
    return func(b-1, c) + 1;
}
int main() {
    int arr[5];
    int a = 0;
    int b = 3;
    int c = 3;
    a  = func(b, &c);
    arr[c] = 1;
    printf("a=%d, c=%d", a, c);
}