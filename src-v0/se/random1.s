
random1:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 4f 00 00 	mov    0x4fd9(%rip),%rax        # 5fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 8a 4f 00 00    	push   0x4f8a(%rip)        # 5fb0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 8b 4f 00 00 	bnd jmp *0x4f8b(%rip)        # 5fb8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    105f:	90                   	nop

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 8d 4f 00 00 	bnd jmp *0x4f8d(%rip)        # 5ff8 <__cxa_finalize@GLIBC_2.2.5>
    106b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001070 <__stack_chk_fail@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 45 4f 00 00 	bnd jmp *0x4f45(%rip)        # 5fc0 <__stack_chk_fail@GLIBC_2.4>
    107b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001080 <printf@plt>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	f2 ff 25 3d 4f 00 00 	bnd jmp *0x4f3d(%rip)        # 5fc8 <printf@GLIBC_2.2.5>
    108b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001090 <__isoc99_scanf@plt>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	f2 ff 25 35 4f 00 00 	bnd jmp *0x4f35(%rip)        # 5fd0 <__isoc99_scanf@GLIBC_2.7>
    109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000010a0 <_start>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	31 ed                	xor    %ebp,%ebp
    10a6:	49 89 d1             	mov    %rdx,%r9
    10a9:	5e                   	pop    %rsi
    10aa:	48 89 e2             	mov    %rsp,%rdx
    10ad:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10b1:	50                   	push   %rax
    10b2:	54                   	push   %rsp
    10b3:	45 31 c0             	xor    %r8d,%r8d
    10b6:	31 c9                	xor    %ecx,%ecx
    10b8:	48 8d 3d e1 12 00 00 	lea    0x12e1(%rip),%rdi        # 23a0 <main>
    10bf:	ff 15 13 4f 00 00    	call   *0x4f13(%rip)        # 5fd8 <__libc_start_main@GLIBC_2.34>
    10c5:	f4                   	hlt    
    10c6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10cd:	00 00 00 

00000000000010d0 <deregister_tm_clones>:
    10d0:	48 8d 3d 41 4f 00 00 	lea    0x4f41(%rip),%rdi        # 6018 <__TMC_END__>
    10d7:	48 8d 05 3a 4f 00 00 	lea    0x4f3a(%rip),%rax        # 6018 <__TMC_END__>
    10de:	48 39 f8             	cmp    %rdi,%rax
    10e1:	74 15                	je     10f8 <deregister_tm_clones+0x28>
    10e3:	48 8b 05 f6 4e 00 00 	mov    0x4ef6(%rip),%rax        # 5fe0 <_ITM_deregisterTMCloneTable@Base>
    10ea:	48 85 c0             	test   %rax,%rax
    10ed:	74 09                	je     10f8 <deregister_tm_clones+0x28>
    10ef:	ff e0                	jmp    *%rax
    10f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10f8:	c3                   	ret    
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001100 <register_tm_clones>:
    1100:	48 8d 3d 11 4f 00 00 	lea    0x4f11(%rip),%rdi        # 6018 <__TMC_END__>
    1107:	48 8d 35 0a 4f 00 00 	lea    0x4f0a(%rip),%rsi        # 6018 <__TMC_END__>
    110e:	48 29 fe             	sub    %rdi,%rsi
    1111:	48 89 f0             	mov    %rsi,%rax
    1114:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1118:	48 c1 f8 03          	sar    $0x3,%rax
    111c:	48 01 c6             	add    %rax,%rsi
    111f:	48 d1 fe             	sar    %rsi
    1122:	74 14                	je     1138 <register_tm_clones+0x38>
    1124:	48 8b 05 c5 4e 00 00 	mov    0x4ec5(%rip),%rax        # 5ff0 <_ITM_registerTMCloneTable@Base>
    112b:	48 85 c0             	test   %rax,%rax
    112e:	74 08                	je     1138 <register_tm_clones+0x38>
    1130:	ff e0                	jmp    *%rax
    1132:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1138:	c3                   	ret    
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <__do_global_dtors_aux>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	80 3d d5 4e 00 00 00 	cmpb   $0x0,0x4ed5(%rip)        # 6020 <completed.0>
    114b:	75 2b                	jne    1178 <__do_global_dtors_aux+0x38>
    114d:	55                   	push   %rbp
    114e:	48 83 3d a2 4e 00 00 	cmpq   $0x0,0x4ea2(%rip)        # 5ff8 <__cxa_finalize@GLIBC_2.2.5>
    1155:	00 
    1156:	48 89 e5             	mov    %rsp,%rbp
    1159:	74 0c                	je     1167 <__do_global_dtors_aux+0x27>
    115b:	48 8b 3d a6 4e 00 00 	mov    0x4ea6(%rip),%rdi        # 6008 <__dso_handle>
    1162:	e8 f9 fe ff ff       	call   1060 <__cxa_finalize@plt>
    1167:	e8 64 ff ff ff       	call   10d0 <deregister_tm_clones>
    116c:	c6 05 ad 4e 00 00 01 	movb   $0x1,0x4ead(%rip)        # 6020 <completed.0>
    1173:	5d                   	pop    %rbp
    1174:	c3                   	ret    
    1175:	0f 1f 00             	nopl   (%rax)
    1178:	c3                   	ret    
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <frame_dummy>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	e9 77 ff ff ff       	jmp    1100 <register_tm_clones>

0000000000001189 <platform_main_begin>:
    1189:	f3 0f 1e fa          	endbr64 
    118d:	55                   	push   %rbp
    118e:	48 89 e5             	mov    %rsp,%rbp
    1191:	90                   	nop
    1192:	5d                   	pop    %rbp
    1193:	c3                   	ret    

0000000000001194 <platform_main_end>:
    1194:	f3 0f 1e fa          	endbr64 
    1198:	55                   	push   %rbp
    1199:	48 89 e5             	mov    %rsp,%rbp
    119c:	48 83 ec 10          	sub    $0x10,%rsp
    11a0:	89 7d fc             	mov    %edi,-0x4(%rbp)
    11a3:	89 75 f8             	mov    %esi,-0x8(%rbp)
    11a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    11a9:	89 c6                	mov    %eax,%esi
    11ab:	48 8d 05 5e 1e 00 00 	lea    0x1e5e(%rip),%rax        # 3010 <_IO_stdin_used+0x10>
    11b2:	48 89 c7             	mov    %rax,%rdi
    11b5:	b8 00 00 00 00       	mov    $0x0,%eax
    11ba:	e8 c1 fe ff ff       	call   1080 <printf@plt>
    11bf:	90                   	nop
    11c0:	c9                   	leave  
    11c1:	c3                   	ret    

00000000000011c2 <safe_unary_minus_func_int8_t_s>:
    11c2:	f3 0f 1e fa          	endbr64 
    11c6:	55                   	push   %rbp
    11c7:	48 89 e5             	mov    %rsp,%rbp
    11ca:	89 f8                	mov    %edi,%eax
    11cc:	88 45 fc             	mov    %al,-0x4(%rbp)
    11cf:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    11d3:	f7 d8                	neg    %eax
    11d5:	5d                   	pop    %rbp
    11d6:	c3                   	ret    

00000000000011d7 <safe_add_func_int8_t_s_s>:
    11d7:	f3 0f 1e fa          	endbr64 
    11db:	55                   	push   %rbp
    11dc:	48 89 e5             	mov    %rsp,%rbp
    11df:	89 fa                	mov    %edi,%edx
    11e1:	89 f0                	mov    %esi,%eax
    11e3:	88 55 fc             	mov    %dl,-0x4(%rbp)
    11e6:	88 45 f8             	mov    %al,-0x8(%rbp)
    11e9:	0f b6 55 fc          	movzbl -0x4(%rbp),%edx
    11ed:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
    11f1:	01 d0                	add    %edx,%eax
    11f3:	5d                   	pop    %rbp
    11f4:	c3                   	ret    

00000000000011f5 <safe_sub_func_int8_t_s_s>:
    11f5:	f3 0f 1e fa          	endbr64 
    11f9:	55                   	push   %rbp
    11fa:	48 89 e5             	mov    %rsp,%rbp
    11fd:	89 fa                	mov    %edi,%edx
    11ff:	89 f0                	mov    %esi,%eax
    1201:	88 55 fc             	mov    %dl,-0x4(%rbp)
    1204:	88 45 f8             	mov    %al,-0x8(%rbp)
    1207:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    120b:	0f b6 55 f8          	movzbl -0x8(%rbp),%edx
    120f:	29 d0                	sub    %edx,%eax
    1211:	5d                   	pop    %rbp
    1212:	c3                   	ret    

0000000000001213 <safe_mul_func_int8_t_s_s>:
    1213:	f3 0f 1e fa          	endbr64 
    1217:	55                   	push   %rbp
    1218:	48 89 e5             	mov    %rsp,%rbp
    121b:	89 fa                	mov    %edi,%edx
    121d:	89 f0                	mov    %esi,%eax
    121f:	88 55 fc             	mov    %dl,-0x4(%rbp)
    1222:	88 45 f8             	mov    %al,-0x8(%rbp)
    1225:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    1229:	0f b6 55 f8          	movzbl -0x8(%rbp),%edx
    122d:	0f af c2             	imul   %edx,%eax
    1230:	5d                   	pop    %rbp
    1231:	c3                   	ret    

0000000000001232 <safe_mod_func_int8_t_s_s>:
    1232:	f3 0f 1e fa          	endbr64 
    1236:	55                   	push   %rbp
    1237:	48 89 e5             	mov    %rsp,%rbp
    123a:	89 fa                	mov    %edi,%edx
    123c:	89 f0                	mov    %esi,%eax
    123e:	88 55 fc             	mov    %dl,-0x4(%rbp)
    1241:	88 45 f8             	mov    %al,-0x8(%rbp)
    1244:	80 7d f8 00          	cmpb   $0x0,-0x8(%rbp)
    1248:	74 1b                	je     1265 <safe_mod_func_int8_t_s_s+0x33>
    124a:	80 7d fc 80          	cmpb   $0x80,-0x4(%rbp)
    124e:	75 06                	jne    1256 <safe_mod_func_int8_t_s_s+0x24>
    1250:	80 7d f8 ff          	cmpb   $0xff,-0x8(%rbp)
    1254:	74 0f                	je     1265 <safe_mod_func_int8_t_s_s+0x33>
    1256:	0f be 45 fc          	movsbl -0x4(%rbp),%eax
    125a:	0f be 4d f8          	movsbl -0x8(%rbp),%ecx
    125e:	99                   	cltd   
    125f:	f7 f9                	idiv   %ecx
    1261:	89 d0                	mov    %edx,%eax
    1263:	eb 04                	jmp    1269 <safe_mod_func_int8_t_s_s+0x37>
    1265:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    1269:	5d                   	pop    %rbp
    126a:	c3                   	ret    

000000000000126b <safe_div_func_int8_t_s_s>:
    126b:	f3 0f 1e fa          	endbr64 
    126f:	55                   	push   %rbp
    1270:	48 89 e5             	mov    %rsp,%rbp
    1273:	89 fa                	mov    %edi,%edx
    1275:	89 f0                	mov    %esi,%eax
    1277:	88 55 fc             	mov    %dl,-0x4(%rbp)
    127a:	88 45 f8             	mov    %al,-0x8(%rbp)
    127d:	80 7d f8 00          	cmpb   $0x0,-0x8(%rbp)
    1281:	74 19                	je     129c <safe_div_func_int8_t_s_s+0x31>
    1283:	80 7d fc 80          	cmpb   $0x80,-0x4(%rbp)
    1287:	75 06                	jne    128f <safe_div_func_int8_t_s_s+0x24>
    1289:	80 7d f8 ff          	cmpb   $0xff,-0x8(%rbp)
    128d:	74 0d                	je     129c <safe_div_func_int8_t_s_s+0x31>
    128f:	0f be 45 fc          	movsbl -0x4(%rbp),%eax
    1293:	0f be 4d f8          	movsbl -0x8(%rbp),%ecx
    1297:	99                   	cltd   
    1298:	f7 f9                	idiv   %ecx
    129a:	eb 04                	jmp    12a0 <safe_div_func_int8_t_s_s+0x35>
    129c:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    12a0:	5d                   	pop    %rbp
    12a1:	c3                   	ret    

00000000000012a2 <safe_lshift_func_int8_t_s_s>:
    12a2:	f3 0f 1e fa          	endbr64 
    12a6:	55                   	push   %rbp
    12a7:	48 89 e5             	mov    %rsp,%rbp
    12aa:	89 f8                	mov    %edi,%eax
    12ac:	89 75 f8             	mov    %esi,-0x8(%rbp)
    12af:	88 45 fc             	mov    %al,-0x4(%rbp)
    12b2:	80 7d fc 00          	cmpb   $0x0,-0x4(%rbp)
    12b6:	78 31                	js     12e9 <safe_lshift_func_int8_t_s_s+0x47>
    12b8:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    12bc:	78 2b                	js     12e9 <safe_lshift_func_int8_t_s_s+0x47>
    12be:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    12c2:	7f 25                	jg     12e9 <safe_lshift_func_int8_t_s_s+0x47>
    12c4:	0f be 55 fc          	movsbl -0x4(%rbp),%edx
    12c8:	8b 45 f8             	mov    -0x8(%rbp),%eax
    12cb:	be 7f 00 00 00       	mov    $0x7f,%esi
    12d0:	89 c1                	mov    %eax,%ecx
    12d2:	d3 fe                	sar    %cl,%esi
    12d4:	89 f0                	mov    %esi,%eax
    12d6:	39 c2                	cmp    %eax,%edx
    12d8:	7f 0f                	jg     12e9 <safe_lshift_func_int8_t_s_s+0x47>
    12da:	0f be 55 fc          	movsbl -0x4(%rbp),%edx
    12de:	8b 45 f8             	mov    -0x8(%rbp),%eax
    12e1:	89 c1                	mov    %eax,%ecx
    12e3:	d3 e2                	shl    %cl,%edx
    12e5:	89 d0                	mov    %edx,%eax
    12e7:	eb 04                	jmp    12ed <safe_lshift_func_int8_t_s_s+0x4b>
    12e9:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    12ed:	5d                   	pop    %rbp
    12ee:	c3                   	ret    

