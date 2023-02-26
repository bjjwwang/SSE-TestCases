#include <stdio.h>

int main(int argc, char** argv) {
    FILE *fptr;
    fptr = fopen(argv[0], "r");
    char str[60];
    if(fptr == NULL)
    {
        svf_assert(fptr==NULL);
        exit(1);
    }
    if( fgets (str, 60, fptr)!=NULL ) {
        /* writing content to stdout */
        puts(str);
    }
    int bitsRead = strlen(str);


}