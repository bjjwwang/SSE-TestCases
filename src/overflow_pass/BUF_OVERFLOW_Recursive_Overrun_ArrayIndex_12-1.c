#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int count = 0;

int power(int a, int b) {
    count++;
    if(b < 0) {
        return 0;
    }
    else if(b == 0) {
        return 1;
    }
    else {
        return(a * power(a, b - 1));
    }
}

int main() {
	int buffer[5];
    srand(time(0));
	int a = (rand() % 20) - 10;
    int b = (rand() % 20) - 10;
    power(a, b);
    if(b > 0) {
        //count == b + 1
		buffer[count] = 1; //TP
    }
    else {
		//count == 1
		buffer[count] = 1; //FP
    }
}
