#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[5];
    int* i = malloc(4 * sizeof(int));
    int ar[4] = {1, 2, 3, 5};
    srand(time(0));
	int a = rand() % 51;
	//a = [0, 50]
    ar[3] = a;
    memcpy(i, ar, 4 * sizeof(int));
    if (i[2] > 2) {
        buffer[5] = 1; //FP, infeasible path
    }
    else {
		//i[3] = [0, 50]
        buffer[i[3]] = 1; //TP
    }    
}
