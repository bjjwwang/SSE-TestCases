//
// Created by Jiawei Wang on 3/2/23.
//
#include <stdio.h>
void CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad()
{
    int buffer[10] = { 0 };
    int* data;
    int a, b;
    data = &a;
    a = 3;
    buffer[*data] = 1;
}

void CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_good()
{
    int buffer[10] = { 0 };
    int* data;
    int a, b;
    data = &a;
    a = 10;
    buffer[*data] = 1;
}

int main() {
    void (*fun_ptr)() =  &CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad;
    (*fun_ptr)();
}