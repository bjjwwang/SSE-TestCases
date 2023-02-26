#include <stdio.h>
extern int bsGetBit(char* argv);
int main(int argc, char** argv) {
    int      bitsRead, buffHi, buffLo, blockCRC, currBlock;
    char str[60];

    int bStart [35];
    int bEnd [35];
    bitsRead = 0;
    buffHi = buffLo = 0;
    currBlock = 0;
    bStart[currBlock] = 0;
    bsIn = bsOpenReadStream ( inFile );
    while (1) {
        int b = bsGetBit(argv[0]);
        bitsRead++;
        currBlock++;
        if (b == 2) {
            if (bitsRead < -1000) {
                bEnd[currBlock] = bitsRead - 49;
                break;
            } else {
                bEnd[currBlock] = 0;
            }
        }
    }
    svf_assert(1);
}