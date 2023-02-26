#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int a = 0;
    int b = 0;
    while(a < 10) {
        a++;
        b = b + 2;
    }
	//a == 10, b == 20
	char* dest = malloc(a);
	char* src = malloc(b);
	memset(src, 'a', b);
	src[b - 1] = '\0';
	memmove(dest, src, strlen(src) + 1); //TP
}
