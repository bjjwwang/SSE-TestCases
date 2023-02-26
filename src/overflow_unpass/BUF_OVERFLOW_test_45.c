#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int foo() {
    int i = 0;
    bool a = true;
    do {
        i++;
    } while(i < 5 && a);
    return i;
}

int bar() {
    int i = 0;
    bool a = false;
    do {
        i++;
    } while(i < 5 && a);
    return i;
}

int main() {
	int buffer[5];
	srand(time(0));
	int a = rand() % 2;
    int b = (a) ? foo() : bar();
    if(a) {
		//b == 5
        buffer[b] = 1; //TP
    }
    else {
		//b == 1
        buffer[b] = 1; //FP
    }
}
