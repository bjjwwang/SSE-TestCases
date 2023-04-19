

#define VOS_Min(a, b) (((a)<(b))?(a):(b))
#define VOS_Max(a, b) (((a)>(b))?(a):(b))
#define MAX_CFG_SCC_FREQ_NUM 16
typedef struct {
    int data;
} Data;

typedef struct {
    short sccFreqCnt;
    Data dataInfo[MAX_CFG_SCC_FREQ_NUM];
} SccFreqGroupStru;
extern SccFreqGroupStru *getSccFreqGroupInfo();
/*
* @Scene: 数组缓冲区上溢出
* @SubScene: 索引差一越界
*/
bool test_bad_16()
{
    SccFreqGroupStru *combi = getSccFreqGroupInfo();
    int sccFreqCnt = VOS_Min(combi->sccFreqCnt, MAX_CFG_SCC_FREQ_NUM);
    for (int i = 0; i < sccFreqCnt; i++) {
        /* POTENTIAL FLAW: sccFreqCnt超出数组上界，漏报 */
        if(combi->dataInfo[sccFreqCnt].data>0){
            return true;
        }
    }
}