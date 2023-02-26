#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[15];
    srand(time(0));
    int a = (rand() % 51) - 25;
    //a = [-25, 25]
	int b = a;
    for(int i = 0; i < 10; i++) {
        if(a == 10) {
            break;
        }
        a++;
    }
    if(b >= 0 && b <= 10) {
		//a == 10
        buffer[a] = 1; //FP
    }
    else {
		//a = [-15, 35]
        buffer[a] = 1; //TP
    }
}
