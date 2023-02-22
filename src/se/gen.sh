
for i in {1..1}
do
	csmith --output random$i.c \
       --no-argc \
       --no-arrays \
       --no-bitfields \
       --no-comma-operators \
       --no-compound-assignment \
       --no-consts \
       --no-embedded-assigns \
       --no-pre-incr-operator \
       --no-pre-decr-operator \
       --no-post-incr-operator \
       --no-post-decr-operator \
       --no-unary-plus-operator \
       --no-jumps \
       --no-longlong \
       --no-int8 \
       --no-uint8 \
       --no-float \
       --no-math64 \
       --no-inline-function \
       --max-block-depth 5 \
       --max-expr-complexity 3 \
       --max-funcs 1 \
       --max-pointer-depth 0 \
       --max-struct-fields 0 \
       --max-union-fields 0 \
       --no-muls \
       --no-safe-math \
       --no-packed-struct \
       --no-paranoid \
       --no-pointers \
       --quiet \
       --no-structs \
       --no-unions \
       --no-volatiles \
       --no-volatile-pointers \
       --no-const-pointers \
       --no-global-variables \
       --no-builtins \
       --disable-builtin-kinds k1,k2
done
