#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[8];
    srand(time(0));
	int randomNumber = rand() % 999;
	int i = printf("Value:%d", randomNumber);
	//i = [7, 9]
	buffer[i] = 1; //TP
}
