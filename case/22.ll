; ModuleID = '/home/eval/data/DSMITH/raw/src/22.c'
source_filename = "/home/eval/data/DSMITH/raw/src/22.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"Input: %d\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"BB: %d\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_0() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  ret i32 %1
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_1() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_2() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_3() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_4() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @func0(i32 noundef %0, i32 %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = tail call i32 @f_rand_2()
  %6 = tail call i32 @f_rand_0()
  %7 = tail call i32 @f_rand_1()
  %8 = tail call i32 @f_rand_3()
  %9 = tail call i32 @f_rand_4()
  %10 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 0)
  %11 = srem i32 449, %5
  %12 = srem i32 %11, %2
  %13 = and i32 %12, %0
  %14 = icmp eq i32 %2, 503
  br i1 %14, label %15, label %113

15:                                               ; preds = %4
  %16 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 1)
  %17 = icmp ult i32 %13, 83
  br i1 %17, label %18, label %34

18:                                               ; preds = %15
  %19 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 2)
  %20 = mul i32 %8, 90712
  %21 = shl nuw nsw i32 %13, 1
  %22 = xor i32 %5, %21
  %23 = xor i32 %22, 449
  %24 = sdiv i32 %23, 680
  %25 = icmp sgt i32 %8, 691
  br i1 %25, label %26, label %30

26:                                               ; preds = %18
  %27 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 3)
  br label %28

28:                                               ; preds = %28, %26
  %29 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 3)
  br label %28, !llvm.loop !5

30:                                               ; preds = %18
  %31 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 4)
  %32 = xor i32 %6, -185
  %33 = icmp sgt i32 %20, 503
  br i1 %33, label %45, label %62

34:                                               ; preds = %15
  %35 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 7)
  %36 = icmp slt i32 %8, %13
  %37 = select i1 %36, i32 9, i32 8
  %38 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef %37)
  %39 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 10)
  %40 = icmp ugt i32 %13, 361
  br i1 %40, label %41, label %62

41:                                               ; preds = %34
  %42 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 11)
  br label %43

43:                                               ; preds = %43, %41
  %44 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 11)
  br label %43, !llvm.loop !8

45:                                               ; preds = %30
  %46 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 6)
  %47 = or i32 %8, %0
  %48 = or i32 %47, 130
  %49 = xor i32 %24, -1
  %50 = sdiv i32 %49, %20
  %51 = add i32 %9, 319
  %52 = xor i32 %20, %9
  %53 = xor i32 %52, %51
  %54 = xor i32 %53, 184
  %55 = srem i32 449, %3
  %56 = add nsw i32 %55, %50
  %57 = mul nsw i32 %56, 493
  %58 = and i32 %57, %32
  %59 = xor i32 %9, -1
  %60 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 13)
  %61 = icmp slt i32 %54, 760
  br i1 %61, label %66, label %71

62:                                               ; preds = %34, %30
  %63 = phi i32 [ 5, %30 ], [ 12, %34 ]
  %64 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef %63)
  %65 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 13)
  br label %66

66:                                               ; preds = %62, %45
  %67 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 14)
  %68 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 15)
  br label %69

69:                                               ; preds = %69, %66
  %70 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 15)
  br label %69, !llvm.loop !9

71:                                               ; preds = %45
  %72 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 19)
  %73 = icmp eq i32 %58, %0
  br i1 %73, label %74, label %90

74:                                               ; preds = %71
  %75 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 20)
  %76 = icmp slt i32 %9, %54
  br i1 %76, label %77, label %81

77:                                               ; preds = %74
  %78 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 21)
  br label %79

79:                                               ; preds = %79, %77
  %80 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 21)
  br label %79, !llvm.loop !10

81:                                               ; preds = %74
  %82 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 22)
  %83 = icmp sgt i32 %32, %13
  br i1 %83, label %88, label %84

84:                                               ; preds = %81
  %85 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 23)
  br label %86

86:                                               ; preds = %86, %84
  %87 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 23)
  br label %86, !llvm.loop !11

88:                                               ; preds = %81
  %89 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 24)
  br label %170

