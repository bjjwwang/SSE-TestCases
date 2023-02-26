#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main () {
	int buffer[5];
	srand(time(0));
    int input = rand() % 10;
    int a = input; 
    int b = rand() % 10;
    if(b != 0) {
        //"If the quotient a/b is representable, the expression (a/b)*b + a%b shall equal a" - C99 standard
        a = (a / b) * b + a % b; 
		//a == input
        if(input >= 0 && input < 5) {
			buffer[a] = 1; //FP
		}
		else {
			buffer[a] = 1; //TP
		}
    }
}
