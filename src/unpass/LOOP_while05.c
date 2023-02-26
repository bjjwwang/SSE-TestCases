#include "stdbool.h"
// CHECK: ^sat$

extern int nd(void);

extern void svf_assert(bool);

int main(){
    int x,y;
    x=1; y=1;
    while(nd()) {
        if (nd()) {
            x++;
            y++;
            svf_assert (x == y);
        }
        if (nd()) {
            x++;
        }
    }

    return 0;
}