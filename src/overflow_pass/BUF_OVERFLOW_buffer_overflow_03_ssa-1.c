/*
Program description: In this program, source is copied onto data with memmove() with the inclusion of a terminating character and data is printed out

Vulnerability and consequence: However, the storage size for dataBadBuffer is equal to 10 characters, but source is equal to 11 characters (10 characters plus the terminating character), thus causing a stack buffer overflow when copied to dataBadBuffer

The vulnerability triggers in the following lines:
memmove(data, source, (strlen(source) + 1) * sizeof(char));

Mitigation: To make this program safe to run, ensure that dataBadBuffer can hold at least the number of characters in source and consider the addition of a terminating character from source when performing string copies (if there is a terminating character, storage size needs to be at least string length + 1)
*/

#include "stdbool.h"
extern void svf_assert(bool);
#define ALLOCA alloca

int main() {
	int dataMemorySize = 10;
	char * data = (char *)ALLOCA(dataMemorySize);
	char source[10 + 1] = {'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', '\0'}; //include terminating character
	memmove(data, source, 11);
	return 0;
}