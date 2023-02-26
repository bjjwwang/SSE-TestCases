#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

struct myStruct{
    int f1[6];
};

int main() {
    struct myStruct s1;
	srand(time(0));
    int a = rand() % 100;
    int b = 1;
    scanf("%d", &a);
    b = a + b;
    if (a > 5) {
        s1.f1[b] = 1; //TP
    }
    else {
        s1.f1[b] = 1; //TP, index can be negative
    }    
}
