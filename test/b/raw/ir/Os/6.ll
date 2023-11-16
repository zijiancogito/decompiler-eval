; ModuleID = '../../../test/b/raw/src/6.c'
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

; Function Attrs: noinline nounwind optsize uwtable
define dso_local i32 @func0() local_unnamed_addr #0 {
  %1 = tail call i32 @f_rand_0() #3
  %2 = tail call i32 @f_rand_4() #3
  %3 = tail call i32 @f_rand_2() #3
  %4 = tail call i32 @f_rand_1() #3
  %5 = tail call i32 @f_rand_3() #3
  %6 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0) #3
  %7 = srem i32 %5, 298
  %8 = add nsw i32 %7, 298
  %9 = icmp slt i32 %8, %2
  br i1 %9, label %51, label %10

10:                                               ; preds = %0
  %11 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1) #3
  %12 = xor i32 %8, %5
  %13 = add i32 %5, %3
  %14 = add i32 %13, %12
  %15 = icmp sgt i32 %4, 685
  br i1 %15, label %16, label %31

16:                                               ; preds = %10
  %17 = add nsw i32 %2, %1
  %18 = mul nsw i32 %17, %2
  br label %19

19:                                               ; preds = %16, %19
  %20 = phi i32 [ %3, %16 ], [ %26, %19 ]
  %21 = phi i32 [ %8, %16 ], [ %18, %19 ]
  %22 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2) #3
  %23 = srem i32 298, %21
  %24 = sub nsw i32 %23, %20
  %25 = sdiv i32 298, %20
  %26 = srem i32 %25, %20
  %27 = icmp sgt i32 %24, 685
  br i1 %27, label %19, label %28, !llvm.loop !5

28:                                               ; preds = %19
  %29 = srem i32 %1, %24
  %30 = add nsw i32 %29, %26
  br label %31

31:                                               ; preds = %28, %10
  %32 = phi i32 [ %18, %28 ], [ %8, %10 ]
  %33 = phi i32 [ %30, %28 ], [ %14, %10 ]
  %34 = phi i32 [ %24, %28 ], [ %4, %10 ]
  %35 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3) #3
  %36 = add nsw i32 %33, %32
  %37 = srem i32 %36, %1
  %38 = mul nsw i32 %37, 298
  %39 = srem i32 %38, %34
  %40 = add nsw i32 %39, %34
  %41 = xor i32 %32, -1
  %42 = add nsw i32 %34, %41
  %43 = icmp eq i32 %34, 298
  br i1 %43, label %44, label %75

44:                                               ; preds = %31
  %45 = add i32 %32, 1
  %46 = sub i32 %45, %1
  %47 = add i32 %46, %40
  %48 = icmp eq i32 %47, 298
  br label %49

49:                                               ; preds = %44, %49
  %50 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4) #3
  br i1 %48, label %49, label %75, !llvm.loop !7

51:                                               ; preds = %0
  %52 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5) #3
  %53 = icmp slt i32 %5, %3
  br i1 %53, label %54, label %56

54:                                               ; preds = %51, %54
  %55 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6) #3
  br label %54, !llvm.loop !8

56:                                               ; preds = %51
  %57 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7) #3
  %58 = mul nsw i32 %8, %5
  %59 = and i32 %58, %1
  %60 = xor i32 %8, %4
  %61 = mul nsw i32 %60, %1
  %62 = xor i32 %61, %5
  %63 = sdiv i32 %5, %62
  %64 = or i32 %63, %5
  %65 = icmp sgt i32 %4, 406
  br i1 %65, label %66, label %75

66:                                               ; preds = %56
  %67 = mul nsw i32 %62, %62
  %68 = icmp ugt i32 %67, 406
  br label %69

69:                                               ; preds = %66, %69
  %70 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8) #3
  br i1 %68, label %69, label %71, !llvm.loop !9

71:                                               ; preds = %69
  %72 = mul nsw i32 %60, %64
  %73 = xor i32 %72, -1
  %74 = or i32 %62, %73
  br label %75

75:                                               ; preds = %49, %31, %56, %71
  %76 = phi i32 [ %8, %71 ], [ %8, %56 ], [ %32, %31 ], [ %32, %49 ]
  %77 = phi i32 [ %67, %71 ], [ %4, %56 ], [ %34, %31 ], [ %47, %49 ]
  %78 = phi i32 [ %74, %71 ], [ %59, %56 ], [ %42, %31 ], [ %40, %49 ]
  %79 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9) #3
  %80 = add nsw i32 %76, 298
  %81 = or i32 %80, 1
  %82 = add nsw i32 %81, %78
  %83 = sub nsw i32 %78, %77
  %84 = xor i32 %83, %78
  %85 = sdiv i32 %84, %82
  %86 = add nsw i32 %85, %80
  %87 = or i32 %86, %80
  %88 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10) #3
  %89 = xor i32 %87, 298
  ret i32 %89
}

; Function Attrs: nofree nounwind optsize
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optsize uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = tail call i32 @func0() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %1) #3
  ret i32 0
}

; Function Attrs: noinline nounwind optsize uwtable
define dso_local i32 @f_rand_0() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #4
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 noundef 0) #3
  ret i32 %1
}

; Function Attrs: nounwind optsize
declare i32 @rand() local_unnamed_addr #2

; Function Attrs: noinline nounwind optsize uwtable
define dso_local i32 @f_rand_1() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #4
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i32 noundef 1) #3
  ret i32 %1
}

; Function Attrs: noinline nounwind optsize uwtable
define dso_local i32 @f_rand_2() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #4
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i32 noundef 2) #3
  ret i32 %1
}

; Function Attrs: noinline nounwind optsize uwtable
define dso_local i32 @f_rand_3() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #4
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i32 noundef 3) #3
  ret i32 %1
}

; Function Attrs: noinline nounwind optsize uwtable
define dso_local i32 @f_rand_4() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #4
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i32 noundef 4) #3
  ret i32 %1
}

attributes #0 = { noinline nounwind optsize uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind optsize "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind optsize "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize }
attributes #4 = { nounwind optsize }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
