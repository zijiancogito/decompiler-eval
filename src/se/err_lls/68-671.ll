; ModuleID = '/home/zrz/POJ/ds1/68/671/671.c'
source_filename = "/home/zrz/POJ/ds1/68/671/671.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"%d=%d+%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @check(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %5 = load i32, i32* %3, align 4
  %6 = srem i32 %5, 2
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = load i32, i32* %3, align 4
  %10 = icmp ne i32 %9, 2
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  store i32 0, i32* %2, align 4
  br label %38

12:                                               ; preds = %8, %1
  store i32 3, i32* %4, align 4
  br label %13

13:                                               ; preds = %26, %12
  %14 = load i32, i32* %4, align 4
  %15 = sitofp i32 %14 to double
  %16 = load i32, i32* %3, align 4
  %17 = sitofp i32 %16 to double
  %18 = call double @sqrt(double %17) #3
  %19 = fcmp ole double %15, %18
  br i1 %19, label %20, label %29

20:                                               ; preds = %13
  %21 = load i32, i32* %3, align 4
  %22 = load i32, i32* %4, align 4
  %23 = srem i32 %21, %22
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %20
  br label %29

26:                                               ; preds = %20
  %27 = load i32, i32* %4, align 4
  %28 = add nsw i32 %27, 2
  store i32 %28, i32* %4, align 4
  br label %13

29:                                               ; preds = %25, %13
  %30 = load i32, i32* %4, align 4
  %31 = sitofp i32 %30 to double
  %32 = load i32, i32* %3, align 4
  %33 = sitofp i32 %32 to double
  %34 = call double @sqrt(double %33) #3
  %35 = fcmp ogt double %31, %34
  br i1 %35, label %36, label %37

36:                                               ; preds = %29
  store i32 1, i32* %2, align 4
  br label %38

37:                                               ; preds = %29
  store i32 0, i32* %2, align 4
  br label %38

38:                                               ; preds = %37, %36, %11
  %39 = load i32, i32* %2, align 4
  ret i32 %39
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %1)
  store i32 6, i32* %2, align 4
  br label %6

6:                                                ; preds = %32, %0
  %7 = load i32, i32* %2, align 4
  %8 = load i32, i32* %1, align 4
  %9 = icmp sle i32 %7, %8
  br i1 %9, label %10, label %35

10:                                               ; preds = %6
  store i32 2, i32* %3, align 4
  br label %11

11:                                               ; preds = %29, %10
  %12 = load i32, i32* %3, align 4
  %13 = call i32 @check(i32 %12)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %28

15:                                               ; preds = %11
  %16 = load i32, i32* %2, align 4
  %17 = load i32, i32* %3, align 4
  %18 = sub nsw i32 %16, %17
  store i32 %18, i32* %4, align 4
  %19 = load i32, i32* %4, align 4
  %20 = call i32 @check(i32 %19)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %27

22:                                               ; preds = %15
  %23 = load i32, i32* %2, align 4
  %24 = load i32, i32* %3, align 4
  %25 = load i32, i32* %4, align 4
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 %23, i32 %24, i32 %25)
  br label %32

27:                                               ; preds = %15
  br label %28

28:                                               ; preds = %27, %11
  br label %29

29:                                               ; preds = %28
  %30 = load i32, i32* %3, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %3, align 4
  br label %11

32:                                               ; preds = %22
  %33 = load i32, i32* %2, align 4
  %34 = add nsw i32 %33, 2
  store i32 %34, i32* %2, align 4
  br label %6

35:                                               ; preds = %6
  ret void
}

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
