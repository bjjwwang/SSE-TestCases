#include "stdbool.h"
// CHECK: ^sat$

extern int nd(void);

extern void svf_assert(bool);

int main(){
    int x,y;
    x=1; y=1;
    int n;
    n = 3;
    while(n) {
        if (n) {
            x++;
            y--;
        }
        n--;
    }
    svf_assert( (x+y) == 2);
    return 0;
}
