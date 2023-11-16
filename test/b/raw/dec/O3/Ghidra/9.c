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
  long lVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  ulong uVar5;
  int iVar6;
  uint uVar7;
  ulong uVar8;
  undefined auVar9 [16];
  
  uVar2 = f_rand_0();
  uVar3 = f_rand_1();
  uVar4 = f_rand_2();
  printf("BB: %d",0);
  if (uVar4 == 0x223) {
    uVar2 = ~uVar3;
    if ((int)uVar3 < 0x11f) {
      printf("BB: %d",1);
      if ((int)uVar3 <= (int)uVar2) {
        if (0x4e < (int)uVar3) {
          iVar6 = 0x4e;
          do {
            printf("BB: %d",3);
            lVar1 = (long)iVar6;
            iVar6 = ((int)uVar3 / iVar6) / 0x223;
            printf("BB: %d",1,(long)(int)uVar3 % lVar1 & 0xffffffff);
          } while (iVar6 < (int)uVar3);
        }
        do {
          printf("BB: %d",2);
        } while( true );
      }
      uVar7 = 0x4e;
      uVar4 = 0x4e;
      if (0x4e < (int)uVar3) {
        uVar4 = 0x4e;
        do {
          printf("BB: %d",3);
          lVar1 = (long)(int)uVar4;
          uVar4 = ((int)uVar3 / (int)uVar4) / 0x223;
          printf("BB: %d",1,(long)(int)uVar3 % lVar1 & 0xffffffff);
        } while ((int)uVar4 < (int)uVar3);
      }
      printf("BB: %d",2);
      iVar6 = (uVar4 ^ 0x4e) + uVar4;
      uVar2 = (iVar6 / (int)uVar4 | uVar3) & 0x4e ^ uVar2;
      printf("BB: %d",3,(long)iVar6 % (long)(int)uVar4 & 0xffffffff);
      uVar4 = 0xffffffb1;
    }
    else {
      if ((int)uVar3 <= (int)uVar2) {
        printf("BB: %d",1);
        do {
          printf("BB: %d",3);
          printf("BB: %d",4);
          printf("BB: %d",1);
        } while( true );
      }
      uVar2 = -uVar3;
      uVar8 = 0x4e;
      uVar5 = 0x4e;
      do {
        printf("BB: %d",1);
        uVar4 = 0x223;
        if ((int)uVar3 <= (int)uVar5) {
          printf("BB: %d",2);
          uVar4 = ~(uint)uVar8;
        }
        printf("BB: %d",3);
        printf("BB: %d",4);
        uVar5 = (long)(int)(uVar4 ^ uVar3) / (long)(int)(uVar3 - 1);
        uVar8 = uVar5 & 0xffffffff;
        uVar7 = (uint)uVar5;
        uVar5 = (long)(int)(uVar4 * uVar2) % (long)(int)uVar3 & 0xffffffff;
      } while (uVar4 == 0x223);
    }
  }
  else {
    uVar7 = 0x4e;
  }
  printf("BB: %d",5);
  if (uVar4 != ~uVar2) {
    printf("BB: %d",6);
    iVar6 = (int)(~uVar2 | -(((int)(uVar7 ^ uVar3) % (int)uVar2) * uVar7)) % (int)uVar2;
    if ((int)uVar3 <= (int)uVar2) {
      printf("BB: %d",7);
      uVar2 = uVar2 + 1 + uVar4 + uVar7;
    }
    printf("BB: %d",8);
    printf("BB: %d",(ulong)(10 - ((int)uVar4 < iVar6)));
    printf("BB: %d",0xb);
  }
  printf("BB: %d",0xc);
  auVar9._0_8_ = (long)(int)uVar2 / (long)(int)uVar7 & 0xffffffff;
  auVar9._8_8_ = (long)(int)uVar2 % (long)(int)uVar7 & 0xffffffff;
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


