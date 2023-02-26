#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	int buffer[100];
    int num = 0;
    scanf("%2d", &num); 
	//num = [-9, 99]
    if (num >= 0) {
        memset(buffer, 'a', num); //FP
    }
    else {
        memset(buffer, 'a', num); //TP, integer overflow for size argument
    }    
}
