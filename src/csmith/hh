'Advanced' command line options that are probably only useful for Csmith's
original developers:

  --max-split-files <num>: evenly split a generated program into <num> different files(default 0).

  --split-files-dir <dir>: generate split-files into <dir> (default ./output).

  --dfs-exhaustive: enable depth first exhaustive random generation (disabled by default).

  --expand-struct: enable the expansion of struct in the exhaustive mode. Only works in the exhaustive mode and cannot used with --no-structs.

  --compact-output: print generated programs in compact way. Only works in the exhaustive mode.

  --max-nested-struct-level <num>: limit maximum nested level of structs to <num>(default 0). Only works in the exhaustive mode.

  --struct-output <file>: dump structs declarations to <file>. Only works in the exhaustive mode.

  --prefix-name: prefix names of global functions and variables with increasing numbers. Only works in the exhaustive mode.

  --sequence-name-prefix: prefix names of global functions and variables with sequence numbers.Only works in the exhaustive mode.

  --compatible-check: disallow trivial code such as i = i in random programs. Only works in the exhaustive mode.

  --ccomp: generate compcert-compatible code

  --klee: enable klee extension

  --crest: enable crest extension

  --coverage-test: enable coverage-test extension

  --coverage-test-size <num>: specify size (default 500) of the array generated to test coverage. Can only be used with --coverage-test.

  --func1_max_params <num>: specify the number of symbolic variables passed to func_1 (default 3). Only used when --crest | --klee | --coverage-test is enabled.

  --fixed-struct-fields: fix the size of struct fields to max-struct-fields (default 10).

  --return-structs | --no-return-structs: enable | disable return structs from a function (enabled by default).

  --arg-structs | --no-arg-structs: enable | disable structs being used as args (enabled by default).

  --return-unions | --no-return-unions: enable | disable return unions from a function (enabled by default).

  --arg-unions | --no-arg-unions: enable | disable unions being used as args (enabled by default).

  --take-union-field-addr | --take-no-union-field-addr: allow | disallow addresses of union fields to be taken (allowed by default).

  --vol-struct-union-fields | --no-vol-struct-union-fields: enable | disable volatile struct/union fields (enabled by default)

  --const-struct-union-fields | --no-const-struct-union-fields: enable | disable const struct/union fields (enabled by default)

  --delta-monitor [simple]: specify the type of delta monitor. Only [simple] type is supported now.

  --delta-input [file]: specify the file for delta input.

  --delta-output [file]: specify the file for delta output (default to <delta-input>).

  --go-delta [simple]: run delta reduction on <delta-input>.

  --no-delta-reduction: output the same program as <delta-input>. Only works with --go-delta option.

  --dump-default-probabilities <file>: dump the default probability settings into <file>

  --dump-random-probabilities <file>: dump the randomized probabilities into <file>

  --probability-configuration <file>: use probability configuration <file>

  --random-random: enable random probabilities.

  --enable-access-once: enable testing access once macro.

  --strict-volatile-rule: make sure only one volatile access between any pair of sequence points. 

  --addr-taken-of-locals: enable addr-taken of local vars. [default]

  --no-addr-taken-of-locals: disable addr-taken of local vars. 

  --fresh-array-ctrl-var-names: create fresh names [i1,i2,i3...] for array control vars rather than use unique names such as i, j, k.

  --math-notmp: make csmith generate code for safe_math_macros_notmp.

  --strict-const-arrays: restrict array elements to constants.

  --partial-expand <assignment[,for[,block[,if-else[,invoke[,return]]]]]: partial-expand controls which what kind of statements should be generated first. For example, it could make Csmith start to generate if-else without go over assignment or for.

  --dangling-global-pointers | --no-dangling-global-pointers: enable | disable to reset all dangling global pointers to null at the end of main. (enabled by default)

  --check-global: print the values of all integer global variables.

  --monitor-funcs <name1,name2...>: dump the checksums after each statement in the monitored functions.

  --step-hash-by-stmt: dump the checksum after each statement. It is applied to all functions unless --monitor-funcs is specified.

  --stop-by-stmt <num>: try to stop generating statements after the statement with id <num>.

  --const-as-condition: enable const to be conditions of if-statements. 

  --match-exact-qualifiers: match exact const/volatile qualifiers for LHS and RHS of assignments.

  --reduce <file>: reduce random program under the direction of the configuration file.

  --return-dead-pointer | --no-return-dead-pointer: allow | disallow functions from returning dangling pointers (disallowed by default).

  --identify-wrappers: assign ids to used safe math wrappers.

  --safe-math-wrappers <id1,id2...>: specifiy ids of wrapper functions that are necessary to avoid undefined behaviors, use 0 to specify none.

  --mark-mutable-const: mark constants that can be mutated with parentheses (disabled by default).

  --force-non-uniform-arrays | --no-force-non-uniform-arrays: force integer arrays to be initialized with multiple values (enabled by default).

  --null-ptr-deref-prob <N>: allow null pointers to be dereferenced with probability N% (0 by default).

  --dangling-ptr-deref-prob <N>: allow dangling pointers to be dereferenced with probability N% (0 by default).

  --max-struct-nested-level: controls the max depth of nested structs (default is 3).

  --no-hash-value-printf: do not emit printf on the index of an array

  --no-signed-char-index: do not allow a var of type char to be used as array index

  --strict-float: do not allow assignments between floats and integers

  --int-size <size>: specify integer size of target (default taken from platform.info if it exists otherwise from host)

  --ptr-size <size>: specify pointer size of target (default taken from platform.info if it exists otherwise from host)

