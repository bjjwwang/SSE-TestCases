#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int count = 0;

int sum(int i) {
    count++;
    if (i != 0) {
        return i + sum(i - 1);
    }
    else {
        return i;
    }
}

int main() {
	int buffer[5];
    int i = 4;
    if(i >= 0) {
        sum(i);
        //count == i + 1
		buffer[count] = 1; //TP
    }
}
