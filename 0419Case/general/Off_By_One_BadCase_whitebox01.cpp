
#define MAX_LEN 256

typedef struct {
	char item[MAX_LEN];
} TestOffByOne;

typedef struct {
	int cnt;
    int num;
} Cnt;

/*
* @Scene: 数组索引由外部输入相关，访问时未做校验或校验不足
*/
void Off_By_One_BadCase_whitebox01(Cnt &param)
{
    int cnt = param.cnt;
    TestOffByOne test = {0};
    for (int i = 0; i < param.num; i++) {
        /* POTENTIAL FLAW:数组下标校验不准确，发生off-by-one溢出 */
        if (cnt > MAX_LEN) {
            break;
        }
        test.item[cnt] = '\0';
        cnt++;
    }
}