; ModuleID = '../../../test/b/raw/src/8.c'
source_filename = "../../../test/b/raw/src/8.c"
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
  %1 = call i32 @f_rand_1()
  %2 = call i32 @f_rand_2()
  %3 = call i32 @f_rand_0()
  %4 = call i32 @f_rand_4()
  %5 = call i32 @f_rand_3()
  %6 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %7 = icmp eq i32 %5, %2
  br i1 %7, label %55, label %8

8:                                                ; preds = %0
  %9 = icmp sgt i32 %2, 594
  %10 = icmp sgt i32 %2, 580
  br label %11

11:                                               ; preds = %8, %46
  %12 = phi i32 [ %1, %8 ], [ %49, %46 ]
  %13 = phi i32 [ %3, %8 ], [ %48, %46 ]
  %14 = phi i32 [ %4, %8 ], [ %47, %46 ]
  %15 = phi i32 [ %5, %8 ], [ %52, %46 ]
  %16 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  br i1 %9, label %17, label %30

17:                                               ; preds = %11, %17
  %18 = phi i32 [ %27, %17 ], [ %12, %11 ]
  %19 = phi i32 [ %24, %17 ], [ %13, %11 ]
  %20 = phi i32 [ %29, %17 ], [ %14, %11 ]
  %21 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %22 = mul nsw i32 %19, %15
  %23 = srem i32 %22, %2
  %24 = or i32 %23, %15
  %25 = sdiv i32 %24, %18
  %26 = srem i32 %25, %24
  %27 = and i32 %26, %2
  %28 = xor i32 %24, %20
  %29 = xor i32 %28, %27
  br i1 %9, label %17, label %30, !llvm.loop !5

30:                                               ; preds = %17, %11
  %31 = phi i32 [ %14, %11 ], [ %29, %17 ]
  %32 = phi i32 [ %13, %11 ], [ %24, %17 ]
  %33 = phi i32 [ %12, %11 ], [ %27, %17 ]
  %34 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  br i1 %10, label %35, label %46

35:                                               ; preds = %30
  %36 = xor i32 %15, -1
  br label %37

37:                                               ; preds = %35, %37
  %38 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  br i1 %10, label %37, label %39, !llvm.loop !8

39:                                               ; preds = %37
  %40 = sdiv i32 %36, %2
  %41 = and i32 %32, %2
  %42 = srem i32 %41, %15
  %43 = sub i32 0, %31
  %44 = and i32 %42, %43
  %45 = srem i32 %44, %15
  br label %46

46:                                               ; preds = %39, %30
  %47 = phi i32 [ -1, %39 ], [ %31, %30 ]
  %48 = phi i32 [ %40, %39 ], [ %32, %30 ]
  %49 = phi i32 [ %45, %39 ], [ %33, %30 ]
  %50 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %51 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %52 = xor i32 %49, -1
  %53 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %54 = icmp eq i32 %2, %52
  br i1 %54, label %55, label %11, !llvm.loop !9

55:                                               ; preds = %46, %0
  %56 = phi i32 [ %5, %0 ], [ %52, %46 ]
  %57 = phi i32 [ %4, %0 ], [ %47, %46 ]
  %58 = phi i32 [ %3, %0 ], [ %48, %46 ]
  %59 = phi i32 [ %1, %0 ], [ %49, %46 ]
  %60 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %61 = icmp sgt i32 %58, %57
  br i1 %61, label %62, label %66

62:                                               ; preds = %55
  %63 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %64 = sub nsw i32 %56, %57
  %65 = mul nsw i32 %64, %2
  br label %68

66:                                               ; preds = %55
  %67 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  br label %68

68:                                               ; preds = %66, %62
  %69 = phi i32 [ -1, %62 ], [ %57, %66 ]
  %70 = phi i32 [ %65, %62 ], [ %59, %66 ]
  %71 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12)
  %72 = shl nsw i32 %2, 1
  %73 = sub nsw i32 %72, %69
  %74 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 13)
  %75 = xor i32 %73, %58
  %76 = or i32 %75, %70
  ret i32 %76
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
