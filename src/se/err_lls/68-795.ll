; ModuleID = '/home/zrz/POJ/ds1/68/795/795.c'
source_filename = "/home/zrz/POJ/ds1/68/795/795.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"%ld=%ld+%ld\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i32 0, i32* %1, align 4
  %8 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i64* %2)
  store i64 6, i64* %3, align 8
  br label %9

9:                                                ; preds = %91, %0
  %10 = load i64, i64* %3, align 8
  %11 = load i64, i64* %2, align 8
  %12 = icmp sle i64 %10, %11
  br i1 %12, label %13, label %94

13:                                               ; preds = %9
  %14 = load i64, i64* %3, align 8
  %15 = srem i64 %14, 2
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %17, label %90

17:                                               ; preds = %13
  store i64 3, i64* %4, align 8
  br label %18

18:                                               ; preds = %86, %17
  %19 = load i64, i64* %4, align 8
  %20 = load i64, i64* %3, align 8
  %21 = icmp slt i64 %19, %20
  br i1 %21, label %22, label %89

22:                                               ; preds = %18
  store i64 1, i64* %6, align 8
  %23 = load i64, i64* %4, align 8
  %24 = srem i64 %23, 2
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %22
  store i64 0, i64* %6, align 8
  br label %46

27:                                               ; preds = %22
  store i64 3, i64* %5, align 8
  br label %28

28:                                               ; preds = %42, %27
  %29 = load i64, i64* %5, align 8
  %30 = sitofp i64 %29 to double
  %31 = load i64, i64* %4, align 8
  %32 = sitofp i64 %31 to double
  %33 = call double @sqrt(double %32) #3
  %34 = fcmp ole double %30, %33
  br i1 %34, label %35, label %45

35:                                               ; preds = %28
  %36 = load i64, i64* %4, align 8
  %37 = load i64, i64* %5, align 8
  %38 = srem i64 %36, %37
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %40, label %41

40:                                               ; preds = %35
  store i64 0, i64* %6, align 8
  br label %45

41:                                               ; preds = %35
  br label %42

42:                                               ; preds = %41
  %43 = load i64, i64* %5, align 8
  %44 = add nsw i64 %43, 2
  store i64 %44, i64* %5, align 8
  br label %28

45:                                               ; preds = %40, %28
  br label %46

46:                                               ; preds = %45, %26
  %47 = load i64, i64* %6, align 8
  %48 = icmp ne i64 %47, 0
  br i1 %48, label %49, label %85

49:                                               ; preds = %46
  %50 = load i64, i64* %3, align 8
  %51 = load i64, i64* %4, align 8
  %52 = sub nsw i64 %50, %51
  store i64 %52, i64* %7, align 8
  %53 = load i64, i64* %7, align 8
  %54 = srem i64 %53, 2
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %56, label %57

56:                                               ; preds = %49
  store i64 0, i64* %6, align 8
  br label %76

57:                                               ; preds = %49
  store i64 3, i64* %5, align 8
  br label %58

58:                                               ; preds = %72, %57
  %59 = load i64, i64* %5, align 8
  %60 = sitofp i64 %59 to double
  %61 = load i64, i64* %7, align 8
  %62 = sitofp i64 %61 to double
  %63 = call double @sqrt(double %62) #3
  %64 = fcmp ole double %60, %63
  br i1 %64, label %65, label %75

65:                                               ; preds = %58
  %66 = load i64, i64* %7, align 8
  %67 = load i64, i64* %5, align 8
  %68 = srem i64 %66, %67
  %69 = icmp eq i64 %68, 0
  br i1 %69, label %70, label %71

70:                                               ; preds = %65
  store i64 0, i64* %6, align 8
  br label %75

71:                                               ; preds = %65
  br label %72

72:                                               ; preds = %71
  %73 = load i64, i64* %5, align 8
  %74 = add nsw i64 %73, 2
  store i64 %74, i64* %5, align 8
  br label %58

75:                                               ; preds = %70, %58
  br label %76

76:                                               ; preds = %75, %56
  %77 = load i64, i64* %6, align 8
  %78 = icmp ne i64 %77, 0
  br i1 %78, label %79, label %84

79:                                               ; preds = %76
  %80 = load i64, i64* %3, align 8
  %81 = load i64, i64* %4, align 8
  %82 = load i64, i64* %7, align 8
  %83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i64 %80, i64 %81, i64 %82)
  br label %89

84:                                               ; preds = %76
  br label %85

85:                                               ; preds = %84, %46
  br label %86

86:                                               ; preds = %85
  %87 = load i64, i64* %4, align 8
  %88 = add nsw i64 %87, 1
  store i64 %88, i64* %4, align 8
  br label %18

89:                                               ; preds = %79, %18
  br label %90

90:                                               ; preds = %89, %13
  br label %91

91:                                               ; preds = %90
  %92 = load i64, i64* %3, align 8
  %93 = add nsw i64 %92, 1
  store i64 %93, i64* %3, align 8
  br label %9

94:                                               ; preds = %9
  %95 = load i32, i32* %1, align 4
  ret i32 %95
}

declare dso_local i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

declare dso_local i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
