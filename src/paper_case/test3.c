//
// Created by Jiawei Wang on 3/2/23.
//
#include <stdio.h>
void CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad()
{
    int* data;
    int a;
    data = &a;
    /* Initialize data */
    *data = 3;
    int buffer[10] = { 0 };
    /* POTENTIAL FLAW: Attempt to write to an index of the array that is above the upper bound
    * This code does check to see if the array index is negative */
    a = 10;
    if (*data >= 0)
    {
        buffer[*data] = 1;
    }
}

int main() {
    CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad();
}