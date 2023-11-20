source_filename = "../../../test/b/raw/src/5.c"
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
  %22 = call i32 @f_rand_3()
  store i32 %22, i32* %1, align 4
  %23 = call i32 @f_rand_0()
  store i32 %23, i32* %2, align 4
  %24 = call i32 @f_rand_2()
  store i32 %24, i32* %3, align 4
  %25 = call i32 @f_rand_4()
  store i32 %25, i32* %4, align 4
  %26 = call i32 @f_rand_1()
  store i32 %26, i32* %5, align 4
  %27 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %28 = load i32, i32* %4, align 4
  %29 = xor i32 %28, -1
  %30 = load i32, i32* %1, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, i32* %1, align 4
  %33 = xor i32 %31, %32
  store i32 %33, i32* %3, align 4
  %34 = load i32, i32* %1, align 4
  %35 = load i32, i32* %3, align 4
  %36 = icmp ne i32 %34, %35
  br i1 %36, label %37, label %212

37:                                               ; preds = %0
  %38 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %39 = load i32, i32* %4, align 4
  %40 = xor i32 %39, -1
  store i32 %40, i32* %6, align 4
  %41 = load i32, i32* %2, align 4
  %42 = load i32, i32* %6, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %78

44:                                               ; preds = %37
  %45 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %46 = load i32, i32* %5, align 4
  %47 = load i32, i32* %4, align 4
  %48 = xor i32 %46, %47
  %49 = load i32, i32* %1, align 4
  %50 = sub nsw i32 %48, %49
  %51 = load i32, i32* %3, align 4
  %52 = mul nsw i32 %50, %51
  %53 = load i32, i32* %6, align 4
  %54 = xor i32 %52, %53
  %55 = load i32, i32* %5, align 4
  %56 = or i32 %54, %55
  store i32 %56, i32* %1, align 4
  %57 = load i32, i32* %6, align 4
  %58 = xor i32 %57, -1
  %59 = load i32, i32* %5, align 4
  %60 = or i32 %58, %59
  store i32 %60, i32* %4, align 4
  %61 = load i32, i32* %4, align 4
  %62 = load i32, i32* %2, align 4
  %63 = or i32 %61, %62
  %64 = load i32, i32* %3, align 4
  %65 = add nsw i32 %63, %64
  %66 = load i32, i32* %2, align 4
  %67 = mul nsw i32 %65, %66
  store i32 %67, i32* %6, align 4
  %68 = load i32, i32* %3, align 4
  %69 = load i32, i32* %1, align 4
  %70 = or i32 %68, %69
  %71 = load i32, i32* %3, align 4
  %72 = and i32 %70, %71
  store i32 %72, i32* %3, align 4
  %73 = load i32, i32* %5, align 4
  %74 = load i32, i32* %3, align 4
  %75 = and i32 %73, %74
  %76 = load i32, i32* %1, align 4
  %77 = add nsw i32 %75, %76
  store i32 %77, i32* %1, align 4
  br label %113

78:                                               ; preds = %37
  %79 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %80 = load i32, i32* %3, align 4
  %81 = load i32, i32* %1, align 4
  %82 = mul nsw i32 %80, %81
  %83 = load i32, i32* %4, align 4
  %84 = or i32 %82, %83
  %85 = load i32, i32* %4, align 4
  %86 = sub nsw i32 %84, %85
  %87 = load i32, i32* %3, align 4
  %88 = srem i32 %86, %87
  store i32 %88, i32* %1, align 4
  %89 = load i32, i32* %2, align 4
  %90 = load i32, i32* %5, align 4
  %91 = mul nsw i32 %89, %90
  %92 = load i32, i32* %6, align 4
  %93 = add nsw i32 %91, %92
  store i32 %93, i32* %6, align 4
  %94 = load i32, i32* %2, align 4
  %95 = load i32, i32* %1, align 4
  %96 = sdiv i32 %94, %95
  %97 = load i32, i32* %1, align 4
  %98 = srem i32 %96, %97
  %99 = load i32, i32* %1, align 4
  %100 = xor i32 %98, %99
  store i32 %100, i32* %2, align 4
  %101 = load i32, i32* %2, align 4
  %102 = load i32, i32* %1, align 4
  %103 = add nsw i32 %101, %102
  %104 = load i32, i32* %2, align 4
  %105 = srem i32 %103, %104
  %106 = load i32, i32* %4, align 4
  %107 = sdiv i32 %105, %106
  store i32 %107, i32* %7, align 4
  %108 = load i32, i32* %1, align 4
  %109 = load i32, i32* %6, align 4
  %110 = or i32 %108, %109
  %111 = load i32, i32* %4, align 4
  %112 = xor i32 %110, %111
  store i32 %112, i32* %2, align 4
  br label %113

