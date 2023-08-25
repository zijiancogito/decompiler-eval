#include <stdio.h>

void f_printf(int p0)
{
   printf("%d", p0);
}

int f_scanf_nop(void)
{
   int var0;
   scanf("%d", &var0);
   return var0;
}

int func0(int p0)
{
   int var0 = f_scanf_nop();
   int var1 = f_scanf_nop();
   int var2 = f_scanf_nop();
   int var3 = f_scanf_nop();
   int var4 = f_scanf_nop();
   int var5 = f_scanf_nop();
   int var6 = f_scanf_nop();
   int var7 = f_scanf_nop();
   int var8 = f_scanf_nop();
   int var9 = f_scanf_nop();
   int var10 = -7;
   int var11 = -9;
   int var12 = -4;
   int var13 = -5;
   int var14 = 5;
   var8 = var11 + var8;
   var4 = var2 & var11;
   var12 = ((((var1 / var9) | var2) | var3) + var7) / var6;
   f_printf(var12);
   var12 = var9 & var10;
   f_printf(var12);
   var14 = var5 / var0;
   f_printf(var14);
   var2 = (p0 / var2) - var10;
   var6 = ((var3 / var14) / var8) & p0;
   f_printf(var6);
   var2 = (var7 * var2) & var10;
   f_printf(var2);
   var9 = (var4 + var9) & var0;
   var10 = var10 ^ var2;
   var7 = var5 / var10;
   var8 = p0 - var6;
   var11 = (var11 * var2) - var10;
   f_printf(var11);
   var6 = var0 / var2;
   f_printf(var6);
   var4 = var7 / var3;
   var4 = (var9 / var3) & var5;
   var7 = (var14 * var1) ^ p0;
   f_printf(var7);
   var13 = (var1 & var3) * var8;
   f_printf(var13);
   var2 = var12 * var4;
   f_printf(var2);
   p0 = (var7 & var1) - var7;
   p0 = ((var7 ^ var4) & var2) / var9;
   var4 = (var12 * var0) | var1;
   f_printf(var4);
   var11 = var10 ^ var1;
   f_printf(var11);
   var12 = ((var2 / var14) / var3) & var2;
   f_printf(var12);
   var1 = ((var0 - var3) - var1) & var13;
   var4 = var3 | var6;
   f_printf(var4);
   var14 = var3 | var10;
   var10 = (var2 ^ var14) - var11;
   f_printf(var10);
   var13 = var9 - var4;
   var11 = var5 * var13;
   var10 = ((((var1 + var7) * var4) & var11) - var14) ^ var5;
   return var10;
}

int main(void)
{
   int var0 = f_scanf_nop();
   int var1 = f_scanf_nop();
   int var2 = f_scanf_nop();
   int var3 = f_scanf_nop();
   int var4 = f_scanf_nop();
   func0(var0);
   return 0;
}

