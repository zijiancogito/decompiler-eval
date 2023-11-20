source_filename = "../../../test/b/raw/src/1.c"
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
  %23 = call i32 @f_rand_2()
  store i32 %23, i32* %1, align 4
  %24 = call i32 @f_rand_1()
  store i32 %24, i32* %2, align 4
  store i32 219, i32* %3, align 4
  store i32 895, i32* %4, align 4
  %25 = call i32 @f_rand_0()
  store i32 %25, i32* %5, align 4
  %26 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %27 = load i32, i32* %3, align 4
  %28 = load i32, i32* %4, align 4
  %29 = and i32 %27, %28
  %30 = load i32, i32* %5, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, i32* %3, align 4
  %33 = srem i32 %31, %32
  store i32 %33, i32* %3, align 4
  %34 = load i32, i32* %4, align 4
  %35 = load i32, i32* %5, align 4
  %36 = add nsw i32 %34, %35
  %37 = load i32, i32* %5, align 4
  %38 = mul nsw i32 %36, %37
  store i32 %38, i32* %4, align 4
  %39 = load i32, i32* %3, align 4
  %40 = load i32, i32* %1, align 4
  %41 = icmp eq i32 %39, %40
  br i1 %41, label %42, label %111

42:                                               ; preds = %0
  %43 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %44 = load i32, i32* %5, align 4
  %45 = load i32, i32* %4, align 4
  %46 = mul nsw i32 %44, %45
  %47 = load i32, i32* %1, align 4
  %48 = sub nsw i32 %46, %47
  %49 = load i32, i32* %1, align 4
  %50 = mul nsw i32 %48, %49
  store i32 %50, i32* %5, align 4
  %51 = load i32, i32* %2, align 4
  %52 = load i32, i32* %5, align 4
  %53 = and i32 %51, %52
  %54 = load i32, i32* %4, align 4
  %55 = xor i32 %53, %54
  %56 = load i32, i32* %4, align 4
  %57 = and i32 %55, %56
  %58 = load i32, i32* %2, align 4
  %59 = and i32 %57, %58
  store i32 %59, i32* %6, align 4
  %60 = load i32, i32* %4, align 4
  %61 = load i32, i32* %1, align 4
  %62 = mul nsw i32 %60, %61
  %63 = load i32, i32* %6, align 4
  %64 = add nsw i32 %62, %63
  %65 = load i32, i32* %5, align 4
  %66 = mul nsw i32 %64, %65
  %67 = load i32, i32* %6, align 4
  %68 = and i32 %66, %67
  store i32 %68, i32* %7, align 4
  %69 = load i32, i32* %4, align 4
  %70 = load i32, i32* %3, align 4
  %71 = and i32 %69, %70
  %72 = load i32, i32* %5, align 4
  %73 = sdiv i32 %71, %72
  store i32 %73, i32* %8, align 4
  br label %74

74:                                               ; preds = %77, %42
  %75 = load i32, i32* %1, align 4
  %76 = icmp sge i32 %75, 734
  br i1 %76, label %77, label %110

77:                                               ; preds = %74
  %78 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %79 = load i32, i32* %3, align 4
  %80 = xor i32 %79, -1
  %81 = load i32, i32* %3, align 4
  %82 = srem i32 %80, %81
  %83 = load i32, i32* %7, align 4
  %84 = sdiv i32 %82, %83
  %85 = load i32, i32* %5, align 4
  %86 = add nsw i32 %84, %85
  store i32 %86, i32* %6, align 4
  %87 = load i32, i32* %5, align 4
  %88 = xor i32 %87, -1
  store i32 %88, i32* %8, align 4
  %89 = load i32, i32* %4, align 4
  %90 = load i32, i32* %1, align 4
  %91 = add nsw i32 %89, %90
  %92 = load i32, i32* %6, align 4
  %93 = srem i32 %91, %92
  store i32 %93, i32* %7, align 4
  %94 = load i32, i32* %4, align 4
  %95 = load i32, i32* %4, align 4
  %96 = sub nsw i32 %94, %95
  %97 = load i32, i32* %3, align 4
  %98 = or i32 %96, %97
  store i32 %98, i32* %9, align 4
  %99 = load i32, i32* %8, align 4
  %100 = load i32, i32* %3, align 4
  %101 = mul nsw i32 %99, %100
  %102 = load i32, i32* %2, align 4
  %103 = or i32 %101, %102
  %104 = load i32, i32* %9, align 4
  %105 = mul nsw i32 %103, %104
  %106 = load i32, i32* %7, align 4
  %107 = add nsw i32 %105, %106
  %108 = load i32, i32* %3, align 4
  %109 = sub nsw i32 %107, %108
  store i32 %109, i32* %10, align 4
  br label %74, !llvm.loop !6

