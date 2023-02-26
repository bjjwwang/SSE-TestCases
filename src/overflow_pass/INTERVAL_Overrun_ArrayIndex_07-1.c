#include "stdbool.h"
extern void svf_assert(bool);
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>  
#include <string.h>

int baseConversion(int i, int base) {
    int stack[10];
    int stackIndex = 0;
    while(i >= base) {
        printf("%d\n", stackIndex);
        stack[stackIndex] = i % base;
        stackIndex++;
        i = i / base;
        
    }
    char result[100];
    sprintf(result, "%d", i);
    while(true) {
        if(stackIndex == 0) {
            goto ENDLOOP;
        }
        char buffer[100];
        sprintf(buffer, "%d", stack[--stackIndex]);
        strcat(result, buffer);
    }
    ENDLOOP:
    return atoi(result);
}

int main() {
    srand(time(0));
    int randomNumber = rand() % 31;
    //octal value
    int i = baseConversion(randomNumber, 8);
    svf_assert(i >= 0 && i <= 36);
}
