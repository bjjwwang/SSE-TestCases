
typedef unsigned char    UINT8;
typedef unsigned short   UINT16;
typedef unsigned int     UINT32;

#define CORT_ALLOC_MAX_BEAM_NUM_PER_TTI 8
#define L2_OK 0
#define L2_ERR 1
#define L2_NULL_PTR    0

typedef enum {
    L2_TRX_NUM_1 = 1,
    L2_TRX_NUM_2 = 2,
    L2_TRX_NUM_4 = 4,
    L2_TRX_NUM_8 = 8,
    L2_TRX_NUM_32 = 32,
    L2_TRX_NUM_64 = 64,
} L2TrxNumEnum;

typedef struct {
    UINT16 beamId;
    UINT8 beamIndex;
    UINT8 userNum;
    UINT8 ignoreReason;
    bool calcTbsizeBeam;
    UINT16 userId;

    UINT16 userList[CORT_ALLOC_MAX_BEAM_NUM_PER_TTI];

    UINT8 beamTrxOnePola;
    UINT8 rsvd[7];
} CortTbsizeNeedInfo;

typedef struct {
    UINT8 trxNumOnePola;
    UINT8 rsv[3];
    UINT32 tbSize;
    CortTbsizeNeedInfo beamList[CORT_ALLOC_MAX_BEAM_NUM_PER_TTI];
} CortTbsizeBeamList;

/*
* @Scene: 数组缓冲区上溢出
* @SubScene: 内层for循环的数组使用外层for循环索引越界
*/
static UINT32 test_bad_19(CortTbsizeBeamList *suInfo)
{
    if (suInfo == L2_NULL_PTR) {
        return L2_ERR;
    }
    UINT8 beamIndexMap[L2_TRX_NUM_4] = { 0, 0, 0, 0 };
    UINT8 usedTrxBitmap = 0;
    UINT8 loopArr[L2_TRX_NUM_4];
    UINT8 allBeamTrx = 0;
    for (UINT8 beamIndex = 0; beamIndex < CORT_ALLOC_MAX_BEAM_NUM_PER_TTI; ++beamIndex) {
        CortTbsizeNeedInfo *info = &(suInfo->beamList[beamIndex]);
        UINT8 needTrxLeftPolaNum = info->beamTrxOnePola;
        allBeamTrx += needTrxLeftPolaNum;
        UINT8 poleTrxMax = L2_TRX_NUM_4;
        for (UINT8 index = 0; index < poleTrxMax; ++index) {
            usedTrxBitmap |= loopArr[index];
            /* POTENTIAL FLAW: beamIndex超出数组beamIndexMap上界，漏报 */
            beamIndexMap[beamIndex] = loopArr[index];
        }
    }
    return L2_OK;
}