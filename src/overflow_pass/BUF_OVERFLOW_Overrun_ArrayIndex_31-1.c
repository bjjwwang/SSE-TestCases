#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

void foo(int* i) {
    LOOP:
    *i = *i + 1;
    if(*i < 10) {
        goto LOOP;
    }
}

int main() {
	int buffer[20];
    srand(time(0));
    int i = rand() % 51;
	//i = [0, 50]
    foo(&i);
    //i = [10, 51];
	buffer[i] = 1; //TP
}