00000000000012ef <safe_lshift_func_int8_t_s_u>:
    12ef:	f3 0f 1e fa          	endbr64 
    12f3:	55                   	push   %rbp
    12f4:	48 89 e5             	mov    %rsp,%rbp
    12f7:	89 f8                	mov    %edi,%eax
    12f9:	89 75 f8             	mov    %esi,-0x8(%rbp)
    12fc:	88 45 fc             	mov    %al,-0x4(%rbp)
    12ff:	80 7d fc 00          	cmpb   $0x0,-0x4(%rbp)
    1303:	78 2b                	js     1330 <safe_lshift_func_int8_t_s_u+0x41>
    1305:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1309:	77 25                	ja     1330 <safe_lshift_func_int8_t_s_u+0x41>
    130b:	0f be 55 fc          	movsbl -0x4(%rbp),%edx
    130f:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1312:	be 7f 00 00 00       	mov    $0x7f,%esi
    1317:	89 c1                	mov    %eax,%ecx
    1319:	d3 fe                	sar    %cl,%esi
    131b:	89 f0                	mov    %esi,%eax
    131d:	39 c2                	cmp    %eax,%edx
    131f:	7f 0f                	jg     1330 <safe_lshift_func_int8_t_s_u+0x41>
    1321:	0f be 55 fc          	movsbl -0x4(%rbp),%edx
    1325:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1328:	89 c1                	mov    %eax,%ecx
    132a:	d3 e2                	shl    %cl,%edx
    132c:	89 d0                	mov    %edx,%eax
    132e:	eb 04                	jmp    1334 <safe_lshift_func_int8_t_s_u+0x45>
    1330:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    1334:	5d                   	pop    %rbp
    1335:	c3                   	ret    

0000000000001336 <safe_rshift_func_int8_t_s_s>:
    1336:	f3 0f 1e fa          	endbr64 
    133a:	55                   	push   %rbp
    133b:	48 89 e5             	mov    %rsp,%rbp
    133e:	89 f8                	mov    %edi,%eax
    1340:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1343:	88 45 fc             	mov    %al,-0x4(%rbp)
    1346:	80 7d fc 00          	cmpb   $0x0,-0x4(%rbp)
    134a:	78 1b                	js     1367 <safe_rshift_func_int8_t_s_s+0x31>
    134c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1350:	78 15                	js     1367 <safe_rshift_func_int8_t_s_s+0x31>
    1352:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1356:	7f 0f                	jg     1367 <safe_rshift_func_int8_t_s_s+0x31>
    1358:	0f be 55 fc          	movsbl -0x4(%rbp),%edx
    135c:	8b 45 f8             	mov    -0x8(%rbp),%eax
    135f:	89 c1                	mov    %eax,%ecx
    1361:	d3 fa                	sar    %cl,%edx
    1363:	89 d0                	mov    %edx,%eax
    1365:	eb 04                	jmp    136b <safe_rshift_func_int8_t_s_s+0x35>
    1367:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    136b:	5d                   	pop    %rbp
    136c:	c3                   	ret    

000000000000136d <safe_rshift_func_int8_t_s_u>:
    136d:	f3 0f 1e fa          	endbr64 
    1371:	55                   	push   %rbp
    1372:	48 89 e5             	mov    %rsp,%rbp
    1375:	89 f8                	mov    %edi,%eax
    1377:	89 75 f8             	mov    %esi,-0x8(%rbp)
    137a:	88 45 fc             	mov    %al,-0x4(%rbp)
    137d:	80 7d fc 00          	cmpb   $0x0,-0x4(%rbp)
    1381:	78 15                	js     1398 <safe_rshift_func_int8_t_s_u+0x2b>
    1383:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1387:	77 0f                	ja     1398 <safe_rshift_func_int8_t_s_u+0x2b>
    1389:	0f be 55 fc          	movsbl -0x4(%rbp),%edx
    138d:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1390:	89 c1                	mov    %eax,%ecx
    1392:	d3 fa                	sar    %cl,%edx
    1394:	89 d0                	mov    %edx,%eax
    1396:	eb 04                	jmp    139c <safe_rshift_func_int8_t_s_u+0x2f>
    1398:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    139c:	5d                   	pop    %rbp
    139d:	c3                   	ret    

000000000000139e <safe_unary_minus_func_int16_t_s>:
    139e:	f3 0f 1e fa          	endbr64 
    13a2:	55                   	push   %rbp
    13a3:	48 89 e5             	mov    %rsp,%rbp
    13a6:	89 f8                	mov    %edi,%eax
    13a8:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
    13ac:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    13b0:	f7 d8                	neg    %eax
    13b2:	5d                   	pop    %rbp
    13b3:	c3                   	ret    

00000000000013b4 <safe_add_func_int16_t_s_s>:
    13b4:	f3 0f 1e fa          	endbr64 
    13b8:	55                   	push   %rbp
    13b9:	48 89 e5             	mov    %rsp,%rbp
    13bc:	89 fa                	mov    %edi,%edx
    13be:	89 f0                	mov    %esi,%eax
    13c0:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
    13c4:	66 89 45 f8          	mov    %ax,-0x8(%rbp)
    13c8:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
    13cc:	0f b7 45 f8          	movzwl -0x8(%rbp),%eax
    13d0:	01 d0                	add    %edx,%eax
    13d2:	5d                   	pop    %rbp
    13d3:	c3                   	ret    

00000000000013d4 <safe_sub_func_int16_t_s_s>:
    13d4:	f3 0f 1e fa          	endbr64 
    13d8:	55                   	push   %rbp
    13d9:	48 89 e5             	mov    %rsp,%rbp
    13dc:	89 fa                	mov    %edi,%edx
    13de:	89 f0                	mov    %esi,%eax
    13e0:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
    13e4:	66 89 45 f8          	mov    %ax,-0x8(%rbp)
    13e8:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    13ec:	0f b7 55 f8          	movzwl -0x8(%rbp),%edx
    13f0:	29 d0                	sub    %edx,%eax
    13f2:	5d                   	pop    %rbp
    13f3:	c3                   	ret    

00000000000013f4 <safe_mul_func_int16_t_s_s>:
    13f4:	f3 0f 1e fa          	endbr64 
    13f8:	55                   	push   %rbp
    13f9:	48 89 e5             	mov    %rsp,%rbp
    13fc:	89 fa                	mov    %edi,%edx
    13fe:	89 f0                	mov    %esi,%eax
    1400:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
    1404:	66 89 45 f8          	mov    %ax,-0x8(%rbp)
    1408:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
    140c:	0f b7 45 f8          	movzwl -0x8(%rbp),%eax
    1410:	0f af c2             	imul   %edx,%eax
    1413:	5d                   	pop    %rbp
    1414:	c3                   	ret    

0000000000001415 <safe_mod_func_int16_t_s_s>:
    1415:	f3 0f 1e fa          	endbr64 
    1419:	55                   	push   %rbp
    141a:	48 89 e5             	mov    %rsp,%rbp
    141d:	89 fa                	mov    %edi,%edx
    141f:	89 f0                	mov    %esi,%eax
    1421:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
    1425:	66 89 45 f8          	mov    %ax,-0x8(%rbp)
    1429:	66 83 7d f8 00       	cmpw   $0x0,-0x8(%rbp)
    142e:	74 1e                	je     144e <safe_mod_func_int16_t_s_s+0x39>
    1430:	66 81 7d fc 00 80    	cmpw   $0x8000,-0x4(%rbp)
    1436:	75 07                	jne    143f <safe_mod_func_int16_t_s_s+0x2a>
    1438:	66 83 7d f8 ff       	cmpw   $0xffff,-0x8(%rbp)
    143d:	74 0f                	je     144e <safe_mod_func_int16_t_s_s+0x39>
    143f:	0f bf 45 fc          	movswl -0x4(%rbp),%eax
    1443:	0f bf 4d f8          	movswl -0x8(%rbp),%ecx
    1447:	99                   	cltd   
    1448:	f7 f9                	idiv   %ecx
    144a:	89 d0                	mov    %edx,%eax
    144c:	eb 04                	jmp    1452 <safe_mod_func_int16_t_s_s+0x3d>
    144e:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1452:	5d                   	pop    %rbp
    1453:	c3                   	ret    

0000000000001454 <safe_div_func_int16_t_s_s>:
    1454:	f3 0f 1e fa          	endbr64 
    1458:	55                   	push   %rbp
    1459:	48 89 e5             	mov    %rsp,%rbp
    145c:	89 fa                	mov    %edi,%edx
    145e:	89 f0                	mov    %esi,%eax
    1460:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
    1464:	66 89 45 f8          	mov    %ax,-0x8(%rbp)
    1468:	66 83 7d f8 00       	cmpw   $0x0,-0x8(%rbp)
    146d:	74 1c                	je     148b <safe_div_func_int16_t_s_s+0x37>
    146f:	66 81 7d fc 00 80    	cmpw   $0x8000,-0x4(%rbp)
    1475:	75 07                	jne    147e <safe_div_func_int16_t_s_s+0x2a>
    1477:	66 83 7d f8 ff       	cmpw   $0xffff,-0x8(%rbp)
    147c:	74 0d                	je     148b <safe_div_func_int16_t_s_s+0x37>
    147e:	0f bf 45 fc          	movswl -0x4(%rbp),%eax
    1482:	0f bf 4d f8          	movswl -0x8(%rbp),%ecx
    1486:	99                   	cltd   
    1487:	f7 f9                	idiv   %ecx
    1489:	eb 04                	jmp    148f <safe_div_func_int16_t_s_s+0x3b>
    148b:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    148f:	5d                   	pop    %rbp
    1490:	c3                   	ret    

0000000000001491 <safe_lshift_func_int16_t_s_s>:
    1491:	f3 0f 1e fa          	endbr64 
    1495:	55                   	push   %rbp
    1496:	48 89 e5             	mov    %rsp,%rbp
    1499:	89 f8                	mov    %edi,%eax
    149b:	89 75 f8             	mov    %esi,-0x8(%rbp)
    149e:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
    14a2:	66 83 7d fc 00       	cmpw   $0x0,-0x4(%rbp)
    14a7:	78 31                	js     14da <safe_lshift_func_int16_t_s_s+0x49>
    14a9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    14ad:	78 2b                	js     14da <safe_lshift_func_int16_t_s_s+0x49>
    14af:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    14b3:	7f 25                	jg     14da <safe_lshift_func_int16_t_s_s+0x49>
    14b5:	0f bf 55 fc          	movswl -0x4(%rbp),%edx
    14b9:	8b 45 f8             	mov    -0x8(%rbp),%eax
    14bc:	be ff 7f 00 00       	mov    $0x7fff,%esi
    14c1:	89 c1                	mov    %eax,%ecx
    14c3:	d3 fe                	sar    %cl,%esi
    14c5:	89 f0                	mov    %esi,%eax
    14c7:	39 c2                	cmp    %eax,%edx
    14c9:	7f 0f                	jg     14da <safe_lshift_func_int16_t_s_s+0x49>
    14cb:	0f bf 55 fc          	movswl -0x4(%rbp),%edx
    14cf:	8b 45 f8             	mov    -0x8(%rbp),%eax
    14d2:	89 c1                	mov    %eax,%ecx
    14d4:	d3 e2                	shl    %cl,%edx
    14d6:	89 d0                	mov    %edx,%eax
    14d8:	eb 04                	jmp    14de <safe_lshift_func_int16_t_s_s+0x4d>
    14da:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    14de:	5d                   	pop    %rbp
    14df:	c3                   	ret    

00000000000014e0 <safe_lshift_func_int16_t_s_u>:
    14e0:	f3 0f 1e fa          	endbr64 
    14e4:	55                   	push   %rbp
    14e5:	48 89 e5             	mov    %rsp,%rbp
    14e8:	89 f8                	mov    %edi,%eax
    14ea:	89 75 f8             	mov    %esi,-0x8(%rbp)
    14ed:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
    14f1:	66 83 7d fc 00       	cmpw   $0x0,-0x4(%rbp)
    14f6:	78 2b                	js     1523 <safe_lshift_func_int16_t_s_u+0x43>
    14f8:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    14fc:	77 25                	ja     1523 <safe_lshift_func_int16_t_s_u+0x43>
    14fe:	0f bf 55 fc          	movswl -0x4(%rbp),%edx
    1502:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1505:	be ff 7f 00 00       	mov    $0x7fff,%esi
    150a:	89 c1                	mov    %eax,%ecx
    150c:	d3 fe                	sar    %cl,%esi
    150e:	89 f0                	mov    %esi,%eax
    1510:	39 c2                	cmp    %eax,%edx
    1512:	7f 0f                	jg     1523 <safe_lshift_func_int16_t_s_u+0x43>
    1514:	0f bf 55 fc          	movswl -0x4(%rbp),%edx
    1518:	8b 45 f8             	mov    -0x8(%rbp),%eax
    151b:	89 c1                	mov    %eax,%ecx
    151d:	d3 e2                	shl    %cl,%edx
    151f:	89 d0                	mov    %edx,%eax
    1521:	eb 04                	jmp    1527 <safe_lshift_func_int16_t_s_u+0x47>
    1523:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1527:	5d                   	pop    %rbp
    1528:	c3                   	ret    

