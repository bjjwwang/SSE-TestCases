#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include <ctype.h>

int main() {
    int buffer[32];
	int counter = 0;
    for (int i = 0; i <= 127; i++) {
        if(ispunct(i)) {
			counter++;
		}
    }
	//counter == 32
	buffer[counter] = 1; //TP
}
