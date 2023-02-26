#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

#define MIN(x, y) ((x) < (y) ? (x) : (y))

int main() {
	int buffer[5];
	srand(time(0));
    int a = (rand() % 11) - 5;
	//a = [-5, 5]
	int b = MIN(a * a * a, a);
	if(b == a) {
		//a = [0, INF], a positive int
		if(!a) {
			buffer[a] = 1; //FP
		}
	}
	else {
		//a = [-INF, -1], a negative int
		buffer[a] = 1; //TP
	}
}