0000000000001529 <safe_rshift_func_int16_t_s_s>:
    1529:	f3 0f 1e fa          	endbr64 
    152d:	55                   	push   %rbp
    152e:	48 89 e5             	mov    %rsp,%rbp
    1531:	89 f8                	mov    %edi,%eax
    1533:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1536:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
    153a:	66 83 7d fc 00       	cmpw   $0x0,-0x4(%rbp)
    153f:	78 1b                	js     155c <safe_rshift_func_int16_t_s_s+0x33>
    1541:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1545:	78 15                	js     155c <safe_rshift_func_int16_t_s_s+0x33>
    1547:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    154b:	7f 0f                	jg     155c <safe_rshift_func_int16_t_s_s+0x33>
    154d:	0f bf 55 fc          	movswl -0x4(%rbp),%edx
    1551:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1554:	89 c1                	mov    %eax,%ecx
    1556:	d3 fa                	sar    %cl,%edx
    1558:	89 d0                	mov    %edx,%eax
    155a:	eb 04                	jmp    1560 <safe_rshift_func_int16_t_s_s+0x37>
    155c:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1560:	5d                   	pop    %rbp
    1561:	c3                   	ret    

0000000000001562 <safe_rshift_func_int16_t_s_u>:
    1562:	f3 0f 1e fa          	endbr64 
    1566:	55                   	push   %rbp
    1567:	48 89 e5             	mov    %rsp,%rbp
    156a:	89 f8                	mov    %edi,%eax
    156c:	89 75 f8             	mov    %esi,-0x8(%rbp)
    156f:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
    1573:	66 83 7d fc 00       	cmpw   $0x0,-0x4(%rbp)
    1578:	78 15                	js     158f <safe_rshift_func_int16_t_s_u+0x2d>
    157a:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    157e:	77 0f                	ja     158f <safe_rshift_func_int16_t_s_u+0x2d>
    1580:	0f bf 55 fc          	movswl -0x4(%rbp),%edx
    1584:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1587:	89 c1                	mov    %eax,%ecx
    1589:	d3 fa                	sar    %cl,%edx
    158b:	89 d0                	mov    %edx,%eax
    158d:	eb 04                	jmp    1593 <safe_rshift_func_int16_t_s_u+0x31>
    158f:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1593:	5d                   	pop    %rbp
    1594:	c3                   	ret    

0000000000001595 <safe_unary_minus_func_int32_t_s>:
    1595:	f3 0f 1e fa          	endbr64 
    1599:	55                   	push   %rbp
    159a:	48 89 e5             	mov    %rsp,%rbp
    159d:	89 7d fc             	mov    %edi,-0x4(%rbp)
    15a0:	81 7d fc 00 00 00 80 	cmpl   $0x80000000,-0x4(%rbp)
    15a7:	74 07                	je     15b0 <safe_unary_minus_func_int32_t_s+0x1b>
    15a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15ac:	f7 d8                	neg    %eax
    15ae:	eb 03                	jmp    15b3 <safe_unary_minus_func_int32_t_s+0x1e>
    15b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15b3:	5d                   	pop    %rbp
    15b4:	c3                   	ret    

00000000000015b5 <safe_add_func_int32_t_s_s>:
    15b5:	f3 0f 1e fa          	endbr64 
    15b9:	55                   	push   %rbp
    15ba:	48 89 e5             	mov    %rsp,%rbp
    15bd:	89 7d fc             	mov    %edi,-0x4(%rbp)
    15c0:	89 75 f8             	mov    %esi,-0x8(%rbp)
    15c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    15c7:	7e 13                	jle    15dc <safe_add_func_int32_t_s_s+0x27>
    15c9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    15cd:	7e 0d                	jle    15dc <safe_add_func_int32_t_s_s+0x27>
    15cf:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
    15d4:	2b 45 f8             	sub    -0x8(%rbp),%eax
    15d7:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    15da:	7f 23                	jg     15ff <safe_add_func_int32_t_s_s+0x4a>
    15dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    15e0:	79 13                	jns    15f5 <safe_add_func_int32_t_s_s+0x40>
    15e2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    15e6:	79 0d                	jns    15f5 <safe_add_func_int32_t_s_s+0x40>
    15e8:	b8 00 00 00 80       	mov    $0x80000000,%eax
    15ed:	2b 45 f8             	sub    -0x8(%rbp),%eax
    15f0:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    15f3:	7c 0a                	jl     15ff <safe_add_func_int32_t_s_s+0x4a>
    15f5:	8b 55 fc             	mov    -0x4(%rbp),%edx
    15f8:	8b 45 f8             	mov    -0x8(%rbp),%eax
    15fb:	01 d0                	add    %edx,%eax
    15fd:	eb 03                	jmp    1602 <safe_add_func_int32_t_s_s+0x4d>
    15ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1602:	5d                   	pop    %rbp
    1603:	c3                   	ret    

0000000000001604 <safe_sub_func_int32_t_s_s>:
    1604:	f3 0f 1e fa          	endbr64 
    1608:	55                   	push   %rbp
    1609:	48 89 e5             	mov    %rsp,%rbp
    160c:	89 7d fc             	mov    %edi,-0x4(%rbp)
    160f:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1612:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1615:	33 45 f8             	xor    -0x8(%rbp),%eax
    1618:	89 c2                	mov    %eax,%edx
    161a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    161d:	33 45 f8             	xor    -0x8(%rbp),%eax
    1620:	25 00 00 00 80       	and    $0x80000000,%eax
    1625:	33 45 fc             	xor    -0x4(%rbp),%eax
    1628:	2b 45 f8             	sub    -0x8(%rbp),%eax
    162b:	33 45 f8             	xor    -0x8(%rbp),%eax
    162e:	21 d0                	and    %edx,%eax
    1630:	85 c0                	test   %eax,%eax
    1632:	78 08                	js     163c <safe_sub_func_int32_t_s_s+0x38>
    1634:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1637:	2b 45 f8             	sub    -0x8(%rbp),%eax
    163a:	eb 03                	jmp    163f <safe_sub_func_int32_t_s_s+0x3b>
    163c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    163f:	5d                   	pop    %rbp
    1640:	c3                   	ret    

0000000000001641 <safe_mul_func_int32_t_s_s>:
    1641:	f3 0f 1e fa          	endbr64 
    1645:	55                   	push   %rbp
    1646:	48 89 e5             	mov    %rsp,%rbp
    1649:	89 7d fc             	mov    %edi,-0x4(%rbp)
    164c:	89 75 f8             	mov    %esi,-0x8(%rbp)
    164f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    1653:	7e 14                	jle    1669 <safe_mul_func_int32_t_s_s+0x28>
    1655:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1659:	7e 0e                	jle    1669 <safe_mul_func_int32_t_s_s+0x28>
    165b:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
    1660:	99                   	cltd   
    1661:	f7 7d f8             	idivl  -0x8(%rbp)
    1664:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    1667:	7f 5d                	jg     16c6 <safe_mul_func_int32_t_s_s+0x85>
    1669:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    166d:	7e 14                	jle    1683 <safe_mul_func_int32_t_s_s+0x42>
    166f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1673:	7f 0e                	jg     1683 <safe_mul_func_int32_t_s_s+0x42>
    1675:	b8 00 00 00 80       	mov    $0x80000000,%eax
    167a:	99                   	cltd   
    167b:	f7 7d fc             	idivl  -0x4(%rbp)
    167e:	39 45 f8             	cmp    %eax,-0x8(%rbp)
    1681:	7c 43                	jl     16c6 <safe_mul_func_int32_t_s_s+0x85>
    1683:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    1687:	7f 14                	jg     169d <safe_mul_func_int32_t_s_s+0x5c>
    1689:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    168d:	7e 0e                	jle    169d <safe_mul_func_int32_t_s_s+0x5c>
    168f:	b8 00 00 00 80       	mov    $0x80000000,%eax
    1694:	99                   	cltd   
    1695:	f7 7d f8             	idivl  -0x8(%rbp)
    1698:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    169b:	7c 29                	jl     16c6 <safe_mul_func_int32_t_s_s+0x85>
    169d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    16a1:	7f 1a                	jg     16bd <safe_mul_func_int32_t_s_s+0x7c>
    16a3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    16a7:	7f 14                	jg     16bd <safe_mul_func_int32_t_s_s+0x7c>
    16a9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    16ad:	74 0e                	je     16bd <safe_mul_func_int32_t_s_s+0x7c>
    16af:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
    16b4:	99                   	cltd   
    16b5:	f7 7d fc             	idivl  -0x4(%rbp)
    16b8:	39 45 f8             	cmp    %eax,-0x8(%rbp)
    16bb:	7c 09                	jl     16c6 <safe_mul_func_int32_t_s_s+0x85>
    16bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
    16c0:	0f af 45 f8          	imul   -0x8(%rbp),%eax
    16c4:	eb 03                	jmp    16c9 <safe_mul_func_int32_t_s_s+0x88>
    16c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    16c9:	5d                   	pop    %rbp
    16ca:	c3                   	ret    

00000000000016cb <safe_mod_func_int32_t_s_s>:
    16cb:	f3 0f 1e fa          	endbr64 
    16cf:	55                   	push   %rbp
    16d0:	48 89 e5             	mov    %rsp,%rbp
    16d3:	89 7d fc             	mov    %edi,-0x4(%rbp)
    16d6:	89 75 f8             	mov    %esi,-0x8(%rbp)
    16d9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    16dd:	74 1a                	je     16f9 <safe_mod_func_int32_t_s_s+0x2e>
    16df:	81 7d fc 00 00 00 80 	cmpl   $0x80000000,-0x4(%rbp)
    16e6:	75 06                	jne    16ee <safe_mod_func_int32_t_s_s+0x23>
    16e8:	83 7d f8 ff          	cmpl   $0xffffffff,-0x8(%rbp)
    16ec:	74 0b                	je     16f9 <safe_mod_func_int32_t_s_s+0x2e>
    16ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
    16f1:	99                   	cltd   
    16f2:	f7 7d f8             	idivl  -0x8(%rbp)
    16f5:	89 d0                	mov    %edx,%eax
    16f7:	eb 03                	jmp    16fc <safe_mod_func_int32_t_s_s+0x31>
    16f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    16fc:	5d                   	pop    %rbp
    16fd:	c3                   	ret    

00000000000016fe <safe_div_func_int32_t_s_s>:
    16fe:	f3 0f 1e fa          	endbr64 
    1702:	55                   	push   %rbp
    1703:	48 89 e5             	mov    %rsp,%rbp
    1706:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1709:	89 75 f8             	mov    %esi,-0x8(%rbp)
    170c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1710:	74 18                	je     172a <safe_div_func_int32_t_s_s+0x2c>
    1712:	81 7d fc 00 00 00 80 	cmpl   $0x80000000,-0x4(%rbp)
    1719:	75 06                	jne    1721 <safe_div_func_int32_t_s_s+0x23>
    171b:	83 7d f8 ff          	cmpl   $0xffffffff,-0x8(%rbp)
    171f:	74 09                	je     172a <safe_div_func_int32_t_s_s+0x2c>
    1721:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1724:	99                   	cltd   
    1725:	f7 7d f8             	idivl  -0x8(%rbp)
    1728:	eb 03                	jmp    172d <safe_div_func_int32_t_s_s+0x2f>
    172a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    172d:	5d                   	pop    %rbp
    172e:	c3                   	ret    

000000000000172f <safe_lshift_func_int32_t_s_s>:
    172f:	f3 0f 1e fa          	endbr64 
    1733:	55                   	push   %rbp
    1734:	48 89 e5             	mov    %rsp,%rbp
    1737:	89 7d fc             	mov    %edi,-0x4(%rbp)
    173a:	89 75 f8             	mov    %esi,-0x8(%rbp)
    173d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    1741:	78 2d                	js     1770 <safe_lshift_func_int32_t_s_s+0x41>
    1743:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1747:	78 27                	js     1770 <safe_lshift_func_int32_t_s_s+0x41>
    1749:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    174d:	7f 21                	jg     1770 <safe_lshift_func_int32_t_s_s+0x41>
    174f:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1752:	ba ff ff ff 7f       	mov    $0x7fffffff,%edx
    1757:	89 c1                	mov    %eax,%ecx
    1759:	d3 fa                	sar    %cl,%edx
    175b:	89 d0                	mov    %edx,%eax
    175d:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    1760:	7f 0e                	jg     1770 <safe_lshift_func_int32_t_s_s+0x41>
    1762:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1765:	8b 55 fc             	mov    -0x4(%rbp),%edx
    1768:	89 c1                	mov    %eax,%ecx
    176a:	d3 e2                	shl    %cl,%edx
    176c:	89 d0                	mov    %edx,%eax
    176e:	eb 03                	jmp    1773 <safe_lshift_func_int32_t_s_s+0x44>
    1770:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1773:	5d                   	pop    %rbp
    1774:	c3                   	ret    

