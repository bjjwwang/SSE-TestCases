//
// Created by Jiawei Wang on 1/17/22.
//

#include "stdbool.h"
#include <string.h>
extern void svf_assert(bool);

int main() {
    char name[10] = "svf";
    int len = strlen(name);
    svf_assert(len == 3);

    char name2[10] = "sse";
    svf_assert(strcmp(name, name2));
    return 0;
}