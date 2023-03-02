//
// Created by Jiawei Wang on 3/2/23.
//
#include <stdio.h>
void CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad()
{
    int* data;
    int a, b;
    data = &a;
    /* Initialize data */
    *data = 3;
    /* POTENTIAL FLAW: Read data from the console using fscanf() */
    fscanf(stdin, "%d", &b);
    {
        int buffer[10] = { 0 };
        /* POTENTIAL FLAW: Attempt to write to an index of the array that is above the upper bound
        * This code does check to see if the array index is negative */
        data = &b;
        if (*data >= 0)
        {
            buffer[*data] = 1;
        }
        else
        {
            printLine("ERROR: Array index is negative.");
        }
    }
}

int main() {
    CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad();
}