#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[6];
    srand(time(0));
    int a = (rand() % 51) - 25;
    if (a >= 0) {
        int b = a;
        int i;
        for (i = 0; i < 5; i++) {
            b++;
            if(b > 10) {
                break;
            }
        }
        if (a > 0 && i == 5 && b % 2 == 0) {
			//a % 2 == 1 && a <= 5
			if(a % 2) {
				buffer[a] = 1; //FP
			}
			else {
				buffer[20] = 1; //FP, infeasible path
			}
        }
    }
	else {
		buffer[a] = 1; //TP
	}
}
