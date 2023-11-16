; ModuleID = '../../../test/b/raw/src/4.c'
source_filename = "../../../test/b/raw/src/4.c"
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
  %22 = call i32 @f_rand_4()
  store i32 %22, i32* %1, align 4
  %23 = call i32 @f_rand_0()
  store i32 %23, i32* %2, align 4
  %24 = call i32 @f_rand_1()
  store i32 %24, i32* %3, align 4
  %25 = call i32 @f_rand_3()
  store i32 %25, i32* %4, align 4
  store i32 300, i32* %5, align 4
  store i32 562, i32* %6, align 4
  %26 = call i32 @f_rand_2()
  store i32 %26, i32* %7, align 4
  %27 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  br label %28

28:                                               ; preds = %100, %0
  %29 = load i32, i32* %2, align 4
  %30 = load i32, i32* %7, align 4
  %31 = icmp sle i32 %29, %30
  br i1 %31, label %32, label %114

32:                                               ; preds = %28
  %33 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  br label %34

34:                                               ; preds = %37, %32
  %35 = load i32, i32* %6, align 4
  %36 = icmp slt i32 %35, 33
  br i1 %36, label %37, label %56

37:                                               ; preds = %34
  %38 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %39 = load i32, i32* %3, align 4
  %40 = load i32, i32* %6, align 4
  %41 = sdiv i32 %39, %40
  %42 = load i32, i32* %5, align 4
  %43 = or i32 %41, %42
  store i32 %43, i32* %4, align 4
  %44 = load i32, i32* %4, align 4
  %45 = xor i32 %44, -1
  %46 = load i32, i32* %2, align 4
  %47 = sub nsw i32 %45, %46
  store i32 %47, i32* %6, align 4
  %48 = load i32, i32* %5, align 4
  %49 = xor i32 %48, -1
  %50 = load i32, i32* %7, align 4
  %51 = add nsw i32 %49, %50
  store i32 %51, i32* %8, align 4
  %52 = load i32, i32* %6, align 4
  %53 = xor i32 %52, -1
  store i32 %53, i32* %5, align 4
  %54 = load i32, i32* %4, align 4
  %55 = xor i32 %54, -1
  store i32 %55, i32* %9, align 4
  br label %34, !llvm.loop !6

56:                                               ; preds = %34
  %57 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %58 = load i32, i32* %2, align 4
  %59 = load i32, i32* %6, align 4
  %60 = sdiv i32 %58, %59
  %61 = load i32, i32* %4, align 4
  %62 = or i32 %60, %61
  %63 = load i32, i32* %2, align 4
  %64 = srem i32 %62, %63
  %65 = load i32, i32* %2, align 4
  %66 = sub nsw i32 %64, %65
  %67 = load i32, i32* %1, align 4
  %68 = and i32 %66, %67
  store i32 %68, i32* %1, align 4
  br label %69

69:                                               ; preds = %73, %56
  %70 = load i32, i32* %3, align 4
  %71 = load i32, i32* %6, align 4
  %72 = icmp slt i32 %70, %71
  br i1 %72, label %73, label %100

73:                                               ; preds = %69
  %74 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  %75 = load i32, i32* %7, align 4
  %76 = xor i32 %75, -1
  %77 = load i32, i32* %2, align 4
  %78 = add nsw i32 %76, %77
  store i32 %78, i32* %10, align 4
  %79 = load i32, i32* %3, align 4
  %80 = load i32, i32* %5, align 4
  %81 = add nsw i32 %79, %80
  %82 = load i32, i32* %3, align 4
  %83 = sub nsw i32 %81, %82
  store i32 %83, i32* %11, align 4
  %84 = load i32, i32* %6, align 4
  %85 = load i32, i32* %2, align 4
  %86 = add nsw i32 %84, %85
  %87 = load i32, i32* %1, align 4
  %88 = or i32 %86, %87
  %89 = load i32, i32* %2, align 4
  %90 = sub nsw i32 %88, %89
  store i32 %90, i32* %7, align 4
  %91 = load i32, i32* %2, align 4
  %92 = xor i32 %91, -1
  %93 = load i32, i32* %6, align 4
  %94 = add nsw i32 %92, %93
  store i32 %94, i32* %12, align 4
  %95 = load i32, i32* %10, align 4
  %96 = load i32, i32* %4, align 4
  %97 = mul nsw i32 %95, %96
  %98 = load i32, i32* %12, align 4
  %99 = add nsw i32 %97, %98
  store i32 %99, i32* %11, align 4
  br label %69, !llvm.loop !8

