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



void func0(void)

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  ulong uVar8;
  uint uVar9;
  
  uVar1 = f_rand_3();
  iVar2 = f_rand_2();
  uVar3 = f_rand_1();
  uVar4 = f_rand_4();
  uVar5 = f_rand_0();
  uVar8 = (ulong)uVar5;
  printf("BB: %d",0);
  if (0x331 < iVar2) {
    printf("BB: %d",1);
    printf("BB: %d",(ulong)(uVar3 == uVar5 | 2));
    printf("BB: %d",4);
    do {
      printf("BB: %d",5);
    } while( true );
  }
  uVar9 = (uVar5 | 0x309) & uVar4;
  uVar5 = uVar9 - 0x3d6 ^ uVar1;
  do {
    printf("BB: %d",1);
    uVar7 = (uint)uVar8;
    if (uVar3 == uVar7) {
      printf("BB: %d",3);
      uVar6 = ~uVar5;
      uVar5 = (int)uVar6 / (int)uVar3;
      uVar8 = (long)(int)uVar6 % (long)(int)uVar3;
    }
    else {
      printf("BB: %d",2);
      uVar9 = (int)(uVar1 & uVar7) / (int)uVar5;
      uVar8 = (long)(int)(uVar1 & uVar7) % (long)(int)uVar5;
    }
    printf("BB: %d",4,uVar8 & 0xffffffff);
    printf("BB: %d",6);
    if ((int)uVar7 < 0xdf) {
      uVar7 = uVar5 & ~uVar4;
      if ((int)uVar7 < 0xdf) {
        do {
          printf("BB: %d",7);
        } while( true );
      }
      printf("BB: %d",7);
    }
    printf("BB: %d",8);
    uVar8 = (long)(int)(uVar1 + uVar5) / (long)(int)uVar9;
    uVar8 = (long)((ulong)(uint)((int)uVar8 >> 0x1f) << 0x20 | uVar8 & 0xffffffff) /
            (long)(int)uVar7 & 0xffffffff;
  } while( true );
}



int main(void)

{
  int iVar1;
  
  func0();
  iVar1 = rand();
  printf("f_rand_0: %d",0);
  return iVar1;
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


