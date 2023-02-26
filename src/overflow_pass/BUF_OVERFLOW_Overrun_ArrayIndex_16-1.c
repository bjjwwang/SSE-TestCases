#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int loop(int a) {
    int output = 0;
    for(int i = 1; i <= a; i++) {
        if(i % 2 == 0) {
            output++;
        }
    }
    return output;
}

int main() {
	int buffer[5];
    int a = 9;
	int b = 10;
    int output;
    if(a > 0) {
        output = loop(a);
		//output = a/2
        buffer[output] = 1; //FP
    }
	if(b > 0) {
        output = loop(b);
		//output = b/2
        buffer[output] = 1; //TP
    }
}
