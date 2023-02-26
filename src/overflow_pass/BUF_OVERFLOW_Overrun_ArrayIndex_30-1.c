#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

struct testStruct {
    int a;
};  

int main() {
	int buffer[6];
	struct testStruct* i = malloc(4 * sizeof(struct testStruct));
	srand(time(0));
	i[3].a = rand() % 10;
	//i[3].a = [0, 9]
    if (i[3].a > 5) { //i[3].a = [6, 9]
        buffer[i[3].a] = 1; //TP
    }
    else if(i[3].a >= 0) { //i[3].a = [0, 5]
        buffer[i[3].a] = 1; //FP
    }    
}
