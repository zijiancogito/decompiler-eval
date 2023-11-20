source_filename = "../../../test/b/raw/src/9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"BB: %d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"f_rand_0: %d\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"f_rand_1: %d\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"f_rand_2: %d\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"f_rand_3: %d\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"f_rand_4: %d\00", align 1

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
  store i32 78, i32* %1, align 4
  %23 = call i32 @f_rand_0()
  store i32 %23, i32* %2, align 4
  %24 = call i32 @f_rand_1()
  store i32 %24, i32* %3, align 4
  %25 = call i32 @f_rand_2()
  store i32 %25, i32* %4, align 4
  %26 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %27 = load i32, i32* %1, align 4
  %28 = load i32, i32* %4, align 4
  %29 = sub nsw i32 %27, %28
  %30 = load i32, i32* %4, align 4
  %31 = add nsw i32 %29, %30
  store i32 %31, i32* %5, align 4
  br label %32

32:                                               ; preds = %106, %0
  %33 = load i32, i32* %4, align 4
  %34 = icmp eq i32 %33, 547
  br i1 %34, label %35, label %107

35:                                               ; preds = %32
  %36 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  br label %37

37:                                               ; preds = %41, %35
  %38 = load i32, i32* %5, align 4
  %39 = load i32, i32* %3, align 4
  %40 = icmp sge i32 %38, %39
  br i1 %40, label %41, label %66

41:                                               ; preds = %37
  %42 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %43 = load i32, i32* %2, align 4
  %44 = load i32, i32* %1, align 4
  %45 = and i32 %43, %44
  %46 = load i32, i32* %1, align 4
  %47 = or i32 %45, %46
  store i32 %47, i32* %4, align 4
  %48 = load i32, i32* %1, align 4
  %49 = load i32, i32* %5, align 4
  %50 = xor i32 %48, %49
  %51 = load i32, i32* %5, align 4
  %52 = add nsw i32 %50, %51
  %53 = load i32, i32* %5, align 4
  %54 = sdiv i32 %52, %53
  store i32 %54, i32* %2, align 4
  %55 = load i32, i32* %3, align 4
  %56 = xor i32 %55, -1
  store i32 %56, i32* %5, align 4
  %57 = load i32, i32* %1, align 4
  %58 = xor i32 %57, -1
  store i32 %58, i32* %4, align 4
  %59 = load i32, i32* %3, align 4
  %60 = load i32, i32* %2, align 4
  %61 = or i32 %59, %60
  %62 = load i32, i32* %1, align 4
  %63 = and i32 %61, %62
  %64 = load i32, i32* %5, align 4
  %65 = xor i32 %63, %64
  store i32 %65, i32* %2, align 4
  br label %37, !llvm.loop !6

66:                                               ; preds = %37
  %67 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %68 = load i32, i32* %3, align 4
  %69 = load i32, i32* %5, align 4
  %70 = sdiv i32 %68, %69
  %71 = load i32, i32* %4, align 4
  %72 = sdiv i32 %70, %71
  store i32 %72, i32* %5, align 4
  %73 = load i32, i32* %4, align 4
  %74 = xor i32 %73, -1
  store i32 %74, i32* %6, align 4
  %75 = load i32, i32* %2, align 4
  %76 = xor i32 %75, -1
  %77 = load i32, i32* %2, align 4
  %78 = or i32 %76, %77
  %79 = load i32, i32* %3, align 4
  %80 = or i32 %78, %79
  store i32 %80, i32* %7, align 4
  %81 = load i32, i32* %3, align 4
  %82 = icmp sge i32 %81, 287
  br i1 %82, label %83, label %106

83:                                               ; preds = %66
  %84 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  %85 = load i32, i32* %2, align 4
  %86 = load i32, i32* %2, align 4
  %87 = xor i32 %85, %86
  %88 = load i32, i32* %3, align 4
  %89 = sub nsw i32 %87, %88
  store i32 %89, i32* %8, align 4
  %90 = load i32, i32* %8, align 4
  %91 = xor i32 %90, -1
  store i32 %91, i32* %6, align 4
  %92 = load i32, i32* %4, align 4
  %93 = load i32, i32* %3, align 4
  %94 = xor i32 %92, %93
  %95 = load i32, i32* %6, align 4
  %96 = sdiv i32 %94, %95
  store i32 %96, i32* %1, align 4
  %97 = load i32, i32* %6, align 4
  %98 = xor i32 %97, -1
  store i32 %98, i32* %2, align 4
  %99 = load i32, i32* %4, align 4
  %100 = load i32, i32* %4, align 4
  %101 = and i32 %99, %100
  %102 = load i32, i32* %2, align 4
  %103 = mul nsw i32 %101, %102
  %104 = load i32, i32* %3, align 4
  %105 = srem i32 %103, %104
  store i32 %105, i32* %5, align 4
  br label %106

