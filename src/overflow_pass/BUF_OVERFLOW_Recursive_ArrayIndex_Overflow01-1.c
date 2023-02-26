#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int recursive(int a) {
	a--;
	if(a) {
		a = recursive(a);
	}
	return a;
}

int main() {
	int buffer[5];
	srand(time(0));
    int a = (rand() % 11) - 5;
	//a = [-5, 5]
	int result;
	if(a > 0) {
		result = recursive(a);
	}
	else {
		result = recursive(abs(a));
	}
	//result == 0
	buffer[result] = 1; //FP
	buffer[a] = 1; //TP
}