0000000000001775 <safe_lshift_func_int32_t_s_u>:
    1775:	f3 0f 1e fa          	endbr64 
    1779:	55                   	push   %rbp
    177a:	48 89 e5             	mov    %rsp,%rbp
    177d:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1780:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1783:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    1787:	78 27                	js     17b0 <safe_lshift_func_int32_t_s_u+0x3b>
    1789:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    178d:	77 21                	ja     17b0 <safe_lshift_func_int32_t_s_u+0x3b>
    178f:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1792:	ba ff ff ff 7f       	mov    $0x7fffffff,%edx
    1797:	89 c1                	mov    %eax,%ecx
    1799:	d3 fa                	sar    %cl,%edx
    179b:	89 d0                	mov    %edx,%eax
    179d:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    17a0:	7f 0e                	jg     17b0 <safe_lshift_func_int32_t_s_u+0x3b>
    17a2:	8b 45 f8             	mov    -0x8(%rbp),%eax
    17a5:	8b 55 fc             	mov    -0x4(%rbp),%edx
    17a8:	89 c1                	mov    %eax,%ecx
    17aa:	d3 e2                	shl    %cl,%edx
    17ac:	89 d0                	mov    %edx,%eax
    17ae:	eb 03                	jmp    17b3 <safe_lshift_func_int32_t_s_u+0x3e>
    17b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    17b3:	5d                   	pop    %rbp
    17b4:	c3                   	ret    

00000000000017b5 <safe_rshift_func_int32_t_s_s>:
    17b5:	f3 0f 1e fa          	endbr64 
    17b9:	55                   	push   %rbp
    17ba:	48 89 e5             	mov    %rsp,%rbp
    17bd:	89 7d fc             	mov    %edi,-0x4(%rbp)
    17c0:	89 75 f8             	mov    %esi,-0x8(%rbp)
    17c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    17c7:	78 1a                	js     17e3 <safe_rshift_func_int32_t_s_s+0x2e>
    17c9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    17cd:	78 14                	js     17e3 <safe_rshift_func_int32_t_s_s+0x2e>
    17cf:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    17d3:	7f 0e                	jg     17e3 <safe_rshift_func_int32_t_s_s+0x2e>
    17d5:	8b 45 f8             	mov    -0x8(%rbp),%eax
    17d8:	8b 55 fc             	mov    -0x4(%rbp),%edx
    17db:	89 c1                	mov    %eax,%ecx
    17dd:	d3 fa                	sar    %cl,%edx
    17df:	89 d0                	mov    %edx,%eax
    17e1:	eb 03                	jmp    17e6 <safe_rshift_func_int32_t_s_s+0x31>
    17e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    17e6:	5d                   	pop    %rbp
    17e7:	c3                   	ret    

00000000000017e8 <safe_rshift_func_int32_t_s_u>:
    17e8:	f3 0f 1e fa          	endbr64 
    17ec:	55                   	push   %rbp
    17ed:	48 89 e5             	mov    %rsp,%rbp
    17f0:	89 7d fc             	mov    %edi,-0x4(%rbp)
    17f3:	89 75 f8             	mov    %esi,-0x8(%rbp)
    17f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    17fa:	78 14                	js     1810 <safe_rshift_func_int32_t_s_u+0x28>
    17fc:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1800:	77 0e                	ja     1810 <safe_rshift_func_int32_t_s_u+0x28>
    1802:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1805:	8b 55 fc             	mov    -0x4(%rbp),%edx
    1808:	89 c1                	mov    %eax,%ecx
    180a:	d3 fa                	sar    %cl,%edx
    180c:	89 d0                	mov    %edx,%eax
    180e:	eb 03                	jmp    1813 <safe_rshift_func_int32_t_s_u+0x2b>
    1810:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1813:	5d                   	pop    %rbp
    1814:	c3                   	ret    

0000000000001815 <safe_unary_minus_func_uint8_t_u>:
    1815:	f3 0f 1e fa          	endbr64 
    1819:	55                   	push   %rbp
    181a:	48 89 e5             	mov    %rsp,%rbp
    181d:	89 f8                	mov    %edi,%eax
    181f:	88 45 fc             	mov    %al,-0x4(%rbp)
    1822:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    1826:	f7 d8                	neg    %eax
    1828:	5d                   	pop    %rbp
    1829:	c3                   	ret    

000000000000182a <safe_add_func_uint8_t_u_u>:
    182a:	f3 0f 1e fa          	endbr64 
    182e:	55                   	push   %rbp
    182f:	48 89 e5             	mov    %rsp,%rbp
    1832:	89 fa                	mov    %edi,%edx
    1834:	89 f0                	mov    %esi,%eax
    1836:	88 55 fc             	mov    %dl,-0x4(%rbp)
    1839:	88 45 f8             	mov    %al,-0x8(%rbp)
    183c:	0f b6 55 fc          	movzbl -0x4(%rbp),%edx
    1840:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
    1844:	01 d0                	add    %edx,%eax
    1846:	5d                   	pop    %rbp
    1847:	c3                   	ret    

0000000000001848 <safe_sub_func_uint8_t_u_u>:
    1848:	f3 0f 1e fa          	endbr64 
    184c:	55                   	push   %rbp
    184d:	48 89 e5             	mov    %rsp,%rbp
    1850:	89 fa                	mov    %edi,%edx
    1852:	89 f0                	mov    %esi,%eax
    1854:	88 55 fc             	mov    %dl,-0x4(%rbp)
    1857:	88 45 f8             	mov    %al,-0x8(%rbp)
    185a:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    185e:	2a 45 f8             	sub    -0x8(%rbp),%al
    1861:	5d                   	pop    %rbp
    1862:	c3                   	ret    

0000000000001863 <safe_mul_func_uint8_t_u_u>:
    1863:	f3 0f 1e fa          	endbr64 
    1867:	55                   	push   %rbp
    1868:	48 89 e5             	mov    %rsp,%rbp
    186b:	89 fa                	mov    %edi,%edx
    186d:	89 f0                	mov    %esi,%eax
    186f:	88 55 fc             	mov    %dl,-0x4(%rbp)
    1872:	88 45 f8             	mov    %al,-0x8(%rbp)
    1875:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    1879:	f6 65 f8             	mulb   -0x8(%rbp)
    187c:	5d                   	pop    %rbp
    187d:	c3                   	ret    

000000000000187e <safe_mod_func_uint8_t_u_u>:
    187e:	f3 0f 1e fa          	endbr64 
    1882:	55                   	push   %rbp
    1883:	48 89 e5             	mov    %rsp,%rbp
    1886:	89 fa                	mov    %edi,%edx
    1888:	89 f0                	mov    %esi,%eax
    188a:	88 55 fc             	mov    %dl,-0x4(%rbp)
    188d:	88 45 f8             	mov    %al,-0x8(%rbp)
    1890:	80 7d f8 00          	cmpb   $0x0,-0x8(%rbp)
    1894:	74 0f                	je     18a5 <safe_mod_func_uint8_t_u_u+0x27>
    1896:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    189a:	0f b6 c0             	movzbl %al,%eax
    189d:	f6 75 f8             	divb   -0x8(%rbp)
    18a0:	0f b6 c4             	movzbl %ah,%eax
    18a3:	eb 04                	jmp    18a9 <safe_mod_func_uint8_t_u_u+0x2b>
    18a5:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    18a9:	5d                   	pop    %rbp
    18aa:	c3                   	ret    

00000000000018ab <safe_div_func_uint8_t_u_u>:
    18ab:	f3 0f 1e fa          	endbr64 
    18af:	55                   	push   %rbp
    18b0:	48 89 e5             	mov    %rsp,%rbp
    18b3:	89 fa                	mov    %edi,%edx
    18b5:	89 f0                	mov    %esi,%eax
    18b7:	88 55 fc             	mov    %dl,-0x4(%rbp)
    18ba:	88 45 f8             	mov    %al,-0x8(%rbp)
    18bd:	80 7d f8 00          	cmpb   $0x0,-0x8(%rbp)
    18c1:	74 0c                	je     18cf <safe_div_func_uint8_t_u_u+0x24>
    18c3:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    18c7:	0f b6 c0             	movzbl %al,%eax
    18ca:	f6 75 f8             	divb   -0x8(%rbp)
    18cd:	eb 04                	jmp    18d3 <safe_div_func_uint8_t_u_u+0x28>
    18cf:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    18d3:	5d                   	pop    %rbp
    18d4:	c3                   	ret    

00000000000018d5 <safe_lshift_func_uint8_t_u_s>:
    18d5:	f3 0f 1e fa          	endbr64 
    18d9:	55                   	push   %rbp
    18da:	48 89 e5             	mov    %rsp,%rbp
    18dd:	89 f8                	mov    %edi,%eax
    18df:	89 75 f8             	mov    %esi,-0x8(%rbp)
    18e2:	88 45 fc             	mov    %al,-0x4(%rbp)
    18e5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    18e9:	78 2b                	js     1916 <safe_lshift_func_uint8_t_u_s+0x41>
    18eb:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    18ef:	7f 25                	jg     1916 <safe_lshift_func_uint8_t_u_s+0x41>
    18f1:	0f b6 55 fc          	movzbl -0x4(%rbp),%edx
    18f5:	8b 45 f8             	mov    -0x8(%rbp),%eax
    18f8:	be ff 00 00 00       	mov    $0xff,%esi
    18fd:	89 c1                	mov    %eax,%ecx
    18ff:	d3 fe                	sar    %cl,%esi
    1901:	89 f0                	mov    %esi,%eax
    1903:	39 c2                	cmp    %eax,%edx
    1905:	7f 0f                	jg     1916 <safe_lshift_func_uint8_t_u_s+0x41>
    1907:	0f b6 55 fc          	movzbl -0x4(%rbp),%edx
    190b:	8b 45 f8             	mov    -0x8(%rbp),%eax
    190e:	89 c1                	mov    %eax,%ecx
    1910:	d3 e2                	shl    %cl,%edx
    1912:	89 d0                	mov    %edx,%eax
    1914:	eb 04                	jmp    191a <safe_lshift_func_uint8_t_u_s+0x45>
    1916:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    191a:	5d                   	pop    %rbp
    191b:	c3                   	ret    

000000000000191c <safe_lshift_func_uint8_t_u_u>:
    191c:	f3 0f 1e fa          	endbr64 
    1920:	55                   	push   %rbp
    1921:	48 89 e5             	mov    %rsp,%rbp
    1924:	89 f8                	mov    %edi,%eax
    1926:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1929:	88 45 fc             	mov    %al,-0x4(%rbp)
    192c:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1930:	77 25                	ja     1957 <safe_lshift_func_uint8_t_u_u+0x3b>
    1932:	0f b6 55 fc          	movzbl -0x4(%rbp),%edx
    1936:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1939:	be ff 00 00 00       	mov    $0xff,%esi
    193e:	89 c1                	mov    %eax,%ecx
    1940:	d3 fe                	sar    %cl,%esi
    1942:	89 f0                	mov    %esi,%eax
    1944:	39 c2                	cmp    %eax,%edx
    1946:	7f 0f                	jg     1957 <safe_lshift_func_uint8_t_u_u+0x3b>
    1948:	0f b6 55 fc          	movzbl -0x4(%rbp),%edx
    194c:	8b 45 f8             	mov    -0x8(%rbp),%eax
    194f:	89 c1                	mov    %eax,%ecx
    1951:	d3 e2                	shl    %cl,%edx
    1953:	89 d0                	mov    %edx,%eax
    1955:	eb 04                	jmp    195b <safe_lshift_func_uint8_t_u_u+0x3f>
    1957:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    195b:	5d                   	pop    %rbp
    195c:	c3                   	ret    

000000000000195d <safe_rshift_func_uint8_t_u_s>:
    195d:	f3 0f 1e fa          	endbr64 
    1961:	55                   	push   %rbp
    1962:	48 89 e5             	mov    %rsp,%rbp
    1965:	89 f8                	mov    %edi,%eax
    1967:	89 75 f8             	mov    %esi,-0x8(%rbp)
    196a:	88 45 fc             	mov    %al,-0x4(%rbp)
    196d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1971:	78 15                	js     1988 <safe_rshift_func_uint8_t_u_s+0x2b>
    1973:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1977:	7f 0f                	jg     1988 <safe_rshift_func_uint8_t_u_s+0x2b>
    1979:	0f b6 55 fc          	movzbl -0x4(%rbp),%edx
    197d:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1980:	89 c1                	mov    %eax,%ecx
    1982:	d3 fa                	sar    %cl,%edx
    1984:	89 d0                	mov    %edx,%eax
    1986:	eb 04                	jmp    198c <safe_rshift_func_uint8_t_u_s+0x2f>
    1988:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    198c:	5d                   	pop    %rbp
    198d:	c3                   	ret    

