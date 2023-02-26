#include <stdio.h>

int main(int argc, char** argv) {
    FILE *fptr;
    fptr = fopen(argv[0], "r");
    if(fptr == NULL)
    {
        svf_assert(fptr==NULL);
        exit(1);
    }
    svf_assert(fptr!=NULL);

    char str[60];

}