100:                                              ; preds = %69
  %101 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %102 = load i32, i32* %3, align 4
  %103 = load i32, i32* %2, align 4
  %104 = srem i32 %102, %103
  %105 = load i32, i32* %2, align 4
  %106 = add nsw i32 %104, %105
  %107 = load i32, i32* %5, align 4
  %108 = and i32 %106, %107
  store i32 %108, i32* %2, align 4
  %109 = load i32, i32* %7, align 4
  %110 = load i32, i32* %6, align 4
  %111 = xor i32 %109, %110
  %112 = load i32, i32* %3, align 4
  %113 = sdiv i32 %111, %112
  store i32 %113, i32* %13, align 4
  br label %28, !llvm.loop !9

114:                                              ; preds = %28
  %115 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %116 = load i32, i32* %4, align 4
  %117 = icmp sle i32 %116, 961
  br i1 %117, label %118, label %203

118:                                              ; preds = %114
  %119 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  br label %120

120:                                              ; preds = %123, %118
  %121 = load i32, i32* %4, align 4
  %122 = icmp sgt i32 %121, 544
  br i1 %122, label %123, label %154

123:                                              ; preds = %120
  %124 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %125 = load i32, i32* %4, align 4
  %126 = load i32, i32* %3, align 4
  %127 = xor i32 %125, %126
  %128 = load i32, i32* %1, align 4
  %129 = add nsw i32 %127, %128
  store i32 %129, i32* %7, align 4
  %130 = load i32, i32* %1, align 4
  %131 = load i32, i32* %7, align 4
  %132 = mul nsw i32 %130, %131
  %133 = load i32, i32* %2, align 4
  %134 = sdiv i32 %132, %133
  store i32 %134, i32* %1, align 4
  %135 = load i32, i32* %1, align 4
  %136 = xor i32 %135, -1
  %137 = load i32, i32* %2, align 4
  %138 = or i32 %136, %137
  store i32 %138, i32* %14, align 4
  %139 = load i32, i32* %2, align 4
  %140 = xor i32 %139, -1
  %141 = load i32, i32* %2, align 4
  %142 = and i32 %140, %141
  store i32 %142, i32* %15, align 4
  %143 = load i32, i32* %5, align 4
  %144 = load i32, i32* %6, align 4
  %145 = and i32 %143, %144
  %146 = load i32, i32* %3, align 4
  %147 = add nsw i32 %145, %146
  %148 = load i32, i32* %15, align 4
  %149 = or i32 %147, %148
  %150 = load i32, i32* %7, align 4
  %151 = and i32 %149, %150
  %152 = load i32, i32* %1, align 4
  %153 = and i32 %151, %152
  store i32 %153, i32* %16, align 4
  br label %120, !llvm.loop !10

154:                                              ; preds = %120
  %155 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  br label %156

156:                                              ; preds = %160, %154
  %157 = load i32, i32* %7, align 4
  %158 = load i32, i32* %3, align 4
  %159 = icmp sge i32 %157, %158
  br i1 %159, label %160, label %187

160:                                              ; preds = %156
  %161 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %162 = load i32, i32* %6, align 4
  %163 = xor i32 %162, -1
  %164 = load i32, i32* %6, align 4
  %165 = sdiv i32 %163, %164
  %166 = load i32, i32* %5, align 4
  %167 = add nsw i32 %165, %166
  store i32 %167, i32* %17, align 4
  %168 = load i32, i32* %7, align 4
  %169 = load i32, i32* %7, align 4
  %170 = and i32 %168, %169
  %171 = load i32, i32* %1, align 4
  %172 = mul nsw i32 %170, %171
  store i32 %172, i32* %2, align 4
  %173 = load i32, i32* %1, align 4
  %174 = load i32, i32* %3, align 4
  %175 = sub nsw i32 %173, %174
  %176 = load i32, i32* %6, align 4
  %177 = sdiv i32 %175, %176
  store i32 %177, i32* %18, align 4
  %178 = load i32, i32* %2, align 4
  %179 = load i32, i32* %4, align 4
  %180 = and i32 %178, %179
  %181 = load i32, i32* %1, align 4
  %182 = sub nsw i32 %180, %181
  store i32 %182, i32* %2, align 4
  %183 = load i32, i32* %3, align 4
  %184 = xor i32 %183, -1
  %185 = load i32, i32* %17, align 4
  %186 = xor i32 %184, %185
  store i32 %186, i32* %19, align 4
  br label %156, !llvm.loop !11

