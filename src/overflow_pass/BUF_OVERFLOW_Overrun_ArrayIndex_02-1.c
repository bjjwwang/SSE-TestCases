#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

typedef union {
	int unionFirst;
	int unionSecond;
} unionType;

int main() {
	unionType myUnion;
	myUnion.unionFirst = 10;
	int buffer[10] = {0};
	buffer[myUnion.unionSecond] = 1; //TP
}
