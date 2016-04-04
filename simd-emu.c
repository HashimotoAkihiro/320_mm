/* SIMD emulation stuffs */

typedef int     simd128[4];

void simd128_load(simd128 r, int *base)
{
    r[0] = base[0];
    r[1] = base[1];
    r[2] = base[2];
    r[3] = base[3];
}

void simd128_store(simd128 r, int *base)
{
    base[0] = r[0];
    base[1] = r[1];
    base[2] = r[2];
    base[3] = r[3];
}

void simd128_shift_left_word(simd128 dst, simd128 src, int v)
{
    dst[3] = src[2];
    dst[2] = src[1];
    dst[1] = src[0];
    dst[0] = v;
}

void simd128_shift_right_word(simd128 dst, simd128 src, int v)
{
    dst[0] = src[1];
    dst[1] = src[2];
    dst[2] = src[3];
    dst[3] = v;
}

void simd128_shift_left_logical(simd128 dst, simd128 src, int shmnt)
{
    dst[0] = (unsigned int)src[0] << shmnt;
    dst[1] = (unsigned int)src[1] << shmnt;
    dst[2] = (unsigned int)src[2] << shmnt;
    dst[3] = (unsigned int)src[3] << shmnt;
}

void simd128_shift_right_logical(simd128 dst, simd128 src, int shmnt)
{
    dst[0] = (unsigned int)src[0] >> shmnt;
    dst[1] = (unsigned int)src[1] >> shmnt;
    dst[2] = (unsigned int)src[2] >> shmnt;
    dst[3] = (unsigned int)src[3] >> shmnt;
}

void simd128_shift_left_arithmetic(simd128 dst, simd128 src, int shmnt)
{
    dst[0] = src[0] << shmnt;
    dst[1] = src[1] << shmnt;
    dst[2] = src[2] << shmnt;
    dst[3] = src[3] << shmnt;
}

void simd128_shift_right_arithmetic(simd128 dst, simd128 src, int shmnt)
{
    dst[0] = src[0] >> shmnt;
    dst[1] = src[1] >> shmnt;
    dst[2] = src[2] >> shmnt;
    dst[3] = src[3] >> shmnt;
}

void simd128_move(simd128 dst, simd128 src)
{
    dst[0] = src[0];
    dst[1] = src[1];
    dst[2] = src[2];
    dst[3] = src[3];
}

void simd128_add(simd128 dst, simd128 src1, simd128 src2)
{
    dst[0] = src1[0] + src2[0];
    dst[1] = src1[1] + src2[1];
    dst[2] = src1[2] + src2[2];
    dst[3] = src1[3] + src2[3];
}

void simd128_add_scalar(simd128 dst, simd128 src, int scalar)
{
    simd128 src2 = { scalar, scalar, scalar, scalar };
    simd128_add(dst, src, src2);
}

void simd128_sub(simd128 dst, simd128 src1, simd128 src2)
{
    dst[0] = src1[0] - src2[0];
    dst[1] = src1[1] - src2[1];
    dst[2] = src1[2] - src2[2];
    dst[3] = src1[3] - src2[3];
}

void simd128_sub_scalar(simd128 dst, simd128 src, int scalar)
{
    simd128 src2 = { scalar, scalar, scalar, scalar };
    simd128_sub(dst, src, src2);
}

void simd128_mult(simd128 hi, simd128 lo, simd128 src1, simd128 src2)
{
    long long int v0, v1, v2, v3;

    v0 = (long long int)src1[0] * (long long int)src2[0];
    v1 = (long long int)src1[1] * (long long int)src2[1];
    v2 = (long long int)src1[2] * (long long int)src2[2];
    v3 = (long long int)src1[3] * (long long int)src2[3];

    hi[0] = v0 >> 32;
    hi[1] = v1 >> 32;
    hi[2] = v2 >> 32;
    hi[3] = v3 >> 32;

    lo[0] = v0 & 0xffffffffLL;
    lo[1] = v1 & 0xffffffffLL;
    lo[2] = v2 & 0xffffffffLL;
    lo[3] = v3 & 0xffffffffLL;
}

void simd128_mult_scalar(simd128 hi, simd128 lo, simd128 src, int scalar)
{
    simd128 src2 = { scalar, scalar, scalar, scalar };
    simd128_mult(hi, lo, src, src2);
}

void simd128_and(simd128 dst, simd128 src1, simd128 src2)
{
    dst[0] = src1[0] & src2[0];
    dst[1] = src1[1] & src2[1];
    dst[2] = src1[2] & src2[2];
    dst[3] = src1[3] & src2[3];
}

void simd128_xor(simd128 dst, simd128 src1, simd128 src2)
{
    dst[0] = src1[0] ^ src2[0];
    dst[1] = src1[1] ^ src2[1];
    dst[2] = src1[2] ^ src2[2];
    dst[3] = src1[3] ^ src2[3];
}

void simd128_or(simd128 dst, simd128 src1, simd128 src2)
{
    dst[0] = src1[0] | src2[0];
    dst[1] = src1[1] | src2[1];
    dst[2] = src1[2] | src2[2];
    dst[3] = src1[3] | src2[3];
}

void simd128_nor(simd128 dst, simd128 src1, simd128 src2)
{
    dst[0] = ~(src1[0] | src2[0]);
    dst[1] = ~(src1[1] | src2[1]);
    dst[2] = ~(src1[2] | src2[2]);
    dst[3] = ~(src1[3] | src2[3]);
}


/* SIMD emulation stuffs end */
