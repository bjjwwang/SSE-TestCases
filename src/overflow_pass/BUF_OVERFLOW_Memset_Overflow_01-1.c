#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	char buffer1[4]; 
	char buffer2[3]; 
	srand(time(0));
	int a = rand() % 5;
	//a = [0, 4]
    int data = 0;
    while (data < a) {
        data++;
    }
	//data == a
	memset(buffer1, 'a', data); //FP
	memset(buffer2, 'a', data); //TP
	int len = strlen(buffer1); //TP, string is not null terminated
}