000000000000198e <safe_rshift_func_uint8_t_u_u>:
    198e:	f3 0f 1e fa          	endbr64 
    1992:	55                   	push   %rbp
    1993:	48 89 e5             	mov    %rsp,%rbp
    1996:	89 f8                	mov    %edi,%eax
    1998:	89 75 f8             	mov    %esi,-0x8(%rbp)
    199b:	88 45 fc             	mov    %al,-0x4(%rbp)
    199e:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    19a2:	77 0f                	ja     19b3 <safe_rshift_func_uint8_t_u_u+0x25>
    19a4:	0f b6 55 fc          	movzbl -0x4(%rbp),%edx
    19a8:	8b 45 f8             	mov    -0x8(%rbp),%eax
    19ab:	89 c1                	mov    %eax,%ecx
    19ad:	d3 fa                	sar    %cl,%edx
    19af:	89 d0                	mov    %edx,%eax
    19b1:	eb 04                	jmp    19b7 <safe_rshift_func_uint8_t_u_u+0x29>
    19b3:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    19b7:	5d                   	pop    %rbp
    19b8:	c3                   	ret    

00000000000019b9 <safe_unary_minus_func_uint16_t_u>:
    19b9:	f3 0f 1e fa          	endbr64 
    19bd:	55                   	push   %rbp
    19be:	48 89 e5             	mov    %rsp,%rbp
    19c1:	89 f8                	mov    %edi,%eax
    19c3:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
    19c7:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    19cb:	f7 d8                	neg    %eax
    19cd:	5d                   	pop    %rbp
    19ce:	c3                   	ret    

00000000000019cf <safe_add_func_uint16_t_u_u>:
    19cf:	f3 0f 1e fa          	endbr64 
    19d3:	55                   	push   %rbp
    19d4:	48 89 e5             	mov    %rsp,%rbp
    19d7:	89 fa                	mov    %edi,%edx
    19d9:	89 f0                	mov    %esi,%eax
    19db:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
    19df:	66 89 45 f8          	mov    %ax,-0x8(%rbp)
    19e3:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
    19e7:	0f b7 45 f8          	movzwl -0x8(%rbp),%eax
    19eb:	01 d0                	add    %edx,%eax
    19ed:	5d                   	pop    %rbp
    19ee:	c3                   	ret    

00000000000019ef <safe_sub_func_uint16_t_u_u>:
    19ef:	f3 0f 1e fa          	endbr64 
    19f3:	55                   	push   %rbp
    19f4:	48 89 e5             	mov    %rsp,%rbp
    19f7:	89 fa                	mov    %edi,%edx
    19f9:	89 f0                	mov    %esi,%eax
    19fb:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
    19ff:	66 89 45 f8          	mov    %ax,-0x8(%rbp)
    1a03:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1a07:	66 2b 45 f8          	sub    -0x8(%rbp),%ax
    1a0b:	5d                   	pop    %rbp
    1a0c:	c3                   	ret    

0000000000001a0d <safe_mul_func_uint16_t_u_u>:
    1a0d:	f3 0f 1e fa          	endbr64 
    1a11:	55                   	push   %rbp
    1a12:	48 89 e5             	mov    %rsp,%rbp
    1a15:	89 fa                	mov    %edi,%edx
    1a17:	89 f0                	mov    %esi,%eax
    1a19:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
    1a1d:	66 89 45 f8          	mov    %ax,-0x8(%rbp)
    1a21:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1a25:	66 0f af 45 f8       	imul   -0x8(%rbp),%ax
    1a2a:	5d                   	pop    %rbp
    1a2b:	c3                   	ret    

0000000000001a2c <safe_mod_func_uint16_t_u_u>:
    1a2c:	f3 0f 1e fa          	endbr64 
    1a30:	55                   	push   %rbp
    1a31:	48 89 e5             	mov    %rsp,%rbp
    1a34:	89 fa                	mov    %edi,%edx
    1a36:	89 f0                	mov    %esi,%eax
    1a38:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
    1a3c:	66 89 45 f8          	mov    %ax,-0x8(%rbp)
    1a40:	66 83 7d f8 00       	cmpw   $0x0,-0x8(%rbp)
    1a45:	74 11                	je     1a58 <safe_mod_func_uint16_t_u_u+0x2c>
    1a47:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1a4b:	ba 00 00 00 00       	mov    $0x0,%edx
    1a50:	66 f7 75 f8          	divw   -0x8(%rbp)
    1a54:	89 d0                	mov    %edx,%eax
    1a56:	eb 04                	jmp    1a5c <safe_mod_func_uint16_t_u_u+0x30>
    1a58:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1a5c:	5d                   	pop    %rbp
    1a5d:	c3                   	ret    

0000000000001a5e <safe_div_func_uint16_t_u_u>:
    1a5e:	f3 0f 1e fa          	endbr64 
    1a62:	55                   	push   %rbp
    1a63:	48 89 e5             	mov    %rsp,%rbp
    1a66:	89 fa                	mov    %edi,%edx
    1a68:	89 f0                	mov    %esi,%eax
    1a6a:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
    1a6e:	66 89 45 f8          	mov    %ax,-0x8(%rbp)
    1a72:	66 83 7d f8 00       	cmpw   $0x0,-0x8(%rbp)
    1a77:	74 0f                	je     1a88 <safe_div_func_uint16_t_u_u+0x2a>
    1a79:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1a7d:	ba 00 00 00 00       	mov    $0x0,%edx
    1a82:	66 f7 75 f8          	divw   -0x8(%rbp)
    1a86:	eb 04                	jmp    1a8c <safe_div_func_uint16_t_u_u+0x2e>
    1a88:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1a8c:	5d                   	pop    %rbp
    1a8d:	c3                   	ret    

0000000000001a8e <safe_lshift_func_uint16_t_u_s>:
    1a8e:	f3 0f 1e fa          	endbr64 
    1a92:	55                   	push   %rbp
    1a93:	48 89 e5             	mov    %rsp,%rbp
    1a96:	89 f8                	mov    %edi,%eax
    1a98:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1a9b:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
    1a9f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1aa3:	78 2b                	js     1ad0 <safe_lshift_func_uint16_t_u_s+0x42>
    1aa5:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1aa9:	7f 25                	jg     1ad0 <safe_lshift_func_uint16_t_u_s+0x42>
    1aab:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
    1aaf:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1ab2:	be ff ff 00 00       	mov    $0xffff,%esi
    1ab7:	89 c1                	mov    %eax,%ecx
    1ab9:	d3 fe                	sar    %cl,%esi
    1abb:	89 f0                	mov    %esi,%eax
    1abd:	39 c2                	cmp    %eax,%edx
    1abf:	7f 0f                	jg     1ad0 <safe_lshift_func_uint16_t_u_s+0x42>
    1ac1:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
    1ac5:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1ac8:	89 c1                	mov    %eax,%ecx
    1aca:	d3 e2                	shl    %cl,%edx
    1acc:	89 d0                	mov    %edx,%eax
    1ace:	eb 04                	jmp    1ad4 <safe_lshift_func_uint16_t_u_s+0x46>
    1ad0:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1ad4:	5d                   	pop    %rbp
    1ad5:	c3                   	ret    

0000000000001ad6 <safe_lshift_func_uint16_t_u_u>:
    1ad6:	f3 0f 1e fa          	endbr64 
    1ada:	55                   	push   %rbp
    1adb:	48 89 e5             	mov    %rsp,%rbp
    1ade:	89 f8                	mov    %edi,%eax
    1ae0:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1ae3:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
    1ae7:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1aeb:	77 25                	ja     1b12 <safe_lshift_func_uint16_t_u_u+0x3c>
    1aed:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
    1af1:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1af4:	be ff ff 00 00       	mov    $0xffff,%esi
    1af9:	89 c1                	mov    %eax,%ecx
    1afb:	d3 fe                	sar    %cl,%esi
    1afd:	89 f0                	mov    %esi,%eax
    1aff:	39 c2                	cmp    %eax,%edx
    1b01:	7f 0f                	jg     1b12 <safe_lshift_func_uint16_t_u_u+0x3c>
    1b03:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
    1b07:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1b0a:	89 c1                	mov    %eax,%ecx
    1b0c:	d3 e2                	shl    %cl,%edx
    1b0e:	89 d0                	mov    %edx,%eax
    1b10:	eb 04                	jmp    1b16 <safe_lshift_func_uint16_t_u_u+0x40>
    1b12:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1b16:	5d                   	pop    %rbp
    1b17:	c3                   	ret    

0000000000001b18 <safe_rshift_func_uint16_t_u_s>:
    1b18:	f3 0f 1e fa          	endbr64 
    1b1c:	55                   	push   %rbp
    1b1d:	48 89 e5             	mov    %rsp,%rbp
    1b20:	89 f8                	mov    %edi,%eax
    1b22:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1b25:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
    1b29:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1b2d:	78 15                	js     1b44 <safe_rshift_func_uint16_t_u_s+0x2c>
    1b2f:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1b33:	7f 0f                	jg     1b44 <safe_rshift_func_uint16_t_u_s+0x2c>
    1b35:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
    1b39:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1b3c:	89 c1                	mov    %eax,%ecx
    1b3e:	d3 fa                	sar    %cl,%edx
    1b40:	89 d0                	mov    %edx,%eax
    1b42:	eb 04                	jmp    1b48 <safe_rshift_func_uint16_t_u_s+0x30>
    1b44:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1b48:	5d                   	pop    %rbp
    1b49:	c3                   	ret    

0000000000001b4a <safe_rshift_func_uint16_t_u_u>:
    1b4a:	f3 0f 1e fa          	endbr64 
    1b4e:	55                   	push   %rbp
    1b4f:	48 89 e5             	mov    %rsp,%rbp
    1b52:	89 f8                	mov    %edi,%eax
    1b54:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1b57:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
    1b5b:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1b5f:	77 0f                	ja     1b70 <safe_rshift_func_uint16_t_u_u+0x26>
    1b61:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
    1b65:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1b68:	89 c1                	mov    %eax,%ecx
    1b6a:	d3 fa                	sar    %cl,%edx
    1b6c:	89 d0                	mov    %edx,%eax
    1b6e:	eb 04                	jmp    1b74 <safe_rshift_func_uint16_t_u_u+0x2a>
    1b70:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
    1b74:	5d                   	pop    %rbp
    1b75:	c3                   	ret    

0000000000001b76 <safe_unary_minus_func_uint32_t_u>:
    1b76:	f3 0f 1e fa          	endbr64 
    1b7a:	55                   	push   %rbp
    1b7b:	48 89 e5             	mov    %rsp,%rbp
    1b7e:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1b81:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1b84:	f7 d8                	neg    %eax
    1b86:	5d                   	pop    %rbp
    1b87:	c3                   	ret    

0000000000001b88 <safe_add_func_uint32_t_u_u>:
    1b88:	f3 0f 1e fa          	endbr64 
    1b8c:	55                   	push   %rbp
    1b8d:	48 89 e5             	mov    %rsp,%rbp
    1b90:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1b93:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1b96:	8b 55 fc             	mov    -0x4(%rbp),%edx
    1b99:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1b9c:	01 d0                	add    %edx,%eax
    1b9e:	5d                   	pop    %rbp
    1b9f:	c3                   	ret    

0000000000001ba0 <safe_sub_func_uint32_t_u_u>:
    1ba0:	f3 0f 1e fa          	endbr64 
    1ba4:	55                   	push   %rbp
    1ba5:	48 89 e5             	mov    %rsp,%rbp
    1ba8:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1bab:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1bae:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1bb1:	2b 45 f8             	sub    -0x8(%rbp),%eax
    1bb4:	5d                   	pop    %rbp
    1bb5:	c3                   	ret    

0000000000001bb6 <safe_mul_func_uint32_t_u_u>:
    1bb6:	f3 0f 1e fa          	endbr64 
    1bba:	55                   	push   %rbp
    1bbb:	48 89 e5             	mov    %rsp,%rbp
    1bbe:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1bc1:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1bc4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1bc7:	0f af 45 f8          	imul   -0x8(%rbp),%eax
    1bcb:	5d                   	pop    %rbp
    1bcc:	c3                   	ret    

0000000000001bcd <safe_mod_func_uint32_t_u_u>:
    1bcd:	f3 0f 1e fa          	endbr64 
    1bd1:	55                   	push   %rbp
    1bd2:	48 89 e5             	mov    %rsp,%rbp
    1bd5:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1bd8:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1bdb:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1bdf:	74 0f                	je     1bf0 <safe_mod_func_uint32_t_u_u+0x23>
    1be1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1be4:	ba 00 00 00 00       	mov    $0x0,%edx
    1be9:	f7 75 f8             	divl   -0x8(%rbp)
    1bec:	89 d0                	mov    %edx,%eax
    1bee:	eb 03                	jmp    1bf3 <safe_mod_func_uint32_t_u_u+0x26>
    1bf0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1bf3:	5d                   	pop    %rbp
    1bf4:	c3                   	ret    

0000000000001bf5 <safe_div_func_uint32_t_u_u>:
    1bf5:	f3 0f 1e fa          	endbr64 
    1bf9:	55                   	push   %rbp
    1bfa:	48 89 e5             	mov    %rsp,%rbp
    1bfd:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1c00:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1c03:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1c07:	74 0d                	je     1c16 <safe_div_func_uint32_t_u_u+0x21>
    1c09:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1c0c:	ba 00 00 00 00       	mov    $0x0,%edx
    1c11:	f7 75 f8             	divl   -0x8(%rbp)
    1c14:	eb 03                	jmp    1c19 <safe_div_func_uint32_t_u_u+0x24>
    1c16:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1c19:	5d                   	pop    %rbp
    1c1a:	c3                   	ret    

