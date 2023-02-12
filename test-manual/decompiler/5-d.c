void main(void)

{
  int aiStack_1548 [103];
  int local_13ac;
  int local_13a8;
  int local_13a4;
  int local_13a0;
  int local_139c;
  char local_1398 [5008];
  
  scanf("%d",&local_139c);
  local_13a8 = 0;
  for (local_13a0 = 0; local_13a0 <= local_139c; local_13a0 = local_13a0 + 1) {
    local_13a4 = 0;
    while ((scanf("%c",local_1398 + (long)local_13a4 + (long)local_13a0 * 100),
            local_1398[(long)local_13a4 + (long)local_13a0 * 100] != '\n')) {
      aiStack_1548[local_13a8] = local_13a4 + 1;
      local_13a4 = local_13a4 + 1;
    }
    local_13a8 = local_13a8 + 1;
  }
  for (local_13a0 = 1; local_13a0 < local_139c; local_13a0 = local_13a0 + 1) {
    local_13ac = aiStack_1548[local_13a0];
    if (((local_1398[(long)(local_13ac + -2) + (long)local_13a0 * 100] == 'e') &&
        (local_1398[(long)(local_13ac + -1) + (long)local_13a0 * 100] == 'r')) ||
       ((local_1398[(long)(local_13ac + -2) + (long)local_13a0 * 100] == 'l' &&
        (local_1398[(long)(local_13ac + -1) + (long)local_13a0 * 100] == 'y')))) {
      for (local_13a4 = 0; local_13a4 < local_13ac + -2; local_13a4 = local_13a4 + 1) {
        printf("%c",(ulong)(uint)(int)local_1398[(long)local_13a4 + (long)local_13a0 * 100]);
      }
    }
    if (((local_1398[(long)(local_13ac + -3) + (long)local_13a0 * 100] == 'i') &&
        (local_1398[(long)(local_13ac + -2) + (long)local_13a0 * 100] == 'n')) &&
       (local_1398[(long)(local_13ac + -1) + (long)local_13a0 * 100] == 'g')) {
      for (local_13a4 = 0; local_13a4 < local_13ac + -3; local_13a4 = local_13a4 + 1) {
        printf("%c",(ulong)(uint)(int)local_1398[(long)local_13a4 + (long)local_13a0 * 100]);
      }
    }
    printf("\n");
  }
  local_13ac = aiStack_1548[local_13a0];
  if (((local_1398[(long)(local_13ac + -2) + (long)local_13a0 * 100] == 'e') &&
      (local_1398[(long)(local_13ac + -1) + (long)local_13a0 * 100] == 'r')) ||
     ((local_1398[(long)(local_13ac + -2) + (long)local_13a0 * 100] == 'l' &&
      (local_1398[(long)(local_13ac + -1) + (long)local_13a0 * 100] == 'y')))) {
    for (local_13a4 = 0; local_13a4 < local_13ac + -2; local_13a4 = local_13a4 + 1) {
      printf("%c",(ulong)(uint)(int)local_1398[(long)local_13a4 + (long)local_13a0 * 100]);
    }
  }
  if (((local_1398[(long)(local_13ac + -3) + (long)local_13a0 * 100] == 'i') &&
      (local_1398[(long)(local_13ac + -2) + (long)local_13a0 * 100] == 'n')) &&
     (local_1398[(long)(local_13ac + -1) + (long)local_13a0 * 100] == 'g')) {
    for (local_13a4 = 0; local_13a4 < local_13ac + -3; local_13a4 = local_13a4 + 1) {
      printf("%c",(ulong)(uint)(int)local_1398[(long)local_13a4 + (long)local_13a0 * 100]);
    }
  }
  return;
}