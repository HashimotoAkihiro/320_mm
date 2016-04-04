/***************************************************************************/
/* The 2nd ARC/CPSY/RECONF High-Performance Computer System Design Contest */
/* 320mm Version 2014-06-06                                                */
/***************************************************************************/

/* USE_SIMD alternatives
#define USE_SIMD        0    (using SIMD emulation)
#define USE_SIMD        1    (using real SIMD instructions)
*/
#define USE_SIMD        0

#define TRACE_OUT       1

#include "../lib/lib.c"
#include "crc.h"
#if defined USE_SIMD && USE_SIMD == 0
#include "../lib/simd-emu.c"
#endif

/**********************************************************************/
#ifdef __ALTERA__
volatile int *init_data = (int*)0x0c000000;
volatile int *init_n    = (int*)0x0c03fffc;
#define DATA_A 0x0c100000
#define DATA_B 0x0c200000
#define DATA_C 0x0c300000
#else
volatile int *init_data = (int*)0x00040000;
volatile int *init_n    = (int*)0x0007fffc;
#define DATA_A 0x0100000
#define DATA_B 0x0200000
#define DATA_C 0x0300000
#endif

static void simd128_display(simd128 v)
{
    mylib_display_hex(v[3]);    /* HH */
    mylib_display_char('_');
    mylib_display_hex(v[2]);    /* HL */
    mylib_display_char('_');
    mylib_display_hex(v[1]);    /* LH */
    mylib_display_char('_');
    mylib_display_hex(v[0]);    /* LL */
}

