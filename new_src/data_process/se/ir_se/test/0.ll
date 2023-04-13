; ModuleID = '/home/eval/DF2/src/0.c'
source_filename = "/home/eval/DF2/src/0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @f_printf(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %3)
  ret void
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f_scanf_nop() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %1)
  %3 = load i32, i32* %1, align 4
  ret i32 %3
}

declare i32 @__isoc99_scanf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @func0(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %18 = call i32 @f_scanf_nop()
  store i32 %18, i32* %3, align 4
  %19 = call i32 @f_scanf_nop()
  store i32 %19, i32* %4, align 4
  %20 = call i32 @f_scanf_nop()
  store i32 %20, i32* %5, align 4
  %21 = call i32 @f_scanf_nop()
  store i32 %21, i32* %6, align 4
  %22 = call i32 @f_scanf_nop()
  store i32 %22, i32* %7, align 4
  %23 = call i32 @f_scanf_nop()
  store i32 %23, i32* %8, align 4
  %24 = call i32 @f_scanf_nop()
  store i32 %24, i32* %9, align 4
  %25 = call i32 @f_scanf_nop()
  store i32 %25, i32* %10, align 4
  %26 = call i32 @f_scanf_nop()
  store i32 %26, i32* %11, align 4
  %27 = call i32 @f_scanf_nop()
  store i32 %27, i32* %12, align 4
  store i32 -7, i32* %13, align 4
  store i32 -9, i32* %14, align 4
  store i32 -4, i32* %15, align 4
  store i32 -5, i32* %16, align 4
  store i32 5, i32* %17, align 4
  %28 = load i32, i32* %14, align 4
  %29 = load i32, i32* %11, align 4
  %30 = add nsw i32 %28, %29
  store i32 %30, i32* %11, align 4
  %31 = load i32, i32* %5, align 4
  %32 = load i32, i32* %14, align 4
  %33 = and i32 %31, %32
  store i32 %33, i32* %7, align 4
  %34 = load i32, i32* %4, align 4
  %35 = load i32, i32* %12, align 4
  %36 = sdiv i32 %34, %35
  %37 = load i32, i32* %5, align 4
  %38 = or i32 %36, %37
  %39 = load i32, i32* %6, align 4
  %40 = or i32 %38, %39
  %41 = load i32, i32* %10, align 4
  %42 = add nsw i32 %40, %41
  %43 = load i32, i32* %9, align 4
  %44 = sdiv i32 %42, %43
  store i32 %44, i32* %15, align 4
  %45 = load i32, i32* %15, align 4
  call void @f_printf(i32 noundef %45)
  %46 = load i32, i32* %12, align 4
  %47 = load i32, i32* %13, align 4
  %48 = and i32 %46, %47
  store i32 %48, i32* %15, align 4
  %49 = load i32, i32* %15, align 4
  call void @f_printf(i32 noundef %49)
  %50 = load i32, i32* %8, align 4
  %51 = load i32, i32* %3, align 4
  %52 = sdiv i32 %50, %51
  store i32 %52, i32* %17, align 4
  %53 = load i32, i32* %17, align 4
  call void @f_printf(i32 noundef %53)
  %54 = load i32, i32* %2, align 4
  %55 = load i32, i32* %5, align 4
  %56 = sdiv i32 %54, %55
  %57 = load i32, i32* %13, align 4
  %58 = sub nsw i32 %56, %57
  store i32 %58, i32* %5, align 4
  %59 = load i32, i32* %6, align 4
  %60 = load i32, i32* %17, align 4
  %61 = sdiv i32 %59, %60
  %62 = load i32, i32* %11, align 4
  %63 = sdiv i32 %61, %62
  %64 = load i32, i32* %2, align 4
  %65 = and i32 %63, %64
  store i32 %65, i32* %9, align 4
  %66 = load i32, i32* %9, align 4
  call void @f_printf(i32 noundef %66)
  %67 = load i32, i32* %10, align 4
  %68 = load i32, i32* %5, align 4
  %69 = mul nsw i32 %67, %68
  %70 = load i32, i32* %13, align 4
  %71 = and i32 %69, %70
  store i32 %71, i32* %5, align 4
  %72 = load i32, i32* %5, align 4
  call void @f_printf(i32 noundef %72)
  %73 = load i32, i32* %7, align 4
  %74 = load i32, i32* %12, align 4
  %75 = add nsw i32 %73, %74
  %76 = load i32, i32* %3, align 4
  %77 = and i32 %75, %76
  store i32 %77, i32* %12, align 4
  %78 = load i32, i32* %13, align 4
  %79 = load i32, i32* %5, align 4
  %80 = xor i32 %78, %79
  store i32 %80, i32* %13, align 4
  %81 = load i32, i32* %8, align 4
  %82 = load i32, i32* %13, align 4
  %83 = sdiv i32 %81, %82
  store i32 %83, i32* %10, align 4
  %84 = load i32, i32* %2, align 4
  %85 = load i32, i32* %9, align 4
  %86 = sub nsw i32 %84, %85
  store i32 %86, i32* %11, align 4
  %87 = load i32, i32* %14, align 4
  %88 = load i32, i32* %5, align 4
  %89 = mul nsw i32 %87, %88
  %90 = load i32, i32* %13, align 4
  %91 = sub nsw i32 %89, %90
  store i32 %91, i32* %14, align 4
  %92 = load i32, i32* %14, align 4
  call void @f_printf(i32 noundef %92)
  %93 = load i32, i32* %3, align 4
  %94 = load i32, i32* %5, align 4
  %95 = sdiv i32 %93, %94
  store i32 %95, i32* %9, align 4
  %96 = load i32, i32* %9, align 4
  call void @f_printf(i32 noundef %96)
  %97 = load i32, i32* %10, align 4
  %98 = load i32, i32* %6, align 4
  %99 = sdiv i32 %97, %98
  store i32 %99, i32* %7, align 4
  %100 = load i32, i32* %12, align 4
  %101 = load i32, i32* %6, align 4
  %102 = sdiv i32 %100, %101
  %103 = load i32, i32* %8, align 4
  %104 = and i32 %102, %103
  store i32 %104, i32* %7, align 4
  %105 = load i32, i32* %17, align 4
  %106 = load i32, i32* %4, align 4
  %107 = mul nsw i32 %105, %106
  %108 = load i32, i32* %2, align 4
  %109 = xor i32 %107, %108
  store i32 %109, i32* %10, align 4
  %110 = load i32, i32* %10, align 4
  call void @f_printf(i32 noundef %110)
  %111 = load i32, i32* %4, align 4
  %112 = load i32, i32* %6, align 4
  %113 = and i32 %111, %112
  %114 = load i32, i32* %11, align 4
  %115 = mul nsw i32 %113, %114
  store i32 %115, i32* %16, align 4
  %116 = load i32, i32* %16, align 4
  call void @f_printf(i32 noundef %116)
  %117 = load i32, i32* %15, align 4
  %118 = load i32, i32* %7, align 4
  %119 = mul nsw i32 %117, %118
  store i32 %119, i32* %5, align 4
  %120 = load i32, i32* %5, align 4
  call void @f_printf(i32 noundef %120)
  %121 = load i32, i32* %10, align 4
  %122 = load i32, i32* %4, align 4
  %123 = and i32 %121, %122
  %124 = load i32, i32* %10, align 4
  %125 = sub nsw i32 %123, %124
  store i32 %125, i32* %2, align 4
  %126 = load i32, i32* %10, align 4
  %127 = load i32, i32* %7, align 4
  %128 = xor i32 %126, %127
  %129 = load i32, i32* %5, align 4
  %130 = and i32 %128, %129
  %131 = load i32, i32* %12, align 4
  %132 = sdiv i32 %130, %131
  store i32 %132, i32* %2, align 4
  %133 = load i32, i32* %15, align 4
  %134 = load i32, i32* %3, align 4
  %135 = mul nsw i32 %133, %134
  %136 = load i32, i32* %4, align 4
  %137 = or i32 %135, %136
  store i32 %137, i32* %7, align 4
  %138 = load i32, i32* %7, align 4
  call void @f_printf(i32 noundef %138)
  %139 = load i32, i32* %13, align 4
  %140 = load i32, i32* %4, align 4
  %141 = xor i32 %139, %140
  store i32 %141, i32* %14, align 4
  %142 = load i32, i32* %14, align 4
  call void @f_printf(i32 noundef %142)
  %143 = load i32, i32* %5, align 4
  %144 = load i32, i32* %17, align 4
  %145 = sdiv i32 %143, %144
  %146 = load i32, i32* %6, align 4
  %147 = sdiv i32 %145, %146
  %148 = load i32, i32* %5, align 4
  %149 = and i32 %147, %148
  store i32 %149, i32* %15, align 4
  %150 = load i32, i32* %15, align 4
  call void @f_printf(i32 noundef %150)
  %151 = load i32, i32* %3, align 4
  %152 = load i32, i32* %6, align 4
  %153 = sub nsw i32 %151, %152
  %154 = load i32, i32* %4, align 4
  %155 = sub nsw i32 %153, %154
  %156 = load i32, i32* %16, align 4
  %157 = and i32 %155, %156
  store i32 %157, i32* %4, align 4
  %158 = load i32, i32* %6, align 4
  %159 = load i32, i32* %9, align 4
  %160 = or i32 %158, %159
  store i32 %160, i32* %7, align 4
  %161 = load i32, i32* %7, align 4
  call void @f_printf(i32 noundef %161)
  %162 = load i32, i32* %6, align 4
  %163 = load i32, i32* %13, align 4
  %164 = or i32 %162, %163
  store i32 %164, i32* %17, align 4
  %165 = load i32, i32* %5, align 4
  %166 = load i32, i32* %17, align 4
  %167 = xor i32 %165, %166
  %168 = load i32, i32* %14, align 4
  %169 = sub nsw i32 %167, %168
  store i32 %169, i32* %13, align 4
  %170 = load i32, i32* %13, align 4
  call void @f_printf(i32 noundef %170)
  %171 = load i32, i32* %12, align 4
  %172 = load i32, i32* %7, align 4
  %173 = sub nsw i32 %171, %172
  store i32 %173, i32* %16, align 4
  %174 = load i32, i32* %8, align 4
  %175 = load i32, i32* %16, align 4
  %176 = mul nsw i32 %174, %175
  store i32 %176, i32* %14, align 4
  %177 = load i32, i32* %4, align 4
  %178 = load i32, i32* %10, align 4
  %179 = add nsw i32 %177, %178
  %180 = load i32, i32* %7, align 4
  %181 = mul nsw i32 %179, %180
  %182 = load i32, i32* %14, align 4
  %183 = and i32 %181, %182
  %184 = load i32, i32* %17, align 4
  %185 = sub nsw i32 %183, %184
  %186 = load i32, i32* %8, align 4
  %187 = xor i32 %185, %186
  store i32 %187, i32* %13, align 4
  %188 = load i32, i32* %13, align 4
  ret i32 %188
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %7 = call i32 @f_scanf_nop()
  store i32 %7, i32* %2, align 4
  %8 = call i32 @f_scanf_nop()
  store i32 %8, i32* %3, align 4
  %9 = call i32 @f_scanf_nop()
  store i32 %9, i32* %4, align 4
  %10 = call i32 @f_scanf_nop()
  store i32 %10, i32* %5, align 4
  %11 = call i32 @f_scanf_nop()
  store i32 %11, i32* %6, align 4
  %12 = load i32, i32* %2, align 4
  %13 = call i32 @func0(i32 noundef %12)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
