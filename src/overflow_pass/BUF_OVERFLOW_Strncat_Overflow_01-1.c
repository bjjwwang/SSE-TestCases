#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	char* dest = malloc(128);
	strcpy(dest, "Hello");
	char* src = malloc(128);
	memset(src, 'a', 128);
	src[127] = '\0';
	
    srand(time(0));
	int r = rand() % 128;
    char a = (char)r; //random ascii character
    int a_as_int = (int)a;
    if (a >= 'a' && a <= 'z') {
		//a_as_int = [97, 122]
		strncat(dest, src, a_as_int); //FP
    }
	else {
		//a_as_int [0, 127]
		strncat(dest, src, a_as_int); //TP
	}
}
