#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[20];
    srand(time(0));
    int a = (rand() % 51) - 25;
    a = a % 5;
	//a = [-INF, INF]. If a is a negative number, result of % operation will also be negative
    buffer[a] = 1; //TP
}