#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int* buffer = malloc(7 * sizeof(int));
	int a;
	scanf("%d", &a);
    if(a > 5 && a < 7) {
		buffer[a] = 1; //FP
    }
	if(a > 5 && a < 8) {
		buffer[a] = 1; //TP
	}
}
