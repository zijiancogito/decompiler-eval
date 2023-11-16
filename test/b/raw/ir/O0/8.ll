; ModuleID = '../../../test/b/raw/src/8.c'
source_filename = "../../../test/b/raw/src/8.c"
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
  %26 = call i32 @f_rand_1()
  store i32 %26, i32* %1, align 4
  %27 = call i32 @f_rand_2()
  store i32 %27, i32* %2, align 4
  %28 = call i32 @f_rand_0()
  store i32 %28, i32* %3, align 4
  %29 = call i32 @f_rand_4()
  store i32 %29, i32* %4, align 4
  %30 = call i32 @f_rand_3()
  store i32 %30, i32* %5, align 4
  %31 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  br label %32

32:                                               ; preds = %163, %0
  %33 = load i32, i32* %5, align 4
  %34 = load i32, i32* %2, align 4
  %35 = icmp ne i32 %33, %34
  br i1 %35, label %36, label %171

36:                                               ; preds = %32
  %37 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  br label %38

38:                                               ; preds = %41, %36
  %39 = load i32, i32* %2, align 4
  %40 = icmp sge i32 %39, 595
  br i1 %40, label %41, label %75

41:                                               ; preds = %38
  %42 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %43 = load i32, i32* %5, align 4
  %44 = load i32, i32* %3, align 4
  %45 = mul nsw i32 %43, %44
  %46 = load i32, i32* %2, align 4
  %47 = srem i32 %45, %46
  %48 = load i32, i32* %5, align 4
  %49 = or i32 %47, %48
  store i32 %49, i32* %3, align 4
  %50 = load i32, i32* %3, align 4
  %51 = load i32, i32* %1, align 4
  %52 = sdiv i32 %50, %51
  %53 = load i32, i32* %3, align 4
  %54 = srem i32 %52, %53
  %55 = load i32, i32* %2, align 4
  %56 = and i32 %54, %55
  store i32 %56, i32* %1, align 4
  %57 = load i32, i32* %3, align 4
  %58 = load i32, i32* %1, align 4
  %59 = xor i32 %57, %58
  %60 = load i32, i32* %4, align 4
  %61 = xor i32 %59, %60
  store i32 %61, i32* %4, align 4
  %62 = load i32, i32* %5, align 4
  %63 = load i32, i32* %2, align 4
  %64 = and i32 %62, %63
  %65 = load i32, i32* %3, align 4
  %66 = or i32 %64, %65
  %67 = load i32, i32* %1, align 4
  %68 = sub nsw i32 %66, %67
  store i32 %68, i32* %6, align 4
  %69 = load i32, i32* %2, align 4
  %70 = xor i32 %69, -1
  %71 = load i32, i32* %1, align 4
  %72 = or i32 %70, %71
  %73 = load i32, i32* %1, align 4
  %74 = mul nsw i32 %72, %73
  store i32 %74, i32* %7, align 4
  br label %38, !llvm.loop !6

75:                                               ; preds = %38
  %76 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  br label %77

77:                                               ; preds = %80, %75
  %78 = load i32, i32* %2, align 4
  %79 = icmp sge i32 %78, 581
  br i1 %79, label %80, label %105

80:                                               ; preds = %77
  %81 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  %82 = load i32, i32* %3, align 4
  %83 = load i32, i32* %2, align 4
  %84 = and i32 %82, %83
  %85 = load i32, i32* %5, align 4
  %86 = srem i32 %84, %85
  store i32 %86, i32* %8, align 4
  %87 = load i32, i32* %4, align 4
  %88 = xor i32 %87, -1
  store i32 %88, i32* %9, align 4
  %89 = load i32, i32* %3, align 4
  %90 = xor i32 %89, -1
  %91 = load i32, i32* %3, align 4
  %92 = add nsw i32 %90, %91
  store i32 %92, i32* %4, align 4
  %93 = load i32, i32* %4, align 4
  %94 = load i32, i32* %5, align 4
  %95 = sub nsw i32 %93, %94
  %96 = load i32, i32* %2, align 4
  %97 = sdiv i32 %95, %96
  store i32 %97, i32* %3, align 4
  %98 = load i32, i32* %9, align 4
  %99 = load i32, i32* %4, align 4
  %100 = sub nsw i32 %98, %99
  %101 = load i32, i32* %8, align 4
  %102 = and i32 %100, %101
  %103 = load i32, i32* %5, align 4
  %104 = srem i32 %102, %103
  store i32 %104, i32* %1, align 4
  br label %77, !llvm.loop !8

