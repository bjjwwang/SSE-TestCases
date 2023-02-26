#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int a(int x);
int b(int x);
int c(int x);
int d(int x);
int e(int x);
int f(int x);
int g(int x);
int h(int x);
int z(int x);

int a(int x) {
	return b(x) * 2; 
}

int b(int x) {
	return c(x) * 2; 
}

int c(int x) {
	return d(x) * 2; 
}

int d(int x) {
	return e(x) * 2; 
}

int e(int x) {
	return f(x) * 2; 
}

int f(int x) {
	return g(x) * 2; 
}

int g(int x) {
	return h(x) * 2; 
}

int h(int x) {
	return z(x) * 2; 
}

int z(int x) {
	return x * 2; 
}

int main() {
	int buffer1[1025];
	int buffer2[1024];
	int input = 2;
	int result = a(input);
	//result == input * 512
	buffer1[result] = 1; //FP
	buffer2[result] = 1; //TP
}
