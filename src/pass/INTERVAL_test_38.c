//number of recursions
#include "stdbool.h"
extern void svf_assert(bool);
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>  
#include <string.h>

struct testStruct {
    int* a;
};  

int main() {
    int x = -1;
    struct testStruct s1;
    struct testStruct s2;
    s1.a = &x;
    srand(time(0));
    memcpy(&s2, &s1, sizeof(struct testStruct)); //shallow copy
    *(s1.a) = rand() % 10;
    svf_assert(*(s2.a) == *(s1.a) && *(s2.a) >= 0 && *(s2.a)< 10);
}	
