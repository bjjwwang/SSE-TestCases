#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
	char buf[12];
	char input[] = "&x&&";
	int dst_index = 0;
	for (int i = 0; i < strlen(input); i++){
		if('&' == input[i]) { //replace & with 1234
			buf[dst_index++] = '1';
			buf[dst_index++] = '2';
			buf[dst_index++] = '3';
			buf[dst_index++] = '4'; //TP (on last iteration of loop)
		}
		else {
			buf[dst_index++] = input[i];
		}
	}
}
