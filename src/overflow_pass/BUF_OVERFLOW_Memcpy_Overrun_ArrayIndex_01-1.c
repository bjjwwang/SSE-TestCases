#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

struct testStruct {
    int* a;
};  

int main() {
	int buffer[5];
    int x = -1;
    struct testStruct s1;
    struct testStruct s2;
    s1.a = &x;
    memcpy(&s2, &s1, sizeof(struct testStruct)); //shallow copy
    srand(time(0));
	*(s1.a) = rand() % 10;
    if(*(s2.a) == *(s1.a)) {
		buffer[5] = 1; //TP
	}
}