90:                                               ; preds = %71
  %91 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 25)
  %92 = sdiv i32 %9, %59
  %93 = add nsw i32 %92, %54
  %94 = mul nsw i32 %93, %58
  %95 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 26)
  %96 = or i32 %47, 1023
  %97 = add nsw i32 %3, 680
  %98 = add nsw i32 %97, %96
  %99 = xor i32 %98, %13
  %100 = xor i32 %99, %94
  %101 = and i32 %100, %54
  %102 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 28)
  %103 = icmp eq i32 %101, %0
  br i1 %103, label %108, label %104

104:                                              ; preds = %90
  %105 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 29)
  br label %106

106:                                              ; preds = %106, %104
  %107 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 29)
  br label %106, !llvm.loop !12

108:                                              ; preds = %90
  %109 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 30)
  %110 = and i32 %9, 493
  %111 = or i32 %110, %0
  %112 = and i32 %111, %101
  br label %170

113:                                              ; preds = %4
  %114 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 33)
  %115 = icmp slt i32 %9, %0
  br i1 %115, label %116, label %130

116:                                              ; preds = %113
  %117 = xor i32 %8, -450
  %118 = sdiv i32 %117, %5
  %119 = and i32 %118, %2
  %120 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 34)
  %121 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 35)
  %122 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 37)
  %123 = icmp slt i32 %119, 493
  br i1 %123, label %124, label %126

124:                                              ; preds = %116
  %125 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 38)
  br label %126

126:                                              ; preds = %124, %116
  %127 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 39)
  br label %128

128:                                              ; preds = %128, %126
  %129 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 40)
  br label %128, !llvm.loop !13

130:                                              ; preds = %113
  %131 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 45)
  %132 = icmp sgt i32 %9, 492
  br i1 %132, label %133, label %147

133:                                              ; preds = %130
  %134 = icmp eq i32 %9, 911
  %135 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 46)
  br i1 %134, label %136, label %140

136:                                              ; preds = %133
  %137 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 48)
  %138 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 50)
  %139 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 46)
  br label %143

140:                                              ; preds = %143, %133
  br label %141

141:                                              ; preds = %140, %141
  %142 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 47)
  br label %141, !llvm.loop !14

143:                                              ; preds = %136, %143
  %144 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 48)
  %145 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 50)
  %146 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 46)
  br i1 %134, label %143, label %140, !llvm.loop !15

147:                                              ; preds = %130
  %148 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 51)
  %149 = icmp eq i32 %3, 685
  br i1 %149, label %180, label %150

150:                                              ; preds = %147
  %151 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 52)
  %152 = icmp eq i32 %7, 680
  br i1 %152, label %153, label %155

153:                                              ; preds = %150, %153
  %154 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 53)
  br label %153, !llvm.loop !16

155:                                              ; preds = %150
  %156 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 54)
  %157 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 56)
  %158 = icmp slt i32 %5, 680
  br i1 %158, label %159, label %165

159:                                              ; preds = %155
  %160 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 57)
  %161 = and i32 %3, 184
  %162 = and i32 %161, %9
  %163 = xor i32 %162, 449
  %164 = and i32 %163, %0
  br label %170

165:                                              ; preds = %155
  %166 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 58)
  %167 = xor i32 %6, -1
  %168 = mul nsw i32 %5, %167
  %169 = xor i32 %9, %168
  br label %170

170:                                              ; preds = %159, %165, %88, %108
  %171 = phi i32 [ 32, %108 ], [ 32, %88 ], [ 59, %165 ], [ 59, %159 ]
  %172 = phi i32 [ %112, %108 ], [ 680, %88 ], [ 680, %165 ], [ 680, %159 ]
  %173 = phi i32 [ %54, %108 ], [ %54, %88 ], [ 184, %165 ], [ %164, %159 ]
  %174 = phi i32 [ %48, %108 ], [ %48, %88 ], [ %8, %165 ], [ %8, %159 ]
  %175 = phi i32 [ %58, %108 ], [ %0, %88 ], [ %7, %165 ], [ %7, %159 ]
  %176 = phi i32 [ %32, %108 ], [ %32, %88 ], [ %6, %165 ], [ %6, %159 ]
  %177 = phi i32 [ %59, %108 ], [ %59, %88 ], [ 449, %165 ], [ 449, %159 ]
  %178 = phi i32 [ %13, %108 ], [ %13, %88 ], [ %169, %165 ], [ %13, %159 ]
  %179 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef %171)
  br label %180

