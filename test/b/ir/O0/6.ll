source_filename = "../../../test/b/raw/src/6.c"
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
  %22 = call i32 @f_rand_0()
  store i32 %22, i32* %1, align 4
  store i32 298, i32* %2, align 4
  %23 = call i32 @f_rand_4()
  store i32 %23, i32* %3, align 4
  %24 = call i32 @f_rand_2()
  store i32 %24, i32* %4, align 4
  %25 = call i32 @f_rand_1()
  store i32 %25, i32* %5, align 4
  %26 = call i32 @f_rand_3()
  store i32 %26, i32* %6, align 4
  %27 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %28 = load i32, i32* %6, align 4
  %29 = load i32, i32* %2, align 4
  %30 = srem i32 %28, %29
  %31 = load i32, i32* %2, align 4
  %32 = add nsw i32 %30, %31
  store i32 %32, i32* %7, align 4
  %33 = load i32, i32* %7, align 4
  %34 = load i32, i32* %3, align 4
  %35 = icmp sge i32 %33, %34
  br i1 %35, label %36, label %119

36:                                               ; preds = %0
  %37 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %38 = load i32, i32* %7, align 4
  %39 = load i32, i32* %6, align 4
  %40 = xor i32 %38, %39
  %41 = load i32, i32* %4, align 4
  %42 = add nsw i32 %40, %41
  %43 = load i32, i32* %6, align 4
  %44 = add nsw i32 %42, %43
  store i32 %44, i32* %6, align 4
  br label %45

45:                                               ; preds = %48, %36
  %46 = load i32, i32* %5, align 4
  %47 = icmp sgt i32 %46, 685
  br i1 %47, label %48, label %75

48:                                               ; preds = %45
  %49 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %50 = load i32, i32* %2, align 4
  %51 = load i32, i32* %7, align 4
  %52 = srem i32 %50, %51
  %53 = load i32, i32* %4, align 4
  %54 = sub nsw i32 %52, %53
  store i32 %54, i32* %5, align 4
  %55 = load i32, i32* %2, align 4
  %56 = load i32, i32* %4, align 4
  %57 = sdiv i32 %55, %56
  %58 = load i32, i32* %4, align 4
  %59 = srem i32 %57, %58
  store i32 %59, i32* %4, align 4
  %60 = load i32, i32* %1, align 4
  %61 = load i32, i32* %5, align 4
  %62 = srem i32 %60, %61
  %63 = load i32, i32* %4, align 4
  %64 = add nsw i32 %62, %63
  store i32 %64, i32* %6, align 4
  %65 = load i32, i32* %1, align 4
  %66 = load i32, i32* %3, align 4
  %67 = add nsw i32 %65, %66
  %68 = load i32, i32* %3, align 4
  %69 = mul nsw i32 %67, %68
  store i32 %69, i32* %7, align 4
  %70 = load i32, i32* %6, align 4
  %71 = load i32, i32* %5, align 4
  %72 = or i32 %70, %71
  %73 = load i32, i32* %3, align 4
  %74 = and i32 %72, %73
  store i32 %74, i32* %8, align 4
  br label %45, !llvm.loop !6

75:                                               ; preds = %45
  %76 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %77 = load i32, i32* %6, align 4
  %78 = load i32, i32* %7, align 4
  %79 = add nsw i32 %77, %78
  %80 = load i32, i32* %1, align 4
  %81 = srem i32 %79, %80
  %82 = load i32, i32* %2, align 4
  %83 = mul nsw i32 %81, %82
  %84 = load i32, i32* %5, align 4
  %85 = srem i32 %83, %84
  %86 = load i32, i32* %5, align 4
  %87 = add nsw i32 %85, %86
  store i32 %87, i32* %9, align 4
  %88 = load i32, i32* %7, align 4
  %89 = xor i32 %88, -1
  %90 = load i32, i32* %5, align 4
  %91 = add nsw i32 %89, %90
  store i32 %91, i32* %3, align 4
  br label %92

92:                                               ; preds = %96, %75
  %93 = load i32, i32* %5, align 4
  %94 = load i32, i32* %2, align 4
  %95 = icmp eq i32 %93, %94
  br i1 %95, label %96, label %118

96:                                               ; preds = %92
  %97 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  %98 = load i32, i32* %9, align 4
  %99 = load i32, i32* %6, align 4
  %100 = mul nsw i32 %98, %99
  %101 = load i32, i32* %6, align 4
  %102 = sdiv i32 %100, %101
  store i32 %102, i32* %3, align 4
  %103 = load i32, i32* %7, align 4
  %104 = xor i32 %103, -1
  store i32 %104, i32* %4, align 4
  %105 = load i32, i32* %9, align 4
  %106 = load i32, i32* %1, align 4
  %107 = sub nsw i32 %105, %106
  %108 = load i32, i32* %4, align 4
  %109 = sub nsw i32 %107, %108
  store i32 %109, i32* %5, align 4
  %110 = load i32, i32* %3, align 4
  %111 = xor i32 %110, -1
  %112 = load i32, i32* %7, align 4
  %113 = sub nsw i32 %111, %112
  store i32 %113, i32* %10, align 4
  %114 = load i32, i32* %10, align 4
  %115 = xor i32 %114, -1
  %116 = load i32, i32* %1, align 4
  %117 = sdiv i32 %115, %116
  store i32 %117, i32* %6, align 4
  br label %92, !llvm.loop !8

118:                                              ; preds = %92
  br label %204

119:                                              ; preds = %0
  %120 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  br label %121

121:                                              ; preds = %125, %119
  %122 = load i32, i32* %6, align 4
  %123 = load i32, i32* %4, align 4
  %124 = icmp slt i32 %122, %123
  br i1 %124, label %125, label %151

