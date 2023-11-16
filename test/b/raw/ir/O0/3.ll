; ModuleID = '../../../test/b/raw/src/3.c'
source_filename = "../../../test/b/raw/src/3.c"
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
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = call i32 @f_rand_4()
  store i32 %28, i32* %1, align 4
  store i32 493, i32* %2, align 4
  %29 = call i32 @f_rand_0()
  store i32 %29, i32* %3, align 4
  store i32 256, i32* %4, align 4
  %30 = call i32 @f_rand_2()
  store i32 %30, i32* %5, align 4
  %31 = call i32 @f_rand_1()
  store i32 %31, i32* %6, align 4
  %32 = call i32 @f_rand_3()
  store i32 %32, i32* %7, align 4
  store i32 866, i32* %8, align 4
  %33 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %34 = load i32, i32* %4, align 4
  %35 = xor i32 %34, -1
  %36 = load i32, i32* %8, align 4
  %37 = mul nsw i32 %35, %36
  %38 = load i32, i32* %6, align 4
  %39 = srem i32 %37, %38
  store i32 %39, i32* %9, align 4
  br label %40

40:                                               ; preds = %140, %0
  %41 = load i32, i32* %2, align 4
  %42 = load i32, i32* %9, align 4
  %43 = icmp sge i32 %41, %42
  br i1 %43, label %44, label %147

44:                                               ; preds = %40
  %45 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  br label %46

46:                                               ; preds = %50, %44
  %47 = load i32, i32* %4, align 4
  %48 = load i32, i32* %1, align 4
  %49 = icmp slt i32 %47, %48
  br i1 %49, label %50, label %87

50:                                               ; preds = %46
  %51 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %52 = load i32, i32* %7, align 4
  %53 = load i32, i32* %9, align 4
  %54 = sdiv i32 %52, %53
  %55 = load i32, i32* %9, align 4
  %56 = sub nsw i32 %54, %55
  %57 = load i32, i32* %7, align 4
  %58 = srem i32 %56, %57
  store i32 %58, i32* %3, align 4
  %59 = load i32, i32* %2, align 4
  %60 = load i32, i32* %5, align 4
  %61 = mul nsw i32 %59, %60
  %62 = load i32, i32* %7, align 4
  %63 = and i32 %61, %62
  store i32 %63, i32* %9, align 4
  %64 = load i32, i32* %7, align 4
  %65 = load i32, i32* %5, align 4
  %66 = sub nsw i32 %64, %65
  %67 = load i32, i32* %4, align 4
  %68 = mul nsw i32 %66, %67
  %69 = load i32, i32* %3, align 4
  %70 = add nsw i32 %68, %69
  store i32 %70, i32* %10, align 4
  %71 = load i32, i32* %6, align 4
  %72 = load i32, i32* %4, align 4
  %73 = sub nsw i32 %71, %72
  %74 = load i32, i32* %3, align 4
  %75 = and i32 %73, %74
  %76 = load i32, i32* %6, align 4
  %77 = sub nsw i32 %75, %76
  store i32 %77, i32* %9, align 4
  %78 = load i32, i32* %2, align 4
  %79 = load i32, i32* %7, align 4
  %80 = add nsw i32 %78, %79
  %81 = load i32, i32* %9, align 4
  %82 = add nsw i32 %80, %81
  %83 = load i32, i32* %10, align 4
  %84 = and i32 %82, %83
  %85 = load i32, i32* %8, align 4
  %86 = or i32 %84, %85
  store i32 %86, i32* %11, align 4
  br label %46, !llvm.loop !6

87:                                               ; preds = %46
  %88 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %89 = load i32, i32* %3, align 4
  %90 = load i32, i32* %8, align 4
  %91 = sdiv i32 %89, %90
  %92 = load i32, i32* %9, align 4
  %93 = sdiv i32 %91, %92
  %94 = load i32, i32* %9, align 4
  %95 = or i32 %93, %94
  %96 = load i32, i32* %3, align 4
  %97 = sdiv i32 %95, %96
  store i32 %97, i32* %12, align 4
  %98 = load i32, i32* %4, align 4
  %99 = load i32, i32* %1, align 4
  %100 = sdiv i32 %98, %99
  %101 = load i32, i32* %8, align 4
  %102 = add nsw i32 %100, %101
  store i32 %102, i32* %13, align 4
  br label %103