180:                                              ; preds = %170, %147
  %181 = phi i32 [ 680, %147 ], [ %172, %170 ]
  %182 = phi i32 [ 184, %147 ], [ %173, %170 ]
  %183 = phi i32 [ %8, %147 ], [ %174, %170 ]
  %184 = phi i32 [ %7, %147 ], [ %175, %170 ]
  %185 = phi i32 [ %6, %147 ], [ %176, %170 ]
  %186 = phi i32 [ 449, %147 ], [ %177, %170 ]
  %187 = phi i32 [ %13, %147 ], [ %178, %170 ]
  %188 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 60)
  %189 = xor i32 %5, -494
  %190 = icmp eq i32 %9, %0
  br i1 %190, label %191, label %401

191:                                              ; preds = %180
  %192 = mul nsw i32 %186, %184
  %193 = sdiv i32 %192, %181
  %194 = sub nsw i32 %193, %186
  %195 = mul nsw i32 %194, %2
  %196 = add nsw i32 %195, -493
  %197 = xor i32 %184, -1
  %198 = icmp eq i32 %184, 134
  %199 = icmp slt i32 %184, 159
  %200 = icmp slt i32 %9, 197
  %201 = icmp slt i32 %195, 848
  %202 = xor i32 %3, -1
  %203 = sub i32 492, %195
  %204 = mul nsw i32 %196, %184
  %205 = sub nsw i32 %204, %196
  %206 = mul nsw i32 %205, %9
  %207 = icmp eq i32 %3, 19
  %208 = and i32 %196, %184
  %209 = icmp sgt i32 %184, %196
  br label %210

210:                                              ; preds = %191, %398
  %211 = phi i32 [ %187, %191 ], [ %339, %398 ]
  %212 = phi i32 [ %189, %191 ], [ %338, %398 ]
  %213 = phi i32 [ 493, %191 ], [ %337, %398 ]
  %214 = phi i32 [ %186, %191 ], [ 319, %398 ]
  %215 = phi i32 [ %5, %191 ], [ %335, %398 ]
  %216 = phi i32 [ %185, %191 ], [ %334, %398 ]
  %217 = phi i32 [ %183, %191 ], [ %333, %398 ]
  %218 = phi i32 [ %182, %191 ], [ %332, %398 ]
  %219 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 61)
  %220 = icmp slt i32 %214, 600
  br i1 %220, label %221, label %296

221:                                              ; preds = %210
  %222 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 62)
  br i1 %198, label %230, label %223

223:                                              ; preds = %221
  %224 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 63)
  %225 = xor i32 %215, -1
  %226 = or i32 %9, %225
  %227 = sub nsw i32 %202, %226
  %228 = srem i32 %227, %213
  %229 = add nsw i32 %228, %9
  br label %235

230:                                              ; preds = %221
  %231 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 64)
  %232 = or i32 %216, %203
  %233 = srem i32 %232, %211
  %234 = and i32 %233, %3
  br label %235

235:                                              ; preds = %230, %223
  %236 = phi i32 [ %229, %223 ], [ %234, %230 ]
  %237 = phi i32 [ %226, %223 ], [ %215, %230 ]
  %238 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 65)
  %239 = icmp eq i32 %236, %213
  br i1 %239, label %258, label %240

240:                                              ; preds = %235
  %241 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 66)
  %242 = mul nsw i32 %236, %214
  %243 = sdiv i32 %242, %9
  %244 = srem i32 %243, %217
  %245 = and i32 %244, %236
  %246 = srem i32 %206, %3
  %247 = sub i32 %216, %184
  %248 = add i32 %247, %9
  %249 = srem i32 %248, %237
  %250 = srem i32 %249, %184
  %251 = or i32 %250, %9
  %252 = mul nsw i32 %213, %196
  %253 = sdiv i32 %252, %211
  %254 = sdiv i32 %253, %237
  %255 = xor i32 %254, -1
  %256 = or i32 %251, %255
  %257 = mul nsw i32 %256, %254
  br label %258

