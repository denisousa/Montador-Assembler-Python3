
#include <stdio.h>

#include <string.h>
#include <stdint.h>


void print_bits(uint32_t n)
{
  int i;
  for(i=31;i>=0;i--) {
    if (n & (1 << i))  // if there's a 1 in the current position
      printf("1");
    else 
      printf("0");
    if ((i%8) == 0) printf(" ");
  }
  printf("\n");
}

void print_bits_no_newline(uint32_t n)
{
  int i;
  for(i=31;i>=0;i--) {
    if (n & (1 << i))  // if there's a 1 in the current position
      printf("1");
    else 
      printf("0");
    if ((i%8) == 0) printf(" ");
  }
}

void print_bits64(uint64_t n)
{
  uint32_t *p = (uint32_t *) &n;
  print_bits_no_newline(*(p+1));
  printf(" ");
  print_bits(*p);
  
}
