
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "securec.h"


typedef unsigned char UCHAR;
typedef unsigned long ULONG;
typedef unsigned short USHORT;
typedef void VOID;

typedef enum EnuOoooMsgType {
    OOOO_PRO_ACTIONS_CREATE             = 4,
    OOOO_PRO_ACTIONS_SET                = 8
} OoooProMsgTypeEnu;

typedef enum EnuOoooEntityType {
    OOOO_PRO_ME_IP_STATIC_ROUTES_TAG =  75,
     OOOO_PRO_ME_ENTITY_MAX = 399
} OoooProMeTypeEnu;



typedef union TagOoooProTcIdField {
    USHORT usTcId;
    struct {
        USHORT usSn : 15;
        USHORT usPri : 1;
    }stTcId;
}OoooProTcidFieldU;


typedef union TagOoooProMsgTypeFiled {
    UCHAR ucMsgType;

    struct {
        UCHAR ucMt : 5;
        UCHAR ucAk : 1;
        UCHAR ucAr : 1;
        UCHAR ucDb : 1;
    }stMsgType;
}OoooProMsgTypeFieldU;

typedef struct TagOoooProMsgHead {
    OoooProTcidFieldU uTcid;
    OoooProMsgTypeFieldU uMsgType;
    UCHAR  ucDeviceId;
    USHORT usEntityclass;
    UCHAR  ucInstanceH;
    UCHAR  ucInstanceL;
}OoooProMsgHeadStru;
#define OOOO_PRO_GET_MSG_MT(pMsg)       ((OoooProMsgHeadStru*)(pMsg))->uMsgType.stMsgType.ucMt


typedef struct TagOoooAttInfo {
    USHORT usAttSize;
    USHORT usOffset;
    struct {
        UCHAR ucSupportFlag : 4;
        UCHAR ucOperateAtt : 4;
    } stSupportFlag;
} OoooAttInfoStru;
#define OOOO_MAX_PORT_NUM                        2
#define OOOO_PRO_MAX_ATTRIBUTE       16
#define OOOO_PRO_MAX_ATT_INC_ME      (OOOO_PRO_MAX_ATTRIBUTE + 1)
OoooAttInfoStru g_astAttInfo[OOOO_MAX_PORT_NUM][OOOO_PRO_ME_ENTITY_MAX][OOOO_PRO_MAX_ATT_INC_ME];

#define OOOO_ATT_GET_LEN(ulPortId, usEntityID, ucAttID) \
    (g_astAttInfo[ulPortId][usEntityID][ucAttID].usAttSize)


#define OOOO_PRO_MSG_CONTENT_LEN     32
typedef struct TagOmciProMsgSet {
    UCHAR  aucMsgContent[OOOO_PRO_MSG_CONTENT_LEN - 2];
}OoooProMsgSetStru;
#define OOOO_PRO_GET_SETMSG_CONTENT(pMsg) ((OoooProMsgSetStru*)(pMsg))->aucMsgContent


/*
 * @Scene： 只对一个整形取了地址，然后传掉给函数，然后其用memcpy_s参数时，参数可能超长
 */
void OoooXxxGetAttByMsgSeq(ULONG ulPortId, void *pInOoooMsg, UCHAR ucAttSeq, void *pOutAtt)
{
    UCHAR   *pucMsgContent = 0;
    USHORT  usMe;
    USHORT  usConvertId;
    USHORT  usAttOffset = 0;
    USHORT  usAttSize;
    UCHAR   ucMsgType;


    ucMsgType = OOOO_PRO_GET_MSG_MT(pInOoooMsg);

    switch (ucMsgType) {
        case OOOO_PRO_ACTIONS_CREATE:
            usAttSize = OOOO_ATT_GET_LEN(ulPortId, usConvertId, ucAttSeq);
            break;

        case OOOO_PRO_ACTIONS_SET:
            pucMsgContent = OOOO_PRO_GET_SETMSG_CONTENT(pInOoooMsg);
            usAttOffset = 0;
            usAttSize = OOOO_ATT_GET_LEN(ulPortId, usConvertId, ucAttSeq);

            if (OOOO_PRO_ME_IP_STATIC_ROUTES_TAG == usMe) {
                usAttSize = 21;     // event: usAttSize参数的值可能超长
            }

            break;
        default:
            break;
    }

    /* 填写输出内容 */
    if (0 != pucMsgContent) {
        /* POTENTIAL FLAW: 只对一个整形取了地址，然后传掉给函数，然后其用memcpy_s参数时，usAttSize参数可能为21，参数可能超长 */
        memcpy_s(pOutAtt, usAttSize, pucMsgContent + usAttOffset, usAttSize);
    } else {

    }
}

#define OOOO_ME_ANIG_SF_THRESHOLD             6

void OoooMyInvoke(ULONG ulPortId, void *pInOoooMsg)
{
    UCHAR   ucXxThreshold        = 0;

    OoooXxxGetAttByMsgSeq(ulPortId, pInOoooMsg,  OOOO_ME_ANIG_SF_THRESHOLD,  &ucXxThreshold);
}

int main(int argc, char *argv[])
{
    if (argc < 3) {
        return 0;
    }

    OoooMyInvoke(argc, argv[2]);
    return 0;
}