113:                                              ; preds = %78, %44
  %114 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  br label %115

115:                                              ; preds = %118, %113
  %116 = load i32, i32* %1, align 4
  %117 = icmp sge i32 %116, 350
  br i1 %117, label %118, label %158

118:                                              ; preds = %115
  %119 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %120 = load i32, i32* %6, align 4
  %121 = load i32, i32* %6, align 4
  %122 = or i32 %120, %121
  %123 = load i32, i32* %3, align 4
  %124 = sdiv i32 %122, %123
  %125 = load i32, i32* %2, align 4
  %126 = xor i32 %124, %125
  store i32 %126, i32* %6, align 4
  %127 = load i32, i32* %2, align 4
  %128 = load i32, i32* %3, align 4
  %129 = xor i32 %127, %128
  %130 = load i32, i32* %3, align 4
  %131 = and i32 %129, %130
  %132 = load i32, i32* %6, align 4
  %133 = or i32 %131, %132
  %134 = load i32, i32* %5, align 4
  %135 = xor i32 %133, %134
  store i32 %135, i32* %8, align 4
  %136 = load i32, i32* %8, align 4
  %137 = load i32, i32* %4, align 4
  %138 = xor i32 %136, %137
  %139 = load i32, i32* %3, align 4
  %140 = srem i32 %138, %139
  %141 = load i32, i32* %1, align 4
  %142 = mul nsw i32 %140, %141
  store i32 %142, i32* %1, align 4
  %143 = load i32, i32* %4, align 4
  %144 = load i32, i32* %6, align 4
  %145 = or i32 %143, %144
  %146 = load i32, i32* %4, align 4
  %147 = and i32 %145, %146
  store i32 %147, i32* %9, align 4
  %148 = load i32, i32* %8, align 4
  %149 = xor i32 %148, -1
  %150 = load i32, i32* %9, align 4
  %151 = sub nsw i32 %149, %150
  %152 = load i32, i32* %4, align 4
  %153 = srem i32 %151, %152
  %154 = load i32, i32* %9, align 4
  %155 = mul nsw i32 %153, %154
  %156 = load i32, i32* %9, align 4
  %157 = xor i32 %155, %156
  store i32 %157, i32* %1, align 4
  br label %115, !llvm.loop !6

158:                                              ; preds = %115
  %159 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %160 = load i32, i32* %2, align 4
  %161 = xor i32 %160, -1
  %162 = load i32, i32* %5, align 4
  %163 = mul nsw i32 %161, %162
  %164 = load i32, i32* %1, align 4
  %165 = sub nsw i32 %163, %164
  %166 = load i32, i32* %4, align 4
  %167 = sdiv i32 %165, %166
  %168 = load i32, i32* %3, align 4
  %169 = add nsw i32 %167, %168
  store i32 %169, i32* %10, align 4
  br label %170

170:                                              ; preds = %173, %158
  %171 = load i32, i32* %6, align 4
  %172 = icmp sge i32 %171, 753
  br i1 %172, label %173, label %211