0000000000001c1b <safe_lshift_func_uint32_t_u_s>:
    1c1b:	f3 0f 1e fa          	endbr64 
    1c1f:	55                   	push   %rbp
    1c20:	48 89 e5             	mov    %rsp,%rbp
    1c23:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1c26:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1c29:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1c2d:	78 27                	js     1c56 <safe_lshift_func_uint32_t_u_s+0x3b>
    1c2f:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1c33:	7f 21                	jg     1c56 <safe_lshift_func_uint32_t_u_s+0x3b>
    1c35:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1c38:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    1c3d:	89 c1                	mov    %eax,%ecx
    1c3f:	d3 ea                	shr    %cl,%edx
    1c41:	89 d0                	mov    %edx,%eax
    1c43:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    1c46:	77 0e                	ja     1c56 <safe_lshift_func_uint32_t_u_s+0x3b>
    1c48:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1c4b:	8b 55 fc             	mov    -0x4(%rbp),%edx
    1c4e:	89 c1                	mov    %eax,%ecx
    1c50:	d3 e2                	shl    %cl,%edx
    1c52:	89 d0                	mov    %edx,%eax
    1c54:	eb 03                	jmp    1c59 <safe_lshift_func_uint32_t_u_s+0x3e>
    1c56:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1c59:	5d                   	pop    %rbp
    1c5a:	c3                   	ret    

0000000000001c5b <safe_lshift_func_uint32_t_u_u>:
    1c5b:	f3 0f 1e fa          	endbr64 
    1c5f:	55                   	push   %rbp
    1c60:	48 89 e5             	mov    %rsp,%rbp
    1c63:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1c66:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1c69:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1c6d:	77 21                	ja     1c90 <safe_lshift_func_uint32_t_u_u+0x35>
    1c6f:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1c72:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    1c77:	89 c1                	mov    %eax,%ecx
    1c79:	d3 ea                	shr    %cl,%edx
    1c7b:	89 d0                	mov    %edx,%eax
    1c7d:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    1c80:	77 0e                	ja     1c90 <safe_lshift_func_uint32_t_u_u+0x35>
    1c82:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1c85:	8b 55 fc             	mov    -0x4(%rbp),%edx
    1c88:	89 c1                	mov    %eax,%ecx
    1c8a:	d3 e2                	shl    %cl,%edx
    1c8c:	89 d0                	mov    %edx,%eax
    1c8e:	eb 03                	jmp    1c93 <safe_lshift_func_uint32_t_u_u+0x38>
    1c90:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1c93:	5d                   	pop    %rbp
    1c94:	c3                   	ret    

0000000000001c95 <safe_rshift_func_uint32_t_u_s>:
    1c95:	f3 0f 1e fa          	endbr64 
    1c99:	55                   	push   %rbp
    1c9a:	48 89 e5             	mov    %rsp,%rbp
    1c9d:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1ca0:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1ca3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1ca7:	78 14                	js     1cbd <safe_rshift_func_uint32_t_u_s+0x28>
    1ca9:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1cad:	7f 0e                	jg     1cbd <safe_rshift_func_uint32_t_u_s+0x28>
    1caf:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1cb2:	8b 55 fc             	mov    -0x4(%rbp),%edx
    1cb5:	89 c1                	mov    %eax,%ecx
    1cb7:	d3 ea                	shr    %cl,%edx
    1cb9:	89 d0                	mov    %edx,%eax
    1cbb:	eb 03                	jmp    1cc0 <safe_rshift_func_uint32_t_u_s+0x2b>
    1cbd:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1cc0:	5d                   	pop    %rbp
    1cc1:	c3                   	ret    

0000000000001cc2 <safe_rshift_func_uint32_t_u_u>:
    1cc2:	f3 0f 1e fa          	endbr64 
    1cc6:	55                   	push   %rbp
    1cc7:	48 89 e5             	mov    %rsp,%rbp
    1cca:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1ccd:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1cd0:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%rbp)
    1cd4:	77 0e                	ja     1ce4 <safe_rshift_func_uint32_t_u_u+0x22>
    1cd6:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1cd9:	8b 55 fc             	mov    -0x4(%rbp),%edx
    1cdc:	89 c1                	mov    %eax,%ecx
    1cde:	d3 ea                	shr    %cl,%edx
    1ce0:	89 d0                	mov    %edx,%eax
    1ce2:	eb 03                	jmp    1ce7 <safe_rshift_func_uint32_t_u_u+0x25>
    1ce4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1ce7:	5d                   	pop    %rbp
    1ce8:	c3                   	ret    

0000000000001ce9 <safe_add_func_float_f_f>:
    1ce9:	f3 0f 1e fa          	endbr64 
    1ced:	55                   	push   %rbp
    1cee:	48 89 e5             	mov    %rsp,%rbp
    1cf1:	f3 0f 11 45 fc       	movss  %xmm0,-0x4(%rbp)
    1cf6:	f3 0f 11 4d f8       	movss  %xmm1,-0x8(%rbp)
    1cfb:	f3 0f 10 4d fc       	movss  -0x4(%rbp),%xmm1
    1d00:	f3 0f 10 05 68 13 00 	movss  0x1368(%rip),%xmm0        # 3070 <_IO_stdin_used+0x70>
    1d07:	00 
    1d08:	f3 0f 59 c8          	mulss  %xmm0,%xmm1
    1d0c:	f3 0f 10 55 f8       	movss  -0x8(%rbp),%xmm2
    1d11:	f3 0f 10 05 57 13 00 	movss  0x1357(%rip),%xmm0        # 3070 <_IO_stdin_used+0x70>
    1d18:	00 
    1d19:	f3 0f 59 c2          	mulss  %xmm2,%xmm0
    1d1d:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    1d21:	f3 0f 10 0d 57 13 00 	movss  0x1357(%rip),%xmm1        # 3080 <_IO_stdin_used+0x80>
    1d28:	00 
    1d29:	0f 54 c1             	andps  %xmm1,%xmm0
    1d2c:	0f 2f 05 5d 13 00 00 	comiss 0x135d(%rip),%xmm0        # 3090 <_IO_stdin_used+0x90>
    1d33:	76 07                	jbe    1d3c <safe_add_func_float_f_f+0x53>
    1d35:	f3 0f 10 45 fc       	movss  -0x4(%rbp),%xmm0
    1d3a:	eb 0a                	jmp    1d46 <safe_add_func_float_f_f+0x5d>
    1d3c:	f3 0f 10 45 fc       	movss  -0x4(%rbp),%xmm0
    1d41:	f3 0f 58 45 f8       	addss  -0x8(%rbp),%xmm0
    1d46:	5d                   	pop    %rbp
    1d47:	c3                   	ret    

0000000000001d48 <safe_sub_func_float_f_f>:
    1d48:	f3 0f 1e fa          	endbr64 
    1d4c:	55                   	push   %rbp
    1d4d:	48 89 e5             	mov    %rsp,%rbp
    1d50:	f3 0f 11 45 fc       	movss  %xmm0,-0x4(%rbp)
    1d55:	f3 0f 11 4d f8       	movss  %xmm1,-0x8(%rbp)
    1d5a:	f3 0f 10 4d fc       	movss  -0x4(%rbp),%xmm1
    1d5f:	f3 0f 10 05 09 13 00 	movss  0x1309(%rip),%xmm0        # 3070 <_IO_stdin_used+0x70>
    1d66:	00 
    1d67:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
    1d6b:	f3 0f 10 55 f8       	movss  -0x8(%rbp),%xmm2
    1d70:	f3 0f 10 0d f8 12 00 	movss  0x12f8(%rip),%xmm1        # 3070 <_IO_stdin_used+0x70>
    1d77:	00 
    1d78:	f3 0f 59 ca          	mulss  %xmm2,%xmm1
    1d7c:	f3 0f 5c c1          	subss  %xmm1,%xmm0
    1d80:	f3 0f 10 0d f8 12 00 	movss  0x12f8(%rip),%xmm1        # 3080 <_IO_stdin_used+0x80>
    1d87:	00 
    1d88:	0f 54 c1             	andps  %xmm1,%xmm0
    1d8b:	0f 2f 05 fe 12 00 00 	comiss 0x12fe(%rip),%xmm0        # 3090 <_IO_stdin_used+0x90>
    1d92:	76 07                	jbe    1d9b <safe_sub_func_float_f_f+0x53>
    1d94:	f3 0f 10 45 fc       	movss  -0x4(%rbp),%xmm0
    1d99:	eb 0a                	jmp    1da5 <safe_sub_func_float_f_f+0x5d>
    1d9b:	f3 0f 10 45 fc       	movss  -0x4(%rbp),%xmm0
    1da0:	f3 0f 5c 45 f8       	subss  -0x8(%rbp),%xmm0
    1da5:	5d                   	pop    %rbp
    1da6:	c3                   	ret    

0000000000001da7 <safe_mul_func_float_f_f>:
    1da7:	f3 0f 1e fa          	endbr64 
    1dab:	55                   	push   %rbp
    1dac:	48 89 e5             	mov    %rsp,%rbp
    1daf:	f3 0f 11 45 fc       	movss  %xmm0,-0x4(%rbp)
    1db4:	f3 0f 11 4d f8       	movss  %xmm1,-0x8(%rbp)
    1db9:	f3 0f 10 4d fc       	movss  -0x4(%rbp),%xmm1
    1dbe:	f3 0f 10 05 ce 12 00 	movss  0x12ce(%rip),%xmm0        # 3094 <_IO_stdin_used+0x94>
    1dc5:	00 
    1dc6:	f3 0f 59 c8          	mulss  %xmm0,%xmm1
    1dca:	f3 0f 10 55 f8       	movss  -0x8(%rbp),%xmm2
    1dcf:	f3 0f 10 05 c1 12 00 	movss  0x12c1(%rip),%xmm0        # 3098 <_IO_stdin_used+0x98>
    1dd6:	00 
    1dd7:	f3 0f 59 c2          	mulss  %xmm2,%xmm0
    1ddb:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
    1ddf:	f3 0f 10 0d 99 12 00 	movss  0x1299(%rip),%xmm1        # 3080 <_IO_stdin_used+0x80>
    1de6:	00 
    1de7:	0f 54 c1             	andps  %xmm1,%xmm0
    1dea:	0f 2f 05 ab 12 00 00 	comiss 0x12ab(%rip),%xmm0        # 309c <_IO_stdin_used+0x9c>
    1df1:	76 07                	jbe    1dfa <safe_mul_func_float_f_f+0x53>
    1df3:	f3 0f 10 45 fc       	movss  -0x4(%rbp),%xmm0
    1df8:	eb 0a                	jmp    1e04 <safe_mul_func_float_f_f+0x5d>
    1dfa:	f3 0f 10 45 fc       	movss  -0x4(%rbp),%xmm0
    1dff:	f3 0f 59 45 f8       	mulss  -0x8(%rbp),%xmm0
    1e04:	5d                   	pop    %rbp
    1e05:	c3                   	ret    

0000000000001e06 <safe_div_func_float_f_f>:
    1e06:	f3 0f 1e fa          	endbr64 
    1e0a:	55                   	push   %rbp
    1e0b:	48 89 e5             	mov    %rsp,%rbp
    1e0e:	f3 0f 11 45 fc       	movss  %xmm0,-0x4(%rbp)
    1e13:	f3 0f 11 4d f8       	movss  %xmm1,-0x8(%rbp)
    1e18:	f3 0f 10 45 f8       	movss  -0x8(%rbp),%xmm0
    1e1d:	f3 0f 10 0d 5b 12 00 	movss  0x125b(%rip),%xmm1        # 3080 <_IO_stdin_used+0x80>
    1e24:	00 
    1e25:	0f 54 c8             	andps  %xmm0,%xmm1
    1e28:	f3 0f 10 05 70 12 00 	movss  0x1270(%rip),%xmm0        # 30a0 <_IO_stdin_used+0xa0>
    1e2f:	00 
    1e30:	0f 2f c1             	comiss %xmm1,%xmm0
    1e33:	0f 97 c0             	seta   %al
    1e36:	83 f0 01             	xor    $0x1,%eax
    1e39:	84 c0                	test   %al,%al
    1e3b:	75 56                	jne    1e93 <safe_div_func_float_f_f+0x8d>
    1e3d:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1e41:	0f 2e 45 f8          	ucomiss -0x8(%rbp),%xmm0
    1e45:	7a 0a                	jp     1e51 <safe_div_func_float_f_f+0x4b>
    1e47:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1e4b:	0f 2e 45 f8          	ucomiss -0x8(%rbp),%xmm0
    1e4f:	74 4e                	je     1e9f <safe_div_func_float_f_f+0x99>
    1e51:	f3 0f 10 4d fc       	movss  -0x4(%rbp),%xmm1
    1e56:	f3 0f 10 05 46 12 00 	movss  0x1246(%rip),%xmm0        # 30a4 <_IO_stdin_used+0xa4>
    1e5d:	00 
    1e5e:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
    1e62:	f3 0f 10 55 f8       	movss  -0x8(%rbp),%xmm2
    1e67:	f3 0f 10 0d 39 12 00 	movss  0x1239(%rip),%xmm1        # 30a8 <_IO_stdin_used+0xa8>
    1e6e:	00 
    1e6f:	f3 0f 59 ca          	mulss  %xmm2,%xmm1
    1e73:	f3 0f 5e c1          	divss  %xmm1,%xmm0
    1e77:	f3 0f 10 0d 01 12 00 	movss  0x1201(%rip),%xmm1        # 3080 <_IO_stdin_used+0x80>
    1e7e:	00 
    1e7f:	0f 54 c1             	andps  %xmm1,%xmm0
    1e82:	0f 2f 05 23 12 00 00 	comiss 0x1223(%rip),%xmm0        # 30ac <_IO_stdin_used+0xac>
    1e89:	0f 97 c0             	seta   %al
    1e8c:	83 f0 01             	xor    $0x1,%eax
    1e8f:	84 c0                	test   %al,%al
    1e91:	74 0c                	je     1e9f <safe_div_func_float_f_f+0x99>
    1e93:	f3 0f 10 45 fc       	movss  -0x4(%rbp),%xmm0
    1e98:	f3 0f 5e 45 f8       	divss  -0x8(%rbp),%xmm0
    1e9d:	eb 05                	jmp    1ea4 <safe_div_func_float_f_f+0x9e>
    1e9f:	f3 0f 10 45 fc       	movss  -0x4(%rbp),%xmm0
    1ea4:	5d                   	pop    %rbp
    1ea5:	c3                   	ret    

