#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
    int a[3][4];
    for(int x = 0; x < 4; x++) {
        for(int y = 0; y < 4; y++) {
            a[x][y] = 0; //TP, x index too large
        }
    }
}
