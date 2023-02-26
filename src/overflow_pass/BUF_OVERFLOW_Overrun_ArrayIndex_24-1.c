#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include <ctype.h>

int main() {
	int buffer[91];
	srand(time(0));
	int ch = rand() % 128;
	if (ch >= 97 && ch <= 122) {
		ch = toupper(ch);
		//ch = [65, 90]
		buffer[ch] = 1; //FP
	}
	else {
		buffer[ch] = 1; //TP
	}
}
