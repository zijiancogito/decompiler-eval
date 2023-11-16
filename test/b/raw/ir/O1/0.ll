; ModuleID = '../../../test/b/raw/src/0.c'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @func0() local_unnamed_addr #0 {
  %1 = call i32 @f_rand_4()
  %2 = call i32 @f_rand_3()
  %3 = call i32 @f_rand_2()
  %4 = call i32 @f_rand_1()
  %5 = call i32 @f_rand_0()
  %6 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %7 = xor i32 %3, -1
  %8 = srem i32 %7, 302
  %9 = add nsw i32 %8, 719
  %10 = and i32 %9, %1
  %11 = and i32 %10, %2
  %12 = icmp eq i32 %4, 543
  br i1 %12, label %13, label %52

13:                                               ; preds = %0
  %14 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %15 = add nsw i32 %3, -720
  %16 = xor i32 %5, -1
  %17 = icmp eq i32 %10, 925
  br i1 %17, label %18, label %43

18:                                               ; preds = %13
  %19 = or i32 %1, %11
  %20 = or i32 %19, 719
  %21 = and i32 %20, %10
  %22 = and i32 %16, 719
  %23 = mul nsw i32 %22, %5
  br label %24

24:                                               ; preds = %18, %24
  %25 = phi i32 [ 302, %18 ], [ %31, %24 ]
  %26 = phi i32 [ %3, %18 ], [ %42, %24 ]
  %27 = phi i32 [ 543, %18 ], [ %36, %24 ]
  %28 = phi i32 [ %21, %18 ], [ %41, %24 ]
  %29 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %30 = mul nsw i32 %25, %16
  %31 = sub nsw i32 %30, %27
  %32 = xor i32 %27, -1
  %33 = sub nsw i32 925, %28
  %34 = srem i32 %33, %27
  %35 = and i32 %27, %15
  %36 = and i32 %35, %34
  %37 = xor i32 %28, %11
  %38 = xor i32 %37, %31
  %39 = sdiv i32 %38, %11
  %40 = or i32 %39, %32
  %41 = sdiv i32 %40, %5
  %42 = xor i32 %26, %23
  br i1 %17, label %24, label %43, !llvm.loop !5

43:                                               ; preds = %24, %13
  %44 = phi i32 [ 543, %13 ], [ %36, %24 ]
  %45 = phi i32 [ %3, %13 ], [ %42, %24 ]
  %46 = phi i32 [ 302, %13 ], [ %31, %24 ]
  %47 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %48 = icmp slt i32 %5, 610
  br i1 %48, label %49, label %52

49:                                               ; preds = %43, %49
  %50 = phi i1 [ %48, %49 ], [ true, %43 ]
  %51 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  br i1 %50, label %49, label %52, !llvm.loop !8

52:                                               ; preds = %49, %43, %0
  %53 = phi i32 [ %4, %0 ], [ %44, %43 ], [ %44, %49 ]
  %54 = phi i32 [ %3, %0 ], [ %45, %43 ], [ %45, %49 ]
  %55 = phi i32 [ %1, %0 ], [ %16, %43 ], [ %16, %49 ]
  %56 = phi i32 [ 302, %0 ], [ %46, %43 ], [ %46, %49 ]
  %57 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %58 = icmp eq i32 %55, 627
  br i1 %58, label %88, label %59

59:                                               ; preds = %52
  %60 = icmp slt i32 %55, 352
  %61 = xor i32 %55, -1
  %62 = icmp sgt i32 %56, 719
  %63 = xor i32 %10, -1
  br label %64

64:                                               ; preds = %59, %84
  %65 = phi i32 [ %11, %59 ], [ %86, %84 ]
  %66 = phi i32 [ %53, %59 ], [ %85, %84 ]
  %67 = phi i32 [ %5, %59 ], [ %76, %84 ]
  %68 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  br i1 %60, label %69, label %75

69:                                               ; preds = %64, %69
  %70 = phi i1 [ %60, %69 ], [ true, %64 ]
  %71 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  br i1 %70, label %69, label %72, !llvm.loop !9

72:                                               ; preds = %69
  %73 = srem i32 %56, %10
  %74 = and i32 %73, %56
  br label %75

75:                                               ; preds = %72, %64
  %76 = phi i32 [ %74, %72 ], [ %67, %64 ]
  %77 = phi i32 [ %61, %72 ], [ %65, %64 ]
  %78 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  br i1 %62, label %79, label %84

79:                                               ; preds = %75
  %80 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %81 = sdiv i32 %55, %10
  %82 = and i32 %81, %54
  %83 = srem i32 %63, %56
  br label %84

84:                                               ; preds = %79, %75
  %85 = phi i32 [ %83, %79 ], [ %66, %75 ]
  %86 = phi i32 [ %82, %79 ], [ %77, %75 ]
  %87 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  br i1 %58, label %88, label %64, !llvm.loop !10

88:                                               ; preds = %84, %52
  %89 = phi i32 [ %5, %52 ], [ %76, %84 ]
  %90 = phi i32 [ %53, %52 ], [ %85, %84 ]
  %91 = phi i32 [ %11, %52 ], [ %86, %84 ]
  %92 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %93 = add nsw i32 %54, -719
  %94 = xor i32 %90, %93
  %95 = and i32 %94, %89
  %96 = srem i32 %95, %91
  ret i32 %96
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = call i32 @func0()
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %1)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_0() local_unnamed_addr #0 {
  %1 = call i32 @rand() #3
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 noundef 0)
  ret i32 %1
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_1() local_unnamed_addr #0 {
  %1 = call i32 @rand() #3
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i32 noundef 1)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_2() local_unnamed_addr #0 {
  %1 = call i32 @rand() #3
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i32 noundef 2)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_3() local_unnamed_addr #0 {
  %1 = call i32 @rand() #3
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i32 noundef 3)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_4() local_unnamed_addr #0 {
  %1 = call i32 @rand() #3
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i32 noundef 4)
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
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !6, !7}
!9 = distinct !{!9, !6, !7}
!10 = distinct !{!10, !6, !7}
