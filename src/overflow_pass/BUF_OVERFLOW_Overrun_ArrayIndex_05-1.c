#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

struct twoInts {
	int zero;
	int one;
};

int main() {
	struct twoInts data[3];
	struct twoInts source[5];
	for (int i = 0; i < 5; i++) {
		source[i].zero = 0;
		source[i].one = 1;
		data[i] = source[i]; //TP
	}
}