110:                                              ; preds = %74
  br label %256

111:                                              ; preds = %0
  %112 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %113 = load i32, i32* %2, align 4
  %114 = load i32, i32* %1, align 4
  %115 = srem i32 %113, %114
  %116 = load i32, i32* %5, align 4
  %117 = xor i32 %115, %116
  %118 = load i32, i32* %5, align 4
  %119 = sub nsw i32 %117, %118
  store i32 %119, i32* %3, align 4
  br label %120

120:                                              ; preds = %123, %111
  %121 = load i32, i32* %1, align 4
  %122 = icmp sge i32 %121, 556
  br i1 %122, label %123, label %156

123:                                              ; preds = %120
  %124 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  %125 = load i32, i32* %2, align 4
  %126 = load i32, i32* %3, align 4
  %127 = or i32 %125, %126
  %128 = load i32, i32* %2, align 4
  %129 = srem i32 %127, %128
  %130 = load i32, i32* %2, align 4
  %131 = xor i32 %129, %130
  %132 = load i32, i32* %1, align 4
  %133 = add nsw i32 %131, %132
  store i32 %133, i32* %4, align 4
  %134 = load i32, i32* %5, align 4
  %135 = load i32, i32* %4, align 4
  %136 = sub nsw i32 %134, %135
  %137 = load i32, i32* %3, align 4
  %138 = xor i32 %136, %137
  %139 = load i32, i32* %2, align 4
  %140 = sub nsw i32 %138, %139
  store i32 %140, i32* %4, align 4
  %141 = load i32, i32* %1, align 4
  %142 = xor i32 %141, -1
  store i32 %142, i32* %11, align 4
  %143 = load i32, i32* %2, align 4
  %144 = load i32, i32* %2, align 4
  %145 = sdiv i32 %143, %144
  %146 = load i32, i32* %5, align 4
  %147 = xor i32 %145, %146
  %148 = load i32, i32* %2, align 4
  %149 = add nsw i32 %147, %148
  store i32 %149, i32* %3, align 4
  %150 = load i32, i32* %4, align 4
  %151 = xor i32 %150, -1
  %152 = load i32, i32* %3, align 4
  %153 = srem i32 %151, %152
  %154 = load i32, i32* %2, align 4
  %155 = mul nsw i32 %153, %154
  store i32 %155, i32* %12, align 4
  br label %120, !llvm.loop !8

156:                                              ; preds = %120
  %157 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  br label %158

158:                                              ; preds = %162, %156
  %159 = load i32, i32* %2, align 4
  %160 = load i32, i32* %5, align 4
  %161 = icmp slt i32 %159, %160
  br i1 %161, label %162, label %193

162:                                              ; preds = %158
  %163 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %164 = load i32, i32* %5, align 4
  %165 = load i32, i32* %1, align 4
  %166 = add nsw i32 %164, %165
  %167 = load i32, i32* %2, align 4
  %168 = and i32 %166, %167
  %169 = load i32, i32* %1, align 4
  %170 = xor i32 %168, %169
  store i32 %170, i32* %13, align 4
  %171 = load i32, i32* %13, align 4
  %172 = load i32, i32* %13, align 4
  %173 = sub nsw i32 %171, %172
  %174 = load i32, i32* %3, align 4
  %175 = srem i32 %173, %174
  %176 = load i32, i32* %2, align 4
  %177 = sdiv i32 %175, %176
  store i32 %177, i32* %5, align 4
  %178 = load i32, i32* %1, align 4
  %179 = load i32, i32* %1, align 4
  %180 = xor i32 %178, %179
  %181 = load i32, i32* %1, align 4
  %182 = sdiv i32 %180, %181
  store i32 %182, i32* %4, align 4
  %183 = load i32, i32* %4, align 4
  %184 = load i32, i32* %13, align 4
  %185 = and i32 %183, %184
  %186 = load i32, i32* %4, align 4
  %187 = sdiv i32 %185, %186
  store i32 %187, i32* %14, align 4
  %188 = load i32, i32* %5, align 4
  %189 = load i32, i32* %1, align 4
  %190 = or i32 %188, %189
  %191 = load i32, i32* %5, align 4
  %192 = and i32 %190, %191
  store i32 %192, i32* %14, align 4
  br label %158, !llvm.loop !9

