#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[2];
    srand(time(0));
    int a = (rand() % 51) - 25;
    //a = [-25, 25]
    int b = a;
    for(int i = 0; i < 3; i++) {
        b = b * a;
    }
	//b = [0, INF]
	if(b >= 0) {
		buffer[2] = 1; //TP
	}
    else {
		buffer[2] = 1; //FP, infeasible path
	}
}
