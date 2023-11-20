source_filename = "../../../test/b/raw/src/0.c"
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
  store i32 302, i32* %1, align 4
  %23 = call i32 @f_rand_4()
  store i32 %23, i32* %2, align 4
  %24 = call i32 @f_rand_3()
  store i32 %24, i32* %3, align 4
  store i32 719, i32* %4, align 4
  %25 = call i32 @f_rand_2()
  store i32 %25, i32* %5, align 4
  %26 = call i32 @f_rand_1()
  store i32 %26, i32* %6, align 4
  %27 = call i32 @f_rand_0()
  store i32 %27, i32* %7, align 4
  %28 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %29 = load i32, i32* %4, align 4
  %30 = load i32, i32* %1, align 4
  %31 = and i32 %29, %30
  %32 = load i32, i32* %6, align 4
  %33 = and i32 %31, %32
  %34 = load i32, i32* %7, align 4
  %35 = mul nsw i32 %33, %34
  %36 = load i32, i32* %3, align 4
  %37 = or i32 %35, %36
  store i32 %37, i32* %8, align 4
  %38 = load i32, i32* %5, align 4
  %39 = xor i32 %38, -1
  %40 = load i32, i32* %1, align 4
  %41 = srem i32 %39, %40
  %42 = load i32, i32* %4, align 4
  %43 = add nsw i32 %41, %42
  %44 = load i32, i32* %2, align 4
  %45 = and i32 %43, %44
  store i32 %45, i32* %9, align 4
  %46 = load i32, i32* %7, align 4
  %47 = load i32, i32* %3, align 4
  %48 = and i32 %46, %47
  %49 = load i32, i32* %3, align 4
  %50 = or i32 %48, %49
  %51 = load i32, i32* %9, align 4
  %52 = and i32 %50, %51
  store i32 %52, i32* %3, align 4
  %53 = load i32, i32* %6, align 4
  %54 = icmp eq i32 %53, 543
  br i1 %54, label %55, label %144

55:                                               ; preds = %0
  %56 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %57 = load i32, i32* %3, align 4
  %58 = load i32, i32* %2, align 4
  %59 = or i32 %57, %58
  %60 = load i32, i32* %4, align 4
  %61 = or i32 %59, %60
  %62 = load i32, i32* %9, align 4
  %63 = and i32 %61, %62
  store i32 %63, i32* %8, align 4
  %64 = load i32, i32* %4, align 4
  %65 = xor i32 %64, -1
  %66 = load i32, i32* %5, align 4
  %67 = add nsw i32 %65, %66
  store i32 %67, i32* %10, align 4
  %68 = load i32, i32* %7, align 4
  %69 = xor i32 %68, -1
  store i32 %69, i32* %2, align 4
  br label %70

70:                                               ; preds = %73, %55
  %71 = load i32, i32* %9, align 4
  %72 = icmp eq i32 %71, 925
  br i1 %72, label %73, label %111

73:                                               ; preds = %70
  %74 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %75 = load i32, i32* %2, align 4
  %76 = load i32, i32* %2, align 4
  %77 = or i32 %75, %76
  %78 = load i32, i32* %1, align 4
  %79 = mul nsw i32 %77, %78
  %80 = load i32, i32* %6, align 4
  %81 = sub nsw i32 %79, %80
  store i32 %81, i32* %1, align 4
  %82 = load i32, i32* %6, align 4
  %83 = xor i32 %82, -1
  store i32 %83, i32* %11, align 4
  %84 = load i32, i32* %9, align 4
  %85 = load i32, i32* %8, align 4
  %86 = sub nsw i32 %84, %85
  %87 = load i32, i32* %6, align 4
  %88 = srem i32 %86, %87
  %89 = load i32, i32* %10, align 4
  %90 = and i32 %88, %89
  %91 = load i32, i32* %6, align 4
  %92 = and i32 %90, %91
  store i32 %92, i32* %6, align 4
  %93 = load i32, i32* %8, align 4
  %94 = load i32, i32* %3, align 4
  %95 = xor i32 %93, %94
  %96 = load i32, i32* %1, align 4
  %97 = xor i32 %95, %96
  %98 = load i32, i32* %3, align 4
  %99 = sdiv i32 %97, %98
  %100 = load i32, i32* %11, align 4
  %101 = or i32 %99, %100
  %102 = load i32, i32* %7, align 4
  %103 = sdiv i32 %101, %102
  store i32 %103, i32* %8, align 4
  %104 = load i32, i32* %4, align 4
  %105 = load i32, i32* %2, align 4
  %106 = and i32 %104, %105
  %107 = load i32, i32* %7, align 4
  %108 = mul nsw i32 %106, %107
  %109 = load i32, i32* %5, align 4
  %110 = xor i32 %108, %109
  store i32 %110, i32* %5, align 4
  br label %70, !llvm.loop !6

