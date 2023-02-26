#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include <math.h>

int digitCount(int i) {  
    int counter = 0;
    counter = (i == 0)? 1 : log10(i) + 1;   
    return counter;  
}  

int main() {
	int buffer1[4];
	int buffer2[3];
    srand(time(0));
	int randomNumber = rand() % 999;
    int counter = digitCount(randomNumber);
    //counter = [1, 3];
	if(counter == 3) {
		buffer1[counter] = 1; //FP
		buffer2[counter] = 1; //TP
	}
}
