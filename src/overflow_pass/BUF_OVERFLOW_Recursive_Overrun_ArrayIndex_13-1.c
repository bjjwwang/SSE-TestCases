#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	char src[200];
	memset(src, 'a', 200);
	char dest[100];
    
	int a;
	scanf("%d", &a);
    int b = -1;
    b = a * b;
    if (a > -100 && a <= 0) { //a = [-99, 0]
		//b = [0, 99]
        strncpy(dest, src, b); //FP
    }
    else {
		//b = [-INF, INF]
        strncpy(dest, src, b); //TP
    }    
}
