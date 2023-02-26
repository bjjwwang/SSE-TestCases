#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "stdbool.h"
extern void bug_assert(bool);
char cTestData[4] = {0};
int main()
{
    char testDigestBuffer[2] = {0};
    /* POTENTIAL FLAW: buffer_size: You might overrun the 2 byte destination string "testDigest.t.buffer" by writing
     * the maximum 4 bytes from "c_testData"  */
    memcpy((void *)testDigestBuffer, (void *)cTestData, sizeof(cTestData));
}
