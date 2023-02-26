#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int digitCount(int i) {  
    static int counter = 0;
    if(i > 0) {  
        counter++;  
        return digitCount(i/10);  
    }  
    else {
        return counter;  
    } 
}  

int main() {
	int buffer1[4];
	int buffer2[3];
    srand(time(0));
	int randomNumber = 1 + (rand() % 999);
    int counter = digitCount(randomNumber);
    //counter = [1, 3];
	if(counter == 3) {
		buffer1[counter] = 1; //FP
		buffer2[counter] = 1; //TP
	}
}