105:                                              ; preds = %77
  %106 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %107 = load i32, i32* %4, align 4
  %108 = load i32, i32* %2, align 4
  %109 = and i32 %107, %108
  %110 = load i32, i32* %1, align 4
  %111 = and i32 %109, %110
  store i32 %111, i32* %10, align 4
  %112 = load i32, i32* %2, align 4
  %113 = load i32, i32* %5, align 4
  %114 = icmp ne i32 %112, %113
  br i1 %114, label %115, label %141

115:                                              ; preds = %105
  %116 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %117 = load i32, i32* %2, align 4
  %118 = load i32, i32* %3, align 4
  %119 = or i32 %117, %118
  %120 = load i32, i32* %5, align 4
  %121 = sub nsw i32 %119, %120
  store i32 %121, i32* %11, align 4
  %122 = load i32, i32* %1, align 4
  %123 = load i32, i32* %3, align 4
  %124 = sub nsw i32 %122, %123
  %125 = load i32, i32* %11, align 4
  %126 = srem i32 %124, %125
  store i32 %126, i32* %12, align 4
  %127 = load i32, i32* %2, align 4
  %128 = load i32, i32* %5, align 4
  %129 = sub nsw i32 %127, %128
  %130 = load i32, i32* %12, align 4
  %131 = or i32 %129, %130
  store i32 %131, i32* %10, align 4
  %132 = load i32, i32* %2, align 4
  %133 = load i32, i32* %3, align 4
  %134 = srem i32 %132, %133
  %135 = load i32, i32* %2, align 4
  %136 = and i32 %134, %135
  %137 = load i32, i32* %2, align 4
  %138 = sdiv i32 %136, %137
  store i32 %138, i32* %5, align 4
  %139 = load i32, i32* %1, align 4
  %140 = xor i32 %139, -1
  store i32 %140, i32* %5, align 4
  br label %163

141:                                              ; preds = %105
  %142 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  %143 = load i32, i32* %4, align 4
  %144 = load i32, i32* %10, align 4
  %145 = srem i32 %143, %144
  %146 = load i32, i32* %5, align 4
  %147 = add nsw i32 %145, %146
  store i32 %147, i32* %13, align 4
  %148 = load i32, i32* %3, align 4
  %149 = xor i32 %148, -1
  store i32 %149, i32* %13, align 4
  %150 = load i32, i32* %3, align 4
  %151 = xor i32 %150, -1
  %152 = load i32, i32* %5, align 4
  %153 = and i32 %151, %152
  store i32 %153, i32* %14, align 4
  %154 = load i32, i32* %14, align 4
  %155 = load i32, i32* %2, align 4
  %156 = add nsw i32 %154, %155
  %157 = load i32, i32* %10, align 4
  %158 = sdiv i32 %156, %157
  store i32 %158, i32* %13, align 4
  %159 = load i32, i32* %4, align 4
  %160 = xor i32 %159, -1
  %161 = load i32, i32* %13, align 4
  %162 = add nsw i32 %160, %161
  store i32 %162, i32* %15, align 4
  br label %163

163:                                              ; preds = %141, %115
  %164 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %165 = load i32, i32* %1, align 4
  %166 = xor i32 %165, -1
  %167 = load i32, i32* %10, align 4
  %168 = sdiv i32 %166, %167
  %169 = load i32, i32* %10, align 4
  %170 = mul nsw i32 %168, %169
  store i32 %170, i32* %16, align 4
  br label %32, !llvm.loop !9

171:                                              ; preds = %32
  %172 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %173 = load i32, i32* %3, align 4
  %174 = load i32, i32* %4, align 4
  %175 = icmp sgt i32 %173, %174
  br i1 %175, label %176, label %205

