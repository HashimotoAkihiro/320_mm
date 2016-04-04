# 1 "./main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./main.c"
# 20 "./main.c"
# 1 "././lib.c" 1
# 34 "././lib.c"
static char output_buffer[1024];
static int output_buffer_size = 0;

static void output_buffer_flush()
{
    int retcode;


    asm volatile(
        "li\t$4,1\n\t"
        "move\t$5,%1\n\t"
        "move\t$6,%2\n\t"
        "li\t$2,4004\n\t"
        "syscall\n\t"
        "move\t%0,$2\n\t"
        : "=r"(retcode) : "r"(output_buffer), "r"(output_buffer_size) : "$2", "$4", "$5", "$6" );

    output_buffer_size = 0;
}

static void output_buffer_put(int c)
{
    output_buffer[output_buffer_size++] = c & 0xff;
    if (output_buffer_size >= 1024)
        output_buffer_flush();
}



void mylib_wait()
{
  volatile int sum = 0;
  int i;
  for(i = 0; i < 40; i++) sum += i;
}

void mylib_display_dec(int val)
{




  int i;
  int c[(256)];
  int cnt = 0;
  int minus_flag = 0;

  if (val < 0) {

    minus_flag = 1;

    val *= -1;
  }

  if (val == 0) {
    c[0] = '0';
    cnt = 1;
  } else {
    while (val) {
      c[cnt] = (val%10 == 0) ? '0' :
               (val%10 == 1) ? '1' :
           (val%10 == 2) ? '2' :
           (val%10 == 3) ? '3' :
           (val%10 == 4) ? '4' :
           (val%10 == 5) ? '5' :
           (val%10 == 6) ? '6' :
           (val%10 == 7) ? '7' :
           (val%10 == 8) ? '8' : '9';
      cnt++;
      val /= 10;
      if ((val == 0) && (minus_flag)) {
        c[cnt] = '-';
        cnt++;
      }
    }
  }

  for (i = cnt - 1; i >= 0; i--) {

    output_buffer_put(c[i]);



  }
}

void mylib_display_hex(int val)
{




  int i;
  int c[(8)];
  int cnt = 0;

  while (cnt < (8)) {
    c[cnt] = ((val & 0x0000000f) == 0) ? '0' :
             ((val & 0x0000000f) == 1) ? '1' :
             ((val & 0x0000000f) == 2) ? '2' :
             ((val & 0x0000000f) == 3) ? '3' :
             ((val & 0x0000000f) == 4) ? '4' :
             ((val & 0x0000000f) == 5) ? '5' :
             ((val & 0x0000000f) == 6) ? '6' :
             ((val & 0x0000000f) == 7) ? '7' :
             ((val & 0x0000000f) == 8) ? '8' :
             ((val & 0x0000000f) == 9) ? '9' :
             ((val & 0x0000000f) == 10) ? 'a' :
             ((val & 0x0000000f) == 11) ? 'b' :
             ((val & 0x0000000f) == 12) ? 'c' :
             ((val & 0x0000000f) == 13) ? 'd' :
             ((val & 0x0000000f) == 14) ? 'e' : 'f';
    cnt++;
    val = val >> 4;
  }

  for (i = cnt - 1; i >= 0; i--) {

    output_buffer_put(c[i]);



  }
}

void mylib_display_char(int val)
{




  output_buffer_put(val);

}

void mylib_display_newline()
{
  mylib_display_char('\n');
  mylib_display_char('\r');
}

void mylib_flush()
{

  output_buffer_flush();







}

void mylib_finalize()
{
  mylib_display_newline();
  mylib_display_char('E');
  mylib_display_char('N');
  mylib_display_char('D');
  mylib_display_newline();

  mylib_flush();



  asm volatile(
      "li\t$4,0\n\t"
      "li\t$2,4001\n\t"
      "syscall\n\t"
      : : : "$2", "$4" );



}



int dummy_mem[0x160000] __attribute__ ((section(".dummy_space"))) __attribute((aligned(16)));
# 21 "./main.c" 2

# 1 "./crc.h" 1





void make_crc32_table(unsigned long* crc_table)
{
    unsigned long i, j, c;

    for (i = 0; i < 256; i++) {
        c = i;
        for (j = 0; j < 8; j++) {
            if (c & 1) {
                c = 0xedb88320L ^ (c >> 1);
            }
            else {
                c = c >> 1;
            }
        }
        crc_table[i] = c;
    }
}

