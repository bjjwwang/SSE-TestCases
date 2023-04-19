

#include <stdio.h>

#define MAX_USR_NUM_PER_BEAM 2
#define MAX_BEAM_NUM 8
#define MAX_TIME ((MAX_BEAM_NUM) * (MAX_USR_NUM_PER_BEAM))

typedef struct {
    unsigned int beam[MAX_BEAM_NUM];
} BeamList;

unsigned char OverRun_BadCase_whitebox09(BeamList *info)
{
    if (info == NULL) {
        return 1;
    }
    unsigned char beamCount = 0;
    for (unsigned char index = 0; index < MAX_TIME; ++index) {
        /* POTENTIAL FLAW: buffer size overflow  */
        unsigned int *beamNum = &(info->beam[index]);
        if ((*beamNum) > MAX_USR_NUM_PER_BEAM) {
            beamCount++;
        }
    }
    return beamCount;
}