193:                                              ; preds = %158
  %194 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  %195 = load i32, i32* %5, align 4
  %196 = icmp sgt i32 %195, 853
  br i1 %196, label %197, label %220

197:                                              ; preds = %193
  %198 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %199 = load i32, i32* %4, align 4
  %200 = load i32, i32* %5, align 4
  %201 = or i32 %199, %200
  %202 = load i32, i32* %3, align 4
  %203 = or i32 %201, %202
  store i32 %203, i32* %3, align 4
  %204 = load i32, i32* %3, align 4
  %205 = xor i32 %204, -1
  store i32 %205, i32* %15, align 4
  %206 = load i32, i32* %15, align 4
  %207 = load i32, i32* %3, align 4
  %208 = add nsw i32 %206, %207
  %209 = load i32, i32* %1, align 4
  %210 = sub nsw i32 %208, %209
  store i32 %210, i32* %3, align 4
  %211 = load i32, i32* %4, align 4
  %212 = load i32, i32* %15, align 4
  %213 = sub nsw i32 %211, %212
  %214 = load i32, i32* %5, align 4
  %215 = add nsw i32 %213, %214
  store i32 %215, i32* %2, align 4
  %216 = load i32, i32* %15, align 4
  %217 = xor i32 %216, -1
  %218 = load i32, i32* %4, align 4
  %219 = and i32 %217, %218
  store i32 %219, i32* %16, align 4
  br label %247

220:                                              ; preds = %193
  %221 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %222 = load i32, i32* %1, align 4
  %223 = load i32, i32* %5, align 4
  %224 = mul nsw i32 %222, %223
  %225 = load i32, i32* %4, align 4
  %226 = mul nsw i32 %224, %225
  store i32 %226, i32* %17, align 4
  %227 = load i32, i32* %1, align 4
  %228 = load i32, i32* %5, align 4
  %229 = srem i32 %227, %228
  %230 = load i32, i32* %1, align 4
  %231 = add nsw i32 %229, %230
  store i32 %231, i32* %18, align 4
  %232 = load i32, i32* %1, align 4
  %233 = load i32, i32* %18, align 4
  %234 = or i32 %232, %233
  %235 = load i32, i32* %2, align 4
  %236 = sub nsw i32 %234, %235
  store i32 %236, i32* %19, align 4
  %237 = load i32, i32* %19, align 4
  %238 = load i32, i32* %2, align 4
  %239 = sdiv i32 %237, %238
  %240 = load i32, i32* %2, align 4
  %241 = sub nsw i32 %239, %240
  store i32 %241, i32* %17, align 4
  %242 = load i32, i32* %2, align 4
  %243 = load i32, i32* %17, align 4
  %244 = sub nsw i32 %242, %243
  %245 = load i32, i32* %17, align 4
  %246 = sdiv i32 %244, %245
  store i32 %246, i32* %18, align 4
  br label %247

247:                                              ; preds = %220, %197
  %248 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %249 = load i32, i32* %2, align 4
  %250 = load i32, i32* %5, align 4
  %251 = xor i32 %249, %250
  %252 = load i32, i32* %4, align 4
  %253 = mul nsw i32 %251, %252
  %254 = load i32, i32* %3, align 4
  %255 = sdiv i32 %253, %254
  store i32 %255, i32* %20, align 4
  br label %256

256:                                              ; preds = %247, %110
  %257 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %258 = load i32, i32* %5, align 4
  %259 = load i32, i32* %2, align 4
  %260 = xor i32 %258, %259
  %261 = load i32, i32* %5, align 4
  %262 = xor i32 %260, %261
  store i32 %262, i32* %2, align 4
  %263 = load i32, i32* %3, align 4
  %264 = xor i32 %263, -1
  store i32 %264, i32* %21, align 4
  %265 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12)
  %266 = load i32, i32* %5, align 4
  %267 = load i32, i32* %1, align 4
  %268 = or i32 %266, %267
  store i32 %268, i32* %22, align 4
  %269 = load i32, i32* %22, align 4
  ret i32 %269
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
!9 = distinct !{!9, !7}
