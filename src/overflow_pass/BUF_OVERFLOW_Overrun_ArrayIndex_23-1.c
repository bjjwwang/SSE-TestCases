#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	char* buffer = malloc(50);
	char ch;
    scanf("%1c", &ch);
	int a = (int)ch;
	//a = [0, 127]
	snprintf(buffer, 50, "aaaaa %d aaaaa\n", a);
	
	char nb[10];
    int b;
    sscanf(buffer, "%s %d", nb, &b); //extract digit from string again
	//b = [0, 127]
	int newBuffer[50];
	if(a < 0 || a >= 128) {
		newBuffer[b] = 1; //FP, infeasible path
	}
	else {
		newBuffer[b] = 1; //TP
	}
}
