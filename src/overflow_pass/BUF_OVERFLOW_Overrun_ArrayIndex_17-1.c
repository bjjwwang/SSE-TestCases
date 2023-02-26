#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int buffer[5];

void foo(int* i) {
    int a = *i % 2;
    switch(a) {
        case 0:
            break;
        case 1:
            *i = *i + 1;
            break;
        default:
            buffer[50] = 1; //FP, infeasible path
            break;
    }
}

int main() {
    srand(time(0));
    int i = rand() % 20;
    if (i >= 0) {
        foo(&i);
        if(i % 2 == 0) {
			buffer[i] = 1; //TP
		}
		else {
			buffer[50] = 1; //FP, infeasible path
		}
    }
}
