; ModuleID = '../../../test/a/raw/src/0.c'
source_filename = "../../../test/a/raw/src/0.c"
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
  store i32 777, i32* %1, align 4
  %25 = call i32 @f_rand_3()
  store i32 %25, i32* %2, align 4
  %26 = call i32 @f_rand_2()
  store i32 %26, i32* %3, align 4
  store i32 982, i32* %4, align 4
  %27 = call i32 @f_rand_1()
  store i32 %27, i32* %5, align 4
  %28 = call i32 @f_rand_4()
  store i32 %28, i32* %6, align 4
  %29 = call i32 @f_rand_0()
  store i32 %29, i32* %7, align 4
  store i32 817, i32* %8, align 4
  %30 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %31 = load i32, i32* %7, align 4
  %32 = load i32, i32* %1, align 4
  %33 = or i32 %31, %32
  %34 = load i32, i32* %6, align 4
  %35 = and i32 %33, %34
  store i32 %35, i32* %1, align 4
  %36 = load i32, i32* %1, align 4
  %37 = load i32, i32* %4, align 4
  %38 = sub nsw i32 %36, %37
  %39 = load i32, i32* %2, align 4
  %40 = xor i32 %38, %39
  store i32 %40, i32* %9, align 4
  br label %41

41:                                               ; preds = %185, %0
  %42 = load i32, i32* %8, align 4
  %43 = icmp sge i32 %42, 104
  br i1 %43, label %44, label %194

44:                                               ; preds = %41
  %45 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %46 = load i32, i32* %5, align 4
  %47 = load i32, i32* %3, align 4
  %48 = mul nsw i32 %46, %47
  %49 = load i32, i32* %2, align 4
  %50 = and i32 %48, %49
  store i32 %50, i32* %4, align 4
  %51 = load i32, i32* %5, align 4
  %52 = load i32, i32* %7, align 4
  %53 = icmp ne i32 %51, %52
  br i1 %53, label %54, label %83

54:                                               ; preds = %44
  %55 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %56 = load i32, i32* %7, align 4
  %57 = load i32, i32* %2, align 4
  %58 = sdiv i32 %56, %57
  %59 = load i32, i32* %2, align 4
  %60 = sdiv i32 %58, %59
  store i32 %60, i32* %10, align 4
  %61 = load i32, i32* %3, align 4
  %62 = load i32, i32* %4, align 4
  %63 = mul nsw i32 %61, %62
  %64 = load i32, i32* %3, align 4
  %65 = mul nsw i32 %63, %64
  store i32 %65, i32* %11, align 4
  %66 = load i32, i32* %10, align 4
  %67 = load i32, i32* %6, align 4
  %68 = sdiv i32 %66, %67
  %69 = load i32, i32* %6, align 4
  %70 = or i32 %68, %69
  %71 = load i32, i32* %6, align 4
  %72 = sdiv i32 %70, %71
  store i32 %72, i32* %12, align 4
  %73 = load i32, i32* %5, align 4
  %74 = load i32, i32* %1, align 4
  %75 = sub nsw i32 %73, %74
  %76 = load i32, i32* %3, align 4
  %77 = and i32 %75, %76
  store i32 %77, i32* %1, align 4
  %78 = load i32, i32* %7, align 4
  %79 = load i32, i32* %2, align 4
  %80 = and i32 %78, %79
  %81 = load i32, i32* %9, align 4
  %82 = sdiv i32 %80, %81
  store i32 %82, i32* %1, align 4
  br label %114

83:                                               ; preds = %44
  %84 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %85 = load i32, i32* %9, align 4
  %86 = xor i32 %85, -1
  %87 = load i32, i32* %5, align 4
  %88 = sdiv i32 %86, %87
  store i32 %88, i32* %9, align 4
  %89 = load i32, i32* %2, align 4
  %90 = load i32, i32* %7, align 4
  %91 = add nsw i32 %89, %90
  %92 = load i32, i32* %9, align 4
  %93 = mul nsw i32 %91, %92
  %94 = load i32, i32* %3, align 4
  %95 = sub nsw i32 %93, %94
  store i32 %95, i32* %13, align 4
  %96 = load i32, i32* %4, align 4
  %97 = xor i32 %96, -1
  %98 = load i32, i32* %8, align 4
  %99 = and i32 %97, %98
  %100 = load i32, i32* %8, align 4
  %101 = sdiv i32 %99, %100
  %102 = load i32, i32* %8, align 4
  %103 = and i32 %101, %102
  %104 = load i32, i32* %3, align 4
  %105 = sub nsw i32 %103, %104
  store i32 %105, i32* %14, align 4
  %106 = load i32, i32* %8, align 4
  %107 = xor i32 %106, -1
  %108 = load i32, i32* %1, align 4
  %109 = add nsw i32 %107, %108
  store i32 %109, i32* %15, align 4
  %110 = load i32, i32* %13, align 4
  %111 = xor i32 %110, -1
  %112 = load i32, i32* %1, align 4
  %113 = sdiv i32 %111, %112
  store i32 %113, i32* %16, align 4
  br label %114

