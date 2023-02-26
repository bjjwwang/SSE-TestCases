#include "stdbool.h"
#include <stdio.h>
int c;
int func(int b) {
    c = 4;
    if (b == 0) {
        return 0;
    }
    return func(b-1) + 1;
}
int main() {
    int arr[5];
    int a = 0;
    a  = func(3);
    arr[c] = 1;
    printf("a=%d, c=%d", a, c);
}