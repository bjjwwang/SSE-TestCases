#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[10] = {0};
    int * buffer_1 = &buffer[11];
	*buffer_1 = 9; //TP
}