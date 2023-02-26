//
// Created by Jiawei Wang on 6/30/22.
//
#include "stdbool.h"
extern void svf_assert(bool);

#define ALLOCA alloca

int main() {
    int* p = (int *)ALLOCA((4)*sizeof(int));
    p[5] = 1;

    int a[10];
    p = &a[11];
}
