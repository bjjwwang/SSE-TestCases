#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int bar(int i);
int foo(int i);

int count = 0;

//indirect recursion
int foo(int i) {
    count++;
    if(i == 0) {
        return 0;
    }
    else {
        return bar(i);
    }
}

int bar(int i) {
    return foo(i - 1);
}

int main() {
	int buffer[5];
    int i = 4;
    if(i >= 0) {
        foo(i);
        //count == i + 1
		buffer[count] = 1; //TP
    }
}
