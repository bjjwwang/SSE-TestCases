#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int counter = 0;

long factorial(int i) {
    counter++;
    if(i <= 1) {
        return 1;
    }
    return i * factorial(i - 1);
}

int main() {
	int buffer1[6];
	int buffer2[5];
    int i = 5;
    long f = factorial(i);
    //counter == i;
	buffer1[counter] = 1; //FP
	buffer2[counter] = 1; //TP
}