111:                                              ; preds = %70
  %112 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  br label %113

113:                                              ; preds = %116, %111
  %114 = load i32, i32* %7, align 4
  %115 = icmp sle i32 %114, 609
  br i1 %115, label %116, label %143

116:                                              ; preds = %113
  %117 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  %118 = load i32, i32* %1, align 4
  %119 = xor i32 %118, -1
  store i32 %119, i32* %12, align 4
  %120 = load i32, i32* %4, align 4
  %121 = load i32, i32* %10, align 4
  %122 = or i32 %120, %121
  %123 = load i32, i32* %8, align 4
  %124 = mul nsw i32 %122, %123
  store i32 %124, i32* %8, align 4
  %125 = load i32, i32* %5, align 4
  %126 = xor i32 %125, -1
  store i32 %126, i32* %13, align 4
  %127 = load i32, i32* %10, align 4
  %128 = load i32, i32* %5, align 4
  %129 = mul nsw i32 %127, %128
  %130 = load i32, i32* %5, align 4
  %131 = xor i32 %129, %130
  store i32 %131, i32* %14, align 4
  %132 = load i32, i32* %12, align 4
  %133 = load i32, i32* %3, align 4
  %134 = or i32 %132, %133
  %135 = load i32, i32* %9, align 4
  %136 = and i32 %134, %135
  %137 = load i32, i32* %1, align 4
  %138 = or i32 %136, %137
  %139 = load i32, i32* %3, align 4
  %140 = mul nsw i32 %138, %139
  %141 = load i32, i32* %3, align 4
  %142 = mul nsw i32 %140, %141
  store i32 %142, i32* %13, align 4
  br label %113, !llvm.loop !8

143:                                              ; preds = %113
  br label %144

144:                                              ; preds = %143, %0
  %145 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  br label %146

146:                                              ; preds = %223, %144
  %147 = load i32, i32* %2, align 4
  %148 = icmp ne i32 %147, 627
  br i1 %148, label %149, label %237

149:                                              ; preds = %146
  %150 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  br label %151

151:                                              ; preds = %154, %149
  %152 = load i32, i32* %2, align 4
  %153 = icmp sle i32 %152, 351
  br i1 %153, label %154, label %180

154:                                              ; preds = %151
  %155 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  %156 = load i32, i32* %2, align 4
  %157 = xor i32 %156, -1
  store i32 %157, i32* %3, align 4
  %158 = load i32, i32* %1, align 4
  %159 = load i32, i32* %9, align 4
  %160 = srem i32 %158, %159
  %161 = load i32, i32* %1, align 4
  %162 = and i32 %160, %161
  store i32 %162, i32* %7, align 4
  %163 = load i32, i32* %1, align 4
  %164 = load i32, i32* %4, align 4
  %165 = and i32 %163, %164
  %166 = load i32, i32* %2, align 4
  %167 = sdiv i32 %165, %166
  store i32 %167, i32* %15, align 4
  %168 = load i32, i32* %5, align 4
  %169 = load i32, i32* %1, align 4
  %170 = mul nsw i32 %168, %169
  %171 = load i32, i32* %15, align 4
  %172 = sub nsw i32 %170, %171
  store i32 %172, i32* %16, align 4
  %173 = load i32, i32* %16, align 4
  %174 = load i32, i32* %8, align 4
  %175 = add nsw i32 %173, %174
  %176 = load i32, i32* %4, align 4
  %177 = add nsw i32 %175, %176
  %178 = load i32, i32* %3, align 4
  %179 = or i32 %177, %178
  store i32 %179, i32* %16, align 4
  br label %151, !llvm.loop !9

