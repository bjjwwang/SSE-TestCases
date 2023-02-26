#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

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
    char buffer[100];
    sprintf(result, "%d", i);
    LOOPENTRY:
    if(stackIndex != 0) {
        goto LOOP;
    }
    else {
        goto LOOPEXIT;
    }
    LOOP:
    sprintf(buffer, "%d", stack[--stackIndex]);
    strcat(result, buffer);
    goto LOOPENTRY;
    LOOPEXIT:
    return atoi(result);
}

int main() {
	int buffer1[37];
	int buffer2[36];
    srand(time(0));
    int randomNumber = rand() % 31;
    //octal value
    int i = baseConversion(randomNumber, 8);
    //i = [0, 36]
	buffer1[i] = 1; //FP
	buffer2[i] = 1; //TP
}
