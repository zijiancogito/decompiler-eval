; ModuleID = '../../../test/b/raw/src/7.c'
source_filename = "../../../test/b/raw/src/7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"BB: %d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"f_rand_0: %d\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"f_rand_1: %d\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"f_rand_2: %d\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"f_rand_3: %d\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"f_rand_4: %d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @func0() #0 {
  %1 = alloca i32, align 4
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
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = call i32 @f_rand_0()
  store i32 %23, i32* %1, align 4
  store i32 40, i32* %2, align 4
  %24 = call i32 @f_rand_1()
  store i32 %24, i32* %3, align 4
  %25 = call i32 @f_rand_2()
  store i32 %25, i32* %4, align 4
  %26 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %27 = load i32, i32* %4, align 4
  %28 = load i32, i32* %1, align 4
  %29 = xor i32 %27, %28
  %30 = load i32, i32* %2, align 4
  %31 = mul nsw i32 %29, %30
  %32 = load i32, i32* %4, align 4
  %33 = add nsw i32 %31, %32
  %34 = load i32, i32* %3, align 4
  %35 = mul nsw i32 %33, %34
  store i32 %35, i32* %5, align 4
  %36 = load i32, i32* %1, align 4
  %37 = icmp eq i32 %36, 999
  br i1 %37, label %38, label %147

38:                                               ; preds = %0
  %39 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  br label %40

40:                                               ; preds = %43, %38
  %41 = load i32, i32* %4, align 4
  %42 = icmp slt i32 %41, 312
  br i1 %42, label %43, label %70

43:                                               ; preds = %40
  %44 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %45 = load i32, i32* %1, align 4
  %46 = load i32, i32* %2, align 4
  %47 = or i32 %45, %46
  %48 = load i32, i32* %4, align 4
  %49 = or i32 %47, %48
  %50 = load i32, i32* %3, align 4
  %51 = sdiv i32 %49, %50
  store i32 %51, i32* %3, align 4
  %52 = load i32, i32* %3, align 4
  %53 = load i32, i32* %4, align 4
  %54 = add nsw i32 %52, %53
  %55 = load i32, i32* %2, align 4
  %56 = srem i32 %54, %55
  %57 = load i32, i32* %1, align 4
  %58 = sub nsw i32 %56, %57
  store i32 %58, i32* %6, align 4
  %59 = load i32, i32* %5, align 4
  %60 = load i32, i32* %1, align 4
  %61 = srem i32 %59, %60
  %62 = load i32, i32* %6, align 4
  %63 = sdiv i32 %61, %62
  store i32 %63, i32* %7, align 4
  %64 = load i32, i32* %1, align 4
  %65 = xor i32 %64, -1
  store i32 %65, i32* %5, align 4
  %66 = load i32, i32* %5, align 4
  %67 = xor i32 %66, -1
  %68 = load i32, i32* %4, align 4
  %69 = sub nsw i32 %67, %68
  store i32 %69, i32* %8, align 4
  br label %40, !llvm.loop !6

70:                                               ; preds = %40
  %71 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %72 = load i32, i32* %5, align 4
  %73 = xor i32 %72, -1
  %74 = load i32, i32* %4, align 4
  %75 = or i32 %73, %74
  %76 = load i32, i32* %2, align 4
  %77 = add nsw i32 %75, %76
  store i32 %77, i32* %3, align 4
  %78 = load i32, i32* %2, align 4
  %79 = icmp slt i32 %78, 259
  br i1 %79, label %80, label %110