114:                                              ; preds = %83, %54
  %115 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  br label %116

116:                                              ; preds = %120, %114
  %117 = load i32, i32* %8, align 4
  %118 = load i32, i32* %3, align 4
  %119 = icmp slt i32 %117, %118
  br i1 %119, label %120, label %147

120:                                              ; preds = %116
  %121 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %122 = load i32, i32* %6, align 4
  %123 = xor i32 %122, -1
  %124 = load i32, i32* %6, align 4
  %125 = srem i32 %123, %124
  %126 = load i32, i32* %9, align 4
  %127 = add nsw i32 %125, %126
  store i32 %127, i32* %9, align 4
  %128 = load i32, i32* %4, align 4
  %129 = load i32, i32* %8, align 4
  %130 = or i32 %128, %129
  %131 = load i32, i32* %7, align 4
  %132 = sdiv i32 %130, %131
  store i32 %132, i32* %2, align 4
  %133 = load i32, i32* %9, align 4
  %134 = xor i32 %133, -1
  %135 = load i32, i32* %6, align 4
  %136 = mul nsw i32 %134, %135
  store i32 %136, i32* %7, align 4
  %137 = load i32, i32* %1, align 4
  %138 = load i32, i32* %3, align 4
  %139 = or i32 %137, %138
  %140 = load i32, i32* %6, align 4
  %141 = mul nsw i32 %139, %140
  store i32 %141, i32* %17, align 4
  %142 = load i32, i32* %3, align 4
  %143 = load i32, i32* %9, align 4
  %144 = add nsw i32 %142, %143
  %145 = load i32, i32* %7, align 4
  %146 = mul nsw i32 %144, %145
  store i32 %146, i32* %4, align 4
  br label %116, !llvm.loop !6

147:                                              ; preds = %116
  %148 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  br label %149

149:                                              ; preds = %152, %147
  %150 = load i32, i32* %7, align 4
  %151 = icmp sle i32 %150, 222
  br i1 %151, label %152, label %185

152:                                              ; preds = %149
  %153 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  %154 = load i32, i32* %4, align 4
  %155 = xor i32 %154, -1
  store i32 %155, i32* %4, align 4
  %156 = load i32, i32* %8, align 4
  %157 = load i32, i32* %9, align 4
  %158 = xor i32 %156, %157
  %159 = load i32, i32* %3, align 4
  %160 = sub nsw i32 %158, %159
  %161 = load i32, i32* %7, align 4
  %162 = mul nsw i32 %160, %161
  %163 = load i32, i32* %7, align 4
  %164 = or i32 %162, %163
  %165 = load i32, i32* %5, align 4
  %166 = or i32 %164, %165
  store i32 %166, i32* %7, align 4
  %167 = load i32, i32* %6, align 4
  %168 = xor i32 %167, -1
  %169 = load i32, i32* %9, align 4
  %170 = and i32 %168, %169
  store i32 %170, i32* %7, align 4
  %171 = load i32, i32* %5, align 4
  %172 = load i32, i32* %7, align 4
  %173 = add nsw i32 %171, %172
  %174 = load i32, i32* %8, align 4
  %175 = mul nsw i32 %173, %174
  %176 = load i32, i32* %2, align 4
  %177 = and i32 %175, %176
  %178 = load i32, i32* %9, align 4
  %179 = sdiv i32 %177, %178
  store i32 %179, i32* %18, align 4
  %180 = load i32, i32* %7, align 4
  %181 = load i32, i32* %7, align 4
  %182 = and i32 %180, %181
  %183 = load i32, i32* %1, align 4
  %184 = mul nsw i32 %182, %183
  store i32 %184, i32* %4, align 4
  br label %149, !llvm.loop !8

