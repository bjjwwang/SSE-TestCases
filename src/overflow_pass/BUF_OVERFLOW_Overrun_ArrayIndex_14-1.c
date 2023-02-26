#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[4];
    srand(time(0));
    int a = rand() % 5;
    //a = [0, 4]
    if (a >= 0) {
        buffer[a] = 1; //TP
    }
}
