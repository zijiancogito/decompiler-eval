// Options:   --no-argc --no-arrays --no-bitfields --no-comma-operators --no-compound-assignment --concise --consts --divs --embedded-assigns --no-pre-incr-operator --no-pre-decr-operator --no-post-incr-operator --no-post-decr-operator --unary-plus-operator --no-jumps --no-longlong --no-int8 --no-uint8 --no-float --main --no-math64 --no-inline-function --max-block-depth 2 --max-block-size 2 --max-expr-complexity 2 --max-funcs 1 --max-pointer-depth 0 --max-struct-fields 0 --max-union-fields 0 --muls --no-safe-math --no-packed-struct --no-paranoid --no-pointers --quiet --no-structs --no-unions --no-volatiles --no-volatile-pointers --no-const-pointers --no-global-variables --no-builtins --no-int128 --no-uint128 --no-binary-constant --int-size 32 --output test.c

#define NO_LONGLONG

#include "csmith.h"


static long __undefined;






static int32_t  func_1(void);




static int32_t  func_1(void)
{ 
    uint32_t l_8 = 5U;
    int32_t l_9 = 0;
    int32_t l_10 = 1;
    l_10 = ((l_9 = ((uint32_t)((uint16_t)l_8 - (uint16_t)l_8) - (uint32_t)l_8)) ^ 0);
    l_9 = 0x416DB6D0;
    return l_8;
}





int main (void)
{
    int print_hash_value = 0;
    platform_main_begin();
    crc32_gentab();
    func_1();
    platform_main_end(crc32_context ^ 0xFFFFFFFFUL, print_hash_value);
    return 0;
}
