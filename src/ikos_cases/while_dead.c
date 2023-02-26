#include <stdio.h>

int main() {
    int i = 0;
    while(1) {
        ++i;
    }
    svf_assert(i == 10);
}