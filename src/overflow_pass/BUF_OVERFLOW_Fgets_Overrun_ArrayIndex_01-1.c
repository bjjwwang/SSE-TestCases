#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int checkPassword() {
    char *realPassword = "1234";
	char givenPassword[10];
	fgets(givenPassword, 12, stdin); //TP
    if (!strncmp(givenPassword, realPassword, 4)) {
		return 1;
	}
	return 0;
}

int main() {
    checkPassword();
}
