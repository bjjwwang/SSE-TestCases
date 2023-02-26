#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[5];
	srand(time(0));
    int a = rand() % 11;
	int b = rand() % 11;
	if(a >= 0) {
		do {
		    printf("%d\n", a);
			for(int i = b; i > a; i--) {
				if(i % 2 == 0) {
					printf("%d is even\n", i);
					buffer[a] = 1; //TP
				}
				else {
					printf("%d is odd\n", i);
				}
			}
			a--;
		} while(a);
	}
	//a == 0
	buffer[a] = 1; //FP
}
