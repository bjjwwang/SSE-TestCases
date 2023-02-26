//pass

#include <string.h>
#include <stdlib.h>

struct myStruct {
	void * voidSecond;
    char charFirst[4];
};

int main() {
	struct myStruct structCharVoid;
	structCharVoid.voidSecond = (void *)"01234567890123456789";
	memcpy(structCharVoid.charFirst, (char*)structCharVoid.voidSecond, 20); //TP
	structCharVoid.charFirst[sizeof(structCharVoid.charFirst) - 1] = '\0';
}