258:                                              ; preds = %240, %235
  %259 = phi i32 [ %245, %240 ], [ %217, %235 ]
  %260 = phi i32 [ %246, %240 ], [ %214, %235 ]
  %261 = phi i32 [ %257, %240 ], [ %211, %235 ]
  %262 = phi i32 [ %251, %240 ], [ %9, %235 ]
  %263 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 67)
  %264 = or i32 %212, %9
  %265 = srem i32 %264, %261
  %266 = sdiv i32 %265, %259
  %267 = icmp eq i32 %236, %212
  br i1 %267, label %268, label %283

268:                                              ; preds = %258
  %269 = or i32 %266, %237
  %270 = add i32 %269, %216
  br label %271

271:                                              ; preds = %268, %271
  %272 = phi i32 [ %259, %268 ], [ %276, %271 ]
  %273 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 68)
  %274 = xor i32 %272, -1
  %275 = and i32 %212, %274
  %276 = srem i32 %275, %262
  %277 = srem i32 %213, %262
  %278 = mul nsw i32 %277, %260
  %279 = add i32 %270, %276
  %280 = sub i32 %279, %278
  %281 = or i32 %280, %262
  %282 = icmp eq i32 %212, %281
  br i1 %282, label %271, label %283, !llvm.loop !17

283:                                              ; preds = %271, %258
  %284 = phi i32 [ %259, %258 ], [ %276, %271 ]
  %285 = phi i32 [ %212, %258 ], [ %281, %271 ]
  %286 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 69)
  br i1 %207, label %292, label %287

287:                                              ; preds = %283
  %288 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 70)
  %289 = xor i32 %262, %213
  %290 = add nsw i32 %289, %237
  %291 = xor i32 %290, %237
  br label %331

292:                                              ; preds = %283
  %293 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 71)
  %294 = mul nsw i32 %260, %208
  %295 = srem i32 %294, %266
  br label %331

296:                                              ; preds = %210
  %297 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 72)
  %298 = srem i32 %196, %3
  %299 = or i32 %298, %9
  %300 = add nsw i32 %299, %214
  %301 = srem i32 %300, %212
  %302 = xor i32 %218, %217
  %303 = xor i32 %302, -1
  %304 = add nsw i32 %214, %303
  %305 = sub i32 %304, %213
  %306 = and i32 %217, %184
  %307 = srem i32 %306, %196
  %308 = mul nsw i32 %307, %301
  br i1 %200, label %309, label %323

309:                                              ; preds = %296
  %310 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 73)
  %311 = or i32 %218, %197
  %312 = sdiv i32 %311, %215
  %313 = or i32 %312, %214
  %314 = add i32 %214, %9
  %315 = add i32 %314, %313
  %316 = or i32 %315, %218
  %317 = or i32 %305, %217
  %318 = and i32 %317, %216
  %319 = mul nsw i32 %318, %217
  %320 = mul nsw i32 %214, %218
  %321 = and i32 %320, %196
  %322 = xor i32 %321, %9
  br label %323

323:                                              ; preds = %309, %296
  %324 = phi i32 [ %319, %309 ], [ %217, %296 ]
  %325 = phi i32 [ %313, %309 ], [ %215, %296 ]
  %326 = phi i32 [ %322, %309 ], [ %211, %296 ]
  %327 = phi i32 [ %316, %309 ], [ %9, %296 ]
  %328 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 74)
  br i1 %201, label %329, label %331

329:                                              ; preds = %323
  %330 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 75)
  br label %331

331:                                              ; preds = %323, %329, %287, %292
  %332 = phi i32 [ %236, %287 ], [ %295, %292 ], [ %218, %329 ], [ %218, %323 ]
  %333 = phi i32 [ %284, %287 ], [ %284, %292 ], [ %324, %329 ], [ %324, %323 ]
  %334 = phi i32 [ %291, %287 ], [ %216, %292 ], [ %216, %329 ], [ %216, %323 ]
  %335 = phi i32 [ %237, %287 ], [ %237, %292 ], [ %325, %329 ], [ %325, %323 ]
  %336 = phi i32 [ %260, %287 ], [ %260, %292 ], [ %214, %329 ], [ %214, %323 ]
  %337 = phi i32 [ %213, %287 ], [ %213, %292 ], [ %308, %329 ], [ %308, %323 ]
  %338 = phi i32 [ %285, %287 ], [ %285, %292 ], [ %305, %329 ], [ %305, %323 ]
  %339 = phi i32 [ %261, %287 ], [ %261, %292 ], [ %326, %329 ], [ %326, %323 ]
  %340 = phi i32 [ %262, %287 ], [ %262, %292 ], [ %327, %329 ], [ %327, %323 ]
  %341 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 76)
  %342 = icmp sgt i32 %335, 509
  br i1 %342, label %343, label %364