80:                                               ; preds = %70
  %81 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  %82 = load i32, i32* %3, align 4
  %83 = load i32, i32* %1, align 4
  %84 = and i32 %82, %83
  %85 = load i32, i32* %3, align 4
  %86 = srem i32 %84, %85
  %87 = load i32, i32* %2, align 4
  %88 = xor i32 %86, %87
  %89 = load i32, i32* %5, align 4
  %90 = sub nsw i32 %88, %89
  store i32 %90, i32* %1, align 4
  %91 = load i32, i32* %1, align 4
  %92 = xor i32 %91, -1
  %93 = load i32, i32* %3, align 4
  %94 = srem i32 %92, %93
  store i32 %94, i32* %9, align 4
  %95 = load i32, i32* %3, align 4
  %96 = load i32, i32* %4, align 4
  %97 = sdiv i32 %95, %96
  %98 = load i32, i32* %9, align 4
  %99 = and i32 %97, %98
  store i32 %99, i32* %10, align 4
  %100 = load i32, i32* %10, align 4
  %101 = xor i32 %100, -1
  %102 = load i32, i32* %5, align 4
  %103 = mul nsw i32 %101, %102
  %104 = load i32, i32* %2, align 4
  %105 = xor i32 %103, %104
  store i32 %105, i32* %2, align 4
  %106 = load i32, i32* %10, align 4
  %107 = xor i32 %106, -1
  %108 = load i32, i32* %3, align 4
  %109 = add nsw i32 %107, %108
  store i32 %109, i32* %11, align 4
  br label %135

110:                                              ; preds = %70
  %111 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %112 = load i32, i32* %2, align 4
  %113 = xor i32 %112, -1
  %114 = load i32, i32* %4, align 4
  %115 = xor i32 %113, %114
  %116 = load i32, i32* %5, align 4
  %117 = add nsw i32 %115, %116
  store i32 %117, i32* %3, align 4
  %118 = load i32, i32* %1, align 4
  %119 = load i32, i32* %5, align 4
  %120 = or i32 %118, %119
  %121 = load i32, i32* %4, align 4
  %122 = sub nsw i32 %120, %121
  store i32 %122, i32* %2, align 4
  %123 = load i32, i32* %4, align 4
  %124 = load i32, i32* %2, align 4
  %125 = mul nsw i32 %123, %124
  %126 = load i32, i32* %2, align 4
  %127 = xor i32 %125, %126
  store i32 %127, i32* %1, align 4
  %128 = load i32, i32* %5, align 4
  %129 = load i32, i32* %4, align 4
  %130 = and i32 %128, %129
  %131 = load i32, i32* %2, align 4
  %132 = sdiv i32 %130, %131
  store i32 %132, i32* %12, align 4
  %133 = load i32, i32* %1, align 4
  %134 = xor i32 %133, -1
  store i32 %134, i32* %13, align 4
  br label %135

135:                                              ; preds = %110, %80
  %136 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %137 = load i32, i32* %1, align 4
  %138 = load i32, i32* %5, align 4
  %139 = or i32 %137, %138
  %140 = load i32, i32* %4, align 4
  %141 = or i32 %139, %140
  store i32 %141, i32* %4, align 4
  %142 = load i32, i32* %1, align 4
  %143 = load i32, i32* %2, align 4
  %144 = mul nsw i32 %142, %143
  %145 = load i32, i32* %5, align 4
  %146 = mul nsw i32 %144, %145
  store i32 %146, i32* %4, align 4
  br label %147

147:                                              ; preds = %135, %0
  %148 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  br label %149

149:                                              ; preds = %180, %147
  %150 = load i32, i32* %4, align 4
  %151 = icmp ne i32 %150, 42
  br i1 %151, label %152, label %202

152:                                              ; preds = %149
  %153 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  br label %154

154:                                              ; preds = %158, %152
  %155 = load i32, i32* %3, align 4
  %156 = load i32, i32* %2, align 4
  %157 = icmp eq i32 %155, %156
  br i1 %157, label %158, label %180

