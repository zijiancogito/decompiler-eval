undefined8 main(void)

{
  int iVar1;
  long in_FS_OFFSET;
  int local_18;
  int local_14;
  long local_10;
  
  local_10 = *(long *)(in_FS_OFFSET + 0x28);
  __isoc99_scanf(&DAT_00102004,&local_18);
  __isoc99_scanf(&DAT_00102004,&local_14);
  if (local_14 < 10) {
    iVar1 = local_14 + local_18;
    iVar1 = ((iVar1 + local_14 * local_18) * -6 + local_18) * iVar1 - (local_14 * local_18) / iVar1;
  }
  else {
    iVar1 = (local_14 + local_18) * local_14 + local_18 * -2 + 3;
  }
  __printf_chk(1,&DAT_00102004,iVar1);
  if (local_10 == *(long *)(in_FS_OFFSET + 0x28)) {
    return 0;
  }
                    // WARNING: Subroutine does not return
  __stack_chk_fail();
}
