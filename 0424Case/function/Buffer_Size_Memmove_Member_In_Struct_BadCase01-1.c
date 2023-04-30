



#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

struct NCP_MOUNT_DATA {
    int version;
    char mountedVol[17];
};

struct COMPAT_NCP_MOUNT_DATA {
    int version;
    char mountedVol[17];
};

/*
* @Scene: 缓冲区是结构体内，但内存操作函数的长度参数为固定值的缓冲区溢出
*/
static void *TestCaseBad01(void *rawData)
{
    int version = *(unsigned int *)rawData;

    if (version == 3) {
        struct COMPAT_NCP_MOUNT_DATA *cn = rawData;
        struct NCP_MOUNT_DATA *n = rawData;

        /* POTENTIAL FLAW: buffer_size: You might overrun the 17 byte destination string "n->mountedVol" by writing the maximum 29 bytes from "cn->mountedVol" */
        memmove(n->mountedVol, cn->mountedVol, (sizeof(cn->mountedVol) + 3 * sizeof(unsigned int)));
    }
    return NULL;
}

int main() {
    int version = 3;
    TestCaseBad01((void*)&version);
}