106:                                              ; preds = %83, %66
  br label %32, !llvm.loop !8

107:                                              ; preds = %32
  %108 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %109 = load i32, i32* %2, align 4
  %110 = xor i32 %109, -1
  store i32 %110, i32* %9, align 4
  %111 = load i32, i32* %5, align 4
  %112 = load i32, i32* %1, align 4
  %113 = sub nsw i32 %111, %112
  %114 = load i32, i32* %5, align 4
  %115 = sub nsw i32 %113, %114
  store i32 %115, i32* %10, align 4
  %116 = load i32, i32* %4, align 4
  %117 = load i32, i32* %9, align 4
  %118 = icmp ne i32 %116, %117
  br i1 %118, label %119, label %260

119:                                              ; preds = %107
  %120 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %121 = load i32, i32* %3, align 4
  %122 = load i32, i32* %1, align 4
  %123 = xor i32 %121, %122
  %124 = load i32, i32* %2, align 4
  %125 = srem i32 %123, %124
  %126 = load i32, i32* %10, align 4
  %127 = mul nsw i32 %125, %126
  %128 = load i32, i32* %9, align 4
  %129 = or i32 %127, %128
  %130 = load i32, i32* %2, align 4
  %131 = srem i32 %129, %130
  store i32 %131, i32* %5, align 4
  %132 = load i32, i32* %3, align 4
  %133 = xor i32 %132, -1
  store i32 %133, i32* %10, align 4
  %134 = load i32, i32* %9, align 4
  %135 = load i32, i32* %10, align 4
  %136 = icmp sle i32 %134, %135
  br i1 %136, label %137, label %171

137:                                              ; preds = %119
  %138 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  %139 = load i32, i32* %4, align 4
  %140 = load i32, i32* %4, align 4
  %141 = srem i32 %139, %140
  %142 = load i32, i32* %1, align 4
  %143 = sdiv i32 %141, %142
  store i32 %143, i32* %10, align 4
  %144 = load i32, i32* %4, align 4
  %145 = load i32, i32* %1, align 4
  %146 = add nsw i32 %144, %145
  %147 = load i32, i32* %9, align 4
  %148 = sub nsw i32 %146, %147
  store i32 %148, i32* %2, align 4
  %149 = load i32, i32* %2, align 4
  %150 = load i32, i32* %5, align 4
  %151 = and i32 %149, %150
  %152 = load i32, i32* %1, align 4
  %153 = mul nsw i32 %151, %152
  %154 = load i32, i32* %2, align 4
  %155 = and i32 %153, %154
  %156 = load i32, i32* %2, align 4
  %157 = sdiv i32 %155, %156
  %158 = load i32, i32* %3, align 4
  %159 = and i32 %157, %158
  store i32 %159, i32* %11, align 4
  %160 = load i32, i32* %10, align 4
  %161 = load i32, i32* %10, align 4
  %162 = srem i32 %160, %161
  %163 = load i32, i32* %3, align 4
  %164 = sub nsw i32 %162, %163
  store i32 %164, i32* %9, align 4
  %165 = load i32, i32* %2, align 4
  %166 = xor i32 %165, -1
  %167 = load i32, i32* %11, align 4
  %168 = sub nsw i32 %166, %167
  %169 = load i32, i32* %10, align 4
  %170 = or i32 %168, %169
  store i32 %170, i32* %12, align 4
  br label %171

171:                                              ; preds = %137, %119
  %172 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %173 = load i32, i32* %5, align 4
  %174 = load i32, i32* %4, align 4
  %175 = icmp sgt i32 %173, %174
  br i1 %175, label %176, label %208

176:                                              ; preds = %171
  %177 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %178 = load i32, i32* %4, align 4
  %179 = load i32, i32* %9, align 4
  %180 = srem i32 %178, %179
  %181 = load i32, i32* %4, align 4
  %182 = and i32 %180, %181
  store i32 %182, i32* %13, align 4
  %183 = load i32, i32* %9, align 4
  %184 = load i32, i32* %5, align 4
  %185 = mul nsw i32 %183, %184
  %186 = load i32, i32* %3, align 4
  %187 = xor i32 %185, %186
  %188 = load i32, i32* %9, align 4
  %189 = srem i32 %187, %188
  %190 = load i32, i32* %3, align 4
  %191 = xor i32 %189, %190
  store i32 %191, i32* %14, align 4
  %192 = load i32, i32* %1, align 4
  %193 = xor i32 %192, -1
  %194 = load i32, i32* %9, align 4
  %195 = add nsw i32 %193, %194
  store i32 %195, i32* %15, align 4
  %196 = load i32, i32* %5, align 4
  %197 = load i32, i32* %9, align 4
  %198 = mul nsw i32 %196, %197
  %199 = load i32, i32* %9, align 4
  %200 = sub nsw i32 %198, %199
  %201 = load i32, i32* %14, align 4
  %202 = add nsw i32 %200, %201
  store i32 %202, i32* %4, align 4
  %203 = load i32, i32* %10, align 4
  %204 = load i32, i32* %13, align 4
  %205 = add nsw i32 %203, %204
  %206 = load i32, i32* %4, align 4
  %207 = sub nsw i32 %205, %206
  store i32 %207, i32* %16, align 4
  br label %249

