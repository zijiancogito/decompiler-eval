
case.o:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <printf@plt-0x10>:
    1020:	ff 35 e2 2f 00 00    	push   0x2fe2(%rip)        # 4008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 e4 2f 00 00    	jmp    *0x2fe4(%rip)        # 4010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <printf@plt>:
    1030:	ff 25 e2 2f 00 00    	jmp    *0x2fe2(%rip)        # 4018 <printf@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <__isoc99_scanf@plt>:
    1040:	ff 25 da 2f 00 00    	jmp    *0x2fda(%rip)        # 4020 <__isoc99_scanf@GLIBC_2.7>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <rand@plt>:
    1050:	ff 25 d2 2f 00 00    	jmp    *0x2fd2(%rip)        # 4028 <rand@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	ff 25 92 2f 00 00    	jmp    *0x2f92(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1066:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001070 <_start>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	31 ed                	xor    %ebp,%ebp
    1076:	49 89 d1             	mov    %rdx,%r9
    1079:	5e                   	pop    %rsi
    107a:	48 89 e2             	mov    %rsp,%rdx
    107d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1081:	50                   	push   %rax
    1082:	54                   	push   %rsp
    1083:	45 31 c0             	xor    %r8d,%r8d
    1086:	31 c9                	xor    %ecx,%ecx
    1088:	48 8d 3d 31 01 00 00 	lea    0x131(%rip),%rdi        # 11c0 <main>
    108f:	ff 15 43 2f 00 00    	call   *0x2f43(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1095:	f4                   	hlt    
    1096:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    109d:	00 00 00 

00000000000010a0 <deregister_tm_clones>:
    10a0:	48 8d 3d 99 2f 00 00 	lea    0x2f99(%rip),%rdi        # 4040 <__TMC_END__>
    10a7:	48 8d 05 92 2f 00 00 	lea    0x2f92(%rip),%rax        # 4040 <__TMC_END__>
    10ae:	48 39 f8             	cmp    %rdi,%rax
    10b1:	74 15                	je     10c8 <deregister_tm_clones+0x28>
    10b3:	48 8b 05 26 2f 00 00 	mov    0x2f26(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10ba:	48 85 c0             	test   %rax,%rax
    10bd:	74 09                	je     10c8 <deregister_tm_clones+0x28>
    10bf:	ff e0                	jmp    *%rax
    10c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10c8:	c3                   	ret    
    10c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010d0 <register_tm_clones>:
    10d0:	48 8d 3d 69 2f 00 00 	lea    0x2f69(%rip),%rdi        # 4040 <__TMC_END__>
    10d7:	48 8d 35 62 2f 00 00 	lea    0x2f62(%rip),%rsi        # 4040 <__TMC_END__>
    10de:	48 29 fe             	sub    %rdi,%rsi
    10e1:	48 89 f0             	mov    %rsi,%rax
    10e4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10e8:	48 c1 f8 03          	sar    $0x3,%rax
    10ec:	48 01 c6             	add    %rax,%rsi
    10ef:	48 d1 fe             	sar    %rsi
    10f2:	74 14                	je     1108 <register_tm_clones+0x38>
    10f4:	48 8b 05 f5 2e 00 00 	mov    0x2ef5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    10fb:	48 85 c0             	test   %rax,%rax
    10fe:	74 08                	je     1108 <register_tm_clones+0x38>
    1100:	ff e0                	jmp    *%rax
    1102:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1108:	c3                   	ret    
    1109:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001110 <__do_global_dtors_aux>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	80 3d 25 2f 00 00 00 	cmpb   $0x0,0x2f25(%rip)        # 4040 <__TMC_END__>
    111b:	75 2b                	jne    1148 <__do_global_dtors_aux+0x38>
    111d:	55                   	push   %rbp
    111e:	48 83 3d d2 2e 00 00 	cmpq   $0x0,0x2ed2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1125:	00 
    1126:	48 89 e5             	mov    %rsp,%rbp
    1129:	74 0c                	je     1137 <__do_global_dtors_aux+0x27>
    112b:	48 8b 3d 06 2f 00 00 	mov    0x2f06(%rip),%rdi        # 4038 <__dso_handle>
    1132:	e8 29 ff ff ff       	call   1060 <__cxa_finalize@plt>
    1137:	e8 64 ff ff ff       	call   10a0 <deregister_tm_clones>
    113c:	c6 05 fd 2e 00 00 01 	movb   $0x1,0x2efd(%rip)        # 4040 <__TMC_END__>
    1143:	5d                   	pop    %rbp
    1144:	c3                   	ret    
    1145:	0f 1f 00             	nopl   (%rax)
    1148:	c3                   	ret    
    1149:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001150 <frame_dummy>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	e9 77 ff ff ff       	jmp    10d0 <register_tm_clones>
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <func0>:
    1160:	55                   	push   %rbp
    1161:	41 57                	push   %r15
    1163:	41 56                	push   %r14
    1165:	53                   	push   %rbx
    1166:	50                   	push   %rax
    1167:	89 f3                	mov    %esi,%ebx
    1169:	41 89 fe             	mov    %edi,%r14d
    116c:	4c 8d 3d 94 0e 00 00 	lea    0xe94(%rip),%r15        # 2007 <_IO_stdin_used+0x7>
    1173:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
    1178:	4c 89 ff             	mov    %r15,%rdi
    117b:	31 c0                	xor    %eax,%eax
    117d:	e8 be fe ff ff       	call   1040 <__isoc99_scanf@plt>
    1182:	31 c0                	xor    %eax,%eax
    1184:	e8 c7 fe ff ff       	call   1050 <rand@plt>
    1189:	89 c5                	mov    %eax,%ebp
    118b:	42 8d 34 33          	lea    (%rbx,%r14,1),%esi
    118f:	01 c6                	add    %eax,%esi
    1191:	03 74 24 04          	add    0x4(%rsp),%esi
    1195:	4c 89 ff             	mov    %r15,%rdi
    1198:	31 c0                	xor    %eax,%eax
    119a:	e8 91 fe ff ff       	call   1030 <printf@plt>
    119f:	41 0f af de          	imul   %r14d,%ebx
    11a3:	0f af dd             	imul   %ebp,%ebx
    11a6:	0f af 5c 24 04       	imul   0x4(%rsp),%ebx
    11ab:	89 d8                	mov    %ebx,%eax
    11ad:	48 83 c4 08          	add    $0x8,%rsp
    11b1:	5b                   	pop    %rbx
    11b2:	41 5e                	pop    %r14
    11b4:	41 5f                	pop    %r15
    11b6:	5d                   	pop    %rbp
    11b7:	c3                   	ret    
    11b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    11bf:	00 

00000000000011c0 <main>:
    11c0:	50                   	push   %rax
    11c1:	48 8d 3d 3c 0e 00 00 	lea    0xe3c(%rip),%rdi        # 2004 <_IO_stdin_used+0x4>
    11c8:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
    11cd:	48 89 e2             	mov    %rsp,%rdx
    11d0:	31 c0                	xor    %eax,%eax
    11d2:	e8 69 fe ff ff       	call   1040 <__isoc99_scanf@plt>
    11d7:	8b 7c 24 04          	mov    0x4(%rsp),%edi
    11db:	8b 34 24             	mov    (%rsp),%esi
    11de:	e8 7d ff ff ff       	call   1160 <func0>
    11e3:	48 8d 3d 1d 0e 00 00 	lea    0xe1d(%rip),%rdi        # 2007 <_IO_stdin_used+0x7>
    11ea:	89 c6                	mov    %eax,%esi
    11ec:	31 c0                	xor    %eax,%eax
    11ee:	e8 3d fe ff ff       	call   1030 <printf@plt>
    11f3:	31 c0                	xor    %eax,%eax
    11f5:	59                   	pop    %rcx
    11f6:	c3                   	ret    

Disassembly of section .fini:

00000000000011f8 <_fini>:
    11f8:	f3 0f 1e fa          	endbr64 
    11fc:	48 83 ec 08          	sub    $0x8,%rsp
    1200:	48 83 c4 08          	add    $0x8,%rsp
    1204:	c3                   	ret    