173:                                              ; preds = %170
  %174 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  %175 = load i32, i32* %6, align 4
  %176 = xor i32 %175, -1
  %177 = load i32, i32* %1, align 4
  %178 = and i32 %176, %177
  store i32 %178, i32* %11, align 4
  %179 = load i32, i32* %2, align 4
  %180 = xor i32 %179, -1
  %181 = load i32, i32* %10, align 4
  %182 = xor i32 %180, %181
  %183 = load i32, i32* %4, align 4
  %184 = sdiv i32 %182, %183
  store i32 %184, i32* %10, align 4
  %185 = load i32, i32* %11, align 4
  %186 = load i32, i32* %5, align 4
  %187 = or i32 %185, %186
  %188 = load i32, i32* %11, align 4
  %189 = or i32 %187, %188
  %190 = load i32, i32* %3, align 4
  %191 = or i32 %189, %190
  %192 = load i32, i32* %1, align 4
  %193 = srem i32 %191, %192
  store i32 %193, i32* %11, align 4
  %194 = load i32, i32* %6, align 4
  %195 = load i32, i32* %6, align 4
  %196 = xor i32 %194, %195
  %197 = load i32, i32* %11, align 4
  %198 = mul nsw i32 %196, %197
  %199 = load i32, i32* %5, align 4
  %200 = mul nsw i32 %198, %199
  %201 = load i32, i32* %4, align 4
  %202 = add nsw i32 %200, %201
  %203 = load i32, i32* %1, align 4
  %204 = add nsw i32 %202, %203
  store i32 %204, i32* %5, align 4
  %205 = load i32, i32* %11, align 4
  %206 = xor i32 %205, -1
  %207 = load i32, i32* %11, align 4
  %208 = mul nsw i32 %206, %207
  %209 = load i32, i32* %2, align 4
  %210 = and i32 %208, %209
  store i32 %210, i32* %10, align 4
  br label %170, !llvm.loop !8

211:                                              ; preds = %170
  br label %298

212:                                              ; preds = %0
  %213 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %214 = load i32, i32* %1, align 4
  %215 = load i32, i32* %2, align 4
  %216 = icmp sle i32 %214, %215
  br i1 %216, label %217, label %248

217:                                              ; preds = %212
  %218 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %219 = load i32, i32* %3, align 4
  %220 = xor i32 %219, -1
  store i32 %220, i32* %3, align 4
  %221 = load i32, i32* %2, align 4
  %222 = load i32, i32* %3, align 4
  %223 = sub nsw i32 %221, %222
  %224 = load i32, i32* %1, align 4
  %225 = and i32 %223, %224
  store i32 %225, i32* %2, align 4
  %226 = load i32, i32* %2, align 4
  %227 = xor i32 %226, -1
  %228 = load i32, i32* %3, align 4
  %229 = add nsw i32 %227, %228
  %230 = load i32, i32* %5, align 4
  %231 = mul nsw i32 %229, %230
  store i32 %231, i32* %4, align 4
  %232 = load i32, i32* %3, align 4
  %233 = load i32, i32* %4, align 4
  %234 = xor i32 %232, %233
  %235 = load i32, i32* %1, align 4
  %236 = mul nsw i32 %234, %235
  %237 = load i32, i32* %1, align 4
  %238 = sub nsw i32 %236, %237
  store i32 %238, i32* %12, align 4
  %239 = load i32, i32* %12, align 4
  %240 = load i32, i32* %5, align 4
  %241 = srem i32 %239, %240
  %242 = load i32, i32* %2, align 4
  %243 = add nsw i32 %241, %242
  %244 = load i32, i32* %4, align 4
  %245 = srem i32 %243, %244
  %246 = load i32, i32* %4, align 4
  %247 = sub nsw i32 %245, %246
  store i32 %247, i32* %13, align 4
  br label %277

