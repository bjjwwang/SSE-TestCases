#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

void foo(int* i) {
    *i = *i + 1;
    if(*i < 10) {
        foo(i);
    }
}

int main() {
	int buffer[50];
	srand(time(0));
    int i = rand() % 20;
    foo(&i);
	//i = [10, INF]
	for(int x = i; x < i; x++) {
		buffer[x] = 1; //TP
	}
}