unsigned long update_crc32(unsigned long crc, unsigned long val, unsigned long* crc_table)
{
    int n;
    unsigned long c = crc ^ 0xffffffffL;
    unsigned long byte;

    for (n = 0; n < 4; n++) {
        byte = (val >> (n*8)) & 0xff;
        c = crc_table[(c ^ byte) & 0xff] ^ (c >> 8);
    }
    return c ^ 0xffffffffL;
}
# 23 "./main.c" 2
# 35 "./main.c"
int *init_data __attribute((aligned(16)));
int *init_n;
int buf[0x80000] __attribute__ ((section(".dummy_space2"))) __attribute((aligned(16)));
# 51 "./main.c"
int main(void) {


    int n;
    extern int _binary_320mm_dat_start[];
    extern int _binary_320mm_dat_end[];
    extern int _binary_320mm_dat_size;

    init_data = _binary_320mm_dat_start;
    init_n = &init_data[0xffff];
    n = *init_n;





# 1 "./crc32table.c" 1

unsigned long crc_table[256] = {
  0x00000000, 0x77073096, 0xee0e612c, 0x990951ba,
  0x076dc419, 0x706af48f, 0xe963a535, 0x9e6495a3,
  0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988,
  0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91,

  0x1db71064, 0x6ab020f2, 0xf3b97148, 0x84be41de,
  0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
  0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec,
  0x14015c4f, 0x63066cd9, 0xfa0f3d63, 0x8d080df5,

  0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172,
  0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,
  0x35b5a8fa, 0x42b2986c, 0xdbbbc9d6, 0xacbcf940,
  0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,

  0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116,
  0x21b4f4b5, 0x56b3c423, 0xcfba9599, 0xb8bda50f,
  0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
  0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,

  0x76dc4190, 0x01db7106, 0x98d220bc, 0xefd5102a,
  0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
  0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818,
  0x7f6a0dbb, 0x086d3d2d, 0x91646c97, 0xe6635c01,

  0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e,
  0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457,
  0x65b0d9c6, 0x12b7e950, 0x8bbeb8ea, 0xfcb9887c,
  0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,

  0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2,
  0x4adfa541, 0x3dd895d7, 0xa4d1c46d, 0xd3d6f4fb,
  0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0,
  0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9,

  0x5005713c, 0x270241aa, 0xbe0b1010, 0xc90c2086,
  0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
  0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4,
  0x59b33d17, 0x2eb40d81, 0xb7bd5c3b, 0xc0ba6cad,

  0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a,
  0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683,
  0xe3630b12, 0x94643b84, 0x0d6d6a3e, 0x7a6a5aa8,
  0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,

  0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe,
  0xf762575d, 0x806567cb, 0x196c3671, 0x6e6b06e7,
  0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc,
  0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5,

  0xd6d6a3e8, 0xa1d1937e, 0x38d8c2c4, 0x4fdff252,
  0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
  0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60,
  0xdf60efc3, 0xa867df55, 0x316e8eef, 0x4669be79,

  0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
  0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f,
  0xc5ba3bbe, 0xb2bd0b28, 0x2bb45a92, 0x5cb36a04,
  0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,

  0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a,
  0x9c0906a9, 0xeb0e363f, 0x72076785, 0x05005713,
  0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38,
  0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21,

  0x86d3d2d4, 0xf1d4e242, 0x68ddb3f8, 0x1fda836e,
  0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
  0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c,
  0x8f659eff, 0xf862ae69, 0x616bffd3, 0x166ccf45,

  0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2,
  0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db,
  0xaed16a4a, 0xd9d65adc, 0x40df0b66, 0x37d83bf0,
  0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,

  0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6,
  0xbad03605, 0xcdd70693, 0x54de5729, 0x23d967bf,
  0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94,
  0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d,

 };
# 68 "./main.c" 2
# 77 "./main.c"
    mylib_display_char('m');
    mylib_display_char('m');
    mylib_display_char(' ');
    mylib_display_char('n');
    mylib_display_char('=');
    mylib_display_dec(n);
    mylib_display_newline();

    int *a = (int*)&buf[0x0];
    int *b = (int*)&dummy_mem[0x0];
    int *c = (int*)&dummy_mem[0x80000];

    int y,x,i;
# 194 "./main.c"
    int d = 0;


    asm volatile (".set   noat\n\t"
                  "pinsw  $0,$0,$0,0\n\t"
                  "nop\n\t"
                  "nop\n\t"
                  "pinsw  $0,$0,$0,1\n\t"
                  "nop\n\t"
                  "nop\n\t"
                  "pinsw  $0,$0,$0,2\n\t"
                  "nop\n\t"
                  "nop\n\t"
                  "pinsw  $0,$0,$0,3\n\t"
                  ".set   at\n\t");

    for (i = 0; i < n*n; i += 4) {
        int v0, v1, v2, v3, v4, v5, v6, v7;


        asm volatile (".set    noat\n\t"
                      "lq      $1,(%0)\n\t"
                      "lq      $2,16(%0)\n\t"
                      ".set    at\n"
                      : : "r" (&init_data[d]));

        asm volatile (".set    noat\n\t"
                      "nop\n\t"

                      "pextw   %0,$1,0\n\t"
                      "pextw   %1,$1,1\n\t"
                      "pextw   %2,$1,2\n\t"
                      "pextw   %3,$1,3\n\t"

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
        ".set    at\n\t"
                      :
                      : "r" (v0), "r" (v1), "r" (v2), "r" (v3),
                        "r" (v4), "r" (v5), "r" (v6), "r" (v7) );
# 271 "./main.c"
        asm volatile (".set       noat\n\t"
                      "cache      0x0d,(%0)\n\t"
                      "cache      0x0d,(%1)\n\t"
                      ".set       at\n"
                      : : "r" (&a[i]), "r" (&b[i]));



        asm volatile (".set    noat\n\t"
                      "sq      $3,(%0)\n\t"
                      "sq      $4,(%1)\n\t"
                      ".set    at\n"
                      : : "r" (&a[i]), "r" (&b[i]));

        d = (d + 8) % (64*1024);
    }
# 448 "./main.c"
    for(y = 0; y < n; y += 4) {
        for(x = 0; x < n; x += 4) {

            asm volatile (".set    noat\n\t"
                          "psubw   $1,$0,$0\n\t"
                          "psubw   $2,$0,$0\n\t"
                          "psubw   $3,$0,$0\n\t"
                          "psubw   $4,$0,$0\n\t"
                          ".set    at\n"
                          : : );


            for (i = 0; i < n; i++) {
                int v0, v1, v2, v3;


                asm volatile (".set    noat\n\t"
                              "lq      $5,(%0)\n\t"
                              ".set    at\n"
                              : : "r" (&b[n*i + x]));
# 482 "./main.c"
                v0 = a[n*(y+0) + i];
                v1 = a[n*(y+1) + i];
                v2 = a[n*(y+2) + i];
                v3 = a[n*(y+3) + i];

                asm volatile (".set    noat\n\t"
                              "pmultsw $5,%0\n\t"
                              "pmflo   $6\n\t"
                              "nop\n\t"
                              "nop\n\t"
                              "paddw   $1,$1,$6\n\t"

                              "pmultsw $5,%1\n\t"
                              "pmflo   $6\n\t"
                              "nop\n\t"
                              "nop\n\t"
                              "paddw   $2,$2,$6\n\t"

                              "pmultsw $5,%2\n\t"
                              "pmflo   $6\n\t"
                              "nop\n\t"
                              "nop\n\t"
                              "paddw   $3,$3,$6\n\t"

                              "pmultsw $5,%3\n\t"
                              "pmflo   $6\n\t"
                              "nop\n\t"
                              "nop\n\t"
                              "paddw   $4,$4,$6\n\t"

                              ".set    at\n\t"
                              : : "r" (v0), "r" (v1), "r" (v2), "r" (v3) );
# 526 "./main.c"
      }




     asm volatile(".set     noat\n\t"
    "cache    0x0d,(%0)\n\t"
    "cache    0x0d,(%1)\n\t"
    "cache    0x0d,(%2)\n\t"
    "cache    0x0d,(%3)\n\t"
    ::"r"(&c[n*(y+0) + x]),"r"(&c[n*(y+1) + x]),
    "r"(&c[n*(y+2) + x]),"r"(&c[n*(y+3) + x]));
# 551 "./main.c"
            asm volatile (".set    noat\n\t"
                          "sq      $1,(%0)\n\t"
                          "sq      $2,(%1)\n\t"
                          "sq      $3,(%2)\n\t"
                          "sq      $4,(%3)\n\t"
                          ".set    at\n\t"
                          :
                          : "r" (&c[n*(y ) + x]),
                            "r" (&c[n*(y+1) + x]),
                            "r" (&c[n*(y+2) + x]),
                            "r" (&c[n*(y+3) + x]) );
# 575 "./main.c"
        }
    }
# 594 "./main.c"
    mylib_display_newline();
# 630 "./main.c"
    for(y = n-8; y<n; y++) {
        int v0, v1, v2, v3, v4, v5, v6, v7;
        int *p = &c[n*y + n-8];


        asm volatile (".set    noat\n\t"
                      "lq      $1,(%0)\n\t"
                      "lq      $2,16(%0)\n\t"
                      ".set    at\n"
                      : : "r" (p));

        asm volatile (".set    noat\n\t"
                      "nop\n\t"

                      "pextw   %0,$1,0\n\t"
                      "pextw   %1,$1,1\n\t"
                      "pextw   %2,$1,2\n\t"
                      "pextw   %3,$1,3\n\t"

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
# 692 "./main.c"
    unsigned long sum = 0;
    for(y = 0; y < n; y++) {
        for(x = 0; x < n; x++) {

            sum = update_crc32(sum, c[n*y+x], crc_table);
        }
    }
    mylib_display_hex(sum);

    mylib_display_newline();






    mylib_finalize();
    return 0;
}
