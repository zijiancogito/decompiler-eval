; ModuleID = '../../../test/b/raw/src/7.c'
source_filename = "../../../test/b/raw/src/7.c"
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
  %2 = tail call i32 @f_rand_1() #3
  %3 = tail call i32 @f_rand_2() #3
  %4 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0) #3
  %5 = xor i32 %3, %1
  %6 = mul nsw i32 %5, 40
  %7 = add nsw i32 %6, %3
  %8 = mul nsw i32 %7, %2
  %9 = icmp eq i32 %1, 999
  br i1 %9, label %10, label %35

10:                                               ; preds = %0
  %11 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1) #3
  %12 = icmp slt i32 %3, 312
  br i1 %12, label %13, label %15

13:                                               ; preds = %10, %13
  %14 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2) #3
  br label %13, !llvm.loop !5

15:                                               ; preds = %10
  %16 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3) #3
  %17 = xor i32 %8, -1
  %18 = or i32 %3, %17
  %19 = add nsw i32 %18, 40
  %20 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4) #3
  %21 = and i32 %19, 999
  %22 = srem i32 %21, %19
  %23 = xor i32 %22, 40
  %24 = sub nsw i32 %23, %8
  %25 = xor i32 %24, -1
  %26 = srem i32 %25, %19
  %27 = sdiv i32 %19, %3
  %28 = and i32 %27, %26
  %29 = xor i32 %28, -1
  %30 = mul nsw i32 %8, %29
  %31 = xor i32 %30, 40
  %32 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6) #3
  %33 = mul i32 %24, %8
  %34 = mul i32 %33, %31
  br label %35

35:                                               ; preds = %15, %0
  %36 = phi i32 [ %34, %15 ], [ %3, %0 ]
  %37 = phi i32 [ %19, %15 ], [ %2, %0 ]
  %38 = phi i32 [ %31, %15 ], [ 40, %0 ]
  %39 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7) #3
  %40 = icmp eq i32 %36, 42
  br i1 %40, label %51, label %41

41:                                               ; preds = %35
  %42 = icmp eq i32 %37, %38
  %43 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8) #3
  br i1 %42, label %44, label %47

44:                                               ; preds = %47, %41
  br label %45

45:                                               ; preds = %44, %45
  %46 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9) #3
  br label %45, !llvm.loop !7

47:                                               ; preds = %41, %47
  %48 = phi i1 [ %42, %47 ], [ false, %41 ]
  %49 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10) #3
  %50 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8) #3
  br i1 %48, label %44, label %47, !llvm.loop !8

51:                                               ; preds = %35
  %52 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11) #3
  %53 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12) #3
  ret i32 -43
}

; Function Attrs: nofree nounwind optsize
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optsize uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = tail call i32 @func0() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef -43) #3
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