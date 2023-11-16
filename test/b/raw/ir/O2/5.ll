; ModuleID = '../../../test/b/raw/src/5.c'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @func0() local_unnamed_addr #0 {
  %1 = tail call i32 @f_rand_3()
  %2 = tail call i32 @f_rand_0()
  %3 = tail call i32 @f_rand_2()
  %4 = tail call i32 @f_rand_4()
  %5 = tail call i32 @f_rand_1()
  %6 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %7 = xor i32 %4, -1
  %8 = add nsw i32 %1, %7
  %9 = xor i32 %8, %1
  %10 = icmp eq i32 %8, 0
  br i1 %10, label %68, label %11

11:                                               ; preds = %0
  %12 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %13 = icmp slt i32 %2, %7
  br i1 %13, label %14, label %27

14:                                               ; preds = %11
  %15 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %16 = xor i32 %5, %4
  %17 = sub nsw i32 %16, %1
  %18 = mul nsw i32 %17, %9
  %19 = xor i32 %18, %7
  %20 = or i32 %19, %5
  %21 = or i32 %5, %4
  %22 = or i32 %21, %2
  %23 = add nsw i32 %22, %9
  %24 = mul nsw i32 %23, %2
  %25 = and i32 %9, %5
  %26 = add nsw i32 %20, %25
  br label %36

27:                                               ; preds = %11
  %28 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %29 = mul nsw i32 %9, %1
  %30 = and i32 %29, %7
  %31 = srem i32 %30, %9
  %32 = mul nsw i32 %5, %2
  %33 = add nsw i32 %32, %7
  %34 = or i32 %31, %33
  %35 = xor i32 %34, %4
  br label %36

36:                                               ; preds = %27, %14
  %37 = phi i32 [ %24, %14 ], [ %33, %27 ]
  %38 = phi i32 [ %21, %14 ], [ %4, %27 ]
  %39 = phi i32 [ %2, %14 ], [ %35, %27 ]
  %40 = phi i32 [ %26, %14 ], [ %31, %27 ]
  %41 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  %42 = icmp sgt i32 %40, 349
  br i1 %42, label %43, label %59

43:                                               ; preds = %36
  %44 = xor i32 %39, -1
  %45 = and i32 %9, %44
  br label %46

46:                                               ; preds = %43, %46
  %47 = phi i32 [ %37, %43 ], [ %50, %46 ]
  %48 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %49 = sdiv i32 %47, %9
  %50 = xor i32 %49, %39
  %51 = or i32 %50, %45
  %52 = xor i32 %5, %51
  %53 = xor i32 %52, -1
  %54 = sub nsw i32 %53, %38
  %55 = srem i32 %54, %38
  %56 = mul nsw i32 %55, %38
  %57 = xor i32 %56, %38
  %58 = icmp sgt i32 %57, 349
  br i1 %58, label %46, label %59, !llvm.loop !5

59:                                               ; preds = %46, %36
  %60 = phi i32 [ %37, %36 ], [ %50, %46 ]
  %61 = phi i32 [ %40, %36 ], [ %57, %46 ]
  %62 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %63 = icmp sgt i32 %60, 752
  br i1 %63, label %64, label %91

64:                                               ; preds = %59
  %65 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  br label %66

66:                                               ; preds = %66, %64
  %67 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  br label %66, !llvm.loop !7

68:                                               ; preds = %0
  %69 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %70 = icmp sgt i32 %1, %2
  br i1 %70, label %79, label %71

71:                                               ; preds = %68
  %72 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %73 = xor i32 %9, -1
  %74 = sub nsw i32 %2, %73
  %75 = and i32 %74, %1
  %76 = xor i32 %75, -1
  %77 = add nsw i32 %76, %73
  %78 = mul nsw i32 %77, %5
  br label %84

79:                                               ; preds = %68
  %80 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %81 = xor i32 %1, -1
  %82 = xor i32 %5, %1
  %83 = srem i32 %82, %81
  br label %84

84:                                               ; preds = %79, %71
  %85 = phi i32 [ %78, %71 ], [ %4, %79 ]
  %86 = phi i32 [ %73, %71 ], [ %9, %79 ]
  %87 = phi i32 [ %75, %71 ], [ %83, %79 ]
  %88 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %89 = add nsw i32 %87, %85
  %90 = xor i32 %89, %87
  br label %91

91:                                               ; preds = %59, %84
  %92 = phi i32 [ %85, %84 ], [ %38, %59 ]
  %93 = phi i32 [ %86, %84 ], [ %9, %59 ]
  %94 = phi i32 [ %90, %84 ], [ %61, %59 ]
  %95 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12)
  %96 = sub nsw i32 0, %94
  %97 = or i32 %96, 1
  %98 = sub nsw i32 %97, %93
  %99 = srem i32 %98, %93
  %100 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 13)
  %101 = add nsw i32 %99, %92
  %102 = or i32 %101, %92
  ret i32 %102
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = tail call i32 @func0()
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %1)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_0() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 noundef 0)
  ret i32 %1
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_1() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i32 noundef 1)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_2() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i32 noundef 2)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_3() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i32 noundef 3)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_4() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i32 noundef 4)
  ret i32 %1
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6, !8}
!8 = !{!"llvm.loop.peeled.count", i32 1}
