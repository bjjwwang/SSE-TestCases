#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int main() {
    char buffer[4];  
    scanf("%3s", buffer);
    if(!strcmp(buffer, "abc")) {
        buffer[4] = 'a'; //TP
    }
}