248:                                              ; preds = %212
  %249 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %250 = load i32, i32* %1, align 4
  %251 = xor i32 %250, -1
  store i32 %251, i32* %14, align 4
  %252 = load i32, i32* %5, align 4
  %253 = xor i32 %252, -1
  %254 = load i32, i32* %14, align 4
  %255 = xor i32 %253, %254
  %256 = load i32, i32* %14, align 4
  %257 = srem i32 %255, %256
  store i32 %257, i32* %2, align 4
  %258 = load i32, i32* %3, align 4
  %259 = load i32, i32* %5, align 4
  %260 = add nsw i32 %258, %259
  %261 = load i32, i32* %14, align 4
  %262 = srem i32 %260, %261
  %263 = load i32, i32* %2, align 4
  %264 = xor i32 %262, %263
  store i32 %264, i32* %15, align 4
  %265 = load i32, i32* %15, align 4
  %266 = load i32, i32* %3, align 4
  %267 = sdiv i32 %265, %266
  %268 = load i32, i32* %14, align 4
  %269 = srem i32 %267, %268
  store i32 %269, i32* %16, align 4
  %270 = load i32, i32* %2, align 4
  %271 = load i32, i32* %14, align 4
  %272 = sdiv i32 %270, %271
  %273 = load i32, i32* %1, align 4
  %274 = sdiv i32 %272, %273
  %275 = load i32, i32* %2, align 4
  %276 = mul nsw i32 %274, %275
  store i32 %276, i32* %17, align 4
  br label %277

277:                                              ; preds = %248, %217
  %278 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %279 = load i32, i32* %3, align 4
  %280 = load i32, i32* %3, align 4
  %281 = sub nsw i32 %279, %280
  %282 = load i32, i32* %4, align 4
  %283 = mul nsw i32 %281, %282
  store i32 %283, i32* %18, align 4
  %284 = load i32, i32* %5, align 4
  %285 = xor i32 %284, -1
  store i32 %285, i32* %1, align 4
  %286 = load i32, i32* %4, align 4
  %287 = load i32, i32* %2, align 4
  %288 = add nsw i32 %286, %287
  %289 = load i32, i32* %2, align 4
  %290 = xor i32 %288, %289
  store i32 %290, i32* %1, align 4
  %291 = load i32, i32* %5, align 4
  %292 = load i32, i32* %3, align 4
  %293 = sub nsw i32 %291, %292
  %294 = load i32, i32* %2, align 4
  %295 = xor i32 %293, %294
  %296 = load i32, i32* %5, align 4
  %297 = xor i32 %295, %296
  store i32 %297, i32* %19, align 4
  br label %298

298:                                              ; preds = %277, %211
  %299 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12)
  %300 = load i32, i32* %3, align 4
  %301 = xor i32 %300, -1
  %302 = load i32, i32* %3, align 4
  %303 = add nsw i32 %301, %302
  %304 = load i32, i32* %1, align 4
  %305 = mul nsw i32 %303, %304
  store i32 %305, i32* %20, align 4
  %306 = load i32, i32* %1, align 4
  %307 = xor i32 %306, -1
  %308 = load i32, i32* %20, align 4
  %309 = or i32 %307, %308
  %310 = load i32, i32* %4, align 4
  %311 = srem i32 %309, %310
  %312 = load i32, i32* %20, align 4
  %313 = sub nsw i32 %311, %312
  store i32 %313, i32* %5, align 4
  %314 = load i32, i32* %1, align 4
  %315 = load i32, i32* %1, align 4
  %316 = sdiv i32 %314, %315
  %317 = load i32, i32* %20, align 4
  %318 = or i32 %316, %317
  %319 = load i32, i32* %3, align 4
  %320 = sub nsw i32 %318, %319
  %321 = load i32, i32* %3, align 4
  %322 = srem i32 %320, %321
  store i32 %322, i32* %2, align 4
  %323 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 13)
  %324 = load i32, i32* %4, align 4
  %325 = load i32, i32* %2, align 4
  %326 = add nsw i32 %324, %325
  %327 = load i32, i32* %4, align 4
  %328 = or i32 %326, %327
  store i32 %328, i32* %21, align 4
  %329 = load i32, i32* %21, align 4
  ret i32 %329
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
