
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/*
* @Scene: 指针偏移数值外部可控，未校验或校验不足导致缓冲区溢出
* @SubScene: 缓冲区指针为外部报文，while循环中有两个判断条件校验不充分导致缓冲区溢出
*/
void test_bad_01(const char* pValue)
{
    char *pOut;
    const char* ptr;
    int ulLen = 0;
    ptr = pValue + 1;
    while ((*ptr != '\"') && *ptr) {
        ulLen++;
        if (*ptr++ == '\\') {
            /* POTENTIAL FLAW: THIS WILL SKIP PAST NULL-TERMINATOR  */
            ptr++;
        }
    }
}

/*
* @Scene: 指针偏移数值外部可控，未校验或校验不足导致缓冲区溢出
* @SubScene: 缓冲区指针为外部报文，while循环中有两个判断条件校验不充分导致缓冲区溢出
*/
void test_bad_02(const char* pValue)
{
    char *pOut;
    const char* ptr;
    int ulLen = 0;
    ptr = pValue + 1;
    while ((*ptr != '\"') && *ptr) {
        ulLen++;
        if (*ptr++ == '\\') {
            if (*ptr) {
                ptr++;
            }
            /* POTENTIAL FLAW: THIS WILL SKIP PAST NULL-TERMINATOR */
            ptr++;
        }
    }
}

/*
* @Scene: 指针偏移数值外部可控，未校验或校验不足导致缓冲区溢出
* @SubScene: 缓冲区指针为外部报文，while循环中有一个判断条件和switch判断，校验不充分导致缓冲区溢出
*/
void test_bad_03(const char* pValue)
{
    char *pOut;
    const char* ptr;
    ptr = pValue + 1;
    while (*pValue != '\"') {
        if (*pValue != '\\') {
            /*  THIS WILL SKIP PAST NULL-TERMINATOR */
            *pOut++ = *pValue++;
        } else {
            pValue++;
            switch (*pValue) {
                case 'u':
                return;
            }
        }
    }
}

/*
* @Scene: 指针偏移数值外部可控，未校验或校验不足导致缓冲区溢出
* @SubScene: 缓冲区指针为外部报文，for循环中有一个判断条件，校验不足导致缓冲区溢出
*/
void test_bad_04()
{
    char * ptr;
    char arr[6] = {'1', '2', '3', '4', '5'};
    ptr = arr;
    for (; ptr != NULL; ptr++) {
        if (*ptr++ == 5) {
            /*  THIS WILL SKIP PAST NULL-TERMINATOR */
            ptr++;
        }
    }
}

/*
* @Scene: 指针偏移数值外部可控，未校验或校验不足导致缓冲区溢出
* @SubScene: 缓冲区指针为外部报文，do while循环中有一个判断条件和switch判断，校验不足导致缓冲区溢出
*/
void test_bad_05(const char* pValue)
{
    char *pOut;
    const char* ptr;
    ptr = pValue + 1;
    do {
        if (*pValue != '\\') {
            *pOut++ = *pValue++;
        } else {
            /*  THIS WILL SKIP PAST NULL-TERMINATOR */
            pValue++;
            switch (*pValue) {
                case 'u':
                    return;
            }
        }
    } while (*pValue != '\"');
}

/*
* @Scene: 指针偏移数值外部可控，未校验或校验不足导致缓冲区溢出
* @SubScene: while循环中有一个判断条件校验不足导致缓冲区溢出，while循环后的while循环中有一个判断条件和switch判断，校验不足导致缓冲区溢出
*/
void test_bad_06(const char* pValue)
{
    char *pOut;
    const char* ptr;
    int ulLen = 0;
    ptr = pValue + 1;
    while ((*ptr != '\"') && *ptr) {
        ulLen++;
        if (*ptr++ == '\\') {
            /*  THIS WILL SKIP PAST NULL-TERMINATOR */
            ptr++;
        }
    }
    while (*pValue != '\"') {
        if (*pValue != '\\') {
            *pOut++ = *pValue++;
        } else {
            /*  THIS WILL SKIP PAST NULL-TERMINATOR */
            pValue++;
            switch (*pValue) {
                case 'u':
                return;
            }
        }
    }
}

/*
* @Scene: 指针偏移数值外部可控，未校验或校验不足导致缓冲区溢出
* @SubScene: 缓冲区指针为外部报文，while循环中有两个判断条件，校验不足导致缓冲区溢出
*/
// increment 3 times and did not check each time (2 errors but only alarm once)
void test_bad_07()
{
    const char* pcTmp;
    char* pcStrOut;
    while (*pcTmp != ' ') {
        if (*pcTmp == '"') {
            while (*++pcTmp == ' ') {

            }
        } else if (*pcTmp != ' ') {
          /*  THIS WILL SKIP PAST NULL-TERMINATOR */
          *(pcStrOut++) = *(pcTmp++);
        } else {
            while (*pcTmp == ' ') {
                pcTmp++;
            }
        }
    }
}


int main()
{
    return 0;
}
