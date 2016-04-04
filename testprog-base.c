/***************************************************************************/
/* The 2nd ARC/CPSY/RECONF High-Performance Computer System Design Contest */
/* 320mm Version 2014-06-06                                                */
/***************************************************************************/

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "crc.h"
#include "../lib/simd-emu.c"

#define SIZE (64*1024) 

unsigned int init_data[SIZE]; // 256KB
unsigned int *init_n = init_data + SIZE-1;

void setup_data()
{
    FILE *fp;
    fp = fopen("320mm.dat", "rb");
    if (fp == NULL) {
        printf("fail to open file\n");
        exit(1);
    }
    
    fread(init_data, sizeof(unsigned int), SIZE, fp);

    fclose(fp);
}

int main(void)
{
    setup_data();

    int n = *init_n;
#if 0
    unsigned long crc_table[256];
    make_crc32_table(crc_table);
#else
#include "crc32table.c"
#endif

    printf("mm n=%d\n", n);
    
    int *a = malloc(0x100000);
    int *b = malloc(0x100000);
    int *c = malloc(0x100000);

    assert(a != NULL && b != NULL && c != NULL);

    int y,x,i;
    
    /* ----- Initialize ----- */
    int d = 0;
    for(y=0; y<n; y++) {
        for(x=0; x<n; x++) {
            a[n*y+x] = init_data[d     % (64*1024)];
            b[n*y+x] = init_data[(d+1) % (64*1024)];
            c[n*y+x] = 0;
            d +=2;
        }
    }
    
    /* -----  main kernel ----- */ 
    for(y = 0; y < n; y++) {
        for(x = 0; x < n; x++) {
            for(i = 0; i < n; i++) {
                c[n*y+x] += a[n*y+i] * b[n*i+x];
            }
        }
    }

    /* -----  show result ----- */
    printf("\n");
    for(y = n-8; y<n; y++) {
        for(x = n-8; x<n; x++) {
            printf("%08x ", c[n*y+x]);
        }
        printf("\n");
    }

    unsigned long sum = 0;
    for(y = 0; y < n; y++) {
        for(x = 0; x < n; x++) {
            //sum += c[n*y+x];
            sum = update_crc32(sum, c[n*y+x], crc_table);
        }
    }
    printf("%08lx\n", sum);

    return 0;
}
/**********************************************************************/
