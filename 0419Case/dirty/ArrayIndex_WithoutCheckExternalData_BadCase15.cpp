

#include <stdio.h>
#include <string.h>

bool is_url_nrf(const char *url)
{
    if (url == NULL) {
        return false;
    }
    /* POTENTIAL FLAW: Access buffer may be out of bounds */
    return url[2] == 'n' && url[3] == 'r' && url[4] == 'f';
}

void ArrayIndex_WithoutCheckExternalData_GoodCase02()
{
    const char *url = "1";
    bool is_url = is_url_nrf(url);
}