/**********************************************************************/
int main(void) {
    
    int n = *init_n;
#if 0
    unsigned long crc_table[256];
    make_crc32_table(crc_table);
#else
#include "crc32table.c"
#endif

    mylib_display_char('m');
    mylib_display_char('m');
    mylib_display_char(' ');
    mylib_display_char('n');
    mylib_display_char('=');
    mylib_display_dec(n);
    mylib_display_newline();
    
    int *a = (int*)DATA_A;
    int *b = (int*)DATA_B;
    int *c = (int*)DATA_C;

    int y,x,i;
    
    /* ----- Initialize ----- */
#ifdef  USE_SIMD

#if USE_SIMD == 0

    int d = 0;
    for (i = 0; i < n*n; i += 4) {
        simd128 s0, s1;
        simd128 v0, v1;
        simd128 zero = { 0, 0, 0, 0 };

        simd128_load(s0, (int*)&(init_data[d]));
        simd128_load(s1, (int*)&(init_data[d+4]));

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

#ifdef  TRACE_OUT
        mylib_display_hex((int)&(a[i]));
        mylib_display_char(':'); mylib_display_char(' ');
        simd128_display(v0);
        mylib_display_newline();

        mylib_display_hex((int)&(b[i]));
        mylib_display_char(':'); mylib_display_char(' ');
        simd128_display(v1);
        mylib_display_newline();
#endif

        d = (d + 8) % (64*1024);
    }

#elif  USE_SIMD == 1

    int d = 0;

    /* zero clear SPR[0] */
    asm volatile (".set   noat\n\t"
                  "psubw  $0,$0,$0\n\t"
                  ".set   at");

    for (i = 0; i < n*n; i += 4) {
        int v0, v1, v2, v3, v4, v5, v6, v7;

        /* load two quadwords onto SPR[1] and SPR[2] */
        asm volatile (".set    noat\n\t"
                      "lq      $1,(%0)\n\t"
                      "lq      $2,16(%0)\n\t"
                      ".set    at\n"
                      : : "r" (&init_data[d]));

        asm volatile (".set    noat\n\t"
                      "nop\n\t"
                      /* read from first qword */
                      "pextw   %0,$1,0\n\t"
                      "pextw   %1,$1,1\n\t"
                      "pextw   %2,$1,2\n\t"
                      "pextw   %3,$1,3\n\t"
                      /* read from second qword */
                      "pextw   %4,$2,0\n\t"
                      "pextw   %5,$2,1\n\t"
                      "pextw   %6,$2,2\n\t"
                      "pextw   %7,$2,3\n\t"
                      ".set    at\n\t"
                      : "=r" (v0), "=r" (v1), "=r" (v2), "=r" (v3),
                        "=r" (v4), "=r" (v5), "=r" (v6), "=r" (v7) :);

        asm volatile (".set    noat\n\t"
                      "pinsw   $3,$0,%0,0\n\t"
                      "pinsw   $4,$0,%1,0\n\t"
                      "nop\n\t"
                      "pinsw   $3,$3,%2,1\n\t"
                      "pinsw   $4,$4,%3,1\n\t"
                      "nop\n\t"
                      "pinsw   $3,$3,%4,2\n\t"
                      "pinsw   $4,$4,%5,2\n\t"
                      "nop\n\t"
                      "pinsw   $3,$3,%6,3\n\t"
                      "pinsw   $4,$4,%7,3\n\t"
                      :
                      : "r" (v0), "r" (v1), "r" (v2), "r" (v3),
                        "r" (v4), "r" (v5), "r" (v6), "r" (v7) );

        /* store three quadwords from SPR[3], SPR[4], SPR[0](==0) */
        asm volatile (".set    noat\n\t"
                      "sq      $0,(%0)\n\t"
                      "sq      $3,(%1)\n\t"
                      "sq      $4,(%2)\n\t"
                      ".set    at\n"
                      : : "r" (&c[i]), "r" (&a[i]), "r" (&b[i]));

        d = (d + 8) % (64*1024);
    }

#else
# error "illegal USE_SIMD setting"
#endif

#else   /* not-defined USE_SIMD */
    /* original code */
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
#ifdef  USE_SIMD

#if USE_SIMD == 0

    for(y = 0; y < n; y += 4) {
        for(x = 0; x < n; x += 4) {
            int i;
            simd128 mm0 = { 0, 0, 0, 0 };
            simd128 mm1 = { 0, 0, 0, 0 };
            simd128 mm2 = { 0, 0, 0, 0 };
            simd128 mm3 = { 0, 0, 0, 0 };

            /* calc 4x4 sub-matrix */
            for (i = 0; i < n; i++) {
                int v0, v1, v2, v3;

                v0 = a[n*(y+0) + i];
                v1 = a[n*(y+1) + i];
                v2 = a[n*(y+2) + i];
                v3 = a[n*(y+3) + i];
#ifdef  TRACE_OUT
                mylib_display_hex((int)&(a[n*(y+0) + i]));
                mylib_display_char(':'); mylib_display_char(' ');
                mylib_display_hex(v0);
                mylib_display_newline();

                mylib_display_hex((int)&(a[n*(y+1) + i]));
                mylib_display_char(':'); mylib_display_char(' ');
                mylib_display_hex(v1);
                mylib_display_newline();

                mylib_display_hex((int)&(a[n*(y+2) + i]));
                mylib_display_char(':'); mylib_display_char(' ');
                mylib_display_hex(v2);
                mylib_display_newline();

                mylib_display_hex((int)&(a[n*(y+3) + i]));
                mylib_display_char(':'); mylib_display_char(' ');
                mylib_display_hex(v3);
                mylib_display_newline();
#endif
                simd128 t;
                simd128 hi, lo;

                simd128_load(t, &b[n*i + x]);
#ifdef  TRACE_OUT
                mylib_display_hex((int)&(b[n*i + x]));
                mylib_display_char(':'); mylib_display_char(' ');
                simd128_display(t);
                mylib_display_newline();
#endif
                simd128_mult_scalar(hi, lo, t, v0);
                simd128_add(mm0, mm0, lo);

                simd128_mult_scalar(hi, lo, t, v1);
                simd128_add(mm1, mm1, lo);

                simd128_mult_scalar(hi, lo, t, v2);
                simd128_add(mm2, mm2, lo);

                simd128_mult_scalar(hi, lo, t, v3);
                simd128_add(mm3, mm3, lo);
            }

            /* write temporary sub-matrix to main-matrix */
            simd128_store(mm0, &c[n*(y  ) + x]);
            simd128_store(mm1, &c[n*(y+1) + x]);
            simd128_store(mm2, &c[n*(y+2) + x]);
            simd128_store(mm3, &c[n*(y+3) + x]);
#ifdef  TRACE_OUT
            mylib_display_hex((int)&c[n*(y  ) + x]);
            mylib_display_char(':'); mylib_display_char(' ');
            simd128_display(mm0);
            mylib_display_newline();

            mylib_display_hex((int)&c[n*(y+1) + x]);
            mylib_display_char(':'); mylib_display_char(' ');
            simd128_display(mm1);
            mylib_display_newline();

            mylib_display_hex((int)&c[n*(y+2) + x]);
            mylib_display_char(':'); mylib_display_char(' ');
            simd128_display(mm2);
            mylib_display_newline();

            mylib_display_hex((int)&c[n*(y+3) + x]);
            mylib_display_char(':'); mylib_display_char(' ');
            simd128_display(mm3);
            mylib_display_newline();
#endif
        }
    }

/* ** test code **
    for(y = 0; y < n; y++) {
        for(x = 0; x < n; x++) {
            int s = 0;
            for(i = 0; i < n; i++)
                s += a[n*y+i] * b[n*i+x];
            c[n*y+x] = s;
        }
    }
*/

#elif USE_SIMD == 1

    /* assuming SPR[0] is cleared to zero */

    for(y = 0; y < n; y += 4) {
        for(x = 0; x < n; x += 4) {
            /* clear temporary sub-matrix */
            asm volatile (".set    noat\n\t"
                          "psubw   $1,$0,$0\n\t"        // SPR[1] = mm0
                          "psubw   $2,$0,$0\n\t"        // SPR[2] = mm1
                          "psubw   $3,$0,$0\n\t"        // SPR[3] = mm2
                          "psubw   $4,$0,$0\n\t"        // SPR[4] = mm3
                          ".set    at\n"
                          : : );

            /* calc 4x4 sub-matrix */
            for (i = 0; i < n; i++) {
                int v0, v1, v2, v3;

                /* load b[i..i+3][x] onto SPR[5] */
                asm volatile (".set    noat\n\t"
                              "lq      $5,(%0)\n\t"     // t = SPR[5]
                              ".set    at\n"
                              : : "r" (&b[n*i + x]));

                v0 = a[n*(y+0) + i];
                v1 = a[n*(y+1) + i];
                v2 = a[n*(y+2) + i];
                v3 = a[n*(y+3) + i];

                asm volatile (".set    noat\n\t"
                              "pmultsw $5,%0\n\t"
                              "pmflo   $6\n\t"
                              "nop\n\t"
                              "nop\n\t"
                              "paddw   $1,$1,$6\n\t"    // mm0 += ...

                              "pmultsw $5,%1\n\t"
                              "pmflo   $6\n\t"
                              "nop\n\t"
                              "nop\n\t"
                              "paddw   $2,$2,$6\n\t"    // mm1 += ...

                              "pmultsw $5,%2\n\t"
                              "pmflo   $6\n\t"
                              "nop\n\t"
                              "nop\n\t"
                              "paddw   $3,$3,$6\n\t"    // mm2 += ...

                              "pmultsw $5,%3\n\t"
                              "pmflo   $6\n\t"
                              "nop\n\t"
                              "nop\n\t"
                              "paddw   $4,$4,$6\n\t"    // mm3 += ...

                              ".set    at\n\t"
                              : : "r" (v0), "r" (v1), "r" (v2), "r" (v3) );

            }

            /* write temporary sub-matrix to main-matrix */
            asm volatile (".set    noat\n\t"
                          "sq      $1,(%0)\n\t"     // store mm0
                          "sq      $2,(%1)\n\t"     // store mm1
                          "sq      $3,(%2)\n\t"     // store mm2
                          "sq      $4,(%3)\n\t"     // store mm3
                          ".set    at\n\t"
                          :
                          : "r" (&c[n*(y  ) + x]),
                            "r" (&c[n*(y+1) + x]),
                            "r" (&c[n*(y+2) + x]),
                            "r" (&c[n*(y+3) + x]) );
        }
    }

#else
# error "illegal USE_SIMD setting"
#endif

#else   /* not-defined USE_SIMD */
    /* original code */
    for(y = 0; y < n; y++) {
        for(x = 0; x < n; x++) {
            for(i = 0; i < n; i++) {
                c[n*y+x] += a[n*y+i] * b[n*i+x];
            }
        }
    }
#endif

    /* -----  show result ----- */
    mylib_display_newline();

#ifdef  USE_SIMD

#if USE_SIMD == 0

    for(y = n-8; y<n; y++) {
        simd128 s0, s1;
        int *p = &c[n*y + n-8];

        simd128_load(s0, p);
        simd128_load(s1, p+4);

        mylib_display_hex(s0[0]);
        mylib_display_char(' ');
        mylib_display_hex(s0[1]);
        mylib_display_char(' ');
        mylib_display_hex(s0[2]);
        mylib_display_char(' ');
        mylib_display_hex(s0[3]);
        mylib_display_char(' ');

        mylib_display_hex(s1[0]);
        mylib_display_char(' ');
        mylib_display_hex(s1[1]);
        mylib_display_char(' ');
        mylib_display_hex(s1[2]);
        mylib_display_char(' ');
        mylib_display_hex(s1[3]);
        mylib_display_char(' ');

        mylib_display_newline();
    }

#elif USE_SIMD == 1

    for(y = n-8; y<n; y++) {
        int v0, v1, v2, v3, v4, v5, v6, v7;
        int *p = &c[n*y + n-8];

        /* load two quadwords onto SPR[1] and SPR[2] */
        asm volatile (".set    noat\n\t"
                      "lq      $1,(%0)\n\t"
                      "lq      $2,16(%0)\n\t"
                      ".set    at\n"
                      : : "r" (p));

        asm volatile (".set    noat\n\t"
                      "nop\n\t"
                      /* read from first qword */
                      "pextw   %0,$1,0\n\t"
                      "pextw   %1,$1,1\n\t"
                      "pextw   %2,$1,2\n\t"
                      "pextw   %3,$1,3\n\t"
                      /* read from second qword */
                      "pextw   %4,$2,0\n\t"
                      "pextw   %5,$2,1\n\t"
                      "pextw   %6,$2,2\n\t"
                      "pextw   %7,$2,3\n\t"
                      ".set    at\n\t"
                      : "=r" (v0), "=r" (v1), "=r" (v2), "=r" (v3),
                        "=r" (v4), "=r" (v5), "=r" (v6), "=r" (v7) :);

        mylib_display_hex(v0);
        mylib_display_char(' ');
        mylib_display_hex(v1);
        mylib_display_char(' ');
        mylib_display_hex(v2);
        mylib_display_char(' ');
        mylib_display_hex(v3);
        mylib_display_char(' ');
        mylib_display_hex(v4);
        mylib_display_char(' ');
        mylib_display_hex(v5);
        mylib_display_char(' ');
        mylib_display_hex(v6);
        mylib_display_char(' ');
        mylib_display_hex(v7);
        mylib_display_char(' ');

        mylib_display_newline();
    }

#else
# error "illegal USE_SIMD setting"
#endif

#else   /* not-defined USE_SIMD */
    /* original code */
    for(y = n-8; y<n; y++) {
        for(x = n-8; x<n; x++) {
            mylib_display_hex(c[n*y+x]);
            mylib_display_char(' ');
        }
        mylib_display_newline();
    }
#endif

    unsigned long sum = 0;
    for(y = 0; y < n; y++) {
        for(x = 0; x < n; x++) {
            //sum += c[n*y+x];
            sum = update_crc32(sum, c[n*y+x], crc_table);
        }
    }
    mylib_display_hex(sum); // check sum
    
    mylib_display_newline();

    mylib_finalize();
    return 0;
}
/**********************************************************************/
