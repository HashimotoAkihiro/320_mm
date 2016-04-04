/***************************************************************************/
/* The 2nd ARC/CPSY/RECONF High-Performance Computer System Design Contest */
/* 320mm Version 2014-06-06                                                */
/***************************************************************************/

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "crc.h"

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
#if 1
    int d = 0;
    for (i = 0; i < n*n; i += 4) {
        int v0, v1, v2, v3, v4, v5, v6, v7;

        v0 = init_data[d  ];
        v1 = init_data[d+1];
        v2 = init_data[d+2];
        v3 = init_data[d+3];
        v4 = init_data[d+4];
        v5 = init_data[d+5];
        v6 = init_data[d+6];
        v7 = init_data[d+7];

        a[i]   = v0;
        b[i]   = v1;
        a[i+1] = v2;
        b[i+1] = v3;
        a[i+2] = v4;
        b[i+2] = v5;
        a[i+3] = v6;
        b[i+3] = v7;

        c[i]   = 0;
        c[i+1] = 0;
        c[i+2] = 0;
        c[i+3] = 0;

        d = (d + 8) % (64*1024);
    }
#else
    int d = 0;
    for(y=0; y<n; y++) {
        for(x=0; x<n; x++) {
            a[n*y+x] = init_data[d     % (64*1024)];
            b[n*y+x] = init_data[(d+1) % (64*1024)];
            c[n*y+x] = 0;
            d +=2;
        }
    }
#endif
    
    /* -----  main kernel ----- */ 
#if 1
    static int mm[4][4];
    for(y = 0; y < n; y += 4) {
        for(x = 0; x < n; x += 4) {
            int ix, iy;

            /* clear temporary sub-matrix */
            for (iy = 0; iy < 4; iy++)
                for (ix = 0; ix < 4; ix++)
                    mm[iy][ix] = 0;

            /* calc 4x4 sub-matrix */
            for (i = 0; i < n; i++) {
#if 1
                int v0, v1, v2, v3;

                v0 = a[n*(y+0) + i];
                v1 = a[n*(y+1) + i];
                v2 = a[n*(y+2) + i];
                v3 = a[n*(y+3) + i];

                mm[0][0] += v0 * b[n*i + x+0];
                mm[0][1] += v0 * b[n*i + x+1];
                mm[0][2] += v0 * b[n*i + x+2];
                mm[0][3] += v0 * b[n*i + x+3];

                mm[1][0] += v1 * b[n*i + x+0];
                mm[1][1] += v1 * b[n*i + x+1];
                mm[1][2] += v1 * b[n*i + x+2];
                mm[1][3] += v1 * b[n*i + x+3];

                mm[2][0] += v2 * b[n*i + x+0];
                mm[2][1] += v2 * b[n*i + x+1];
                mm[2][2] += v2 * b[n*i + x+2];
                mm[2][3] += v2 * b[n*i + x+3];

                mm[3][0] += v3 * b[n*i + x+0];
                mm[3][1] += v3 * b[n*i + x+1];
                mm[3][2] += v3 * b[n*i + x+2];
                mm[3][3] += v3 * b[n*i + x+3];
#else
                for (iy = 0; iy < 4; iy++)
                    for (ix = 0; ix < 4; ix++)
                        mm[iy][ix] +=
                            a[n*(y+iy) + i] * b[n*i + x+ix];
#endif
            }

            /* write temporary sub-matrix to main-matrix */
            for (iy = 0; iy < 4; iy++)
                for (ix = 0; ix < 4; ix++)
                    c[n*(y+iy) + (x+ix)] = mm[iy][ix];
        }
    }

/*
    for(y = 0; y < n; y++) {
        for(x = 0; x < n; x++) {
            int s = 0;
            for(i = 0; i < n; i++)
                s += a[n*y+i] * b[n*i+x];
            c[n*y+x] = s;
        }
    }
*/
#else
    for(y = 0; y < n; y++) {
        for(x = 0; x < n; x++) {
            for(i = 0; i < n; i++) {
                c[n*y+x] += a[n*y+i] * b[n*i+x];
            }
        }
    }
#endif

    /* -----  show result ----- */
    printf("\n");
#if 1
    for(y = n-8; y<n; y++) {
        int v0, v1, v2, v3, v4, v5, v6, v7;
        int *p = &c[n*y + n-8];

        v0 = *(p + 0);
        v1 = *(p + 1);
        v2 = *(p + 2);
        v3 = *(p + 3);

        v4 = *(p + 4);
        v5 = *(p + 5);
        v6 = *(p + 6);
        v7 = *(p + 7);

        printf("%08x %08x %08x %08x ",
               v0, v1, v2, v3);
        printf("%08x %08x %08x %08x ",
               v4, v5, v6, v7);

        printf("\n");
    }
#else
    for(y = n-8; y<n; y++) {
        for(x = n-8; x<n; x++) {
            printf("%08x ", c[n*y+x]);
        }
        printf("\n");
    }
#endif

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
