

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>



enum BOOTDEVICE_TYPE {
    BOOT_DEVICE_EMMC
};

enum BOOTDEVICE_TYPE GetBootdeviceType()
{
    return BOOT_DEVICE_EMMC;
}

/*
* @Scene: Strncpy, 缓冲区溢出,错误的传了缓冲长度给source
*/
void TestCaseBad03(const char *str, char *pblkname)
{
    char deviceBlockPath[] = "/dev/block/";
    char devicePathEmmc[] = "mmcblk0p28";
    char devicePathUfs[] = "sdd24";
    enum BOOTDEVICE_TYPE bootDeviceType;

    if ((!pblkname) || (!str)) {
        return;
    }

    bootDeviceType = GetBootdeviceType();
    if (bootDeviceType == BOOT_DEVICE_EMMC) {

        /* POTENTIAL FLAW: buffer_size: Calling "strncpy" with a source string whose length (11 chars) is greater than or equal to the size argument (11) will fail to null-terminate "pblkname" */
        strncpy(pblkname, deviceBlockPath, strlen(deviceBlockPath)); /* unsafe_function_ignore: strncpy */
        strncpy(pblkname + strlen(deviceBlockPath), devicePathEmmc, strlen(devicePathEmmc) + 1); /* unsafe_function_ignore: strncpy */
    } else {
        strncpy(pblkname, deviceBlockPath, strlen(deviceBlockPath)); /* unsafe_function_ignore: strncpy */
        strncpy(pblkname + strlen(deviceBlockPath), devicePathUfs, strlen(devicePathUfs) + 1); /* unsafe_function_ignore: strncpy */
    }
}

int main() {
    char str[] = "abcdefg";
    char pblkname[] = "abcdefg";
    TestCaseBad03(str, pblkname);
    return 0;
}