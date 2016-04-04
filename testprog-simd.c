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
#if 1
    int d = 0;
    for (i = 0; i < n*n; i += 4) {
        simd128 s0, s1;
        simd128 v0, v1;
        simd128 zero = { 0, 0, 0, 0 };

        simd128_load(s0, &(init_data[d]));
        simd128_load(s1, &(init_data[d+4]));

        v0[0] = s0[0];
        v1[0] = s0[1];
        v0[1] = s0[2];
        v1[1] = s0[3];
        v0[2] = s1[0];
        v1[2] = s1[1];
        v0[3] = s1[2];
        v1[3] = s1[3];

        simd128_store(v0, &(a[i]));
        simd128_store(v1, &(b[i]));
        simd128_store(zero, &(c[i]));

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
    for(y = 0; y < n; y += 4) {
        for(x = 0; x < n; x += 4) {
//            static int mm[4][4];
//            int ix, iy;
            int i;
            simd128 mm0, mm1, mm2, mm3;

            /* clear temporary sub-matrix */
            for (i = 0; i < 4; i++)
                mm0[i] = mm1[i] = mm2[i] = mm3[i] = 0;

            /* calc 4x4 sub-matrix */
            for (i = 0; i < n; i++) {
#if 1
                int v0, v1, v2, v3;

                v0 = a[n*(y+0) + i];
                v1 = a[n*(y+1) + i];
                v2 = a[n*(y+2) + i];
                v3 = a[n*(y+3) + i];

                simd128 t;
                simd128 hi, lo;

                simd128_load(t, &b[n*i + x]);

                simd128_mult_scalar(hi, lo, t, v0);
                simd128_add(mm0, mm0, lo);

                simd128_mult_scalar(hi, lo, t, v1);
                simd128_add(mm1, mm1, lo);

                simd128_mult_scalar(hi, lo, t, v2);
                simd128_add(mm2, mm2, lo);

                simd128_mult_scalar(hi, lo, t, v3);
                simd128_add(mm3, mm3, lo);

/*
                int v0, v1, v2, v3;
                int u0, u1, u2, u3;

                v0 = a[n*(y+0) + i];
                v1 = a[n*(y+1) + i];
                v2 = a[n*(y+2) + i];
                v3 = a[n*(y+3) + i];

                u0 = b[n*i + x+0];
                u1 = b[n*i + x+1];
                u2 = b[n*i + x+2];
                u3 = b[n*i + x+3];

                mm[0][0] += v0 * u0;
                mm[0][1] += v0 * u1;
                mm[0][2] += v0 * u2;
                mm[0][3] += v0 * u3;

                mm[1][0] += v1 * u0;
                mm[1][1] += v1 * u1;
                mm[1][2] += v1 * u2;
                mm[1][3] += v1 * u3;

                mm[2][0] += v2 * u0;
                mm[2][1] += v2 * u1;
                mm[2][2] += v2 * u2;
                mm[2][3] += v2 * u3;

                mm[3][0] += v3 * u0;
                mm[3][1] += v3 * u1;
                mm[3][2] += v3 * u2;
                mm[3][3] += v3 * u3;
*/
#else
                for (iy = 0; iy < 4; iy++)
                    for (ix = 0; ix < 4; ix++)
                        mm[iy][ix] +=
                            a[n*(y+iy) + i] * b[n*i + x+ix];
#endif
            }

            /* write temporary sub-matrix to main-matrix */
#if 1
            simd128_store(mm0, &c[n*(y  ) + x]);
            simd128_store(mm1, &c[n*(y+1) + x]);
            simd128_store(mm2, &c[n*(y+2) + x]);
            simd128_store(mm3, &c[n*(y+3) + x]);
#else
            for (iy = 0; iy < 4; iy++)
                for (ix = 0; ix < 4; ix++)
                    c[n*(y+iy) + (x+ix)] = mm[iy][ix];
#endif
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
        simd128 s0, s1;
        int *p = &c[n*y + n-8];

        simd128_load(s0, p);
        simd128_load(s1, p+4);

        printf("%08x %08x %08x %08x ",
               s0[0], s0[1], s0[2], s0[3]);
        printf("%08x %08x %08x %08x ",
               s1[0], s1[1], s1[2], s1[3]);

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