158:                                              ; preds = %154
  %159 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %160 = load i32, i32* %5, align 4
  %161 = load i32, i32* %2, align 4
  %162 = sdiv i32 %160, %161
  %163 = load i32, i32* %1, align 4
  %164 = xor i32 %162, %163
  store i32 %164, i32* %4, align 4
  %165 = load i32, i32* %2, align 4
  %166 = xor i32 %165, -1
  %167 = load i32, i32* %5, align 4
  %168 = mul nsw i32 %166, %167
  %169 = load i32, i32* %3, align 4
  %170 = add nsw i32 %168, %169
  store i32 %170, i32* %14, align 4
  %171 = load i32, i32* %14, align 4
  %172 = load i32, i32* %14, align 4
  %173 = and i32 %171, %172
  %174 = load i32, i32* %4, align 4
  %175 = sub nsw i32 %173, %174
  store i32 %175, i32* %15, align 4
  %176 = load i32, i32* %3, align 4
  %177 = xor i32 %176, -1
  store i32 %177, i32* %16, align 4
  %178 = load i32, i32* %5, align 4
  %179 = xor i32 %178, -1
  store i32 %179, i32* %17, align 4
  br label %154, !llvm.loop !8

180:                                              ; preds = %154
  %181 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %182 = load i32, i32* %5, align 4
  %183 = xor i32 %182, -1
  %184 = load i32, i32* %1, align 4
  %185 = sub nsw i32 %183, %184
  store i32 %185, i32* %18, align 4
  %186 = load i32, i32* %1, align 4
  %187 = load i32, i32* %1, align 4
  %188 = sub nsw i32 %186, %187
  %189 = load i32, i32* %18, align 4
  %190 = or i32 %188, %189
  %191 = load i32, i32* %3, align 4
  %192 = srem i32 %190, %191
  store i32 %192, i32* %19, align 4
  %193 = load i32, i32* %2, align 4
  %194 = xor i32 %193, -1
  %195 = load i32, i32* %19, align 4
  %196 = sdiv i32 %194, %195
  store i32 %196, i32* %20, align 4
  %197 = load i32, i32* %3, align 4
  %198 = load i32, i32* %1, align 4
  %199 = add nsw i32 %197, %198
  %200 = load i32, i32* %5, align 4
  %201 = xor i32 %199, %200
  store i32 %201, i32* %5, align 4
  br label %149, !llvm.loop !9

202:                                              ; preds = %149
  %203 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %204 = load i32, i32* %1, align 4
  %205 = load i32, i32* %4, align 4
  %206 = sdiv i32 %204, %205
  %207 = load i32, i32* %4, align 4
  %208 = or i32 %206, %207
  %209 = load i32, i32* %3, align 4
  %210 = sdiv i32 %208, %209
  %211 = load i32, i32* %2, align 4
  %212 = sub nsw i32 %210, %211
  %213 = load i32, i32* %5, align 4
  %214 = sub nsw i32 %212, %213
  store i32 %214, i32* %21, align 4
  %215 = load i32, i32* %5, align 4
  %216 = load i32, i32* %21, align 4
  %217 = mul nsw i32 %215, %216
  %218 = load i32, i32* %21, align 4
  %219 = sub nsw i32 %217, %218
  store i32 %219, i32* %3, align 4
  %220 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12)
  %221 = load i32, i32* %4, align 4
  %222 = xor i32 %221, -1
  store i32 %222, i32* %22, align 4
  %223 = load i32, i32* %22, align 4
  ret i32 %223
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %3 = call i32 @func0()
  store i32 %3, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %4)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f_rand_0() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @rand() #3
  store i32 %2, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 noundef 0)
  %4 = load i32, i32* %1, align 4
  ret i32 %4
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f_rand_1() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @rand() #3
  store i32 %2, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i32 noundef 1)
  %4 = load i32, i32* %1, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f_rand_2() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @rand() #3
  store i32 %2, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i32 noundef 2)
  %4 = load i32, i32* %1, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f_rand_3() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @rand() #3
  store i32 %2, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i32 noundef 3)
  %4 = load i32, i32* %1, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f_rand_4() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @rand() #3
  store i32 %2, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i32 noundef 4)
  %4 = load i32, i32* %1, align 4
  ret i32 %4
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
