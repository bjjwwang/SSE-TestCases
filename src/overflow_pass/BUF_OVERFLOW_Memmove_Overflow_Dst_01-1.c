#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int *dest = (int*)alloca(3 * sizeof(int));
    int source[4] = {9, 9, 9, 9};
	memmove(dest, source, 4 * sizeof(int)); //TP
}