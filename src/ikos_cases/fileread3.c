#include <stdio.h>
typedef  unsigned int   UInt32;
typedef  int            Int32;
typedef  unsigned char  UChar;
typedef  char           Char;
typedef  unsigned char  Bool;

typedef struct {
    FILE*  handle;
    Int32  buffer;
    Int32  buffLive;
    Char   mode;
} BitStream;

static BitStream* bsOpenReadStream ( FILE* stream )
{
    BitStream *bs = malloc ( sizeof(BitStream) );
    if (bs == NULL) mallocFail ( sizeof(BitStream) );
    bs->handle = stream;
    bs->buffer = 0;
    bs->buffLive = 0;
    bs->mode = 'r';
    return bs;
}

static Int32 bsGetBit ( BitStream* bs )
{
    if (bs->buffLive > 0) {
        bs->buffLive --;
        return ( ((bs->buffer) >> (bs->buffLive)) & 0x1 );
    } else {
        Int32 retVal = getc ( bs->handle );
        if ( retVal == EOF ) {
            return 2;
        }
        bs->buffLive = 7;
        bs->buffer = retVal;
        return ( ((bs->buffer) >> 7) & 0x1 );
    }
}


int main(int argc, char** argv) {
    Char inFileName[35];
    Int32 bStart [35];
    FILE*       inFile;
    FILE*       outFile;
    Int32  b;
    BitStream*  bsIn, *bsWr;
    UInt32      bitsRead, buffHi, buffLo, blockCRC, currBlock;
    char str[60];

    inFile = fopen ( inFileName, "rb" );
    if (inFile == NULL) {
        exit(1);
    }
    bsIn = bsOpenReadStream ( inFile );

    bitsRead = 0;
    buffHi = buffLo = 0;
    currBlock = 0;
    bStart[currBlock] = 0;
    while (1) {
        b = bsGetBit(bsIn);
        bitsRead++;
        if (b == 2) {
            if (bitsRead >= bStart[currBlock] &&
                (bitsRead - bStart[currBlock]) >= 40) {
                break;
            }
        }
        currBlock++;
    }
    svf_assert(1);
}