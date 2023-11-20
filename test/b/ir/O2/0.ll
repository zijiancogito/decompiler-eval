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

define dso_local i32 @func0() local_unnamed_addr #0 {
  %1 = tail call i32 @f_rand_4()
  %2 = tail call i32 @f_rand_3()
  %3 = tail call i32 @f_rand_2()
  %4 = tail call i32 @f_rand_1()
  %5 = tail call i32 @f_rand_0()
  %6 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %7 = xor i32 %3, -1
  %8 = srem i32 %7, 302
  %9 = add nsw i32 %8, 719
  %10 = and i32 %9, %1
  %11 = icmp eq i32 %4, 543
  br i1 %11, label %12, label %25

12:                                               ; preds = %0
  %13 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %14 = icmp eq i32 %10, 925
  br i1 %14, label %15, label %17

15:                                               ; preds = %12, %15
  %16 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  br label %15, !llvm.loop !5

17:                                               ; preds = %12
  %18 = xor i32 %5, -1
  %19 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %20 = icmp slt i32 %5, 610
  br i1 %20, label %21, label %25

21:                                               ; preds = %17
  %22 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  br label %23

23:                                               ; preds = %23, %21
  %24 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  br label %23, !llvm.loop !7

25:                                               ; preds = %17, %0
  %26 = phi i32 [ %1, %0 ], [ %18, %17 ]
  %27 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %28 = icmp eq i32 %26, 627
  br i1 %28, label %44, label %29

29:                                               ; preds = %25
  %30 = icmp slt i32 %26, 352
  %31 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  br i1 %30, label %36, label %32

32:                                               ; preds = %29
  %33 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %34 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %35 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  br label %40

36:                                               ; preds = %40, %29
  %37 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  br label %38

38:                                               ; preds = %38, %36
  %39 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  br label %38, !llvm.loop !9

40:                                               ; preds = %32, %40
  %41 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %42 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %43 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  br i1 %30, label %36, label %40, !llvm.loop !10

44:                                               ; preds = %25
  %45 = and i32 %10, %2
  %46 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  %47 = add nsw i32 %3, -719
  %48 = xor i32 %4, %47
  %49 = and i32 %48, %5
  %50 = srem i32 %49, %45
  ret i32 %50
}

declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = tail call i32 @func0()
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %1)
  ret i32 0
}

define dso_local i32 @f_rand_0() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 noundef 0)
  ret i32 %1
}

declare i32 @rand() local_unnamed_addr #2

define dso_local i32 @f_rand_1() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i32 noundef 1)
  ret i32 %1
}

define dso_local i32 @f_rand_2() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i32 noundef 2)
  ret i32 %1
}

define dso_local i32 @f_rand_3() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i32 noundef 3)
  ret i32 %1
}

define dso_local i32 @f_rand_4() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i32 noundef 4)
  ret i32 %1
}


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
!9 = distinct !{!9, !6, !8}
!10 = distinct !{!10, !6, !8}
