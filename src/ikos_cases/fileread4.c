// /Users/jiaweiwang/CLionProjects/1018/bzip2/bzip2recover.bc
#include <stdio.h>
typedef  unsigned int   UInt32;
typedef  int            Int32;
typedef  unsigned char  UChar;
typedef  char           Char;
typedef  unsigned char  Bool;
#define BLOCK_HEADER_HI  0x00003141UL
#define BLOCK_HEADER_LO  0x59265359UL

#define BLOCK_ENDMARK_HI 0x00001772UL
#define BLOCK_ENDMARK_LO 0x45385090UL

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
            return 10000;
        }
        bs->buffLive = 7;
        bs->buffer = retVal;
        return ( ((bs->buffer) >> 7) & 0x1 );
    }
}


int main(int argc, char** argv) {
    Char inFileName[35];
    Int32 bStart [35];
    Int32 bEnd [35];
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
                (bitsRead - bStart[currBlock]) >= 40)
                bEnd[currBlock] = bitsRead-1;
            else
                currBlock--;
            break;
        }
        currBlock++;
        buffHi = (buffHi << 1) | (buffLo >> 31);
        buffLo = (buffLo << 1) | (b & 1);
        if ( ( (buffHi & 0x0000ffff) == BLOCK_HEADER_HI  && buffLo == BLOCK_HEADER_LO)||
             ( (buffHi & 0x0000ffff) == BLOCK_ENDMARK_HI && buffLo == BLOCK_ENDMARK_LO))
        {
            if (bitsRead < -1000)
            {
                bEnd[currBlock] = bitsRead-49;
            } else {
                bEnd[currBlock] = 0;
            }
        }
    }
    svf_assert(1);
}