125:                                              ; preds = %121
  %126 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %127 = load i32, i32* %1, align 4
  %128 = load i32, i32* %5, align 4
  %129 = sub nsw i32 %127, %128
  %130 = load i32, i32* %4, align 4
  %131 = add nsw i32 %129, %130
  store i32 %131, i32* %11, align 4
  %132 = load i32, i32* %3, align 4
  %133 = xor i32 %132, -1
  %134 = load i32, i32* %2, align 4
  %135 = add nsw i32 %133, %134
  %136 = load i32, i32* %4, align 4
  %137 = sub nsw i32 %135, %136
  %138 = load i32, i32* %2, align 4
  %139 = xor i32 %137, %138
  %140 = load i32, i32* %7, align 4
  %141 = and i32 %139, %140
  store i32 %141, i32* %12, align 4
  %142 = load i32, i32* %11, align 4
  %143 = load i32, i32* %1, align 4
  %144 = srem i32 %142, %143
  %145 = load i32, i32* %2, align 4
  %146 = sdiv i32 %144, %145
  store i32 %146, i32* %13, align 4
  %147 = load i32, i32* %4, align 4
  %148 = xor i32 %147, -1
  store i32 %148, i32* %14, align 4
  %149 = load i32, i32* %6, align 4
  %150 = xor i32 %149, -1
  store i32 %150, i32* %15, align 4
  br label %121, !llvm.loop !9

151:                                              ; preds = %121
  %152 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  %153 = load i32, i32* %7, align 4
  %154 = load i32, i32* %6, align 4
  %155 = mul nsw i32 %153, %154
  %156 = load i32, i32* %1, align 4
  %157 = and i32 %155, %156
  store i32 %157, i32* %3, align 4
  %158 = load i32, i32* %5, align 4
  %159 = load i32, i32* %7, align 4
  %160 = xor i32 %158, %159
  %161 = load i32, i32* %1, align 4
  %162 = mul nsw i32 %160, %161
  %163 = load i32, i32* %6, align 4
  %164 = xor i32 %162, %163
  store i32 %164, i32* %16, align 4
  %165 = load i32, i32* %6, align 4
  %166 = load i32, i32* %16, align 4
  %167 = sdiv i32 %165, %166
  %168 = load i32, i32* %6, align 4
  %169 = or i32 %167, %168
  store i32 %169, i32* %17, align 4
  br label %170

170:                                              ; preds = %173, %151
  %171 = load i32, i32* %5, align 4
  %172 = icmp sgt i32 %171, 406
  br i1 %172, label %173, label %203

173:                                              ; preds = %170
  %174 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %175 = load i32, i32* %5, align 4
  %176 = load i32, i32* %7, align 4
  %177 = xor i32 %175, %176
  %178 = load i32, i32* %17, align 4
  %179 = mul nsw i32 %177, %178
  store i32 %179, i32* %18, align 4
  %180 = load i32, i32* %18, align 4
  %181 = xor i32 %180, -1
  %182 = load i32, i32* %16, align 4
  %183 = or i32 %181, %182
  store i32 %183, i32* %3, align 4
  %184 = load i32, i32* %18, align 4
  %185 = load i32, i32* %3, align 4
  %186 = sub nsw i32 %184, %185
  %187 = load i32, i32* %18, align 4
  %188 = and i32 %186, %187
  %189 = load i32, i32* %18, align 4
  %190 = mul nsw i32 %188, %189
  store i32 %190, i32* %19, align 4
  %191 = load i32, i32* %16, align 4
  %192 = load i32, i32* %3, align 4
  %193 = sub nsw i32 %191, %192
  %194 = load i32, i32* %3, align 4
  %195 = add nsw i32 %193, %194
  %196 = load i32, i32* %16, align 4
  %197 = mul nsw i32 %195, %196
  store i32 %197, i32* %5, align 4
  %198 = load i32, i32* %7, align 4
  %199 = load i32, i32* %7, align 4
  %200 = or i32 %198, %199
  %201 = load i32, i32* %4, align 4
  %202 = sdiv i32 %200, %201
  store i32 %202, i32* %1, align 4
  br label %170, !llvm.loop !10

203:                                              ; preds = %170
  br label %204

204:                                              ; preds = %203, %118
  %205 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %206 = load i32, i32* %7, align 4
  %207 = load i32, i32* %7, align 4
  %208 = and i32 %206, %207
  %209 = load i32, i32* %2, align 4
  %210 = add nsw i32 %208, %209
  store i32 %210, i32* %7, align 4
  %211 = load i32, i32* %7, align 4
  %212 = load i32, i32* %7, align 4
  %213 = sdiv i32 %211, %212
  %214 = load i32, i32* %7, align 4
  %215 = or i32 %213, %214
  %216 = load i32, i32* %3, align 4
  %217 = add nsw i32 %215, %216
  store i32 %217, i32* %20, align 4
  %218 = load i32, i32* %3, align 4
  %219 = load i32, i32* %5, align 4
  %220 = sub nsw i32 %218, %219
  %221 = load i32, i32* %3, align 4
  %222 = xor i32 %220, %221
  %223 = load i32, i32* %20, align 4
  %224 = sdiv i32 %222, %223
  %225 = load i32, i32* %7, align 4
  %226 = add nsw i32 %224, %225
  %227 = load i32, i32* %7, align 4
  %228 = or i32 %226, %227
  store i32 %228, i32* %3, align 4
  %229 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %230 = load i32, i32* %2, align 4
  %231 = load i32, i32* %3, align 4
  %232 = xor i32 %230, %231
  store i32 %232, i32* %21, align 4
  %233 = load i32, i32* %21, align 4
  ret i32 %233
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
