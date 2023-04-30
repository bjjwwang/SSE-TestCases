
#include <string.h>

void TestBadCase01()
{
    char src[10] = "123456789";
    char dest[5] = {0};
    /* POTENTIAL FLAW: 字符串拷贝：源字符串长度大于目标字符串长度 */
    int ret = strncpy_s(dest, sizeof(dest), src, strlen(src));
    if (ret != 0) {
        return;
    }
}
