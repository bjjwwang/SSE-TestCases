#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
 
int main() {    
    FILE* fptr = fopen("test", "r");
    if(fptr != NULL) {
        fseek(fptr, 0L, SEEK_END);
        long count = ftell(fptr);
        fseek(fptr, 0L, SEEK_SET);
        char* buf = malloc(1000);
        fread(buf, sizeof(char), count, fptr); //TP, potential buffer overflow when reading file
    }
}
