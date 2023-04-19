

typedef struct Flts {
    unsigned char uc1;
    unsigned char uc2;
    unsigned short us;
    unsigned char arr[100];
} Flts;
enum {
    INDEX_A = 100,
    INDEX_END
};
Flts g_data[INDEX_A] = {0};

void Init(Flts *p)
{
    p[INDEX_END].uc1 = 0;
}
/*
 * @scene：全局变量是静态数组类型，数组访问越界
 * @subscene：跨函数越界
 */
void OverrunGlobalArrayBadCase02()
{
    /* POTENTIAL FLAW: 数组访问越界 */
    Init(g_data);
}