180:                                              ; preds = %151
  %181 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %182 = load i32, i32* %1, align 4
  %183 = load i32, i32* %3, align 4
  %184 = add nsw i32 %182, %183
  %185 = load i32, i32* %3, align 4
  %186 = sub nsw i32 %184, %185
  %187 = load i32, i32* %4, align 4
  %188 = xor i32 %186, %187
  %189 = load i32, i32* %4, align 4
  %190 = srem i32 %188, %189
  store i32 %190, i32* %17, align 4
  %191 = load i32, i32* %1, align 4
  %192 = load i32, i32* %4, align 4
  %193 = icmp sgt i32 %191, %192
  br i1 %193, label %194, label %223

194:                                              ; preds = %180
  %195 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %196 = load i32, i32* %2, align 4
  %197 = load i32, i32* %9, align 4
  %198 = sdiv i32 %196, %197
  %199 = load i32, i32* %5, align 4
  %200 = and i32 %198, %199
  store i32 %200, i32* %3, align 4
  %201 = load i32, i32* %9, align 4
  %202 = xor i32 %201, -1
  %203 = load i32, i32* %1, align 4
  %204 = srem i32 %202, %203
  store i32 %204, i32* %6, align 4
  %205 = load i32, i32* %8, align 4
  %206 = load i32, i32* %9, align 4
  %207 = mul nsw i32 %205, %206
  %208 = load i32, i32* %7, align 4
  %209 = mul nsw i32 %207, %208
  store i32 %209, i32* %18, align 4
  %210 = load i32, i32* %1, align 4
  %211 = load i32, i32* %5, align 4
  %212 = sub nsw i32 %210, %211
  %213 = load i32, i32* %8, align 4
  %214 = sub nsw i32 %212, %213
  %215 = load i32, i32* %17, align 4
  %216 = sdiv i32 %214, %215
  %217 = load i32, i32* %3, align 4
  %218 = sub nsw i32 %216, %217
  store i32 %218, i32* %19, align 4
  %219 = load i32, i32* %19, align 4
  %220 = xor i32 %219, -1
  %221 = load i32, i32* %18, align 4
  %222 = add nsw i32 %220, %221
  store i32 %222, i32* %20, align 4
  br label %223

223:                                              ; preds = %194, %180
  %224 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %225 = load i32, i32* %8, align 4
  %226 = load i32, i32* %2, align 4
  %227 = mul nsw i32 %225, %226
  %228 = load i32, i32* %2, align 4
  %229 = sdiv i32 %227, %228
  store i32 %229, i32* %21, align 4
  %230 = load i32, i32* %9, align 4
  %231 = load i32, i32* %6, align 4
  %232 = mul nsw i32 %230, %231
  %233 = load i32, i32* %9, align 4
  %234 = xor i32 %232, %233
  %235 = load i32, i32* %9, align 4
  %236 = srem i32 %234, %235
  store i32 %236, i32* %8, align 4
  br label %146, !llvm.loop !10

237:                                              ; preds = %146
  %238 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %239 = load i32, i32* %5, align 4
  %240 = load i32, i32* %4, align 4
  %241 = sub nsw i32 %239, %240
  %242 = load i32, i32* %6, align 4
  %243 = xor i32 %241, %242
  %244 = load i32, i32* %7, align 4
  %245 = and i32 %243, %244
  %246 = load i32, i32* %3, align 4
  %247 = srem i32 %245, %246
  store i32 %247, i32* %22, align 4
  %248 = load i32, i32* %22, align 4
  ret i32 %248
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
!10 = distinct !{!10, !7}