103:                                              ; preds = %106, %87
  %104 = load i32, i32* %2, align 4
  %105 = icmp ne i32 %104, 451
  br i1 %105, label %106, label %140

106:                                              ; preds = %103
  %107 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  %108 = load i32, i32* %7, align 4
  %109 = load i32, i32* %13, align 4
  %110 = srem i32 %108, %109
  %111 = load i32, i32* %5, align 4
  %112 = sdiv i32 %110, %111
  store i32 %112, i32* %9, align 4
  %113 = load i32, i32* %3, align 4
  %114 = xor i32 %113, -1
  store i32 %114, i32* %2, align 4
  %115 = load i32, i32* %2, align 4
  %116 = load i32, i32* %3, align 4
  %117 = mul nsw i32 %115, %116
  %118 = load i32, i32* %8, align 4
  %119 = srem i32 %117, %118
  %120 = load i32, i32* %1, align 4
  %121 = srem i32 %119, %120
  %122 = load i32, i32* %6, align 4
  %123 = sub nsw i32 %121, %122
  store i32 %123, i32* %14, align 4
  %124 = load i32, i32* %3, align 4
  %125 = load i32, i32* %2, align 4
  %126 = sdiv i32 %124, %125
  %127 = load i32, i32* %2, align 4
  %128 = sdiv i32 %126, %127
  %129 = load i32, i32* %5, align 4
  %130 = sdiv i32 %128, %129
  %131 = load i32, i32* %4, align 4
  %132 = mul nsw i32 %130, %131
  %133 = load i32, i32* %13, align 4
  %134 = mul nsw i32 %132, %133
  store i32 %134, i32* %15, align 4
  %135 = load i32, i32* %4, align 4
  %136 = load i32, i32* %12, align 4
  %137 = and i32 %135, %136
  %138 = load i32, i32* %6, align 4
  %139 = and i32 %137, %138
  store i32 %139, i32* %16, align 4
  br label %103, !llvm.loop !8

140:                                              ; preds = %103
  %141 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %142 = load i32, i32* %3, align 4
  %143 = load i32, i32* %2, align 4
  %144 = srem i32 %142, %143
  %145 = load i32, i32* %4, align 4
  %146 = add nsw i32 %144, %145
  store i32 %146, i32* %3, align 4
  br label %40, !llvm.loop !9

147:                                              ; preds = %40
  %148 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %149 = load i32, i32* %1, align 4
  %150 = icmp sle i32 %149, 648
  br i1 %150, label %151, label %242

151:                                              ; preds = %147
  %152 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  %153 = load i32, i32* %8, align 4
  %154 = load i32, i32* %4, align 4
  %155 = sdiv i32 %153, %154
  %156 = load i32, i32* %7, align 4
  %157 = mul nsw i32 %155, %156
  %158 = load i32, i32* %2, align 4
  %159 = sdiv i32 %157, %158
  store i32 %159, i32* %7, align 4
  br label %160

160:                                              ; preds = %163, %151
  %161 = load i32, i32* %2, align 4
  %162 = icmp sle i32 %161, 657
  br i1 %162, label %163, label %189

163:                                              ; preds = %160
  %164 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %165 = load i32, i32* %5, align 4
  %166 = load i32, i32* %8, align 4
  %167 = or i32 %165, %166
  %168 = load i32, i32* %9, align 4
  %169 = sdiv i32 %167, %168
  store i32 %169, i32* %17, align 4
  %170 = load i32, i32* %3, align 4
  %171 = load i32, i32* %4, align 4
  %172 = or i32 %170, %171
  %173 = load i32, i32* %8, align 4
  %174 = xor i32 %172, %173
  store i32 %174, i32* %17, align 4
  %175 = load i32, i32* %4, align 4
  %176 = xor i32 %175, -1
  %177 = load i32, i32* %3, align 4
  %178 = sdiv i32 %176, %177
  store i32 %178, i32* %17, align 4
  %179 = load i32, i32* %7, align 4
  %180 = load i32, i32* %17, align 4
  %181 = mul nsw i32 %179, %180
  %182 = load i32, i32* %5, align 4
  %183 = and i32 %181, %182
  store i32 %183, i32* %18, align 4
  %184 = load i32, i32* %9, align 4
  %185 = load i32, i32* %3, align 4
  %186 = and i32 %184, %185
  %187 = load i32, i32* %7, align 4
  %188 = sub nsw i32 %186, %187
  store i32 %188, i32* %9, align 4
  br label %160, !llvm.loop !10

