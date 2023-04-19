
#define MAX_LEN 3
#define NULL_FLAG 0xFFFFFFFF

typedef struct {
	char item[MAX_LEN];
} TestOverRun;

typedef struct {
    int num;
} Cnt;

/*
* @Scene: 数组索引由其他函数返回，访问时校验不正确
*/

static int g_schedualGroup[MAX_LEN] = {0};

int GetLoopNum(int index)
{
    for (int loop = 0; loop < MAX_LEN; loop++) {
        if (g_schedualGroup[loop] == index) {
            return loop;
        }
    }
    return NULL_FLAG;
}

void OverRun_BadCase_whitebox02(Cnt &param)
{
    TestOverRun test = {0};
    int num = param.num;
    int loop;
    for (int i = 0; i < MAX_LEN; i++) {
        loop = GetLoopNum(num);
        if (loop < MAX_LEN) {
            test.item[loop] = '\0';
        }
        /* POTENTIAL FLAW:数组下标校验不准确，发生缓冲区越界 */
        test.item[loop] = 'a';
    }
}