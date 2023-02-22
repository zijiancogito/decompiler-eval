int main(int argc, const char **argv, const char **envp)
{
  char *v7; // rsi
  char *v8; // rbx
  int v4;
  v4 = 3;

  v7 = (char *)&num[v4];
  v8 = (char *)&a[v4];
 
  printf("%s\n%s\n", v7, v8);
  return 0;
}