176:                                              ; preds = %171
  %177 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %178 = load i32, i32* %5, align 4
  %179 = load i32, i32* %5, align 4
  %180 = srem i32 %178, %179
  %181 = load i32, i32* %5, align 4
  %182 = add nsw i32 %180, %181
  store i32 %182, i32* %17, align 4
  %183 = load i32, i32* %17, align 4
  %184 = xor i32 %183, -1
  %185 = load i32, i32* %1, align 4
  %186 = sub nsw i32 %184, %185
  %187 = load i32, i32* %3, align 4
  %188 = add nsw i32 %186, %187
  store i32 %188, i32* %18, align 4
  %189 = load i32, i32* %5, align 4
  %190 = load i32, i32* %17, align 4
  %191 = and i32 %189, %190
  %192 = load i32, i32* %4, align 4
  %193 = sub nsw i32 %191, %192
  %194 = load i32, i32* %2, align 4
  %195 = mul nsw i32 %193, %194
  store i32 %195, i32* %1, align 4
  %196 = load i32, i32* %17, align 4
  %197 = load i32, i32* %4, align 4
  %198 = and i32 %196, %197
  %199 = load i32, i32* %5, align 4
  %200 = or i32 %198, %199
  store i32 %200, i32* %18, align 4
  %201 = load i32, i32* %17, align 4
  %202 = xor i32 %201, -1
  %203 = load i32, i32* %18, align 4
  %204 = add nsw i32 %202, %203
  store i32 %204, i32* %4, align 4
  br label %226

205:                                              ; preds = %171
  %206 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %207 = load i32, i32* %5, align 4
  %208 = xor i32 %207, -1
  store i32 %208, i32* %19, align 4
  %209 = load i32, i32* %4, align 4
  %210 = xor i32 %209, -1
  store i32 %210, i32* %20, align 4
  %211 = load i32, i32* %4, align 4
  %212 = load i32, i32* %5, align 4
  %213 = sub nsw i32 %211, %212
  %214 = load i32, i32* %3, align 4
  %215 = add nsw i32 %213, %214
  store i32 %215, i32* %21, align 4
  %216 = load i32, i32* %5, align 4
  %217 = load i32, i32* %2, align 4
  %218 = add nsw i32 %216, %217
  %219 = load i32, i32* %20, align 4
  %220 = add nsw i32 %218, %219
  store i32 %220, i32* %22, align 4
  %221 = load i32, i32* %5, align 4
  %222 = load i32, i32* %2, align 4
  %223 = mul nsw i32 %221, %222
  %224 = load i32, i32* %21, align 4
  %225 = xor i32 %223, %224
  store i32 %225, i32* %23, align 4
  br label %226

226:                                              ; preds = %205, %176
  %227 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12)
  %228 = load i32, i32* %2, align 4
  %229 = load i32, i32* %2, align 4
  %230 = add nsw i32 %228, %229
  %231 = load i32, i32* %5, align 4
  %232 = mul nsw i32 %230, %231
  store i32 %232, i32* %5, align 4
  %233 = load i32, i32* %2, align 4
  %234 = load i32, i32* %2, align 4
  %235 = add nsw i32 %233, %234
  %236 = load i32, i32* %4, align 4
  %237 = sub nsw i32 %235, %236
  store i32 %237, i32* %5, align 4
  %238 = load i32, i32* %5, align 4
  %239 = load i32, i32* %4, align 4
  %240 = srem i32 %238, %239
  %241 = load i32, i32* %5, align 4
  %242 = sdiv i32 %240, %241
  %243 = load i32, i32* %2, align 4
  %244 = add nsw i32 %242, %243
  %245 = load i32, i32* %4, align 4
  %246 = sub nsw i32 %244, %245
  store i32 %246, i32* %24, align 4
  %247 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 13)
  %248 = load i32, i32* %3, align 4
  %249 = load i32, i32* %5, align 4
  %250 = xor i32 %248, %249
  %251 = load i32, i32* %1, align 4
  %252 = or i32 %250, %251
  %253 = load i32, i32* %2, align 4
  %254 = add nsw i32 %252, %253
  %255 = load i32, i32* %2, align 4
  %256 = sub nsw i32 %254, %255
  store i32 %256, i32* %25, align 4
  %257 = load i32, i32* %25, align 4
  ret i32 %257
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
