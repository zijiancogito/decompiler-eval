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
  ulong uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  ulong uVar7;
  bool bVar8;
  
  iVar2 = f_rand_4();
  iVar3 = f_rand_0();
  iVar4 = f_rand_2();
  iVar5 = f_rand_1();
  iVar6 = f_rand_3();
  printf("BB: %d",0);
  iVar5 = -0x36562 % iVar5;
  bVar8 = false;
  do {
    printf("BB: %d",1);
    if (0x100 < iVar2) {
      do {
        printf("BB: %d",2);
      } while( true );
    }
    printf("BB: %d",3);
    uVar7 = 0x100 % (long)iVar2 & 0xffffffff;
    if (!bVar8) {
      if (iVar3 != -0x1c4) {
        do {
          printf("BB: %d",4);
        } while( true );
      }
      printf("BB: %d",4,uVar7);
      uVar7 = (long)iVar6 % (long)((int)(0x100 / (long)iVar2) + 0x362);
      uVar1 = (ulong)(uint)((int)uVar7 >> 0x1f) << 0x20 | uVar7 & 0xffffffff;
      uVar7 = (long)uVar1 % (long)iVar4 & 0xffffffff;
      iVar5 = (int)((long)uVar1 / (long)iVar4);
    }
    printf("BB: %d",5,uVar7);
    iVar3 = iVar3 % 0x1c3 + 0x100;
    bVar8 = true;
  } while (iVar5 < 0x1c4);
  printf("BB: %d",6);
  printf("BB: %d",7);
  do {
    printf("BB: %d",8);
  } while( true );
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


