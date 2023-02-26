#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int sumDigits(int i) {
    static int sum = 0;
    if(i != 0) {
        sum = sum + (i % 10); 
        sumDigits(i/10);
    }
    return sum;
}

int main() {
	int buffer1[27];
	int buffer2[26];
    srand(time(0));
	int randomNumber = rand() % 999;
    int i = sumDigits(randomNumber);
	//i = [0, 26]
	buffer1[i] = 1; //FP
	buffer2[i] = 1; //TP
}
