#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[5];
	srand(time(0));
	int a = rand() % 51;
	int b = a;
	loopStart: do {
		if(a == b) {
			a++;
			goto loopStart;
		}
		a++;
		b++;
	} while(a < 15);
	//a = [15, INF]
	if(b == a - 1) {
		buffer[5] = 1; //TP
	}
}
