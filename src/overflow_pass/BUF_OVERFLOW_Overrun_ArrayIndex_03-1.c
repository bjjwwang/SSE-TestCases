#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <math.h>
#include <stdbool.h>

int a;

int foo(int input) {
	int output = 0;
	for(int i = 0; i < input; i++) {
		output++;
	}
	return output;
}

int main() {
	int buffer[5];
    srand(time(0));
    a = rand() % 11;
	//a = [0, 10]
	int b = a;
	if(a > 0) {
		for(int i = 0; i < b; i++) {
			a = a + foo(a);
		}
		//a == b * pow(2, b)
	}
	while(true) {
		LOOP:
		a -= pow(2, b);
		if(a) {
			buffer[a] = 1; //TP
			goto LOOP;
		}
		exit(0);
		buffer[20] = 1; //FP, unreachable
	}
}
