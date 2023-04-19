

struct Flts {
    unsigned char uc1;
    unsigned char uc2;
    unsigned short us;
    unsigned char arr[100];
};
enum {
    INDEX_A = 100,
    INDEX_END
};
Flts g_data[INDEX_A] = {0};
/*
 * @scene：全局变量是静态数组类型，数组访问越界
 * @subscene：函数内越界
 */
void OverrunGlobalArrayBadCase01()
{
    /* POTENTIAL FLAW: 数组访问越界 */
    g_data[INDEX_END].uc1 = 0;
}