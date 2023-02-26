#include "stdbool.h"
extern void svf_assert(bool);
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>  

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
    srand(time(0));
	int randomNumber = 1 + rand() % 999;
    int counter = digitCount(randomNumber);
    svf_assert(counter >= 1 && counter <= 3);
}
