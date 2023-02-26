#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

struct myStruct {
	void * voidSecond;
    char charFirst[4];
};

int main() {
	struct myStruct* structCharVoid = (struct myStruct*)malloc(sizeof(struct myStruct)); //allocate 16 bytes
	structCharVoid->voidSecond = (void *)"01234567890123456789";
	memcpy(structCharVoid->charFirst, (char*)structCharVoid->voidSecond, 20); //TP
    structCharVoid->charFirst[sizeof(structCharVoid->charFirst) - 1] = '\0';
}
