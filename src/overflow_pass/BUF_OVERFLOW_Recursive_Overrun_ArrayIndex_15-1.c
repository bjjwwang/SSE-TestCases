#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int count = 0;
int result = 0;

void foo();
void bar();

void foo(int limit) {
    if(count < limit) {
        result = count + 1;
        count++;
        bar(limit);
    }
    return;
}

void bar(int limit) {
    if(count < limit) {
        result = count - 1;
        count++;
        foo(limit);
    }
    return;
}

int main() {
	int buffer[5];
	srand(time(0));
    int limit = (rand() % 11) - 5;
	//limit = [-5, 5]
    if(limit > 0) {
        foo(limit);
        if(limit % 2 == 1) {
            //result == limit
			buffer[result] = 1; //TP
        }
        else {
            //result == limit - 2
			buffer[result] = 1; //FP
        }
    }
    else {
        //result == 0
		buffer[result] = 1; //FP
    }
}
