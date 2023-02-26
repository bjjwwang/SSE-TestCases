#include "stdbool.h"
extern void svf_assert(bool);
int funcB(int b);
int funcA(int a) {
   if (a <= 0) {
       return 0;
   }
   return funcB(a - 1)+ 1;
}
int funcB(int b) {
    if (b <= 0) {
        return 0;
    }
    return funcA(b-1) + 1;
}

int main() {
    int a  = funcA(3);
    svf_assert(a ==3);
}