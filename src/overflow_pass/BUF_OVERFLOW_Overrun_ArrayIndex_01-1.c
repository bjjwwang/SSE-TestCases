#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	srand(time(0));
	int data = rand() % 5;
	int buffer[2] = {0, 0};
	buffer[data] = 1; //TP
}
