#include "stdbool.h"
extern void svf_assert(bool);
#include <assert.h>
#include <stdlib.h>
#include <ctype.h>

int main() {
    int counter = 0;
    for (int i = 0; i <= 127; i++) {
        if(ispunct(i)) {
			counter++;
		}
    }
	svf_assert(counter == 32);
}