343:                                              ; preds = %331
  %344 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 77)
  %345 = icmp sgt i32 %9, 633
  br i1 %345, label %346, label %348

346:                                              ; preds = %343
  %347 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 78)
  br label %348

348:                                              ; preds = %346, %343
  %349 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 79)
  %350 = icmp sgt i32 %335, %184
  br i1 %350, label %353, label %351

351:                                              ; preds = %348
  %352 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 80)
  br label %353

353:                                              ; preds = %351, %348
  %354 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 81)
  %355 = icmp slt i32 %338, 651
  br i1 %355, label %356, label %360

356:                                              ; preds = %353
  %357 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 82)
  br label %358

358:                                              ; preds = %358, %356
  %359 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 82)
  br label %358, !llvm.loop !18

360:                                              ; preds = %353
  %361 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 83)
  br label %362

362:                                              ; preds = %362, %360
  %363 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 84)
  br label %362, !llvm.loop !19

364:                                              ; preds = %331
  %365 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 85)
  br i1 %209, label %366, label %373

366:                                              ; preds = %364
  %367 = icmp slt i32 %340, 316
  br label %368

368:                                              ; preds = %372, %366
  %369 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 86)
  br i1 %367, label %370, label %372

370:                                              ; preds = %368
  %371 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 87)
  br label %372

372:                                              ; preds = %370, %368
  br label %368, !llvm.loop !20

373:                                              ; preds = %364
  %374 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 88)
  %375 = icmp eq i32 %336, 319
  br i1 %375, label %398, label %376

376:                                              ; preds = %373
  %377 = mul nsw i32 %333, %333
  %378 = sub nsw i32 %377, %338
  %379 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 89)
  %380 = icmp slt i32 %334, 456
  br i1 %380, label %381, label %384

381:                                              ; preds = %392, %376
  br label %382

382:                                              ; preds = %381, %382
  %383 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 90)
  br label %382, !llvm.loop !21

384:                                              ; preds = %376, %392
  %385 = phi i32 [ %393, %392 ], [ %196, %376 ]
  %386 = phi i32 [ %394, %392 ], [ %334, %376 ]
  %387 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 91)
  br i1 %199, label %388, label %392

388:                                              ; preds = %384
  %389 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 92)
  %390 = or i32 %378, %385
  %391 = xor i32 %390, -1
  br label %392

392:                                              ; preds = %388, %384
  %393 = phi i32 [ %390, %388 ], [ %385, %384 ]
  %394 = phi i32 [ %391, %388 ], [ %386, %384 ]
  %395 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 93)
  %396 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 89)
  %397 = icmp slt i32 %394, 456
  br i1 %397, label %381, label %384, !llvm.loop !22

398:                                              ; preds = %373
  %399 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 94)
  %400 = icmp eq i32 %340, %9
  br i1 %400, label %210, label %401, !llvm.loop !23

401:                                              ; preds = %398, %180
  %402 = phi i32 [ %189, %180 ], [ %338, %398 ]
  %403 = phi i32 [ %0, %180 ], [ %340, %398 ]
  %404 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 noundef 95)
  %405 = or i32 %402, %9
  %406 = mul nsw i32 %403, %405
  ret i32 %406
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = tail call i32 @f_rand_0()
  %2 = tail call i32 @f_rand_3()
  %3 = tail call i32 @f_rand_4()
  %4 = tail call i32 @func0(i32 noundef %1, i32 undef, i32 noundef %2, i32 noundef 169)
  %5 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32 noundef %4)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!"llvm.loop.peeled.count", i32 1}
!8 = distinct !{!8, !6, !7}
!9 = distinct !{!9, !6, !7}
!10 = distinct !{!10, !6, !7}
!11 = distinct !{!11, !6, !7}
!12 = distinct !{!12, !6, !7}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6, !7}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6, !7}
!19 = distinct !{!19, !6}
!20 = distinct !{!20, !6}
!21 = distinct !{!21, !6}
!22 = distinct !{!22, !6}
!23 = distinct !{!23, !6}
