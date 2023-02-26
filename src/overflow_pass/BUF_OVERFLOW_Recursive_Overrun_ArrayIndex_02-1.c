#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

void increment(int* a) {
	*a = *a + 1;
}

int recursive(int a) {
	a--;
	if(a) {
		a = recursive(a);
	}
	return a;
}

int main() {
	int buffer[10];
	srand(time(0));
    int a = rand() % 11;
	//a = [0, 10]
	LOOP:
	if(a > 5) {
		a--;
	}
	else if(a < 5) {
		a++;
	}
	
	if(a != 5) {
		goto LOOP;
	}
	else {
		//a == 5
		a = recursive(a);
		//a == 0
		buffer[a] = 1; //FP
	}
	while(true) {
		increment(&a);
		//a == 10
		if(a == 10) {
			buffer[a] = 1; //TP
			exit(0);
		}
	}
	buffer[50] = 1; //FP, unreachable
}