208:                                              ; preds = %171
  %209 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %210 = load i32, i32* %1, align 4
  %211 = load i32, i32* %9, align 4
  %212 = sdiv i32 %210, %211
  %213 = load i32, i32* %10, align 4
  %214 = mul nsw i32 %212, %213
  %215 = load i32, i32* %9, align 4
  %216 = sdiv i32 %214, %215
  %217 = load i32, i32* %4, align 4
  %218 = add nsw i32 %216, %217
  %219 = load i32, i32* %2, align 4
  %220 = srem i32 %218, %219
  store i32 %220, i32* %17, align 4
  %221 = load i32, i32* %17, align 4
  %222 = load i32, i32* %3, align 4
  %223 = or i32 %221, %222
  %224 = load i32, i32* %1, align 4
  %225 = srem i32 %223, %224
  %226 = load i32, i32* %4, align 4
  %227 = xor i32 %225, %226
  %228 = load i32, i32* %4, align 4
  %229 = xor i32 %227, %228
  %230 = load i32, i32* %4, align 4
  %231 = and i32 %229, %230
  store i32 %231, i32* %18, align 4
  %232 = load i32, i32* %17, align 4
  %233 = load i32, i32* %17, align 4
  %234 = srem i32 %232, %233
  %235 = load i32, i32* %1, align 4
  %236 = sdiv i32 %234, %235
  store i32 %236, i32* %19, align 4
  %237 = load i32, i32* %4, align 4
  %238 = load i32, i32* %10, align 4
  %239 = srem i32 %237, %238
  %240 = load i32, i32* %9, align 4
  %241 = and i32 %239, %240
  store i32 %241, i32* %10, align 4
  %242 = load i32, i32* %18, align 4
  %243 = load i32, i32* %4, align 4
  %244 = and i32 %242, %243
  %245 = load i32, i32* %9, align 4
  %246 = add nsw i32 %244, %245
  %247 = load i32, i32* %2, align 4
  %248 = sdiv i32 %246, %247
  store i32 %248, i32* %20, align 4
  br label %249

249:                                              ; preds = %208, %176
  %250 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %251 = load i32, i32* %10, align 4
  %252 = load i32, i32* %5, align 4
  %253 = add nsw i32 %251, %252
  %254 = load i32, i32* %5, align 4
  %255 = sdiv i32 %253, %254
  %256 = load i32, i32* %5, align 4
  %257 = sub nsw i32 %255, %256
  %258 = load i32, i32* %3, align 4
  %259 = srem i32 %257, %258
  store i32 %259, i32* %21, align 4
  br label %260

260:                                              ; preds = %249, %107
  %261 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12)
  %262 = load i32, i32* %2, align 4
  %263 = load i32, i32* %1, align 4
  %264 = sdiv i32 %262, %263
  store i32 %264, i32* %22, align 4
  %265 = load i32, i32* %22, align 4
  ret i32 %265
}

declare i32 @printf(i8* noundef, ...) #1

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

define dso_local i32 @f_rand_0() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @rand() #3
  store i32 %2, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 noundef 0)
  %4 = load i32, i32* %1, align 4
  ret i32 %4
}

declare i32 @rand() #2

define dso_local i32 @f_rand_1() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @rand() #3
  store i32 %2, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i32 noundef 1)
  %4 = load i32, i32* %1, align 4
  ret i32 %4
}

define dso_local i32 @f_rand_2() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @rand() #3
  store i32 %2, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i32 noundef 2)
  %4 = load i32, i32* %1, align 4
  ret i32 %4
}

define dso_local i32 @f_rand_3() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @rand() #3
  store i32 %2, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i32 noundef 3)
  %4 = load i32, i32* %1, align 4
  ret i32 %4
}

define dso_local i32 @f_rand_4() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @rand() #3
  store i32 %2, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i32 noundef 4)
  %4 = load i32, i32* %1, align 4
  ret i32 %4
}


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
