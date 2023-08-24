/*
 * First KLEE tutorial: testing a small function
 */
#include <stdio.h>
#include "klee/klee.h"

int get_sign(int x) {
  if (x == 0)
     return 0;

  if (x < 0)
     return -1;
  else
     return 1;
}

int add(int a, int b){
    if (a > 0) return 1;
    if (a < 0){
        if (b > 0) return 2;
        else return 3;
    }
    return 4;
}

int compare(int a, int b){
    if (a > b) return 1;
    else if (a == b) return 2;
    else return 3;
}

int func(int a, int b){
    if (a > b)
        return 1;
    return 2;
}

int main() {
  int a, b, c, d, e, f, g;
  //printf("hello\n");
  klee_make_symbolic(&a, sizeof(a), "a");
  klee_make_symbolic(&b, sizeof(a), "b");
  klee_make_symbolic(&c, sizeof(a), "c");
  klee_make_symbolic(&d, sizeof(a), "d");
  klee_make_symbolic(&e, sizeof(a), "e");
  klee_make_symbolic(&f, sizeof(a), "f");
  klee_make_symbolic(&g, sizeof(a), "g");

  a = a + 100;
  if (a == -1024)
      printf("a = %d\n", a);
  /*
  int ret1 = get_sign(a);
  int ret2 = add(b,c);
  int ret3 = compare(d, e);
  int ret4 = func(f, g);
  klee_print_expr("test", a);
  */
  return 0;
}
