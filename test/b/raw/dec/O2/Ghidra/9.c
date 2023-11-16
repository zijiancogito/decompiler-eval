#include "out.h"



int _init(EVP_PKEY_CTX *ctx)

{
  int iVar1;
  
  iVar1 = __gmon_start__();
  return iVar1;
}



void FUN_00101020(void)

{
                    // WARNING: Treating indirect jump as call
  (*(code *)(undefined *)0x0)();
  return;
}



// WARNING: Unknown calling convention -- yet parameter storage is locked

int printf(char *__format,...)

{
  int iVar1;
  
  iVar1 = printf(__format);
  return iVar1;
}



// WARNING: Unknown calling convention -- yet parameter storage is locked

int rand(void)

{
  int iVar1;
  
  iVar1 = rand();
  return iVar1;
}



void __cxa_finalize(void)

{
  __cxa_finalize();
  return;
}



void processEntry _start(undefined8 param_1,undefined8 param_2)

{
  undefined auStack_8 [8];
  
  __libc_start_main(main,param_2,&stack0x00000008,0,0,param_1,auStack_8);
  do {
                    // WARNING: Do nothing block with infinite loop
  } while( true );
}



// WARNING: Removing unreachable block (ram,0x001010a3)
// WARNING: Removing unreachable block (ram,0x001010af)

void deregister_tm_clones(void)

{
  return;
}



// WARNING: Removing unreachable block (ram,0x001010e4)
// WARNING: Removing unreachable block (ram,0x001010f0)

void register_tm_clones(void)

{
  return;
}



void __do_global_dtors_aux(void)

{
  if (completed_0 != '\0') {
    return;
  }
  __cxa_finalize(__dso_handle);
  deregister_tm_clones();
  completed_0 = 1;
  return;
}



void frame_dummy(void)

{
  register_tm_clones();
  return;
}



undefined  [16] func0(void)

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  ulong uVar8;
  undefined auVar9 [16];
  uint local_3c;
  
  uVar1 = f_rand_0();
  uVar2 = f_rand_1();
  uVar3 = f_rand_2();
  printf("BB: %d",0);
  if (uVar3 == 0x223) {
    uVar6 = ~uVar2;
    uVar4 = -uVar2;
    local_3c = 0x4e;
    uVar8 = 0x4e;
    do {
      while( true ) {
        printf("BB: %d",1);
        uVar3 = 0x223;
        uVar7 = (uint)uVar8;
        if ((int)uVar2 <= (int)uVar7) {
          do {
            printf("BB: %d",2);
          } while ((int)uVar2 <= (int)uVar6);
          uVar3 = ~local_3c;
          uVar1 = ((int)((uVar7 ^ local_3c) + uVar7) / (int)uVar7 | uVar2) & local_3c ^ uVar6;
          uVar7 = uVar6;
        }
        printf("BB: %d",3);
        uVar8 = (ulong)(uint)((int)((long)(int)uVar2 / (long)(int)uVar7) >> 0x1f) << 0x20 |
                (long)(int)uVar2 / (long)(int)uVar7 & 0xffffffffU;
        if (0x11e < (int)uVar2) break;
        uVar8 = (long)uVar8 / (long)(int)uVar3 & 0xffffffff;
        if (uVar3 != 0x223) goto LAB_00101298;
      }
      printf("BB: %d",4,(long)uVar8 % (long)(int)uVar3 & 0xffffffff);
      local_3c = (int)(uVar3 ^ uVar2) / (int)(uVar2 - 1);
      uVar8 = (long)(int)(uVar3 * uVar4) % (long)(int)uVar2 & 0xffffffff;
      uVar1 = uVar4;
    } while (uVar3 == 0x223);
  }
  else {
    local_3c = 0x4e;
  }
LAB_00101298:
  printf("BB: %d",5);
  if (uVar3 != ~uVar1) {
    printf("BB: %d",6);
    iVar5 = (int)(~uVar1 | -(((int)(local_3c ^ uVar2) % (int)uVar1) * local_3c)) % (int)uVar1;
    if ((int)uVar2 <= (int)uVar1) {
      printf("BB: %d",7);
      uVar1 = uVar1 + 1 + uVar3 + local_3c;
    }
    printf("BB: %d",8);
    printf("BB: %d",(ulong)(10 - ((int)uVar3 < iVar5)));
    printf("BB: %d",0xb);
  }
  printf("BB: %d",0xc);
  auVar9._0_8_ = (long)(int)uVar1 / (long)(int)local_3c & 0xffffffff;
  auVar9._8_8_ = (long)(int)uVar1 % (long)(int)local_3c & 0xffffffff;
  return auVar9;
}



undefined8 main(void)

{
  uint uVar1;
  
  uVar1 = func0();
  printf("%d",(ulong)uVar1);
  return 0;
}



int f_rand_0(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_0: %d",0);
  return iVar1;
}



int f_rand_1(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_1: %d",1);
  return iVar1;
}



int f_rand_2(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_2: %d",2);
  return iVar1;
}



int f_rand_3(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_3: %d",3);
  return iVar1;
}



int f_rand_4(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_4: %d",4);
  return iVar1;
}



void _fini(void)

{
  return;
}


