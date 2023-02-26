#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int baseConversion(int i, int base) {
    if(i == 0) {
        return 0;
    }
    return i % base + 10 * baseConversion(i / base, base);
}

int main() {
    int buffer1[1747];
	int buffer2[1746];
	srand(time(0));
    int randomNumber = rand() % 999;
    //octal value
    int i = baseConversion(randomNumber, 8);
    //i = [0, 1746];
	buffer1[i] = 1; //FP
	buffer2[i] = 1; //TP
}
