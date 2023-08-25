
a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 3f 00 00 	mov    0x3fd9(%rip),%rax        # 4fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 92 3f 00 00    	push   0x3f92(%rip)        # 4fb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 93 3f 00 00 	bnd jmp *0x3f93(%rip)        # 4fc0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop

Disassembly of section .plt.got:

0000000000001050 <__cxa_finalize@plt>:
    1050:	f3 0f 1e fa          	endbr64 
    1054:	f2 ff 25 9d 3f 00 00 	bnd jmp *0x3f9d(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    105b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001060 <__printf_chk@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 5d 3f 00 00 	bnd jmp *0x3f5d(%rip)        # 4fc8 <__printf_chk@GLIBC_2.3.4>
    106b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001070 <rand@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 55 3f 00 00 	bnd jmp *0x3f55(%rip)        # 4fd0 <rand@GLIBC_2.2.5>
    107b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001080 <main>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	53                   	push   %rbx
    1085:	31 c0                	xor    %eax,%eax
    1087:	e8 24 01 00 00       	call   11b0 <f_rand_0>
    108c:	89 c3                	mov    %eax,%ebx
    108e:	31 c0                	xor    %eax,%eax
    1090:	e8 4b 01 00 00       	call   11e0 <f_rand_1>
    1095:	89 df                	mov    %ebx,%edi
    1097:	e8 04 02 00 00       	call   12a0 <func0>
    109c:	48 8d 35 6b 1f 00 00 	lea    0x1f6b(%rip),%rsi        # 300e <_IO_stdin_used+0xe>
    10a3:	bf 01 00 00 00       	mov    $0x1,%edi
    10a8:	89 c2                	mov    %eax,%edx
    10aa:	31 c0                	xor    %eax,%eax
    10ac:	e8 af ff ff ff       	call   1060 <__printf_chk@plt>
    10b1:	31 c0                	xor    %eax,%eax
    10b3:	5b                   	pop    %rbx
    10b4:	c3                   	ret    
    10b5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10bc:	00 00 00 
    10bf:	90                   	nop

00000000000010c0 <_start>:
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	31 ed                	xor    %ebp,%ebp
    10c6:	49 89 d1             	mov    %rdx,%r9
    10c9:	5e                   	pop    %rsi
    10ca:	48 89 e2             	mov    %rsp,%rdx
    10cd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10d1:	50                   	push   %rax
    10d2:	54                   	push   %rsp
    10d3:	45 31 c0             	xor    %r8d,%r8d
    10d6:	31 c9                	xor    %ecx,%ecx
    10d8:	48 8d 3d a1 ff ff ff 	lea    -0x5f(%rip),%rdi        # 1080 <main>
    10df:	ff 15 f3 3e 00 00    	call   *0x3ef3(%rip)        # 4fd8 <__libc_start_main@GLIBC_2.34>
    10e5:	f4                   	hlt    
    10e6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10ed:	00 00 00 

00000000000010f0 <deregister_tm_clones>:
    10f0:	48 8d 3d 19 3f 00 00 	lea    0x3f19(%rip),%rdi        # 5010 <__TMC_END__>
    10f7:	48 8d 05 12 3f 00 00 	lea    0x3f12(%rip),%rax        # 5010 <__TMC_END__>
    10fe:	48 39 f8             	cmp    %rdi,%rax
    1101:	74 15                	je     1118 <deregister_tm_clones+0x28>
    1103:	48 8b 05 d6 3e 00 00 	mov    0x3ed6(%rip),%rax        # 4fe0 <_ITM_deregisterTMCloneTable@Base>
    110a:	48 85 c0             	test   %rax,%rax
    110d:	74 09                	je     1118 <deregister_tm_clones+0x28>
    110f:	ff e0                	jmp    *%rax
    1111:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1118:	c3                   	ret    
    1119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001120 <register_tm_clones>:
    1120:	48 8d 3d e9 3e 00 00 	lea    0x3ee9(%rip),%rdi        # 5010 <__TMC_END__>
    1127:	48 8d 35 e2 3e 00 00 	lea    0x3ee2(%rip),%rsi        # 5010 <__TMC_END__>
    112e:	48 29 fe             	sub    %rdi,%rsi
    1131:	48 89 f0             	mov    %rsi,%rax
    1134:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1138:	48 c1 f8 03          	sar    $0x3,%rax
    113c:	48 01 c6             	add    %rax,%rsi
    113f:	48 d1 fe             	sar    %rsi
    1142:	74 14                	je     1158 <register_tm_clones+0x38>
    1144:	48 8b 05 a5 3e 00 00 	mov    0x3ea5(%rip),%rax        # 4ff0 <_ITM_registerTMCloneTable@Base>
    114b:	48 85 c0             	test   %rax,%rax
    114e:	74 08                	je     1158 <register_tm_clones+0x38>
    1150:	ff e0                	jmp    *%rax
    1152:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1158:	c3                   	ret    
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <__do_global_dtors_aux>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	80 3d a5 3e 00 00 00 	cmpb   $0x0,0x3ea5(%rip)        # 5010 <__TMC_END__>
    116b:	75 2b                	jne    1198 <__do_global_dtors_aux+0x38>
    116d:	55                   	push   %rbp
    116e:	48 83 3d 82 3e 00 00 	cmpq   $0x0,0x3e82(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    1175:	00 
    1176:	48 89 e5             	mov    %rsp,%rbp
    1179:	74 0c                	je     1187 <__do_global_dtors_aux+0x27>
    117b:	48 8b 3d 86 3e 00 00 	mov    0x3e86(%rip),%rdi        # 5008 <__dso_handle>
    1182:	e8 c9 fe ff ff       	call   1050 <__cxa_finalize@plt>
    1187:	e8 64 ff ff ff       	call   10f0 <deregister_tm_clones>
    118c:	c6 05 7d 3e 00 00 01 	movb   $0x1,0x3e7d(%rip)        # 5010 <__TMC_END__>
    1193:	5d                   	pop    %rbp
    1194:	c3                   	ret    
    1195:	0f 1f 00             	nopl   (%rax)
    1198:	c3                   	ret    
    1199:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011a0 <frame_dummy>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	e9 77 ff ff ff       	jmp    1120 <register_tm_clones>
    11a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011b0 <f_rand_0>:
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	53                   	push   %rbx
    11b5:	e8 b6 fe ff ff       	call   1070 <rand@plt>
    11ba:	31 d2                	xor    %edx,%edx
    11bc:	bf 01 00 00 00       	mov    $0x1,%edi
    11c1:	48 8d 35 3c 1e 00 00 	lea    0x1e3c(%rip),%rsi        # 3004 <_IO_stdin_used+0x4>
    11c8:	89 c3                	mov    %eax,%ebx
    11ca:	31 c0                	xor    %eax,%eax
    11cc:	e8 8f fe ff ff       	call   1060 <__printf_chk@plt>
    11d1:	89 d8                	mov    %ebx,%eax
    11d3:	5b                   	pop    %rbx
    11d4:	c3                   	ret    
    11d5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    11dc:	00 00 00 00 

00000000000011e0 <f_rand_1>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	53                   	push   %rbx
    11e5:	e8 86 fe ff ff       	call   1070 <rand@plt>
    11ea:	ba 01 00 00 00       	mov    $0x1,%edx
    11ef:	bf 01 00 00 00       	mov    $0x1,%edi
    11f4:	48 8d 35 16 1e 00 00 	lea    0x1e16(%rip),%rsi        # 3011 <_IO_stdin_used+0x11>
    11fb:	89 c3                	mov    %eax,%ebx
    11fd:	31 c0                	xor    %eax,%eax
    11ff:	e8 5c fe ff ff       	call   1060 <__printf_chk@plt>
    1204:	89 d8                	mov    %ebx,%eax
    1206:	5b                   	pop    %rbx
    1207:	c3                   	ret    
    1208:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    120f:	00 

0000000000001210 <f_rand_2>:
    1210:	f3 0f 1e fa          	endbr64 
    1214:	53                   	push   %rbx
    1215:	e8 56 fe ff ff       	call   1070 <rand@plt>
    121a:	ba 02 00 00 00       	mov    $0x2,%edx
    121f:	bf 01 00 00 00       	mov    $0x1,%edi
    1224:	48 8d 35 f3 1d 00 00 	lea    0x1df3(%rip),%rsi        # 301e <_IO_stdin_used+0x1e>
    122b:	89 c3                	mov    %eax,%ebx
    122d:	31 c0                	xor    %eax,%eax
    122f:	e8 2c fe ff ff       	call   1060 <__printf_chk@plt>
    1234:	89 d8                	mov    %ebx,%eax
    1236:	5b                   	pop    %rbx
    1237:	c3                   	ret    
    1238:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    123f:	00 

0000000000001240 <f_rand_3>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	53                   	push   %rbx
    1245:	e8 26 fe ff ff       	call   1070 <rand@plt>
    124a:	ba 03 00 00 00       	mov    $0x3,%edx
    124f:	bf 01 00 00 00       	mov    $0x1,%edi
    1254:	48 8d 35 d0 1d 00 00 	lea    0x1dd0(%rip),%rsi        # 302b <_IO_stdin_used+0x2b>
    125b:	89 c3                	mov    %eax,%ebx
    125d:	31 c0                	xor    %eax,%eax
    125f:	e8 fc fd ff ff       	call   1060 <__printf_chk@plt>
    1264:	89 d8                	mov    %ebx,%eax
    1266:	5b                   	pop    %rbx
    1267:	c3                   	ret    
    1268:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    126f:	00 

0000000000001270 <f_rand_4>:
    1270:	f3 0f 1e fa          	endbr64 
    1274:	53                   	push   %rbx
    1275:	e8 f6 fd ff ff       	call   1070 <rand@plt>
    127a:	ba 04 00 00 00       	mov    $0x4,%edx
    127f:	bf 01 00 00 00       	mov    $0x1,%edi
    1284:	48 8d 35 ad 1d 00 00 	lea    0x1dad(%rip),%rsi        # 3038 <_IO_stdin_used+0x38>
    128b:	89 c3                	mov    %eax,%ebx
    128d:	31 c0                	xor    %eax,%eax
    128f:	e8 cc fd ff ff       	call   1060 <__printf_chk@plt>
    1294:	89 d8                	mov    %ebx,%eax
    1296:	5b                   	pop    %rbx
    1297:	c3                   	ret    
    1298:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    129f:	00 

00000000000012a0 <func0>:
    12a0:	f3 0f 1e fa          	endbr64 
    12a4:	41 57                	push   %r15
    12a6:	31 c0                	xor    %eax,%eax
    12a8:	41 56                	push   %r14
    12aa:	41 55                	push   %r13
    12ac:	41 54                	push   %r12
    12ae:	55                   	push   %rbp
    12af:	89 fd                	mov    %edi,%ebp
    12b1:	53                   	push   %rbx
    12b2:	48 8d 1d 8c 1d 00 00 	lea    0x1d8c(%rip),%rbx        # 3045 <_IO_stdin_used+0x45>
    12b9:	48 83 ec 38          	sub    $0x38,%rsp
    12bd:	89 7c 24 0c          	mov    %edi,0xc(%rsp)
    12c1:	e8 aa ff ff ff       	call   1270 <f_rand_4>
    12c6:	41 89 c7             	mov    %eax,%r15d
    12c9:	31 c0                	xor    %eax,%eax
    12cb:	e8 70 ff ff ff       	call   1240 <f_rand_3>
    12d0:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    12d4:	31 c0                	xor    %eax,%eax
    12d6:	e8 d5 fe ff ff       	call   11b0 <f_rand_0>
    12db:	41 89 c4             	mov    %eax,%r12d
    12de:	31 c0                	xor    %eax,%eax
    12e0:	e8 fb fe ff ff       	call   11e0 <f_rand_1>
    12e5:	41 89 c6             	mov    %eax,%r14d
    12e8:	31 c0                	xor    %eax,%eax
    12ea:	e8 21 ff ff ff       	call   1210 <f_rand_2>
    12ef:	31 d2                	xor    %edx,%edx
    12f1:	48 89 de             	mov    %rbx,%rsi
    12f4:	bf 01 00 00 00       	mov    $0x1,%edi
    12f9:	89 44 24 14          	mov    %eax,0x14(%rsp)
    12fd:	31 c0                	xor    %eax,%eax
    12ff:	e8 5c fd ff ff       	call   1060 <__printf_chk@plt>
    1304:	41 39 ee             	cmp    %ebp,%r14d
    1307:	7f 57                	jg     1360 <func0+0xc0>
    1309:	31 c0                	xor    %eax,%eax
    130b:	ba 01 00 00 00       	mov    $0x1,%edx
    1310:	48 89 de             	mov    %rbx,%rsi
    1313:	bf 01 00 00 00       	mov    $0x1,%edi
    1318:	e8 43 fd ff ff       	call   1060 <__printf_chk@plt>
    131d:	41 81 ff 41 03 00 00 	cmp    $0x341,%r15d
    1324:	0f 8f 9c 01 00 00    	jg     14c6 <func0+0x226>
    132a:	ba 02 00 00 00       	mov    $0x2,%edx
    132f:	48 89 de             	mov    %rbx,%rsi
    1332:	bf 01 00 00 00       	mov    $0x1,%edi
    1337:	31 c0                	xor    %eax,%eax
    1339:	e8 22 fd ff ff       	call   1060 <__printf_chk@plt>
    133e:	66 90                	xchg   %ax,%ax
    1340:	ba 03 00 00 00       	mov    $0x3,%edx
    1345:	48 89 de             	mov    %rbx,%rsi
    1348:	bf 01 00 00 00       	mov    $0x1,%edi
    134d:	31 c0                	xor    %eax,%eax
    134f:	e8 0c fd ff ff       	call   1060 <__printf_chk@plt>
    1354:	eb ea                	jmp    1340 <func0+0xa0>
    1356:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    135d:	00 00 00 
    1360:	31 c0                	xor    %eax,%eax
    1362:	ba 06 00 00 00       	mov    $0x6,%edx
    1367:	48 89 de             	mov    %rbx,%rsi
    136a:	bf 01 00 00 00       	mov    $0x1,%edi
    136f:	e8 ec fc ff ff       	call   1060 <__printf_chk@plt>
    1374:	81 7c 24 1c 54 03 00 	cmpl   $0x354,0x1c(%rsp)
    137b:	00 
    137c:	7e 2c                	jle    13aa <func0+0x10a>
    137e:	66 90                	xchg   %ax,%ax
    1380:	48 89 de             	mov    %rbx,%rsi
    1383:	ba 07 00 00 00       	mov    $0x7,%edx
    1388:	bf 01 00 00 00       	mov    $0x1,%edi
    138d:	31 c0                	xor    %eax,%eax
    138f:	e8 cc fc ff ff       	call   1060 <__printf_chk@plt>
    1394:	ba 09 00 00 00       	mov    $0x9,%edx
    1399:	48 89 de             	mov    %rbx,%rsi
    139c:	31 c0                	xor    %eax,%eax
    139e:	bf 01 00 00 00       	mov    $0x1,%edi
    13a3:	e8 b8 fc ff ff       	call   1060 <__printf_chk@plt>
    13a8:	eb d6                	jmp    1380 <func0+0xe0>
    13aa:	48 89 de             	mov    %rbx,%rsi
    13ad:	ba 0b 00 00 00       	mov    $0xb,%edx
    13b2:	bf 01 00 00 00       	mov    $0x1,%edi
    13b7:	31 c0                	xor    %eax,%eax
    13b9:	e8 a2 fc ff ff       	call   1060 <__printf_chk@plt>
    13be:	8b 74 24 1c          	mov    0x1c(%rsp),%esi
    13c2:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
    13c6:	89 f0                	mov    %esi,%eax
    13c8:	0d 07 03 00 00       	or     $0x307,%eax
    13cd:	29 c8                	sub    %ecx,%eax
    13cf:	89 44 24 24          	mov    %eax,0x24(%rsp)
    13d3:	41 81 fe a1 03 00 00 	cmp    $0x3a1,%r14d
    13da:	0f 84 42 0a 00 00    	je     1e22 <func0+0xb82>
    13e0:	48 63 c1             	movslq %ecx,%rax
    13e3:	89 ca                	mov    %ecx,%edx
    13e5:	44 89 64 24 2c       	mov    %r12d,0x2c(%rsp)
    13ea:	41 bd 07 03 00 00    	mov    $0x307,%r13d
    13f0:	48 69 c0 55 6e 59 9d 	imul   $0xffffffff9d596e55,%rax,%rax
    13f7:	c1 fa 1f             	sar    $0x1f,%edx
    13fa:	c7 44 24 08 15 01 00 	movl   $0x115,0x8(%rsp)
    1401:	00 
    1402:	48 c1 e8 20          	shr    $0x20,%rax
    1406:	01 c8                	add    %ecx,%eax
    1408:	c1 f8 09             	sar    $0x9,%eax
    140b:	29 d0                	sub    %edx,%eax
    140d:	89 44 24 20          	mov    %eax,0x20(%rsp)
    1411:	69 c1 41 03 00 00    	imul   $0x341,%ecx,%eax
    1417:	89 44 24 18          	mov    %eax,0x18(%rsp)
    141b:	42 8d 04 26          	lea    (%rsi,%r12,1),%eax
    141f:	41 89 f4             	mov    %esi,%r12d
    1422:	89 44 24 28          	mov    %eax,0x28(%rsp)
    1426:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    142d:	00 00 00 
    1430:	31 c0                	xor    %eax,%eax
    1432:	ba 0c 00 00 00       	mov    $0xc,%edx
    1437:	48 89 de             	mov    %rbx,%rsi
    143a:	bf 01 00 00 00       	mov    $0x1,%edi
    143f:	e8 1c fc ff ff       	call   1060 <__printf_chk@plt>
    1444:	41 81 fc 83 01 00 00 	cmp    $0x183,%r12d
    144b:	0f 84 4f 01 00 00    	je     15a0 <func0+0x300>
    1451:	ba 0e 00 00 00       	mov    $0xe,%edx
    1456:	48 89 de             	mov    %rbx,%rsi
    1459:	bf 01 00 00 00       	mov    $0x1,%edi
    145e:	31 c0                	xor    %eax,%eax
    1460:	e8 fb fb ff ff       	call   1060 <__printf_chk@plt>
    1465:	8b 44 24 28          	mov    0x28(%rsp),%eax
    1469:	44 8b 74 24 24       	mov    0x24(%rsp),%r14d
    146e:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1472:	8b 44 24 20          	mov    0x20(%rsp),%eax
    1476:	45 21 ee             	and    %r13d,%r14d
    1479:	89 44 24 10          	mov    %eax,0x10(%rsp)
    147d:	31 c0                	xor    %eax,%eax
    147f:	ba 0f 00 00 00       	mov    $0xf,%edx
    1484:	48 89 de             	mov    %rbx,%rsi
    1487:	bf 01 00 00 00       	mov    $0x1,%edi
    148c:	e8 cf fb ff ff       	call   1060 <__printf_chk@plt>
    1491:	45 39 ec             	cmp    %r13d,%r12d
    1494:	0f 8d 49 01 00 00    	jge    15e3 <func0+0x343>
    149a:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
    149e:	8b 44 24 18          	mov    0x18(%rsp),%eax
    14a2:	09 c5                	or     %eax,%ebp
    14a4:	41 39 ec             	cmp    %ebp,%r12d
    14a7:	0f 8d 93 00 00 00    	jge    1540 <func0+0x2a0>
    14ad:	0f 1f 00             	nopl   (%rax)
    14b0:	ba 10 00 00 00       	mov    $0x10,%edx
    14b5:	48 89 de             	mov    %rbx,%rsi
    14b8:	bf 01 00 00 00       	mov    $0x1,%edi
    14bd:	31 c0                	xor    %eax,%eax
    14bf:	e8 9c fb ff ff       	call   1060 <__printf_chk@plt>
    14c4:	eb ea                	jmp    14b0 <func0+0x210>
    14c6:	41 8d 96 15 01 00 00 	lea    0x115(%r14),%edx
    14cd:	48 89 de             	mov    %rbx,%rsi
    14d0:	bf 01 00 00 00       	mov    $0x1,%edi
    14d5:	48 63 c2             	movslq %edx,%rax
    14d8:	48 69 c0 55 6e 59 9d 	imul   $0xffffffff9d596e55,%rax,%rax
    14df:	48 c1 e8 20          	shr    $0x20,%rax
    14e3:	01 d0                	add    %edx,%eax
    14e5:	c1 fa 1f             	sar    $0x1f,%edx
    14e8:	c1 f8 09             	sar    $0x9,%eax
    14eb:	29 d0                	sub    %edx,%eax
    14ed:	ba 05 00 00 00       	mov    $0x5,%edx
    14f2:	89 44 24 10          	mov    %eax,0x10(%rsp)
    14f6:	31 c0                	xor    %eax,%eax
    14f8:	e8 63 fb ff ff       	call   1060 <__printf_chk@plt>
    14fd:	31 c0                	xor    %eax,%eax
    14ff:	ba 1e 00 00 00       	mov    $0x1e,%edx
    1504:	48 89 de             	mov    %rbx,%rsi
    1507:	bf 01 00 00 00       	mov    $0x1,%edi
    150c:	e8 4f fb ff ff       	call   1060 <__printf_chk@plt>
    1511:	41 81 fe 41 03 00 00 	cmp    $0x341,%r14d
    1518:	0f 8e ec 08 00 00    	jle    1e0a <func0+0xb6a>
    151e:	44 89 f0             	mov    %r14d,%eax
    1521:	c7 44 24 08 15 01 00 	movl   $0x115,0x8(%rsp)
    1528:	00 
    1529:	bd 07 03 00 00       	mov    $0x307,%ebp
    152e:	44 29 e0             	sub    %r12d,%eax
    1531:	31 44 24 1c          	xor    %eax,0x1c(%rsp)
    1535:	e9 f9 00 00 00       	jmp    1633 <func0+0x393>
    153a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1540:	ba 10 00 00 00       	mov    $0x10,%edx
    1545:	48 89 de             	mov    %rbx,%rsi
    1548:	bf 01 00 00 00       	mov    $0x1,%edi
    154d:	31 c0                	xor    %eax,%eax
    154f:	e8 0c fb ff ff       	call   1060 <__printf_chk@plt>
    1554:	31 c0                	xor    %eax,%eax
    1556:	ba 11 00 00 00       	mov    $0x11,%edx
    155b:	48 89 de             	mov    %rbx,%rsi
    155e:	bf 01 00 00 00       	mov    $0x1,%edi
    1563:	e8 f8 fa ff ff       	call   1060 <__printf_chk@plt>
    1568:	41 39 ef             	cmp    %ebp,%r15d
    156b:	7c 19                	jl     1586 <func0+0x2e6>
    156d:	0f 1f 00             	nopl   (%rax)
    1570:	ba 12 00 00 00       	mov    $0x12,%edx
    1575:	48 89 de             	mov    %rbx,%rsi
    1578:	bf 01 00 00 00       	mov    $0x1,%edi
    157d:	31 c0                	xor    %eax,%eax
    157f:	e8 dc fa ff ff       	call   1060 <__printf_chk@plt>
    1584:	eb ea                	jmp    1570 <func0+0x2d0>
    1586:	41 81 fe a1 03 00 00 	cmp    $0x3a1,%r14d
    158d:	74 5c                	je     15eb <func0+0x34b>
    158f:	45 39 ec             	cmp    %r13d,%r12d
    1592:	0f 8d 8c 0a 00 00    	jge    2024 <func0+0xd84>
    1598:	41 89 ed             	mov    %ebp,%r13d
    159b:	e9 90 fe ff ff       	jmp    1430 <func0+0x190>
    15a0:	ba 0d 00 00 00       	mov    $0xd,%edx
    15a5:	48 89 de             	mov    %rbx,%rsi
    15a8:	bf 01 00 00 00       	mov    $0x1,%edi
    15ad:	31 c0                	xor    %eax,%eax
    15af:	e8 ac fa ff ff       	call   1060 <__printf_chk@plt>
    15b4:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    15b8:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
    15bc:	44 89 ea             	mov    %r13d,%edx
    15bf:	f7 d2                	not    %edx
    15c1:	01 c8                	add    %ecx,%eax
    15c3:	89 44 24 08          	mov    %eax,0x8(%rsp)
    15c7:	48 63 c2             	movslq %edx,%rax
    15ca:	c1 fa 1f             	sar    $0x1f,%edx
    15cd:	48 69 c0 5b fd ab 54 	imul   $0x54abfd5b,%rax,%rax
    15d4:	48 c1 f8 27          	sar    $0x27,%rax
    15d8:	29 d0                	sub    %edx,%eax
    15da:	89 44 24 10          	mov    %eax,0x10(%rsp)
    15de:	e9 9a fe ff ff       	jmp    147d <func0+0x1dd>
    15e3:	44 89 ed             	mov    %r13d,%ebp
    15e6:	e9 69 ff ff ff       	jmp    1554 <func0+0x2b4>
    15eb:	44 8b 64 24 2c       	mov    0x2c(%rsp),%r12d
    15f0:	31 c0                	xor    %eax,%eax
    15f2:	ba 13 00 00 00       	mov    $0x13,%edx
    15f7:	48 89 de             	mov    %rbx,%rsi
    15fa:	bf 01 00 00 00       	mov    $0x1,%edi
    15ff:	e8 5c fa ff ff       	call   1060 <__printf_chk@plt>
    1604:	41 81 fc a1 03 00 00 	cmp    $0x3a1,%r12d
    160b:	0f 8e 72 08 00 00    	jle    1e83 <func0+0xbe3>
    1611:	ba 1e 00 00 00       	mov    $0x1e,%edx
    1616:	48 89 de             	mov    %rbx,%rsi
    1619:	bf 01 00 00 00       	mov    $0x1,%edi
    161e:	31 c0                	xor    %eax,%eax
    1620:	e8 3b fa ff ff       	call   1060 <__printf_chk@plt>
    1625:	c7 44 24 10 83 01 00 	movl   $0x183,0x10(%rsp)
    162c:	00 
    162d:	41 be a1 03 00 00    	mov    $0x3a1,%r14d
    1633:	44 89 74 24 18       	mov    %r14d,0x18(%rsp)
    1638:	41 bd 41 03 00 00    	mov    $0x341,%r13d
    163e:	66 90                	xchg   %ax,%ax
    1640:	ba 1f 00 00 00       	mov    $0x1f,%edx
    1645:	48 89 de             	mov    %rbx,%rsi
    1648:	bf 01 00 00 00       	mov    $0x1,%edi
    164d:	31 c0                	xor    %eax,%eax
    164f:	e8 0c fa ff ff       	call   1060 <__printf_chk@plt>
    1654:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    1658:	39 c5                	cmp    %eax,%ebp
    165a:	0f 84 ad 06 00 00    	je     1d0d <func0+0xa6d>
    1660:	ba 24 00 00 00       	mov    $0x24,%edx
    1665:	48 89 de             	mov    %rbx,%rsi
    1668:	bf 01 00 00 00       	mov    $0x1,%edi
    166d:	31 c0                	xor    %eax,%eax
    166f:	e8 ec f9 ff ff       	call   1060 <__printf_chk@plt>
    1674:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
    1679:	45 39 f4             	cmp    %r14d,%r12d
    167c:	0f 84 e6 03 00 00    	je     1a68 <func0+0x7c8>
    1682:	ba 25 00 00 00       	mov    $0x25,%edx
    1687:	48 89 de             	mov    %rbx,%rsi
    168a:	bf 01 00 00 00       	mov    $0x1,%edi
    168f:	31 c0                	xor    %eax,%eax
    1691:	e8 ca f9 ff ff       	call   1060 <__printf_chk@plt>
    1696:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
    169a:	44 89 f0             	mov    %r14d,%eax
    169d:	29 c8                	sub    %ecx,%eax
    169f:	99                   	cltd   
    16a0:	41 f7 ff             	idiv   %r15d
    16a3:	89 44 24 08          	mov    %eax,0x8(%rsp)
    16a7:	41 81 fd 14 01 00 00 	cmp    $0x114,%r13d
    16ae:	7f 16                	jg     16c6 <func0+0x426>
    16b0:	ba 26 00 00 00       	mov    $0x26,%edx
    16b5:	48 89 de             	mov    %rbx,%rsi
    16b8:	bf 01 00 00 00       	mov    $0x1,%edi
    16bd:	31 c0                	xor    %eax,%eax
    16bf:	e8 9c f9 ff ff       	call   1060 <__printf_chk@plt>
    16c4:	eb ea                	jmp    16b0 <func0+0x410>
    16c6:	ba 27 00 00 00       	mov    $0x27,%edx
    16cb:	48 89 de             	mov    %rbx,%rsi
    16ce:	bf 01 00 00 00       	mov    $0x1,%edi
    16d3:	31 c0                	xor    %eax,%eax
    16d5:	e8 86 f9 ff ff       	call   1060 <__printf_chk@plt>
    16da:	8b 44 24 08          	mov    0x8(%rsp),%eax
    16de:	46 8d 2c 20          	lea    (%rax,%r12,1),%r13d
    16e2:	8b 44 24 10          	mov    0x10(%rsp),%eax
    16e6:	01 c5                	add    %eax,%ebp
    16e8:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    16ec:	41 31 c7             	xor    %eax,%r15d
    16ef:	ba 32 00 00 00       	mov    $0x32,%edx
    16f4:	48 89 de             	mov    %rbx,%rsi
    16f7:	bf 01 00 00 00       	mov    $0x1,%edi
    16fc:	31 c0                	xor    %eax,%eax
    16fe:	e8 5d f9 ff ff       	call   1060 <__printf_chk@plt>
    1703:	8b 44 24 08          	mov    0x8(%rsp),%eax
    1707:	39 c5                	cmp    %eax,%ebp
    1709:	0f 8c 71 04 00 00    	jl     1b80 <func0+0x8e0>
    170f:	31 c0                	xor    %eax,%eax
    1711:	ba 36 00 00 00       	mov    $0x36,%edx
    1716:	48 89 de             	mov    %rbx,%rsi
    1719:	bf 01 00 00 00       	mov    $0x1,%edi
    171e:	e8 3d f9 ff ff       	call   1060 <__printf_chk@plt>
    1723:	81 fd 5e 03 00 00    	cmp    $0x35e,%ebp
    1729:	0f 8f be 00 00 00    	jg     17ed <func0+0x54d>
    172f:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
    1733:	39 4c 24 10          	cmp    %ecx,0x10(%rsp)
    1737:	7d 37                	jge    1770 <func0+0x4d0>
    1739:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1740:	48 89 de             	mov    %rbx,%rsi
    1743:	ba 37 00 00 00       	mov    $0x37,%edx
    1748:	bf 01 00 00 00       	mov    $0x1,%edi
    174d:	31 c0                	xor    %eax,%eax
    174f:	e8 0c f9 ff ff       	call   1060 <__printf_chk@plt>
    1754:	ba 39 00 00 00       	mov    $0x39,%edx
    1759:	48 89 de             	mov    %rbx,%rsi
    175c:	31 c0                	xor    %eax,%eax
    175e:	bf 01 00 00 00       	mov    $0x1,%edi
    1763:	e8 f8 f8 ff ff       	call   1060 <__printf_chk@plt>
    1768:	eb d6                	jmp    1740 <func0+0x4a0>
    176a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1770:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
    1774:	44 89 e0             	mov    %r12d,%eax
    1777:	f7 d0                	not    %eax
    1779:	09 c1                	or     %eax,%ecx
    177b:	8b 44 24 14          	mov    0x14(%rsp),%eax
    177f:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
    1783:	41 89 c6             	mov    %eax,%r14d
    1786:	f7 d0                	not    %eax
    1788:	41 09 ce             	or     %ecx,%r14d
    178b:	41 89 c5             	mov    %eax,%r13d
    178e:	66 90                	xchg   %ax,%ax
    1790:	ba 37 00 00 00       	mov    $0x37,%edx
    1795:	48 89 de             	mov    %rbx,%rsi
    1798:	bf 01 00 00 00       	mov    $0x1,%edi
    179d:	31 c0                	xor    %eax,%eax
    179f:	e8 bc f8 ff ff       	call   1060 <__printf_chk@plt>
    17a4:	ba 38 00 00 00       	mov    $0x38,%edx
    17a9:	48 89 de             	mov    %rbx,%rsi
    17ac:	31 c0                	xor    %eax,%eax
    17ae:	bf 01 00 00 00       	mov    $0x1,%edi
    17b3:	44 09 ed             	or     %r13d,%ebp
    17b6:	e8 a5 f8 ff ff       	call   1060 <__printf_chk@plt>
    17bb:	ba 39 00 00 00       	mov    $0x39,%edx
    17c0:	48 89 de             	mov    %rbx,%rsi
    17c3:	31 c0                	xor    %eax,%eax
    17c5:	bf 01 00 00 00       	mov    $0x1,%edi
    17ca:	44 31 e5             	xor    %r12d,%ebp
    17cd:	e8 8e f8 ff ff       	call   1060 <__printf_chk@plt>
    17d2:	44 89 f8             	mov    %r15d,%eax
    17d5:	45 89 f7             	mov    %r14d,%r15d
    17d8:	41 21 ef             	and    %ebp,%r15d
    17db:	81 fd 5e 03 00 00    	cmp    $0x35e,%ebp
    17e1:	7e ad                	jle    1790 <func0+0x4f0>
    17e3:	f7 d0                	not    %eax
    17e5:	99                   	cltd   
    17e6:	f7 7c 24 0c          	idivl  0xc(%rsp)
    17ea:	41 89 d5             	mov    %edx,%r13d
    17ed:	31 c0                	xor    %eax,%eax
    17ef:	ba 3a 00 00 00       	mov    $0x3a,%edx
    17f4:	48 89 de             	mov    %rbx,%rsi
    17f7:	bf 01 00 00 00       	mov    $0x1,%edi
    17fc:	e8 5f f8 ff ff       	call   1060 <__printf_chk@plt>
    1801:	44 39 6c 24 18       	cmp    %r13d,0x18(%rsp)
    1806:	0f 8f 34 fe ff ff    	jg     1640 <func0+0x3a0>
    180c:	44 8b 74 24 18       	mov    0x18(%rsp),%r14d
    1811:	ba 3b 00 00 00       	mov    $0x3b,%edx
    1816:	48 89 de             	mov    %rbx,%rsi
    1819:	bf 01 00 00 00       	mov    $0x1,%edi
    181e:	31 c0                	xor    %eax,%eax
    1820:	e8 3b f8 ff ff       	call   1060 <__printf_chk@plt>
    1825:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1829:	41 01 c4             	add    %eax,%r12d
    182c:	45 29 ec             	sub    %r13d,%r12d
    182f:	45 39 f7             	cmp    %r14d,%r15d
    1832:	0f 8d ed 01 00 00    	jge    1a25 <func0+0x785>
    1838:	8b 44 24 10          	mov    0x10(%rsp),%eax
    183c:	89 6c 24 28          	mov    %ebp,0x28(%rsp)
    1840:	44 89 7c 24 18       	mov    %r15d,0x18(%rsp)
    1845:	45 89 f7             	mov    %r14d,%r15d
    1848:	f7 d0                	not    %eax
    184a:	89 44 24 24          	mov    %eax,0x24(%rsp)
    184e:	66 90                	xchg   %ax,%ax
    1850:	ba 3c 00 00 00       	mov    $0x3c,%edx
    1855:	48 89 de             	mov    %rbx,%rsi
    1858:	bf 01 00 00 00       	mov    $0x1,%edi
    185d:	31 c0                	xor    %eax,%eax
    185f:	e8 fc f7 ff ff       	call   1060 <__printf_chk@plt>
    1864:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1868:	99                   	cltd   
    1869:	41 f7 fc             	idiv   %r12d
    186c:	41 89 c6             	mov    %eax,%r14d
    186f:	44 89 f8             	mov    %r15d,%eax
    1872:	f7 d0                	not    %eax
    1874:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    1878:	8b 44 24 24          	mov    0x24(%rsp),%eax
    187c:	44 01 e0             	add    %r12d,%eax
    187f:	89 44 24 20          	mov    %eax,0x20(%rsp)
    1883:	8b 44 24 10          	mov    0x10(%rsp),%eax
    1887:	41 39 c6             	cmp    %eax,%r14d
    188a:	7c 24                	jl     18b0 <func0+0x610>
    188c:	0f 1f 40 00          	nopl   0x0(%rax)
    1890:	ba 3d 00 00 00       	mov    $0x3d,%edx
    1895:	48 89 de             	mov    %rbx,%rsi
    1898:	bf 01 00 00 00       	mov    $0x1,%edi
    189d:	31 c0                	xor    %eax,%eax
    189f:	e8 bc f7 ff ff       	call   1060 <__printf_chk@plt>
    18a4:	eb ea                	jmp    1890 <func0+0x5f0>
    18a6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    18ad:	00 00 00 
    18b0:	31 c0                	xor    %eax,%eax
    18b2:	ba 3e 00 00 00       	mov    $0x3e,%edx
    18b7:	48 89 de             	mov    %rbx,%rsi
    18ba:	bf 01 00 00 00       	mov    $0x1,%edi
    18bf:	e8 9c f7 ff ff       	call   1060 <__printf_chk@plt>
    18c4:	81 7c 24 18 9f 02 00 	cmpl   $0x29f,0x18(%rsp)
    18cb:	00 
    18cc:	0f 84 7e 00 00 00    	je     1950 <func0+0x6b0>
    18d2:	ba 3f 00 00 00       	mov    $0x3f,%edx
    18d7:	48 89 de             	mov    %rbx,%rsi
    18da:	bf 01 00 00 00       	mov    $0x1,%edi
    18df:	31 c0                	xor    %eax,%eax
    18e1:	e8 7a f7 ff ff       	call   1060 <__printf_chk@plt>
    18e6:	8b 4c 24 20          	mov    0x20(%rsp),%ecx
    18ea:	39 4c 24 1c          	cmp    %ecx,0x1c(%rsp)
    18ee:	7d 16                	jge    1906 <func0+0x666>
    18f0:	ba 40 00 00 00       	mov    $0x40,%edx
    18f5:	48 89 de             	mov    %rbx,%rsi
    18f8:	bf 01 00 00 00       	mov    $0x1,%edi
    18fd:	31 c0                	xor    %eax,%eax
    18ff:	e8 5c f7 ff ff       	call   1060 <__printf_chk@plt>
    1904:	eb ea                	jmp    18f0 <func0+0x650>
    1906:	ba 41 00 00 00       	mov    $0x41,%edx
    190b:	48 89 de             	mov    %rbx,%rsi
    190e:	bf 01 00 00 00       	mov    $0x1,%edi
    1913:	31 c0                	xor    %eax,%eax
    1915:	e8 46 f7 ff ff       	call   1060 <__printf_chk@plt>
    191a:	44 89 f8             	mov    %r15d,%eax
    191d:	41 0f af c4          	imul   %r12d,%eax
    1921:	41 39 c6             	cmp    %eax,%r14d
    1924:	0f 85 64 04 00 00    	jne    1d8e <func0+0xaee>
    192a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1930:	ba 42 00 00 00       	mov    $0x42,%edx
    1935:	48 89 de             	mov    %rbx,%rsi
    1938:	bf 01 00 00 00       	mov    $0x1,%edi
    193d:	31 c0                	xor    %eax,%eax
    193f:	e8 1c f7 ff ff       	call   1060 <__printf_chk@plt>
    1944:	eb ea                	jmp    1930 <func0+0x690>
    1946:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    194d:	00 00 00 
    1950:	ba 43 00 00 00       	mov    $0x43,%edx
    1955:	48 89 de             	mov    %rbx,%rsi
    1958:	bf 01 00 00 00       	mov    $0x1,%edi
    195d:	31 c0                	xor    %eax,%eax
    195f:	e8 fc f6 ff ff       	call   1060 <__printf_chk@plt>
    1964:	8b 6c 24 14          	mov    0x14(%rsp),%ebp
    1968:	41 0f af ed          	imul   %r13d,%ebp
    196c:	41 0f af ee          	imul   %r14d,%ebp
    1970:	44 39 6c 24 1c       	cmp    %r13d,0x1c(%rsp)
    1975:	0f 84 2d 03 00 00    	je     1ca8 <func0+0xa08>
    197b:	ba 45 00 00 00       	mov    $0x45,%edx
    1980:	48 89 de             	mov    %rbx,%rsi
    1983:	bf 01 00 00 00       	mov    $0x1,%edi
    1988:	31 c0                	xor    %eax,%eax
    198a:	e8 d1 f6 ff ff       	call   1060 <__printf_chk@plt>
    198f:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
    1994:	45 09 fd             	or     %r15d,%r13d
    1997:	45 0f af ee          	imul   %r14d,%r13d
    199b:	44 31 6c 24 08       	xor    %r13d,0x8(%rsp)
    19a0:	31 c0                	xor    %eax,%eax
    19a2:	ba 46 00 00 00       	mov    $0x46,%edx
    19a7:	48 89 de             	mov    %rbx,%rsi
    19aa:	bf 01 00 00 00       	mov    $0x1,%edi
    19af:	e8 ac f6 ff ff       	call   1060 <__printf_chk@plt>
    19b4:	81 7c 24 28 6e 01 00 	cmpl   $0x16e,0x28(%rsp)
    19bb:	00 
    19bc:	0f 8e 1e 03 00 00    	jle    1ce0 <func0+0xa40>
    19c2:	31 c0                	xor    %eax,%eax
    19c4:	ba 48 00 00 00       	mov    $0x48,%edx
    19c9:	48 89 de             	mov    %rbx,%rsi
    19cc:	bf 01 00 00 00       	mov    $0x1,%edi
    19d1:	e8 8a f6 ff ff       	call   1060 <__printf_chk@plt>
    19d6:	41 81 fc ae 03 00 00 	cmp    $0x3ae,%r12d
    19dd:	7e 36                	jle    1a15 <func0+0x775>
    19df:	8b 44 24 14          	mov    0x14(%rsp),%eax
    19e3:	45 8d 7c 05 00       	lea    0x0(%r13,%rax,1),%r15d
    19e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    19ef:	00 
    19f0:	ba 49 00 00 00       	mov    $0x49,%edx
    19f5:	48 89 de             	mov    %rbx,%rsi
    19f8:	bf 01 00 00 00       	mov    $0x1,%edi
    19fd:	31 c0                	xor    %eax,%eax
    19ff:	e8 5c f6 ff ff       	call   1060 <__printf_chk@plt>
    1a04:	44 89 e8             	mov    %r13d,%eax
    1a07:	99                   	cltd   
    1a08:	f7 fd                	idiv   %ebp
    1a0a:	81 fa ae 03 00 00    	cmp    $0x3ae,%edx
    1a10:	7f de                	jg     19f0 <func0+0x750>
    1a12:	41 89 d4             	mov    %edx,%r12d
    1a15:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1a19:	41 39 c7             	cmp    %eax,%r15d
    1a1c:	0f 8f 2e fe ff ff    	jg     1850 <func0+0x5b0>
    1a22:	41 89 c7             	mov    %eax,%r15d
    1a25:	48 89 de             	mov    %rbx,%rsi
    1a28:	ba 4a 00 00 00       	mov    $0x4a,%edx
    1a2d:	bf 01 00 00 00       	mov    $0x1,%edi
    1a32:	31 c0                	xor    %eax,%eax
    1a34:	e8 27 f6 ff ff       	call   1060 <__printf_chk@plt>
    1a39:	48 89 de             	mov    %rbx,%rsi
    1a3c:	ba 4b 00 00 00       	mov    $0x4b,%edx
    1a41:	31 c0                	xor    %eax,%eax
    1a43:	bf 01 00 00 00       	mov    $0x1,%edi
    1a48:	e8 13 f6 ff ff       	call   1060 <__printf_chk@plt>
    1a4d:	8b 44 24 10          	mov    0x10(%rsp),%eax
    1a51:	48 83 c4 38          	add    $0x38,%rsp
    1a55:	5b                   	pop    %rbx
    1a56:	5d                   	pop    %rbp
    1a57:	41 0f af c7          	imul   %r15d,%eax
    1a5b:	41 5c                	pop    %r12
    1a5d:	41 5d                	pop    %r13
    1a5f:	41 5e                	pop    %r14
    1a61:	41 5f                	pop    %r15
    1a63:	c3                   	ret    
    1a64:	0f 1f 40 00          	nopl   0x0(%rax)
    1a68:	31 c0                	xor    %eax,%eax
    1a6a:	ba 28 00 00 00       	mov    $0x28,%edx
    1a6f:	48 89 de             	mov    %rbx,%rsi
    1a72:	bf 01 00 00 00       	mov    $0x1,%edi
    1a77:	e8 e4 f5 ff ff       	call   1060 <__printf_chk@plt>
    1a7c:	44 39 64 24 0c       	cmp    %r12d,0xc(%rsp)
    1a81:	0f 84 20 03 00 00    	je     1da7 <func0+0xb07>
    1a87:	31 c0                	xor    %eax,%eax
    1a89:	ba 2a 00 00 00       	mov    $0x2a,%edx
    1a8e:	48 89 de             	mov    %rbx,%rsi
    1a91:	bf 01 00 00 00       	mov    $0x1,%edi
    1a96:	e8 c5 f5 ff ff       	call   1060 <__printf_chk@plt>
    1a9b:	41 81 ff 0f 01 00 00 	cmp    $0x10f,%r15d
    1aa2:	0f 8e 68 01 00 00    	jle    1c10 <func0+0x970>
    1aa8:	ba 2b 00 00 00       	mov    $0x2b,%edx
    1aad:	48 89 de             	mov    %rbx,%rsi
    1ab0:	bf 01 00 00 00       	mov    $0x1,%edi
    1ab5:	31 c0                	xor    %eax,%eax
    1ab7:	e8 a4 f5 ff ff       	call   1060 <__printf_chk@plt>
    1abc:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
    1ac1:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    1ac5:	44 89 64 24 0c       	mov    %r12d,0xc(%rsp)
    1aca:	41 f7 d4             	not    %r12d
    1acd:	41 31 c6             	xor    %eax,%r14d
    1ad0:	bf 01 00 00 00       	mov    $0x1,%edi
    1ad5:	ba 2d 00 00 00       	mov    $0x2d,%edx
    1ada:	48 89 de             	mov    %rbx,%rsi
    1add:	31 c0                	xor    %eax,%eax
    1adf:	e8 7c f5 ff ff       	call   1060 <__printf_chk@plt>
    1ae4:	8b 7c 24 14          	mov    0x14(%rsp),%edi
    1ae8:	39 7c 24 10          	cmp    %edi,0x10(%rsp)
    1aec:	0f 8d 5e 01 00 00    	jge    1c50 <func0+0x9b0>
    1af2:	ba 2e 00 00 00       	mov    $0x2e,%edx
    1af7:	bf 01 00 00 00       	mov    $0x1,%edi
    1afc:	48 89 de             	mov    %rbx,%rsi
    1aff:	31 c0                	xor    %eax,%eax
    1b01:	e8 5a f5 ff ff       	call   1060 <__printf_chk@plt>
    1b06:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    1b0a:	44 89 ef             	mov    %r13d,%edi
    1b0d:	29 cf                	sub    %ecx,%edi
    1b0f:	89 f8                	mov    %edi,%eax
    1b11:	99                   	cltd   
    1b12:	41 f7 fe             	idiv   %r14d
    1b15:	8d 04 2a             	lea    (%rdx,%rbp,1),%eax
    1b18:	89 44 24 18          	mov    %eax,0x18(%rsp)
    1b1c:	41 8d 04 2e          	lea    (%r14,%rbp,1),%eax
    1b20:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1b24:	31 c0                	xor    %eax,%eax
    1b26:	ba 30 00 00 00       	mov    $0x30,%edx
    1b2b:	48 89 de             	mov    %rbx,%rsi
    1b2e:	bf 01 00 00 00       	mov    $0x1,%edi
    1b33:	e8 28 f5 ff ff       	call   1060 <__printf_chk@plt>
    1b38:	45 39 ee             	cmp    %r13d,%r14d
    1b3b:	0f 8c ae fb ff ff    	jl     16ef <func0+0x44f>
    1b41:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1b45:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
    1b4a:	41 0f af c7          	imul   %r15d,%eax
    1b4e:	41 f7 d5             	not    %r13d
    1b51:	44 21 e8             	and    %r13d,%eax
    1b54:	44 29 f8             	sub    %r15d,%eax
    1b57:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1b5b:	45 39 ee             	cmp    %r13d,%r14d
    1b5e:	0f 8c 8e 00 00 00    	jl     1bf2 <func0+0x952>
    1b64:	0f 1f 40 00          	nopl   0x0(%rax)
    1b68:	ba 31 00 00 00       	mov    $0x31,%edx
    1b6d:	48 89 de             	mov    %rbx,%rsi
    1b70:	bf 01 00 00 00       	mov    $0x1,%edi
    1b75:	31 c0                	xor    %eax,%eax
    1b77:	e8 e4 f4 ff ff       	call   1060 <__printf_chk@plt>
    1b7c:	eb ea                	jmp    1b68 <func0+0x8c8>
    1b7e:	66 90                	xchg   %ax,%ax
    1b80:	ba 33 00 00 00       	mov    $0x33,%edx
    1b85:	48 89 de             	mov    %rbx,%rsi
    1b88:	bf 01 00 00 00       	mov    $0x1,%edi
    1b8d:	31 c0                	xor    %eax,%eax
    1b8f:	e8 cc f4 ff ff       	call   1060 <__printf_chk@plt>
    1b94:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1b98:	41 39 c7             	cmp    %eax,%r15d
    1b9b:	0f 84 34 02 00 00    	je     1dd5 <func0+0xb35>
    1ba1:	45 89 fe             	mov    %r15d,%r14d
    1ba4:	41 f7 d6             	not    %r14d
    1ba7:	ba 35 00 00 00       	mov    $0x35,%edx
    1bac:	48 89 de             	mov    %rbx,%rsi
    1baf:	bf 01 00 00 00       	mov    $0x1,%edi
    1bb4:	31 c0                	xor    %eax,%eax
    1bb6:	e8 a5 f4 ff ff       	call   1060 <__printf_chk@plt>
    1bbb:	8b 44 24 10          	mov    0x10(%rsp),%eax
    1bbf:	8b 74 24 18          	mov    0x18(%rsp),%esi
    1bc3:	44 8b 6c 24 0c       	mov    0xc(%rsp),%r13d
    1bc8:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
    1bcc:	41 29 f6             	sub    %esi,%r14d
    1bcf:	8b 7c 24 1c          	mov    0x1c(%rsp),%edi
    1bd3:	09 c6                	or     %eax,%esi
    1bd5:	31 c1                	xor    %eax,%ecx
    1bd7:	41 21 c5             	and    %eax,%r13d
    1bda:	89 f0                	mov    %esi,%eax
    1bdc:	44 89 74 24 0c       	mov    %r14d,0xc(%rsp)
    1be1:	01 f9                	add    %edi,%ecx
    1be3:	99                   	cltd   
    1be4:	f7 f9                	idiv   %ecx
    1be6:	99                   	cltd   
    1be7:	f7 f9                	idiv   %ecx
    1be9:	89 54 24 18          	mov    %edx,0x18(%rsp)
    1bed:	e9 1d fb ff ff       	jmp    170f <func0+0x46f>
    1bf2:	ba 31 00 00 00       	mov    $0x31,%edx
    1bf7:	48 89 de             	mov    %rbx,%rsi
    1bfa:	bf 01 00 00 00       	mov    $0x1,%edi
    1bff:	31 c0                	xor    %eax,%eax
    1c01:	e8 5a f4 ff ff       	call   1060 <__printf_chk@plt>
    1c06:	44 89 ed             	mov    %r13d,%ebp
    1c09:	e9 e1 fa ff ff       	jmp    16ef <func0+0x44f>
    1c0e:	66 90                	xchg   %ax,%ax
    1c10:	ba 2c 00 00 00       	mov    $0x2c,%edx
    1c15:	48 89 de             	mov    %rbx,%rsi
    1c18:	bf 01 00 00 00       	mov    $0x1,%edi
    1c1d:	31 c0                	xor    %eax,%eax
    1c1f:	44 8b 74 24 0c       	mov    0xc(%rsp),%r14d
    1c24:	e8 37 f4 ff ff       	call   1060 <__printf_chk@plt>
    1c29:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    1c2d:	41 29 ee             	sub    %ebp,%r14d
    1c30:	99                   	cltd   
    1c31:	41 f7 fd             	idiv   %r13d
    1c34:	8b 44 24 10          	mov    0x10(%rsp),%eax
    1c38:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1c3c:	31 ea                	xor    %ebp,%edx
    1c3e:	41 89 d4             	mov    %edx,%r12d
    1c41:	e9 8a fe ff ff       	jmp    1ad0 <func0+0x830>
    1c46:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    1c4d:	00 00 00 
    1c50:	ba 2f 00 00 00       	mov    $0x2f,%edx
    1c55:	bf 01 00 00 00       	mov    $0x1,%edi
    1c5a:	48 89 de             	mov    %rbx,%rsi
    1c5d:	31 c0                	xor    %eax,%eax
    1c5f:	e8 fc f3 ff ff       	call   1060 <__printf_chk@plt>
    1c64:	8b 44 24 18          	mov    0x18(%rsp),%eax
    1c68:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
    1c6c:	8b 7c 24 14          	mov    0x14(%rsp),%edi
    1c70:	99                   	cltd   
    1c71:	f7 d1                	not    %ecx
    1c73:	41 f7 fd             	idiv   %r13d
    1c76:	0f af d1             	imul   %ecx,%edx
    1c79:	42 8d 04 32          	lea    (%rdx,%r14,1),%eax
    1c7d:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1c81:	8d 44 3d 00          	lea    0x0(%rbp,%rdi,1),%eax
    1c85:	99                   	cltd   
    1c86:	f7 ff                	idiv   %edi
    1c88:	89 d0                	mov    %edx,%eax
    1c8a:	99                   	cltd   
    1c8b:	f7 f9                	idiv   %ecx
    1c8d:	89 c1                	mov    %eax,%ecx
    1c8f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1c93:	0f af c8             	imul   %eax,%ecx
    1c96:	89 c8                	mov    %ecx,%eax
    1c98:	41 0f af c7          	imul   %r15d,%eax
    1c9c:	89 44 24 14          	mov    %eax,0x14(%rsp)
    1ca0:	e9 7f fe ff ff       	jmp    1b24 <func0+0x884>
    1ca5:	0f 1f 00             	nopl   (%rax)
    1ca8:	ba 44 00 00 00       	mov    $0x44,%edx
    1cad:	48 89 de             	mov    %rbx,%rsi
    1cb0:	bf 01 00 00 00       	mov    $0x1,%edi
    1cb5:	31 c0                	xor    %eax,%eax
    1cb7:	e8 a4 f3 ff ff       	call   1060 <__printf_chk@plt>
    1cbc:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    1cc0:	8b 44 24 28          	mov    0x28(%rsp),%eax
    1cc4:	31 c8                	xor    %ecx,%eax
    1cc6:	01 c8                	add    %ecx,%eax
    1cc8:	99                   	cltd   
    1cc9:	f7 f9                	idiv   %ecx
    1ccb:	44 09 ea             	or     %r13d,%edx
    1cce:	89 54 24 14          	mov    %edx,0x14(%rsp)
    1cd2:	e9 c9 fc ff ff       	jmp    19a0 <func0+0x700>
    1cd7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1cde:	00 00 
    1ce0:	ba 47 00 00 00       	mov    $0x47,%edx
    1ce5:	48 89 de             	mov    %rbx,%rsi
    1ce8:	bf 01 00 00 00       	mov    $0x1,%edi
    1ced:	31 c0                	xor    %eax,%eax
    1cef:	e8 6c f3 ff ff       	call   1060 <__printf_chk@plt>
    1cf4:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1cf8:	8b 4c 24 20          	mov    0x20(%rsp),%ecx
    1cfc:	99                   	cltd   
    1cfd:	f7 7c 24 10          	idivl  0x10(%rsp)
    1d01:	0f af c8             	imul   %eax,%ecx
    1d04:	89 4c 24 28          	mov    %ecx,0x28(%rsp)
    1d08:	e9 b5 fc ff ff       	jmp    19c2 <func0+0x722>
    1d0d:	ba 20 00 00 00       	mov    $0x20,%edx
    1d12:	48 89 de             	mov    %rbx,%rsi
    1d15:	bf 01 00 00 00       	mov    $0x1,%edi
    1d1a:	31 c0                	xor    %eax,%eax
    1d1c:	e8 3f f3 ff ff       	call   1060 <__printf_chk@plt>
    1d21:	8b 44 24 10          	mov    0x10(%rsp),%eax
    1d25:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
    1d29:	99                   	cltd   
    1d2a:	f7 7c 24 14          	idivl  0x14(%rsp)
    1d2e:	09 c8                	or     %ecx,%eax
    1d30:	44 21 f8             	and    %r15d,%eax
    1d33:	41 89 c6             	mov    %eax,%r14d
    1d36:	41 81 fc eb 00 00 00 	cmp    $0xeb,%r12d
    1d3d:	7e 17                	jle    1d56 <func0+0xab6>
    1d3f:	90                   	nop
    1d40:	ba 21 00 00 00       	mov    $0x21,%edx
    1d45:	48 89 de             	mov    %rbx,%rsi
    1d48:	bf 01 00 00 00       	mov    $0x1,%edi
    1d4d:	31 c0                	xor    %eax,%eax
    1d4f:	e8 0c f3 ff ff       	call   1060 <__printf_chk@plt>
    1d54:	eb ea                	jmp    1d40 <func0+0xaa0>
    1d56:	31 c0                	xor    %eax,%eax
    1d58:	ba 22 00 00 00       	mov    $0x22,%edx
    1d5d:	48 89 de             	mov    %rbx,%rsi
    1d60:	bf 01 00 00 00       	mov    $0x1,%edi
    1d65:	e8 f6 f2 ff ff       	call   1060 <__printf_chk@plt>
    1d6a:	41 39 ee             	cmp    %ebp,%r14d
    1d6d:	0f 8c ed f8 ff ff    	jl     1660 <func0+0x3c0>
    1d73:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1d78:	ba 23 00 00 00       	mov    $0x23,%edx
    1d7d:	48 89 de             	mov    %rbx,%rsi
    1d80:	bf 01 00 00 00       	mov    $0x1,%edi
    1d85:	31 c0                	xor    %eax,%eax
    1d87:	e8 d4 f2 ff ff       	call   1060 <__printf_chk@plt>
    1d8c:	eb ea                	jmp    1d78 <func0+0xad8>
    1d8e:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
    1d92:	44 8b 7c 24 20       	mov    0x20(%rsp),%r15d
    1d97:	09 c8                	or     %ecx,%eax
    1d99:	45 09 ef             	or     %r13d,%r15d
    1d9c:	01 c1                	add    %eax,%ecx
    1d9e:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
    1da2:	e9 6e fc ff ff       	jmp    1a15 <func0+0x775>
    1da7:	ba 29 00 00 00       	mov    $0x29,%edx
    1dac:	48 89 de             	mov    %rbx,%rsi
    1daf:	bf 01 00 00 00       	mov    $0x1,%edi
    1db4:	31 c0                	xor    %eax,%eax
    1db6:	e8 a5 f2 ff ff       	call   1060 <__printf_chk@plt>
    1dbb:	8b 4c 24 1c          	mov    0x1c(%rsp),%ecx
    1dbf:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1dc3:	0f af c1             	imul   %ecx,%eax
    1dc6:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
    1dca:	29 c8                	sub    %ecx,%eax
    1dcc:	89 44 24 08          	mov    %eax,0x8(%rsp)
    1dd0:	e9 b2 fc ff ff       	jmp    1a87 <func0+0x7e7>
    1dd5:	ba 34 00 00 00       	mov    $0x34,%edx
    1dda:	48 89 de             	mov    %rbx,%rsi
    1ddd:	bf 01 00 00 00       	mov    $0x1,%edi
    1de2:	31 c0                	xor    %eax,%eax
    1de4:	e8 77 f2 ff ff       	call   1060 <__printf_chk@plt>
    1de9:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    1ded:	41 89 ee             	mov    %ebp,%r14d
    1df0:	8d 44 0d 00          	lea    0x0(%rbp,%rcx,1),%eax
    1df4:	99                   	cltd   
    1df5:	f7 f9                	idiv   %ecx
    1df7:	41 0f af d7          	imul   %r15d,%edx
    1dfb:	41 89 ef             	mov    %ebp,%r15d
    1dfe:	41 f7 d7             	not    %r15d
    1e01:	89 54 24 10          	mov    %edx,0x10(%rsp)
    1e05:	e9 9d fd ff ff       	jmp    1ba7 <func0+0x907>
    1e0a:	c7 44 24 08 15 01 00 	movl   $0x115,0x8(%rsp)
    1e11:	00 
    1e12:	bd 07 03 00 00       	mov    $0x307,%ebp
    1e17:	41 bd 41 03 00 00    	mov    $0x341,%r13d
    1e1d:	e9 ef f9 ff ff       	jmp    1811 <func0+0x571>
    1e22:	48 63 54 24 14       	movslq 0x14(%rsp),%rdx
    1e27:	c7 44 24 08 15 01 00 	movl   $0x115,0x8(%rsp)
    1e2e:	00 
    1e2f:	bd 07 03 00 00       	mov    $0x307,%ebp
    1e34:	48 89 d1             	mov    %rdx,%rcx
    1e37:	48 69 d2 9b 6f 8b 46 	imul   $0x468b6f9b,%rdx,%rdx
    1e3e:	89 c8                	mov    %ecx,%eax
    1e40:	c1 f8 1f             	sar    $0x1f,%eax
    1e43:	48 c1 fa 28          	sar    $0x28,%rdx
    1e47:	29 c2                	sub    %eax,%edx
    1e49:	89 c8                	mov    %ecx,%eax
    1e4b:	69 d2 a1 03 00 00    	imul   $0x3a1,%edx,%edx
    1e51:	29 d0                	sub    %edx,%eax
    1e53:	99                   	cltd   
    1e54:	f7 7c 24 1c          	idivl  0x1c(%rsp)
    1e58:	48 63 d0             	movslq %eax,%rdx
    1e5b:	89 c1                	mov    %eax,%ecx
    1e5d:	48 69 d2 93 0a 20 a9 	imul   $0xffffffffa9200a93,%rdx,%rdx
    1e64:	c1 f9 1f             	sar    $0x1f,%ecx
    1e67:	48 c1 ea 20          	shr    $0x20,%rdx
    1e6b:	01 c2                	add    %eax,%edx
    1e6d:	c1 fa 09             	sar    $0x9,%edx
    1e70:	29 ca                	sub    %ecx,%edx
    1e72:	69 d2 07 03 00 00    	imul   $0x307,%edx,%edx
    1e78:	29 d0                	sub    %edx,%eax
    1e7a:	89 44 24 10          	mov    %eax,0x10(%rsp)
    1e7e:	e9 6d f7 ff ff       	jmp    15f0 <func0+0x350>
    1e83:	31 c0                	xor    %eax,%eax
    1e85:	ba 14 00 00 00       	mov    $0x14,%edx
    1e8a:	48 89 de             	mov    %rbx,%rsi
    1e8d:	bf 01 00 00 00       	mov    $0x1,%edi
    1e92:	e8 c9 f1 ff ff       	call   1060 <__printf_chk@plt>
    1e97:	81 7c 24 1c f3 00 00 	cmpl   $0xf3,0x1c(%rsp)
    1e9e:	00 
    1e9f:	0f 8f 11 01 00 00    	jg     1fb6 <func0+0xd16>
    1ea5:	ba 15 00 00 00       	mov    $0x15,%edx
    1eaa:	48 89 de             	mov    %rbx,%rsi
    1ead:	bf 01 00 00 00       	mov    $0x1,%edi
    1eb2:	31 c0                	xor    %eax,%eax
    1eb4:	e8 a7 f1 ff ff       	call   1060 <__printf_chk@plt>
    1eb9:	ba 17 00 00 00       	mov    $0x17,%edx
    1ebe:	48 89 de             	mov    %rbx,%rsi
    1ec1:	31 c0                	xor    %eax,%eax
    1ec3:	bf 01 00 00 00       	mov    $0x1,%edi
    1ec8:	e8 93 f1 ff ff       	call   1060 <__printf_chk@plt>
    1ecd:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1ed1:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
    1ed5:	21 c8                	and    %ecx,%eax
    1ed7:	83 f8 6e             	cmp    $0x6e,%eax
    1eda:	0f 85 fe 00 00 00    	jne    1fde <func0+0xd3e>
    1ee0:	ba 18 00 00 00       	mov    $0x18,%edx
    1ee5:	48 89 de             	mov    %rbx,%rsi
    1ee8:	bf 01 00 00 00       	mov    $0x1,%edi
    1eed:	31 c0                	xor    %eax,%eax
    1eef:	41 89 cd             	mov    %ecx,%r13d
    1ef2:	e8 69 f1 ff ff       	call   1060 <__printf_chk@plt>
    1ef7:	48 63 54 24 14       	movslq 0x14(%rsp),%rdx
    1efc:	41 81 f5 a1 03 00 00 	xor    $0x3a1,%r13d
    1f03:	48 89 d1             	mov    %rdx,%rcx
    1f06:	48 69 d2 9b 6f 8b 46 	imul   $0x468b6f9b,%rdx,%rdx
    1f0d:	89 c8                	mov    %ecx,%eax
    1f0f:	c1 f8 1f             	sar    $0x1f,%eax
    1f12:	48 c1 fa 28          	sar    $0x28,%rdx
    1f16:	29 c2                	sub    %eax,%edx
    1f18:	89 c8                	mov    %ecx,%eax
    1f1a:	69 d2 a1 03 00 00    	imul   $0x3a1,%edx,%edx
    1f20:	29 d0                	sub    %edx,%eax
    1f22:	99                   	cltd   
    1f23:	f7 7c 24 1c          	idivl  0x1c(%rsp)
    1f27:	69 c0 a1 03 00 00    	imul   $0x3a1,%eax,%eax
    1f2d:	25 a1 03 00 00       	and    $0x3a1,%eax
    1f32:	44 21 f8             	and    %r15d,%eax
    1f35:	41 89 c6             	mov    %eax,%r14d
    1f38:	31 c0                	xor    %eax,%eax
    1f3a:	ba 1a 00 00 00       	mov    $0x1a,%edx
    1f3f:	48 89 de             	mov    %rbx,%rsi
    1f42:	bf 01 00 00 00       	mov    $0x1,%edi
    1f47:	e8 14 f1 ff ff       	call   1060 <__printf_chk@plt>
    1f4c:	83 fd 4e             	cmp    $0x4e,%ebp
    1f4f:	7f 36                	jg     1f87 <func0+0xce7>
    1f51:	44 89 ed             	mov    %r13d,%ebp
    1f54:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1f58:	f7 d5                	not    %ebp
    1f5a:	41 0f af ef          	imul   %r15d,%ebp
    1f5e:	29 c5                	sub    %eax,%ebp
    1f60:	44 29 f5             	sub    %r14d,%ebp
    1f63:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1f68:	ba 1b 00 00 00       	mov    $0x1b,%edx
    1f6d:	48 89 de             	mov    %rbx,%rsi
    1f70:	bf 01 00 00 00       	mov    $0x1,%edi
    1f75:	31 c0                	xor    %eax,%eax
    1f77:	e8 e4 f0 ff ff       	call   1060 <__printf_chk@plt>
    1f7c:	89 e8                	mov    %ebp,%eax
    1f7e:	99                   	cltd   
    1f7f:	41 f7 fc             	idiv   %r12d
    1f82:	83 fa 4e             	cmp    $0x4e,%edx
    1f85:	7e e1                	jle    1f68 <func0+0xcc8>
    1f87:	ba 1c 00 00 00       	mov    $0x1c,%edx
    1f8c:	48 89 de             	mov    %rbx,%rsi
    1f8f:	bf 01 00 00 00       	mov    $0x1,%edi
    1f94:	31 c0                	xor    %eax,%eax
    1f96:	e8 c5 f0 ff ff       	call   1060 <__printf_chk@plt>
    1f9b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1fa0:	ba 1d 00 00 00       	mov    $0x1d,%edx
    1fa5:	48 89 de             	mov    %rbx,%rsi
    1fa8:	bf 01 00 00 00       	mov    $0x1,%edi
    1fad:	31 c0                	xor    %eax,%eax
    1faf:	e8 ac f0 ff ff       	call   1060 <__printf_chk@plt>
    1fb4:	eb ea                	jmp    1fa0 <func0+0xd00>
    1fb6:	ba 16 00 00 00       	mov    $0x16,%edx
    1fbb:	48 89 de             	mov    %rbx,%rsi
    1fbe:	bf 01 00 00 00       	mov    $0x1,%edi
    1fc3:	31 c0                	xor    %eax,%eax
    1fc5:	e8 96 f0 ff ff       	call   1060 <__printf_chk@plt>
    1fca:	ba 17 00 00 00       	mov    $0x17,%edx
    1fcf:	48 89 de             	mov    %rbx,%rsi
    1fd2:	31 c0                	xor    %eax,%eax
    1fd4:	bf 01 00 00 00       	mov    $0x1,%edi
    1fd9:	e8 82 f0 ff ff       	call   1060 <__printf_chk@plt>
    1fde:	44 8b 6c 24 14       	mov    0x14(%rsp),%r13d
    1fe3:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
    1fe7:	48 89 de             	mov    %rbx,%rsi
    1fea:	bf 01 00 00 00       	mov    $0x1,%edi
    1fef:	44 89 e8             	mov    %r13d,%eax
    1ff2:	31 c8                	xor    %ecx,%eax
    1ff4:	99                   	cltd   
    1ff5:	f7 7c 24 08          	idivl  0x8(%rsp)
    1ff9:	ba 19 00 00 00       	mov    $0x19,%edx
    1ffe:	41 89 c6             	mov    %eax,%r14d
    2001:	31 c0                	xor    %eax,%eax
    2003:	e8 58 f0 ff ff       	call   1060 <__printf_chk@plt>
    2008:	44 89 e8             	mov    %r13d,%eax
    200b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%rsp)
    2012:	00 
    2013:	99                   	cltd   
    2014:	f7 7c 24 10          	idivl  0x10(%rsp)
    2018:	41 89 d5             	mov    %edx,%r13d
    201b:	44 0f af ea          	imul   %edx,%r13d
    201f:	e9 14 ff ff ff       	jmp    1f38 <func0+0xc98>
    2024:	89 ea                	mov    %ebp,%edx
    2026:	44 8b 6c 24 24       	mov    0x24(%rsp),%r13d
    202b:	44 8b 64 24 2c       	mov    0x2c(%rsp),%r12d
    2030:	f7 d2                	not    %edx
    2032:	48 63 c2             	movslq %edx,%rax
    2035:	c1 fa 1f             	sar    $0x1f,%edx
    2038:	41 21 ed             	and    %ebp,%r13d
    203b:	48 69 c0 5b fd ab 54 	imul   $0x54abfd5b,%rax,%rax
    2042:	48 c1 f8 27          	sar    $0x27,%rax
    2046:	29 d0                	sub    %edx,%eax
    2048:	89 44 24 18          	mov    %eax,0x18(%rsp)
    204c:	eb 5f                	jmp    20ad <func0+0xe0d>
    204e:	ba 0e 00 00 00       	mov    $0xe,%edx
    2053:	48 89 de             	mov    %rbx,%rsi
    2056:	bf 01 00 00 00       	mov    $0x1,%edi
    205b:	31 c0                	xor    %eax,%eax
    205d:	e8 fe ef ff ff       	call   1060 <__printf_chk@plt>
    2062:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
    2066:	45 89 ee             	mov    %r13d,%r14d
    2069:	44 01 e0             	add    %r12d,%eax
    206c:	89 44 24 14          	mov    %eax,0x14(%rsp)
    2070:	8b 44 24 20          	mov    0x20(%rsp),%eax
    2074:	89 44 24 10          	mov    %eax,0x10(%rsp)
    2078:	ba 0f 00 00 00       	mov    $0xf,%edx
    207d:	48 89 de             	mov    %rbx,%rsi
    2080:	bf 01 00 00 00       	mov    $0x1,%edi
    2085:	31 c0                	xor    %eax,%eax
    2087:	e8 d4 ef ff ff       	call   1060 <__printf_chk@plt>
    208c:	31 c0                	xor    %eax,%eax
    208e:	ba 11 00 00 00       	mov    $0x11,%edx
    2093:	48 89 de             	mov    %rbx,%rsi
    2096:	bf 01 00 00 00       	mov    $0x1,%edi
    209b:	e8 c0 ef ff ff       	call   1060 <__printf_chk@plt>
    20a0:	41 81 fe a1 03 00 00 	cmp    $0x3a1,%r14d
    20a7:	0f 84 43 f5 ff ff    	je     15f0 <func0+0x350>
    20ad:	31 c0                	xor    %eax,%eax
    20af:	ba 0c 00 00 00       	mov    $0xc,%edx
    20b4:	48 89 de             	mov    %rbx,%rsi
    20b7:	bf 01 00 00 00       	mov    $0x1,%edi
    20bc:	e8 9f ef ff ff       	call   1060 <__printf_chk@plt>
    20c1:	81 7c 24 1c 83 01 00 	cmpl   $0x183,0x1c(%rsp)
    20c8:	00 
    20c9:	75 83                	jne    204e <func0+0xdae>
    20cb:	ba 0d 00 00 00       	mov    $0xd,%edx
    20d0:	48 89 de             	mov    %rbx,%rsi
    20d3:	bf 01 00 00 00       	mov    $0x1,%edi
    20d8:	31 c0                	xor    %eax,%eax
    20da:	e8 81 ef ff ff       	call   1060 <__printf_chk@plt>
    20df:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    20e3:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
    20e7:	01 c8                	add    %ecx,%eax
    20e9:	89 44 24 08          	mov    %eax,0x8(%rsp)
    20ed:	8b 44 24 18          	mov    0x18(%rsp),%eax
    20f1:	89 44 24 10          	mov    %eax,0x10(%rsp)
    20f5:	eb 81                	jmp    2078 <func0+0xdd8>

Disassembly of section .fini:

00000000000020f8 <_fini>:
    20f8:	f3 0f 1e fa          	endbr64 
    20fc:	48 83 ec 08          	sub    $0x8,%rsp
    2100:	48 83 c4 08          	add    $0x8,%rsp
    2104:	c3                   	ret    
