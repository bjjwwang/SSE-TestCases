#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

struct ints1 {
	int zero[10];
};

struct ints2 {
	int zero[5];
};

int main() {
	struct ints1 a;
	struct ints2 b;
	for (int i = 0; i < 10; i++) {
		a.zero[i] = 1;
		b.zero[i] = a.zero[i]; //TP
	}
}