0000000000001ea6 <safe_add_func_double_f_f>:
    1ea6:	f3 0f 1e fa          	endbr64 
    1eaa:	55                   	push   %rbp
    1eab:	48 89 e5             	mov    %rsp,%rbp
    1eae:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
    1eb3:	f2 0f 11 4d f0       	movsd  %xmm1,-0x10(%rbp)
    1eb8:	f2 0f 10 4d f8       	movsd  -0x8(%rbp),%xmm1
    1ebd:	f2 0f 10 05 eb 11 00 	movsd  0x11eb(%rip),%xmm0        # 30b0 <_IO_stdin_used+0xb0>
    1ec4:	00 
    1ec5:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
    1ec9:	f2 0f 10 55 f0       	movsd  -0x10(%rbp),%xmm2
    1ece:	f2 0f 10 05 da 11 00 	movsd  0x11da(%rip),%xmm0        # 30b0 <_IO_stdin_used+0xb0>
    1ed5:	00 
    1ed6:	f2 0f 59 c2          	mulsd  %xmm2,%xmm0
    1eda:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
    1ede:	f3 0f 7e 0d da 11 00 	movq   0x11da(%rip),%xmm1        # 30c0 <_IO_stdin_used+0xc0>
    1ee5:	00 
    1ee6:	66 0f 54 c1          	andpd  %xmm1,%xmm0
    1eea:	66 0f 2f 05 de 11 00 	comisd 0x11de(%rip),%xmm0        # 30d0 <_IO_stdin_used+0xd0>
    1ef1:	00 
    1ef2:	76 07                	jbe    1efb <safe_add_func_double_f_f+0x55>
    1ef4:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
    1ef9:	eb 0a                	jmp    1f05 <safe_add_func_double_f_f+0x5f>
    1efb:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
    1f00:	f2 0f 58 45 f0       	addsd  -0x10(%rbp),%xmm0
    1f05:	66 48 0f 7e c0       	movq   %xmm0,%rax
    1f0a:	66 48 0f 6e c0       	movq   %rax,%xmm0
    1f0f:	5d                   	pop    %rbp
    1f10:	c3                   	ret    

0000000000001f11 <safe_sub_func_double_f_f>:
    1f11:	f3 0f 1e fa          	endbr64 
    1f15:	55                   	push   %rbp
    1f16:	48 89 e5             	mov    %rsp,%rbp
    1f19:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
    1f1e:	f2 0f 11 4d f0       	movsd  %xmm1,-0x10(%rbp)
    1f23:	f2 0f 10 4d f8       	movsd  -0x8(%rbp),%xmm1
    1f28:	f2 0f 10 05 80 11 00 	movsd  0x1180(%rip),%xmm0        # 30b0 <_IO_stdin_used+0xb0>
    1f2f:	00 
    1f30:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
    1f34:	f2 0f 10 55 f0       	movsd  -0x10(%rbp),%xmm2
    1f39:	f2 0f 10 0d 6f 11 00 	movsd  0x116f(%rip),%xmm1        # 30b0 <_IO_stdin_used+0xb0>
    1f40:	00 
    1f41:	f2 0f 59 ca          	mulsd  %xmm2,%xmm1
    1f45:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
    1f49:	f3 0f 7e 0d 6f 11 00 	movq   0x116f(%rip),%xmm1        # 30c0 <_IO_stdin_used+0xc0>
    1f50:	00 
    1f51:	66 0f 54 c1          	andpd  %xmm1,%xmm0
    1f55:	66 0f 2f 05 73 11 00 	comisd 0x1173(%rip),%xmm0        # 30d0 <_IO_stdin_used+0xd0>
    1f5c:	00 
    1f5d:	76 07                	jbe    1f66 <safe_sub_func_double_f_f+0x55>
    1f5f:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
    1f64:	eb 0a                	jmp    1f70 <safe_sub_func_double_f_f+0x5f>
    1f66:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
    1f6b:	f2 0f 5c 45 f0       	subsd  -0x10(%rbp),%xmm0
    1f70:	66 48 0f 7e c0       	movq   %xmm0,%rax
    1f75:	66 48 0f 6e c0       	movq   %rax,%xmm0
    1f7a:	5d                   	pop    %rbp
    1f7b:	c3                   	ret    

0000000000001f7c <safe_mul_func_double_f_f>:
    1f7c:	f3 0f 1e fa          	endbr64 
    1f80:	55                   	push   %rbp
    1f81:	48 89 e5             	mov    %rsp,%rbp
    1f84:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
    1f89:	f2 0f 11 4d f0       	movsd  %xmm1,-0x10(%rbp)
    1f8e:	f2 0f 10 4d f8       	movsd  -0x8(%rbp),%xmm1
    1f93:	f2 0f 10 05 3d 11 00 	movsd  0x113d(%rip),%xmm0        # 30d8 <_IO_stdin_used+0xd8>
    1f9a:	00 
    1f9b:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
    1f9f:	f2 0f 10 55 f0       	movsd  -0x10(%rbp),%xmm2
    1fa4:	f2 0f 10 05 34 11 00 	movsd  0x1134(%rip),%xmm0        # 30e0 <_IO_stdin_used+0xe0>
    1fab:	00 
    1fac:	f2 0f 59 c2          	mulsd  %xmm2,%xmm0
    1fb0:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
    1fb4:	f3 0f 7e 0d 04 11 00 	movq   0x1104(%rip),%xmm1        # 30c0 <_IO_stdin_used+0xc0>
    1fbb:	00 
    1fbc:	66 0f 54 c1          	andpd  %xmm1,%xmm0
    1fc0:	66 0f 2f 05 20 11 00 	comisd 0x1120(%rip),%xmm0        # 30e8 <_IO_stdin_used+0xe8>
    1fc7:	00 
    1fc8:	76 07                	jbe    1fd1 <safe_mul_func_double_f_f+0x55>
    1fca:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
    1fcf:	eb 0a                	jmp    1fdb <safe_mul_func_double_f_f+0x5f>
    1fd1:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
    1fd6:	f2 0f 59 45 f0       	mulsd  -0x10(%rbp),%xmm0
    1fdb:	66 48 0f 7e c0       	movq   %xmm0,%rax
    1fe0:	66 48 0f 6e c0       	movq   %rax,%xmm0
    1fe5:	5d                   	pop    %rbp
    1fe6:	c3                   	ret    

0000000000001fe7 <safe_div_func_double_f_f>:
    1fe7:	f3 0f 1e fa          	endbr64 
    1feb:	55                   	push   %rbp
    1fec:	48 89 e5             	mov    %rsp,%rbp
    1fef:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
    1ff4:	f2 0f 11 4d f0       	movsd  %xmm1,-0x10(%rbp)
    1ff9:	f2 0f 10 45 f0       	movsd  -0x10(%rbp),%xmm0
    1ffe:	f3 0f 7e 0d ba 10 00 	movq   0x10ba(%rip),%xmm1        # 30c0 <_IO_stdin_used+0xc0>
    2005:	00 
    2006:	66 0f 54 c8          	andpd  %xmm0,%xmm1
    200a:	f2 0f 10 05 de 10 00 	movsd  0x10de(%rip),%xmm0        # 30f0 <_IO_stdin_used+0xf0>
    2011:	00 
    2012:	66 0f 2f c1          	comisd %xmm1,%xmm0
    2016:	0f 97 c0             	seta   %al
    2019:	83 f0 01             	xor    $0x1,%eax
    201c:	84 c0                	test   %al,%al
    201e:	75 5a                	jne    207a <safe_div_func_double_f_f+0x93>
    2020:	66 0f ef c0          	pxor   %xmm0,%xmm0
    2024:	66 0f 2e 45 f0       	ucomisd -0x10(%rbp),%xmm0
    2029:	7a 0b                	jp     2036 <safe_div_func_double_f_f+0x4f>
    202b:	66 0f ef c0          	pxor   %xmm0,%xmm0
    202f:	66 0f 2e 45 f0       	ucomisd -0x10(%rbp),%xmm0
    2034:	74 50                	je     2086 <safe_div_func_double_f_f+0x9f>
    2036:	f2 0f 10 4d f8       	movsd  -0x8(%rbp),%xmm1
    203b:	f2 0f 10 05 b5 10 00 	movsd  0x10b5(%rip),%xmm0        # 30f8 <_IO_stdin_used+0xf8>
    2042:	00 
    2043:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
    2047:	f2 0f 10 55 f0       	movsd  -0x10(%rbp),%xmm2
    204c:	f2 0f 10 0d ac 10 00 	movsd  0x10ac(%rip),%xmm1        # 3100 <_IO_stdin_used+0x100>
    2053:	00 
    2054:	f2 0f 59 ca          	mulsd  %xmm2,%xmm1
    2058:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    205c:	f3 0f 7e 0d 5c 10 00 	movq   0x105c(%rip),%xmm1        # 30c0 <_IO_stdin_used+0xc0>
    2063:	00 
    2064:	66 0f 54 c1          	andpd  %xmm1,%xmm0
    2068:	66 0f 2f 05 98 10 00 	comisd 0x1098(%rip),%xmm0        # 3108 <_IO_stdin_used+0x108>
    206f:	00 
    2070:	0f 97 c0             	seta   %al
    2073:	83 f0 01             	xor    $0x1,%eax
    2076:	84 c0                	test   %al,%al
    2078:	74 0c                	je     2086 <safe_div_func_double_f_f+0x9f>
    207a:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
    207f:	f2 0f 5e 45 f0       	divsd  -0x10(%rbp),%xmm0
    2084:	eb 05                	jmp    208b <safe_div_func_double_f_f+0xa4>
    2086:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
    208b:	66 48 0f 7e c0       	movq   %xmm0,%rax
    2090:	66 48 0f 6e c0       	movq   %rax,%xmm0
    2095:	5d                   	pop    %rbp
    2096:	c3                   	ret    

0000000000002097 <safe_convert_func_float_to_int32_t>:
    2097:	f3 0f 1e fa          	endbr64 
    209b:	55                   	push   %rbp
    209c:	48 89 e5             	mov    %rsp,%rbp
    209f:	f3 0f 11 45 fc       	movss  %xmm0,-0x4(%rbp)
    20a4:	f3 0f 10 05 64 10 00 	movss  0x1064(%rip),%xmm0        # 3110 <_IO_stdin_used+0x110>
    20ab:	00 
    20ac:	0f 2f 45 fc          	comiss -0x4(%rbp),%xmm0
    20b0:	0f 93 c0             	setae  %al
    20b3:	83 f0 01             	xor    $0x1,%eax
    20b6:	84 c0                	test   %al,%al
    20b8:	74 21                	je     20db <safe_convert_func_float_to_int32_t+0x44>
    20ba:	f3 0f 10 45 fc       	movss  -0x4(%rbp),%xmm0
    20bf:	0f 2f 05 4e 10 00 00 	comiss 0x104e(%rip),%xmm0        # 3114 <_IO_stdin_used+0x114>
    20c6:	0f 93 c0             	setae  %al
    20c9:	83 f0 01             	xor    $0x1,%eax
    20cc:	84 c0                	test   %al,%al
    20ce:	74 0b                	je     20db <safe_convert_func_float_to_int32_t+0x44>
    20d0:	f3 0f 10 45 fc       	movss  -0x4(%rbp),%xmm0
    20d5:	f3 0f 2c c0          	cvttss2si %xmm0,%eax
    20d9:	eb 05                	jmp    20e0 <safe_convert_func_float_to_int32_t+0x49>
    20db:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
    20e0:	5d                   	pop    %rbp
    20e1:	c3                   	ret    

