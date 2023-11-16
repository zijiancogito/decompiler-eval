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
  long lVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  ulong uVar7;
  uint uVar8;
  ulong local_48;
  ulong local_38;
  
  local_48 = f_rand_3();
  iVar2 = f_rand_2();
  uVar3 = f_rand_1();
  uVar4 = f_rand_4();
  uVar5 = f_rand_0();
  uVar7 = (ulong)uVar5;
  printf("BB: %d",0);
  uVar5 = (uVar5 | 0x309) & uVar4;
  local_38 = (ulong)uVar5;
  uVar5 = uVar5 - 0x3d6 ^ (uint)local_48;
  do {
    printf("BB: %d",1);
    uVar6 = (uint)uVar7;
    if (uVar3 == uVar6) {
      printf("BB: %d",3);
      uVar8 = ~uVar5;
      uVar5 = (int)uVar8 / (int)uVar3;
      uVar7 = (long)(int)uVar8 % (long)(int)uVar3;
    }
    else {
      printf("BB: %d",2);
      lVar1 = (long)(int)((uint)local_48 & uVar6);
      local_38 = lVar1 / (long)(int)uVar5 & 0xffffffff;
      uVar7 = lVar1 % (long)(int)uVar5;
    }
    printf("BB: %d",4,uVar7 & 0xffffffff);
    if (0x331 < iVar2) {
      uVar8 = (uint)local_48 & uVar3 * iVar2;
      do {
        printf("BB: %d",5);
        uVar5 = uVar5 + (int)~uVar4 % (int)uVar4;
      } while (0x331 < iVar2);
      local_48 = (long)(CONCAT44((int)(uVar8 | 0x331) >> 0x1f,uVar8) | 0x331) / (long)(int)uVar6 &
                 0xffffffff;
      uVar6 = ~uVar5 * uVar4;
    }
    printf("BB: %d",6);
    if ((int)uVar6 < 0xdf) {
      uVar6 = uVar5 & ~uVar4;
      do {
        printf("BB: %d",7);
      } while ((int)uVar6 < 0xdf);
    }
    printf("BB: %d",8);
    uVar7 = (long)(int)((int)local_48 + uVar5) / (long)(int)local_38;
    uVar7 = (long)((ulong)(uint)((int)uVar7 >> 0x1f) << 0x20 | uVar7 & 0xffffffff) /
            (long)(int)uVar6 & 0xffffffff;
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