189:                                              ; preds = %160
  %190 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  br label %191

191:                                              ; preds = %195, %189
  %192 = load i32, i32* %4, align 4
  %193 = load i32, i32* %1, align 4
  %194 = icmp sge i32 %192, %193
  br i1 %194, label %195, label %228

195:                                              ; preds = %191
  %196 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %197 = load i32, i32* %2, align 4
  %198 = load i32, i32* %3, align 4
  %199 = sdiv i32 %197, %198
  %200 = load i32, i32* %7, align 4
  %201 = xor i32 %199, %200
  store i32 %201, i32* %19, align 4
  %202 = load i32, i32* %4, align 4
  %203 = load i32, i32* %2, align 4
  %204 = mul nsw i32 %202, %203
  %205 = load i32, i32* %19, align 4
  %206 = xor i32 %204, %205
  %207 = load i32, i32* %4, align 4
  %208 = add nsw i32 %206, %207
  store i32 %208, i32* %20, align 4
  %209 = load i32, i32* %7, align 4
  %210 = load i32, i32* %8, align 4
  %211 = and i32 %209, %210
  %212 = load i32, i32* %6, align 4
  %213 = or i32 %211, %212
  store i32 %213, i32* %1, align 4
  %214 = load i32, i32* %3, align 4
  %215 = load i32, i32* %19, align 4
  %216 = sub nsw i32 %214, %215
  %217 = load i32, i32* %6, align 4
  %218 = and i32 %216, %217
  store i32 %218, i32* %21, align 4
  %219 = load i32, i32* %5, align 4
  %220 = load i32, i32* %20, align 4
  %221 = or i32 %219, %220
  %222 = load i32, i32* %6, align 4
  %223 = xor i32 %221, %222
  %224 = load i32, i32* %20, align 4
  %225 = sdiv i32 %223, %224
  %226 = load i32, i32* %19, align 4
  %227 = xor i32 %225, %226
  store i32 %227, i32* %22, align 4
  br label %191, !llvm.loop !11

228:                                              ; preds = %191
  %229 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %230 = load i32, i32* %9, align 4
  %231 = load i32, i32* %6, align 4
  %232 = sub nsw i32 %230, %231
  %233 = load i32, i32* %7, align 4
  %234 = sdiv i32 %232, %233
  %235 = load i32, i32* %3, align 4
  %236 = and i32 %234, %235
  store i32 %236, i32* %23, align 4
  %237 = load i32, i32* %5, align 4
  %238 = load i32, i32* %23, align 4
  %239 = sub nsw i32 %237, %238
  %240 = load i32, i32* %1, align 4
  %241 = xor i32 %239, %240
  store i32 %241, i32* %24, align 4
  br label %242

242:                                              ; preds = %228, %147
  %243 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12)
  %244 = load i32, i32* %1, align 4
  %245 = load i32, i32* %2, align 4
  %246 = xor i32 %244, %245
  %247 = load i32, i32* %4, align 4
  %248 = add nsw i32 %246, %247
  store i32 %248, i32* %25, align 4
  %249 = load i32, i32* %2, align 4
  %250 = load i32, i32* %2, align 4
  %251 = sub nsw i32 %249, %250
  %252 = load i32, i32* %7, align 4
  %253 = and i32 %251, %252
  store i32 %253, i32* %26, align 4
  %254 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 13)
  %255 = load i32, i32* %5, align 4
  %256 = load i32, i32* %4, align 4
  %257 = xor i32 %255, %256
  store i32 %257, i32* %27, align 4
  %258 = load i32, i32* %27, align 4
  ret i32 %258
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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
