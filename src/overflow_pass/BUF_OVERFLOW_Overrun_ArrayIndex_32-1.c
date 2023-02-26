#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int loop(int a) {
    int output = 0;
    int i = 1;
    while(true) {    
        if(i % 2 == 0) {
            output++;
        }
        if(i == a) {
            break;
        }
        i++;
    }
    return output;
}

int main() {
	int buffer[5];
    srand(time(0));
    int a = rand() % 11; 
	//a = [0, 10]
    int output = 0;
    if(a > 0) {
        output = loop(a);
		//output == a/2
        buffer[output] = 1; //TP
    }
    else {
        buffer[output] = 1; //FP
    }
}