185:                                              ; preds = %149
  %186 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %187 = load i32, i32* %2, align 4
  %188 = load i32, i32* %9, align 4
  %189 = add nsw i32 %187, %188
  %190 = load i32, i32* %1, align 4
  %191 = sdiv i32 %189, %190
  %192 = load i32, i32* %7, align 4
  %193 = sdiv i32 %191, %192
  store i32 %193, i32* %7, align 4
  br label %41, !llvm.loop !9

194:                                              ; preds = %41
  %195 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %196 = load i32, i32* %7, align 4
  %197 = icmp eq i32 %196, 79
  br i1 %197, label %198, label %224

198:                                              ; preds = %194
  %199 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %200 = load i32, i32* %7, align 4
  %201 = xor i32 %200, -1
  %202 = load i32, i32* %8, align 4
  %203 = sub nsw i32 %201, %202
  store i32 %203, i32* %19, align 4
  %204 = load i32, i32* %4, align 4
  %205 = load i32, i32* %1, align 4
  %206 = sdiv i32 %204, %205
  %207 = load i32, i32* %7, align 4
  %208 = srem i32 %206, %207
  store i32 %208, i32* %19, align 4
  %209 = load i32, i32* %6, align 4
  %210 = xor i32 %209, -1
  store i32 %210, i32* %6, align 4
  %211 = load i32, i32* %8, align 4
  %212 = xor i32 %211, -1
  %213 = load i32, i32* %5, align 4
  %214 = and i32 %212, %213
  store i32 %214, i32* %20, align 4
  %215 = load i32, i32* %5, align 4
  %216 = load i32, i32* %19, align 4
  %217 = sdiv i32 %215, %216
  %218 = load i32, i32* %5, align 4
  %219 = mul nsw i32 %217, %218
  %220 = load i32, i32* %7, align 4
  %221 = mul nsw i32 %219, %220
  %222 = load i32, i32* %3, align 4
  %223 = sub nsw i32 %221, %222
  store i32 %223, i32* %1, align 4
  br label %253

224:                                              ; preds = %194
  %225 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %226 = load i32, i32* %7, align 4
  %227 = load i32, i32* %5, align 4
  %228 = mul nsw i32 %226, %227
  %229 = load i32, i32* %4, align 4
  %230 = or i32 %228, %229
  store i32 %230, i32* %2, align 4
  %231 = load i32, i32* %6, align 4
  %232 = load i32, i32* %5, align 4
  %233 = mul nsw i32 %231, %232
  %234 = load i32, i32* %4, align 4
  %235 = and i32 %233, %234
  store i32 %235, i32* %21, align 4
  %236 = load i32, i32* %8, align 4
  %237 = load i32, i32* %3, align 4
  %238 = or i32 %236, %237
  %239 = load i32, i32* %4, align 4
  %240 = srem i32 %238, %239
  %241 = load i32, i32* %8, align 4
  %242 = srem i32 %240, %241
  store i32 %242, i32* %22, align 4
  %243 = load i32, i32* %4, align 4
  %244 = load i32, i32* %21, align 4
  %245 = or i32 %243, %244
  %246 = load i32, i32* %8, align 4
  %247 = xor i32 %245, %246
  store i32 %247, i32* %2, align 4
  %248 = load i32, i32* %7, align 4
  %249 = load i32, i32* %9, align 4
  %250 = sub nsw i32 %248, %249
  %251 = load i32, i32* %22, align 4
  %252 = sub nsw i32 %250, %251
  store i32 %252, i32* %7, align 4
  br label %253

253:                                              ; preds = %224, %198
  %254 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12)
  %255 = load i32, i32* %3, align 4
  %256 = xor i32 %255, -1
  store i32 %256, i32* %23, align 4
  %257 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 13)
  %258 = load i32, i32* %7, align 4
  %259 = load i32, i32* %3, align 4
  %260 = add nsw i32 %258, %259
  %261 = load i32, i32* %6, align 4
  %262 = xor i32 %260, %261
  %263 = xor i32 %262, -1
  store i32 %263, i32* %24, align 4
  %264 = load i32, i32* %24, align 4
  ret i32 %264
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
