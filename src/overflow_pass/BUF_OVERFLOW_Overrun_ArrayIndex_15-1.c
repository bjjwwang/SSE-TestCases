#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int* a = malloc(5 * sizeof(int));
    a[4] = 1; //FP
	a[5] = 1; //TP
}
