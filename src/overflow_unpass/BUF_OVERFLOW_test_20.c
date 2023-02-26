#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
    int source[5] = {9, 9, 9, 9, 9};
    int i = 5;
    do {
        source[5/i] = 1; //TP
        i--;
    } while(i);
}
