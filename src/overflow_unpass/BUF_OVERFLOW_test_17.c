#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	double *data = (double *)malloc(1);
	*data = 1.7E300; //TP, malloc too small for double
}
