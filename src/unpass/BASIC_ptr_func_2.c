#include "stdbool.h"
extern void svf_assert(bool);
int a (void);
int b (void);
int c (void);
int d (void);

int main(int argc, char** argv) {
  int (*p) (void);
  int (*q) (void);  

  if (argc == 1) {
      p = a;
      q = c;
  } else {
      p = b;
      q = d;
  }

  int x = p();
  int y = q();

  svf_assert(x >= 5);
  //   svf_assert(y>= 5);    

  // If we resolve based only on types then we cannot prove this one.
  // Using aliasing we should be able to prove it.
  //ssvf_assert(y>= 15);      
  return 0;
}

int a() {return 10;}
int b() {return 5;}
int c() {return 15;}
int d() {return 20;}