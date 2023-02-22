

compiler_generated_funcs = [
        '_init',
        '__cxa_finalize',
        '__stack_chk_fail',
        '__isoc99_scanf',
        '_start',
        'deregister_tm_clones',
        'register_tm_clones',
        '__do_global_dtors_aux',
        'frame_dummy',
        '_fini',
        '__libc_start_main',
        'UnresolvableJumpTarget',
        'UnresolvableCallTarget',
        '__printf_chk',
        '__cxx_global_var_init-ir',
        '__cxx_global_var_init',
        '__cxa_atexit',
        'llvm.memset.p0i8.i64',
        '_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_',

]

syscall_funcs = [
        'printf',
        '__isoc99_scanf',
        'strlen',
        'gets',
        'puts',
        'strstr',
        'malloc',
        'sqrt',
        'rand',

]

x86_call = [
        'call'
]

x86_exit = [
        'ret'
]

input_funcs = [
        '__isoc99_scanf'
]
