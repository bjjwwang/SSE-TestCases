#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

struct myStruct{
    char n2[3];
};

int main() {
    struct myStruct s1;
    for(int i = 0; i < 4; i++) {
        s1.n2[i] = 'b'; //TP
    }
}
