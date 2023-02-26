#include <stdlib.h>

int main() {
	srand(time(0));
	int a = rand() % 5; //[0, 4]
    int data = 0;
    while (data < a) {
        data++; //[0, 4]
    }
    //printf("%d\n", data);
	int buffer[2] = {0, 0};
	buffer[data] = 1;
    return 0;
}