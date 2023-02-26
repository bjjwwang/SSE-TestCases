#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[10];
	int a;
	scanf("%d", &a);
    int b = 10;
    b = b / a;
    if(a > 0) {
		if(a <= 5) {
			//b = [2, 10]
			buffer[b] = 1; //FP
		}
		else {
			//b = [0, 1]
			buffer[b] = 1; //FP
		}
    }
	else {
		buffer[b] = 1; //TP
	}
}
