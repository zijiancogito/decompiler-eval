source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@crc32_context = internal global i32 -1, align 4
@crc32_tab = internal global [256 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [15 x i8] c"checksum = %X\0A\00", align 1

define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  call void @platform_main_begin()
  call void @crc32_gentab()
  %3 = call signext i16 @func_1()
  %4 = load i32, i32* @crc32_context, align 4
  %5 = zext i32 %4 to i64
  %6 = xor i64 %5, 4294967295
  %7 = trunc i64 %6 to i32
  %8 = load i32, i32* %2, align 4
  call void @platform_main_end(i32 noundef %7, i32 noundef %8)
  ret i32 0
}

define internal void @platform_main_begin() #0 {
  ret void
}

define internal void @crc32_gentab() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 -306674912, i32* %2, align 4
  store i32 0, i32* %3, align 4
  br label %5

5:                                                ; preds = %33, %0
  %6 = load i32, i32* %3, align 4
  %7 = icmp slt i32 %6, 256
  br i1 %7, label %8, label %36

8:                                                ; preds = %5
  %9 = load i32, i32* %3, align 4
  store i32 %9, i32* %1, align 4
  store i32 8, i32* %4, align 4
  br label %10

10:                                               ; preds = %25, %8
  %11 = load i32, i32* %4, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %28

13:                                               ; preds = %10
  %14 = load i32, i32* %1, align 4
  %15 = and i32 %14, 1
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %21

17:                                               ; preds = %13
  %18 = load i32, i32* %1, align 4
  %19 = lshr i32 %18, 1
  %20 = xor i32 %19, -306674912
  store i32 %20, i32* %1, align 4
  br label %24

21:                                               ; preds = %13
  %22 = load i32, i32* %1, align 4
  %23 = lshr i32 %22, 1
  store i32 %23, i32* %1, align 4
  br label %24

24:                                               ; preds = %21, %17
  br label %25

25:                                               ; preds = %24
  %26 = load i32, i32* %4, align 4
  %27 = add nsw i32 %26, -1
  store i32 %27, i32* %4, align 4
  br label %10, !llvm.loop !6

28:                                               ; preds = %10
  %29 = load i32, i32* %1, align 4
  %30 = load i32, i32* %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [256 x i32], [256 x i32]* @crc32_tab, i64 0, i64 %31
  store i32 %29, i32* %32, align 4
  br label %33

33:                                               ; preds = %28
  %34 = load i32, i32* %3, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %3, align 4
  br label %5, !llvm.loop !8

36:                                               ; preds = %5
  ret void
}

define internal signext i16 @func_1() #0 {
  %1 = alloca i16, align 2
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i16, align 2
  %18 = alloca float, align 4
  %19 = alloca i16, align 2
  %20 = alloca i16, align 2
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca float, align 4
  %25 = alloca i32, align 4
  %26 = alloca float, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca float, align 4
  %32 = alloca i32, align 4
  %33 = alloca float, align 4
  %34 = alloca i16, align 2
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i16, align 2
  %38 = alloca i32, align 4
  %39 = alloca i16, align 2
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i16, align 2
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i16, align 2
  %48 = alloca float, align 4
  %49 = alloca i16, align 2
  %50 = alloca i32, align 4
  %51 = alloca i32, align 4
  %52 = alloca float, align 4
  %53 = alloca i32, align 4
  %54 = alloca i32, align 4
  %55 = alloca i32, align 4
  %56 = alloca i16, align 2
  %57 = alloca i32, align 4
  %58 = alloca i32, align 4
  %59 = alloca float, align 4
  %60 = alloca i32, align 4
  %61 = alloca i32, align 4
  %62 = alloca i32, align 4
  %63 = alloca i32, align 4
  store float 9.687500e-01, float* %2, align 4
  store i32 1, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store float -5.937500e-01, float* %5, align 4
  store i32 300894646, i32* %6, align 4
  store i32 -4, i32* %7, align 4
  store i16 -6486, i16* %8, align 2
  store i32 4, i32* %9, align 4
  store i32 -609754433, i32* %10, align 4
  store i32 1, i32* %11, align 4
  store i32 -1200491615, i32* %12, align 4
  store i32 -3058063, i32* %13, align 4
  %64 = load i32, i32* %3, align 4
  %65 = sub i32 -1390377283, %64
  %66 = icmp eq i32 %65, 1345409890
  %67 = zext i1 %66 to i32
  %68 = shl i32 %67, 26
  %69 = or i32 %68, 4
  store i32 %69, i32* %3, align 4
  %70 = load i32, i32* %4, align 4
  %71 = trunc i32 %70 to i16
  %72 = call i32 @func_4(i32 noundef %69, i16 noundef signext %71)
  store i32 %72, i32* %4, align 4
  %73 = load i32, i32* %6, align 4
  %74 = sub nsw i32 %72, %73
  %75 = icmp ule i32 %74, -1113098745
  br i1 %75, label %76, label %722

76:                                               ; preds = %0
  store i32 1, i32* %14, align 4
  store i32 -766089974, i32* %15, align 4
  store i32 1, i32* %16, align 4
  store i16 4, i16* %17, align 2
  store float -3.812500e+00, float* %18, align 4
  store i16 19416, i16* %19, align 2
  store i16 4, i16* %20, align 2
  %77 = load i32, i32* %14, align 4
  store i32 %77, i32* %15, align 4
  %78 = urem i32 %77, 1
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %505

80:                                               ; preds = %76
  store i32 -340866511, i32* %21, align 4
  store i32 7, i32* %22, align 4
  store i32 -1169870541, i32* %23, align 4
  store float 0x3D5F91D9C0000000, float* %24, align 4
  store i32 -1675992355, i32* %25, align 4
  br label %81

81:                                               ; preds = %396, %80
  store i32 22, i32* %4, align 4
  br label %82

82:                                               ; preds = %92, %81
  %83 = load i32, i32* %4, align 4
  %84 = icmp sgt i32 %83, 27
  br i1 %84, label %85, label %95

85:                                               ; preds = %82
  store float 4.375000e-01, float* %26, align 4
  store i32 1731739968, i32* %27, align 4
  %86 = load i32, i32* %21, align 4
  %87 = shl i32 %86, 0
  store i32 %87, i32* %27, align 4
  store i32 %87, i32* %15, align 4
  %88 = load i32, i32* %4, align 4
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %90, label %91

90:                                               ; preds = %85
  br label %95

91:                                               ; preds = %85
  br label %92

92:                                               ; preds = %91
  %93 = load i32, i32* %4, align 4
  %94 = add nsw i32 %93, 2
  store i32 %94, i32* %4, align 4
  br label %82, !llvm.loop !9

95:                                               ; preds = %90, %82
  %96 = load i32, i32* %4, align 4
  %97 = trunc i32 %96 to i16
  %98 = sext i16 %97 to i32
  %99 = load i32, i32* %3, align 4
  %100 = trunc i32 %99 to i16
  %101 = sext i16 %100 to i32
  %102 = sub nsw i32 %98, %101
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %245

104:                                              ; preds = %95
  store i32 -42750036, i32* %28, align 4
  store i32 540967881, i32* %29, align 4
  store i32 5, i32* %30, align 4
  %105 = load i32, i32* %21, align 4
  store i32 %105, i32* %15, align 4
  store i32 60157, i32* %7, align 4
  %106 = load i32, i32* %28, align 4
  %107 = trunc i32 %106 to i16
  %108 = zext i16 %107 to i32
  %109 = load i32, i32* %14, align 4
  %110 = trunc i32 %109 to i16
  %111 = zext i16 %110 to i32
  %112 = shl i32 %108, %111
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %114, label %164

114:                                              ; preds = %104
  store float -3.237500e+01, float* %31, align 4
  store i32 1876364955, i32* %32, align 4
  %115 = load i32, i32* %21, align 4
  %116 = srem i32 0, %115
  store i32 %116, i32* %22, align 4
  store i32 0, i32* %21, align 4
  br label %117

117:                                              ; preds = %160, %114
  %118 = load i32, i32* %21, align 4
  %119 = icmp ule i32 %118, 14
  br i1 %119, label %120, label %163

120:                                              ; preds = %117
  store float 7.250000e+00, float* %33, align 4
  store i16 31140, i16* %34, align 2
  %121 = load i16, i16* %8, align 2
  %122 = sext i16 %121 to i32
  store i32 %122, i32* %22, align 4
  %123 = load i16, i16* %8, align 2
  %124 = sext i16 %123 to i32
  store i32 %124, i32* %4, align 4
  store i16 2, i16* %34, align 2
  %125 = load i32, i32* %28, align 4
  %126 = trunc i32 %125 to i16
  %127 = zext i16 %126 to i32
  %128 = load i32, i32* %21, align 4
  %129 = trunc i32 %128 to i16
  %130 = zext i16 %129 to i32
  %131 = mul nsw i32 %127, %130
  %132 = trunc i32 %131 to i16
  %133 = sext i16 %132 to i32
  %134 = load i32, i32* %28, align 4
  %135 = trunc i32 %134 to i16
  %136 = sext i16 %135 to i32
  %137 = mul nsw i32 %133, %136
  %138 = load i16, i16* %34, align 2
  %139 = sext i16 %138 to i32
  %140 = icmp slt i32 %137, %139
  %141 = zext i1 %140 to i32
  %142 = load i16, i16* %34, align 2
  %143 = sext i16 %142 to i32
  %144 = icmp eq i32 %141, %143
  %145 = zext i1 %144 to i32
  %146 = icmp eq i32 %145, 7
  %147 = zext i1 %146 to i32
  %148 = load i32, i32* %15, align 4
  %149 = icmp sgt i32 %147, %148
  %150 = zext i1 %149 to i32
  %151 = load i32, i32* %15, align 4
  %152 = icmp sgt i32 %150, %151
  %153 = zext i1 %152 to i32
  %154 = and i32 %153, -371972609
  %155 = icmp ne i32 %154, 0
  br i1 %155, label %156, label %157

156:                                              ; preds = %120
  br label %157

157:                                              ; preds = %156, %120
  %158 = phi i1 [ false, %120 ], [ true, %156 ]
  %159 = zext i1 %158 to i32
  store i32 %159, i32* %32, align 4
  br label %160

160:                                              ; preds = %157
  %161 = load i32, i32* %21, align 4
  %162 = add i32 %161, 1
  store i32 %162, i32* %21, align 4
  br label %117, !llvm.loop !10

163:                                              ; preds = %117
  br label %178

164:                                              ; preds = %104
  %165 = load i32, i32* %28, align 4
  %166 = sitofp i32 %165 to double
  %167 = fcmp ogt double 0x43237BF99C000000, %166
  %168 = zext i1 %167 to i32
  store i32 %168, i32* %22, align 4
  %169 = load i32, i32* %28, align 4
  %170 = sitofp i32 %169 to float
  %171 = fneg float %170
  %172 = fptosi float %171 to i32
  store i32 %172, i32* %22, align 4
  %173 = sitofp i32 %172 to float
  %174 = fsub float %173, 0x4252E5FEE0000000
  %175 = fpext float %174 to double
  %176 = fcmp oeq double %175, 3.750000e-01
  %177 = zext i1 %176 to i32
  store i32 %177, i32* %28, align 4
  br label %178

178:                                              ; preds = %164, %163
  %179 = load i32, i32* %6, align 4
  %180 = icmp ne i32 %179, 0
  br i1 %180, label %181, label %234

181:                                              ; preds = %178
  store i32 -1, i32* %35, align 4
  store i32 1, i32* %36, align 4
  %182 = load i32, i32* %28, align 4
  store i32 %182, i32* %22, align 4
  store i32 0, i32* %15, align 4
  br label %183

183:                                              ; preds = %189, %181
  %184 = load i32, i32* %15, align 4
  %185 = icmp ne i32 %184, -28
  br i1 %185, label %186, label %192

186:                                              ; preds = %183
  %187 = load i32, i32* %14, align 4
  %188 = trunc i32 %187 to i16
  store i16 %188, i16* %1, align 2
  br label %736

189:                                              ; No predecessors!
  %190 = load i32, i32* %15, align 4
  %191 = sub nsw i32 %190, 4
  store i32 %191, i32* %15, align 4
  br label %183, !llvm.loop !11

192:                                              ; preds = %183
  %193 = load i32, i32* %14, align 4
  %194 = uitofp i32 %193 to float
  %195 = load i32, i32* %22, align 4
  %196 = sitofp i32 %195 to float
  %197 = call float @llvm.fmuladd.f32(float -0.000000e+00, float %194, float %196)
  %198 = fmul float %197, 0x43C9E7B4C0000000
  %199 = fptosi float %198 to i32
  store i32 %199, i32* %35, align 4
  %200 = load i32, i32* %35, align 4
  %201 = trunc i32 %200 to i16
  %202 = sext i16 %201 to i32
  %203 = ashr i32 %202, 7
  store i32 %203, i32* %15, align 4
  %204 = load i32, i32* %28, align 4
  %205 = urem i32 %203, %204
  %206 = load i32, i32* %29, align 4
  %207 = icmp ult i32 %205, %206
  %208 = zext i1 %207 to i32
  %209 = load i32, i32* %22, align 4
  %210 = icmp sle i32 %208, %209
  %211 = zext i1 %210 to i32
  %212 = icmp sle i32 %211, 2
  %213 = zext i1 %212 to i32
  %214 = trunc i32 %213 to i16
  %215 = zext i16 %214 to i32
  %216 = load i32, i32* %35, align 4
  %217 = trunc i32 %216 to i16
  %218 = zext i16 %217 to i32
  %219 = add nsw i32 %215, %218
  %220 = icmp ne i32 %219, 0
  br i1 %220, label %221, label %224

221:                                              ; preds = %192
  %222 = load i32, i32* %35, align 4
  %223 = icmp ne i32 %222, 0
  br label %224

224:                                              ; preds = %221, %192
  %225 = phi i1 [ false, %192 ], [ %223, %221 ]
  %226 = zext i1 %225 to i32
  %227 = load i32, i32* %14, align 4
  %228 = icmp ne i32 %226, %227
  %229 = zext i1 %228 to i32
  store i32 %229, i32* %22, align 4
  %230 = load i32, i32* %35, align 4
  %231 = xor i32 %229, %230
  store i32 %231, i32* %28, align 4
  %232 = icmp eq i32 %231, 43648
  %233 = zext i1 %232 to i32
  store i32 %233, i32* %36, align 4
  store i32 %233, i32* %30, align 4
  br label %237

234:                                              ; preds = %178
  %235 = load i32, i32* %15, align 4
  %236 = trunc i32 %235 to i16
  store i16 %236, i16* %1, align 2
  br label %736

237:                                              ; preds = %224
  %238 = load i32, i32* %21, align 4
  %239 = trunc i32 %238 to i16
  %240 = zext i16 %239 to i32
  %241 = load i32, i32* %4, align 4
  %242 = trunc i32 %241 to i16
  %243 = zext i16 %242 to i32
  %244 = add nsw i32 %240, %243
  store i32 %244, i32* %15, align 4
  br label %504

245:                                              ; preds = %95
  store i16 -10680, i16* %37, align 2
  store i32 1712299103, i32* %38, align 4
  %246 = load i16, i16* %37, align 2
  %247 = sext i16 %246 to i32
  %248 = xor i32 9, %247
  %249 = mul nsw i32 %248, -1
  store i32 %249, i32* %15, align 4
  %250 = trunc i32 %249 to i16
  %251 = sext i16 %250 to i32
  %252 = ashr i32 %251, 14
  %253 = load i16, i16* %37, align 2
  %254 = sext i16 %253 to i32
  %255 = icmp sle i32 %252, %254
  %256 = zext i1 %255 to i32
  %257 = icmp sge i32 %256, -1
  %258 = zext i1 %257 to i32
  %259 = load i16, i16* %37, align 2
  %260 = sext i16 %259 to i32
  %261 = add nsw i32 %258, %260
  store i32 %261, i32* %38, align 4
  %262 = icmp sgt i32 %261, 0
  br i1 %262, label %267, label %263

263:                                              ; preds = %245
  %264 = load i16, i16* %37, align 2
  %265 = sext i16 %264 to i32
  %266 = icmp ne i32 %265, 0
  br label %267

267:                                              ; preds = %263, %245
  %268 = phi i1 [ true, %245 ], [ %266, %263 ]
  %269 = zext i1 %268 to i32
  %270 = trunc i32 %269 to i16
  %271 = zext i16 %270 to i32
  %272 = load i32, i32* %22, align 4
  %273 = trunc i32 %272 to i16
  %274 = zext i16 %273 to i32
  %275 = shl i32 %271, %274
  %276 = load i16, i16* %37, align 2
  %277 = sext i16 %276 to i32
  %278 = icmp slt i32 %275, %277
  %279 = zext i1 %278 to i32
  %280 = icmp sle i32 %279, -1169870541
  %281 = zext i1 %280 to i32
  %282 = load i32, i32* %14, align 4
  %283 = icmp ult i32 %281, %282
  %284 = zext i1 %283 to i32
  store i32 %284, i32* %16, align 4
  store i32 %284, i32* %3, align 4
  br i1 %283, label %285, label %440

285:                                              ; preds = %267
  store i16 -1, i16* %39, align 2
  store i32 704690045, i32* %40, align 4
  store i32 -1735559985, i32* %41, align 4
  store i32 0, i32* %14, align 4
  br label %286

286:                                              ; preds = %297, %285
  %287 = load i32, i32* %14, align 4
  %288 = icmp uge i32 %287, 4
  br i1 %288, label %289, label %300

289:                                              ; preds = %286
  %290 = load i32, i32* %21, align 4
  %291 = icmp ule i32 3, %290
  br i1 %291, label %292, label %293

292:                                              ; preds = %289
  br label %293

293:                                              ; preds = %292, %289
  %294 = phi i1 [ false, %289 ], [ true, %292 ]
  %295 = zext i1 %294 to i32
  %296 = add nsw i32 %295, -1
  store i32 %296, i32* %40, align 4
  store i32 %296, i32* %41, align 4
  br label %297

297:                                              ; preds = %293
  %298 = load i32, i32* %14, align 4
  %299 = add i32 %298, 1
  store i32 %299, i32* %14, align 4
  br label %286, !llvm.loop !12

300:                                              ; preds = %286
  %301 = load i32, i32* %38, align 4
  %302 = and i32 -1, %301
  %303 = load i16, i16* %8, align 2
  %304 = sext i16 %303 to i32
  %305 = add nsw i32 %302, %304
  %306 = load i32, i32* %40, align 4
  %307 = srem i32 %305, %306
  %308 = icmp eq i32 %307, 0
  %309 = zext i1 %308 to i32
  %310 = load i32, i32* %41, align 4
  %311 = icmp sge i32 %309, %310
  %312 = zext i1 %311 to i32
  %313 = load i32, i32* %40, align 4
  %314 = icmp slt i32 %312, %313
  %315 = zext i1 %314 to i32
  store i32 %315, i32* %3, align 4
  %316 = load i32, i32* %41, align 4
  %317 = and i32 -10, %316
  %318 = load i16, i16* %17, align 2
  %319 = zext i16 %318 to i32
  %320 = icmp ne i32 %317, %319
  %321 = zext i1 %320 to i32
  store i32 %321, i32* %4, align 4
  br i1 %320, label %322, label %385

322:                                              ; preds = %300
  store i32 -1046074252, i32* %42, align 4
  %323 = load i32, i32* %14, align 4
  %324 = uitofp i32 %323 to double
  %325 = fcmp ogt double %324, 5.312500e-01
  %326 = zext i1 %325 to i32
  %327 = sitofp i32 %326 to double
  %328 = fcmp une double %327, 1.500000e+01
  %329 = zext i1 %328 to i32
  %330 = load i32, i32* %6, align 4
  %331 = icmp sle i32 %329, %330
  %332 = zext i1 %331 to i32
  %333 = load i32, i32* %41, align 4
  %334 = icmp ne i32 %332, %333
  %335 = zext i1 %334 to i32
  %336 = load i32, i32* %40, align 4
  %337 = icmp sle i32 %335, %336
  %338 = zext i1 %337 to i32
  %339 = sitofp i32 %338 to float
  %340 = fmul float %339, 8.250000e+00
  %341 = fcmp ole float %340, -1.000000e+00
  %342 = zext i1 %341 to i32
  %343 = load i32, i32* %41, align 4
  %344 = icmp ne i32 %342, %343
  %345 = zext i1 %344 to i32
  %346 = load i32, i32* %21, align 4
  %347 = icmp uge i32 %345, %346
  %348 = zext i1 %347 to i32
  %349 = sitofp i32 %348 to float
  %350 = fsub float %349, 0x3BD7AA6640000000
  %351 = fptosi float %350 to i32
  store i32 %351, i32* %38, align 4
  store i32 %351, i32* %22, align 4
  store i32 %351, i32* %42, align 4
  %352 = load i32, i32* %4, align 4
  %353 = sitofp i32 %352 to float
  %354 = fneg float %353
  %355 = load i16, i16* %37, align 2
  %356 = sext i16 %355 to i32
  %357 = sitofp i32 %356 to float
  %358 = fcmp ole float %354, %357
  %359 = zext i1 %358 to i32
  store i32 %359, i32* %15, align 4
  %360 = load i16, i16* %37, align 2
  %361 = sext i16 %360 to i32
  store i32 %361, i32* %42, align 4
  store i32 -1450261722, i32* %4, align 4
  %362 = load i32, i32* %40, align 4
  %363 = urem i32 115459, %362
  %364 = trunc i32 %363 to i16
  %365 = zext i16 %364 to i32
  %366 = ashr i32 %365, 2
  %367 = trunc i32 %366 to i16
  %368 = sext i16 %367 to i32
  %369 = load i32, i32* %9, align 4
  %370 = trunc i32 %369 to i16
  %371 = sext i16 %370 to i32
  %372 = add nsw i32 %368, %371
  %373 = load i32, i32* %22, align 4
  %374 = or i32 %372, %373
  %375 = icmp ne i32 %374, 0
  br i1 %375, label %379, label %376

376:                                              ; preds = %322
  %377 = load i32, i32* %42, align 4
  %378 = icmp ne i32 %377, 0
  br label %379

379:                                              ; preds = %376, %322
  %380 = phi i1 [ true, %322 ], [ %378, %376 ]
  %381 = zext i1 %380 to i32
  %382 = trunc i32 %381 to i16
  %383 = sext i16 %382 to i32
  %384 = shl i32 %383, 3
  store i32 %384, i32* %16, align 4
  br label %439

385:                                              ; preds = %300
  %386 = load i32, i32* %22, align 4
  %387 = load i32, i32* %15, align 4
  %388 = icmp ne i32 %386, %387
  %389 = zext i1 %388 to i32
  store i32 %389, i32* %10, align 4
  %390 = load i16, i16* %17, align 2
  %391 = zext i16 %390 to i32
  %392 = icmp uge i32 %389, %391
  %393 = zext i1 %392 to i32
  store i32 %393, i32* %3, align 4
  %394 = load i32, i32* %40, align 4
  %395 = icmp ne i32 %394, 0
  br i1 %395, label %396, label %397

396:                                              ; preds = %385
  br label %81

397:                                              ; preds = %385
  %398 = load i32, i32* %25, align 4
  store i32 %398, i32* %6, align 4
  store i32 %398, i32* %3, align 4
  %399 = load i32, i32* %38, align 4
  %400 = icmp ne i32 %399, 0
  %401 = zext i1 %400 to i32
  %402 = trunc i32 %401 to i16
  %403 = sext i16 %402 to i32
  %404 = load i32, i32* %15, align 4
  %405 = trunc i32 %404 to i16
  %406 = sext i16 %405 to i32
  %407 = ashr i32 %403, %406
  %408 = load i32, i32* %22, align 4
  %409 = shl i32 %407, %408
  %410 = trunc i32 %409 to i16
  %411 = zext i16 %410 to i32
  %412 = load i32, i32* %16, align 4
  %413 = trunc i32 %412 to i16
  %414 = zext i16 %413 to i32
  %415 = sub nsw i32 %411, %414
  %416 = load i32, i32* %21, align 4
  %417 = lshr i32 %415, %416
  store i32 %417, i32* %41, align 4
  %418 = load i32, i32* %14, align 4
  %419 = shl i32 %417, %418
  %420 = icmp ne i32 %419, 0
  br i1 %420, label %424, label %421

421:                                              ; preds = %397
  %422 = load i32, i32* %22, align 4
  %423 = icmp ne i32 %422, 0
  br i1 %423, label %424, label %427

424:                                              ; preds = %421, %397
  %425 = load i32, i32* %21, align 4
  %426 = icmp ne i32 %425, 0
  br label %427

427:                                              ; preds = %424, %421
  %428 = phi i1 [ false, %421 ], [ %426, %424 ]
  %429 = zext i1 %428 to i32
  %430 = load i32, i32* %40, align 4
  %431 = or i32 %429, %430
  store i32 %431, i32* %38, align 4
  %432 = load i32, i32* %22, align 4
  %433 = load i32, i32* %38, align 4
  %434 = icmp sle i32 %432, %433
  %435 = zext i1 %434 to i32
  %436 = trunc i32 %435 to i16
  %437 = sext i16 %436 to i32
  %438 = sub nsw i32 %437, 31177
  store i32 %438, i32* %40, align 4
  br label %439

439:                                              ; preds = %427, %379
  br label %503

440:                                              ; preds = %267
  store i16 1010, i16* %43, align 2
  store i32 -1932141760, i32* %44, align 4
  %441 = load i32, i32* %15, align 4
  %442 = mul nsw i32 %441, -1
  %443 = load i16, i16* %19, align 2
  %444 = sext i16 %443 to i32
  %445 = xor i32 %442, %444
  %446 = shl i32 %445, 27
  %447 = load i16, i16* %43, align 2
  %448 = sext i16 %447 to i32
  %449 = srem i32 %446, %448
  %450 = trunc i32 %449 to i16
  %451 = zext i16 %450 to i32
  %452 = ashr i32 %451, 6
  store i32 %452, i32* %38, align 4
  %453 = load i16, i16* %17, align 2
  %454 = zext i16 %453 to i32
  store i32 %454, i32* %22, align 4
  store i16 0, i16* %37, align 2
  br label %455

455:                                              ; preds = %468, %440
  %456 = load i16, i16* %37, align 2
  %457 = sext i16 %456 to i32
  %458 = icmp ne i32 %457, 6
  br i1 %458, label %459, label %473

459:                                              ; preds = %455
  store i32 6, i32* %45, align 4
  %460 = load i32, i32* %45, align 4
  %461 = icmp ne i32 %460, 0
  br i1 %461, label %462, label %463

462:                                              ; preds = %459
  br label %473

463:                                              ; preds = %459
  %464 = load i32, i32* %25, align 4
  %465 = icmp ne i32 %464, 0
  br i1 %465, label %466, label %467

466:                                              ; preds = %463
  br label %473

467:                                              ; preds = %463
  br label %468

468:                                              ; preds = %467
  %469 = load i16, i16* %37, align 2
  %470 = sext i16 %469 to i32
  %471 = add nsw i32 %470, 1
  %472 = trunc i32 %471 to i16
  store i16 %472, i16* %37, align 2
  br label %455, !llvm.loop !13

473:                                              ; preds = %466, %462, %455
  %474 = load i32, i32* %15, align 4
  %475 = load i16, i16* %37, align 2
  %476 = sext i16 %475 to i32
  %477 = sub i32 %474, %476
  %478 = trunc i32 %477 to i16
  %479 = sext i16 %478 to i32
  %480 = load i16, i16* %37, align 2
  %481 = sext i16 %480 to i32
  %482 = srem i32 %479, %481
  %483 = load i16, i16* %43, align 2
  %484 = sext i16 %483 to i32
  %485 = icmp sle i32 %482, %484
  %486 = zext i1 %485 to i32
  %487 = icmp eq i32 %486, -4
  %488 = zext i1 %487 to i32
  store i32 %488, i32* %44, align 4
  %489 = load i32, i32* %11, align 4
  %490 = icmp ugt i32 %488, %489
  %491 = zext i1 %490 to i32
  %492 = load i16, i16* %43, align 2
  %493 = sext i16 %492 to i32
  %494 = or i32 %491, %493
  %495 = trunc i32 %494 to i16
  %496 = zext i16 %495 to i32
  %497 = shl i32 %496, 14
  %498 = load i16, i16* %43, align 2
  %499 = sext i16 %498 to i32
  %500 = srem i32 %497, %499
  store i32 %500, i32* %38, align 4
  %501 = icmp sgt i32 %500, 4636
  %502 = zext i1 %501 to i32
  store i32 %502, i32* %15, align 4
  br label %503

503:                                              ; preds = %473, %439
  br label %504

504:                                              ; preds = %503, %237
  br label %721

505:                                              ; preds = %76
  store i32 -500590058, i32* %46, align 4
  store i16 7631, i16* %47, align 2
  store float 0x449E67D7A0000000, float* %48, align 4
  %506 = load i32, i32* %12, align 4
  %507 = icmp ne i32 %506, 0
  br i1 %507, label %508, label %512

508:                                              ; preds = %505
  %509 = load i16, i16* %19, align 2
  %510 = sext i16 %509 to i32
  %511 = icmp ne i32 %510, 0
  br label %512

512:                                              ; preds = %508, %505
  %513 = phi i1 [ false, %505 ], [ %511, %508 ]
  %514 = zext i1 %513 to i32
  %515 = icmp slt i32 %514, 96339403
  %516 = zext i1 %515 to i32
  store i32 %516, i32* %46, align 4
  %517 = load i16, i16* %17, align 2
  %518 = zext i16 %517 to i32
  %519 = icmp sle i32 %516, %518
  %520 = zext i1 %519 to i32
  %521 = icmp ne i32 %520, 65535
  %522 = zext i1 %521 to i32
  %523 = icmp ult i32 %522, 0
  br i1 %523, label %524, label %707

524:                                              ; preds = %512
  store i16 -9317, i16* %49, align 2
  store i32 -1, i32* %50, align 4
  store i32 -7, i32* %51, align 4
  store float 7.500000e-01, float* %52, align 4
  store i32 1, i32* %53, align 4
  %525 = load i32, i32* %46, align 4
  %526 = load i16, i16* %19, align 2
  %527 = sext i16 %526 to i32
  %528 = icmp ne i32 %525, %527
  %529 = zext i1 %528 to i32
  store i32 %529, i32* %16, align 4
  %530 = trunc i32 %529 to i16
  %531 = zext i16 %530 to i32
  %532 = load i32, i32* %13, align 4
  %533 = trunc i32 %532 to i16
  %534 = zext i16 %533 to i32
  %535 = ashr i32 %531, %534
  %536 = xor i32 %535, 0
  %537 = load i32, i32* %7, align 4
  %538 = icmp slt i32 %536, %537
  %539 = zext i1 %538 to i32
  %540 = load i16, i16* %17, align 2
  %541 = zext i16 %540 to i32
  %542 = udiv i32 %539, %541
  %543 = load i32, i32* %9, align 4
  %544 = icmp ne i32 %542, %543
  %545 = zext i1 %544 to i32
  %546 = trunc i32 %545 to i16
  %547 = sext i16 %546 to i32
  %548 = load i16, i16* %49, align 2
  %549 = sext i16 %548 to i32
  %550 = sdiv i32 %547, %549
  store i32 %550, i32* %50, align 4
  %551 = load i32, i32* %46, align 4
  %552 = icmp sle i32 2, %551
  %553 = zext i1 %552 to i32
  store i32 %553, i32* %50, align 4
  store i32 %553, i32* %16, align 4
  %554 = icmp eq i32 %553, 53203
  br i1 %554, label %555, label %558

555:                                              ; preds = %524
  %556 = load i32, i32* %46, align 4
  %557 = icmp ne i32 %556, 0
  br label %558

558:                                              ; preds = %555, %524
  %559 = phi i1 [ false, %524 ], [ %557, %555 ]
  %560 = zext i1 %559 to i32
  store i32 %560, i32* %51, align 4
  br label %561

561:                                              ; preds = %623, %558
  store i32 -16, i32* %16, align 4
  br label %562

562:                                              ; preds = %568, %561
  %563 = load i32, i32* %16, align 4
  %564 = icmp slt i32 %563, -30
  br i1 %564, label %565, label %571

565:                                              ; preds = %562
  store i32 8, i32* %54, align 4
  %566 = load i32, i32* %54, align 4
  %567 = trunc i32 %566 to i16
  store i16 %567, i16* %1, align 2
  br label %736

568:                                              ; No predecessors!
  %569 = load i32, i32* %16, align 4
  %570 = sub nsw i32 %569, 1
  store i32 %570, i32* %16, align 4
  br label %562, !llvm.loop !14

571:                                              ; preds = %562
  %572 = load i32, i32* %51, align 4
  %573 = icmp ne i32 %572, 0
  br i1 %573, label %574, label %582

574:                                              ; preds = %571
  store i32 2034733474, i32* %55, align 4
  %575 = load i32, i32* %3, align 4
  store i32 %575, i32* %55, align 4
  %576 = load i32, i32* %55, align 4
  store i32 %576, i32* %51, align 4
  %577 = load i16, i16* %49, align 2
  %578 = zext i16 %577 to i32
  %579 = xor i32 6, %578
  store i32 %579, i32* %15, align 4
  %580 = load i32, i32* %55, align 4
  %581 = trunc i32 %580 to i16
  store i16 %581, i16* %1, align 2
  br label %736

582:                                              ; preds = %571
  store i16 -9313, i16* %56, align 2
  store i32 -184653893, i32* %57, align 4
  %583 = load i32, i32* %13, align 4
  %584 = icmp uge i32 268435456, %583
  %585 = zext i1 %584 to i32
  %586 = mul nsw i32 %585, -1
  %587 = icmp ne i32 %586, 0
  %588 = zext i1 %587 to i32
  %589 = load i16, i16* %56, align 2
  %590 = zext i16 %589 to i32
  %591 = icmp ne i32 %588, %590
  br i1 %591, label %592, label %620

592:                                              ; preds = %582
  store i32 -6, i32* %58, align 4
  %593 = load i32, i32* %58, align 4
  %594 = or i32 %593, 65535
  %595 = load i32, i32* %15, align 4
  %596 = icmp uge i32 %594, %595
  %597 = zext i1 %596 to i32
  %598 = trunc i32 %597 to i16
  %599 = zext i16 %598 to i32
  %600 = load i32, i32* %50, align 4
  %601 = trunc i32 %600 to i16
  %602 = zext i16 %601 to i32
  %603 = sub nsw i32 %599, %602
  store i32 %603, i32* %46, align 4
  store i32 %603, i32* %3, align 4
  %604 = load i16, i16* %56, align 2
  %605 = zext i16 %604 to i32
  %606 = sitofp i32 %605 to double
  %607 = fcmp olt double -1.025000e+01, %606
  %608 = zext i1 %607 to i32
  store i32 %608, i32* %15, align 4
  %609 = sitofp i32 %608 to float
  %610 = fdiv float %609, 0x4586FF5C40000000
  %611 = fptosi float %610 to i32
  store i32 %611, i32* %7, align 4
  %612 = load i32, i32* %14, align 4
  %613 = uitofp i32 %612 to double
  %614 = fcmp olt double %613, 2.875000e+00
  %615 = zext i1 %614 to i32
  %616 = load i32, i32* %50, align 4
  %617 = icmp eq i32 %615, %616
  %618 = zext i1 %617 to i32
  %619 = trunc i32 %618 to i16
  store i16 %619, i16* %20, align 2
  br label %671

620:                                              ; preds = %582
  store float 0x3CC31760C0000000, float* %59, align 4
  store i32 1581872282, i32* %60, align 4
  %621 = load i32, i32* %6, align 4
  %622 = icmp ne i32 %621, 0
  br i1 %622, label %623, label %624

623:                                              ; preds = %620
  br label %561

624:                                              ; preds = %620
  %625 = load i32, i32* %10, align 4
  %626 = uitofp i32 %625 to float
  %627 = fsub float %626, 0x39E0E3E320000000
  %628 = load i32, i32* %15, align 4
  %629 = sitofp i32 %628 to float
  %630 = fdiv float %627, %629
  %631 = fpext float %630 to double
  %632 = fcmp olt double %631, 6.250000e-01
  %633 = zext i1 %632 to i32
  %634 = sitofp i32 %633 to float
  %635 = fmul float %634, 0x4175F10580000000
  %636 = load i32, i32* %10, align 4
  %637 = uitofp i32 %636 to float
  %638 = fmul float %635, %637
  %639 = load i32, i32* %6, align 4
  %640 = sitofp i32 %639 to float
  %641 = fcmp olt float %638, %640
  %642 = zext i1 %641 to i32
  store i32 %642, i32* %15, align 4
  store i32 0, i32* %4, align 4
  %643 = load float, float* %59, align 4
  %644 = fptoui float %643 to i32
  store i32 %644, i32* %53, align 4
  %645 = uitofp i32 %644 to float
  %646 = fdiv float %645, 0x4080528300000000
  %647 = fptosi float %646 to i32
  store i32 %647, i32* %57, align 4
  %648 = sitofp i32 %647 to float
  %649 = load i32, i32* %60, align 4
  %650 = sitofp i32 %649 to float
  %651 = fadd float %648, %650
  %652 = fpext float %651 to double
  %653 = fcmp ogt double %652, 0x3F1E8A97AE000000
  %654 = zext i1 %653 to i32
  %655 = load i32, i32* %10, align 4
  %656 = icmp eq i32 %654, %655
  %657 = zext i1 %656 to i32
  %658 = sitofp i32 %657 to float
  %659 = load i32, i32* %4, align 4
  %660 = sitofp i32 %659 to float
  %661 = fmul float %658, %660
  %662 = load i32, i32* %46, align 4
  %663 = sitofp i32 %662 to float
  %664 = fdiv float %661, %663
  %665 = fptosi float %664 to i16
  store i16 %665, i16* %47, align 2
  %666 = load i32, i32* %60, align 4
  %667 = load i16, i16* %49, align 2
  %668 = zext i16 %667 to i32
  %669 = icmp sle i32 %666, %668
  %670 = zext i1 %669 to i32
  store i32 %670, i32* %46, align 4
  br label %671

671:                                              ; preds = %624, %592
  store i32 19, i32* %7, align 4
  br label %672

672:                                              ; preds = %687, %671
  %673 = load i32, i32* %7, align 4
  %674 = icmp slt i32 %673, -15
  br i1 %674, label %675, label %690

675:                                              ; preds = %672
  %676 = load i32, i32* %51, align 4
  %677 = trunc i32 %676 to i16
  %678 = sext i16 %677 to i32
  %679 = load i16, i16* %56, align 2
  %680 = sext i16 %679 to i32
  %681 = sub nsw i32 %678, %680
  %682 = mul i32 %681, 2
  %683 = load i32, i32* %53, align 4
  %684 = sub nsw i32 %682, %683
  %685 = load i32, i32* %51, align 4
  %686 = udiv i32 %684, %685
  store i32 %686, i32* %46, align 4
  br label %687

687:                                              ; preds = %675
  %688 = load i32, i32* %7, align 4
  %689 = sub nsw i32 %688, 4
  store i32 %689, i32* %7, align 4
  br label %672, !llvm.loop !15

690:                                              ; preds = %672
  %691 = load i16, i16* %47, align 2
  %692 = sext i16 %691 to i32
  %693 = load i32, i32* %11, align 4
  %694 = icmp uge i32 %692, %693
  %695 = zext i1 %694 to i32
  %696 = icmp sge i32 %695, 1
  %697 = zext i1 %696 to i32
  store i32 %697, i32* %16, align 4
  %698 = trunc i32 %697 to i16
  %699 = sext i16 %698 to i32
  %700 = load i32, i32* %53, align 4
  %701 = trunc i32 %700 to i16
  %702 = sext i16 %701 to i32
  %703 = shl i32 %699, %702
  store i32 %703, i32* %46, align 4
  %704 = icmp ne i32 %703, 7
  %705 = zext i1 %704 to i32
  store i32 %705, i32* %3, align 4
  br label %706

706:                                              ; preds = %690
  store i32 1, i32* %50, align 4
  br label %720

707:                                              ; preds = %512
  store i16 0, i16* %8, align 2
  br label %708

708:                                              ; preds = %714, %707
  %709 = load i16, i16* %8, align 2
  %710 = sext i16 %709 to i32
  %711 = icmp sge i32 %710, 10
  br i1 %711, label %712, label %719

712:                                              ; preds = %708
  store i32 -866170222, i32* %61, align 4
  store i32 1, i32* %62, align 4
  %713 = load i32, i32* %61, align 4
  store i32 %713, i32* %62, align 4
  br label %714

714:                                              ; preds = %712
  %715 = load i16, i16* %8, align 2
  %716 = sext i16 %715 to i32
  %717 = add nsw i32 %716, 1
  %718 = trunc i32 %717 to i16
  store i16 %718, i16* %8, align 2
  br label %708, !llvm.loop !16

719:                                              ; preds = %708
  br label %720

720:                                              ; preds = %719, %706
  br label %721

721:                                              ; preds = %720, %504
  br label %733

722:                                              ; preds = %0
  store i32 -13, i32* %3, align 4
  br label %723

723:                                              ; preds = %729, %722
  %724 = load i32, i32* %3, align 4
  %725 = icmp sgt i32 %724, -10
  br i1 %725, label %726, label %732

726:                                              ; preds = %723
  store i32 1483506819, i32* %63, align 4
  %727 = load i32, i32* %63, align 4
  %728 = trunc i32 %727 to i16
  store i16 %728, i16* %1, align 2
  br label %736

729:                                              ; No predecessors!
  %730 = load i32, i32* %3, align 4
  %731 = add nsw i32 %730, 1
  store i32 %731, i32* %3, align 4
  br label %723, !llvm.loop !17

732:                                              ; preds = %723
  br label %733

733:                                              ; preds = %732, %721
  %734 = load i32, i32* %13, align 4
  %735 = trunc i32 %734 to i16
  store i16 %735, i16* %1, align 2
  br label %736

736:                                              ; preds = %733, %726, %574, %565, %234, %186
  %737 = load i16, i16* %1, align 2
  ret i16 %737
}

define internal void @platform_main_end(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i32 noundef %5)
  ret void
}

define internal i32 @func_4(i32 noundef %0, i16 noundef signext %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i16, align 2
  %6 = alloca i16, align 2
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca float, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i16, align 2
  %18 = alloca i32, align 4
  %19 = alloca i16, align 2
  %20 = alloca float, align 4
  %21 = alloca float, align 4
  %22 = alloca i16, align 2
  %23 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i16 %1, i16* %5, align 2
  store i16 25468, i16* %6, align 2
  store i32 1, i32* %7, align 4
  store i32 6, i32* %8, align 4
  store i32 -2, i32* %9, align 4
  br label %24

24:                                               ; preds = %332, %268, %2
  %25 = load i32, i32* %4, align 4
  %26 = load i16, i16* %6, align 2
  %27 = sext i16 %26 to i32
  %28 = icmp sgt i32 %25, %27
  %29 = zext i1 %28 to i32
  store i32 %29, i32* %7, align 4
  %30 = load i32, i32* %4, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %60

32:                                               ; preds = %24
  store i32 5, i32* %10, align 4
  store i16 1, i16* %5, align 2
  br label %33

33:                                               ; preds = %54, %32
  %34 = load i16, i16* %5, align 2
  %35 = sext i16 %34 to i32
  %36 = icmp slt i32 %35, 18
  br i1 %36, label %37, label %59

37:                                               ; preds = %33
  store float 4.687500e-01, float* %11, align 4
  %38 = load i16, i16* %5, align 2
  %39 = sext i16 %38 to i32
  %40 = load i32, i32* %4, align 4
  %41 = icmp sle i32 %39, %40
  %42 = zext i1 %41 to i32
  store i32 %42, i32* %7, align 4
  %43 = load i32, i32* %4, align 4
  %44 = sitofp i32 %43 to float
  store float %44, float* %11, align 4
  store i32 1, i32* %4, align 4
  store i32 1, i32* %10, align 4
  %45 = load i32, i32* %4, align 4
  %46 = trunc i32 %45 to i16
  %47 = zext i16 %46 to i32
  %48 = add nsw i32 %47, 65526
  %49 = load i32, i32* %4, align 4
  %50 = icmp ne i32 %48, %49
  %51 = zext i1 %50 to i32
  %52 = icmp ult i32 %51, 2
  %53 = zext i1 %52 to i32
  store i32 %53, i32* %4, align 4
  store i32 0, i32* %4, align 4
  br label %54

54:                                               ; preds = %37
  %55 = load i16, i16* %5, align 2
  %56 = sext i16 %55 to i32
  %57 = add nsw i32 %56, 1
  %58 = trunc i32 %57 to i16
  store i16 %58, i16* %5, align 2
  br label %33, !llvm.loop !18

59:                                               ; preds = %33
  br label %329

60:                                               ; preds = %24
  store i32 -1410359259, i32* %12, align 4
  store i32 -351147436, i32* %13, align 4
  store i32 0, i32* %14, align 4
  store i16 -28, i16* %5, align 2
  br label %61

61:                                               ; preds = %323, %60
  %62 = load i16, i16* %5, align 2
  %63 = sext i16 %62 to i32
  %64 = icmp slt i32 %63, 15
  br i1 %64, label %65, label %328

65:                                               ; preds = %61
  store i32 -1, i32* %15, align 4
  store i32 -1, i32* %16, align 4
  %66 = load i32, i32* %12, align 4
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %177

68:                                               ; preds = %65
  store i16 -3, i16* %17, align 2
  store i32 -1, i32* %18, align 4
  %69 = load i32, i32* %7, align 4
  store i32 %69, i32* %7, align 4
  %70 = load i16, i16* %5, align 2
  %71 = sext i16 %70 to i32
  %72 = load i16, i16* %5, align 2
  %73 = sext i16 %72 to i32
  %74 = sdiv i32 %71, %73
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %104

76:                                               ; preds = %68
  store i16 1, i16* %19, align 2
  store i32 0, i32* %12, align 4
  br label %77

77:                                               ; preds = %98, %76
  %78 = load i32, i32* %12, align 4
  %79 = icmp sge i32 %78, 13
  br i1 %79, label %80, label %101

80:                                               ; preds = %77
  %81 = load i16, i16* %5, align 2
  %82 = load i32, i32* %4, align 4
  %83 = load i32, i32* %12, align 4
  %84 = trunc i32 %83 to i16
  %85 = load i32, i32* %4, align 4
  %86 = trunc i32 %85 to i16
  %87 = call float @func_29(i16 noundef zeroext %81, i32 noundef %82, i16 noundef signext %84, i16 noundef zeroext %86)
  %88 = fptosi float %87 to i32
  store i32 %88, i32* %13, align 4
  %89 = load i32, i32* %4, align 4
  %90 = icmp ne i32 %89, 0
  %91 = zext i1 %90 to i32
  %92 = trunc i32 %91 to i16
  store i16 %92, i16* %19, align 2
  %93 = load i16, i16* %17, align 2
  %94 = zext i16 %93 to i32
  %95 = trunc i32 %94 to i16
  %96 = sext i16 %95 to i32
  %97 = shl i32 %96, 13
  store i32 %97, i32* %4, align 4
  store i32 3, i32* %18, align 4
  br label %98

98:                                               ; preds = %80
  %99 = load i32, i32* %12, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %12, align 4
  br label %77, !llvm.loop !19

101:                                              ; preds = %77
  %102 = load i16, i16* %5, align 2
  %103 = sext i16 %102 to i32
  store i32 %103, i32* %3, align 4
  br label %337

104:                                              ; preds = %68
  store float 1.587500e+01, float* %20, align 4
  store i16 1, i16* %17, align 2
  br label %105

105:                                              ; preds = %149, %104
  %106 = load i16, i16* %17, align 2
  %107 = zext i16 %106 to i32
  %108 = icmp ne i32 %107, 28
  br i1 %108, label %109, label %154

109:                                              ; preds = %105
  store float 0x3CB9007540000000, float* %21, align 4
  %110 = load i32, i32* %4, align 4
  %111 = sitofp i32 %110 to float
  store float %111, float* %21, align 4
  %112 = load i16, i16* %5, align 2
  %113 = sitofp i16 %112 to float
  %114 = fsub float %111, %113
  %115 = fptoui float %114 to i32
  store i32 %115, i32* %15, align 4
  %116 = load i32, i32* %4, align 4
  %117 = trunc i32 %116 to i16
  %118 = sext i16 %117 to i32
  %119 = shl i32 %118, 8
  store i32 %119, i32* %14, align 4
  %120 = load i32, i32* %4, align 4
  %121 = icmp sle i32 %119, %120
  %122 = zext i1 %121 to i32
  %123 = trunc i32 %122 to i16
  %124 = sext i16 %123 to i32
  %125 = load i32, i32* %4, align 4
  %126 = trunc i32 %125 to i16
  %127 = sext i16 %126 to i32
  %128 = sub nsw i32 %124, %127
  store i32 %128, i32* %7, align 4
  %129 = icmp slt i32 %128, 50138
  %130 = zext i1 %129 to i32
  %131 = load i32, i32* %4, align 4
  %132 = icmp eq i32 %130, %131
  %133 = zext i1 %132 to i32
  %134 = load i16, i16* %5, align 2
  %135 = sext i16 %134 to i32
  %136 = xor i32 %133, %135
  %137 = load i16, i16* %5, align 2
  %138 = sext i16 %137 to i32
  %139 = icmp eq i32 %136, %138
  %140 = zext i1 %139 to i32
  store i32 %140, i32* %4, align 4
  %141 = load i16, i16* %5, align 2
  %142 = sext i16 %141 to i32
  %143 = sitofp i32 %142 to double
  %144 = fcmp ogt double %143, 0x437B1730C4000000
  %145 = zext i1 %144 to i32
  %146 = load i32, i32* %15, align 4
  %147 = icmp eq i32 %145, %146
  %148 = zext i1 %147 to i32
  store i32 %148, i32* %7, align 4
  br label %149

149:                                              ; preds = %109
  %150 = load i16, i16* %17, align 2
  %151 = zext i16 %150 to i32
  %152 = add nsw i32 %151, 9
  %153 = trunc i32 %152 to i16
  store i16 %153, i16* %17, align 2
  br label %105, !llvm.loop !20

154:                                              ; preds = %105
  %155 = load i32, i32* %4, align 4
  store i32 %155, i32* %13, align 4
  %156 = load i16, i16* %5, align 2
  %157 = zext i16 %156 to i32
  %158 = load i16, i16* %5, align 2
  %159 = zext i16 %158 to i32
  %160 = shl i32 %157, %159
  store i32 %160, i32* %4, align 4
  store i32 %160, i32* %18, align 4
  %161 = load i16, i16* %5, align 2
  %162 = sext i16 %161 to i32
  store i32 %162, i32* %7, align 4
  %163 = sitofp i32 %162 to float
  %164 = load i32, i32* %12, align 4
  %165 = sitofp i32 %164 to float
  %166 = fdiv float %163, %165
  %167 = fptosi float %166 to i32
  store i32 %167, i32* %13, align 4
  %168 = sitofp i32 %167 to float
  %169 = load i16, i16* %6, align 2
  %170 = sitofp i16 %169 to float
  %171 = fmul float %168, %170
  %172 = load i32, i32* %4, align 4
  %173 = sitofp i32 %172 to float
  %174 = fdiv float %171, %173
  %175 = fptosi float %174 to i32
  store i32 %175, i32* %8, align 4
  br label %176

176:                                              ; preds = %154
  br label %309

177:                                              ; preds = %65
  store i16 0, i16* %22, align 2
  %178 = load i32, i32* %4, align 4
  %179 = srem i32 -4, %178
  store i32 %179, i32* %4, align 4
  store i32 %179, i32* %13, align 4
  %180 = load i32, i32* %15, align 4
  %181 = load i32, i32* %15, align 4
  %182 = icmp eq i32 %180, %181
  %183 = zext i1 %182 to i32
  %184 = sitofp i32 %183 to float
  %185 = fsub float %184, 0x45B3556080000000
  %186 = fpext float %185 to double
  %187 = fcmp oeq double %186, 0x3E6EB3F872000000
  %188 = zext i1 %187 to i32
  %189 = sitofp i32 %188 to float
  %190 = load i16, i16* %5, align 2
  %191 = sitofp i16 %190 to float
  %192 = load i16, i16* %5, align 2
  %193 = sitofp i16 %192 to float
  %194 = fneg float %193
  %195 = call float @llvm.fmuladd.f32(float %189, float %191, float %194)
  %196 = fptosi float %195 to i32
  store i32 %196, i32* %13, align 4
  %197 = load i16, i16* %5, align 2
  %198 = sext i16 %197 to i32
  store i32 %198, i32* %4, align 4
  %199 = load i16, i16* %5, align 2
  %200 = sext i16 %199 to i32
  %201 = load i16, i16* %6, align 2
  %202 = sext i16 %201 to i32
  %203 = or i32 %200, %202
  %204 = icmp ne i32 %203, 0
  br i1 %204, label %205, label %252

205:                                              ; preds = %177
  store i32 -1772626651, i32* %23, align 4
  %206 = load i32, i32* %15, align 4
  %207 = uitofp i32 %206 to double
  %208 = fcmp oge double 0x3A81E9B264000000, %207
  %209 = zext i1 %208 to i32
  %210 = sitofp i32 %209 to double
  %211 = fcmp oge double %210, 0x4344333B24000000
  %212 = zext i1 %211 to i32
  %213 = load i16, i16* %6, align 2
  %214 = sext i16 %213 to i32
  %215 = icmp sle i32 %212, %214
  %216 = zext i1 %215 to i32
  %217 = load i32, i32* %14, align 4
  %218 = icmp sle i32 %216, %217
  %219 = zext i1 %218 to i32
  store i32 %219, i32* %7, align 4
  %220 = load i16, i16* %5, align 2
  %221 = sext i16 %220 to i32
  %222 = icmp sge i32 -1, %221
  %223 = zext i1 %222 to i32
  %224 = load i32, i32* %15, align 4
  %225 = icmp eq i32 %223, %224
  %226 = xor i1 %225, true
  %227 = zext i1 %226 to i32
  %228 = icmp sle i32 %227, 0
  %229 = zext i1 %228 to i32
  %230 = load i32, i32* %8, align 4
  %231 = and i32 %229, %230
  %232 = load i32, i32* %4, align 4
  %233 = icmp slt i32 %231, %232
  %234 = zext i1 %233 to i32
  %235 = icmp eq i32 %234, 5
  %236 = zext i1 %235 to i32
  %237 = load i32, i32* %23, align 4
  %238 = xor i32 %236, %237
  %239 = icmp sgt i32 %238, 0
  %240 = zext i1 %239 to i32
  store i32 %240, i32* %4, align 4
  %241 = load i16, i16* %5, align 2
  %242 = sext i16 %241 to i32
  %243 = icmp slt i32 %240, %242
  %244 = zext i1 %243 to i32
  %245 = load i32, i32* %9, align 4
  %246 = icmp sge i32 %244, %245
  %247 = zext i1 %246 to i32
  %248 = load i16, i16* %5, align 2
  %249 = sext i16 %248 to i32
  %250 = and i32 %247, %249
  store i32 %250, i32* %23, align 4
  %251 = load i32, i32* %15, align 4
  store i32 %251, i32* %3, align 4
  br label %337

252:                                              ; preds = %177
  %253 = load i32, i32* %4, align 4
  %254 = xor i32 65535, %253
  store i32 %254, i32* %4, align 4
  store i32 -2, i32* %13, align 4
  %255 = load i16, i16* %22, align 2
  %256 = zext i16 %255 to i32
  %257 = add nsw i32 %256, 1938800318
  %258 = trunc i32 %257 to i16
  %259 = sext i16 %258 to i32
  %260 = srem i32 %259, 4023
  store i32 %260, i32* %4, align 4
  br label %261

261:                                              ; preds = %252
  store i32 -27, i32* %14, align 4
  br label %262

262:                                              ; preds = %305, %261
  %263 = load i32, i32* %14, align 4
  %264 = icmp eq i32 %263, -30
  br i1 %264, label %265, label %308

265:                                              ; preds = %262
  %266 = load i32, i32* %9, align 4
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %268, label %269

268:                                              ; preds = %265
  br label %24

269:                                              ; preds = %265
  store i32 29, i32* %8, align 4
  br label %270

270:                                              ; preds = %287, %269
  %271 = load i32, i32* %8, align 4
  %272 = icmp eq i32 %271, -26
  br i1 %272, label %273, label %290

273:                                              ; preds = %270
  %274 = load i32, i32* %4, align 4
  store i32 %274, i32* %13, align 4
  %275 = load i16, i16* %5, align 2
  %276 = sext i16 %275 to i32
  %277 = icmp ne i32 %276, 0
  br i1 %277, label %281, label %278

278:                                              ; preds = %273
  %279 = load i32, i32* %4, align 4
  %280 = icmp ne i32 %279, 0
  br label %281

281:                                              ; preds = %278, %273
  %282 = phi i1 [ true, %273 ], [ %280, %278 ]
  %283 = zext i1 %282 to i32
  store i32 %283, i32* %4, align 4
  %284 = load i32, i32* %14, align 4
  %285 = icmp eq i32 57156, %284
  %286 = zext i1 %285 to i32
  store i32 %286, i32* %7, align 4
  br label %287

287:                                              ; preds = %281
  %288 = load i32, i32* %8, align 4
  %289 = sub nsw i32 %288, 1
  store i32 %289, i32* %8, align 4
  br label %270, !llvm.loop !21

290:                                              ; preds = %270
  %291 = load i16, i16* %22, align 2
  %292 = zext i16 %291 to i32
  %293 = load i16, i16* %22, align 2
  %294 = zext i16 %293 to i32
  %295 = icmp sge i32 %292, %294
  br i1 %295, label %296, label %300

296:                                              ; preds = %290
  %297 = load i32, i32* %14, align 4
  %298 = icmp ne i32 %297, 0
  br i1 %298, label %299, label %300

299:                                              ; preds = %296
  br label %300

300:                                              ; preds = %299, %296, %290
  %301 = phi i1 [ false, %296 ], [ false, %290 ], [ true, %299 ]
  %302 = zext i1 %301 to i32
  %303 = load i32, i32* %4, align 4
  %304 = srem i32 %302, %303
  store i32 %304, i32* %4, align 4
  br label %305

305:                                              ; preds = %300
  %306 = load i32, i32* %14, align 4
  %307 = sub nsw i32 %306, 1
  store i32 %307, i32* %14, align 4
  br label %262, !llvm.loop !22

308:                                              ; preds = %262
  br label %309

309:                                              ; preds = %308, %176
  %310 = load i32, i32* %4, align 4
  %311 = icmp ne i32 %310, 1732353709
  %312 = zext i1 %311 to i32
  %313 = load i16, i16* %5, align 2
  %314 = sext i16 %313 to i32
  %315 = mul nsw i32 %312, %314
  %316 = icmp ne i32 %315, 0
  br i1 %316, label %317, label %320

317:                                              ; preds = %309
  %318 = load i32, i32* %8, align 4
  %319 = icmp ne i32 %318, 0
  br label %320

320:                                              ; preds = %317, %309
  %321 = phi i1 [ false, %309 ], [ %319, %317 ]
  %322 = zext i1 %321 to i32
  store i32 %322, i32* %16, align 4
  br label %323

323:                                              ; preds = %320
  %324 = load i16, i16* %5, align 2
  %325 = sext i16 %324 to i32
  %326 = add nsw i32 %325, 4
  %327 = trunc i32 %326 to i16
  store i16 %327, i16* %5, align 2
  br label %61, !llvm.loop !23

328:                                              ; preds = %61
  br label %329

329:                                              ; preds = %328, %59
  %330 = load i32, i32* %9, align 4
  %331 = icmp ne i32 %330, 0
  br i1 %331, label %332, label %333

332:                                              ; preds = %329
  br label %24

333:                                              ; preds = %329
  %334 = load i16, i16* %5, align 2
  %335 = sext i16 %334 to i32
  store i32 %335, i32* %8, align 4
  store i32 -1769757108, i32* %4, align 4
  %336 = load i32, i32* %9, align 4
  store i32 %336, i32* %3, align 4
  br label %337

337:                                              ; preds = %333, %205, %101
  %338 = load i32, i32* %3, align 4
  ret i32 %338
}

declare float @llvm.fmuladd.f32(float, float, float) #1

define internal float @func_29(i16 noundef zeroext %0, i32 noundef %1, i16 noundef signext %2, i16 noundef zeroext %3) #0 {
  %5 = alloca float, align 4
  %6 = alloca i16, align 2
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i16, align 2
  %13 = alloca i16, align 2
  %14 = alloca i32, align 4
  %15 = alloca float, align 4
  %16 = alloca i32, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i16, align 2
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i16, align 2
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i16, align 2
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  %51 = alloca i32, align 4
  %52 = alloca i16, align 2
  %53 = alloca i32, align 4
  %54 = alloca i32, align 4
  %55 = alloca i16, align 2
  %56 = alloca i32, align 4
  %57 = alloca float, align 4
  %58 = alloca i32, align 4
  %59 = alloca i32, align 4
  %60 = alloca i32, align 4
  %61 = alloca i32, align 4
  %62 = alloca i32, align 4
  %63 = alloca i32, align 4
  %64 = alloca i32, align 4
  %65 = alloca i32, align 4
  %66 = alloca i16, align 2
  %67 = alloca i32, align 4
  %68 = alloca float, align 4
  %69 = alloca float, align 4
  %70 = alloca i16, align 2
  %71 = alloca i32, align 4
  %72 = alloca i32, align 4
  %73 = alloca i32, align 4
  %74 = alloca i16, align 2
  %75 = alloca i32, align 4
  %76 = alloca i32, align 4
  %77 = alloca i32, align 4
  %78 = alloca i32, align 4
  %79 = alloca i32, align 4
  store i16 %0, i16* %6, align 2
  store i32 %1, i32* %7, align 4
  store i16 %2, i16* %8, align 2
  store i16 %3, i16* %9, align 2
  store i32 3, i32* %10, align 4
  store i32 2, i32* %11, align 4
  store i16 -1, i16* %12, align 2
  store i16 0, i16* %13, align 2
  store i32 5, i32* %14, align 4
  store float -9.750000e+00, float* %15, align 4
  store i32 1, i32* %16, align 4
  store float 6.562500e-01, float* %17, align 4
  store float 0x3BC4426880000000, float* %18, align 4
  br label %80

80:                                               ; preds = %519, %491, %423, %409, %4
  %81 = load i16, i16* %9, align 2
  %82 = zext i16 %81 to i32
  store i32 %82, i32* %10, align 4
  %83 = load i16, i16* %9, align 2
  %84 = zext i16 %83 to i32
  %85 = sub nsw i32 357743051, %84
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %342

87:                                               ; preds = %80
  store i32 1797532927, i32* %19, align 4
  store i32 777663128, i32* %20, align 4
  store i16 18124, i16* %21, align 2
  store i16 0, i16* %9, align 2
  br label %88

88:                                               ; preds = %310, %87
  %89 = load i16, i16* %9, align 2
  %90 = zext i16 %89 to i32
  %91 = icmp sge i32 %90, 21
  br i1 %91, label %92, label %315

92:                                               ; preds = %88
  store i32 -1872166865, i32* %22, align 4
  store i32 253453208, i32* %23, align 4
  %93 = load i32, i32* %7, align 4
  %94 = load i32, i32* %7, align 4
  %95 = srem i32 %93, %94
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %104

97:                                               ; preds = %92
  store i32 325382858, i32* %24, align 4
  %98 = load i32, i32* %24, align 4
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %101

100:                                              ; preds = %97
  br label %101

101:                                              ; preds = %100, %97
  %102 = phi i1 [ false, %97 ], [ true, %100 ]
  %103 = zext i1 %102 to i32
  store i32 %103, i32* %11, align 4
  br label %185

104:                                              ; preds = %92
  store i32 1, i32* %25, align 4
  %105 = load i32, i32* %22, align 4
  %106 = trunc i32 %105 to i16
  %107 = sext i16 %106 to i32
  %108 = sdiv i32 %107, -22471
  %109 = load i32, i32* %11, align 4
  %110 = and i32 %108, %109
  %111 = mul nsw i32 %110, 345997230
  %112 = load i16, i16* %8, align 2
  %113 = sext i16 %112 to i32
  %114 = icmp ne i32 %111, %113
  br i1 %114, label %115, label %141

115:                                              ; preds = %104
  store i16 12067, i16* %26, align 2
  store i32 -1625653766, i32* %27, align 4
  %116 = load i16, i16* %26, align 2
  %117 = icmp ne i16 %116, 0
  br i1 %117, label %118, label %123

118:                                              ; preds = %115
  store i32 -2005191657, i32* %28, align 4
  %119 = load i16, i16* %6, align 2
  %120 = zext i16 %119 to i32
  store i32 %120, i32* %28, align 4
  %121 = load i32, i32* %28, align 4
  %122 = sitofp i32 %121 to float
  store float %122, float* %5, align 4
  br label %1173

123:                                              ; preds = %115
  %124 = load i16, i16* %26, align 2
  %125 = zext i16 %124 to i32
  %126 = call float @func_50(i16 noundef zeroext -23946, i32 noundef %125)
  %127 = fptosi float %126 to i32
  store i32 %127, i32* %25, align 4
  %128 = load i16, i16* %9, align 2
  %129 = zext i16 %128 to i32
  %130 = sitofp i32 %129 to double
  %131 = fcmp oge double 0x43F91A424A000000, %130
  %132 = zext i1 %131 to i32
  store i32 %132, i32* %27, align 4
  %133 = sitofp i32 %132 to double
  %134 = fcmp oeq double %133, -9.687500e-01
  %135 = zext i1 %134 to i32
  store i32 %135, i32* %23, align 4
  br label %136

136:                                              ; preds = %123
  %137 = load i32, i32* %25, align 4
  %138 = sitofp i32 %137 to float
  %139 = load i32, i32* %7, align 4
  %140 = call i32 @func_58(float noundef %138, i32 noundef %139)
  store i32 %140, i32* %25, align 4
  br label %180

141:                                              ; preds = %104
  store i32 1197722961, i32* %29, align 4
  store i16 0, i16* %6, align 2
  br label %142

142:                                              ; preds = %170, %141
  %143 = load i16, i16* %6, align 2
  %144 = zext i16 %143 to i32
  %145 = icmp sgt i32 %144, 11
  br i1 %145, label %146, label %175

146:                                              ; preds = %142
  %147 = load i32, i32* %7, align 4
  %148 = icmp ugt i32 -1, %147
  %149 = zext i1 %148 to i32
  %150 = trunc i32 %149 to i16
  %151 = zext i16 %150 to i32
  %152 = load i32, i32* %29, align 4
  %153 = trunc i32 %152 to i16
  %154 = zext i16 %153 to i32
  %155 = ashr i32 %151, %154
  %156 = load i16, i16* %9, align 2
  %157 = zext i16 %156 to i32
  %158 = icmp ne i32 %155, %157
  %159 = zext i1 %158 to i32
  store i32 %159, i32* %19, align 4
  store i32 1, i32* %25, align 4
  %160 = load i16, i16* %6, align 2
  %161 = zext i16 %160 to i32
  %162 = call i32 @func_72(i16 noundef signext 1, i32 noundef %161)
  %163 = icmp ne i32 %162, 0
  br i1 %163, label %164, label %165

164:                                              ; preds = %146
  br label %165

165:                                              ; preds = %164, %146
  %166 = phi i1 [ false, %146 ], [ true, %164 ]
  %167 = zext i1 %166 to i32
  store i32 %167, i32* %20, align 4
  %168 = load i16, i16* %6, align 2
  %169 = uitofp i16 %168 to float
  store float %169, float* %5, align 4
  br label %1173

170:                                              ; No predecessors!
  %171 = load i16, i16* %6, align 2
  %172 = zext i16 %171 to i32
  %173 = add nsw i32 %172, 1
  %174 = trunc i32 %173 to i16
  store i16 %174, i16* %6, align 2
  br label %142, !llvm.loop !24

175:                                              ; preds = %142
  %176 = load i32, i32* %7, align 4
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %179

178:                                              ; preds = %175
  br label %315

179:                                              ; preds = %175
  br label %180

180:                                              ; preds = %179, %136
  %181 = load i32, i32* %20, align 4
  %182 = icmp ne i32 %181, 0
  br i1 %182, label %183, label %184

183:                                              ; preds = %180
  br label %315

184:                                              ; preds = %180
  br label %185

185:                                              ; preds = %184, %101
  store i32 0, i32* %23, align 4
  %186 = load i16, i16* %6, align 2
  %187 = zext i16 %186 to i32
  %188 = icmp ne i32 %187, 0
  %189 = zext i1 %188 to i32
  %190 = xor i32 %189, 150966615
  %191 = xor i32 %190, 3
  %192 = icmp eq i32 %191, 8506
  %193 = zext i1 %192 to i32
  %194 = icmp sle i32 %193, 849745896
  %195 = zext i1 %194 to i32
  %196 = load i32, i32* %20, align 4
  %197 = add nsw i32 %195, %196
  %198 = icmp ne i32 %197, 0
  br i1 %198, label %199, label %215

199:                                              ; preds = %185
  store i16 0, i16* %6, align 2
  br label %200

200:                                              ; preds = %209, %199
  %201 = load i16, i16* %6, align 2
  %202 = zext i16 %201 to i32
  %203 = icmp eq i32 %202, 15
  br i1 %203, label %204, label %214

204:                                              ; preds = %200
  store i32 -1484895609, i32* %30, align 4
  %205 = load i32, i32* %10, align 4
  %206 = sitofp i32 %205 to double
  %207 = fcmp olt double 0x4159EFF736000000, %206
  %208 = zext i1 %207 to i32
  store i32 %208, i32* %20, align 4
  br label %214

209:                                              ; No predecessors!
  %210 = load i16, i16* %6, align 2
  %211 = zext i16 %210 to i32
  %212 = add nsw i32 %211, 1
  %213 = trunc i32 %212 to i16
  store i16 %213, i16* %6, align 2
  br label %200, !llvm.loop !25

214:                                              ; preds = %204, %200
  br label %309

215:                                              ; preds = %185
  store i32 -1, i32* %31, align 4
  store i32 -844385706, i32* %23, align 4
  br i1 true, label %219, label %216

216:                                              ; preds = %215
  %217 = load i32, i32* %20, align 4
  %218 = icmp ne i32 %217, 0
  br i1 %218, label %219, label %226

219:                                              ; preds = %216, %215
  %220 = load i16, i16* %6, align 2
  %221 = zext i16 %220 to i32
  %222 = icmp ne i32 %221, 0
  br i1 %222, label %223, label %226

223:                                              ; preds = %219
  %224 = load i16, i16* %8, align 2
  %225 = sitofp i16 %224 to float
  store float %225, float* %5, align 4
  br label %1173

226:                                              ; preds = %219, %216
  store i16 -6622, i16* %32, align 2
  store i32 -3, i32* %33, align 4
  %227 = load i16, i16* %8, align 2
  %228 = sext i16 %227 to i32
  %229 = sitofp i32 %228 to double
  %230 = fcmp oeq double %229, 5.312500e-01
  %231 = zext i1 %230 to i32
  %232 = load i16, i16* %13, align 2
  %233 = zext i16 %232 to i32
  %234 = icmp eq i32 %231, %233
  %235 = zext i1 %234 to i32
  %236 = sitofp i32 %235 to float
  %237 = load i16, i16* %6, align 2
  %238 = uitofp i16 %237 to float
  %239 = fneg float %238
  %240 = call float @llvm.fmuladd.f32(float %236, float -3.625000e+00, float %239)
  %241 = load i16, i16* %9, align 2
  %242 = uitofp i16 %241 to float
  %243 = fsub float %240, %242
  %244 = load i16, i16* %21, align 2
  %245 = sext i16 %244 to i32
  %246 = sitofp i32 %245 to float
  %247 = fcmp une float %243, %246
  %248 = zext i1 %247 to i32
  %249 = sitofp i32 %248 to double
  %250 = fcmp oeq double %249, -2.500000e+00
  %251 = zext i1 %250 to i32
  %252 = sitofp i32 %251 to float
  %253 = fsub float %252, -6.622000e+03
  %254 = fptosi float %253 to i32
  store i32 %254, i32* %23, align 4
  %255 = sitofp i32 %254 to float
  %256 = load i16, i16* %6, align 2
  %257 = uitofp i16 %256 to float
  %258 = fsub float %255, %257
  %259 = fcmp une float %258, -1.000000e+00
  %260 = zext i1 %259 to i32
  %261 = load i16, i16* %6, align 2
  %262 = zext i16 %261 to i32
  %263 = icmp eq i32 %260, %262
  %264 = zext i1 %263 to i32
  %265 = load i16, i16* %8, align 2
  %266 = sext i16 %265 to i32
  %267 = icmp sle i32 %264, %266
  %268 = zext i1 %267 to i32
  %269 = load i16, i16* %6, align 2
  %270 = zext i16 %269 to i32
  %271 = icmp slt i32 %268, %270
  %272 = zext i1 %271 to i32
  store i32 %272, i32* %20, align 4
  store i32 %272, i32* %11, align 4
  %273 = load i32, i32* %10, align 4
  %274 = sitofp i32 %273 to float
  %275 = fdiv float -1.000000e+00, %274
  %276 = load i16, i16* %6, align 2
  %277 = zext i16 %276 to i32
  %278 = sitofp i32 %277 to float
  %279 = fcmp ole float %275, %278
  %280 = zext i1 %279 to i32
  %281 = sitofp i32 %280 to double
  %282 = fcmp oge double %281, 1.125000e+00
  %283 = zext i1 %282 to i32
  %284 = load i32, i32* %23, align 4
  %285 = icmp sle i32 %283, %284
  %286 = zext i1 %285 to i32
  %287 = load i32, i32* %23, align 4
  %288 = icmp slt i32 %286, %287
  %289 = zext i1 %288 to i32
  %290 = sitofp i32 %289 to float
  %291 = fmul float %290, 1.250000e+00
  %292 = load i16, i16* %8, align 2
  %293 = sext i16 %292 to i32
  %294 = sitofp i32 %293 to float
  %295 = fcmp oeq float %291, %294
  %296 = zext i1 %295 to i32
  %297 = load i32, i32* %7, align 4
  %298 = icmp ugt i32 %296, %297
  %299 = zext i1 %298 to i32
  %300 = sitofp i32 %299 to float
  %301 = load i16, i16* %6, align 2
  %302 = uitofp i16 %301 to float
  %303 = call float @llvm.fmuladd.f32(float %300, float %302, float -2.125000e+00)
  %304 = fsub float %303, -6.622000e+03
  %305 = fptosi float %304 to i32
  store i32 %305, i32* %33, align 4
  br label %306

306:                                              ; preds = %226
  %307 = load i16, i16* %6, align 2
  %308 = uitofp i16 %307 to float
  store float %308, float* %5, align 4
  br label %1173

309:                                              ; preds = %214
  br label %310

310:                                              ; preds = %309
  %311 = load i16, i16* %9, align 2
  %312 = zext i16 %311 to i32
  %313 = add nsw i32 %312, 1
  %314 = trunc i32 %313 to i16
  store i16 %314, i16* %9, align 2
  br label %88, !llvm.loop !26

315:                                              ; preds = %183, %178, %88
  store i32 0, i32* %20, align 4
  %316 = load i16, i16* %21, align 2
  %317 = sext i16 %316 to i32
  %318 = icmp sge i32 1, %317
  %319 = zext i1 %318 to i32
  %320 = load i32, i32* %7, align 4
  %321 = icmp uge i32 %319, %320
  %322 = zext i1 %321 to i32
  store i32 %322, i32* %11, align 4
  %323 = load i16, i16* %9, align 2
  %324 = zext i16 %323 to i32
  %325 = load i32, i32* %20, align 4
  %326 = icmp sgt i32 %324, %325
  %327 = zext i1 %326 to i32
  %328 = load i32, i32* %20, align 4
  %329 = icmp ne i32 %327, %328
  %330 = zext i1 %329 to i32
  %331 = load i16, i16* %8, align 2
  %332 = sext i16 %331 to i32
  %333 = xor i32 %330, %332
  %334 = trunc i32 %333 to i16
  %335 = sext i16 %334 to i32
  %336 = load i16, i16* %13, align 2
  %337 = sext i16 %336 to i32
  %338 = srem i32 %335, %337
  %339 = icmp slt i32 %338, 279267598
  %340 = zext i1 %339 to i32
  %341 = and i32 %340, -1
  store i32 %341, i32* %11, align 4
  br label %655

342:                                              ; preds = %80
  store i32 998681458, i32* %34, align 4
  store i32 -330512617, i32* %35, align 4
  store i32 1, i32* %36, align 4
  store i32 -7, i32* %37, align 4
  store i32 0, i32* %7, align 4
  br label %343

343:                                              ; preds = %583, %342
  %344 = load i32, i32* %7, align 4
  %345 = icmp ule i32 %344, 33
  br i1 %345, label %346, label %586

346:                                              ; preds = %343
  store i32 -9, i32* %38, align 4
  store i32 8, i32* %39, align 4
  %347 = load i16, i16* %6, align 2
  %348 = icmp ne i16 %347, 0
  br i1 %348, label %349, label %350

349:                                              ; preds = %346
  br label %586

350:                                              ; preds = %346
  %351 = load i16, i16* %6, align 2
  %352 = zext i16 %351 to i32
  store i32 %352, i32* %11, align 4
  %353 = load i32, i32* %38, align 4
  %354 = sitofp i32 %353 to float
  %355 = load i16, i16* %13, align 2
  %356 = uitofp i16 %355 to float
  %357 = fdiv float %354, %356
  %358 = load i32, i32* %38, align 4
  %359 = sitofp i32 %358 to float
  %360 = fcmp oeq float %357, %359
  %361 = zext i1 %360 to i32
  store i32 %361, i32* %39, align 4
  %362 = load i32, i32* %39, align 4
  %363 = load i32, i32* %34, align 4
  %364 = sdiv i32 %362, %363
  %365 = icmp ne i32 %364, 0
  br i1 %365, label %366, label %480

366:                                              ; preds = %350
  store i32 5, i32* %40, align 4
  store i32 1392450426, i32* %41, align 4
  %367 = load i32, i32* %34, align 4
  %368 = sitofp i32 %367 to float
  %369 = load i32, i32* %39, align 4
  %370 = sitofp i32 %369 to float
  %371 = fadd float %368, %370
  %372 = fpext float %371 to double
  %373 = fcmp ogt double %372, 0x422511625E000000
  %374 = zext i1 %373 to i32
  store i32 %374, i32* %34, align 4
  store i32 %374, i32* %39, align 4
  store i32 0, i32* %38, align 4
  br label %375

375:                                              ; preds = %476, %366
  %376 = load i32, i32* %38, align 4
  %377 = icmp sgt i32 %376, -10
  br i1 %377, label %378, label %479

378:                                              ; preds = %375
  store i32 1715502299, i32* %42, align 4
  store i32 0, i32* %43, align 4
  %379 = load i32, i32* %11, align 4
  store i32 %379, i32* %39, align 4
  %380 = load i16, i16* %6, align 2
  %381 = zext i16 %380 to i32
  %382 = icmp sle i32 %379, %381
  %383 = zext i1 %382 to i32
  %384 = trunc i32 %383 to i16
  %385 = sext i16 %384 to i32
  %386 = load i32, i32* %38, align 4
  %387 = trunc i32 %386 to i16
  %388 = sext i16 %387 to i32
  %389 = sub nsw i32 %385, %388
  %390 = load i32, i32* %34, align 4
  %391 = lshr i32 %389, %390
  %392 = load i32, i32* %38, align 4
  %393 = icmp eq i32 %391, %392
  %394 = zext i1 %393 to i32
  %395 = trunc i32 %394 to i16
  %396 = zext i16 %395 to i32
  %397 = load i32, i32* %40, align 4
  %398 = trunc i32 %397 to i16
  %399 = zext i16 %398 to i32
  %400 = ashr i32 %396, %399
  %401 = icmp ne i32 %400, 0
  br i1 %401, label %402, label %411

402:                                              ; preds = %378
  %403 = load i32, i32* %7, align 4
  %404 = load i32, i32* %7, align 4
  %405 = icmp ne i32 %403, %404
  %406 = zext i1 %405 to i32
  store i32 %406, i32* %42, align 4
  %407 = load i16, i16* %13, align 2
  %408 = icmp ne i16 %407, 0
  br i1 %408, label %409, label %410

409:                                              ; preds = %402
  br label %80

410:                                              ; preds = %402
  br label %416

411:                                              ; preds = %378
  store i32 0, i32* %34, align 4
  store i32 0, i32* %39, align 4
  %412 = load i32, i32* %40, align 4
  store i32 %412, i32* %34, align 4
  store i32 1, i32* %41, align 4
  store i32 -247961600, i32* %34, align 4
  %413 = load i32, i32* %39, align 4
  %414 = mul i32 -247961601, %413
  %415 = xor i32 %414, 8227
  store i32 %415, i32* %11, align 4
  br label %416

416:                                              ; preds = %411, %410
  %417 = load i32, i32* %41, align 4
  %418 = icmp ne i32 %417, 0
  br i1 %418, label %419, label %420

419:                                              ; preds = %416
  br label %479

420:                                              ; preds = %416
  %421 = load i32, i32* %39, align 4
  %422 = icmp ne i32 %421, 0
  br i1 %422, label %423, label %424

423:                                              ; preds = %420
  br label %80

424:                                              ; preds = %420
  store i32 0, i32* %34, align 4
  br label %425

425:                                              ; preds = %462, %424
  %426 = load i32, i32* %34, align 4
  %427 = icmp sgt i32 %426, 16
  br i1 %427, label %428, label %465

428:                                              ; preds = %425
  store i32 9, i32* %44, align 4
  %429 = load i32, i32* %40, align 4
  %430 = uitofp i32 %429 to float
  %431 = fdiv float %430, 9.000000e+00
  %432 = load i32, i32* %11, align 4
  %433 = sitofp i32 %432 to float
  %434 = fadd float %431, %433
  %435 = fptosi float %434 to i32
  store i32 %435, i32* %11, align 4
  store i32 %435, i32* %43, align 4
  %436 = load i32, i32* %34, align 4
  %437 = icmp sle i32 %435, %436
  %438 = zext i1 %437 to i32
  %439 = load i32, i32* %35, align 4
  %440 = icmp ne i32 %438, %439
  %441 = zext i1 %440 to i32
  %442 = load i16, i16* %9, align 2
  %443 = zext i16 %442 to i32
  %444 = icmp sle i32 %441, %443
  %445 = zext i1 %444 to i32
  store i32 %445, i32* %14, align 4
  %446 = load i32, i32* %7, align 4
  %447 = load i16, i16* %9, align 2
  %448 = zext i16 %447 to i32
  %449 = ashr i32 %446, %448
  %450 = load i32, i32* %40, align 4
  %451 = and i32 %449, %450
  %452 = srem i32 %451, 1276071194
  %453 = icmp ne i32 %452, 0
  br i1 %453, label %455, label %454

454:                                              ; preds = %428
  br label %455

455:                                              ; preds = %454, %428
  %456 = phi i1 [ true, %428 ], [ true, %454 ]
  %457 = zext i1 %456 to i32
  store i32 %457, i32* %36, align 4
  %458 = load i32, i32* %7, align 4
  %459 = icmp ne i32 %458, 0
  br i1 %459, label %460, label %461

460:                                              ; preds = %455
  br label %465

461:                                              ; preds = %455
  br label %462

462:                                              ; preds = %461
  %463 = load i32, i32* %34, align 4
  %464 = add nsw i32 %463, 1
  store i32 %464, i32* %34, align 4
  br label %425, !llvm.loop !27

465:                                              ; preds = %460, %425
  %466 = load i32, i32* %36, align 4
  %467 = load i16, i16* %6, align 2
  %468 = zext i16 %467 to i32
  %469 = and i32 %466, %468
  %470 = icmp sge i32 %469, 55042
  %471 = zext i1 %470 to i32
  store i32 %471, i32* %36, align 4
  %472 = sub nsw i32 0, %471
  %473 = udiv i32 %472, -1738811066
  %474 = icmp ne i32 %473, 1
  %475 = zext i1 %474 to i32
  store i32 %475, i32* %34, align 4
  br label %476

476:                                              ; preds = %465
  %477 = load i32, i32* %38, align 4
  %478 = sub nsw i32 %477, 1
  store i32 %478, i32* %38, align 4
  br label %375, !llvm.loop !28

479:                                              ; preds = %419, %375
  br label %572

480:                                              ; preds = %350
  store i32 4, i32* %45, align 4
  store i32 -1612121224, i32* %46, align 4
  %481 = load i32, i32* %45, align 4
  %482 = load i16, i16* %9, align 2
  %483 = zext i16 %482 to i32
  %484 = xor i32 %481, %483
  %485 = icmp ne i32 %484, 0
  br i1 %485, label %486, label %493

486:                                              ; preds = %480
  %487 = load i16, i16* %9, align 2
  %488 = zext i16 %487 to i32
  store i32 %488, i32* %11, align 4
  %489 = load i32, i32* %11, align 4
  %490 = icmp ne i32 %489, 0
  br i1 %490, label %491, label %492

491:                                              ; preds = %486
  br label %80

492:                                              ; preds = %486
  br label %509

493:                                              ; preds = %480
  store i32 8, i32* %47, align 4
  store i32 9, i32* %48, align 4
  store i32 -1, i32* %49, align 4
  %494 = load i32, i32* %47, align 4
  %495 = load i32, i32* %39, align 4
  %496 = add nsw i32 %494, %495
  %497 = load i32, i32* %39, align 4
  %498 = udiv i32 %496, %497
  %499 = load i32, i32* %7, align 4
  %500 = mul nsw i32 %498, %499
  %501 = trunc i32 %500 to i16
  %502 = zext i16 %501 to i32
  %503 = load i32, i32* %47, align 4
  %504 = trunc i32 %503 to i16
  %505 = zext i16 %504 to i32
  %506 = srem i32 %502, %505
  store i32 %506, i32* %46, align 4
  store i32 -1, i32* %48, align 4
  store i32 -1, i32* %34, align 4
  %507 = load i32, i32* %47, align 4
  %508 = and i32 -1, %507
  store i32 %508, i32* %49, align 4
  br label %509

509:                                              ; preds = %493, %492
  %510 = load i16, i16* %6, align 2
  %511 = zext i16 %510 to i32
  %512 = add nsw i32 65535, %511
  %513 = icmp ne i32 %512, 0
  br i1 %513, label %514, label %535

514:                                              ; preds = %509
  %515 = load i16, i16* %6, align 2
  %516 = zext i16 %515 to i32
  store i32 %516, i32* %11, align 4
  store i32 %516, i32* %46, align 4
  %517 = load i32, i32* %11, align 4
  %518 = icmp ne i32 %517, 0
  br i1 %518, label %519, label %520

519:                                              ; preds = %514
  br label %80

520:                                              ; preds = %514
  %521 = load i16, i16* %6, align 2
  %522 = uitofp i16 %521 to float
  %523 = fmul float 0x3AB395D940000000, %522
  %524 = load i16, i16* %9, align 2
  %525 = zext i16 %524 to i32
  %526 = sitofp i32 %525 to float
  %527 = fcmp ogt float %523, %526
  %528 = zext i1 %527 to i32
  %529 = sitofp i32 %528 to float
  %530 = fadd float %529, 0x3CFCB65E80000000
  %531 = fptosi float %530 to i32
  store i32 %531, i32* %34, align 4
  %532 = sitofp i32 %531 to double
  %533 = fcmp oge double %532, -3.625000e+00
  %534 = zext i1 %533 to i32
  store i32 %534, i32* %11, align 4
  br label %569

535:                                              ; preds = %509
  store i32 1059194637, i32* %50, align 4
  %536 = load i32, i32* %50, align 4
  %537 = ashr i32 %536, 6
  %538 = load i32, i32* %10, align 4
  %539 = mul i32 %537, %538
  %540 = load i32, i32* %11, align 4
  %541 = icmp ne i32 %539, %540
  %542 = zext i1 %541 to i32
  %543 = trunc i32 %542 to i16
  %544 = zext i16 %543 to i32
  %545 = mul nsw i32 %544, 0
  %546 = trunc i32 %545 to i16
  %547 = zext i16 %546 to i32
  %548 = load i16, i16* %9, align 2
  %549 = zext i16 %548 to i32
  %550 = shl i32 %547, %549
  %551 = ashr i32 %550, 13
  %552 = load i16, i16* %8, align 2
  %553 = sext i16 %552 to i32
  %554 = add i32 %551, %553
  %555 = trunc i32 %554 to i16
  %556 = zext i16 %555 to i32
  %557 = shl i32 %556, 1
  %558 = trunc i32 %557 to i16
  store i16 %558, i16* %6, align 2
  %559 = zext i16 %558 to i32
  %560 = icmp ne i32 %559, 0
  br i1 %560, label %564, label %561

561:                                              ; preds = %535
  %562 = load i32, i32* %36, align 4
  %563 = icmp ne i32 %562, 0
  br label %564

564:                                              ; preds = %561, %535
  %565 = phi i1 [ true, %535 ], [ %563, %561 ]
  %566 = zext i1 %565 to i32
  store i32 %566, i32* %14, align 4
  %567 = load i16, i16* %6, align 2
  %568 = uitofp i16 %567 to float
  store float %568, float* %5, align 4
  br label %1173

569:                                              ; preds = %520
  %570 = load i32, i32* %35, align 4
  %571 = uitofp i32 %570 to float
  store float %571, float* %5, align 4
  br label %1173

572:                                              ; preds = %479
  store i32 0, i32* %35, align 4
  br label %573

573:                                              ; preds = %579, %572
  %574 = load i32, i32* %35, align 4
  %575 = icmp uge i32 %574, 21
  br i1 %575, label %576, label %582

576:                                              ; preds = %573
  %577 = load i32, i32* %10, align 4
  %578 = sitofp i32 %577 to float
  store float %578, float* %5, align 4
  br label %1173

579:                                              ; No predecessors!
  %580 = load i32, i32* %35, align 4
  %581 = add i32 %580, 7
  store i32 %581, i32* %35, align 4
  br label %573, !llvm.loop !29

582:                                              ; preds = %573
  br label %583

583:                                              ; preds = %582
  %584 = load i32, i32* %7, align 4
  %585 = add i32 %584, 1
  store i32 %585, i32* %7, align 4
  br label %343, !llvm.loop !30

586:                                              ; preds = %349, %343
  %587 = load i32, i32* %36, align 4
  %588 = load i32, i32* %34, align 4
  %589 = icmp sle i32 %587, %588
  %590 = zext i1 %589 to i32
  %591 = load i16, i16* %9, align 2
  %592 = zext i16 %591 to i32
  %593 = icmp eq i32 %590, %592
  %594 = zext i1 %593 to i32
  %595 = load i16, i16* %8, align 2
  %596 = sext i16 %595 to i32
  %597 = icmp ne i32 %594, %596
  %598 = zext i1 %597 to i32
  store i32 %598, i32* %36, align 4
  %599 = sitofp i32 %598 to double
  %600 = fcmp oge double %599, 0x45DBD8BA00000000
  %601 = zext i1 %600 to i32
  %602 = icmp sle i32 %601, -1
  %603 = zext i1 %602 to i32
  %604 = sitofp i32 %603 to float
  %605 = load i16, i16* %8, align 2
  %606 = sitofp i16 %605 to float
  %607 = fsub float %604, %606
  %608 = load i32, i32* %35, align 4
  %609 = uitofp i32 %608 to float
  %610 = fcmp ole float %607, %609
  %611 = zext i1 %610 to i32
  %612 = sitofp i32 %611 to float
  %613 = fdiv float %612, 0x4239280C20000000
  %614 = load i16, i16* %6, align 2
  %615 = uitofp i16 %614 to float
  %616 = fsub float %613, %615
  %617 = load i32, i32* %7, align 4
  %618 = uitofp i32 %617 to float
  %619 = fmul float %616, %618
  %620 = fptosi float %619 to i32
  store i32 %620, i32* %34, align 4
  store i32 %620, i32* %37, align 4
  %621 = load i16, i16* %6, align 2
  %622 = zext i16 %621 to i32
  store i32 %622, i32* %11, align 4
  %623 = load i16, i16* %6, align 2
  %624 = zext i16 %623 to i32
  store i32 %624, i32* %34, align 4
  %625 = icmp ne i32 %624, 0
  br i1 %625, label %626, label %627

626:                                              ; preds = %586
  br label %627

627:                                              ; preds = %626, %586
  %628 = phi i1 [ false, %586 ], [ false, %626 ]
  %629 = zext i1 %628 to i32
  %630 = icmp eq i32 %629, 1
  %631 = zext i1 %630 to i32
  %632 = icmp sgt i32 %631, 13458
  br i1 %632, label %633, label %634

633:                                              ; preds = %627
  br label %634

634:                                              ; preds = %633, %627
  %635 = phi i1 [ false, %627 ], [ true, %633 ]
  %636 = zext i1 %635 to i32
  %637 = trunc i32 %636 to i16
  %638 = zext i16 %637 to i32
  %639 = add nsw i32 %638, 9
  %640 = load i16, i16* %8, align 2
  %641 = sext i16 %640 to i32
  %642 = icmp ne i32 %639, %641
  %643 = zext i1 %642 to i32
  %644 = icmp eq i32 %643, -1017428100
  %645 = zext i1 %644 to i32
  %646 = trunc i32 %645 to i16
  %647 = sext i16 %646 to i32
  %648 = load i32, i32* %37, align 4
  %649 = trunc i32 %648 to i16
  %650 = sext i16 %649 to i32
  %651 = srem i32 %647, %650
  store i32 %651, i32* %14, align 4
  store i32 %651, i32* %11, align 4
  %652 = load i32, i32* %14, align 4
  %653 = icmp uge i32 7, %652
  %654 = zext i1 %653 to i32
  store i32 %654, i32* %14, align 4
  br label %655

655:                                              ; preds = %634, %315
  %656 = load i16, i16* %8, align 2
  %657 = icmp ne i16 %656, 0
  br i1 %657, label %658, label %1151

658:                                              ; preds = %655
  store i32 8, i32* %51, align 4
  store i16 -4, i16* %52, align 2
  store i32 1, i32* %53, align 4
  store i32 1918035115, i32* %54, align 4
  %659 = load i32, i32* %14, align 4
  store i32 %659, i32* %51, align 4
  %660 = load i16, i16* %6, align 2
  %661 = zext i16 %660 to i32
  store i32 %661, i32* %14, align 4
  %662 = load i32, i32* %51, align 4
  %663 = sitofp i32 %662 to float
  %664 = load i16, i16* %9, align 2
  %665 = uitofp i16 %664 to float
  %666 = fadd float %663, %665
  %667 = fptosi float %666 to i32
  store i32 %667, i32* %51, align 4
  %668 = load i16, i16* %8, align 2
  %669 = sext i16 %668 to i32
  %670 = and i32 %669, 13342
  %671 = icmp sle i32 %670, 0
  %672 = zext i1 %671 to i32
  store i32 %672, i32* %51, align 4
  %673 = load i32, i32* %10, align 4
  %674 = load i16, i16* %8, align 2
  %675 = sext i16 %674 to i32
  %676 = icmp sle i32 %673, %675
  br i1 %676, label %677, label %693

677:                                              ; preds = %658
  store i16 -20294, i16* %55, align 2
  store i32 9, i32* %56, align 4
  %678 = load i32, i32* %7, align 4
  %679 = uitofp i32 %678 to float
  %680 = load i32, i32* %51, align 4
  %681 = sitofp i32 %680 to float
  %682 = fmul float %679, %681
  %683 = fcmp oge float %682, -2.029400e+04
  %684 = zext i1 %683 to i32
  %685 = sitofp i32 %684 to float
  %686 = load i32, i32* %51, align 4
  %687 = sitofp i32 %686 to float
  %688 = fmul float %685, %687
  %689 = load i32, i32* %51, align 4
  %690 = sitofp i32 %689 to float
  %691 = fcmp une float %688, %690
  %692 = zext i1 %691 to i32
  store i32 %692, i32* %56, align 4
  br label %1150

693:                                              ; preds = %658
  store float 9.375000e-01, float* %57, align 4
  store i32 4, i32* %58, align 4
  store i32 -1157143264, i32* %59, align 4
  store i32 -1633275720, i32* %60, align 4
  store i16 19, i16* %6, align 2
  br label %694

694:                                              ; preds = %886, %693
  %695 = load i16, i16* %6, align 2
  %696 = zext i16 %695 to i32
  %697 = icmp sge i32 %696, 22
  br i1 %697, label %698, label %891

698:                                              ; preds = %694
  store i32 7, i32* %61, align 4
  store i32 -1, i32* %62, align 4
  %699 = load i16, i16* %6, align 2
  %700 = zext i16 %699 to i32
  store i32 %700, i32* %51, align 4
  %701 = load i32, i32* %61, align 4
  %702 = icmp ne i32 %701, 0
  br i1 %702, label %703, label %704

703:                                              ; preds = %698
  br label %886

704:                                              ; preds = %698
  %705 = load i16, i16* %9, align 2
  %706 = zext i16 %705 to i32
  %707 = icmp ne i32 %706, 0
  %708 = zext i1 %707 to i32
  %709 = shl i32 %708, 29
  %710 = trunc i32 %709 to i16
  %711 = sext i16 %710 to i32
  %712 = shl i32 %711, 3
  %713 = trunc i32 %712 to i16
  %714 = zext i16 %713 to i32
  %715 = add nsw i32 %714, 65535
  %716 = icmp ne i32 %715, 0
  br i1 %716, label %717, label %718

717:                                              ; preds = %704
  br label %718

718:                                              ; preds = %717, %704
  %719 = phi i1 [ false, %704 ], [ true, %717 ]
  %720 = zext i1 %719 to i32
  %721 = icmp sgt i32 %720, -1
  %722 = zext i1 %721 to i32
  %723 = trunc i32 %722 to i16
  %724 = sext i16 %723 to i32
  %725 = ashr i32 %724, 4
  %726 = icmp ne i32 %725, 0
  br i1 %726, label %727, label %803

727:                                              ; preds = %718
  store i32 -1928139871, i32* %63, align 4
  store i32 266534995, i32* %64, align 4
  %728 = load i16, i16* %9, align 2
  %729 = sext i16 %728 to i32
  %730 = load i16, i16* %13, align 2
  %731 = sext i16 %730 to i32
  %732 = shl i32 %729, %731
  store i32 %732, i32* %63, align 4
  %733 = load i32, i32* %64, align 4
  %734 = icmp ugt i32 %732, %733
  %735 = zext i1 %734 to i32
  store i32 %735, i32* %58, align 4
  %736 = xor i32 %735, 6
  %737 = load i16, i16* %6, align 2
  %738 = zext i16 %737 to i32
  %739 = xor i32 %736, %738
  %740 = icmp ne i32 %739, 0
  br i1 %740, label %744, label %741

741:                                              ; preds = %727
  %742 = load i32, i32* %51, align 4
  %743 = icmp ne i32 %742, 0
  br i1 %743, label %744, label %747

744:                                              ; preds = %741, %727
  %745 = load i32, i32* %61, align 4
  %746 = icmp ne i32 %745, 0
  br label %747

747:                                              ; preds = %744, %741
  %748 = phi i1 [ false, %741 ], [ %746, %744 ]
  %749 = zext i1 %748 to i32
  %750 = trunc i32 %749 to i16
  %751 = zext i16 %750 to i32
  %752 = mul nsw i32 %751, 0
  %753 = xor i32 %752, 6
  %754 = load i16, i16* %6, align 2
  %755 = zext i16 %754 to i32
  %756 = shl i32 %753, %755
  store i32 %756, i32* %14, align 4
  store i32 142015180, i32* %62, align 4
  %757 = load i32, i32* %58, align 4
  %758 = load i16, i16* %6, align 2
  %759 = zext i16 %758 to i32
  %760 = icmp ne i32 %757, %759
  %761 = zext i1 %760 to i32
  %762 = sitofp i32 %761 to float
  %763 = fsub float %762, 1.650000e+01
  %764 = fptosi float %763 to i32
  store i32 %764, i32* %14, align 4
  %765 = load i32, i32* %7, align 4
  %766 = uitofp i32 %765 to double
  %767 = fcmp ogt double -7.187500e-01, %766
  %768 = zext i1 %767 to i32
  %769 = sitofp i32 %768 to double
  %770 = fcmp une double %769, 7.250000e+00
  %771 = zext i1 %770 to i32
  %772 = sitofp i32 %771 to float
  %773 = load i16, i16* %6, align 2
  %774 = uitofp i16 %773 to float
  %775 = fadd float %772, %774
  %776 = fpext float %775 to double
  %777 = fcmp oeq double %776, -3.500000e+00
  %778 = zext i1 %777 to i32
  %779 = load i32, i32* %62, align 4
  %780 = icmp sgt i32 %778, %779
  %781 = zext i1 %780 to i32
  %782 = sitofp i32 %781 to float
  %783 = load i32, i32* %58, align 4
  %784 = sitofp i32 %783 to float
  %785 = fdiv float %782, %784
  %786 = fptosi float %785 to i32
  store i32 %786, i32* %58, align 4
  %787 = sitofp i32 %786 to float
  %788 = load float, float* %15, align 4
  %789 = fcmp ogt float %787, %788
  %790 = zext i1 %789 to i32
  store i32 %790, i32* %64, align 4
  %791 = sitofp i32 %790 to double
  %792 = fcmp olt double %791, 0x3E4981F5C8000000
  %793 = zext i1 %792 to i32
  store i32 %793, i32* %14, align 4
  store i32 5, i32* %14, align 4
  br label %794

794:                                              ; preds = %799, %747
  %795 = load i32, i32* %14, align 4
  %796 = icmp ne i32 %795, 16
  br i1 %796, label %797, label %802

797:                                              ; preds = %794
  %798 = load i32, i32* %58, align 4
  store i32 %798, i32* %51, align 4
  store i32 570952414, i32* %64, align 4
  store i32 570952414, i32* %11, align 4
  store i32 570952414, i32* %16, align 4
  br label %799

799:                                              ; preds = %797
  %800 = load i32, i32* %14, align 4
  %801 = add nsw i32 %800, 1
  store i32 %801, i32* %14, align 4
  br label %794, !llvm.loop !31

802:                                              ; preds = %794
  br label %880

803:                                              ; preds = %718
  store i32 0, i32* %11, align 4
  br label %804

804:                                              ; preds = %823, %803
  %805 = load i32, i32* %11, align 4
  %806 = icmp sgt i32 %805, 25
  br i1 %806, label %807, label %826

807:                                              ; preds = %804
  store i32 2012917786, i32* %65, align 4
  %808 = load i32, i32* %61, align 4
  %809 = uitofp i32 %808 to double
  %810 = fcmp oge double %809, 0x3C08D74FE0000000
  %811 = zext i1 %810 to i32
  store i32 %811, i32* %62, align 4
  %812 = load i32, i32* %7, align 4
  %813 = trunc i32 %812 to i16
  %814 = zext i16 %813 to i32
  %815 = sub nsw i32 8, %814
  store i32 %815, i32* %65, align 4
  %816 = load i16, i16* %52, align 2
  %817 = sext i16 %816 to i32
  %818 = icmp sle i32 1, %817
  %819 = zext i1 %818 to i32
  %820 = load i16, i16* %6, align 2
  %821 = zext i16 %820 to i32
  %822 = mul nsw i32 %819, %821
  store i32 %822, i32* %65, align 4
  br label %823

823:                                              ; preds = %807
  %824 = load i32, i32* %11, align 4
  %825 = add nsw i32 %824, 1
  store i32 %825, i32* %11, align 4
  br label %804, !llvm.loop !32

826:                                              ; preds = %804
  %827 = load i32, i32* %7, align 4
  store i32 %827, i32* %58, align 4
  %828 = sitofp i32 %827 to double
  %829 = fcmp une double %828, 3.468750e+00
  %830 = zext i1 %829 to i32
  %831 = sitofp i32 %830 to float
  %832 = load i32, i32* %14, align 4
  %833 = sitofp i32 %832 to float
  %834 = fdiv float %831, %833
  %835 = load i16, i16* %6, align 2
  %836 = zext i16 %835 to i32
  %837 = sitofp i32 %836 to float
  %838 = fcmp olt float %834, %837
  %839 = zext i1 %838 to i32
  %840 = load i16, i16* %52, align 2
  %841 = sext i16 %840 to i32
  %842 = icmp sgt i32 %839, %841
  %843 = zext i1 %842 to i32
  %844 = sitofp i32 %843 to float
  %845 = load i32, i32* %10, align 4
  %846 = sitofp i32 %845 to float
  %847 = fsub float %844, %846
  %848 = load i32, i32* %7, align 4
  %849 = uitofp i32 %848 to float
  %850 = fcmp ole float %847, %849
  %851 = zext i1 %850 to i32
  %852 = load i16, i16* %8, align 2
  %853 = sext i16 %852 to i32
  %854 = icmp sle i32 %851, %853
  %855 = zext i1 %854 to i32
  %856 = sitofp i32 %855 to float
  %857 = fadd float %856, 0x3E294D2FA0000000
  %858 = load i16, i16* %6, align 2
  %859 = zext i16 %858 to i32
  %860 = sitofp i32 %859 to float
  %861 = fcmp olt float %857, %860
  %862 = zext i1 %861 to i32
  %863 = load i32, i32* %10, align 4
  %864 = icmp sle i32 %862, %863
  %865 = zext i1 %864 to i32
  store i32 %865, i32* %62, align 4
  store i32 -3, i32* %61, align 4
  br label %866

866:                                              ; preds = %876, %826
  %867 = load i32, i32* %61, align 4
  %868 = icmp eq i32 %867, 20
  br i1 %868, label %869, label %879

869:                                              ; preds = %866
  %870 = load i32, i32* %62, align 4
  %871 = icmp ne i32 %870, 0
  br i1 %871, label %872, label %873

872:                                              ; preds = %869
  br label %879

873:                                              ; preds = %869
  %874 = load i32, i32* %10, align 4
  %875 = sitofp i32 %874 to float
  store float %875, float* %5, align 4
  br label %1173

876:                                              ; No predecessors!
  %877 = load i32, i32* %61, align 4
  %878 = add i32 %877, 1
  store i32 %878, i32* %61, align 4
  br label %866, !llvm.loop !33

879:                                              ; preds = %872, %866
  br label %880

880:                                              ; preds = %879, %802
  %881 = load i16, i16* %6, align 2
  %882 = zext i16 %881 to i32
  store i32 %882, i32* %14, align 4
  %883 = load i32, i32* %59, align 4
  %884 = icmp uge i32 0, %883
  %885 = zext i1 %884 to i32
  store i32 %885, i32* %62, align 4
  br label %886

886:                                              ; preds = %880, %703
  %887 = load i16, i16* %6, align 2
  %888 = zext i16 %887 to i32
  %889 = add nsw i32 %888, 1
  %890 = trunc i32 %889 to i16
  store i16 %890, i16* %6, align 2
  br label %694, !llvm.loop !34

891:                                              ; preds = %694
  %892 = load i32, i32* %16, align 4
  store i32 %892, i32* %14, align 4
  %893 = load i32, i32* %14, align 4
  %894 = trunc i32 %893 to i16
  %895 = zext i16 %894 to i32
  %896 = load i32, i32* %59, align 4
  %897 = trunc i32 %896 to i16
  %898 = zext i16 %897 to i32
  %899 = shl i32 %895, %898
  %900 = load i32, i32* %58, align 4
  %901 = xor i32 %899, %900
  %902 = load i16, i16* %8, align 2
  %903 = sext i16 %902 to i32
  %904 = or i32 %901, %903
  store i32 %904, i32* %51, align 4
  %905 = load i32, i32* %59, align 4
  %906 = trunc i32 %905 to i16
  %907 = zext i16 %906 to i32
  %908 = load i16, i16* %9, align 2
  %909 = zext i16 %908 to i32
  %910 = mul nsw i32 %907, %909
  %911 = load i16, i16* %6, align 2
  %912 = zext i16 %911 to i32
  %913 = and i32 %910, %912
  store i32 %913, i32* %51, align 4
  store i16 -15, i16* %52, align 2
  br label %914

914:                                              ; preds = %1144, %891
  %915 = load i16, i16* %52, align 2
  %916 = sext i16 %915 to i32
  %917 = icmp ne i32 %916, 10
  br i1 %917, label %918, label %1149

918:                                              ; preds = %914
  store i16 0, i16* %66, align 2
  store i32 -2124741614, i32* %67, align 4
  store float 0x3CE9A8E180000000, float* %68, align 4
  store float 1.250000e-01, float* %69, align 4
  %919 = load i32, i32* %59, align 4
  %920 = load i16, i16* %6, align 2
  %921 = zext i16 %920 to i32
  %922 = sub i32 %919, %921
  %923 = load i32, i32* %7, align 4
  %924 = xor i32 %922, %923
  %925 = or i32 %924, -2042425251
  %926 = trunc i32 %925 to i16
  %927 = sext i16 %926 to i32
  %928 = load i32, i32* %60, align 4
  %929 = trunc i32 %928 to i16
  %930 = sext i16 %929 to i32
  %931 = srem i32 %927, %930
  store i32 %931, i32* %51, align 4
  store i32 24, i32* %60, align 4
  br label %932

932:                                              ; preds = %945, %918
  %933 = load i32, i32* %60, align 4
  %934 = icmp slt i32 %933, 25
  br i1 %934, label %935, label %948

935:                                              ; preds = %932
  %936 = load i16, i16* %6, align 2
  %937 = zext i16 %936 to i32
  %938 = sitofp i32 %937 to float
  %939 = load float, float* %17, align 4
  %940 = fcmp oge float %938, %939
  %941 = zext i1 %940 to i32
  %942 = sitofp i32 %941 to float
  %943 = fdiv float %942, 0.000000e+00
  %944 = fptosi float %943 to i32
  store i32 %944, i32* %11, align 4
  br label %945

945:                                              ; preds = %935
  %946 = load i32, i32* %60, align 4
  %947 = add nsw i32 %946, 9
  store i32 %947, i32* %60, align 4
  br label %932, !llvm.loop !35

948:                                              ; preds = %932
  store i16 0, i16* %6, align 2
  br label %949

949:                                              ; preds = %969, %948
  %950 = load i16, i16* %6, align 2
  %951 = zext i16 %950 to i32
  %952 = icmp sgt i32 %951, 7
  br i1 %952, label %953, label %974

953:                                              ; preds = %949
  store i16 8, i16* %70, align 2
  store i32 1, i32* %71, align 4
  %954 = load i16, i16* %52, align 2
  %955 = sitofp i16 %954 to float
  %956 = fdiv float %955, 0x3A6E051B60000000
  %957 = fsub float %956, 0x414A24D2C0000000
  %958 = fptosi float %957 to i32
  store i32 %958, i32* %16, align 4
  %959 = load i32, i32* %14, align 4
  %960 = load i16, i16* %70, align 2
  %961 = sext i16 %960 to i32
  %962 = icmp sgt i32 %959, %961
  %963 = zext i1 %962 to i32
  %964 = load i16, i16* %6, align 2
  %965 = zext i16 %964 to i32
  %966 = icmp sle i32 %963, %965
  %967 = zext i1 %966 to i32
  %968 = udiv i32 %967, 1
  store i32 %968, i32* %53, align 4
  store i32 0, i32* %71, align 4
  br label %969

969:                                              ; preds = %953
  %970 = load i16, i16* %6, align 2
  %971 = zext i16 %970 to i32
  %972 = add nsw i32 %971, 1
  %973 = trunc i32 %972 to i16
  store i16 %973, i16* %6, align 2
  br label %949, !llvm.loop !36

974:                                              ; preds = %949
  %975 = load i16, i16* %8, align 2
  %976 = icmp ne i16 %975, 0
  br i1 %976, label %977, label %978

977:                                              ; preds = %974
  br label %1144

978:                                              ; preds = %974
  %979 = load i16, i16* %52, align 2
  %980 = icmp ne i16 %979, 0
  br i1 %980, label %981, label %982

981:                                              ; preds = %978
  store i32 27579, i32* %51, align 4
  br label %1143

982:                                              ; preds = %978
  store i32 1, i32* %72, align 4
  store i32 1644552826, i32* %73, align 4
  %983 = load i32, i32* %60, align 4
  %984 = icmp ne i32 %983, 0
  br i1 %984, label %988, label %985

985:                                              ; preds = %982
  %986 = load i32, i32* %72, align 4
  %987 = icmp ne i32 %986, 0
  br label %988

988:                                              ; preds = %985, %982
  %989 = phi i1 [ true, %982 ], [ %987, %985 ]
  %990 = zext i1 %989 to i32
  %991 = trunc i32 %990 to i16
  %992 = zext i16 %991 to i32
  %993 = sub nsw i32 %992, 1
  %994 = icmp ne i32 %993, 0
  br i1 %994, label %1000, label %995

995:                                              ; preds = %988
  br i1 true, label %1000, label %996

996:                                              ; preds = %995
  %997 = load i16, i16* %6, align 2
  %998 = zext i16 %997 to i32
  %999 = icmp ne i32 %998, 0
  br label %1000

1000:                                             ; preds = %996, %995, %988
  %1001 = phi i1 [ true, %995 ], [ true, %988 ], [ %999, %996 ]
  %1002 = zext i1 %1001 to i32
  store i32 %1002, i32* %73, align 4
  store i32 0, i32* %53, align 4
  br label %1003

1003:                                             ; preds = %1014, %1000
  %1004 = load i32, i32* %53, align 4
  %1005 = icmp ule i32 %1004, 60
  br i1 %1005, label %1006, label %1017

1006:                                             ; preds = %1003
  store i16 -24156, i16* %74, align 2
  %1007 = load i16, i16* %8, align 2
  %1008 = sext i16 %1007 to i32
  %1009 = icmp sle i32 0, %1008
  %1010 = zext i1 %1009 to i32
  %1011 = trunc i32 %1010 to i16
  store i16 %1011, i16* %74, align 2
  %1012 = load i32, i32* %7, align 4
  %1013 = uitofp i32 %1012 to float
  store float %1013, float* %5, align 4
  br label %1173

1014:                                             ; No predecessors!
  %1015 = load i32, i32* %53, align 4
  %1016 = add i32 %1015, 1
  store i32 %1016, i32* %53, align 4
  br label %1003, !llvm.loop !37

1017:                                             ; preds = %1003
  %1018 = load i32, i32* %7, align 4
  %1019 = trunc i32 %1018 to i16
  %1020 = sext i16 %1019 to i32
  %1021 = ashr i32 %1020, 4
  store i32 %1021, i32* %14, align 4
  store i32 %1021, i32* %58, align 4
  %1022 = icmp ne i32 %1021, 0
  br i1 %1022, label %1031, label %1023

1023:                                             ; preds = %1017
  %1024 = load i16, i16* %9, align 2
  %1025 = zext i16 %1024 to i32
  %1026 = icmp ne i32 %1025, 0
  br i1 %1026, label %1031, label %1027

1027:                                             ; preds = %1023
  %1028 = load i16, i16* %8, align 2
  %1029 = sext i16 %1028 to i32
  %1030 = icmp ne i32 %1029, 0
  br label %1031

1031:                                             ; preds = %1027, %1023, %1017
  %1032 = phi i1 [ true, %1023 ], [ true, %1017 ], [ %1030, %1027 ]
  %1033 = zext i1 %1032 to i32
  store i32 %1033, i32* %67, align 4
  br i1 %1032, label %1034, label %1130

1034:                                             ; preds = %1031
  br i1 false, label %1035, label %1130

1035:                                             ; preds = %1034
  store i32 -1344315203, i32* %75, align 4
  store i32 -8, i32* %76, align 4
  %1036 = load i16, i16* %6, align 2
  %1037 = zext i16 %1036 to i32
  %1038 = load i32, i32* %67, align 4
  %1039 = icmp slt i32 %1037, %1038
  %1040 = zext i1 %1039 to i32
  %1041 = load i32, i32* %53, align 4
  %1042 = icmp ugt i32 %1040, %1041
  %1043 = zext i1 %1042 to i32
  %1044 = sitofp i32 %1043 to float
  %1045 = load i32, i32* %73, align 4
  %1046 = sitofp i32 %1045 to float
  %1047 = fmul float %1044, %1046
  %1048 = fptoui float %1047 to i32
  store i32 %1048, i32* %75, align 4
  store i32 %1048, i32* %51, align 4
  store i32 %1048, i32* %67, align 4
  %1049 = sitofp i32 %1048 to float
  %1050 = load i32, i32* %73, align 4
  %1051 = sitofp i32 %1050 to float
  %1052 = fadd float %1049, %1051
  %1053 = load i32, i32* %7, align 4
  %1054 = uitofp i32 %1053 to float
  %1055 = fcmp oeq float %1052, %1054
  %1056 = zext i1 %1055 to i32
  store i32 %1056, i32* %58, align 4
  %1057 = sitofp i32 %1056 to double
  %1058 = fcmp une double %1057, 0x4548FB386E000000
  %1059 = zext i1 %1058 to i32
  %1060 = load i16, i16* %8, align 2
  %1061 = sext i16 %1060 to i32
  %1062 = icmp eq i32 %1059, %1061
  %1063 = zext i1 %1062 to i32
  %1064 = sitofp i32 %1063 to double
  %1065 = fcmp olt double %1064, -1.812500e+01
  %1066 = zext i1 %1065 to i32
  %1067 = icmp slt i32 %1066, 0
  %1068 = zext i1 %1067 to i32
  %1069 = load i32, i32* %7, align 4
  %1070 = icmp uge i32 %1068, %1069
  %1071 = zext i1 %1070 to i32
  %1072 = load i32, i32* %7, align 4
  %1073 = icmp ule i32 %1071, %1072
  %1074 = zext i1 %1073 to i32
  %1075 = load i16, i16* %9, align 2
  %1076 = zext i16 %1075 to i32
  %1077 = icmp sle i32 %1074, %1076
  %1078 = zext i1 %1077 to i32
  %1079 = sitofp i32 %1078 to float
  %1080 = load i16, i16* %8, align 2
  %1081 = sitofp i16 %1080 to float
  %1082 = fdiv float %1079, %1081
  %1083 = fptosi float %1082 to i32
  store i32 %1083, i32* %54, align 4
  store i32 -937462949, i32* %58, align 4
  %1084 = load i16, i16* %8, align 2
  %1085 = sext i16 %1084 to i32
  %1086 = load i32, i32* %73, align 4
  %1087 = icmp ne i32 %1085, %1086
  br i1 %1087, label %1091, label %1088

1088:                                             ; preds = %1035
  %1089 = load i32, i32* %75, align 4
  %1090 = icmp ne i32 %1089, 0
  br label %1091

1091:                                             ; preds = %1088, %1035
  %1092 = phi i1 [ true, %1035 ], [ %1090, %1088 ]
  %1093 = zext i1 %1092 to i32
  store i32 %1093, i32* %76, align 4
  %1094 = load i32, i32* %72, align 4
  %1095 = and i32 %1093, %1094
  %1096 = load i32, i32* %60, align 4
  %1097 = or i32 %1095, %1096
  %1098 = load i32, i32* %73, align 4
  %1099 = icmp sle i32 %1097, %1098
  %1100 = zext i1 %1099 to i32
  %1101 = icmp eq i32 %1100, 2123870232
  %1102 = zext i1 %1101 to i32
  store i32 %1102, i32* %73, align 4
  %1103 = load i16, i16* %13, align 2
  %1104 = zext i16 %1103 to i32
  store i32 %1104, i32* %76, align 4
  store i32 0, i32* %73, align 4
  %1105 = load i32, i32* %53, align 4
  %1106 = sub i32 16157, %1105
  %1107 = trunc i32 %1106 to i16
  %1108 = sext i16 %1107 to i32
  %1109 = load i16, i16* %8, align 2
  %1110 = sext i16 %1109 to i32
  %1111 = ashr i32 %1108, %1110
  %1112 = trunc i32 %1111 to i16
  %1113 = sext i16 %1112 to i32
  %1114 = load i32, i32* %7, align 4
  %1115 = trunc i32 %1114 to i16
  %1116 = sext i16 %1115 to i32
  %1117 = add nsw i32 %1113, %1116
  %1118 = load i16, i16* %9, align 2
  %1119 = zext i16 %1118 to i32
  %1120 = shl i32 %1117, %1119
  %1121 = icmp ne i32 %1120, 0
  br i1 %1121, label %1122, label %1125

1122:                                             ; preds = %1091
  %1123 = load i32, i32* %7, align 4
  %1124 = icmp ne i32 %1123, 0
  br label %1125

1125:                                             ; preds = %1122, %1091
  %1126 = phi i1 [ false, %1091 ], [ %1124, %1122 ]
  %1127 = zext i1 %1126 to i32
  %1128 = load i32, i32* %58, align 4
  %1129 = and i32 %1127, %1128
  store i32 %1129, i32* %58, align 4
  br label %1142

1130:                                             ; preds = %1034, %1031
  store i32 2, i32* %77, align 4
  store i32 0, i32* %54, align 4
  %1131 = load i32, i32* %72, align 4
  %1132 = icmp sge i32 1, %1131
  br i1 %1132, label %1137, label %1133

1133:                                             ; preds = %1130
  %1134 = load i16, i16* %6, align 2
  %1135 = zext i16 %1134 to i32
  %1136 = icmp ne i32 %1135, 0
  br label %1137

1137:                                             ; preds = %1133, %1130
  %1138 = phi i1 [ true, %1130 ], [ %1136, %1133 ]
  %1139 = zext i1 %1138 to i32
  %1140 = icmp sge i32 %1139, 31198
  %1141 = zext i1 %1140 to i32
  store i32 %1141, i32* %77, align 4
  br label %1142

1142:                                             ; preds = %1137, %1125
  br label %1143

1143:                                             ; preds = %1142, %981
  br label %1144

1144:                                             ; preds = %1143, %977
  %1145 = load i16, i16* %52, align 2
  %1146 = sext i16 %1145 to i32
  %1147 = add nsw i32 %1146, 1
  %1148 = trunc i32 %1147 to i16
  store i16 %1148, i16* %52, align 2
  br label %914, !llvm.loop !38

1149:                                             ; preds = %914
  br label %1150

1150:                                             ; preds = %1149, %677
  br label %1155

1151:                                             ; preds = %655
  store i32 1687162469, i32* %78, align 4
  store i32 -2, i32* %79, align 4
  %1152 = load i32, i32* %14, align 4
  store i32 %1152, i32* %11, align 4
  store i32 %1152, i32* %78, align 4
  %1153 = icmp ule i32 %1152, 1284258793
  %1154 = zext i1 %1153 to i32
  store i32 %1154, i32* %79, align 4
  br label %1155

1155:                                             ; preds = %1151, %1150
  %1156 = load i32, i32* %11, align 4
  store i32 %1156, i32* %14, align 4
  %1157 = sitofp i32 %1156 to float
  %1158 = load float, float* %18, align 4
  %1159 = fadd float %1157, %1158
  %1160 = load i16, i16* %13, align 2
  %1161 = uitofp i16 %1160 to float
  %1162 = fadd float %1159, %1161
  %1163 = load i16, i16* %9, align 2
  %1164 = uitofp i16 %1163 to float
  %1165 = fadd float %1162, %1164
  %1166 = load i16, i16* %9, align 2
  %1167 = zext i16 %1166 to i32
  %1168 = sitofp i32 %1167 to float
  %1169 = fcmp une float %1165, %1168
  %1170 = zext i1 %1169 to i32
  store i32 %1170, i32* %16, align 4
  %1171 = load i32, i32* %7, align 4
  %1172 = uitofp i32 %1171 to float
  store float %1172, float* %5, align 4
  br label %1173

1173:                                             ; preds = %1155, %1006, %873, %576, %569, %564, %306, %223, %165, %118
  %1174 = load float, float* %5, align 4
  ret float %1174
}

define internal float @func_50(i16 noundef zeroext %0, i32 noundef %1) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i32, align 4
  store i16 %0, i16* %3, align 2
  store i32 %1, i32* %4, align 4
  %5 = load i16, i16* %3, align 2
  %6 = uitofp i16 %5 to float
  ret float %6
}

define internal i32 @func_58(float noundef %0, i32 noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store float %0, float* %3, align 4
  store i32 %1, i32* %4, align 4
  store i32 -1, i32* %5, align 4
  store i32 7, i32* %6, align 4
  store i32 -8349, i32* %5, align 4
  store i32 0, i32* %6, align 4
  %7 = load i32, i32* %4, align 4
  ret i32 %7
}

define internal i32 @func_72(i16 noundef signext %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i16, align 2
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca float, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca float, align 4
  %13 = alloca i16, align 2
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i16, align 2
  %19 = alloca i32, align 4
  %20 = alloca float, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i16, align 2
  %24 = alloca i32, align 4
  %25 = alloca i16, align 2
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca float, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca float, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i16, align 2
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  store i16 %0, i16* %4, align 2
  store i32 %1, i32* %5, align 4
  store i32 -3, i32* %6, align 4
  store i32 -1, i32* %7, align 4
  store i32 -131730986, i32* %8, align 4
  br label %43

43:                                               ; preds = %273, %2
  %44 = load i32, i32* %6, align 4
  %45 = icmp ne i32 5706, %44
  %46 = zext i1 %45 to i32
  %47 = load i32, i32* %5, align 4
  %48 = sub nsw i32 %46, %47
  %49 = trunc i32 %48 to i16
  %50 = load i32, i32* %6, align 4
  %51 = sitofp i32 %50 to float
  %52 = load i32, i32* %6, align 4
  %53 = load i16, i16* %4, align 2
  %54 = call zeroext i16 @func_77(i16 noundef zeroext %49, float noundef %51, i32 noundef %52, i16 noundef signext %53)
  %55 = zext i16 %54 to i32
  store i32 %55, i32* %6, align 4
  %56 = trunc i32 %55 to i16
  %57 = load i32, i32* %7, align 4
  %58 = call float @func_50(i16 noundef zeroext %56, i32 noundef %57)
  %59 = fsub float %58, 9.375000e-02
  %60 = load i32, i32* %7, align 4
  %61 = call i32 @func_58(float noundef %59, i32 noundef %60)
  store i32 %61, i32* %7, align 4
  %62 = load i32, i32* %7, align 4
  %63 = load i16, i16* %4, align 2
  %64 = sext i16 %63 to i32
  %65 = srem i32 %62, %64
  %66 = trunc i32 %65 to i16
  %67 = sext i16 %66 to i32
  %68 = sdiv i32 %67, -3897
  store i32 %68, i32* %5, align 4
  store i32 11, i32* %6, align 4
  br label %69

69:                                               ; preds = %724, %43
  %70 = load i32, i32* %6, align 4
  %71 = icmp ne i32 %70, 24
  br i1 %71, label %72, label %727

72:                                               ; preds = %69
  store float 0x43B8DEBC40000000, float* %9, align 4
  store i32 2125607959, i32* %10, align 4
  store i32 1, i32* %11, align 4
  store float 0x3D07B32300000000, float* %12, align 4
  store i32 0, i32* %7, align 4
  br label %73

73:                                               ; preds = %691, %72
  %74 = load i32, i32* %7, align 4
  %75 = icmp slt i32 %74, -16
  br i1 %75, label %76, label %694

76:                                               ; preds = %73
  store i16 1810, i16* %13, align 2
  store i32 -1, i32* %14, align 4
  store i32 337278945, i32* %15, align 4
  store i32 6, i32* %16, align 4
  store i32 -1, i32* %17, align 4
  store i32 0, i32* %5, align 4
  br label %77

77:                                               ; preds = %92, %76
  %78 = load i32, i32* %5, align 4
  %79 = icmp sgt i32 %78, -18
  br i1 %79, label %80, label %95

80:                                               ; preds = %77
  %81 = load i32, i32* %5, align 4
  %82 = load i16, i16* %13, align 2
  %83 = sext i16 %82 to i32
  %84 = icmp eq i32 %81, %83
  %85 = zext i1 %84 to i32
  %86 = and i32 %85, 0
  %87 = xor i32 %86, -1
  store i32 %87, i32* %8, align 4
  store i32 %87, i32* %10, align 4
  %88 = load i16, i16* %4, align 2
  %89 = sext i16 %88 to i32
  %90 = icmp sge i32 -1, %89
  %91 = zext i1 %90 to i32
  store i32 %91, i32* %10, align 4
  br label %92

92:                                               ; preds = %80
  %93 = load i32, i32* %5, align 4
  %94 = sub nsw i32 %93, 1
  store i32 %94, i32* %5, align 4
  br label %77, !llvm.loop !39

95:                                               ; preds = %77
  store i32 0, i32* %5, align 4
  br label %96

96:                                               ; preds = %363, %95
  %97 = load i32, i32* %5, align 4
  %98 = icmp sge i32 %97, -27
  br i1 %98, label %99, label %366

99:                                               ; preds = %96
  store i16 29721, i16* %18, align 2
  store i32 5, i32* %19, align 4
  %100 = load i16, i16* %13, align 2
  %101 = zext i16 %100 to i32
  %102 = srem i32 %101, 1
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %153

104:                                              ; preds = %99
  store float -1.112500e+01, float* %20, align 4
  store i32 1222061455, i32* %21, align 4
  store i32 -541777909, i32* %22, align 4
  %105 = load i16, i16* %18, align 2
  %106 = sitofp i16 %105 to float
  %107 = fdiv float %106, 0x413E46D0E0000000
  %108 = load i16, i16* %18, align 2
  %109 = sext i16 %108 to i32
  %110 = sitofp i32 %109 to float
  %111 = fcmp ogt float %107, %110
  %112 = zext i1 %111 to i32
  %113 = sitofp i32 %112 to double
  %114 = fcmp ole double %113, 6.250000e-01
  %115 = zext i1 %114 to i32
  %116 = sitofp i32 %115 to float
  %117 = load i16, i16* %4, align 2
  %118 = sitofp i16 %117 to float
  %119 = fmul float %116, %118
  %120 = load float, float* %20, align 4
  %121 = fcmp olt float %119, %120
  %122 = zext i1 %121 to i32
  store i32 %122, i32* %21, align 4
  store i32 %122, i32* %19, align 4
  %123 = load i32, i32* %5, align 4
  %124 = sitofp i32 %123 to float
  %125 = fmul float 0x42E5AD43C0000000, %124
  %126 = load i32, i32* %10, align 4
  %127 = sitofp i32 %126 to float
  %128 = fcmp oeq float %125, %127
  %129 = zext i1 %128 to i32
  store i32 %129, i32* %8, align 4
  store i16 -22, i16* %4, align 2
  br label %130

130:                                              ; preds = %147, %104
  %131 = load i16, i16* %4, align 2
  %132 = sext i16 %131 to i32
  %133 = icmp eq i32 %132, -26
  br i1 %133, label %134, label %152

134:                                              ; preds = %130
  %135 = load i32, i32* %10, align 4
  %136 = trunc i32 %135 to i16
  %137 = sext i16 %136 to i32
  %138 = add nsw i32 8203, %137
  store i32 %138, i32* %10, align 4
  %139 = load i16, i16* %18, align 2
  %140 = icmp ne i16 %139, 0
  br i1 %140, label %141, label %142

141:                                              ; preds = %134
  br label %152

142:                                              ; preds = %134
  %143 = load i32, i32* %5, align 4
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %145, label %146

145:                                              ; preds = %142
  br label %152

146:                                              ; preds = %142
  br label %147

147:                                              ; preds = %146
  %148 = load i16, i16* %4, align 2
  %149 = sext i16 %148 to i32
  %150 = sub nsw i32 %149, 1
  %151 = trunc i32 %150 to i16
  store i16 %151, i16* %4, align 2
  br label %130, !llvm.loop !40

152:                                              ; preds = %145, %141, %130
  br label %257

153:                                              ; preds = %99
  store i16 1, i16* %23, align 2
  store i32 -1227524017, i32* %24, align 4
  %154 = load i16, i16* %4, align 2
  %155 = sext i16 %154 to i32
  %156 = icmp ugt i32 %155, 0
  %157 = zext i1 %156 to i32
  %158 = load i16, i16* %23, align 2
  %159 = zext i16 %158 to i32
  %160 = sdiv i32 %157, %159
  %161 = icmp sle i32 %160, 0
  %162 = zext i1 %161 to i32
  %163 = load i16, i16* %4, align 2
  %164 = sext i16 %163 to i32
  %165 = icmp sge i32 %162, %164
  br i1 %165, label %166, label %220

166:                                              ; preds = %153
  store i16 16020, i16* %25, align 2
  store i32 1084115979, i32* %26, align 4
  %167 = load i16, i16* %18, align 2
  %168 = icmp ne i16 %167, 0
  br i1 %168, label %169, label %170

169:                                              ; preds = %166
  br label %366

170:                                              ; preds = %166
  %171 = load i16, i16* %13, align 2
  %172 = sext i16 %171 to i32
  %173 = or i32 %172, 8
  %174 = icmp ne i32 %173, 0
  br i1 %174, label %175, label %179

175:                                              ; preds = %170
  %176 = load i16, i16* %4, align 2
  %177 = sext i16 %176 to i32
  %178 = icmp ne i32 %177, 0
  br label %179

179:                                              ; preds = %175, %170
  %180 = phi i1 [ false, %170 ], [ %178, %175 ]
  %181 = zext i1 %180 to i32
  %182 = load i16, i16* %4, align 2
  %183 = sext i16 %182 to i32
  %184 = xor i32 %181, %183
  store i32 %184, i32* %14, align 4
  %185 = load i16, i16* %4, align 2
  %186 = sext i16 %185 to i32
  %187 = icmp sge i32 -4, %186
  %188 = zext i1 %187 to i32
  %189 = shl i32 %188, 19
  %190 = load i32, i32* %5, align 4
  %191 = xor i32 %189, %190
  %192 = load i16, i16* %23, align 2
  %193 = zext i16 %192 to i32
  %194 = icmp sle i32 %191, %193
  %195 = zext i1 %194 to i32
  %196 = load i16, i16* %4, align 2
  %197 = sext i16 %196 to i32
  %198 = icmp sle i32 %195, %197
  %199 = zext i1 %198 to i32
  store i32 %199, i32* %24, align 4
  store i32 0, i32* %10, align 4
  %200 = load i16, i16* %4, align 2
  %201 = sitofp i16 %200 to float
  %202 = fdiv float 1.000000e+00, %201
  %203 = load i16, i16* %13, align 2
  %204 = sext i16 %203 to i32
  %205 = sitofp i32 %204 to float
  %206 = fcmp une float %202, %205
  %207 = zext i1 %206 to i32
  %208 = load i16, i16* %13, align 2
  %209 = sext i16 %208 to i32
  %210 = icmp sle i32 %207, %209
  %211 = zext i1 %210 to i32
  %212 = trunc i32 %211 to i16
  store i16 %212, i16* %25, align 2
  %213 = zext i16 %212 to i32
  %214 = sitofp i32 %213 to double
  %215 = fcmp oeq double %214, -4.687500e+00
  %216 = zext i1 %215 to i32
  %217 = load i32, i32* %10, align 4
  %218 = icmp eq i32 %216, %217
  %219 = zext i1 %218 to i32
  store i32 %219, i32* %26, align 4
  br label %230

220:                                              ; preds = %153
  store i32 1563176278, i32* %27, align 4
  %221 = load i32, i32* %27, align 4
  store i32 %221, i32* %10, align 4
  %222 = load i32, i32* %5, align 4
  %223 = icmp ne i32 %222, 0
  br i1 %223, label %224, label %225

224:                                              ; preds = %220
  br label %366

225:                                              ; preds = %220
  %226 = load i32, i32* %24, align 4
  %227 = icmp ne i32 %226, 0
  br i1 %227, label %228, label %229

228:                                              ; preds = %225
  br label %366

229:                                              ; preds = %225
  br label %230

230:                                              ; preds = %229, %179
  %231 = load i16, i16* %18, align 2
  %232 = sext i16 %231 to i32
  %233 = load i32, i32* %5, align 4
  %234 = icmp sge i32 %232, %233
  %235 = zext i1 %234 to i32
  %236 = sitofp i32 %235 to float
  %237 = load i32, i32* %14, align 4
  %238 = sitofp i32 %237 to float
  %239 = fsub float %236, %238
  %240 = fptosi float %239 to i32
  store i32 %240, i32* %24, align 4
  store i32 %240, i32* %10, align 4
  %241 = load i16, i16* %4, align 2
  %242 = sext i16 %241 to i32
  %243 = icmp sgt i32 5, %242
  %244 = zext i1 %243 to i32
  %245 = load i16, i16* %18, align 2
  %246 = sext i16 %245 to i32
  %247 = sdiv i32 %244, %246
  %248 = load i32, i32* %14, align 4
  %249 = shl i32 %247, %248
  %250 = icmp ne i32 %249, 0
  br i1 %250, label %251, label %253

251:                                              ; preds = %230
  %252 = load i32, i32* %5, align 4
  store i32 %252, i32* %3, align 4
  br label %729

253:                                              ; preds = %230
  store float 0x3B5822A3E0000000, float* %28, align 4
  store i32 86493, i32* %10, align 4
  %254 = load float, float* %28, align 4
  %255 = fptosi float %254 to i32
  store i32 %255, i32* %10, align 4
  %256 = load i32, i32* %5, align 4
  store i32 %256, i32* %3, align 4
  br label %729

257:                                              ; preds = %152
  %258 = load i32, i32* %5, align 4
  %259 = icmp ne i32 %258, 0
  %260 = xor i1 %259, true
  %261 = zext i1 %260 to i32
  store i32 %261, i32* %10, align 4
  store i32 -18, i32* %10, align 4
  br label %262

262:                                              ; preds = %359, %257
  %263 = load i32, i32* %10, align 4
  %264 = icmp slt i32 %263, 9
  br i1 %264, label %265, label %362

265:                                              ; preds = %262
  store i32 -1657903833, i32* %29, align 4
  store i32 9, i32* %30, align 4
  %266 = load i32, i32* %5, align 4
  %267 = load i16, i16* %18, align 2
  %268 = sext i16 %267 to i32
  %269 = icmp slt i32 %266, %268
  br i1 %269, label %270, label %291

270:                                              ; preds = %265
  store i32 5, i32* %31, align 4
  %271 = load i32, i32* %10, align 4
  %272 = icmp ne i32 %271, 0
  br i1 %272, label %273, label %274

273:                                              ; preds = %270
  br label %43

274:                                              ; preds = %270
  %275 = load i32, i32* %7, align 4
  store i32 %275, i32* %8, align 4
  store i32 %275, i32* %19, align 4
  %276 = load i32, i32* %7, align 4
  store i32 %276, i32* %31, align 4
  %277 = load i16, i16* %4, align 2
  %278 = sext i16 %277 to i32
  %279 = load i16, i16* %4, align 2
  %280 = sext i16 %279 to i32
  %281 = or i32 %278, %280
  %282 = load i32, i32* %31, align 4
  %283 = icmp ugt i32 %281, %282
  %284 = zext i1 %283 to i32
  %285 = trunc i32 %284 to i16
  %286 = sext i16 %285 to i32
  %287 = shl i32 %286, 25895
  store i32 %287, i32* %14, align 4
  %288 = load i32, i32* %31, align 4
  %289 = icmp ule i32 -1657903833, %288
  %290 = zext i1 %289 to i32
  store i32 %290, i32* %8, align 4
  br label %297

291:                                              ; preds = %265
  %292 = load i32, i32* %19, align 4
  %293 = load i16, i16* %13, align 2
  %294 = sext i16 %293 to i32
  %295 = and i32 %292, %294
  %296 = xor i32 %295, 1
  store i32 %296, i32* %8, align 4
  br label %297

297:                                              ; preds = %291, %274
  store i32 0, i32* %19, align 4
  br label %298

298:                                              ; preds = %325, %297
  %299 = load i32, i32* %19, align 4
  %300 = icmp sgt i32 %299, 13
  br i1 %300, label %301, label %328

301:                                              ; preds = %298
  %302 = load i32, i32* %5, align 4
  store i32 %302, i32* %8, align 4
  %303 = or i32 %302, 1233695851
  %304 = xor i32 %303, -1657903833
  %305 = load i32, i32* %5, align 4
  %306 = icmp eq i32 %304, %305
  %307 = zext i1 %306 to i32
  %308 = load i16, i16* %4, align 2
  %309 = sext i16 %308 to i32
  %310 = or i32 %307, %309
  %311 = load i32, i32* %6, align 4
  %312 = icmp ne i32 %310, %311
  %313 = zext i1 %312 to i32
  store i32 %313, i32* %14, align 4
  %314 = shl i32 %313, 4
  %315 = load i16, i16* %13, align 2
  %316 = sext i16 %315 to i32
  %317 = srem i32 %314, %316
  %318 = icmp ne i32 %317, 0
  br i1 %318, label %322, label %319

319:                                              ; preds = %301
  %320 = load i32, i32* %10, align 4
  %321 = icmp ne i32 %320, 0
  br label %322

322:                                              ; preds = %319, %301
  %323 = phi i1 [ true, %301 ], [ %321, %319 ]
  %324 = zext i1 %323 to i32
  store i32 %324, i32* %30, align 4
  br label %325

325:                                              ; preds = %322
  %326 = load i32, i32* %19, align 4
  %327 = add nsw i32 %326, 7
  store i32 %327, i32* %19, align 4
  br label %298, !llvm.loop !41

328:                                              ; preds = %298
  %329 = load i32, i32* %5, align 4
  %330 = icmp ne i32 %329, 0
  br i1 %330, label %331, label %344

331:                                              ; preds = %328
  store i32 -1178130743, i32* %32, align 4
  %332 = load i32, i32* %19, align 4
  %333 = load i16, i16* %4, align 2
  %334 = sext i16 %333 to i32
  %335 = icmp sge i32 %332, %334
  %336 = zext i1 %335 to i32
  store i32 %336, i32* %8, align 4
  %337 = load i32, i32* %30, align 4
  store i32 %337, i32* %8, align 4
  %338 = load i16, i16* %4, align 2
  store i16 %338, i16* %4, align 2
  %339 = sext i16 %338 to i32
  %340 = load i32, i32* %32, align 4
  %341 = and i32 %339, %340
  %342 = icmp ult i32 %341, 1
  %343 = zext i1 %342 to i32
  store i32 %343, i32* %30, align 4
  br label %355

344:                                              ; preds = %328
  %345 = load i32, i32* %6, align 4
  %346 = icmp ne i32 %345, 0
  br i1 %346, label %347, label %348

347:                                              ; preds = %344
  br label %362

348:                                              ; preds = %344
  %349 = load i32, i32* %30, align 4
  %350 = load i32, i32* %5, align 4
  %351 = add nsw i32 %349, %350
  %352 = load i32, i32* %14, align 4
  %353 = icmp sgt i32 %351, %352
  %354 = zext i1 %353 to i32
  store i32 %354, i32* %11, align 4
  br label %355

355:                                              ; preds = %348, %331
  %356 = load i16, i16* %13, align 2
  %357 = sext i16 %356 to i32
  %358 = add nsw i32 0, %357
  store i32 %358, i32* %19, align 4
  br label %359

359:                                              ; preds = %355
  %360 = load i32, i32* %10, align 4
  %361 = add nsw i32 %360, 9
  store i32 %361, i32* %10, align 4
  br label %262, !llvm.loop !42

362:                                              ; preds = %347, %262
  br label %363

363:                                              ; preds = %362
  %364 = load i32, i32* %5, align 4
  %365 = sub nsw i32 %364, 1
  store i32 %365, i32* %5, align 4
  br label %96, !llvm.loop !43

366:                                              ; preds = %228, %224, %169, %96
  store i16 0, i16* %13, align 2
  br label %367

367:                                              ; preds = %490, %366
  %368 = load i16, i16* %13, align 2
  %369 = sext i16 %368 to i32
  %370 = icmp sgt i32 %369, -19
  br i1 %370, label %371, label %495

371:                                              ; preds = %367
  store i32 0, i32* %33, align 4
  store i32 -673907373, i32* %14, align 4
  %372 = load i32, i32* %5, align 4
  store i32 %372, i32* %11, align 4
  %373 = icmp ne i32 %372, 0
  br i1 %373, label %374, label %377

374:                                              ; preds = %371
  %375 = load i32, i32* %5, align 4
  %376 = icmp ne i32 %375, 0
  br label %377

377:                                              ; preds = %374, %371
  %378 = phi i1 [ false, %371 ], [ %376, %374 ]
  %379 = zext i1 %378 to i32
  %380 = load i32, i32* %5, align 4
  %381 = or i32 %379, %380
  %382 = load i32, i32* %5, align 4
  %383 = icmp sle i32 %381, %382
  %384 = zext i1 %383 to i32
  store i32 %384, i32* %5, align 4
  %385 = load i32, i32* %7, align 4
  %386 = icmp ne i32 %385, 0
  br i1 %386, label %387, label %388

387:                                              ; preds = %377
  br label %490

388:                                              ; preds = %377
  %389 = load i16, i16* %4, align 2
  %390 = sitofp i16 %389 to float
  %391 = load i32, i32* %5, align 4
  %392 = sitofp i32 %391 to float
  %393 = fneg float %392
  %394 = call float @llvm.fmuladd.f32(float 3.750000e+00, float %390, float %393)
  %395 = fsub float %394, 0x3D4EE59940000000
  %396 = load i32, i32* %5, align 4
  %397 = sitofp i32 %396 to float
  %398 = fcmp ogt float %395, %397
  %399 = zext i1 %398 to i32
  store i32 %399, i32* %11, align 4
  store i32 %399, i32* %8, align 4
  %400 = load i32, i32* %8, align 4
  %401 = and i32 1, %400
  store i32 %401, i32* %8, align 4
  store i32 %401, i32* %14, align 4
  %402 = load i32, i32* %10, align 4
  %403 = sdiv i32 %401, %402
  %404 = icmp ult i32 %403, 65535
  br i1 %404, label %408, label %405

405:                                              ; preds = %388
  %406 = load i32, i32* %10, align 4
  %407 = icmp ne i32 %406, 0
  br label %408

408:                                              ; preds = %405, %388
  %409 = phi i1 [ true, %388 ], [ %407, %405 ]
  %410 = zext i1 %409 to i32
  %411 = icmp ule i32 %410, 65535
  %412 = zext i1 %411 to i32
  %413 = icmp ne i32 %412, 0
  %414 = zext i1 %413 to i32
  %415 = load i32, i32* %6, align 4
  %416 = icmp sgt i32 %414, %415
  %417 = zext i1 %416 to i32
  %418 = trunc i32 %417 to i16
  %419 = sext i16 %418 to i32
  %420 = sub nsw i32 0, %419
  %421 = load i16, i16* %4, align 2
  %422 = sext i16 %421 to i32
  %423 = icmp sge i32 %420, %422
  %424 = zext i1 %423 to i32
  %425 = trunc i32 %424 to i16
  %426 = sext i16 %425 to i32
  %427 = load i32, i32* %5, align 4
  %428 = trunc i32 %427 to i16
  %429 = sext i16 %428 to i32
  %430 = sub nsw i32 %426, %429
  %431 = load i32, i32* %15, align 4
  %432 = or i32 %430, %431
  %433 = load i16, i16* %4, align 2
  %434 = sext i16 %433 to i32
  %435 = and i32 %432, %434
  %436 = trunc i32 %435 to i16
  store i16 %436, i16* %4, align 2
  %437 = sext i16 %436 to i32
  %438 = load i32, i32* %15, align 4
  %439 = trunc i32 %438 to i16
  %440 = sext i16 %439 to i32
  %441 = add nsw i32 %437, %440
  %442 = sub nsw i32 %441, 367246912
  %443 = load i32, i32* %10, align 4
  %444 = xor i32 %442, %443
  %445 = icmp ne i32 %444, 0
  br i1 %445, label %446, label %472

446:                                              ; preds = %408
  store float -1.825000e+01, float* %34, align 4
  %447 = load i32, i32* %33, align 4
  store i32 %447, i32* %10, align 4
  %448 = load i16, i16* %13, align 2
  %449 = sext i16 %448 to i32
  %450 = load i32, i32* %5, align 4
  %451 = icmp ne i32 %449, %450
  %452 = zext i1 %451 to i32
  %453 = sub nsw i32 %452, -1267334254
  %454 = load i32, i32* %10, align 4
  %455 = xor i32 %453, %454
  %456 = trunc i32 %455 to i16
  %457 = sext i16 %456 to i32
  %458 = sdiv i32 %457, 1
  %459 = trunc i32 %458 to i16
  store i16 %459, i16* %4, align 2
  %460 = sext i16 %459 to i32
  %461 = icmp sle i32 %460, -7
  %462 = zext i1 %461 to i32
  %463 = load i32, i32* %33, align 4
  %464 = icmp ne i32 %462, %463
  %465 = zext i1 %464 to i32
  %466 = trunc i32 %465 to i16
  %467 = zext i16 %466 to i32
  %468 = load i32, i32* %5, align 4
  %469 = trunc i32 %468 to i16
  %470 = zext i16 %469 to i32
  %471 = sdiv i32 %467, %470
  store i32 %471, i32* %33, align 4
  br label %489

472:                                              ; preds = %408
  %473 = load i32, i32* %14, align 4
  %474 = and i32 61007, %473
  %475 = load i32, i32* %5, align 4
  %476 = xor i32 %474, %475
  %477 = load i16, i16* %4, align 2
  %478 = sext i16 %477 to i32
  %479 = icmp ne i32 %476, %478
  %480 = zext i1 %479 to i32
  store i32 %480, i32* %10, align 4
  %481 = icmp ne i32 %480, -1185238693
  br i1 %481, label %483, label %482

482:                                              ; preds = %472
  br label %483

483:                                              ; preds = %482, %472
  %484 = phi i1 [ true, %472 ], [ true, %482 ]
  %485 = zext i1 %484 to i32
  %486 = load i32, i32* %8, align 4
  %487 = icmp sgt i32 %485, %486
  %488 = zext i1 %487 to i32
  store i32 %488, i32* %5, align 4
  br label %489

489:                                              ; preds = %483, %446
  br label %490

490:                                              ; preds = %489, %387
  %491 = load i16, i16* %13, align 2
  %492 = sext i16 %491 to i32
  %493 = sub nsw i32 %492, 1
  %494 = trunc i32 %493 to i16
  store i16 %494, i16* %13, align 2
  br label %367, !llvm.loop !44

495:                                              ; preds = %367
  %496 = load i16, i16* %4, align 2
  %497 = zext i16 %496 to i32
  %498 = load i16, i16* %4, align 2
  %499 = zext i16 %498 to i32
  %500 = add nsw i32 %497, %499
  %501 = load i32, i32* %11, align 4
  %502 = udiv i32 %500, %501
  store i32 %502, i32* %5, align 4
  %503 = load i32, i32* %6, align 4
  %504 = icmp sge i32 %503, 19641
  %505 = zext i1 %504 to i32
  %506 = trunc i32 %505 to i16
  %507 = zext i16 %506 to i32
  %508 = ashr i32 %507, 15
  %509 = icmp ne i32 %508, 0
  br i1 %509, label %510, label %660

510:                                              ; preds = %495
  store i32 0, i32* %35, align 4
  store i32 1, i32* %36, align 4
  %511 = load i32, i32* %35, align 4
  %512 = icmp ne i32 %511, 0
  br i1 %512, label %513, label %525

513:                                              ; preds = %510
  store i16 -5955, i16* %37, align 2
  %514 = load i32, i32* %35, align 4
  store i32 %514, i32* %14, align 4
  store i32 %514, i32* %5, align 4
  %515 = trunc i32 %514 to i16
  store i16 %515, i16* %37, align 2
  %516 = load i32, i32* %11, align 4
  %517 = icmp ne i32 %516, 0
  br i1 %517, label %518, label %522

518:                                              ; preds = %513
  %519 = load i16, i16* %4, align 2
  %520 = sext i16 %519 to i32
  %521 = icmp ne i32 %520, 0
  br label %522

522:                                              ; preds = %518, %513
  %523 = phi i1 [ false, %513 ], [ %521, %518 ]
  %524 = zext i1 %523 to i32
  store i32 %524, i32* %5, align 4
  br label %631

525:                                              ; preds = %510
  store i32 -61770828, i32* %38, align 4
  store i32 -1, i32* %39, align 4
  store i32 -6, i32* %40, align 4
  %526 = load i32, i32* %8, align 4
  %527 = icmp eq i32 530293072, %526
  br i1 %527, label %528, label %529

528:                                              ; preds = %525
  br label %529

529:                                              ; preds = %528, %525
  %530 = phi i1 [ false, %525 ], [ true, %528 ]
  %531 = zext i1 %530 to i32
  %532 = load i32, i32* %5, align 4
  %533 = icmp eq i32 %531, %532
  %534 = zext i1 %533 to i32
  %535 = trunc i32 %534 to i16
  %536 = zext i16 %535 to i32
  %537 = load i32, i32* %10, align 4
  %538 = trunc i32 %537 to i16
  %539 = zext i16 %538 to i32
  %540 = sub nsw i32 %536, %539
  %541 = icmp ult i32 %540, 6
  %542 = zext i1 %541 to i32
  store i32 %542, i32* %36, align 4
  %543 = load i32, i32* %5, align 4
  %544 = icmp slt i32 %542, %543
  %545 = zext i1 %544 to i32
  %546 = trunc i32 %545 to i16
  %547 = zext i16 %546 to i32
  %548 = shl i32 %547, 6
  %549 = load i32, i32* %10, align 4
  %550 = icmp sgt i32 %548, %549
  %551 = zext i1 %550 to i32
  %552 = load i16, i16* %4, align 2
  %553 = sext i16 %552 to i32
  %554 = icmp ne i32 %551, %553
  %555 = zext i1 %554 to i32
  %556 = load i32, i32* %38, align 4
  %557 = sdiv i32 %555, %556
  %558 = icmp ne i32 %557, 0
  br i1 %558, label %559, label %575

559:                                              ; preds = %529
  %560 = load i32, i32* %36, align 4
  %561 = load i16, i16* %4, align 2
  %562 = sext i16 %561 to i32
  %563 = icmp sle i32 %560, %562
  %564 = zext i1 %563 to i32
  %565 = trunc i32 %564 to i16
  %566 = sext i16 %565 to i32
  %567 = load i16, i16* %4, align 2
  %568 = sext i16 %567 to i32
  %569 = shl i32 %566, %568
  %570 = icmp ne i32 %569, 0
  br i1 %570, label %572, label %571

571:                                              ; preds = %559
  br label %572

572:                                              ; preds = %571, %559
  %573 = phi i1 [ true, %559 ], [ true, %571 ]
  %574 = zext i1 %573 to i32
  store i32 %574, i32* %39, align 4
  store i32 1, i32* %36, align 4
  store i32 0, i32* %5, align 4
  br label %595

575:                                              ; preds = %529
  store i32 1, i32* %41, align 4
  store i32 0, i32* %38, align 4
  %576 = load i32, i32* %5, align 4
  %577 = icmp ne i32 %576, 0
  br i1 %577, label %578, label %579

578:                                              ; preds = %575
  br label %691

579:                                              ; preds = %575
  %580 = load i32, i32* %41, align 4
  %581 = icmp ne i32 %580, 0
  br i1 %581, label %582, label %583

582:                                              ; preds = %579
  br label %691

583:                                              ; preds = %579
  %584 = load i32, i32* %10, align 4
  %585 = sitofp i32 %584 to float
  %586 = load i32, i32* %5, align 4
  %587 = sitofp i32 %586 to float
  %588 = fadd float %585, %587
  %589 = load i32, i32* %5, align 4
  %590 = sitofp i32 %589 to float
  %591 = fadd float %588, %590
  %592 = fptosi float %591 to i32
  store i32 %592, i32* %38, align 4
  %593 = load i16, i16* %4, align 2
  %594 = sext i16 %593 to i32
  store i32 %594, i32* %3, align 4
  br label %729

595:                                              ; preds = %572
  %596 = load i32, i32* %10, align 4
  %597 = load i32, i32* %10, align 4
  %598 = add nsw i32 %596, %597
  %599 = icmp slt i32 %598, 1
  %600 = zext i1 %599 to i32
  %601 = icmp eq i32 %600, -1
  br i1 %601, label %605, label %602

602:                                              ; preds = %595
  %603 = load i32, i32* %14, align 4
  %604 = icmp ne i32 %603, 0
  br label %605

605:                                              ; preds = %602, %595
  %606 = phi i1 [ true, %595 ], [ %604, %602 ]
  %607 = zext i1 %606 to i32
  %608 = load i32, i32* %5, align 4
  %609 = icmp sge i32 %607, %608
  br i1 %609, label %611, label %610

610:                                              ; preds = %605
  br label %611

611:                                              ; preds = %610, %605
  %612 = phi i1 [ true, %605 ], [ true, %610 ]
  %613 = zext i1 %612 to i32
  store i32 %613, i32* %5, align 4
  %614 = load i32, i32* %5, align 4
  %615 = icmp ne i32 %614, 0
  br i1 %615, label %616, label %617

616:                                              ; preds = %611
  store i32 -1, i32* %3, align 4
  br label %729

617:                                              ; preds = %611
  %618 = load i32, i32* %7, align 4
  %619 = trunc i32 %618 to i16
  %620 = sext i16 %619 to i32
  %621 = load i32, i32* %38, align 4
  %622 = trunc i32 %621 to i16
  %623 = sext i16 %622 to i32
  %624 = sub nsw i32 %620, %623
  %625 = load i16, i16* %4, align 2
  %626 = sext i16 %625 to i32
  %627 = add nsw i32 %624, %626
  %628 = load i32, i32* %11, align 4
  %629 = icmp slt i32 %627, %628
  %630 = zext i1 %629 to i32
  store i32 %630, i32* %40, align 4
  store i32 -1, i32* %5, align 4
  br label %691

631:                                              ; preds = %522
  store i32 -11, i32* %10, align 4
  br label %632

632:                                              ; preds = %656, %631
  %633 = load i32, i32* %10, align 4
  %634 = icmp sge i32 %633, 18
  br i1 %634, label %635, label %659

635:                                              ; preds = %632
  store i32 -1799494094, i32* %42, align 4
  %636 = load i32, i32* %10, align 4
  store i32 %636, i32* %36, align 4
  store i32 11, i32* %8, align 4
  br label %637

637:                                              ; preds = %648, %635
  %638 = load i32, i32* %8, align 4
  %639 = icmp sge i32 %638, -10
  br i1 %639, label %640, label %651

640:                                              ; preds = %637
  %641 = load i32, i32* %15, align 4
  %642 = icmp ne i32 %641, 0
  br i1 %642, label %643, label %644

643:                                              ; preds = %640
  br label %651

644:                                              ; preds = %640
  %645 = load i32, i32* %42, align 4
  store i32 %645, i32* %11, align 4
  %646 = load i16, i16* %4, align 2
  %647 = sext i16 %646 to i32
  store i32 %647, i32* %36, align 4
  br label %648

648:                                              ; preds = %644
  %649 = load i32, i32* %8, align 4
  %650 = sub nsw i32 %649, 1
  store i32 %650, i32* %8, align 4
  br label %637, !llvm.loop !45

651:                                              ; preds = %643, %637
  %652 = load i32, i32* %5, align 4
  %653 = trunc i32 %652 to i16
  %654 = sext i16 %653 to i32
  %655 = srem i32 %654, 13515
  store i32 %655, i32* %8, align 4
  br label %656

656:                                              ; preds = %651
  %657 = load i32, i32* %10, align 4
  %658 = add nsw i32 %657, 9
  store i32 %658, i32* %10, align 4
  br label %632, !llvm.loop !46

659:                                              ; preds = %632
  br label %690

660:                                              ; preds = %495
  %661 = load i32, i32* %11, align 4
  %662 = icmp ne i32 %661, 0
  br i1 %662, label %663, label %664

663:                                              ; preds = %660
  br label %694

664:                                              ; preds = %660
  %665 = load i32, i32* %11, align 4
  %666 = sitofp i32 %665 to float
  %667 = fsub float 0x4561ABA1C0000000, %666
  %668 = load i32, i32* %10, align 4
  %669 = sitofp i32 %668 to float
  %670 = fadd float %667, %669
  %671 = fcmp une float %670, 0.000000e+00
  %672 = xor i1 %671, true
  %673 = zext i1 %672 to i32
  %674 = sitofp i32 %673 to double
  %675 = fcmp ogt double %674, 0x409CD88E20000000
  %676 = zext i1 %675 to i32
  %677 = sitofp i32 %676 to float
  %678 = load i32, i32* %10, align 4
  %679 = sitofp i32 %678 to float
  %680 = fadd float %677, %679
  %681 = load i32, i32* %10, align 4
  %682 = sitofp i32 %681 to float
  %683 = fcmp oge float %680, %682
  %684 = zext i1 %683 to i32
  %685 = sitofp i32 %684 to float
  %686 = load i32, i32* %15, align 4
  %687 = uitofp i32 %686 to float
  %688 = fdiv float %685, %687
  %689 = fptosi float %688 to i32
  store i32 %689, i32* %14, align 4
  br label %691

690:                                              ; preds = %659
  br label %691

691:                                              ; preds = %690, %664, %617, %582, %578
  %692 = load i32, i32* %7, align 4
  %693 = sub nsw i32 %692, 9
  store i32 %693, i32* %7, align 4
  br label %73, !llvm.loop !47

694:                                              ; preds = %663, %73
  store i32 0, i32* %11, align 4
  %695 = load i16, i16* %4, align 2
  %696 = sext i16 %695 to i32
  %697 = sitofp i32 %696 to double
  %698 = fcmp oge double 0x4054AC51B4000000, %697
  %699 = zext i1 %698 to i32
  %700 = load i32, i32* %10, align 4
  %701 = icmp sle i32 %699, %700
  %702 = zext i1 %701 to i32
  %703 = sitofp i32 %702 to float
  %704 = load i32, i32* %6, align 4
  %705 = sitofp i32 %704 to float
  %706 = fsub float %703, %705
  %707 = fpext float %706 to double
  %708 = fcmp une double %707, 0x4389EDCF4C000000
  %709 = zext i1 %708 to i32
  %710 = load i32, i32* %5, align 4
  %711 = icmp slt i32 %709, %710
  %712 = zext i1 %711 to i32
  %713 = load i16, i16* %4, align 2
  %714 = sext i16 %713 to i32
  %715 = icmp ne i32 %712, %714
  %716 = zext i1 %715 to i32
  %717 = load i16, i16* %4, align 2
  %718 = sext i16 %717 to i32
  %719 = icmp eq i32 %716, %718
  %720 = zext i1 %719 to i32
  %721 = sitofp i32 %720 to float
  %722 = fdiv float %721, 1.250000e+00
  %723 = fptosi float %722 to i32
  store i32 %723, i32* %8, align 4
  br label %724

724:                                              ; preds = %694
  %725 = load i32, i32* %6, align 4
  %726 = add nsw i32 %725, 1
  store i32 %726, i32* %6, align 4
  br label %69, !llvm.loop !48

727:                                              ; preds = %69
  %728 = load i32, i32* %8, align 4
  store i32 %728, i32* %3, align 4
  br label %729

729:                                              ; preds = %727, %616, %583, %253, %251
  %730 = load i32, i32* %3, align 4
  ret i32 %730
}

define internal zeroext i16 @func_77(i16 noundef zeroext %0, float noundef %1, i32 noundef %2, i16 noundef signext %3) #0 {
  %5 = alloca i16, align 2
  %6 = alloca i16, align 2
  %7 = alloca float, align 4
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i16, align 2
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca float, align 4
  %17 = alloca i32, align 4
  %18 = alloca i16, align 2
  %19 = alloca i32, align 4
  %20 = alloca float, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca float, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca float, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i16, align 2
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i16, align 2
  %45 = alloca float, align 4
  %46 = alloca i16, align 2
  %47 = alloca i16, align 2
  %48 = alloca i32, align 4
  %49 = alloca i16, align 2
  %50 = alloca float, align 4
  %51 = alloca i32, align 4
  %52 = alloca i32, align 4
  %53 = alloca i16, align 2
  %54 = alloca i32, align 4
  %55 = alloca i32, align 4
  %56 = alloca i32, align 4
  %57 = alloca i16, align 2
  %58 = alloca i32, align 4
  %59 = alloca i16, align 2
  %60 = alloca i16, align 2
  %61 = alloca i32, align 4
  %62 = alloca i16, align 2
  %63 = alloca i32, align 4
  %64 = alloca i32, align 4
  %65 = alloca float, align 4
  %66 = alloca i32, align 4
  store i16 %0, i16* %6, align 2
  store float %1, float* %7, align 4
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  store i32 5, i32* %10, align 4
  store i32 -1, i32* %11, align 4
  store i16 -3496, i16* %12, align 2
  store i32 -1, i32* %13, align 4
  store i32 958514269, i32* %14, align 4
  store i32 0, i32* %15, align 4
  store float 1.562500e-01, float* %16, align 4
  store i32 0, i32* %17, align 4
  store i16 8, i16* %18, align 2
  store i32 -672676712, i32* %19, align 4
  %67 = load i16, i16* %9, align 2
  %68 = sext i16 %67 to i32
  %69 = load i32, i32* %10, align 4
  %70 = and i32 %68, %69
  %71 = trunc i32 %70 to i16
  %72 = zext i16 %71 to i32
  %73 = load i32, i32* %10, align 4
  %74 = trunc i32 %73 to i16
  %75 = zext i16 %74 to i32
  %76 = mul nsw i32 %72, %75
  %77 = load i32, i32* %10, align 4
  %78 = icmp uge i32 %76, %77
  %79 = zext i1 %78 to i32
  %80 = lshr i32 %79, -1
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %82, label %675

82:                                               ; preds = %4
  store float 0x427B315C40000000, float* %20, align 4
  store i32 431888767, i32* %21, align 4
  store i32 1598331828, i32* %22, align 4
  store i32 4, i32* %23, align 4
  br label %83

83:                                               ; preds = %643, %348, %82
  store i16 27, i16* %6, align 2
  br label %84

84:                                               ; preds = %202, %83
  %85 = load i16, i16* %6, align 2
  %86 = zext i16 %85 to i32
  %87 = icmp sle i32 %86, 37
  br i1 %87, label %88, label %207

88:                                               ; preds = %84
  store i32 3, i32* %24, align 4
  store i32 1, i32* %25, align 4
  store i32 -1665603983, i32* %26, align 4
  %89 = load i16, i16* %12, align 2
  %90 = zext i16 %89 to i32
  %91 = xor i32 6833, %90
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %128

93:                                               ; preds = %88
  store i32 8, i32* %27, align 4
  store i32 1616073505, i32* %28, align 4
  store i32 0, i32* %10, align 4
  br label %94

94:                                               ; preds = %109, %93
  %95 = load i32, i32* %10, align 4
  %96 = icmp ult i32 %95, 16
  br i1 %96, label %97, label %112

97:                                               ; preds = %94
  store i32 1, i32* %29, align 4
  %98 = load i16, i16* %9, align 2
  %99 = sext i16 %98 to i32
  %100 = load i16, i16* %6, align 2
  %101 = zext i16 %100 to i32
  %102 = load i16, i16* %9, align 2
  %103 = sext i16 %102 to i32
  %104 = load i32, i32* %29, align 4
  %105 = call signext i16 @func_97(i32 noundef %99, i32 noundef %101, i32 noundef 3, i32 noundef %103, i32 noundef %104)
  %106 = sext i16 %105 to i32
  %107 = load i32, i32* %27, align 4
  %108 = and i32 %106, %107
  store i32 %108, i32* %25, align 4
  br label %109

109:                                              ; preds = %97
  %110 = load i32, i32* %10, align 4
  %111 = add i32 %110, 1
  store i32 %111, i32* %10, align 4
  br label %94, !llvm.loop !49

112:                                              ; preds = %94
  %113 = load i32, i32* %8, align 4
  %114 = sitofp i32 %113 to double
  %115 = fcmp oge double 0x4543647AFE000000, %114
  %116 = zext i1 %115 to i32
  store i32 %116, i32* %21, align 4
  %117 = load i32, i32* %8, align 4
  %118 = icmp ule i32 %117, 65531
  %119 = zext i1 %118 to i32
  store i32 %119, i32* %21, align 4
  store i32 %119, i32* %13, align 4
  store i32 %119, i32* %28, align 4
  %120 = load float, float* %7, align 4
  %121 = fpext float %120 to double
  %122 = fcmp oge double -2.750000e+00, %121
  %123 = zext i1 %122 to i32
  %124 = sitofp i32 %123 to float
  %125 = fdiv float %124, 4.687500e+00
  %126 = fptosi float %125 to i32
  store i32 %126, i32* %14, align 4
  %127 = load i32, i32* %25, align 4
  store i32 %127, i32* %25, align 4
  br label %200

128:                                              ; preds = %88
  store float 0x4318CDC940000000, float* %30, align 4
  store i32 5, i32* %31, align 4
  %129 = load i16, i16* %9, align 2
  %130 = sext i16 %129 to i32
  %131 = load i32, i32* %25, align 4
  %132 = sitofp i32 %131 to float
  %133 = load i16, i16* %6, align 2
  %134 = zext i16 %133 to i32
  %135 = load i32, i32* %8, align 4
  %136 = load i32, i32* %8, align 4
  %137 = call i32 @func_115(i32 noundef %130, float noundef %132, i32 noundef %134, i32 noundef %135, i32 noundef %136)
  %138 = load i16, i16* %6, align 2
  %139 = zext i16 %138 to i32
  %140 = icmp slt i32 %137, %139
  %141 = zext i1 %140 to i32
  %142 = icmp eq i32 %141, 6596
  %143 = zext i1 %142 to i32
  %144 = icmp eq i32 %143, 3
  br i1 %144, label %183, label %145

145:                                              ; preds = %128
  store i32 -5, i32* %32, align 4
  %146 = load i16, i16* %6, align 2
  %147 = icmp ne i16 %146, 0
  br i1 %147, label %148, label %149

148:                                              ; preds = %145
  br label %207

149:                                              ; preds = %145
  store i32 0, i32* %25, align 4
  br label %150

150:                                              ; preds = %166, %149
  %151 = load i32, i32* %25, align 4
  %152 = icmp slt i32 %151, -12
  br i1 %152, label %153, label %169

153:                                              ; preds = %150
  store float 0x42892570A0000000, float* %33, align 4
  %154 = load i32, i32* %21, align 4
  %155 = icmp uge i32 589779, %154
  %156 = zext i1 %155 to i32
  %157 = trunc i32 %156 to i16
  %158 = sext i16 %157 to i32
  %159 = load i16, i16* %6, align 2
  %160 = sext i16 %159 to i32
  %161 = sdiv i32 %158, %160
  %162 = trunc i32 %161 to i16
  %163 = sext i16 %162 to i32
  %164 = ashr i32 %163, 7
  store i32 %164, i32* %31, align 4
  %165 = load i32, i32* %31, align 4
  store i32 %165, i32* %26, align 4
  br label %166

166:                                              ; preds = %153
  %167 = load i32, i32* %25, align 4
  %168 = sub nsw i32 %167, 1
  store i32 %168, i32* %25, align 4
  br label %150, !llvm.loop !50

169:                                              ; preds = %150
  %170 = load float, float* %7, align 4
  %171 = fpext float %170 to double
  %172 = fcmp une double 0x453D27751C000000, %171
  %173 = zext i1 %172 to i32
  %174 = load i32, i32* %10, align 4
  %175 = icmp eq i32 %173, %174
  %176 = zext i1 %175 to i32
  %177 = sitofp i32 %176 to float
  %178 = fdiv float %177, 0x3E906795C0000000
  %179 = fptosi float %178 to i32
  store i32 %179, i32* %21, align 4
  %180 = load i32, i32* %8, align 4
  %181 = icmp slt i32 %179, %180
  %182 = zext i1 %181 to i32
  store i32 %182, i32* %31, align 4
  br label %199

183:                                              ; preds = %128
  store i32 1, i32* %34, align 4
  store i32 -1, i32* %35, align 4
  %184 = load i32, i32* %34, align 4
  %185 = load i32, i32* %31, align 4
  %186 = icmp eq i32 %184, %185
  %187 = zext i1 %186 to i32
  store i32 %187, i32* %31, align 4
  store i32 %187, i32* %35, align 4
  %188 = load i16, i16* %6, align 2
  %189 = zext i16 %188 to i32
  store i32 %189, i32* %35, align 4
  %190 = load i32, i32* %21, align 4
  %191 = icmp slt i32 0, %190
  br i1 %191, label %192, label %195

192:                                              ; preds = %183
  %193 = load i32, i32* %31, align 4
  %194 = icmp ne i32 %193, 0
  br label %195

195:                                              ; preds = %192, %183
  %196 = phi i1 [ false, %183 ], [ %194, %192 ]
  %197 = zext i1 %196 to i32
  store i32 %197, i32* %13, align 4
  %198 = or i32 %197, 25247
  store i32 %198, i32* %35, align 4
  br label %199

199:                                              ; preds = %195, %169
  br label %200

200:                                              ; preds = %199, %112
  %201 = load i16, i16* %9, align 2
  store i16 %201, i16* %5, align 2
  br label %715

202:                                              ; No predecessors!
  %203 = load i16, i16* %6, align 2
  %204 = zext i16 %203 to i32
  %205 = add nsw i32 %204, 1
  %206 = trunc i32 %205 to i16
  store i16 %206, i16* %6, align 2
  br label %84, !llvm.loop !51

207:                                              ; preds = %148, %84
  store i16 -21, i16* %6, align 2
  br label %208

208:                                              ; preds = %669, %207
  %209 = load i16, i16* %6, align 2
  %210 = zext i16 %209 to i32
  %211 = icmp sgt i32 %210, 4
  br i1 %211, label %212, label %674

212:                                              ; preds = %208
  store i32 -1, i32* %36, align 4
  store i32 1685864586, i32* %37, align 4
  store i32 9, i32* %38, align 4
  store i32 0, i32* %10, align 4
  br label %213

213:                                              ; preds = %634, %212
  %214 = load i32, i32* %10, align 4
  %215 = icmp eq i32 %214, 3
  br i1 %215, label %216, label %637

216:                                              ; preds = %213
  store i16 -5, i16* %39, align 2
  store i32 -1365752039, i32* %40, align 4
  store i32 0, i32* %41, align 4
  %217 = load i32, i32* %14, align 4
  store i32 %217, i32* %36, align 4
  %218 = load i32, i32* %14, align 4
  %219 = load i16, i16* %39, align 2
  %220 = sext i16 %219 to i32
  %221 = and i32 %218, %220
  %222 = load i16, i16* %9, align 2
  %223 = sext i16 %222 to i32
  %224 = add i32 %221, %223
  %225 = trunc i32 %224 to i16
  %226 = sext i16 %225 to i32
  %227 = load i16, i16* %9, align 2
  %228 = sext i16 %227 to i32
  %229 = srem i32 %226, %228
  %230 = icmp ne i32 %229, 0
  br i1 %230, label %231, label %326

231:                                              ; preds = %216
  store i32 534476433, i32* %42, align 4
  store i32 7, i32* %43, align 4
  %232 = load i16, i16* %39, align 2
  %233 = sext i16 %232 to i32
  store i32 %233, i32* %40, align 4
  %234 = load i32, i32* %8, align 4
  %235 = icmp ne i32 %234, 0
  br i1 %235, label %236, label %259

236:                                              ; preds = %231
  store i16 -32294, i16* %44, align 2
  %237 = load i32, i32* %10, align 4
  %238 = uitofp i32 %237 to double
  %239 = fcmp ole double 0x3CD89D047C000000, %238
  %240 = zext i1 %239 to i32
  %241 = sitofp i32 %240 to float
  %242 = load i32, i32* %41, align 4
  %243 = uitofp i32 %242 to float
  %244 = fadd float %241, %243
  %245 = fdiv float %244, -3.000000e+00
  %246 = fptosi float %245 to i32
  store i32 %246, i32* %21, align 4
  %247 = load i32, i32* %15, align 4
  %248 = icmp sle i32 %246, %247
  %249 = zext i1 %248 to i32
  %250 = trunc i32 %249 to i16
  store i16 %250, i16* %44, align 2
  %251 = sitofp i16 %250 to float
  %252 = load float, float* %7, align 4
  %253 = fmul float %251, %252
  %254 = fptosi float %253 to i32
  store i32 %254, i32* %42, align 4
  %255 = load i32, i32* %8, align 4
  %256 = icmp ne i32 %255, 0
  br i1 %256, label %257, label %258

257:                                              ; preds = %236
  br label %634

258:                                              ; preds = %236
  br label %269

259:                                              ; preds = %231
  store float 0x3BFA5D7460000000, float* %45, align 4
  %260 = load i32, i32* %36, align 4
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %263, label %262

262:                                              ; preds = %259
  br label %263

263:                                              ; preds = %262, %259
  %264 = phi i1 [ true, %259 ], [ true, %262 ]
  %265 = zext i1 %264 to i32
  %266 = load i16, i16* %6, align 2
  %267 = zext i16 %266 to i32
  %268 = xor i32 %265, %267
  store i32 %268, i32* %37, align 4
  br label %269

269:                                              ; preds = %263, %258
  %270 = load i16, i16* %6, align 2
  %271 = zext i16 %270 to i32
  %272 = icmp ult i32 1, %271
  %273 = zext i1 %272 to i32
  %274 = load i32, i32* %42, align 4
  %275 = icmp sge i32 %273, %274
  %276 = zext i1 %275 to i32
  %277 = trunc i32 %276 to i16
  %278 = zext i16 %277 to i32
  %279 = add nsw i32 %278, 65535
  %280 = trunc i32 %279 to i16
  %281 = sext i16 %280 to i32
  %282 = shl i32 %281, 7
  store i32 %282, i32* %13, align 4
  %283 = load i32, i32* %37, align 4
  %284 = sitofp i32 %283 to float
  %285 = load float, float* %7, align 4
  %286 = fcmp olt float %284, %285
  %287 = zext i1 %286 to i32
  %288 = load i16, i16* %6, align 2
  %289 = zext i16 %288 to i32
  %290 = icmp slt i32 %287, %289
  %291 = zext i1 %290 to i32
  %292 = sitofp i32 %291 to double
  %293 = fcmp olt double %292, 7.500000e-01
  %294 = zext i1 %293 to i32
  %295 = load i32, i32* %41, align 4
  %296 = icmp eq i32 %294, %295
  %297 = zext i1 %296 to i32
  %298 = load i32, i32* %8, align 4
  %299 = icmp slt i32 %297, %298
  %300 = zext i1 %299 to i32
  %301 = load i32, i32* %14, align 4
  %302 = icmp sgt i32 %300, %301
  %303 = zext i1 %302 to i32
  store i32 %303, i32* %21, align 4
  store i32 %303, i32* %43, align 4
  store i32 -2, i32* %14, align 4
  br label %304

304:                                              ; preds = %322, %269
  %305 = load i32, i32* %14, align 4
  %306 = icmp ne i32 %305, 6
  br i1 %306, label %307, label %325

307:                                              ; preds = %304
  store i16 0, i16* %46, align 2
  %308 = load i16, i16* %6, align 2
  %309 = zext i16 %308 to i32
  %310 = load i32, i32* %8, align 4
  %311 = icmp sge i32 %309, %310
  %312 = zext i1 %311 to i32
  %313 = sitofp i32 %312 to float
  %314 = load i32, i32* %13, align 4
  %315 = sitofp i32 %314 to float
  %316 = fsub float %313, %315
  %317 = load i32, i32* %8, align 4
  %318 = sitofp i32 %317 to float
  %319 = fcmp une float %316, %318
  %320 = zext i1 %319 to i32
  %321 = trunc i32 %320 to i16
  store i16 %321, i16* %46, align 2
  br label %322

322:                                              ; preds = %307
  %323 = load i32, i32* %14, align 4
  %324 = add nsw i32 %323, 8
  store i32 %324, i32* %14, align 4
  br label %304, !llvm.loop !52

325:                                              ; preds = %304
  br label %416

326:                                              ; preds = %216
  store i16 1, i16* %47, align 2
  store i32 9, i32* %48, align 4
  %327 = load i16, i16* %6, align 2
  %328 = icmp ne i16 %327, 0
  br i1 %328, label %329, label %330

329:                                              ; preds = %326
  br label %637

330:                                              ; preds = %326
  store i32 -12, i32* %15, align 4
  br label %331

331:                                              ; preds = %342, %330
  %332 = load i32, i32* %15, align 4
  %333 = icmp sge i32 %332, -5
  br i1 %333, label %334, label %345

334:                                              ; preds = %331
  store i16 -32230, i16* %49, align 2
  %335 = load i32, i32* %21, align 4
  store i32 %335, i32* %40, align 4
  %336 = load i32, i32* %21, align 4
  %337 = icmp ne i32 %336, 0
  br i1 %337, label %338, label %339

338:                                              ; preds = %334
  br label %345

339:                                              ; preds = %334
  %340 = load i16, i16* %39, align 2
  %341 = sext i16 %340 to i32
  store i32 %341, i32* %37, align 4
  store i32 -1, i32* %37, align 4
  br label %342

342:                                              ; preds = %339
  %343 = load i32, i32* %15, align 4
  %344 = add nsw i32 %343, 1
  store i32 %344, i32* %15, align 4
  br label %331, !llvm.loop !53

345:                                              ; preds = %338, %331
  %346 = load i32, i32* %37, align 4
  %347 = icmp ne i32 %346, 0
  br i1 %347, label %348, label %349

348:                                              ; preds = %345
  br label %83

349:                                              ; preds = %345
  store i32 1, i32* %40, align 4
  %350 = load i16, i16* %47, align 2
  %351 = zext i16 %350 to i32
  %352 = icmp slt i32 1, %351
  %353 = zext i1 %352 to i32
  %354 = trunc i32 %353 to i16
  %355 = sext i16 %354 to i32
  %356 = sub nsw i32 0, %355
  %357 = load i16, i16* %6, align 2
  %358 = zext i16 %357 to i32
  %359 = icmp slt i32 %356, %358
  %360 = zext i1 %359 to i32
  %361 = load i16, i16* %9, align 2
  %362 = sext i16 %361 to i32
  %363 = and i32 %360, %362
  %364 = icmp ne i32 %363, 0
  br i1 %364, label %368, label %365

365:                                              ; preds = %349
  %366 = load i32, i32* %8, align 4
  %367 = icmp ne i32 %366, 0
  br label %368

368:                                              ; preds = %365, %349
  %369 = phi i1 [ true, %349 ], [ %367, %365 ]
  %370 = zext i1 %369 to i32
  %371 = lshr i32 %370, 5
  %372 = load i16, i16* %47, align 2
  %373 = zext i16 %372 to i32
  %374 = sub i32 %371, %373
  %375 = sub nsw i32 %374, 0
  %376 = icmp ne i32 %375, 0
  %377 = xor i1 %376, true
  %378 = zext i1 %377 to i32
  %379 = load i32, i32* %21, align 4
  %380 = icmp eq i32 %378, %379
  br i1 %380, label %381, label %388

381:                                              ; preds = %368
  %382 = load i16, i16* %9, align 2
  %383 = icmp ne i16 %382, 0
  br i1 %383, label %384, label %385

384:                                              ; preds = %381
  br label %637

385:                                              ; preds = %381
  %386 = load i32, i32* %37, align 4
  %387 = trunc i32 %386 to i16
  store i16 %387, i16* %5, align 2
  br label %715

388:                                              ; preds = %368
  store float 9.250000e+00, float* %50, align 4
  %389 = load i16, i16* %47, align 2
  %390 = icmp ne i16 %389, 0
  br i1 %390, label %391, label %392

391:                                              ; preds = %388
  br label %637

392:                                              ; preds = %388
  %393 = load i32, i32* %37, align 4
  %394 = sitofp i32 %393 to float
  %395 = fmul float 0x4376FCE160000000, %394
  %396 = load i32, i32* %8, align 4
  %397 = sitofp i32 %396 to float
  %398 = fcmp ogt float %395, %397
  %399 = zext i1 %398 to i32
  store i32 %399, i32* %48, align 4
  %400 = load i32, i32* %40, align 4
  %401 = load i32, i32* %8, align 4
  %402 = icmp slt i32 %400, %401
  %403 = zext i1 %402 to i32
  %404 = load i16, i16* %6, align 2
  %405 = zext i16 %404 to i32
  %406 = icmp sle i32 %403, %405
  %407 = zext i1 %406 to i32
  %408 = load i16, i16* %9, align 2
  %409 = sext i16 %408 to i32
  %410 = icmp slt i32 %407, %409
  %411 = zext i1 %410 to i32
  store i32 %411, i32* %40, align 4
  %412 = load i32, i32* %21, align 4
  store i32 %412, i32* %48, align 4
  %413 = load i16, i16* %6, align 2
  %414 = zext i16 %413 to i32
  store i32 %414, i32* %37, align 4
  br label %415

415:                                              ; preds = %392
  br label %416

416:                                              ; preds = %415, %325
  %417 = load i32, i32* %8, align 4
  %418 = load i16, i16* %6, align 2
  %419 = zext i16 %418 to i32
  %420 = icmp eq i32 %417, %419
  br i1 %420, label %422, label %421

421:                                              ; preds = %416
  br label %422

422:                                              ; preds = %421, %416
  %423 = phi i1 [ true, %416 ], [ false, %421 ]
  %424 = zext i1 %423 to i32
  store i32 %424, i32* %17, align 4
  br i1 %423, label %425, label %450

425:                                              ; preds = %422
  store i32 -1, i32* %51, align 4
  %426 = load i32, i32* %51, align 4
  %427 = icmp ne i32 %426, 0
  br i1 %427, label %428, label %431

428:                                              ; preds = %425
  store i32 -2073795821, i32* %51, align 4
  store i32 -2073795821, i32* %37, align 4
  %429 = load i32, i32* %21, align 4
  %430 = trunc i32 %429 to i16
  store i16 %430, i16* %5, align 2
  br label %715

431:                                              ; preds = %425
  store i32 0, i32* %52, align 4
  %432 = load i32, i32* %52, align 4
  %433 = load i16, i16* %6, align 2
  %434 = zext i16 %433 to i32
  %435 = or i32 %432, %434
  %436 = icmp sgt i32 %435, -8
  %437 = zext i1 %436 to i32
  %438 = load i32, i32* %52, align 4
  %439 = icmp sgt i32 %437, %438
  %440 = zext i1 %439 to i32
  %441 = load i16, i16* %9, align 2
  %442 = sext i16 %441 to i32
  %443 = add nsw i32 %440, %442
  %444 = trunc i32 %443 to i16
  %445 = zext i16 %444 to i32
  %446 = load i16, i16* %6, align 2
  %447 = zext i16 %446 to i32
  %448 = sdiv i32 %445, %447
  store i32 %448, i32* %37, align 4
  br label %449

449:                                              ; preds = %431
  store i32 2, i32* %51, align 4
  br label %493

450:                                              ; preds = %422
  store i16 -8, i16* %53, align 2
  store i32 1, i32* %54, align 4
  %451 = load i32, i32* %36, align 4
  %452 = icmp uge i32 -3, %451
  %453 = zext i1 %452 to i32
  %454 = load i16, i16* %9, align 2
  %455 = sext i16 %454 to i32
  %456 = icmp sge i32 %453, %455
  %457 = zext i1 %456 to i32
  %458 = icmp uge i32 %457, 1
  br i1 %458, label %459, label %489

459:                                              ; preds = %450
  store i32 0, i32* %55, align 4
  store i32 -79219575, i32* %56, align 4
  %460 = load i32, i32* %55, align 4
  %461 = uitofp i32 %460 to double
  %462 = fcmp ogt double 5.750000e+00, %461
  %463 = zext i1 %462 to i32
  %464 = sitofp i32 %463 to double
  %465 = fcmp ole double %464, 0x454A4B361E000000
  %466 = zext i1 %465 to i32
  %467 = sitofp i32 %466 to float
  %468 = load i32, i32* %36, align 4
  %469 = uitofp i32 %468 to float
  %470 = fadd float %467, %469
  %471 = fptosi float %470 to i32
  store i32 %471, i32* %21, align 4
  %472 = load i16, i16* %9, align 2
  %473 = sext i16 %472 to i32
  %474 = udiv i32 1, %473
  %475 = add nsw i32 %474, 4
  %476 = load i32, i32* %41, align 4
  %477 = xor i32 %475, %476
  %478 = load i16, i16* %9, align 2
  %479 = sext i16 %478 to i32
  %480 = mul i32 %477, %479
  %481 = and i32 %480, 8
  %482 = trunc i32 %481 to i16
  %483 = sext i16 %482 to i32
  %484 = load i32, i32* %8, align 4
  %485 = trunc i32 %484 to i16
  %486 = sext i16 %485 to i32
  %487 = shl i32 %483, %486
  store i32 %487, i32* %56, align 4
  %488 = load i32, i32* %8, align 4
  store i32 %488, i32* %54, align 4
  br label %491

489:                                              ; preds = %450
  %490 = load i16, i16* %39, align 2
  store i16 %490, i16* %5, align 2
  br label %715

491:                                              ; preds = %459
  %492 = load i16, i16* %53, align 2
  store i16 %492, i16* %5, align 2
  br label %715

493:                                              ; preds = %449
  %494 = load i32, i32* %8, align 4
  %495 = sitofp i32 %494 to double
  %496 = fcmp olt double 0x4188F992B4000000, %495
  %497 = zext i1 %496 to i32
  %498 = load i32, i32* %38, align 4
  %499 = icmp eq i32 %497, %498
  %500 = zext i1 %499 to i32
  %501 = sitofp i32 %500 to double
  %502 = fcmp une double %501, 1.000000e+00
  %503 = xor i1 %502, true
  %504 = zext i1 %503 to i32
  %505 = sitofp i32 %504 to double
  %506 = fcmp ogt double %505, 6.250000e-01
  %507 = zext i1 %506 to i32
  store i32 %507, i32* %37, align 4
  %508 = load i16, i16* %9, align 2
  %509 = sext i16 %508 to i32
  %510 = xor i32 47696, %509
  %511 = trunc i32 %510 to i16
  %512 = sext i16 %511 to i32
  %513 = add nsw i32 %512, -7565
  %514 = trunc i32 %513 to i16
  %515 = zext i16 %514 to i32
  %516 = load i16, i16* %6, align 2
  %517 = zext i16 %516 to i32
  %518 = sdiv i32 %515, %517
  %519 = icmp ne i32 %518, 0
  br i1 %519, label %520, label %592

520:                                              ; preds = %493
  store i16 -7, i16* %57, align 2
  store i32 0, i32* %58, align 4
  %521 = load i32, i32* %8, align 4
  %522 = load i32, i32* %13, align 4
  %523 = shl i32 %521, %522
  store i32 %523, i32* %40, align 4
  store i16 18, i16* %39, align 2
  br label %524

524:                                              ; preds = %580, %520
  %525 = load i16, i16* %39, align 2
  %526 = sext i16 %525 to i32
  %527 = icmp eq i32 %526, -27
  br i1 %527, label %528, label %585

528:                                              ; preds = %524
  store i16 -2, i16* %59, align 2
  store i16 1859, i16* %60, align 2
  store i32 1755984870, i32* %61, align 4
  %529 = load i16, i16* %6, align 2
  %530 = zext i16 %529 to i32
  %531 = icmp sgt i32 %530, -1
  %532 = zext i1 %531 to i32
  %533 = trunc i32 %532 to i16
  %534 = zext i16 %533 to i32
  %535 = mul nsw i32 %534, 55071
  %536 = trunc i32 %535 to i16
  store i16 %536, i16* %59, align 2
  %537 = sext i16 %536 to i32
  store i32 %537, i32* %40, align 4
  store i16 19, i16* %57, align 2
  %538 = load i32, i32* %8, align 4
  store i32 %538, i32* %21, align 4
  %539 = load i16, i16* %59, align 2
  %540 = sext i16 %539 to i32
  %541 = icmp uge i32 %540, -501059486
  %542 = zext i1 %541 to i32
  %543 = load i16, i16* %6, align 2
  %544 = zext i16 %543 to i32
  %545 = icmp slt i32 %542, %544
  %546 = zext i1 %545 to i32
  %547 = trunc i32 %546 to i16
  %548 = sext i16 %547 to i32
  %549 = sdiv i32 %548, -1
  %550 = load i16, i16* %60, align 2
  %551 = zext i16 %550 to i32
  %552 = or i32 %549, %551
  %553 = load i16, i16* %6, align 2
  %554 = zext i16 %553 to i32
  %555 = icmp ne i32 %552, %554
  br i1 %555, label %556, label %560

556:                                              ; preds = %528
  %557 = load i16, i16* %9, align 2
  %558 = sext i16 %557 to i32
  %559 = icmp ne i32 %558, 0
  br label %560

560:                                              ; preds = %556, %528
  %561 = phi i1 [ false, %528 ], [ %559, %556 ]
  %562 = zext i1 %561 to i32
  %563 = shl i32 %562, 3
  store i32 %563, i32* %58, align 4
  store i32 %563, i32* %21, align 4
  %564 = load i32, i32* %36, align 4
  %565 = icmp ne i32 %563, %564
  %566 = zext i1 %565 to i32
  %567 = load i32, i32* %8, align 4
  %568 = icmp sge i32 %566, %567
  %569 = zext i1 %568 to i32
  %570 = load i32, i32* %40, align 4
  %571 = icmp sle i32 %569, %570
  %572 = zext i1 %571 to i32
  %573 = load i32, i32* %8, align 4
  %574 = add i32 %572, %573
  %575 = load i16, i16* %57, align 2
  %576 = sext i16 %575 to i32
  %577 = shl i32 %574, %576
  store i32 %577, i32* %22, align 4
  %578 = load float, float* %7, align 4
  %579 = fptosi float %578 to i32
  store i32 %579, i32* %61, align 4
  br label %580

580:                                              ; preds = %560
  %581 = load i16, i16* %39, align 2
  %582 = sext i16 %581 to i32
  %583 = sub nsw i32 %582, 1
  %584 = trunc i32 %583 to i16
  store i16 %584, i16* %39, align 2
  br label %524, !llvm.loop !54

585:                                              ; preds = %524
  %586 = load i16, i16* %6, align 2
  %587 = zext i16 %586 to i32
  %588 = xor i32 %587, 574569874
  store i32 %588, i32* %40, align 4
  %589 = load i16, i16* %57, align 2
  %590 = sext i16 %589 to i32
  %591 = sub nsw i32 1, %590
  store i32 %591, i32* %23, align 4
  store i32 %591, i32* %15, align 4
  br label %633

592:                                              ; preds = %493
  store i16 -6, i16* %62, align 2
  %593 = load i16, i16* %39, align 2
  %594 = sext i16 %593 to i32
  %595 = or i32 %594, -1450790224
  %596 = load i32, i32* %23, align 4
  %597 = xor i32 %595, %596
  %598 = trunc i32 %597 to i16
  store i16 %598, i16* %62, align 2
  %599 = load i16, i16* %39, align 2
  %600 = icmp ne i16 %599, 0
  br i1 %600, label %601, label %602

601:                                              ; preds = %592
  br label %637

602:                                              ; preds = %592
  store i32 39557120, i32* %15, align 4
  %603 = load i16, i16* %6, align 2
  %604 = icmp ne i16 %603, 0
  br i1 %604, label %605, label %606

605:                                              ; preds = %602
  br label %637

606:                                              ; preds = %602
  %607 = load i32, i32* %38, align 4
  %608 = uitofp i32 %607 to float
  %609 = fadd float 2.125000e+00, %608
  %610 = load i32, i32* %22, align 4
  %611 = sitofp i32 %610 to float
  %612 = fcmp olt float %609, %611
  %613 = zext i1 %612 to i32
  %614 = sitofp i32 %613 to float
  %615 = fsub float %614, 0x4254F18400000000
  %616 = fcmp une float %615, 0.000000e+00
  %617 = xor i1 %616, true
  %618 = zext i1 %617 to i32
  %619 = sitofp i32 %618 to float
  %620 = load i16, i16* %6, align 2
  %621 = uitofp i16 %620 to float
  %622 = fdiv float %619, %621
  %623 = fpext float %622 to double
  %624 = fcmp olt double %623, 0x43A3E55528000000
  %625 = zext i1 %624 to i32
  %626 = sitofp i32 %625 to float
  %627 = load i32, i32* %22, align 4
  %628 = sitofp i32 %627 to float
  %629 = load i32, i32* %23, align 4
  %630 = sitofp i32 %629 to float
  %631 = call float @llvm.fmuladd.f32(float %626, float %628, float %630)
  %632 = fptosi float %631 to i32
  store i32 %632, i32* %13, align 4
  br label %633

633:                                              ; preds = %606, %585
  br label %634

634:                                              ; preds = %633, %257
  %635 = load i32, i32* %10, align 4
  %636 = add i32 %635, 1
  store i32 %636, i32* %10, align 4
  br label %213, !llvm.loop !55

637:                                              ; preds = %605, %601, %391, %384, %329, %213
  %638 = load i32, i32* %38, align 4
  %639 = icmp ne i32 %638, 0
  br i1 %639, label %640, label %647

640:                                              ; preds = %637
  %641 = load i16, i16* %9, align 2
  %642 = icmp ne i16 %641, 0
  br i1 %642, label %643, label %644

643:                                              ; preds = %640
  br label %83

644:                                              ; preds = %640
  %645 = load i32, i32* %23, align 4
  %646 = trunc i32 %645 to i16
  store i16 %646, i16* %5, align 2
  br label %715

647:                                              ; preds = %637
  store i32 -1176531446, i32* %63, align 4
  store i32 251856676, i32* %64, align 4
  %648 = load i32, i32* %63, align 4
  %649 = icmp sle i32 12834, %648
  %650 = zext i1 %649 to i32
  %651 = trunc i32 %650 to i16
  %652 = zext i16 %651 to i32
  %653 = load i32, i32* %23, align 4
  %654 = trunc i32 %653 to i16
  %655 = zext i16 %654 to i32
  %656 = mul nsw i32 %652, %655
  store i32 %656, i32* %64, align 4
  %657 = load i32, i32* %37, align 4
  %658 = icmp sge i32 %657, 61256
  %659 = zext i1 %658 to i32
  store i32 %659, i32* %13, align 4
  store i32 %659, i32* %15, align 4
  %660 = load i32, i32* %8, align 4
  %661 = icmp ne i32 %660, 0
  br i1 %661, label %662, label %663

662:                                              ; preds = %647
  br label %674

663:                                              ; preds = %647
  br label %664

664:                                              ; preds = %663
  %665 = load i32, i32* %23, align 4
  %666 = icmp eq i32 %665, 0
  %667 = zext i1 %666 to i32
  store i32 %667, i32* %13, align 4
  %668 = load i16, i16* %6, align 2
  store i16 %668, i16* %5, align 2
  br label %715

669:                                              ; No predecessors!
  %670 = load i16, i16* %6, align 2
  %671 = zext i16 %670 to i32
  %672 = add nsw i32 %671, 9
  %673 = trunc i32 %672 to i16
  store i16 %673, i16* %6, align 2
  br label %208, !llvm.loop !56

674:                                              ; preds = %662, %208
  br label %693

675:                                              ; preds = %4
  store float 9.375000e-02, float* %65, align 4
  store i32 9, i32* %66, align 4
  %676 = load i16, i16* %9, align 2
  %677 = sext i16 %676 to i32
  %678 = xor i32 %677, -646191083
  %679 = icmp ne i32 %678, 0
  br i1 %679, label %680, label %683

680:                                              ; preds = %675
  %681 = load i32, i32* %15, align 4
  %682 = icmp ne i32 %681, 0
  br label %683

683:                                              ; preds = %680, %675
  %684 = phi i1 [ false, %675 ], [ %682, %680 ]
  %685 = zext i1 %684 to i32
  %686 = icmp sle i32 %685, 2129839160
  %687 = zext i1 %686 to i32
  %688 = load i32, i32* %66, align 4
  %689 = icmp sle i32 %687, %688
  %690 = zext i1 %689 to i32
  store i32 %690, i32* %13, align 4
  store i32 %690, i32* %66, align 4
  %691 = load i16, i16* %6, align 2
  %692 = zext i16 %691 to i32
  store i32 %692, i32* %66, align 4
  br label %693

693:                                              ; preds = %683, %674
  store i32 425097336, i32* %15, align 4
  %694 = load i32, i32* %17, align 4
  store i32 %694, i32* %13, align 4
  %695 = load i16, i16* %9, align 2
  %696 = sext i16 %695 to i32
  %697 = icmp eq i32 0, %696
  %698 = zext i1 %697 to i32
  %699 = load i32, i32* %14, align 4
  %700 = or i32 %698, %699
  %701 = load i32, i32* %15, align 4
  %702 = icmp sgt i32 %700, %701
  %703 = zext i1 %702 to i32
  %704 = load i32, i32* %19, align 4
  %705 = ashr i32 %703, %704
  %706 = icmp ne i32 %705, 0
  br i1 %706, label %711, label %707

707:                                              ; preds = %693
  %708 = load i16, i16* %6, align 2
  %709 = zext i16 %708 to i32
  %710 = icmp ne i32 %709, 0
  br label %711

711:                                              ; preds = %707, %693
  %712 = phi i1 [ true, %693 ], [ %710, %707 ]
  %713 = zext i1 %712 to i32
  store i32 %713, i32* %13, align 4
  %714 = load i16, i16* %6, align 2
  store i16 %714, i16* %5, align 2
  br label %715

715:                                              ; preds = %711, %664, %644, %491, %489, %428, %385, %200
  %716 = load i16, i16* %5, align 2
  ret i16 %716
}

define internal signext i16 @func_97(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  store i32 1447159339, i32* %11, align 4
  store i32 660780747, i32* %6, align 4
  %12 = load i32, i32* %8, align 4
  store i32 %12, i32* %11, align 4
  %13 = load i32, i32* %10, align 4
  %14 = trunc i32 %13 to i16
  ret i16 %14
}

define internal i32 @func_115(i32 noundef %0, float noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca float, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i16, align 2
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i16, align 2
  %19 = alloca i32, align 4
  %20 = alloca i16, align 2
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i16, align 2
  %24 = alloca i16, align 2
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i16, align 2
  %36 = alloca i16, align 2
  %37 = alloca i32, align 4
  %38 = alloca i16, align 2
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i16, align 2
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca float, align 4
  %45 = alloca float, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  %51 = alloca i32, align 4
  %52 = alloca i32, align 4
  %53 = alloca i16, align 2
  %54 = alloca i16, align 2
  %55 = alloca float, align 4
  %56 = alloca i32, align 4
  %57 = alloca i32, align 4
  %58 = alloca i32, align 4
  %59 = alloca i32, align 4
  %60 = alloca i32, align 4
  %61 = alloca i16, align 2
  %62 = alloca i16, align 2
  %63 = alloca i32, align 4
  %64 = alloca i32, align 4
  %65 = alloca i32, align 4
  %66 = alloca i16, align 2
  %67 = alloca i16, align 2
  %68 = alloca i16, align 2
  %69 = alloca i16, align 2
  %70 = alloca i16, align 2
  %71 = alloca i32, align 4
  %72 = alloca i32, align 4
  %73 = alloca i32, align 4
  %74 = alloca i32, align 4
  %75 = alloca i32, align 4
  %76 = alloca i32, align 4
  %77 = alloca i32, align 4
  %78 = alloca i16, align 2
  %79 = alloca i32, align 4
  %80 = alloca i32, align 4
  %81 = alloca i32, align 4
  %82 = alloca i32, align 4
  %83 = alloca i32, align 4
  %84 = alloca float, align 4
  %85 = alloca i32, align 4
  %86 = alloca float, align 4
  %87 = alloca i32, align 4
  %88 = alloca float, align 4
  %89 = alloca i32, align 4
  %90 = alloca i32, align 4
  %91 = alloca i32, align 4
  %92 = alloca i16, align 2
  %93 = alloca i32, align 4
  %94 = alloca i32, align 4
  %95 = alloca i32, align 4
  %96 = alloca i32, align 4
  %97 = alloca i32, align 4
  %98 = alloca i32, align 4
  %99 = alloca i32, align 4
  %100 = alloca i16, align 2
  %101 = alloca i32, align 4
  %102 = alloca float, align 4
  %103 = alloca float, align 4
  %104 = alloca i32, align 4
  %105 = alloca i32, align 4
  %106 = alloca i32, align 4
  %107 = alloca i32, align 4
  %108 = alloca i32, align 4
  %109 = alloca i16, align 2
  %110 = alloca i32, align 4
  %111 = alloca i32, align 4
  %112 = alloca i32, align 4
  %113 = alloca i32, align 4
  %114 = alloca i16, align 2
  %115 = alloca i32, align 4
  %116 = alloca i32, align 4
  %117 = alloca i32, align 4
  %118 = alloca i32, align 4
  %119 = alloca i32, align 4
  %120 = alloca i32, align 4
  %121 = alloca i32, align 4
  %122 = alloca i32, align 4
  %123 = alloca i16, align 2
  %124 = alloca i32, align 4
  %125 = alloca float, align 4
  %126 = alloca i32, align 4
  %127 = alloca i32, align 4
  %128 = alloca i16, align 2
  %129 = alloca float, align 4
  %130 = alloca i32, align 4
  %131 = alloca i32, align 4
  %132 = alloca i32, align 4
  %133 = alloca i16, align 2
  %134 = alloca i16, align 2
  store i32 %0, i32* %7, align 4
  store float %1, float* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i16 2, i16* %12, align 2
  store i32 -1247056724, i32* %13, align 4
  store i32 0, i32* %14, align 4
  store i32 -1, i32* %15, align 4
  store i32 1973960201, i32* %16, align 4
  store i32 -919989129, i32* %17, align 4
  store i16 25866, i16* %18, align 2
  store i32 813020569, i32* %19, align 4
  store i16 7694, i16* %20, align 2
  store i32 -1758357225, i32* %21, align 4
  store i32 1944654745, i32* %22, align 4
  store i16 -7, i16* %23, align 2
  %135 = load i16, i16* %12, align 2
  %136 = sext i16 %135 to i32
  %137 = load i32, i32* %10, align 4
  %138 = or i32 %136, %137
  %139 = load i16, i16* %12, align 2
  %140 = sitofp i16 %139 to float
  %141 = load i16, i16* %12, align 2
  %142 = sext i16 %141 to i32
  %143 = load i16, i16* %12, align 2
  %144 = sext i16 %143 to i32
  %145 = load i32, i32* %7, align 4
  %146 = call i32 @func_124(i32 noundef %138, float noundef %140, i32 noundef %142, i32 noundef %144, i32 noundef %145)
  store i32 %146, i32* %13, align 4
  %147 = mul nsw i32 %146, -1946351558
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %149, label %573

149:                                              ; preds = %5
  store i16 -628, i16* %24, align 2
  store i32 1289563876, i32* %25, align 4
  store i32 -6, i32* %26, align 4
  br i1 false, label %150, label %430

150:                                              ; preds = %149
  store i32 838500835, i32* %27, align 4
  store i32 1, i32* %28, align 4
  store i32 1, i32* %29, align 4
  br label %151

151:                                              ; preds = %426, %150
  %152 = load i32, i32* %27, align 4
  %153 = trunc i32 %152 to i16
  store i16 %153, i16* %24, align 2
  %154 = load i32, i32* %10, align 4
  %155 = load i32, i32* %7, align 4
  %156 = lshr i32 %154, %155
  %157 = load i16, i16* %24, align 2
  %158 = zext i16 %157 to i32
  %159 = and i32 %156, %158
  %160 = icmp eq i32 %159, 0
  %161 = zext i1 %160 to i32
  %162 = add nsw i32 %161, -8
  %163 = load i32, i32* %7, align 4
  %164 = icmp eq i32 %162, %163
  %165 = zext i1 %164 to i32
  %166 = load i32, i32* %13, align 4
  %167 = and i32 %165, %166
  %168 = icmp ne i32 %167, 0
  br i1 %168, label %169, label %420

169:                                              ; preds = %151
  store i32 0, i32* %30, align 4
  store i32 -9, i32* %31, align 4
  store i32 -4, i32* %32, align 4
  br label %170

170:                                              ; preds = %287, %169
  store i16 5, i16* %12, align 2
  br label %171

171:                                              ; preds = %251, %170
  %172 = load i16, i16* %12, align 2
  %173 = sext i16 %172 to i32
  %174 = icmp sge i32 %173, 29
  br i1 %174, label %175, label %256

175:                                              ; preds = %171
  store i32 1923245696, i32* %33, align 4
  store i16 -7, i16* %24, align 2
  br label %176

176:                                              ; preds = %217, %175
  %177 = load i16, i16* %24, align 2
  %178 = zext i16 %177 to i32
  %179 = icmp sge i32 %178, 18
  br i1 %179, label %180, label %222

180:                                              ; preds = %176
  store i32 -1, i32* %34, align 4
  %181 = load i32, i32* %13, align 4
  store i32 %181, i32* %25, align 4
  store i32 %181, i32* %28, align 4
  %182 = or i32 %181, -1
  %183 = icmp slt i32 %182, 37234
  %184 = zext i1 %183 to i32
  %185 = load i32, i32* %13, align 4
  %186 = icmp ne i32 %184, %185
  %187 = zext i1 %186 to i32
  store i32 %187, i32* %34, align 4
  %188 = xor i32 %187, -1
  store i32 %188, i32* %14, align 4
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %190, label %191

190:                                              ; preds = %180
  br label %191

191:                                              ; preds = %190, %180
  %192 = phi i1 [ false, %180 ], [ true, %190 ]
  %193 = zext i1 %192 to i32
  %194 = load i32, i32* %13, align 4
  %195 = icmp sge i32 %193, %194
  br i1 %195, label %196, label %199

196:                                              ; preds = %191
  %197 = load i32, i32* %10, align 4
  %198 = icmp ne i32 %197, 0
  br label %199

199:                                              ; preds = %196, %191
  %200 = phi i1 [ false, %191 ], [ %198, %196 ]
  %201 = zext i1 %200 to i32
  %202 = load i32, i32* %10, align 4
  %203 = urem i32 %201, %202
  store i32 %203, i32* %30, align 4
  %204 = load i32, i32* %25, align 4
  %205 = sitofp i32 %204 to float
  %206 = load i16, i16* %24, align 2
  %207 = uitofp i16 %206 to float
  %208 = load i32, i32* %7, align 4
  %209 = sitofp i32 %208 to float
  %210 = call float @llvm.fmuladd.f32(float %205, float %207, float %209)
  %211 = fadd float %210, 0x3C45A4DB60000000
  %212 = load i32, i32* %9, align 4
  %213 = sitofp i32 %212 to float
  %214 = fadd float %211, %213
  %215 = fptosi float %214 to i32
  store i32 %215, i32* %25, align 4
  %216 = load i32, i32* %7, align 4
  store i32 %216, i32* %9, align 4
  store i32 1923245696, i32* %6, align 4
  br label %2255

217:                                              ; No predecessors!
  %218 = load i16, i16* %24, align 2
  %219 = zext i16 %218 to i32
  %220 = add nsw i32 %219, 1
  %221 = trunc i32 %220 to i16
  store i16 %221, i16* %24, align 2
  br label %176, !llvm.loop !57

222:                                              ; preds = %176
  %223 = load i32, i32* %9, align 4
  store i32 %223, i32* %25, align 4
  %224 = load i32, i32* %11, align 4
  %225 = shl i32 %223, %224
  %226 = icmp uge i32 %225, -468156208
  %227 = zext i1 %226 to i32
  %228 = udiv i32 %227, 1507792639
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %230, label %237

230:                                              ; preds = %222
  %231 = load i32, i32* %11, align 4
  %232 = sitofp i32 %231 to float
  store float %232, float* %8, align 4
  %233 = load i32, i32* %13, align 4
  store i32 %233, i32* %9, align 4
  %234 = load i32, i32* %25, align 4
  %235 = sub i32 0, %234
  store i32 %235, i32* %31, align 4
  store i32 %235, i32* %32, align 4
  %236 = sub i32 %235, 1923245696
  store i32 %236, i32* %9, align 4
  store i32 4, i32* %13, align 4
  br label %250

237:                                              ; preds = %222
  %238 = load i32, i32* %10, align 4
  %239 = trunc i32 %238 to i16
  %240 = sext i16 %239 to i32
  %241 = sub nsw i32 0, %240
  store i32 %241, i32* %25, align 4
  %242 = load i32, i32* %7, align 4
  store i32 %242, i32* %28, align 4
  %243 = load i32, i32* %9, align 4
  %244 = icmp slt i32 %243, 1923245696
  %245 = zext i1 %244 to i32
  store i32 %245, i32* %31, align 4
  %246 = load i32, i32* %13, align 4
  %247 = icmp sle i32 %245, %246
  %248 = zext i1 %247 to i32
  store i32 %248, i32* %9, align 4
  store i32 1317808164, i32* %13, align 4
  store i32 1317808164, i32* %9, align 4
  %249 = load i32, i32* %11, align 4
  store i32 %249, i32* %6, align 4
  br label %2255

250:                                              ; preds = %230
  br label %251

251:                                              ; preds = %250
  %252 = load i16, i16* %12, align 2
  %253 = sext i16 %252 to i32
  %254 = add nsw i32 %253, 1
  %255 = trunc i32 %254 to i16
  store i16 %255, i16* %12, align 2
  br label %171, !llvm.loop !58

256:                                              ; preds = %171
  store i32 -17, i32* %32, align 4
  br label %257

257:                                              ; preds = %325, %256
  %258 = load i32, i32* %32, align 4
  %259 = icmp ne i32 %258, -27
  br i1 %259, label %260, label %328

260:                                              ; preds = %257
  store i16 0, i16* %35, align 2
  %261 = load i16, i16* %24, align 2
  %262 = zext i16 %261 to i32
  %263 = load i32, i32* %7, align 4
  %264 = mul nsw i32 %262, %263
  %265 = icmp ne i32 %264, 0
  br i1 %265, label %266, label %289

266:                                              ; preds = %260
  %267 = load i32, i32* %11, align 4
  store i32 %267, i32* %25, align 4
  store i32 1, i32* %28, align 4
  %268 = load i32, i32* %25, align 4
  %269 = sitofp i32 %268 to double
  %270 = fcmp ogt double %269, 0x3EC094AB74000000
  %271 = zext i1 %270 to i32
  %272 = load i32, i32* %9, align 4
  %273 = icmp slt i32 %271, %272
  %274 = zext i1 %273 to i32
  %275 = sitofp i32 %274 to double
  %276 = fcmp oeq double %275, 1.987500e+01
  %277 = zext i1 %276 to i32
  %278 = load i32, i32* %30, align 4
  %279 = icmp ne i32 %277, %278
  %280 = zext i1 %279 to i32
  %281 = sitofp i32 %280 to float
  %282 = load i32, i32* %27, align 4
  %283 = sitofp i32 %282 to float
  %284 = fadd float %281, %283
  store float %284, float* %8, align 4
  %285 = load i32, i32* %11, align 4
  %286 = icmp ne i32 %285, 0
  br i1 %286, label %287, label %288

287:                                              ; preds = %266
  br label %170

288:                                              ; preds = %266
  br label %324

289:                                              ; preds = %260
  store i16 -4869, i16* %36, align 2
  store i32 -734834994, i32* %9, align 4
  %290 = load i32, i32* %32, align 4
  %291 = icmp ne i32 %290, 0
  br i1 %291, label %292, label %293

292:                                              ; preds = %289
  br label %328

293:                                              ; preds = %289
  %294 = load i32, i32* %10, align 4
  store i32 %294, i32* %9, align 4
  %295 = load i32, i32* %7, align 4
  %296 = sitofp i32 %295 to float
  %297 = fsub float 0x42C00ED1C0000000, %296
  %298 = fpext float %297 to double
  %299 = fcmp ogt double %298, 2.437500e+00
  %300 = zext i1 %299 to i32
  store i32 %300, i32* %31, align 4
  %301 = load i32, i32* %10, align 4
  %302 = icmp sle i32 %300, %301
  %303 = zext i1 %302 to i32
  %304 = load i16, i16* %24, align 2
  %305 = zext i16 %304 to i32
  %306 = icmp ne i32 %303, %305
  %307 = zext i1 %306 to i32
  %308 = load i32, i32* %27, align 4
  %309 = icmp eq i32 %307, %308
  %310 = zext i1 %309 to i32
  %311 = sitofp i32 %310 to double
  %312 = fcmp oge double %311, -3.750000e+00
  %313 = zext i1 %312 to i32
  %314 = sitofp i32 %313 to float
  %315 = load i16, i16* %36, align 2
  %316 = uitofp i16 %315 to float
  %317 = fmul float %314, %316
  store float %317, float* %8, align 4
  %318 = load i16, i16* %35, align 2
  %319 = zext i16 %318 to i32
  %320 = mul nsw i32 %319, 9
  %321 = load i32, i32* %32, align 4
  %322 = icmp eq i32 %320, %321
  %323 = zext i1 %322 to i32
  store i32 %323, i32* %9, align 4
  br label %324

324:                                              ; preds = %293, %288
  br label %325

325:                                              ; preds = %324
  %326 = load i32, i32* %32, align 4
  %327 = sub nsw i32 %326, 1
  store i32 %327, i32* %32, align 4
  br label %257, !llvm.loop !59

328:                                              ; preds = %292, %257
  %329 = load i32, i32* %28, align 4
  %330 = icmp sgt i32 831505231, %329
  %331 = zext i1 %330 to i32
  %332 = add nsw i32 %331, -1273084006
  %333 = icmp ne i32 %332, 0
  br i1 %333, label %334, label %359

334:                                              ; preds = %328
  store i32 -6, i32* %13, align 4
  %335 = load i16, i16* %24, align 2
  %336 = uitofp i16 %335 to float
  store float %336, float* %8, align 4
  %337 = fptosi float %336 to i32
  store i32 %337, i32* %13, align 4
  store i16 0, i16* %24, align 2
  br label %338

338:                                              ; preds = %353, %334
  %339 = load i16, i16* %24, align 2
  %340 = zext i16 %339 to i32
  %341 = icmp ne i32 %340, 40
  br i1 %341, label %342, label %358

342:                                              ; preds = %338
  %343 = load i16, i16* %12, align 2
  %344 = icmp ne i16 %343, 0
  br i1 %344, label %345, label %346

345:                                              ; preds = %342
  br label %358

346:                                              ; preds = %342
  %347 = load float, float* %8, align 4
  %348 = fcmp une float %347, 0.000000e+00
  %349 = xor i1 %348, true
  %350 = zext i1 %349 to i32
  store i32 %350, i32* %32, align 4
  %351 = sitofp i32 %350 to float
  store float %351, float* %8, align 4
  %352 = load i32, i32* %10, align 4
  store i32 %352, i32* %28, align 4
  br label %353

353:                                              ; preds = %346
  %354 = load i16, i16* %24, align 2
  %355 = zext i16 %354 to i32
  %356 = add nsw i32 %355, 4
  %357 = trunc i32 %356 to i16
  store i16 %357, i16* %24, align 2
  br label %338, !llvm.loop !60

358:                                              ; preds = %345, %338
  br label %399

359:                                              ; preds = %328
  store i32 3, i32* %37, align 4
  %360 = load i32, i32* %7, align 4
  %361 = sitofp i32 %360 to float
  %362 = load i32, i32* %7, align 4
  %363 = sitofp i32 %362 to float
  %364 = fdiv float %361, %363
  %365 = fpext float %364 to double
  %366 = fcmp ole double %365, 9.375000e-02
  %367 = zext i1 %366 to i32
  %368 = load i32, i32* %25, align 4
  %369 = icmp eq i32 %367, %368
  %370 = zext i1 %369 to i32
  %371 = load i32, i32* %7, align 4
  %372 = icmp eq i32 %370, %371
  %373 = zext i1 %372 to i32
  store i32 %373, i32* %25, align 4
  %374 = sitofp i32 %373 to float
  store float %374, float* %8, align 4
  %375 = load i32, i32* %29, align 4
  %376 = load i32, i32* %37, align 4
  %377 = icmp uge i32 %375, %376
  %378 = zext i1 %377 to i32
  %379 = sitofp i32 %378 to float
  %380 = fmul float %379, -3.500000e+00
  %381 = load i32, i32* %9, align 4
  %382 = sitofp i32 %381 to float
  %383 = fcmp oge float %380, %382
  %384 = zext i1 %383 to i32
  store i32 %384, i32* %25, align 4
  %385 = load i16, i16* %24, align 2
  %386 = uitofp i16 %385 to float
  %387 = fmul float 0x439C261180000000, %386
  store float %387, float* %8, align 4
  %388 = load i32, i32* %31, align 4
  store i32 %388, i32* %25, align 4
  %389 = lshr i32 %388, -6
  %390 = load i32, i32* %10, align 4
  %391 = srem i32 %389, %390
  store i32 %391, i32* %9, align 4
  %392 = load i32, i32* %32, align 4
  %393 = trunc i32 %392 to i16
  %394 = zext i16 %393 to i32
  %395 = load i32, i32* %9, align 4
  %396 = trunc i32 %395 to i16
  %397 = zext i16 %396 to i32
  %398 = srem i32 %394, %397
  store i32 %398, i32* %9, align 4
  store i32 %398, i32* %31, align 4
  br label %399

399:                                              ; preds = %359, %358
  %400 = load i32, i32* %28, align 4
  %401 = load i32, i32* %28, align 4
  %402 = add i32 %400, %401
  %403 = sub i32 %402, -150495812
  %404 = or i32 %403, 681177773
  %405 = load i32, i32* %28, align 4
  %406 = icmp ugt i32 %404, %405
  %407 = zext i1 %406 to i32
  %408 = load i32, i32* %31, align 4
  %409 = icmp ne i32 %407, %408
  %410 = zext i1 %409 to i32
  store i32 %410, i32* %31, align 4
  store i32 0, i32* %30, align 4
  br label %411

411:                                              ; preds = %416, %399
  %412 = load i32, i32* %30, align 4
  %413 = icmp slt i32 %412, 29
  br i1 %413, label %414, label %419

414:                                              ; preds = %411
  %415 = load i32, i32* %10, align 4
  store i32 %415, i32* %6, align 4
  br label %2255

416:                                              ; No predecessors!
  %417 = load i32, i32* %30, align 4
  %418 = add nsw i32 %417, 1
  store i32 %418, i32* %30, align 4
  br label %411, !llvm.loop !61

419:                                              ; preds = %411
  br label %428

420:                                              ; preds = %151
  %421 = load i32, i32* %7, align 4
  %422 = load i32, i32* %9, align 4
  %423 = and i32 %421, %422
  store i32 %423, i32* %9, align 4
  %424 = load i16, i16* %24, align 2
  %425 = icmp ne i16 %424, 0
  br i1 %425, label %426, label %427

426:                                              ; preds = %420
  br label %151

427:                                              ; preds = %420
  br label %428

428:                                              ; preds = %427, %419
  %429 = load i32, i32* %25, align 4
  store i32 %429, i32* %6, align 4
  br label %2255

430:                                              ; preds = %149
  store i16 19309, i16* %38, align 2
  store i32 -1023216059, i32* %39, align 4
  store i32 1290999324, i32* %40, align 4
  %431 = load i32, i32* %14, align 4
  %432 = icmp ule i32 65532, %431
  %433 = zext i1 %432 to i32
  %434 = load i32, i32* %7, align 4
  %435 = shl i32 %433, %434
  %436 = and i32 %435, -2109844919
  %437 = load i32, i32* %10, align 4
  %438 = or i32 %436, %437
  %439 = load i32, i32* %9, align 4
  %440 = sdiv i32 %438, %439
  %441 = icmp ne i32 %440, 0
  br i1 %441, label %442, label %446

442:                                              ; preds = %430
  %443 = load i32, i32* %13, align 4
  %444 = icmp ult i32 -686480490, %443
  %445 = zext i1 %444 to i32
  store i32 %445, i32* %9, align 4
  br label %448

446:                                              ; preds = %430
  %447 = load i32, i32* %10, align 4
  store i32 %447, i32* %25, align 4
  br label %448

448:                                              ; preds = %446, %442
  store i32 0, i32* %13, align 4
  br label %449

449:                                              ; preds = %550, %448
  %450 = load i32, i32* %13, align 4
  %451 = icmp sge i32 %450, -17
  br i1 %451, label %452, label %553

452:                                              ; preds = %449
  store i16 1, i16* %41, align 2
  store i32 214722846, i32* %42, align 4
  store i32 -1796016645, i32* %43, align 4
  %453 = load i32, i32* %9, align 4
  %454 = icmp slt i32 %453, 19309
  %455 = zext i1 %454 to i32
  %456 = load i32, i32* %7, align 4
  %457 = icmp sgt i32 %455, %456
  %458 = zext i1 %457 to i32
  %459 = ashr i32 %458, 31
  %460 = icmp ne i32 %459, 0
  br i1 %460, label %461, label %522

461:                                              ; preds = %452
  store float 0x4477A8A200000000, float* %44, align 4
  store float 4.687500e+00, float* %45, align 4
  %462 = load i32, i32* %10, align 4
  %463 = icmp ne i32 %462, 0
  br i1 %463, label %467, label %464

464:                                              ; preds = %461
  %465 = load i32, i32* %10, align 4
  %466 = icmp ne i32 %465, 0
  br label %467

467:                                              ; preds = %464, %461
  %468 = phi i1 [ true, %461 ], [ %466, %464 ]
  %469 = zext i1 %468 to i32
  %470 = trunc i32 %469 to i16
  store i16 %470, i16* %41, align 2
  %471 = icmp ne i16 %470, 0
  br i1 %471, label %472, label %497

472:                                              ; preds = %467
  store i32 -1954411815, i32* %46, align 4
  %473 = load i32, i32* %42, align 4
  store i32 %473, i32* %39, align 4
  %474 = trunc i32 %473 to i16
  %475 = sext i16 %474 to i32
  %476 = load i32, i32* %9, align 4
  %477 = trunc i32 %476 to i16
  %478 = sext i16 %477 to i32
  %479 = srem i32 %475, %478
  %480 = sub i32 0, %479
  %481 = or i32 %480, 1
  %482 = trunc i32 %481 to i16
  %483 = sext i16 %482 to i32
  %484 = load i32, i32* %7, align 4
  %485 = trunc i32 %484 to i16
  %486 = sext i16 %485 to i32
  %487 = sdiv i32 %483, %486
  %488 = load i32, i32* %11, align 4
  %489 = shl i32 %487, %488
  %490 = icmp ugt i32 %489, -6
  %491 = zext i1 %490 to i32
  store i32 %491, i32* %46, align 4
  store i32 1, i32* %9, align 4
  %492 = load i32, i32* %13, align 4
  %493 = sitofp i32 %492 to float
  %494 = load float, float* %8, align 4
  %495 = fcmp ole float %493, %494
  %496 = zext i1 %495 to i32
  store i32 %496, i32* %25, align 4
  br label %514

497:                                              ; preds = %467
  %498 = load i32, i32* %11, align 4
  %499 = load i32, i32* %9, align 4
  %500 = add i32 %498, %499
  %501 = icmp ne i32 %500, 0
  %502 = xor i1 %501, true
  %503 = zext i1 %502 to i32
  %504 = icmp ult i32 %503, -511609890
  %505 = zext i1 %504 to i32
  %506 = trunc i32 %505 to i16
  %507 = zext i16 %506 to i32
  %508 = load i32, i32* %10, align 4
  %509 = trunc i32 %508 to i16
  %510 = zext i16 %509 to i32
  %511 = add nsw i32 %507, %510
  %512 = icmp sgt i32 %511, 21175
  %513 = zext i1 %512 to i32
  store i32 %513, i32* %15, align 4
  br label %514

514:                                              ; preds = %497, %472
  store i32 33554432, i32* %43, align 4
  br i1 true, label %515, label %516

515:                                              ; preds = %514
  br label %516

516:                                              ; preds = %515, %514
  %517 = phi i1 [ false, %514 ], [ true, %515 ]
  %518 = zext i1 %517 to i32
  store i32 %518, i32* %39, align 4
  %519 = trunc i32 %518 to i16
  %520 = zext i16 %519 to i32
  %521 = sub nsw i32 %520, 65535
  store i32 %521, i32* %40, align 4
  br label %549

522:                                              ; preds = %452
  store i32 -1083307847, i32* %47, align 4
  store i32 1, i32* %48, align 4
  %523 = load i32, i32* %10, align 4
  store i32 %523, i32* %9, align 4
  %524 = load i32, i32* %14, align 4
  %525 = load i32, i32* %47, align 4
  %526 = add nsw i32 %524, %525
  %527 = trunc i32 %526 to i16
  %528 = sext i16 %527 to i32
  %529 = load i32, i32* %40, align 4
  %530 = trunc i32 %529 to i16
  %531 = sext i16 %530 to i32
  %532 = add nsw i32 %528, %531
  %533 = trunc i32 %532 to i16
  %534 = sext i16 %533 to i32
  %535 = ashr i32 %534, 6
  %536 = icmp ne i32 %535, 0
  br i1 %536, label %537, label %540

537:                                              ; preds = %522
  %538 = load i32, i32* %9, align 4
  %539 = icmp ne i32 %538, 0
  br label %540

540:                                              ; preds = %537, %522
  %541 = phi i1 [ false, %522 ], [ %539, %537 ]
  %542 = zext i1 %541 to i32
  store i32 %542, i32* %48, align 4
  %543 = trunc i32 %542 to i16
  %544 = zext i16 %543 to i32
  %545 = load i32, i32* %13, align 4
  %546 = trunc i32 %545 to i16
  %547 = zext i16 %546 to i32
  %548 = ashr i32 %544, %547
  store i32 %548, i32* %47, align 4
  store i32 -1, i32* %9, align 4
  br label %549

549:                                              ; preds = %540, %516
  br label %550

550:                                              ; preds = %549
  %551 = load i32, i32* %13, align 4
  %552 = sub nsw i32 %551, 1
  store i32 %552, i32* %13, align 4
  br label %449, !llvm.loop !62

553:                                              ; preds = %449
  %554 = load i32, i32* %16, align 4
  %555 = load i32, i32* %9, align 4
  %556 = icmp ult i32 %554, %555
  %557 = zext i1 %556 to i32
  %558 = load i16, i16* %24, align 2
  %559 = zext i16 %558 to i32
  %560 = icmp slt i32 %557, %559
  %561 = zext i1 %560 to i32
  %562 = xor i32 %561, 16597
  %563 = icmp ne i32 %562, 0
  br i1 %563, label %567, label %564

564:                                              ; preds = %553
  %565 = load i32, i32* %10, align 4
  %566 = icmp ne i32 %565, 0
  br label %567

567:                                              ; preds = %564, %553
  %568 = phi i1 [ true, %553 ], [ %566, %564 ]
  %569 = zext i1 %568 to i32
  %570 = ashr i32 %569, 30
  %571 = xor i32 %570, 37766
  store i32 %571, i32* %25, align 4
  br label %572

572:                                              ; preds = %567
  br label %2155

573:                                              ; preds = %5
  store i32 176733492, i32* %49, align 4
  store i32 1329804700, i32* %50, align 4
  store i32 0, i32* %51, align 4
  store i32 7, i32* %52, align 4
  store i16 17031, i16* %53, align 2
  store i16 -7037, i16* %54, align 2
  store float 0x3EE54E2E40000000, float* %55, align 4
  br label %574

574:                                              ; preds = %1387, %573
  %575 = load i32, i32* %10, align 4
  %576 = load i32, i32* %17, align 4
  %577 = mul i32 %575, %576
  %578 = icmp ne i32 %577, 0
  br i1 %578, label %579, label %723

579:                                              ; preds = %574
  store i32 864771819, i32* %56, align 4
  store i32 1, i32* %57, align 4
  %580 = load i32, i32* %11, align 4
  %581 = sitofp i32 %580 to float
  %582 = load i32, i32* %56, align 4
  %583 = sitofp i32 %582 to float
  %584 = fmul float %581, %583
  %585 = fcmp une float %584, 0.000000e+00
  %586 = xor i1 %585, true
  %587 = zext i1 %586 to i32
  store i32 %587, i32* %15, align 4
  %588 = load i32, i32* %13, align 4
  %589 = sdiv i32 1, %588
  %590 = load i32, i32* %9, align 4
  %591 = icmp sgt i32 %589, %590
  %592 = xor i1 %591, true
  %593 = zext i1 %592 to i32
  store i32 %593, i32* %13, align 4
  %594 = load i32, i32* %49, align 4
  %595 = load i32, i32* %49, align 4
  %596 = or i32 %594, %595
  %597 = load i32, i32* %15, align 4
  %598 = sub i32 %596, %597
  store i32 %598, i32* %15, align 4
  %599 = load i32, i32* %49, align 4
  %600 = uitofp i32 %599 to float
  %601 = load i32, i32* %9, align 4
  %602 = sitofp i32 %601 to float
  %603 = fdiv float %600, %602
  store float %603, float* %8, align 4
  %604 = load i32, i32* %11, align 4
  %605 = load i32, i32* %16, align 4
  %606 = icmp ne i32 %604, %605
  %607 = zext i1 %606 to i32
  %608 = load i32, i32* %56, align 4
  %609 = xor i32 %607, %608
  store i32 %609, i32* %57, align 4
  %610 = icmp ne i32 %609, 0
  br i1 %610, label %611, label %652

611:                                              ; preds = %579
  store i32 1487433130, i32* %58, align 4
  %612 = load i32, i32* %9, align 4
  store i32 %612, i32* %13, align 4
  br label %613

613:                                              ; preds = %643, %611
  store i32 -23, i32* %49, align 4
  br label %614

614:                                              ; preds = %646, %613
  %615 = load i32, i32* %49, align 4
  %616 = icmp ugt i32 %615, 53
  br i1 %616, label %617, label %649

617:                                              ; preds = %614
  store i32 -978180863, i32* %59, align 4
  %618 = load i32, i32* %59, align 4
  %619 = uitofp i32 %618 to float
  %620 = fmul float %619, 0x3A654DCB40000000
  %621 = load i32, i32* %59, align 4
  %622 = uitofp i32 %621 to float
  %623 = fcmp ole float %620, %622
  %624 = zext i1 %623 to i32
  %625 = sitofp i32 %624 to float
  %626 = load i32, i32* %49, align 4
  %627 = uitofp i32 %626 to float
  %628 = fdiv float %625, %627
  %629 = load i32, i32* %59, align 4
  %630 = uitofp i32 %629 to float
  %631 = fcmp oeq float %628, %630
  %632 = zext i1 %631 to i32
  %633 = load i32, i32* %49, align 4
  %634 = icmp ugt i32 %632, %633
  %635 = zext i1 %634 to i32
  %636 = load i32, i32* %9, align 4
  %637 = icmp sgt i32 %635, %636
  %638 = zext i1 %637 to i32
  %639 = sitofp i32 %638 to float
  %640 = fdiv float %639, 0x3A2A6F8C80000000
  store float %640, float* %8, align 4
  store i32 -192876362, i32* %58, align 4
  %641 = load i32, i32* %15, align 4
  %642 = icmp ne i32 %641, 0
  br i1 %642, label %643, label %644

643:                                              ; preds = %617
  br label %613

644:                                              ; preds = %617
  %645 = load i32, i32* %10, align 4
  store i32 %645, i32* %6, align 4
  br label %2255

646:                                              ; No predecessors!
  %647 = load i32, i32* %49, align 4
  %648 = add i32 %647, 1
  store i32 %648, i32* %49, align 4
  br label %614, !llvm.loop !63

649:                                              ; preds = %614
  %650 = load i16, i16* %18, align 2
  %651 = zext i16 %650 to i32
  store i32 %651, i32* %6, align 4
  br label %2255

652:                                              ; preds = %579
  store i32 397409093, i32* %60, align 4
  store i32 0, i32* %13, align 4
  br label %653

653:                                              ; preds = %674, %652
  %654 = load i32, i32* %13, align 4
  %655 = icmp eq i32 %654, -30
  br i1 %655, label %656, label %677

656:                                              ; preds = %653
  %657 = load i32, i32* %49, align 4
  %658 = uitofp i32 %657 to double
  %659 = fcmp oge double -9.375000e+00, %658
  %660 = zext i1 %659 to i32
  store i32 %660, i32* %60, align 4
  %661 = load i32, i32* %10, align 4
  %662 = icmp ne i32 %661, 0
  br i1 %662, label %663, label %664

663:                                              ; preds = %656
  br label %677

664:                                              ; preds = %656
  %665 = load i32, i32* %10, align 4
  %666 = sitofp i32 %665 to float
  %667 = load i32, i32* %13, align 4
  %668 = sitofp i32 %667 to float
  %669 = fsub float %666, %668
  %670 = load i32, i32* %60, align 4
  %671 = sitofp i32 %670 to float
  %672 = fadd float %669, %671
  %673 = fptosi float %672 to i32
  store i32 %673, i32* %15, align 4
  br label %674

674:                                              ; preds = %664
  %675 = load i32, i32* %13, align 4
  %676 = sub nsw i32 %675, 5
  store i32 %676, i32* %13, align 4
  br label %653, !llvm.loop !64

677:                                              ; preds = %663, %653
  store i32 -29, i32* %56, align 4
  br label %678

678:                                              ; preds = %701, %677
  %679 = load i32, i32* %56, align 4
  %680 = icmp eq i32 %679, -9
  br i1 %680, label %681, label %704

681:                                              ; preds = %678
  %682 = load i32, i32* %9, align 4
  %683 = xor i32 29974, %682
  %684 = trunc i32 %683 to i16
  %685 = zext i16 %684 to i32
  %686 = load i32, i32* %10, align 4
  %687 = trunc i32 %686 to i16
  %688 = zext i16 %687 to i32
  %689 = srem i32 %685, %688
  %690 = load i32, i32* %9, align 4
  %691 = icmp sge i32 %689, %690
  %692 = zext i1 %691 to i32
  %693 = xor i32 %692, 0
  %694 = load i32, i32* %10, align 4
  %695 = xor i32 %693, %694
  %696 = trunc i32 %695 to i16
  %697 = sext i16 %696 to i32
  %698 = shl i32 %697, 9
  %699 = mul nsw i32 %698, 1333054565
  store i32 %699, i32* %9, align 4
  %700 = load i32, i32* %11, align 4
  store i32 %700, i32* %6, align 4
  br label %2255

701:                                              ; No predecessors!
  %702 = load i32, i32* %56, align 4
  %703 = add nsw i32 %702, 1
  store i32 %703, i32* %56, align 4
  br label %678, !llvm.loop !65

704:                                              ; preds = %678
  store i32 11, i32* %60, align 4
  br label %705

705:                                              ; preds = %718, %704
  %706 = load i32, i32* %60, align 4
  %707 = icmp eq i32 %706, -8
  br i1 %707, label %708, label %721

708:                                              ; preds = %705
  %709 = load i32, i32* %11, align 4
  %710 = sitofp i32 %709 to float
  %711 = load i32, i32* %49, align 4
  %712 = uitofp i32 %711 to float
  %713 = fsub float %710, %712
  store float %713, float* %8, align 4
  %714 = load i32, i32* %57, align 4
  store i32 %714, i32* %56, align 4
  %715 = load i32, i32* %10, align 4
  %716 = and i32 %715, 406111536
  %717 = xor i32 %716, -5
  store i32 %717, i32* %9, align 4
  br label %718

718:                                              ; preds = %708
  %719 = load i32, i32* %60, align 4
  %720 = sub nsw i32 %719, 1
  store i32 %720, i32* %60, align 4
  br label %705, !llvm.loop !66

721:                                              ; preds = %705
  br label %722

722:                                              ; preds = %721
  br label %849

723:                                              ; preds = %574
  store i16 -1, i16* %61, align 2
  %724 = load i32, i32* %7, align 4
  %725 = srem i32 %724, -1
  %726 = icmp ne i32 %725, 0
  br i1 %726, label %727, label %751

727:                                              ; preds = %723
  store i16 -1, i16* %62, align 2
  %728 = load i32, i32* %10, align 4
  %729 = icmp ne i32 %728, 0
  br i1 %729, label %731, label %730

730:                                              ; preds = %727
  br label %731

731:                                              ; preds = %730, %727
  %732 = phi i1 [ true, %727 ], [ false, %730 ]
  %733 = zext i1 %732 to i32
  %734 = trunc i32 %733 to i16
  %735 = zext i16 %734 to i32
  %736 = srem i32 %735, 14368
  %737 = trunc i32 %736 to i16
  %738 = sext i16 %737 to i32
  %739 = ashr i32 %738, 5
  %740 = load i32, i32* %9, align 4
  %741 = icmp sle i32 %739, %740
  %742 = zext i1 %741 to i32
  %743 = load i32, i32* %10, align 4
  %744 = add nsw i32 %742, %743
  %745 = load i32, i32* %16, align 4
  %746 = icmp ugt i32 %744, %745
  %747 = zext i1 %746 to i32
  store i32 %747, i32* %9, align 4
  %748 = load i16, i16* %62, align 2
  %749 = zext i16 %748 to i32
  store i32 %749, i32* %9, align 4
  %750 = load i32, i32* %11, align 4
  store i32 %750, i32* %6, align 4
  br label %2255

751:                                              ; preds = %723
  store i32 -6, i32* %63, align 4
  store i32 1029686771, i32* %64, align 4
  %752 = load i32, i32* %11, align 4
  %753 = load i32, i32* %10, align 4
  %754 = urem i32 %752, %753
  %755 = icmp ule i32 %754, -1
  %756 = zext i1 %755 to i32
  %757 = trunc i32 %756 to i16
  %758 = zext i16 %757 to i32
  %759 = load i32, i32* %9, align 4
  %760 = trunc i32 %759 to i16
  %761 = zext i16 %760 to i32
  %762 = srem i32 %758, %761
  %763 = trunc i32 %762 to i16
  %764 = zext i16 %763 to i32
  %765 = add nsw i32 %764, 4504
  %766 = sub i32 %765, -2044441872
  store i32 %766, i32* %19, align 4
  %767 = load i32, i32* %63, align 4
  store i32 %767, i32* %17, align 4
  %768 = load i32, i32* %9, align 4
  store i32 %768, i32* %9, align 4
  %769 = load i32, i32* %17, align 4
  %770 = load i32, i32* %63, align 4
  %771 = icmp ne i32 %769, %770
  br i1 %771, label %772, label %835

772:                                              ; preds = %751
  store i32 -1, i32* %65, align 4
  %773 = load i32, i32* %49, align 4
  %774 = icmp ne i32 %773, 0
  %775 = xor i1 %774, true
  %776 = zext i1 %775 to i32
  %777 = load i32, i32* %7, align 4
  %778 = udiv i32 %776, %777
  %779 = icmp ne i32 %778, 0
  br i1 %779, label %786, label %780

780:                                              ; preds = %772
  %781 = load i32, i32* %9, align 4
  %782 = icmp ne i32 %781, 0
  br i1 %782, label %786, label %783

783:                                              ; preds = %780
  %784 = load i32, i32* %9, align 4
  %785 = icmp ne i32 %784, 0
  br i1 %785, label %786, label %817

786:                                              ; preds = %783, %780, %772
  store i16 28572, i16* %66, align 2
  %787 = load i32, i32* %7, align 4
  %788 = load i32, i32* %65, align 4
  %789 = icmp slt i32 %787, %788
  %790 = zext i1 %789 to i32
  %791 = load i32, i32* %11, align 4
  %792 = xor i32 %790, %791
  %793 = icmp ne i32 %792, 0
  br i1 %793, label %794, label %801

794:                                              ; preds = %786
  %795 = load i16, i16* %66, align 2
  %796 = sext i16 %795 to i32
  %797 = icmp ne i32 %796, 0
  br i1 %797, label %798, label %801

798:                                              ; preds = %794
  %799 = load i32, i32* %16, align 4
  %800 = icmp ne i32 %799, 0
  br label %801

801:                                              ; preds = %798, %794, %786
  %802 = phi i1 [ false, %794 ], [ false, %786 ], [ %800, %798 ]
  %803 = zext i1 %802 to i32
  %804 = load i32, i32* %49, align 4
  %805 = xor i32 %803, %804
  %806 = load i32, i32* %49, align 4
  %807 = icmp ule i32 %805, %806
  %808 = zext i1 %807 to i32
  store i32 %808, i32* %9, align 4
  %809 = load i32, i32* %10, align 4
  %810 = sitofp i32 %809 to double
  %811 = fcmp une double %810, -2.375000e+00
  %812 = zext i1 %811 to i32
  %813 = sitofp i32 %812 to float
  store float %813, float* %8, align 4
  %814 = load i32, i32* %11, align 4
  %815 = sitofp i32 %814 to float
  store float %815, float* %8, align 4
  %816 = load i32, i32* %11, align 4
  store i32 %816, i32* %9, align 4
  br label %833

817:                                              ; preds = %783
  store i16 24953, i16* %67, align 2
  store i16 1, i16* %68, align 2
  %818 = load i32, i32* %11, align 4
  %819 = trunc i32 %818 to i16
  store i16 %819, i16* %67, align 2
  %820 = load i32, i32* %63, align 4
  %821 = icmp ne i32 %820, 0
  br i1 %821, label %825, label %822

822:                                              ; preds = %817
  %823 = load i32, i32* %9, align 4
  %824 = icmp ne i32 %823, 0
  br label %825

825:                                              ; preds = %822, %817
  %826 = phi i1 [ true, %817 ], [ %824, %822 ]
  %827 = zext i1 %826 to i32
  %828 = icmp ne i32 %827, 1995607044
  %829 = zext i1 %828 to i32
  %830 = icmp slt i32 %829, 7
  %831 = zext i1 %830 to i32
  %832 = trunc i32 %831 to i16
  store i16 %832, i16* %68, align 2
  br label %833

833:                                              ; preds = %825, %801
  %834 = load i32, i32* %10, align 4
  store i32 %834, i32* %6, align 4
  br label %2255

835:                                              ; preds = %751
  %836 = load i32, i32* %49, align 4
  %837 = uitofp i32 %836 to float
  store float %837, float* %8, align 4
  %838 = load i32, i32* %11, align 4
  %839 = sitofp i32 %838 to float
  %840 = call float @llvm.fmuladd.f32(float %839, float 1.387500e+01, float -4.937500e+00)
  %841 = fpext float %840 to double
  %842 = fcmp oge double %841, 0.000000e+00
  %843 = zext i1 %842 to i32
  %844 = sitofp i32 %843 to double
  %845 = fcmp olt double %844, 0x3BEA3A8DEC000000
  %846 = zext i1 %845 to i32
  store i32 %846, i32* %64, align 4
  br label %847

847:                                              ; preds = %835
  br label %848

848:                                              ; preds = %847
  store i32 65535, i32* %50, align 4
  store i16 0, i16* %61, align 2
  br label %849

849:                                              ; preds = %848, %722
  br label %850

850:                                              ; preds = %2005, %849
  %851 = load i32, i32* %10, align 4
  %852 = sitofp i32 %851 to float
  %853 = fmul float %852, -1.575000e+01
  store float %853, float* %8, align 4
  %854 = load i32, i32* %49, align 4
  %855 = icmp ne i32 %854, 0
  br i1 %855, label %856, label %1930

856:                                              ; preds = %850
  store i16 -1, i16* %69, align 2
  store i16 1, i16* %70, align 2
  store i32 1, i32* %71, align 4
  store i32 -791086584, i32* %72, align 4
  store i32 1, i32* %73, align 4
  br label %857

857:                                              ; preds = %1742, %856
  %858 = load i32, i32* %49, align 4
  %859 = load i32, i32* %11, align 4
  %860 = icmp ule i32 %858, %859
  %861 = zext i1 %860 to i32
  %862 = mul i32 %861, 426506197
  %863 = trunc i32 %862 to i16
  %864 = zext i16 %863 to i32
  %865 = sub nsw i32 %864, 1
  %866 = icmp ne i32 %865, 0
  br i1 %866, label %867, label %1379

867:                                              ; preds = %857
  store i32 -436929428, i32* %74, align 4
  store i32 1332691407, i32* %75, align 4
  store i32 -239020904, i32* %76, align 4
  %868 = load i32, i32* %7, align 4
  %869 = icmp ne i32 %868, 0
  br i1 %869, label %870, label %979

870:                                              ; preds = %867
  store i32 8, i32* %77, align 4
  br label %871

871:                                              ; preds = %937, %870
  store i32 20, i32* %50, align 4
  br label %872

872:                                              ; preds = %909, %871
  %873 = load i32, i32* %50, align 4
  %874 = icmp eq i32 %873, 2
  br i1 %874, label %875, label %912

875:                                              ; preds = %872
  %876 = load i32, i32* %10, align 4
  %877 = add i32 %876, 7
  %878 = load i32, i32* %74, align 4
  %879 = icmp ne i32 %877, %878
  %880 = zext i1 %879 to i32
  store i32 %880, i32* %51, align 4
  %881 = load i32, i32* %9, align 4
  %882 = icmp sge i32 %880, %881
  br i1 %882, label %883, label %884

883:                                              ; preds = %875
  br label %884

884:                                              ; preds = %883, %875
  %885 = phi i1 [ false, %875 ], [ false, %883 ]
  %886 = zext i1 %885 to i32
  %887 = icmp ne i32 %886, 65532
  %888 = zext i1 %887 to i32
  %889 = icmp ule i32 %888, -1021660610
  %890 = zext i1 %889 to i32
  %891 = trunc i32 %890 to i16
  %892 = sext i16 %891 to i32
  %893 = load i32, i32* %10, align 4
  %894 = trunc i32 %893 to i16
  %895 = sext i16 %894 to i32
  %896 = sdiv i32 %892, %895
  %897 = lshr i32 %896, 4
  %898 = load i32, i32* %74, align 4
  %899 = icmp eq i32 %897, %898
  br i1 %899, label %903, label %900

900:                                              ; preds = %884
  %901 = load i32, i32* %7, align 4
  %902 = icmp ne i32 %901, 0
  br label %903

903:                                              ; preds = %900, %884
  %904 = phi i1 [ true, %884 ], [ %902, %900 ]
  %905 = zext i1 %904 to i32
  %906 = icmp ne i32 %905, 27838
  %907 = zext i1 %906 to i32
  %908 = trunc i32 %907 to i16
  store i16 %908, i16* %20, align 2
  store i32 0, i32* %9, align 4
  br label %909

909:                                              ; preds = %903
  %910 = load i32, i32* %50, align 4
  %911 = sub nsw i32 %910, 8
  store i32 %911, i32* %50, align 4
  br label %872, !llvm.loop !67

912:                                              ; preds = %872
  %913 = load i32, i32* %7, align 4
  %914 = icmp sgt i32 1, %913
  br i1 %914, label %915, label %918

915:                                              ; preds = %912
  %916 = load i32, i32* %7, align 4
  %917 = icmp ne i32 %916, 0
  br label %918

918:                                              ; preds = %915, %912
  %919 = phi i1 [ false, %912 ], [ %917, %915 ]
  %920 = zext i1 %919 to i32
  %921 = load i32, i32* %7, align 4
  %922 = mul nsw i32 %920, %921
  %923 = icmp ne i32 %922, 0
  br i1 %923, label %924, label %927

924:                                              ; preds = %918
  %925 = load i32, i32* %7, align 4
  %926 = icmp ne i32 %925, 0
  br label %927

927:                                              ; preds = %924, %918
  %928 = phi i1 [ false, %918 ], [ %926, %924 ]
  %929 = zext i1 %928 to i32
  %930 = sdiv i32 %929, 1
  store i32 %930, i32* %9, align 4
  %931 = load i32, i32* %9, align 4
  %932 = xor i32 %931, 20518
  %933 = icmp ne i32 %932, 0
  br i1 %933, label %934, label %939

934:                                              ; preds = %927
  %935 = load i32, i32* %13, align 4
  %936 = icmp ne i32 %935, 0
  br i1 %936, label %937, label %938

937:                                              ; preds = %934
  br label %871

938:                                              ; preds = %934
  br label %965

939:                                              ; preds = %927
  store i32 1, i32* %9, align 4
  %940 = load i32, i32* %10, align 4
  %941 = icmp ne i32 %940, 0
  br i1 %941, label %942, label %943

942:                                              ; preds = %939
  br label %943

943:                                              ; preds = %942, %939
  %944 = phi i1 [ false, %939 ], [ true, %942 ]
  %945 = zext i1 %944 to i32
  %946 = load i32, i32* %11, align 4
  %947 = and i32 %945, %946
  %948 = icmp ne i32 %947, 0
  br i1 %948, label %952, label %949

949:                                              ; preds = %943
  %950 = load i32, i32* %11, align 4
  %951 = icmp ne i32 %950, 0
  br label %952

952:                                              ; preds = %949, %943
  %953 = phi i1 [ true, %943 ], [ %951, %949 ]
  %954 = zext i1 %953 to i32
  %955 = mul i32 %954, -1411848576
  %956 = and i32 %955, -1707112959
  %957 = load i32, i32* %9, align 4
  %958 = lshr i32 %956, %957
  store i32 %958, i32* %77, align 4
  %959 = icmp ugt i32 %958, 14015
  br i1 %959, label %960, label %961

960:                                              ; preds = %952
  br label %961

961:                                              ; preds = %960, %952
  %962 = phi i1 [ false, %952 ], [ true, %960 ]
  %963 = zext i1 %962 to i32
  store i32 %963, i32* %9, align 4
  %964 = load i32, i32* %11, align 4
  store i32 %964, i32* %6, align 4
  br label %2255

965:                                              ; preds = %938
  %966 = load i32, i32* %74, align 4
  store i32 %966, i32* %50, align 4
  %967 = sitofp i32 %966 to float
  %968 = load float, float* %8, align 4
  %969 = fcmp ogt float %967, %968
  %970 = zext i1 %969 to i32
  %971 = load i32, i32* %11, align 4
  %972 = icmp sle i32 %970, %971
  %973 = zext i1 %972 to i32
  %974 = sitofp i32 %973 to float
  %975 = fadd float %974, -4.125000e+00
  %976 = load float, float* %8, align 4
  %977 = fsub float %975, %976
  %978 = fptosi float %977 to i32
  store i32 %978, i32* %15, align 4
  br label %1116

979:                                              ; preds = %867
  store i16 -4, i16* %78, align 2
  store i32 -601965164, i32* %79, align 4
  store i32 565384316, i32* %80, align 4
  %980 = load i32, i32* %10, align 4
  %981 = icmp ne i32 %980, 0
  br i1 %981, label %982, label %985

982:                                              ; preds = %979
  %983 = load i32, i32* %74, align 4
  %984 = icmp ne i32 %983, 0
  br label %985

985:                                              ; preds = %982, %979
  %986 = phi i1 [ false, %979 ], [ %984, %982 ]
  %987 = zext i1 %986 to i32
  store i32 %987, i32* %15, align 4
  %988 = sub nsw i32 0, %987
  %989 = icmp sgt i32 %988, -1
  %990 = zext i1 %989 to i32
  %991 = trunc i32 %990 to i16
  %992 = sext i16 %991 to i32
  %993 = ashr i32 %992, 8
  %994 = icmp ne i32 %993, -4
  %995 = zext i1 %994 to i32
  %996 = load i32, i32* %7, align 4
  %997 = lshr i32 %995, %996
  %998 = icmp eq i32 %997, 19986
  %999 = zext i1 %998 to i32
  %1000 = load i32, i32* %75, align 4
  %1001 = icmp ule i32 %999, %1000
  %1002 = zext i1 %1001 to i32
  %1003 = load i32, i32* %9, align 4
  %1004 = icmp ne i32 %1002, %1003
  %1005 = zext i1 %1004 to i32
  %1006 = trunc i32 %1005 to i16
  %1007 = sext i16 %1006 to i32
  %1008 = sub nsw i32 0, %1007
  store i32 %1008, i32* %13, align 4
  %1009 = trunc i32 %1008 to i16
  store i16 %1009, i16* %78, align 2
  %1010 = zext i16 %1009 to i32
  %1011 = load i32, i32* %7, align 4
  %1012 = lshr i32 %1010, %1011
  %1013 = icmp ne i32 %1012, 0
  br i1 %1013, label %1014, label %1029

1014:                                             ; preds = %985
  %1015 = load i32, i32* %10, align 4
  %1016 = add i32 -1, %1015
  %1017 = load i32, i32* %11, align 4
  %1018 = or i32 %1016, %1017
  %1019 = trunc i32 %1018 to i16
  %1020 = sext i16 %1019 to i32
  %1021 = load i32, i32* %50, align 4
  %1022 = trunc i32 %1021 to i16
  %1023 = sext i16 %1022 to i32
  %1024 = add nsw i32 %1020, %1023
  %1025 = load i16, i16* %69, align 2
  %1026 = zext i16 %1025 to i32
  %1027 = add nsw i32 %1024, %1026
  store i32 %1027, i32* %74, align 4
  %1028 = load i32, i32* %9, align 4
  store i32 %1028, i32* %6, align 4
  br label %2255

1029:                                             ; preds = %985
  store i32 2009376278, i32* %81, align 4
  %1030 = load i32, i32* %81, align 4
  store i32 %1030, i32* %50, align 4
  %1031 = load i32, i32* %9, align 4
  store i32 %1031, i32* %51, align 4
  %1032 = load i32, i32* %7, align 4
  %1033 = load i32, i32* %51, align 4
  %1034 = icmp slt i32 %1032, %1033
  %1035 = zext i1 %1034 to i32
  store i32 %1035, i32* %74, align 4
  %1036 = trunc i32 %1035 to i16
  %1037 = sext i16 %1036 to i32
  %1038 = add nsw i32 %1037, -1
  %1039 = trunc i32 %1038 to i16
  %1040 = zext i16 %1039 to i32
  %1041 = shl i32 %1040, 5
  %1042 = trunc i32 %1041 to i16
  %1043 = zext i16 %1042 to i32
  %1044 = load i32, i32* %10, align 4
  %1045 = trunc i32 %1044 to i16
  %1046 = zext i16 %1045 to i32
  %1047 = sub nsw i32 %1043, %1046
  %1048 = icmp eq i32 %1047, 1
  %1049 = zext i1 %1048 to i32
  store i32 %1049, i32* %9, align 4
  br label %1050

1050:                                             ; preds = %1029
  %1051 = load i32, i32* %51, align 4
  %1052 = load i32, i32* %11, align 4
  %1053 = icmp sle i32 %1051, %1052
  %1054 = zext i1 %1053 to i32
  store i32 %1054, i32* %79, align 4
  store i32 %1054, i32* %17, align 4
  store i32 %1054, i32* %80, align 4
  %1055 = load i32, i32* %9, align 4
  %1056 = sitofp i32 %1055 to float
  %1057 = fmul float 0.000000e+00, %1056
  %1058 = fpext float %1057 to double
  %1059 = fcmp ole double %1058, 0x4262D91A50000000
  %1060 = zext i1 %1059 to i32
  %1061 = sitofp i32 %1060 to float
  %1062 = load float, float* %8, align 4
  %1063 = fmul float %1061, %1062
  %1064 = fptosi float %1063 to i32
  store i32 %1064, i32* %74, align 4
  %1065 = load i16, i16* %12, align 2
  %1066 = icmp ne i16 %1065, 0
  br i1 %1066, label %1067, label %1086

1067:                                             ; preds = %1050
  store i32 1756145290, i32* %82, align 4
  store i32 -1, i32* %83, align 4
  %1068 = load i32, i32* %9, align 4
  %1069 = trunc i32 %1068 to i16
  %1070 = sext i16 %1069 to i32
  %1071 = sub nsw i32 0, %1070
  store i32 %1071, i32* %74, align 4
  store i32 %1071, i32* %82, align 4
  %1072 = sub i32 %1071, 131928214
  %1073 = trunc i32 %1072 to i16
  %1074 = sext i16 %1073 to i32
  %1075 = load i32, i32* %11, align 4
  %1076 = trunc i32 %1075 to i16
  %1077 = sext i16 %1076 to i32
  %1078 = mul nsw i32 %1074, %1077
  store i32 %1078, i32* %83, align 4
  %1079 = load i32, i32* %9, align 4
  %1080 = xor i32 %1078, %1079
  store i32 %1080, i32* %9, align 4
  %1081 = load i32, i32* %14, align 4
  %1082 = load i16, i16* %70, align 2
  %1083 = zext i16 %1082 to i32
  %1084 = icmp ne i32 %1081, %1083
  %1085 = zext i1 %1084 to i32
  store i32 %1085, i32* %17, align 4
  br label %1105

1086:                                             ; preds = %1050
  %1087 = load i32, i32* %10, align 4
  %1088 = load i32, i32* %11, align 4
  %1089 = icmp sge i32 %1087, %1088
  %1090 = zext i1 %1089 to i32
  %1091 = load i32, i32* %7, align 4
  %1092 = lshr i32 %1090, %1091
  %1093 = load i32, i32* %7, align 4
  %1094 = icmp eq i32 %1092, %1093
  %1095 = zext i1 %1094 to i32
  %1096 = shl i32 %1095, 11
  %1097 = load i16, i16* %69, align 2
  %1098 = zext i16 %1097 to i32
  %1099 = add i32 %1096, %1098
  %1100 = icmp ne i32 %1099, 15095
  %1101 = zext i1 %1100 to i32
  %1102 = load i32, i32* %50, align 4
  %1103 = icmp sle i32 %1101, %1102
  %1104 = zext i1 %1103 to i32
  store i32 %1104, i32* %9, align 4
  br label %1105

1105:                                             ; preds = %1086, %1067
  %1106 = load float, float* %8, align 4
  store float %1106, float* %8, align 4
  %1107 = fpext float %1106 to double
  %1108 = fcmp une double %1107, 0x4120F74F50000000
  %1109 = zext i1 %1108 to i32
  %1110 = load i32, i32* %11, align 4
  %1111 = icmp eq i32 %1109, %1110
  %1112 = zext i1 %1111 to i32
  %1113 = sitofp i32 %1112 to float
  %1114 = fdiv float %1113, 0x3A6FB50B20000000
  %1115 = fptosi float %1114 to i32
  store i32 %1115, i32* %79, align 4
  br label %1116

1116:                                             ; preds = %1105, %965
  store i32 25, i32* %75, align 4
  br label %1117

1117:                                             ; preds = %1251, %1116
  %1118 = load i32, i32* %75, align 4
  %1119 = icmp ne i32 %1118, 59
  br i1 %1119, label %1120, label %1254

1120:                                             ; preds = %1117
  store float 0x4433863540000000, float* %84, align 4
  store i32 1524997149, i32* %85, align 4
  store i32 0, i32* %16, align 4
  br label %1121

1121:                                             ; preds = %1132, %1120
  %1122 = load i32, i32* %16, align 4
  %1123 = icmp ule i32 %1122, 20
  br i1 %1123, label %1124, label %1135

1124:                                             ; preds = %1121
  store float 6.875000e-01, float* %86, align 4
  %1125 = load i16, i16* %69, align 2
  %1126 = zext i16 %1125 to i32
  %1127 = load i32, i32* %7, align 4
  %1128 = icmp eq i32 %1126, %1127
  %1129 = zext i1 %1128 to i32
  %1130 = or i32 %1129, 1
  store i32 %1130, i32* %9, align 4
  %1131 = load i32, i32* %10, align 4
  store i32 %1131, i32* %6, align 4
  br label %2255

1132:                                             ; No predecessors!
  %1133 = load i32, i32* %16, align 4
  %1134 = add i32 %1133, 1
  store i32 %1134, i32* %16, align 4
  br label %1121, !llvm.loop !68

1135:                                             ; preds = %1121
  %1136 = load i32, i32* %7, align 4
  store i32 %1136, i32* %9, align 4
  %1137 = load i32, i32* %49, align 4
  %1138 = load i32, i32* %74, align 4
  %1139 = shl i32 %1137, %1138
  store i32 %1139, i32* %9, align 4
  %1140 = load i32, i32* %10, align 4
  %1141 = shl i32 -650588751, %1140
  %1142 = icmp slt i32 %1141, 30276
  br i1 %1142, label %1143, label %1144

1143:                                             ; preds = %1135
  br label %1144

1144:                                             ; preds = %1143, %1135
  %1145 = phi i1 [ false, %1135 ], [ true, %1143 ]
  %1146 = zext i1 %1145 to i32
  %1147 = load i32, i32* %85, align 4
  %1148 = add nsw i32 %1146, %1147
  %1149 = icmp slt i32 %1148, 0
  %1150 = zext i1 %1149 to i32
  %1151 = load i32, i32* %85, align 4
  %1152 = xor i32 %1150, %1151
  %1153 = icmp ne i32 %1152, 0
  br i1 %1153, label %1155, label %1154

1154:                                             ; preds = %1144
  br label %1155

1155:                                             ; preds = %1154, %1144
  %1156 = phi i1 [ true, %1144 ], [ true, %1154 ]
  %1157 = zext i1 %1156 to i32
  %1158 = load i32, i32* %49, align 4
  %1159 = sdiv i32 %1157, %1158
  %1160 = trunc i32 %1159 to i16
  %1161 = zext i16 %1160 to i32
  %1162 = ashr i32 %1161, 4
  %1163 = mul nsw i32 %1162, 5
  store i32 %1163, i32* %85, align 4
  %1164 = icmp ne i32 %1163, 0
  br i1 %1164, label %1168, label %1165

1165:                                             ; preds = %1155
  %1166 = load i32, i32* %9, align 4
  %1167 = icmp ne i32 %1166, 0
  br label %1168

1168:                                             ; preds = %1165, %1155
  %1169 = phi i1 [ true, %1155 ], [ %1167, %1165 ]
  %1170 = zext i1 %1169 to i32
  %1171 = trunc i32 %1170 to i16
  %1172 = zext i16 %1171 to i32
  %1173 = load i32, i32* %10, align 4
  %1174 = trunc i32 %1173 to i16
  %1175 = zext i16 %1174 to i32
  %1176 = shl i32 %1172, %1175
  %1177 = and i32 %1176, -7
  %1178 = trunc i32 %1177 to i16
  %1179 = sext i16 %1178 to i32
  %1180 = mul nsw i32 %1179, 2
  %1181 = trunc i32 %1180 to i16
  %1182 = zext i16 %1181 to i32
  %1183 = shl i32 %1182, 12
  %1184 = trunc i32 %1183 to i16
  %1185 = sext i16 %1184 to i32
  %1186 = add nsw i32 %1185, -32118
  %1187 = icmp ne i32 %1186, 0
  br i1 %1187, label %1188, label %1201

1188:                                             ; preds = %1168
  store i32 0, i32* %87, align 4
  store i32 -1, i32* %9, align 4
  %1189 = load i32, i32* %9, align 4
  %1190 = icmp slt i32 %1189, -6
  %1191 = zext i1 %1190 to i32
  store i32 %1191, i32* %71, align 4
  br i1 %1190, label %1195, label %1192

1192:                                             ; preds = %1188
  %1193 = load i32, i32* %9, align 4
  %1194 = icmp ne i32 %1193, 0
  br label %1195

1195:                                             ; preds = %1192, %1188
  %1196 = phi i1 [ true, %1188 ], [ %1194, %1192 ]
  %1197 = zext i1 %1196 to i32
  %1198 = icmp ule i32 %1197, -465761158
  %1199 = zext i1 %1198 to i32
  store i32 %1199, i32* %9, align 4
  %1200 = load i32, i32* %87, align 4
  store i32 %1200, i32* %6, align 4
  br label %2255

1201:                                             ; preds = %1168
  store i32 16631, i32* %74, align 4
  %1202 = load i32, i32* %76, align 4
  %1203 = icmp eq i32 16631, %1202
  %1204 = zext i1 %1203 to i32
  %1205 = trunc i32 %1204 to i16
  %1206 = zext i16 %1205 to i32
  %1207 = load i32, i32* %11, align 4
  %1208 = trunc i32 %1207 to i16
  %1209 = zext i16 %1208 to i32
  %1210 = add nsw i32 %1206, %1209
  %1211 = xor i32 %1210, -1259921381
  %1212 = icmp eq i32 %1211, 0
  %1213 = zext i1 %1212 to i32
  store i32 %1213, i32* %9, align 4
  %1214 = mul nsw i32 %1213, 1
  %1215 = trunc i32 %1214 to i16
  %1216 = sext i16 %1215 to i32
  %1217 = load i16, i16* %69, align 2
  %1218 = sext i16 %1217 to i32
  %1219 = mul nsw i32 %1216, %1218
  %1220 = load i32, i32* %71, align 4
  %1221 = xor i32 %1219, %1220
  %1222 = icmp sle i32 %1221, -2
  %1223 = zext i1 %1222 to i32
  %1224 = load i32, i32* %11, align 4
  %1225 = icmp sgt i32 %1223, %1224
  %1226 = zext i1 %1225 to i32
  %1227 = trunc i32 %1226 to i16
  %1228 = sext i16 %1227 to i32
  %1229 = load i32, i32* %11, align 4
  %1230 = trunc i32 %1229 to i16
  %1231 = sext i16 %1230 to i32
  %1232 = sdiv i32 %1228, %1231
  %1233 = load i32, i32* %75, align 4
  %1234 = icmp uge i32 %1232, %1233
  %1235 = zext i1 %1234 to i32
  %1236 = load i32, i32* %7, align 4
  %1237 = and i32 %1235, %1236
  store i32 %1237, i32* %51, align 4
  %1238 = trunc i32 %1237 to i16
  %1239 = zext i16 %1238 to i32
  %1240 = load i32, i32* %21, align 4
  %1241 = trunc i32 %1240 to i16
  %1242 = zext i16 %1241 to i32
  %1243 = sdiv i32 %1239, %1242
  %1244 = load i32, i32* %11, align 4
  %1245 = add nsw i32 %1243, %1244
  %1246 = shl i32 %1245, 29
  %1247 = load i16, i16* %70, align 2
  %1248 = zext i16 %1247 to i32
  %1249 = xor i32 %1246, %1248
  store i32 %1249, i32* %85, align 4
  %1250 = load i32, i32* %11, align 4
  store i32 %1250, i32* %6, align 4
  br label %2255

1251:                                             ; No predecessors!
  %1252 = load i32, i32* %75, align 4
  %1253 = add i32 %1252, 1
  store i32 %1253, i32* %75, align 4
  br label %1117, !llvm.loop !69

1254:                                             ; preds = %1117
  %1255 = load i32, i32* %74, align 4
  %1256 = load i32, i32* %71, align 4
  %1257 = icmp sge i32 %1255, %1256
  %1258 = zext i1 %1257 to i32
  %1259 = trunc i32 %1258 to i16
  %1260 = sext i16 %1259 to i32
  %1261 = load i32, i32* %9, align 4
  %1262 = trunc i32 %1261 to i16
  %1263 = sext i16 %1262 to i32
  %1264 = add nsw i32 %1260, %1263
  %1265 = icmp ne i32 %1264, 0
  br i1 %1265, label %1266, label %1315

1266:                                             ; preds = %1254
  store float -5.625000e+00, float* %88, align 4
  store i32 2098271822, i32* %89, align 4
  %1267 = load i32, i32* %51, align 4
  store i32 %1267, i32* %71, align 4
  %1268 = xor i32 %1267, 52742
  %1269 = icmp ne i32 %1268, 0
  br i1 %1269, label %1270, label %1290

1270:                                             ; preds = %1266
  store i32 1, i32* %90, align 4
  %1271 = load i32, i32* %9, align 4
  %1272 = sitofp i32 %1271 to float
  %1273 = load float, float* %8, align 4
  %1274 = fcmp ogt float %1272, %1273
  %1275 = zext i1 %1274 to i32
  %1276 = sitofp i32 %1275 to float
  %1277 = load i32, i32* %90, align 4
  %1278 = uitofp i32 %1277 to float
  %1279 = fdiv float %1276, %1278
  %1280 = fpext float %1279 to double
  %1281 = fcmp oge double %1280, 0x3CE28DAB38000000
  %1282 = zext i1 %1281 to i32
  %1283 = load i32, i32* %7, align 4
  %1284 = icmp ne i32 %1282, %1283
  %1285 = zext i1 %1284 to i32
  store i32 %1285, i32* %89, align 4
  store i32 -1, i32* %17, align 4
  br i1 true, label %1287, label %1286

1286:                                             ; preds = %1270
  br label %1287

1287:                                             ; preds = %1286, %1270
  %1288 = phi i1 [ true, %1270 ], [ false, %1286 ]
  %1289 = zext i1 %1288 to i32
  store i32 %1289, i32* %89, align 4
  br label %1312

1290:                                             ; preds = %1266
  store i32 -1991860902, i32* %91, align 4
  %1291 = load i32, i32* %19, align 4
  %1292 = srem i32 0, %1291
  %1293 = trunc i32 %1292 to i16
  %1294 = zext i16 %1293 to i32
  %1295 = load i32, i32* %7, align 4
  %1296 = trunc i32 %1295 to i16
  %1297 = zext i16 %1296 to i32
  %1298 = sdiv i32 %1294, %1297
  %1299 = trunc i32 %1298 to i16
  %1300 = sext i16 %1299 to i32
  %1301 = mul nsw i32 %1300, -1
  %1302 = load i32, i32* %15, align 4
  %1303 = icmp eq i32 %1301, %1302
  %1304 = zext i1 %1303 to i32
  store i32 %1304, i32* %17, align 4
  store i32 -5, i32* %9, align 4
  %1305 = load i32, i32* %22, align 4
  store i32 %1305, i32* %9, align 4
  %1306 = load i32, i32* %11, align 4
  %1307 = icmp ult i32 65535, %1306
  %1308 = zext i1 %1307 to i32
  %1309 = load i32, i32* %91, align 4
  %1310 = icmp sgt i32 %1308, %1309
  %1311 = zext i1 %1310 to i32
  store i32 %1311, i32* %9, align 4
  br label %1312

1312:                                             ; preds = %1290, %1287
  %1313 = load i16, i16* %70, align 2
  %1314 = zext i16 %1313 to i32
  store i32 %1314, i32* %15, align 4
  br label %1366

1315:                                             ; preds = %1254
  store i16 -1, i16* %92, align 2
  store i32 -8, i32* %93, align 4
  store i32 -344827595, i32* %94, align 4
  %1316 = load i32, i32* %76, align 4
  store i32 %1316, i32* %71, align 4
  %1317 = load i32, i32* %51, align 4
  %1318 = load i16, i16* %92, align 2
  %1319 = zext i16 %1318 to i32
  %1320 = icmp sge i32 %1317, %1319
  %1321 = zext i1 %1320 to i32
  %1322 = load i32, i32* %49, align 4
  %1323 = icmp ugt i32 %1321, %1322
  %1324 = zext i1 %1323 to i32
  %1325 = sitofp i32 %1324 to double
  %1326 = fcmp oge double %1325, 0x3C317B3564000000
  %1327 = zext i1 %1326 to i32
  %1328 = sitofp i32 %1327 to float
  %1329 = load i32, i32* %7, align 4
  %1330 = sitofp i32 %1329 to float
  %1331 = fmul float %1328, %1330
  %1332 = load float, float* %8, align 4
  %1333 = fcmp ogt float %1331, %1332
  %1334 = zext i1 %1333 to i32
  %1335 = sitofp i32 %1334 to float
  %1336 = fmul float %1335, -5.312500e-01
  %1337 = load i32, i32* %21, align 4
  %1338 = uitofp i32 %1337 to float
  %1339 = fcmp oeq float %1336, %1338
  %1340 = zext i1 %1339 to i32
  %1341 = sitofp i32 %1340 to float
  %1342 = fsub float %1341, 0x4317695120000000
  %1343 = load i32, i32* %21, align 4
  %1344 = uitofp i32 %1343 to float
  %1345 = fdiv float %1342, %1344
  %1346 = load i32, i32* %7, align 4
  %1347 = sitofp i32 %1346 to float
  %1348 = fcmp ogt float %1345, %1347
  %1349 = zext i1 %1348 to i32
  %1350 = sitofp i32 %1349 to double
  %1351 = fcmp oeq double %1350, 0x3AA1352088000000
  %1352 = zext i1 %1351 to i32
  %1353 = sitofp i32 %1352 to float
  store float %1353, float* %8, align 4
  %1354 = load i32, i32* %9, align 4
  %1355 = sitofp i32 %1354 to double
  %1356 = fcmp oge double %1355, 0x44F03E9110000000
  %1357 = zext i1 %1356 to i32
  %1358 = load i32, i32* %15, align 4
  %1359 = icmp slt i32 %1357, %1358
  %1360 = zext i1 %1359 to i32
  %1361 = sitofp i32 %1360 to double
  %1362 = fcmp olt double %1361, 0x3E516ECBE8000000
  %1363 = zext i1 %1362 to i32
  store i32 %1363, i32* %94, align 4
  store i32 -784919191, i32* %9, align 4
  %1364 = load i32, i32* %9, align 4
  %1365 = mul nsw i32 1, %1364
  store i32 %1365, i32* %93, align 4
  br label %1366

1366:                                             ; preds = %1315, %1312
  %1367 = load i32, i32* %11, align 4
  %1368 = and i32 %1367, 7
  store i32 %1368, i32* %9, align 4
  %1369 = load i32, i32* %10, align 4
  %1370 = trunc i32 %1369 to i16
  %1371 = sext i16 %1370 to i32
  %1372 = shl i32 27838, %1371
  %1373 = trunc i32 %1372 to i16
  %1374 = sext i16 %1373 to i32
  %1375 = mul nsw i32 %1374, -1
  %1376 = load i32, i32* %10, align 4
  %1377 = icmp slt i32 %1375, %1376
  %1378 = zext i1 %1377 to i32
  store i32 %1378, i32* %9, align 4
  br label %1381

1379:                                             ; preds = %857
  store i32 2, i32* %95, align 4
  %1380 = load i32, i32* %95, align 4
  store i32 %1380, i32* %6, align 4
  br label %2255

1381:                                             ; preds = %1366
  %1382 = load i32, i32* %7, align 4
  %1383 = icmp ne i32 %1382, 0
  br i1 %1383, label %1384, label %1919

1384:                                             ; preds = %1381
  store i32 0, i32* %96, align 4
  store i32 7, i32* %97, align 4
  store i32 0, i32* %98, align 4
  store i32 1, i32* %99, align 4
  %1385 = load i32, i32* %16, align 4
  %1386 = icmp ne i32 %1385, 0
  br i1 %1386, label %1387, label %1388

1387:                                             ; preds = %1384
  br label %574

1388:                                             ; preds = %1384
  %1389 = load i16, i16* %53, align 2
  %1390 = icmp ne i16 %1389, 0
  br i1 %1390, label %1391, label %1420

1391:                                             ; preds = %1388
  store i16 1, i16* %100, align 2
  %1392 = load i32, i32* %96, align 4
  %1393 = load i32, i32* %96, align 4
  %1394 = icmp eq i32 %1392, %1393
  %1395 = zext i1 %1394 to i32
  %1396 = sitofp i32 %1395 to double
  %1397 = fcmp ole double %1396, 0x3CC81CBFDC000000
  %1398 = zext i1 %1397 to i32
  %1399 = sitofp i32 %1398 to float
  %1400 = load i16, i16* %100, align 2
  %1401 = uitofp i16 %1400 to float
  %1402 = fadd float %1399, %1401
  %1403 = fneg float %1402
  %1404 = fdiv float %1403, 0x3A74077F00000000
  store float %1404, float* %8, align 4
  %1405 = fsub float %1404, 6.250000e-01
  %1406 = fpext float %1405 to double
  %1407 = fcmp oeq double %1406, 2.750000e+00
  %1408 = zext i1 %1407 to i32
  %1409 = sitofp i32 %1408 to float
  %1410 = load i16, i16* %69, align 2
  %1411 = uitofp i16 %1410 to float
  %1412 = fsub float %1409, %1411
  %1413 = fsub float %1412, 3.250000e+00
  %1414 = fpext float %1413 to double
  %1415 = fcmp oge double %1414, -1.125000e+00
  %1416 = zext i1 %1415 to i32
  %1417 = load i32, i32* %7, align 4
  %1418 = icmp slt i32 %1416, %1417
  %1419 = zext i1 %1418 to i32
  store i32 %1419, i32* %71, align 4
  br label %1509

1420:                                             ; preds = %1388
  store i32 -1, i32* %101, align 4
  store i32 0, i32* %9, align 4
  store i32 0, i32* %50, align 4
  br i1 false, label %1421, label %1423

1421:                                             ; preds = %1420
  %1422 = load i32, i32* %7, align 4
  store i32 %1422, i32* %6, align 4
  br label %2255

1423:                                             ; preds = %1420
  store float 1.125000e+00, float* %102, align 4
  store i32 -2071727025, i32* %9, align 4
  %1424 = load i32, i32* %96, align 4
  %1425 = shl i32 %1424, 26
  %1426 = load i32, i32* %10, align 4
  %1427 = icmp eq i32 %1425, %1426
  %1428 = zext i1 %1427 to i32
  %1429 = ashr i32 %1428, 9
  %1430 = shl i32 %1429, 3
  %1431 = trunc i32 %1430 to i16
  %1432 = sext i16 %1431 to i32
  %1433 = sub nsw i32 %1432, -1
  %1434 = load i32, i32* %71, align 4
  %1435 = and i32 %1433, %1434
  store i32 %1435, i32* %9, align 4
  br label %1436

1436:                                             ; preds = %1423
  %1437 = load i32, i32* %51, align 4
  store i32 %1437, i32* %50, align 4
  %1438 = load i16, i16* %69, align 2
  %1439 = zext i16 %1438 to i32
  %1440 = load i32, i32* %96, align 4
  %1441 = icmp slt i32 %1439, %1440
  br i1 %1441, label %1446, label %1442

1442:                                             ; preds = %1436
  %1443 = load i16, i16* %12, align 2
  %1444 = sext i16 %1443 to i32
  %1445 = icmp ne i32 %1444, 0
  br label %1446

1446:                                             ; preds = %1442, %1436
  %1447 = phi i1 [ true, %1436 ], [ %1445, %1442 ]
  %1448 = zext i1 %1447 to i32
  %1449 = load i32, i32* %96, align 4
  %1450 = icmp sgt i32 %1448, %1449
  %1451 = zext i1 %1450 to i32
  store i32 %1451, i32* %17, align 4
  br i1 %1450, label %1452, label %1506

1452:                                             ; preds = %1446
  store float -2.000000e+00, float* %103, align 4
  %1453 = load i32, i32* %9, align 4
  %1454 = and i32 -10, %1453
  %1455 = trunc i32 %1454 to i16
  %1456 = zext i16 %1455 to i32
  %1457 = mul nsw i32 %1456, 1
  %1458 = icmp ne i32 %1457, 0
  br i1 %1458, label %1462, label %1459

1459:                                             ; preds = %1452
  %1460 = load i32, i32* %9, align 4
  %1461 = icmp ne i32 %1460, 0
  br label %1462

1462:                                             ; preds = %1459, %1452
  %1463 = phi i1 [ false, %1452 ], [ %1461, %1459 ]
  %1464 = zext i1 %1463 to i32
  %1465 = load i16, i16* %69, align 2
  %1466 = zext i16 %1465 to i32
  %1467 = add i32 %1464, %1466
  %1468 = load i32, i32* %10, align 4
  %1469 = lshr i32 %1467, %1468
  %1470 = load i32, i32* %11, align 4
  %1471 = sub nsw i32 %1469, %1470
  %1472 = ashr i32 %1471, 30
  store i32 %1472, i32* %9, align 4
  %1473 = load i32, i32* %9, align 4
  %1474 = load i32, i32* %96, align 4
  %1475 = icmp slt i32 %1473, %1474
  %1476 = zext i1 %1475 to i32
  %1477 = load i32, i32* %10, align 4
  %1478 = and i32 %1476, %1477
  %1479 = trunc i32 %1478 to i16
  %1480 = zext i16 %1479 to i32
  %1481 = load i32, i32* %101, align 4
  %1482 = trunc i32 %1481 to i16
  %1483 = zext i16 %1482 to i32
  %1484 = mul nsw i32 %1480, %1483
  %1485 = or i32 %1484, -1564099737
  %1486 = icmp uge i32 %1485, 7
  br i1 %1486, label %1487, label %1490

1487:                                             ; preds = %1462
  %1488 = load i32, i32* %71, align 4
  %1489 = icmp ne i32 %1488, 0
  br label %1490

1490:                                             ; preds = %1487, %1462
  %1491 = phi i1 [ false, %1462 ], [ %1489, %1487 ]
  %1492 = zext i1 %1491 to i32
  %1493 = load i32, i32* %10, align 4
  %1494 = icmp sgt i32 %1492, %1493
  %1495 = zext i1 %1494 to i32
  %1496 = load i32, i32* %101, align 4
  %1497 = urem i32 %1495, %1496
  store i32 %1497, i32* %13, align 4
  store i32 %1497, i32* %71, align 4
  %1498 = trunc i32 %1497 to i16
  %1499 = zext i16 %1498 to i32
  %1500 = shl i32 %1499, 1
  %1501 = load i16, i16* %53, align 2
  %1502 = sext i16 %1501 to i32
  %1503 = and i32 %1500, %1502
  store i32 %1503, i32* %97, align 4
  %1504 = load i16, i16* %70, align 2
  %1505 = zext i16 %1504 to i32
  store i32 %1505, i32* %50, align 4
  br label %1508

1506:                                             ; preds = %1446
  store i32 1, i32* %104, align 4
  store i32 0, i32* %71, align 4
  %1507 = load i32, i32* %104, align 4
  store i32 %1507, i32* %6, align 4
  br label %2255

1508:                                             ; preds = %1490
  br label %1509

1509:                                             ; preds = %1508, %1391
  %1510 = load i32, i32* %11, align 4
  %1511 = icmp ne i32 %1510, 0
  br i1 %1511, label %1512, label %1673

1512:                                             ; preds = %1509
  store i32 -1, i32* %105, align 4
  store i32 1, i32* %106, align 4
  store i32 391612548, i32* %107, align 4
  %1513 = load i32, i32* %14, align 4
  store i32 %1513, i32* %71, align 4
  %1514 = load i32, i32* %10, align 4
  %1515 = icmp ne i32 %1514, 0
  br i1 %1515, label %1516, label %1517

1516:                                             ; preds = %1512
  br label %1565

1517:                                             ; preds = %1512
  %1518 = load i16, i16* %70, align 2
  %1519 = zext i16 %1518 to i32
  %1520 = mul i32 %1519, 4
  %1521 = load i32, i32* %11, align 4
  %1522 = mul nsw i32 %1520, %1521
  %1523 = icmp ne i32 %1522, 29041
  %1524 = zext i1 %1523 to i32
  %1525 = load i32, i32* %11, align 4
  %1526 = icmp slt i32 %1524, %1525
  %1527 = zext i1 %1526 to i32
  %1528 = and i32 %1527, -482681924
  store i32 %1528, i32* %50, align 4
  store i32 %1528, i32* %105, align 4
  %1529 = icmp ne i32 %1528, 0
  br i1 %1529, label %1534, label %1530

1530:                                             ; preds = %1517
  %1531 = load i16, i16* %69, align 2
  %1532 = zext i16 %1531 to i32
  %1533 = icmp ne i32 %1532, 0
  br label %1534

1534:                                             ; preds = %1530, %1517
  %1535 = phi i1 [ true, %1517 ], [ %1533, %1530 ]
  %1536 = zext i1 %1535 to i32
  %1537 = ashr i32 %1536, 15
  %1538 = load i16, i16* %20, align 2
  %1539 = sext i16 %1538 to i32
  %1540 = icmp slt i32 %1537, %1539
  %1541 = zext i1 %1540 to i32
  store i32 %1541, i32* %106, align 4
  br i1 %1540, label %1542, label %1545

1542:                                             ; preds = %1534
  %1543 = load i32, i32* %105, align 4
  %1544 = icmp ne i32 %1543, 0
  br label %1545

1545:                                             ; preds = %1542, %1534
  %1546 = phi i1 [ false, %1534 ], [ %1544, %1542 ]
  %1547 = zext i1 %1546 to i32
  %1548 = load i32, i32* %107, align 4
  %1549 = icmp sgt i32 %1547, %1548
  %1550 = zext i1 %1549 to i32
  %1551 = load i32, i32* %107, align 4
  %1552 = icmp eq i32 %1550, %1551
  br i1 %1552, label %1553, label %1584

1553:                                             ; preds = %1545
  %1554 = load i32, i32* %9, align 4
  store i32 %1554, i32* %107, align 4
  %1555 = load i32, i32* %7, align 4
  %1556 = icmp sgt i32 %1554, %1555
  %1557 = zext i1 %1556 to i32
  %1558 = trunc i32 %1557 to i16
  %1559 = zext i16 %1558 to i32
  %1560 = sub nsw i32 0, %1559
  %1561 = load i32, i32* %10, align 4
  %1562 = icmp sle i32 %1560, %1561
  %1563 = zext i1 %1562 to i32
  store i32 %1563, i32* %9, align 4
  %1564 = load i32, i32* %7, align 4
  store i32 %1564, i32* %15, align 4
  br label %1565

1565:                                             ; preds = %1553, %1516
  %1566 = load i32, i32* %16, align 4
  store i32 %1566, i32* %51, align 4
  %1567 = load i32, i32* %7, align 4
  %1568 = load i32, i32* %11, align 4
  %1569 = icmp sge i32 %1567, %1568
  %1570 = zext i1 %1569 to i32
  %1571 = sitofp i32 %1570 to float
  store float %1571, float* %8, align 4
  %1572 = load i32, i32* %10, align 4
  %1573 = trunc i32 %1572 to i16
  %1574 = sext i16 %1573 to i32
  %1575 = load i16, i16* %12, align 2
  %1576 = sext i16 %1575 to i32
  %1577 = add nsw i32 %1574, %1576
  %1578 = load i16, i16* %69, align 2
  %1579 = zext i16 %1578 to i32
  %1580 = and i32 %1577, %1579
  %1581 = trunc i32 %1580 to i16
  %1582 = sext i16 %1581 to i32
  %1583 = sub nsw i32 0, %1582
  store i32 %1583, i32* %106, align 4
  store i32 %1583, i32* %97, align 4
  br label %1606

1584:                                             ; preds = %1545
  store i32 -1, i32* %108, align 4
  %1585 = load i32, i32* %11, align 4
  %1586 = sitofp i32 %1585 to float
  %1587 = load i32, i32* %11, align 4
  %1588 = sitofp i32 %1587 to float
  %1589 = fadd float %1586, %1588
  %1590 = load i16, i16* %70, align 2
  %1591 = uitofp i16 %1590 to float
  %1592 = fdiv float %1589, %1591
  store float %1592, float* %8, align 4
  %1593 = load i32, i32* %108, align 4
  %1594 = sitofp i32 %1593 to float
  %1595 = fadd float 1.000000e+00, %1594
  %1596 = fptosi float %1595 to i32
  store i32 %1596, i32* %72, align 4
  %1597 = load i32, i32* %105, align 4
  %1598 = uitofp i32 %1597 to float
  store float %1598, float* %8, align 4
  %1599 = load i32, i32* %11, align 4
  %1600 = trunc i32 %1599 to i16
  %1601 = zext i16 %1600 to i32
  %1602 = add nsw i32 %1601, 65534
  store i32 %1602, i32* %9, align 4
  %1603 = load i32, i32* %10, align 4
  %1604 = icmp ne i32 %1603, 0
  %1605 = zext i1 %1604 to i32
  store i32 %1605, i32* %71, align 4
  br label %1606

1606:                                             ; preds = %1584, %1565
  %1607 = load i16, i16* %53, align 2
  %1608 = sext i16 %1607 to i32
  %1609 = icmp ne i32 1, %1608
  %1610 = zext i1 %1609 to i32
  %1611 = sitofp i32 %1610 to float
  %1612 = load i32, i32* %97, align 4
  %1613 = sitofp i32 %1612 to float
  %1614 = fadd float %1611, %1613
  %1615 = fptosi float %1614 to i32
  store i32 %1615, i32* %50, align 4
  %1616 = load i32, i32* %10, align 4
  %1617 = icmp ne i32 %1616, 0
  br i1 %1617, label %1618, label %1621

1618:                                             ; preds = %1606
  %1619 = load i32, i32* %71, align 4
  store i32 %1619, i32* %106, align 4
  %1620 = load i32, i32* %97, align 4
  store i32 %1620, i32* %50, align 4
  br label %1640

1621:                                             ; preds = %1606
  store i16 0, i16* %109, align 2
  store i32 -1459086892, i32* %110, align 4
  %1622 = load i16, i16* %109, align 2
  %1623 = sext i16 %1622 to i32
  %1624 = load i16, i16* %20, align 2
  %1625 = sext i16 %1624 to i32
  %1626 = mul i32 %1623, %1625
  %1627 = trunc i32 %1626 to i16
  %1628 = zext i16 %1627 to i32
  %1629 = sub nsw i32 0, %1628
  store i32 %1629, i32* %71, align 4
  %1630 = load i16, i16* %69, align 2
  %1631 = zext i16 %1630 to i32
  store i32 %1631, i32* %72, align 4
  %1632 = sitofp i32 %1631 to double
  %1633 = fcmp ole double %1632, 1.750000e+00
  %1634 = zext i1 %1633 to i32
  store i32 %1634, i32* %110, align 4
  %1635 = load i32, i32* %11, align 4
  %1636 = sitofp i32 %1635 to float
  %1637 = fcmp une float 0x45B2337620000000, %1636
  %1638 = zext i1 %1637 to i32
  %1639 = sitofp i32 %1638 to float
  store float %1639, float* %8, align 4
  br label %1640

1640:                                             ; preds = %1621, %1618
  %1641 = load i32, i32* %22, align 4
  %1642 = icmp ne i32 %1641, 0
  br i1 %1642, label %1643, label %1648

1643:                                             ; preds = %1640
  store i32 237845027, i32* %111, align 4
  store float 0x3A7EE93B80000000, float* %8, align 4
  %1644 = load i32, i32* %9, align 4
  %1645 = sitofp i32 %1644 to float
  %1646 = fmul float 0x3F31C37F20000000, %1645
  %1647 = fptosi float %1646 to i32
  store i32 %1647, i32* %111, align 4
  br label %1672

1648:                                             ; preds = %1640
  store i32 -1167615308, i32* %112, align 4
  %1649 = load i32, i32* %10, align 4
  %1650 = trunc i32 %1649 to i16
  %1651 = sext i16 %1650 to i32
  %1652 = ashr i32 %1651, 12
  %1653 = trunc i32 %1652 to i16
  store i16 %1653, i16* %54, align 2
  %1654 = sext i16 %1653 to i32
  store i32 %1654, i32* %107, align 4
  store i32 %1654, i32* %9, align 4
  %1655 = load i32, i32* %71, align 4
  %1656 = or i32 -1, %1655
  %1657 = load i32, i32* %7, align 4
  %1658 = and i32 %1656, %1657
  %1659 = trunc i32 %1658 to i16
  %1660 = zext i16 %1659 to i32
  %1661 = load i16, i16* %70, align 2
  %1662 = zext i16 %1661 to i32
  %1663 = add nsw i32 %1660, %1662
  %1664 = ashr i32 %1663, 7
  %1665 = icmp ne i32 %1664, 0
  br i1 %1665, label %1666, label %1669

1666:                                             ; preds = %1648
  %1667 = load i32, i32* %14, align 4
  %1668 = icmp ne i32 %1667, 0
  br label %1669

1669:                                             ; preds = %1666, %1648
  %1670 = phi i1 [ false, %1648 ], [ %1668, %1666 ]
  %1671 = zext i1 %1670 to i32
  store i32 %1671, i32* %112, align 4
  br label %1672

1672:                                             ; preds = %1669, %1643
  br label %1729

1673:                                             ; preds = %1509
  store i32 0, i32* %113, align 4
  %1674 = load i32, i32* %97, align 4
  %1675 = trunc i32 %1674 to i16
  %1676 = zext i16 %1675 to i32
  %1677 = mul nsw i32 44290, %1676
  %1678 = icmp ne i32 %1677, 0
  br i1 %1678, label %1679, label %1680

1679:                                             ; preds = %1673
  br label %1680

1680:                                             ; preds = %1679, %1673
  %1681 = phi i1 [ false, %1673 ], [ true, %1679 ]
  %1682 = zext i1 %1681 to i32
  store i32 %1682, i32* %51, align 4
  %1683 = load i32, i32* %10, align 4
  %1684 = icmp sgt i32 %1682, %1683
  %1685 = zext i1 %1684 to i32
  store i32 %1685, i32* %9, align 4
  %1686 = load i32, i32* %11, align 4
  %1687 = load i32, i32* %16, align 4
  %1688 = icmp ugt i32 %1686, %1687
  %1689 = zext i1 %1688 to i32
  %1690 = load i32, i32* %113, align 4
  %1691 = mul i32 %1689, %1690
  %1692 = trunc i32 %1691 to i16
  %1693 = sext i16 %1692 to i32
  %1694 = ashr i32 %1693, 10
  %1695 = urem i32 %1694, -381191326
  store i32 %1695, i32* %50, align 4
  store i32 0, i32* %10, align 4
  br label %1696

1696:                                             ; preds = %1724, %1680
  %1697 = load i32, i32* %10, align 4
  %1698 = icmp ne i32 %1697, 0
  br i1 %1698, label %1699, label %1727

1699:                                             ; preds = %1696
  store i16 -1, i16* %114, align 2
  %1700 = load i32, i32* %97, align 4
  %1701 = trunc i32 %1700 to i16
  %1702 = zext i16 %1701 to i32
  %1703 = srem i32 %1702, 52565
  %1704 = trunc i32 %1703 to i16
  %1705 = zext i16 %1704 to i32
  %1706 = load i32, i32* %9, align 4
  %1707 = trunc i32 %1706 to i16
  %1708 = zext i16 %1707 to i32
  %1709 = ashr i32 %1705, %1708
  %1710 = icmp ne i32 %1709, 0
  br i1 %1710, label %1715, label %1711

1711:                                             ; preds = %1699
  %1712 = load i16, i16* %70, align 2
  %1713 = zext i16 %1712 to i32
  %1714 = icmp ne i32 %1713, 0
  br label %1715

1715:                                             ; preds = %1711, %1699
  %1716 = phi i1 [ true, %1699 ], [ %1714, %1711 ]
  %1717 = zext i1 %1716 to i32
  %1718 = load i16, i16* %114, align 2
  %1719 = zext i16 %1718 to i32
  %1720 = icmp sge i32 %1717, %1719
  %1721 = zext i1 %1720 to i32
  %1722 = load i32, i32* %15, align 4
  %1723 = and i32 %1721, %1722
  store i32 %1723, i32* %73, align 4
  br label %1724

1724:                                             ; preds = %1715
  %1725 = load i32, i32* %10, align 4
  %1726 = add nsw i32 %1725, 3
  store i32 %1726, i32* %10, align 4
  br label %1696, !llvm.loop !70

1727:                                             ; preds = %1696
  %1728 = load i32, i32* %11, align 4
  store i32 %1728, i32* %9, align 4
  br label %1729

1729:                                             ; preds = %1727, %1672
  %1730 = load i32, i32* %16, align 4
  %1731 = icmp uge i32 %1730, 65535
  %1732 = zext i1 %1731 to i32
  %1733 = mul nsw i32 %1732, 1
  %1734 = load i32, i32* %7, align 4
  %1735 = icmp sle i32 %1733, %1734
  %1736 = zext i1 %1735 to i32
  %1737 = icmp ule i32 %1736, -1583575407
  br i1 %1737, label %1738, label %1747

1738:                                             ; preds = %1729
  %1739 = load i32, i32* %7, align 4
  store i32 %1739, i32* %98, align 4
  store i32 %1739, i32* %9, align 4
  %1740 = load i16, i16* %20, align 2
  %1741 = icmp ne i16 %1740, 0
  br i1 %1741, label %1742, label %1743

1742:                                             ; preds = %1738
  br label %857

1743:                                             ; preds = %1738
  %1744 = load i32, i32* %16, align 4
  %1745 = icmp ule i32 %1744, 1775299567
  %1746 = zext i1 %1745 to i32
  store i32 %1746, i32* %9, align 4
  br label %1918

1747:                                             ; preds = %1729
  store i32 8, i32* %115, align 4
  store i32 11, i32* %14, align 4
  br label %1748

1748:                                             ; preds = %1798, %1747
  %1749 = load i32, i32* %14, align 4
  %1750 = icmp sge i32 %1749, 26
  br i1 %1750, label %1751, label %1801

1751:                                             ; preds = %1748
  store i32 0, i32* %116, align 4
  %1752 = load i32, i32* %9, align 4
  %1753 = sitofp i32 %1752 to float
  %1754 = fdiv float %1753, 0x3A9F484980000000
  %1755 = load i32, i32* %11, align 4
  %1756 = sitofp i32 %1755 to float
  %1757 = fadd float %1754, %1756
  %1758 = fpext float %1757 to double
  %1759 = fcmp oge double %1758, 0x3E88E23510000000
  %1760 = zext i1 %1759 to i32
  %1761 = load i32, i32* %98, align 4
  %1762 = icmp uge i32 %1760, %1761
  %1763 = zext i1 %1762 to i32
  %1764 = sitofp i32 %1763 to float
  %1765 = fadd float %1764, 1.375000e+01
  %1766 = load i16, i16* %69, align 2
  %1767 = zext i16 %1766 to i32
  %1768 = sitofp i32 %1767 to float
  %1769 = fcmp ogt float %1765, %1768
  %1770 = zext i1 %1769 to i32
  %1771 = sitofp i32 %1770 to float
  %1772 = load float, float* %8, align 4
  %1773 = fadd float %1771, %1772
  %1774 = fptosi float %1773 to i32
  store i32 %1774, i32* %115, align 4
  %1775 = load i32, i32* %116, align 4
  %1776 = icmp ne i32 %1775, 0
  br i1 %1776, label %1777, label %1778

1777:                                             ; preds = %1751
  br label %1798

1778:                                             ; preds = %1751
  %1779 = load i16, i16* %70, align 2
  %1780 = icmp ne i16 %1779, 0
  br i1 %1780, label %1781, label %1782

1781:                                             ; preds = %1778
  br label %1802

1782:                                             ; preds = %1778
  %1783 = load i32, i32* %10, align 4
  %1784 = sitofp i32 %1783 to double
  %1785 = fcmp ogt double %1784, 0x3A946C76C8000000
  %1786 = zext i1 %1785 to i32
  %1787 = load i32, i32* %10, align 4
  %1788 = icmp slt i32 %1786, %1787
  %1789 = zext i1 %1788 to i32
  %1790 = load i32, i32* %11, align 4
  %1791 = icmp sgt i32 %1789, %1790
  %1792 = zext i1 %1791 to i32
  %1793 = sitofp i32 %1792 to float
  %1794 = load i32, i32* %97, align 4
  %1795 = sitofp i32 %1794 to float
  %1796 = fmul float %1793, %1795
  %1797 = fptosi float %1796 to i32
  store i32 %1797, i32* %71, align 4
  br label %1798

1798:                                             ; preds = %1782, %1777
  %1799 = load i32, i32* %14, align 4
  %1800 = add nsw i32 %1799, 1
  store i32 %1800, i32* %14, align 4
  br label %1748, !llvm.loop !71

1801:                                             ; preds = %1748
  br label %1802

1802:                                             ; preds = %1801, %1781
  %1803 = load i32, i32* %10, align 4
  %1804 = load i32, i32* %7, align 4
  %1805 = and i32 %1803, %1804
  %1806 = icmp ne i32 %1805, 0
  br i1 %1806, label %1807, label %1884

1807:                                             ; preds = %1802
  store i32 2132635103, i32* %117, align 4
  %1808 = load i32, i32* %71, align 4
  %1809 = load i32, i32* %115, align 4
  %1810 = icmp sle i32 %1808, %1809
  %1811 = zext i1 %1810 to i32
  %1812 = load i32, i32* %115, align 4
  %1813 = urem i32 %1811, %1812
  %1814 = trunc i32 %1813 to i16
  %1815 = sext i16 %1814 to i32
  %1816 = load i32, i32* %50, align 4
  %1817 = trunc i32 %1816 to i16
  %1818 = sext i16 %1817 to i32
  %1819 = add nsw i32 %1815, %1818
  %1820 = icmp ne i32 %1819, 0
  br i1 %1820, label %1821, label %1822

1821:                                             ; preds = %1807
  br label %1822

1822:                                             ; preds = %1821, %1807
  %1823 = phi i1 [ false, %1807 ], [ true, %1821 ]
  %1824 = zext i1 %1823 to i32
  store i32 %1824, i32* %9, align 4
  %1825 = load i16, i16* %54, align 2
  %1826 = sext i16 %1825 to i32
  %1827 = load i16, i16* %18, align 2
  %1828 = zext i16 %1827 to i32
  %1829 = icmp sge i32 %1826, %1828
  %1830 = zext i1 %1829 to i32
  store i32 %1830, i32* %50, align 4
  %1831 = load i32, i32* %11, align 4
  %1832 = icmp eq i32 7, %1831
  %1833 = zext i1 %1832 to i32
  %1834 = load i32, i32* %7, align 4
  %1835 = icmp ne i32 %1833, %1834
  %1836 = zext i1 %1835 to i32
  %1837 = trunc i32 %1836 to i16
  %1838 = sext i16 %1837 to i32
  %1839 = sub nsw i32 %1838, 10311
  %1840 = icmp ne i32 %1839, 0
  br i1 %1840, label %1841, label %1842

1841:                                             ; preds = %1822
  br label %1842

1842:                                             ; preds = %1841, %1822
  %1843 = phi i1 [ false, %1822 ], [ true, %1841 ]
  %1844 = zext i1 %1843 to i32
  store i32 %1844, i32* %51, align 4
  %1845 = load i32, i32* %10, align 4
  %1846 = sub i32 857512556, %1845
  %1847 = icmp uge i32 %1846, 65529
  %1848 = zext i1 %1847 to i32
  %1849 = icmp sle i32 %1848, 7846
  %1850 = zext i1 %1849 to i32
  store i32 %1850, i32* %9, align 4
  %1851 = load i32, i32* %9, align 4
  %1852 = load i32, i32* %7, align 4
  %1853 = icmp sle i32 %1851, %1852
  br i1 %1853, label %1854, label %1857

1854:                                             ; preds = %1842
  %1855 = load i32, i32* %73, align 4
  %1856 = icmp ne i32 %1855, 0
  br label %1857

1857:                                             ; preds = %1854, %1842
  %1858 = phi i1 [ false, %1842 ], [ %1856, %1854 ]
  %1859 = zext i1 %1858 to i32
  %1860 = trunc i32 %1859 to i16
  %1861 = zext i16 %1860 to i32
  %1862 = load i32, i32* %117, align 4
  %1863 = trunc i32 %1862 to i16
  %1864 = zext i16 %1863 to i32
  %1865 = srem i32 %1861, %1864
  %1866 = icmp ne i32 %1865, 0
  br i1 %1866, label %1867, label %1870

1867:                                             ; preds = %1857
  %1868 = load i32, i32* %11, align 4
  %1869 = icmp ne i32 %1868, 0
  br label %1870

1870:                                             ; preds = %1867, %1857
  %1871 = phi i1 [ false, %1857 ], [ %1869, %1867 ]
  %1872 = zext i1 %1871 to i32
  %1873 = load i32, i32* %7, align 4
  %1874 = icmp sge i32 %1872, %1873
  %1875 = zext i1 %1874 to i32
  %1876 = load i32, i32* %50, align 4
  %1877 = udiv i32 %1875, %1876
  %1878 = trunc i32 %1877 to i16
  %1879 = sext i16 %1878 to i32
  %1880 = load i32, i32* %10, align 4
  %1881 = trunc i32 %1880 to i16
  %1882 = sext i16 %1881 to i32
  %1883 = add nsw i32 %1879, %1882
  store i32 %1883, i32* %9, align 4
  store i32 %1883, i32* %71, align 4
  br label %1915

1884:                                             ; preds = %1802
  store i32 1289578142, i32* %118, align 4
  store i32 0, i32* %72, align 4
  %1885 = load i32, i32* %51, align 4
  %1886 = trunc i32 %1885 to i16
  %1887 = zext i16 %1886 to i32
  %1888 = add nsw i32 23, %1887
  store i32 %1888, i32* %9, align 4
  store i32 %1888, i32* %72, align 4
  %1889 = load i32, i32* %11, align 4
  store i32 %1889, i32* %51, align 4
  %1890 = load i32, i32* %96, align 4
  %1891 = sitofp i32 %1890 to float
  %1892 = fadd float %1891, 1.618840e+05
  %1893 = load i32, i32* %118, align 4
  %1894 = uitofp i32 %1893 to float
  %1895 = fadd float %1892, %1894
  %1896 = fcmp oge float %1895, 7.000000e+00
  %1897 = zext i1 %1896 to i32
  %1898 = sitofp i32 %1897 to float
  %1899 = load float, float* %8, align 4
  %1900 = fcmp ogt float %1898, %1899
  %1901 = zext i1 %1900 to i32
  %1902 = sitofp i32 %1901 to float
  %1903 = load i32, i32* %49, align 4
  %1904 = uitofp i32 %1903 to float
  %1905 = fsub float %1902, %1904
  %1906 = fpext float %1905 to double
  %1907 = fcmp ole double %1906, -9.687500e-01
  %1908 = zext i1 %1907 to i32
  %1909 = sitofp i32 %1908 to double
  %1910 = fcmp oeq double %1909, 0x3BB1B8AD8C000000
  %1911 = zext i1 %1910 to i32
  %1912 = sitofp i32 %1911 to float
  %1913 = fneg float %1912
  store float %1913, float* %8, align 4
  %1914 = fptosi float %1913 to i32
  store i32 %1914, i32* %97, align 4
  store i32 %1914, i32* %99, align 4
  br label %1915

1915:                                             ; preds = %1884, %1870
  %1916 = load i32, i32* %115, align 4
  %1917 = sitofp i32 %1916 to float
  store float %1917, float* %8, align 4
  br label %1918

1918:                                             ; preds = %1915, %1743
  br label %1928

1919:                                             ; preds = %1381
  store i32 -973223904, i32* %119, align 4
  %1920 = load i32, i32* %10, align 4
  %1921 = sitofp i32 %1920 to double
  %1922 = fcmp une double %1921, 2.375000e+00
  %1923 = zext i1 %1922 to i32
  %1924 = load i32, i32* %10, align 4
  %1925 = icmp sle i32 %1923, %1924
  %1926 = zext i1 %1925 to i32
  store i32 %1926, i32* %13, align 4
  %1927 = load i32, i32* %119, align 4
  store i32 %1927, i32* %6, align 4
  br label %2255

1928:                                             ; preds = %1918
  %1929 = load i32, i32* %9, align 4
  store i32 %1929, i32* %6, align 4
  br label %2255

1930:                                             ; preds = %850
  store i32 -616863857, i32* %120, align 4
  store i32 3, i32* %121, align 4
  %1931 = load i32, i32* %9, align 4
  store i32 %1931, i32* %50, align 4
  %1932 = load i32, i32* %120, align 4
  %1933 = and i32 34702, %1932
  %1934 = icmp ne i32 %1933, 0
  br i1 %1934, label %1935, label %1947

1935:                                             ; preds = %1930
  %1936 = load i32, i32* %120, align 4
  %1937 = icmp ne i32 %1936, 0
  br i1 %1937, label %1941, label %1938

1938:                                             ; preds = %1935
  %1939 = load i32, i32* %10, align 4
  %1940 = icmp ne i32 %1939, 0
  br label %1941

1941:                                             ; preds = %1938, %1935
  %1942 = phi i1 [ true, %1935 ], [ %1940, %1938 ]
  %1943 = zext i1 %1942 to i32
  %1944 = trunc i32 %1943 to i16
  %1945 = zext i16 %1944 to i32
  %1946 = shl i32 %1945, 5
  store i32 %1946, i32* %9, align 4
  br label %1949

1947:                                             ; preds = %1930
  %1948 = load i32, i32* %9, align 4
  store i32 %1948, i32* %6, align 4
  br label %2255

1949:                                             ; preds = %1941
  br label %1950

1950:                                             ; preds = %2024, %1949
  %1951 = load i32, i32* %9, align 4
  %1952 = load i32, i32* %120, align 4
  %1953 = icmp slt i32 %1951, %1952
  %1954 = zext i1 %1953 to i32
  %1955 = load i32, i32* %7, align 4
  %1956 = icmp sgt i32 %1954, %1955
  %1957 = zext i1 %1956 to i32
  %1958 = and i32 %1957, 25792
  %1959 = icmp ne i32 %1958, 0
  br i1 %1959, label %1960, label %1963

1960:                                             ; preds = %1950
  %1961 = load i32, i32* %11, align 4
  %1962 = icmp ne i32 %1961, 0
  br label %1963

1963:                                             ; preds = %1960, %1950
  %1964 = phi i1 [ false, %1950 ], [ %1962, %1960 ]
  %1965 = zext i1 %1964 to i32
  %1966 = load i16, i16* %53, align 2
  %1967 = sext i16 %1966 to i32
  %1968 = icmp sle i32 %1965, %1967
  %1969 = zext i1 %1968 to i32
  %1970 = sub nsw i32 %1969, 0
  %1971 = shl i32 %1970, 16
  %1972 = load i32, i32* %15, align 4
  %1973 = icmp ule i32 %1971, %1972
  br i1 %1973, label %1974, label %1988

1974:                                             ; preds = %1963
  store i32 -1, i32* %122, align 4
  %1975 = load i32, i32* %120, align 4
  store i32 %1975, i32* %51, align 4
  %1976 = load i32, i32* %50, align 4
  %1977 = sub nsw i32 %1976, -22534249
  store i32 %1977, i32* %121, align 4
  %1978 = load i32, i32* %11, align 4
  %1979 = and i32 %1978, -1
  %1980 = load i32, i32* %21, align 4
  %1981 = add nsw i32 %1979, %1980
  store i32 %1981, i32* %15, align 4
  %1982 = load i32, i32* %7, align 4
  %1983 = icmp eq i32 %1982, 9
  br i1 %1983, label %1984, label %1985

1984:                                             ; preds = %1974
  br label %1985

1985:                                             ; preds = %1984, %1974
  %1986 = phi i1 [ false, %1974 ], [ true, %1984 ]
  %1987 = zext i1 %1986 to i32
  store i32 %1987, i32* %51, align 4
  br label %2132

1988:                                             ; preds = %1963
  store i16 17815, i16* %123, align 2
  store i32 972963285, i32* %124, align 4
  store i16 27, i16* %54, align 2
  br label %1989

1989:                                             ; preds = %2090, %1988
  %1990 = load i16, i16* %54, align 2
  %1991 = sext i16 %1990 to i32
  %1992 = icmp sge i32 %1991, 7
  br i1 %1992, label %1993, label %2095

1993:                                             ; preds = %1989
  store float -1.575000e+01, float* %125, align 4
  store i32 -102493340, i32* %126, align 4
  store i32 -25686410, i32* %127, align 4
  %1994 = load i16, i16* %123, align 2
  %1995 = zext i16 %1994 to i32
  %1996 = shl i32 %1995, 3
  %1997 = load i32, i32* %7, align 4
  %1998 = icmp ult i32 %1996, %1997
  %1999 = zext i1 %1998 to i32
  store i32 %1999, i32* %124, align 4
  %2000 = load i32, i32* %10, align 4
  %2001 = icmp ne i32 %1999, %2000
  %2002 = zext i1 %2001 to i32
  store i32 %2002, i32* %121, align 4
  %2003 = load i32, i32* %11, align 4
  %2004 = icmp ne i32 %2003, 0
  br i1 %2004, label %2005, label %2006

2005:                                             ; preds = %1993
  br label %850

2006:                                             ; preds = %1993
  store i16 0, i16* %18, align 2
  br label %2007

2007:                                             ; preds = %2034, %2006
  %2008 = load i16, i16* %18, align 2
  %2009 = zext i16 %2008 to i32
  %2010 = icmp eq i32 %2009, 17
  br i1 %2010, label %2011, label %2039

2011:                                             ; preds = %2007
  store i16 -3, i16* %128, align 2
  %2012 = load i16, i16* %128, align 2
  %2013 = sext i16 %2012 to i32
  %2014 = sitofp i32 %2013 to double
  %2015 = fcmp ogt double %2014, 1.375000e+00
  %2016 = zext i1 %2015 to i32
  %2017 = load i32, i32* %9, align 4
  %2018 = icmp sle i32 %2016, %2017
  %2019 = zext i1 %2018 to i32
  %2020 = sitofp i32 %2019 to float
  %2021 = fdiv float %2020, 1.250000e-01
  store float %2021, float* %8, align 4
  %2022 = load i16, i16* %123, align 2
  %2023 = icmp ne i16 %2022, 0
  br i1 %2023, label %2024, label %2025

2024:                                             ; preds = %2011
  br label %1950

2025:                                             ; preds = %2011
  %2026 = load i32, i32* %10, align 4
  %2027 = trunc i32 %2026 to i16
  %2028 = sext i16 %2027 to i32
  %2029 = load i32, i32* %124, align 4
  %2030 = trunc i32 %2029 to i16
  %2031 = sext i16 %2030 to i32
  %2032 = ashr i32 %2028, %2031
  store i32 %2032, i32* %121, align 4
  %2033 = xor i32 %2032, -2
  store i32 %2033, i32* %9, align 4
  br label %2034

2034:                                             ; preds = %2025
  %2035 = load i16, i16* %18, align 2
  %2036 = zext i16 %2035 to i32
  %2037 = add nsw i32 %2036, 1
  %2038 = trunc i32 %2037 to i16
  store i16 %2038, i16* %18, align 2
  br label %2007, !llvm.loop !72

2039:                                             ; preds = %2007
  %2040 = load i32, i32* %10, align 4
  %2041 = sub i32 -8, %2040
  %2042 = load i32, i32* %7, align 4
  %2043 = udiv i32 %2041, %2042
  %2044 = and i32 %2043, -102493340
  %2045 = load i32, i32* %19, align 4
  %2046 = or i32 %2044, %2045
  %2047 = trunc i32 %2046 to i16
  %2048 = zext i16 %2047 to i32
  %2049 = load i32, i32* %7, align 4
  %2050 = trunc i32 %2049 to i16
  %2051 = zext i16 %2050 to i32
  %2052 = sub nsw i32 %2048, %2051
  %2053 = icmp sle i32 %2052, 512714386
  %2054 = zext i1 %2053 to i32
  store i32 %2054, i32* %9, align 4
  store i32 0, i32* %14, align 4
  br label %2055

2055:                                             ; preds = %2086, %2039
  %2056 = load i32, i32* %14, align 4
  %2057 = icmp sgt i32 %2056, -11
  br i1 %2057, label %2058, label %2089

2058:                                             ; preds = %2055
  store float 0x4248B1FC80000000, float* %129, align 4
  store i32 -598371502, i32* %130, align 4
  %2059 = load i32, i32* %120, align 4
  store i32 %2059, i32* %9, align 4
  store i32 %2059, i32* %127, align 4
  %2060 = load i16, i16* %123, align 2
  %2061 = icmp ne i16 %2060, 0
  br i1 %2061, label %2062, label %2063

2062:                                             ; preds = %2058
  br label %2089

2063:                                             ; preds = %2058
  %2064 = load i32, i32* %9, align 4
  %2065 = load i32, i32* %130, align 4
  %2066 = icmp sge i32 %2064, %2065
  %2067 = zext i1 %2066 to i32
  %2068 = sitofp i32 %2067 to float
  %2069 = fadd float %2068, 0x410D92DD40000000
  %2070 = fptosi float %2069 to i32
  store i32 %2070, i32* %13, align 4
  %2071 = load i32, i32* %10, align 4
  %2072 = icmp ne i32 %2071, 0
  br i1 %2072, label %2076, label %2073

2073:                                             ; preds = %2063
  %2074 = load i32, i32* %10, align 4
  %2075 = icmp ne i32 %2074, 0
  br i1 %2075, label %2076, label %2079

2076:                                             ; preds = %2073, %2063
  %2077 = load i32, i32* %130, align 4
  %2078 = icmp ne i32 %2077, 0
  br label %2079

2079:                                             ; preds = %2076, %2073
  %2080 = phi i1 [ false, %2073 ], [ %2078, %2076 ]
  %2081 = zext i1 %2080 to i32
  store i32 %2081, i32* %13, align 4
  %2082 = load i32, i32* %121, align 4
  %2083 = icmp ne i32 %2082, 0
  br i1 %2083, label %2084, label %2085

2084:                                             ; preds = %2079
  br label %2086

2085:                                             ; preds = %2079
  br label %2086

2086:                                             ; preds = %2085, %2084
  %2087 = load i32, i32* %14, align 4
  %2088 = sub nsw i32 %2087, 1
  store i32 %2088, i32* %14, align 4
  br label %2055, !llvm.loop !73

2089:                                             ; preds = %2062, %2055
  br label %2090

2090:                                             ; preds = %2089
  %2091 = load i16, i16* %54, align 2
  %2092 = sext i16 %2091 to i32
  %2093 = sub nsw i32 %2092, 1
  %2094 = trunc i32 %2093 to i16
  store i16 %2094, i16* %54, align 2
  br label %1989, !llvm.loop !74

2095:                                             ; preds = %1989
  %2096 = load i32, i32* %120, align 4
  %2097 = icmp ne i32 %2096, 0
  br i1 %2097, label %2098, label %2099

2098:                                             ; preds = %2095
  br label %2131

2099:                                             ; preds = %2095
  %2100 = load i16, i16* %123, align 2
  %2101 = zext i16 %2100 to i32
  store i32 %2101, i32* %17, align 4
  %2102 = sitofp i32 %2101 to float
  %2103 = fdiv float %2102, -1.593750e+00
  %2104 = load i32, i32* %121, align 4
  %2105 = sitofp i32 %2104 to float
  %2106 = fcmp ogt float %2103, %2105
  %2107 = zext i1 %2106 to i32
  %2108 = sitofp i32 %2107 to float
  %2109 = fdiv float %2108, 0x3F8C9AB6C0000000
  %2110 = fcmp olt float %2109, 7.000000e+00
  %2111 = zext i1 %2110 to i32
  %2112 = sitofp i32 %2111 to float
  %2113 = load i32, i32* %13, align 4
  %2114 = sitofp i32 %2113 to float
  %2115 = fmul float %2112, %2114
  %2116 = fmul float %2115, 0x441C6D1540000000
  store float %2116, float* %8, align 4
  %2117 = fadd float %2116, 0x3D6AA69F40000000
  %2118 = load i32, i32* %19, align 4
  %2119 = uitofp i32 %2118 to float
  %2120 = fdiv float %2117, %2119
  %2121 = fpext float %2120 to double
  %2122 = fcmp olt double %2121, 0x4089F5E7A0000000
  %2123 = zext i1 %2122 to i32
  %2124 = sitofp i32 %2123 to float
  %2125 = load i32, i32* %11, align 4
  %2126 = sitofp i32 %2125 to float
  %2127 = fadd float %2124, %2126
  %2128 = fpext float %2127 to double
  %2129 = fcmp oeq double %2128, 8.750000e-01
  %2130 = zext i1 %2129 to i32
  store i32 %2130, i32* %121, align 4
  br label %2131

2131:                                             ; preds = %2099, %2098
  store i32 -1394098020, i32* %124, align 4
  store float 8.750000e-01, float* %8, align 4
  br label %2132

2132:                                             ; preds = %2131, %1985
  %2133 = load i32, i32* %11, align 4
  %2134 = load i32, i32* %14, align 4
  %2135 = icmp eq i32 %2133, %2134
  %2136 = zext i1 %2135 to i32
  %2137 = sitofp i32 %2136 to double
  %2138 = fcmp ole double %2137, 0x3C3D3E38F4000000
  %2139 = zext i1 %2138 to i32
  %2140 = sitofp i32 %2139 to float
  store float %2140, float* %8, align 4
  %2141 = load i32, i32* %10, align 4
  %2142 = icmp ne i32 %2141, 0
  br i1 %2142, label %2146, label %2143

2143:                                             ; preds = %2132
  %2144 = load i32, i32* %121, align 4
  %2145 = icmp ne i32 %2144, 0
  br label %2146

2146:                                             ; preds = %2143, %2132
  %2147 = phi i1 [ true, %2132 ], [ %2145, %2143 ]
  %2148 = zext i1 %2147 to i32
  %2149 = load i32, i32* %50, align 4
  %2150 = and i32 %2148, %2149
  %2151 = load i32, i32* %120, align 4
  %2152 = icmp sle i32 %2150, %2151
  %2153 = zext i1 %2152 to i32
  store i32 %2153, i32* %51, align 4
  br label %2154

2154:                                             ; preds = %2146
  store i32 459805305, i32* %51, align 4
  br label %2155

2155:                                             ; preds = %2154, %572
  %2156 = load i16, i16* %20, align 2
  %2157 = sext i16 %2156 to i32
  %2158 = sitofp i32 %2157 to double
  %2159 = fcmp olt double 0x43BE4AD47C000000, %2158
  %2160 = zext i1 %2159 to i32
  %2161 = sitofp i32 %2160 to float
  %2162 = load i32, i32* %11, align 4
  %2163 = sitofp i32 %2162 to float
  %2164 = fsub float %2161, %2163
  %2165 = load i32, i32* %22, align 4
  %2166 = uitofp i32 %2165 to float
  %2167 = fcmp oeq float %2164, %2166
  %2168 = zext i1 %2167 to i32
  store i32 %2168, i32* %17, align 4
  %2169 = load i16, i16* %23, align 2
  %2170 = zext i16 %2169 to i32
  store i32 %2170, i32* %15, align 4
  %2171 = load i32, i32* %10, align 4
  %2172 = icmp sge i32 %2170, %2171
  %2173 = zext i1 %2172 to i32
  %2174 = load i32, i32* %11, align 4
  %2175 = sdiv i32 %2173, %2174
  %2176 = load i32, i32* %9, align 4
  %2177 = icmp slt i32 %2175, %2176
  %2178 = zext i1 %2177 to i32
  store i32 %2178, i32* %9, align 4
  br label %2179

2179:                                             ; preds = %2243, %2155
  store float 0x3FD8E7BEE0000000, float* %8, align 4
  store i32 0, i32* %15, align 4
  br label %2180

2180:                                             ; preds = %2250, %2179
  %2181 = load i32, i32* %15, align 4
  %2182 = icmp slt i32 %2181, -23
  br i1 %2182, label %2183, label %2253

2183:                                             ; preds = %2180
  store i32 -112704992, i32* %131, align 4
  store i32 -10, i32* %132, align 4
  store i16 -16674, i16* %133, align 2
  %2184 = load i32, i32* %9, align 4
  store i32 %2184, i32* %131, align 4
  store float 9.375000e-02, float* %8, align 4
  store i32 0, i32* %132, align 4
  %2185 = load i16, i16* %18, align 2
  %2186 = icmp ne i16 %2185, 0
  br i1 %2186, label %2187, label %2188

2187:                                             ; preds = %2183
  br label %2250

2188:                                             ; preds = %2183
  %2189 = load i32, i32* %7, align 4
  %2190 = trunc i32 %2189 to i16
  %2191 = sext i16 %2190 to i32
  %2192 = load i32, i32* %9, align 4
  %2193 = trunc i32 %2192 to i16
  %2194 = sext i16 %2193 to i32
  %2195 = add nsw i32 %2191, %2194
  %2196 = srem i32 %2195, -1467812346
  %2197 = icmp ne i32 %2196, 0
  br i1 %2197, label %2198, label %2215

2198:                                             ; preds = %2188
  %2199 = load i32, i32* %131, align 4
  %2200 = icmp ne i32 %2199, 0
  br i1 %2200, label %2201, label %2215

2201:                                             ; preds = %2198
  %2202 = load i32, i32* %16, align 4
  %2203 = icmp ne i32 %2202, 0
  br i1 %2203, label %2204, label %2215

2204:                                             ; preds = %2201
  store i16 -14648, i16* %134, align 2
  store i32 0, i32* %14, align 4
  br label %2205

2205:                                             ; preds = %2211, %2204
  %2206 = load i32, i32* %14, align 4
  %2207 = icmp ne i32 %2206, -22
  br i1 %2207, label %2208, label %2214

2208:                                             ; preds = %2205
  %2209 = load i16, i16* %134, align 2
  %2210 = zext i16 %2209 to i32
  store i32 %2210, i32* %6, align 4
  br label %2255

2211:                                             ; No predecessors!
  %2212 = load i32, i32* %14, align 4
  %2213 = sub nsw i32 %2212, 1
  store i32 %2213, i32* %14, align 4
  br label %2205, !llvm.loop !75

2214:                                             ; preds = %2205
  br label %2245

2215:                                             ; preds = %2201, %2198, %2188
  %2216 = load i16, i16* %133, align 2
  %2217 = sext i16 %2216 to i32
  %2218 = load i16, i16* %12, align 2
  %2219 = sext i16 %2218 to i32
  %2220 = sub nsw i32 %2217, %2219
  %2221 = load i32, i32* %17, align 4
  %2222 = icmp sge i32 %2220, %2221
  %2223 = zext i1 %2222 to i32
  %2224 = urem i32 %2223, -119381363
  %2225 = xor i32 %2224, -981153682
  %2226 = load i32, i32* %7, align 4
  %2227 = or i32 %2225, %2226
  %2228 = xor i32 %2227, -1
  %2229 = trunc i32 %2228 to i16
  %2230 = sext i16 %2229 to i32
  %2231 = add nsw i32 %2230, -1
  %2232 = icmp eq i32 %2231, 1
  %2233 = zext i1 %2232 to i32
  %2234 = load i32, i32* %10, align 4
  %2235 = or i32 %2233, %2234
  %2236 = load i16, i16* %133, align 2
  %2237 = zext i16 %2236 to i32
  %2238 = icmp sle i32 %2235, %2237
  %2239 = zext i1 %2238 to i32
  %2240 = sub i32 %2239, 444869709
  store i32 %2240, i32* %13, align 4
  %2241 = load i32, i32* %22, align 4
  %2242 = icmp ne i32 %2241, 0
  br i1 %2242, label %2243, label %2244

2243:                                             ; preds = %2215
  br label %2179

2244:                                             ; preds = %2215
  br label %2245

2245:                                             ; preds = %2244, %2214
  %2246 = load i16, i16* %133, align 2
  %2247 = icmp ne i16 %2246, 0
  br i1 %2247, label %2248, label %2249

2248:                                             ; preds = %2245
  br label %2253

2249:                                             ; preds = %2245
  br label %2250

2250:                                             ; preds = %2249, %2187
  %2251 = load i32, i32* %15, align 4
  %2252 = sub nsw i32 %2251, 3
  store i32 %2252, i32* %15, align 4
  br label %2180, !llvm.loop !76

2253:                                             ; preds = %2248, %2180
  %2254 = load i32, i32* %7, align 4
  store i32 %2254, i32* %6, align 4
  br label %2255

2255:                                             ; preds = %2253, %2208, %1947, %1928, %1919, %1506, %1421, %1379, %1201, %1195, %1124, %1014, %961, %833, %731, %681, %649, %644, %428, %414, %237, %199
  %2256 = load i32, i32* %6, align 4
  ret i32 %2256
}

define internal i32 @func_124(i32 noundef %0, float noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca float, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store float %1, float* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32 422816821, i32* %12, align 4
  store i32 0, i32* %13, align 4
  %16 = load i32, i32* %12, align 4
  %17 = load i32, i32* %12, align 4
  %18 = icmp eq i32 %16, %17
  %19 = zext i1 %18 to i32
  %20 = sitofp i32 %19 to float
  %21 = load float, float* %8, align 4
  %22 = fadd float %20, %21
  store float %22, float* %8, align 4
  store i32 0, i32* %7, align 4
  br label %23

23:                                               ; preds = %45, %5
  %24 = load i32, i32* %7, align 4
  %25 = icmp ne i32 %24, 14
  br i1 %25, label %26, label %48

26:                                               ; preds = %23
  %27 = load i32, i32* %12, align 4
  %28 = or i32 %27, 8346
  %29 = trunc i32 %28 to i16
  %30 = sext i16 %29 to i32
  %31 = sub nsw i32 0, %30
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %36, label %33

33:                                               ; preds = %26
  %34 = load i32, i32* %12, align 4
  store i32 %34, i32* %9, align 4
  %35 = load i32, i32* %12, align 4
  store i32 %35, i32* %6, align 4
  br label %60

36:                                               ; preds = %26
  store i32 -96459158, i32* %14, align 4
  store i32 0, i32* %15, align 4
  %37 = load i32, i32* %12, align 4
  %38 = sitofp i32 %37 to float
  %39 = fmul float 0xBFFE500000000000, %38
  store float %39, float* %8, align 4
  %40 = load i32, i32* %14, align 4
  %41 = load i32, i32* %14, align 4
  %42 = udiv i32 %40, %41
  %43 = xor i32 %42, 39379
  store i32 %43, i32* %15, align 4
  %44 = load i32, i32* %12, align 4
  store i32 %44, i32* %6, align 4
  br label %60

45:                                               ; No predecessors!
  %46 = load i32, i32* %7, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %7, align 4
  br label %23, !llvm.loop !77

48:                                               ; preds = %23
  %49 = load i32, i32* %12, align 4
  %50 = sitofp i32 %49 to double
  %51 = fcmp ole double 0x3E2770424E000000, %50
  %52 = zext i1 %51 to i32
  %53 = load i32, i32* %9, align 4
  %54 = icmp sgt i32 %52, %53
  %55 = zext i1 %54 to i32
  store i32 %55, i32* %12, align 4
  %56 = load i32, i32* %9, align 4
  %57 = icmp sgt i32 %55, %56
  %58 = zext i1 %57 to i32
  store i32 %58, i32* %13, align 4
  %59 = load i32, i32* %7, align 4
  store i32 %59, i32* %6, align 4
  br label %60

60:                                               ; preds = %48, %36, %33
  %61 = load i32, i32* %6, align 4
  ret i32 %61
}

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
!32 = distinct !{!32, !7}
!33 = distinct !{!33, !7}
!34 = distinct !{!34, !7}
!35 = distinct !{!35, !7}
!36 = distinct !{!36, !7}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7}
!42 = distinct !{!42, !7}
!43 = distinct !{!43, !7}
!44 = distinct !{!44, !7}
!45 = distinct !{!45, !7}
!46 = distinct !{!46, !7}
!47 = distinct !{!47, !7}
!48 = distinct !{!48, !7}
!49 = distinct !{!49, !7}
!50 = distinct !{!50, !7}
!51 = distinct !{!51, !7}
!52 = distinct !{!52, !7}
!53 = distinct !{!53, !7}
!54 = distinct !{!54, !7}
!55 = distinct !{!55, !7}
!56 = distinct !{!56, !7}
!57 = distinct !{!57, !7}
!58 = distinct !{!58, !7}
!59 = distinct !{!59, !7}
!60 = distinct !{!60, !7}
!61 = distinct !{!61, !7}
!62 = distinct !{!62, !7}
!63 = distinct !{!63, !7}
!64 = distinct !{!64, !7}
!65 = distinct !{!65, !7}
!66 = distinct !{!66, !7}
!67 = distinct !{!67, !7}
!68 = distinct !{!68, !7}
!69 = distinct !{!69, !7}
!70 = distinct !{!70, !7}
!71 = distinct !{!71, !7}
!72 = distinct !{!72, !7}
!73 = distinct !{!73, !7}
!74 = distinct !{!74, !7}
!75 = distinct !{!75, !7}
!76 = distinct !{!76, !7}
!77 = distinct !{!77, !7}