00000000000020e2 <crc32_gentab>:
    20e2:	f3 0f 1e fa          	endbr64 
    20e6:	55                   	push   %rbp
    20e7:	48 89 e5             	mov    %rsp,%rbp
    20ea:	c7 45 fc 20 83 b8 ed 	movl   $0xedb88320,-0x4(%rbp)
    20f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    20f8:	eb 51                	jmp    214b <crc32_gentab+0x69>
    20fa:	8b 45 f4             	mov    -0xc(%rbp),%eax
    20fd:	89 45 f0             	mov    %eax,-0x10(%rbp)
    2100:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%rbp)
    2107:	eb 1e                	jmp    2127 <crc32_gentab+0x45>
    2109:	8b 45 f0             	mov    -0x10(%rbp),%eax
    210c:	83 e0 01             	and    $0x1,%eax
    210f:	85 c0                	test   %eax,%eax
    2111:	74 0d                	je     2120 <crc32_gentab+0x3e>
    2113:	8b 45 f0             	mov    -0x10(%rbp),%eax
    2116:	d1 e8                	shr    %eax
    2118:	33 45 fc             	xor    -0x4(%rbp),%eax
    211b:	89 45 f0             	mov    %eax,-0x10(%rbp)
    211e:	eb 03                	jmp    2123 <crc32_gentab+0x41>
    2120:	d1 6d f0             	shrl   -0x10(%rbp)
    2123:	83 6d f8 01          	subl   $0x1,-0x8(%rbp)
    2127:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    212b:	7f dc                	jg     2109 <crc32_gentab+0x27>
    212d:	8b 45 f4             	mov    -0xc(%rbp),%eax
    2130:	48 98                	cltq   
    2132:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
    2139:	00 
    213a:	48 8d 15 ff 3e 00 00 	lea    0x3eff(%rip),%rdx        # 6040 <crc32_tab>
    2141:	8b 45 f0             	mov    -0x10(%rbp),%eax
    2144:	89 04 11             	mov    %eax,(%rcx,%rdx,1)
    2147:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    214b:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%rbp)
    2152:	7e a6                	jle    20fa <crc32_gentab+0x18>
    2154:	90                   	nop
    2155:	90                   	nop
    2156:	5d                   	pop    %rbp
    2157:	c3                   	ret    

0000000000002158 <crc32_byte>:
    2158:	f3 0f 1e fa          	endbr64 
    215c:	55                   	push   %rbp
    215d:	48 89 e5             	mov    %rsp,%rbp
    2160:	89 f8                	mov    %edi,%eax
    2162:	88 45 fc             	mov    %al,-0x4(%rbp)
    2165:	8b 05 a5 3e 00 00    	mov    0x3ea5(%rip),%eax        # 6010 <crc32_context>
    216b:	c1 e8 08             	shr    $0x8,%eax
    216e:	89 c1                	mov    %eax,%ecx
    2170:	0f b6 55 fc          	movzbl -0x4(%rbp),%edx
    2174:	8b 05 96 3e 00 00    	mov    0x3e96(%rip),%eax        # 6010 <crc32_context>
    217a:	31 d0                	xor    %edx,%eax
    217c:	0f b6 c0             	movzbl %al,%eax
    217f:	89 c0                	mov    %eax,%eax
    2181:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2188:	00 
    2189:	48 8d 05 b0 3e 00 00 	lea    0x3eb0(%rip),%rax        # 6040 <crc32_tab>
    2190:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    2193:	31 c8                	xor    %ecx,%eax
    2195:	89 05 75 3e 00 00    	mov    %eax,0x3e75(%rip)        # 6010 <crc32_context>
    219b:	90                   	nop
    219c:	5d                   	pop    %rbp
    219d:	c3                   	ret    

000000000000219e <crc32_8bytes>:
    219e:	f3 0f 1e fa          	endbr64 
    21a2:	55                   	push   %rbp
    21a3:	48 89 e5             	mov    %rsp,%rbp
    21a6:	48 83 ec 08          	sub    $0x8,%rsp
    21aa:	89 7d fc             	mov    %edi,-0x4(%rbp)
    21ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
    21b0:	0f b6 c0             	movzbl %al,%eax
    21b3:	89 c7                	mov    %eax,%edi
    21b5:	e8 9e ff ff ff       	call   2158 <crc32_byte>
    21ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
    21bd:	c1 e8 08             	shr    $0x8,%eax
    21c0:	0f b6 c0             	movzbl %al,%eax
    21c3:	89 c7                	mov    %eax,%edi
    21c5:	e8 8e ff ff ff       	call   2158 <crc32_byte>
    21ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
    21cd:	c1 e8 10             	shr    $0x10,%eax
    21d0:	0f b6 c0             	movzbl %al,%eax
    21d3:	89 c7                	mov    %eax,%edi
    21d5:	e8 7e ff ff ff       	call   2158 <crc32_byte>
    21da:	8b 45 fc             	mov    -0x4(%rbp),%eax
    21dd:	c1 e8 18             	shr    $0x18,%eax
    21e0:	0f b6 c0             	movzbl %al,%eax
    21e3:	89 c7                	mov    %eax,%edi
    21e5:	e8 6e ff ff ff       	call   2158 <crc32_byte>
    21ea:	90                   	nop
    21eb:	c9                   	leave  
    21ec:	c3                   	ret    

00000000000021ed <transparent_crc>:
    21ed:	f3 0f 1e fa          	endbr64 
    21f1:	55                   	push   %rbp
    21f2:	48 89 e5             	mov    %rsp,%rbp
    21f5:	48 83 ec 10          	sub    $0x10,%rsp
    21f9:	89 7d fc             	mov    %edi,-0x4(%rbp)
    21fc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2200:	89 55 f8             	mov    %edx,-0x8(%rbp)
    2203:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2206:	89 c7                	mov    %eax,%edi
    2208:	e8 91 ff ff ff       	call   219e <crc32_8bytes>
    220d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    2211:	74 25                	je     2238 <transparent_crc+0x4b>
    2213:	8b 05 f7 3d 00 00    	mov    0x3df7(%rip),%eax        # 6010 <crc32_context>
    2219:	f7 d0                	not    %eax
    221b:	89 c2                	mov    %eax,%edx
    221d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2221:	48 89 c6             	mov    %rax,%rsi
    2224:	48 8d 05 f5 0d 00 00 	lea    0xdf5(%rip),%rax        # 3020 <_IO_stdin_used+0x20>
    222b:	48 89 c7             	mov    %rax,%rdi
    222e:	b8 00 00 00 00       	mov    $0x0,%eax
    2233:	e8 48 ee ff ff       	call   1080 <printf@plt>
    2238:	90                   	nop
    2239:	c9                   	leave  
    223a:	c3                   	ret    

000000000000223b <transparent_crc_bytes>:
    223b:	f3 0f 1e fa          	endbr64 
    223f:	55                   	push   %rbp
    2240:	48 89 e5             	mov    %rsp,%rbp
    2243:	48 83 ec 30          	sub    $0x30,%rsp
    2247:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    224b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    224e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    2252:	89 4d e0             	mov    %ecx,-0x20(%rbp)
    2255:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    225c:	eb 1e                	jmp    227c <transparent_crc_bytes+0x41>
    225e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2261:	48 63 d0             	movslq %eax,%rdx
    2264:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2268:	48 01 d0             	add    %rdx,%rax
    226b:	0f b6 00             	movzbl (%rax),%eax
    226e:	0f b6 c0             	movzbl %al,%eax
    2271:	89 c7                	mov    %eax,%edi
    2273:	e8 e0 fe ff ff       	call   2158 <crc32_byte>
    2278:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    227c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    227f:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
    2282:	7c da                	jl     225e <transparent_crc_bytes+0x23>
    2284:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
    2288:	74 25                	je     22af <transparent_crc_bytes+0x74>
    228a:	8b 05 80 3d 00 00    	mov    0x3d80(%rip),%eax        # 6010 <crc32_context>
    2290:	f7 d0                	not    %eax
    2292:	89 c2                	mov    %eax,%edx
    2294:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2298:	48 89 c6             	mov    %rax,%rsi
    229b:	48 8d 05 a6 0d 00 00 	lea    0xda6(%rip),%rax        # 3048 <_IO_stdin_used+0x48>
    22a2:	48 89 c7             	mov    %rax,%rdi
    22a5:	b8 00 00 00 00       	mov    $0x0,%eax
    22aa:	e8 d1 ed ff ff       	call   1080 <printf@plt>
    22af:	90                   	nop
    22b0:	c9                   	leave  
    22b1:	c3                   	ret    

00000000000022b2 <func_1>:
    22b2:	f3 0f 1e fa          	endbr64 
    22b6:	55                   	push   %rbp
    22b7:	48 89 e5             	mov    %rsp,%rbp
    22ba:	48 83 ec 30          	sub    $0x30,%rsp
    22be:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    22c5:	00 00 
    22c7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    22cb:	31 c0                	xor    %eax,%eax
    22cd:	48 8d 45 dc          	lea    -0x24(%rbp),%rax
    22d1:	48 89 c6             	mov    %rax,%rsi
    22d4:	48 8d 05 91 0d 00 00 	lea    0xd91(%rip),%rax        # 306c <_IO_stdin_used+0x6c>
    22db:	48 89 c7             	mov    %rax,%rdi
    22de:	b8 00 00 00 00       	mov    $0x0,%eax
    22e3:	e8 a8 ed ff ff       	call   1090 <__isoc99_scanf@plt>
    22e8:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
    22ec:	48 89 c6             	mov    %rax,%rsi
    22ef:	48 8d 05 76 0d 00 00 	lea    0xd76(%rip),%rax        # 306c <_IO_stdin_used+0x6c>
    22f6:	48 89 c7             	mov    %rax,%rdi
    22f9:	b8 00 00 00 00       	mov    $0x0,%eax
    22fe:	e8 8d ed ff ff       	call   1090 <__isoc99_scanf@plt>
    2303:	8b 45 e0             	mov    -0x20(%rbp),%eax
    2306:	83 f8 09             	cmp    $0x9,%eax
    2309:	7e 2f                	jle    233a <func_1+0x88>
    230b:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%rbp)
    2312:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%rbp)
    2319:	8b 55 e0             	mov    -0x20(%rbp),%edx
    231c:	8b 45 dc             	mov    -0x24(%rbp),%eax
    231f:	01 c2                	add    %eax,%edx
    2321:	8b 45 e0             	mov    -0x20(%rbp),%eax
    2324:	0f af d0             	imul   %eax,%edx
    2327:	8b 45 dc             	mov    -0x24(%rbp),%eax
    232a:	0f af 45 f0          	imul   -0x10(%rbp),%eax
    232e:	29 c2                	sub    %eax,%edx
    2330:	8b 45 f4             	mov    -0xc(%rbp),%eax
    2333:	01 d0                	add    %edx,%eax
    2335:	89 45 e0             	mov    %eax,-0x20(%rbp)
    2338:	eb 4d                	jmp    2387 <func_1+0xd5>
    233a:	8b 55 e0             	mov    -0x20(%rbp),%edx
    233d:	8b 45 dc             	mov    -0x24(%rbp),%eax
    2340:	01 d0                	add    %edx,%eax
    2342:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    2345:	8b 55 e0             	mov    -0x20(%rbp),%edx
    2348:	8b 45 dc             	mov    -0x24(%rbp),%eax
    234b:	0f af c2             	imul   %edx,%eax
    234e:	89 45 e8             	mov    %eax,-0x18(%rbp)
    2351:	c7 45 ec fa ff ff ff 	movl   $0xfffffffa,-0x14(%rbp)
    2358:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    235b:	8b 45 e8             	mov    -0x18(%rbp),%eax
    235e:	01 c2                	add    %eax,%edx
    2360:	8b 45 ec             	mov    -0x14(%rbp),%eax
    2363:	0f af c2             	imul   %edx,%eax
    2366:	89 45 ec             	mov    %eax,-0x14(%rbp)
    2369:	8b 55 dc             	mov    -0x24(%rbp),%edx
    236c:	8b 45 ec             	mov    -0x14(%rbp),%eax
    236f:	01 d0                	add    %edx,%eax
    2371:	0f af 45 e4          	imul   -0x1c(%rbp),%eax
    2375:	89 c1                	mov    %eax,%ecx
    2377:	8b 45 e8             	mov    -0x18(%rbp),%eax
    237a:	99                   	cltd   
    237b:	f7 7d e4             	idivl  -0x1c(%rbp)
    237e:	89 c2                	mov    %eax,%edx
    2380:	89 c8                	mov    %ecx,%eax
    2382:	29 d0                	sub    %edx,%eax
    2384:	89 45 e0             	mov    %eax,-0x20(%rbp)
    2387:	8b 45 e0             	mov    -0x20(%rbp),%eax
    238a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    238e:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
    2395:	00 00 
    2397:	74 05                	je     239e <func_1+0xec>
    2399:	e8 d2 ec ff ff       	call   1070 <__stack_chk_fail@plt>
    239e:	c9                   	leave  
    239f:	c3                   	ret    

00000000000023a0 <main>:
    23a0:	f3 0f 1e fa          	endbr64 
    23a4:	55                   	push   %rbp
    23a5:	48 89 e5             	mov    %rsp,%rbp
    23a8:	48 83 ec 10          	sub    $0x10,%rsp
    23ac:	e8 01 ff ff ff       	call   22b2 <func_1>
    23b1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    23b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    23b7:	89 c6                	mov    %eax,%esi
    23b9:	48 8d 05 ac 0c 00 00 	lea    0xcac(%rip),%rax        # 306c <_IO_stdin_used+0x6c>
    23c0:	48 89 c7             	mov    %rax,%rdi
    23c3:	b8 00 00 00 00       	mov    $0x0,%eax
    23c8:	e8 b3 ec ff ff       	call   1080 <printf@plt>
    23cd:	b8 00 00 00 00       	mov    $0x0,%eax
    23d2:	c9                   	leave  
    23d3:	c3                   	ret    

Disassembly of section .fini:

00000000000023d4 <_fini>:
    23d4:	f3 0f 1e fa          	endbr64 
    23d8:	48 83 ec 08          	sub    $0x8,%rsp
    23dc:	48 83 c4 08          	add    $0x8,%rsp
    23e0:	c3                   	ret    