187:                                              ; preds = %156
  %188 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %189 = load i32, i32* %6, align 4
  %190 = xor i32 %189, -1
  %191 = load i32, i32* %6, align 4
  %192 = sdiv i32 %190, %191
  store i32 %192, i32* %5, align 4
  %193 = load i32, i32* %7, align 4
  %194 = load i32, i32* %3, align 4
  %195 = and i32 %193, %194
  %196 = load i32, i32* %4, align 4
  %197 = xor i32 %195, %196
  store i32 %197, i32* %2, align 4
  %198 = load i32, i32* %7, align 4
  %199 = load i32, i32* %5, align 4
  %200 = mul nsw i32 %198, %199
  %201 = load i32, i32* %4, align 4
  %202 = add nsw i32 %200, %201
  store i32 %202, i32* %4, align 4
  br label %241

203:                                              ; preds = %114
  %204 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12)
  %205 = load i32, i32* %7, align 4
  %206 = xor i32 %205, -1
  %207 = load i32, i32* %5, align 4
  %208 = sub nsw i32 %206, %207
  %209 = load i32, i32* %4, align 4
  %210 = sub nsw i32 %208, %209
  %211 = load i32, i32* %3, align 4
  %212 = sdiv i32 %210, %211
  store i32 %212, i32* %6, align 4
  %213 = load i32, i32* %5, align 4
  %214 = load i32, i32* %5, align 4
  %215 = xor i32 %213, %214
  %216 = load i32, i32* %2, align 4
  %217 = sub nsw i32 %215, %216
  store i32 %217, i32* %4, align 4
  %218 = load i32, i32* %1, align 4
  %219 = load i32, i32* %5, align 4
  %220 = add nsw i32 %218, %219
  %221 = load i32, i32* %7, align 4
  %222 = mul nsw i32 %220, %221
  %223 = load i32, i32* %5, align 4
  %224 = sdiv i32 %222, %223
  %225 = load i32, i32* %4, align 4
  %226 = mul nsw i32 %224, %225
  %227 = load i32, i32* %6, align 4
  %228 = xor i32 %226, %227
  store i32 %228, i32* %6, align 4
  %229 = load i32, i32* %5, align 4
  %230 = load i32, i32* %4, align 4
  %231 = sdiv i32 %229, %230
  %232 = load i32, i32* %4, align 4
  %233 = or i32 %231, %232
  %234 = load i32, i32* %3, align 4
  %235 = sdiv i32 %233, %234
  store i32 %235, i32* %5, align 4
  %236 = load i32, i32* %1, align 4
  %237 = load i32, i32* %1, align 4
  %238 = or i32 %236, %237
  %239 = load i32, i32* %2, align 4
  %240 = and i32 %238, %239
  store i32 %240, i32* %1, align 4
  br label %241

241:                                              ; preds = %203, %187
  %242 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 13)
  %243 = load i32, i32* %6, align 4
  %244 = load i32, i32* %1, align 4
  %245 = srem i32 %243, %244
  %246 = load i32, i32* %7, align 4
  %247 = srem i32 %245, %246
  store i32 %247, i32* %20, align 4
  %248 = load i32, i32* %20, align 4
  %249 = load i32, i32* %20, align 4
  %250 = or i32 %248, %249
  %251 = load i32, i32* %4, align 4
  %252 = add nsw i32 %250, %251
  store i32 %252, i32* %1, align 4
  %253 = load i32, i32* %1, align 4
  %254 = load i32, i32* %5, align 4
  %255 = or i32 %253, %254
  %256 = load i32, i32* %7, align 4
  %257 = add nsw i32 %255, %256
  store i32 %257, i32* %5, align 4
  %258 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 14)
  %259 = load i32, i32* %4, align 4
  %260 = xor i32 %259, -1
  store i32 %260, i32* %21, align 4
  %261 = load i32, i32* %21, align 4
  ret i32 %261
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
