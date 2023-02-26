#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[2];
	srand(time(0));
    int a = rand() % 11;
	//a = [0, 10]
	while(true) {
		if(a) {
			//a != 0
			exit(0);
			buffer[20] = 1; //FP, unreachable
		}
		else {
			//a == 0
			if(a > 0) {
				buffer[20] = 1; //FP, unreachable
				a--;
			}
			else {
				a++;
				//a == 1
				buffer[a] = 1; //FP 
			}
			if(a) {
				buffer[20] = 1; //TP
			}
			continue;
		}
	}
}
