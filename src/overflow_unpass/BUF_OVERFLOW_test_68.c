#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

int count = 0;

bool isPalindrome(char* word, int index) {
    count++;
    int length = strlen(word) - (index + 1);
    if (word[index] == word[length]) {
        if (index + 1 == length || index == length) {
            return true;
        }
        isPalindrome(word, index + 1);
    }
	return false;
}
 
int main() {
	int buffer[3];
    char* word1 = "racecar";
	char* word2 = "abba";
	char* currentWord = word1;
	for(int i = 0; i < 2; i++) {  
		isPalindrome(currentWord, 0);
		if(strlen(currentWord) % 2 == 0) {
			//count == strlen(currentWord)/2
			buffer[count] = 1; //FP
		}
		else {
			//count == (strlen(currentWord) + 1)/2;
			buffer[count] = 1; //TP
		}
		count = 0;
		currentWord = word2;
	}
}
