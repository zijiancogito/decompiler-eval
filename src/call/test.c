void FUN_00101189(void)
{
int iVar1;
long in_FS_OFFSET;
int local_24;
int local_20;
int local_1c;
int local_18;
uint local_14;
long local_10;
local_10 = *(long *)(in_FS_OFFSET + 0x28);
local_14 = 0;
__isoc99_scanf(&DAT_00102004,&local_20);
for (local_1c = 1; local_1c <= local_20; local_1c = local_1c + 1) {
__isoc99_scanf(&DAT_00102004,&local_24);
for (local_18 = 2; local_18 <= local_24; local_18 = local_18 + 1) {
if (local_24 % local_18 == 0) {
iVar1 = FUN_00101261(local_24,local_18);
local_14 = local_14 + iVar1;
}
}
printf("%d\n",(ulong)local_14);
local_14 = 0;
}
if (local_10 != *(long *)(in_FS_OFFSET + 0x28)) {
__stack_chk_fail();
}
return;
}
