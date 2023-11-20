source_filename = "../../../test/b/raw/src/9.c"
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
  %1 = tail call i32 @f_rand_0() #3
  %2 = tail call i32 @f_rand_1() #3
  %3 = tail call i32 @f_rand_2() #3
  %4 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0) #3
  %5 = icmp eq i32 %3, 547
  br i1 %5, label %6, label %46

6:                                                ; preds = %0
  %7 = xor i32 %2, -1
  %8 = icmp sgt i32 %2, %7
  %9 = icmp sgt i32 %2, 286
  %10 = sub nsw i32 0, %2
  %11 = add nsw i32 %2, -1
  br label %12

12:                                               ; preds = %6, %41
  %13 = phi i32 [ 78, %6 ], [ %44, %41 ]
  %14 = phi i32 [ %1, %6 ], [ %43, %41 ]
  %15 = phi i32 [ 78, %6 ], [ %42, %41 ]
  %16 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1) #3
  %17 = icmp slt i32 %15, %2
  br i1 %17, label %28, label %18

18:                                               ; preds = %12, %18
  %19 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2) #3
  br i1 %8, label %20, label %18, !llvm.loop !5

20:                                               ; preds = %18
  %21 = xor i32 %15, %13
  %22 = add nsw i32 %21, %15
  %23 = sdiv i32 %22, %15
  %24 = xor i32 %13, -1
  %25 = or i32 %23, %2
  %26 = and i32 %25, %13
  %27 = xor i32 %26, %7
  br label %28

28:                                               ; preds = %20, %12
  %29 = phi i32 [ %7, %20 ], [ %15, %12 ]
  %30 = phi i32 [ %24, %20 ], [ 547, %12 ]
  %31 = phi i32 [ %27, %20 ], [ %14, %12 ]
  %32 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3) #3
  %33 = sdiv i32 %2, %29
  %34 = sdiv i32 %33, %30
  br i1 %9, label %35, label %41

35:                                               ; preds = %28
  %36 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4) #3
  %37 = xor i32 %30, %2
  %38 = sdiv i32 %37, %11
  %39 = mul nsw i32 %30, %10
  %40 = srem i32 %39, %2
  br label %41

41:                                               ; preds = %35, %28
  %42 = phi i32 [ %40, %35 ], [ %34, %28 ]
  %43 = phi i32 [ %10, %35 ], [ %31, %28 ]
  %44 = phi i32 [ %38, %35 ], [ %13, %28 ]
  %45 = icmp eq i32 %30, 547
  br i1 %45, label %12, label %46, !llvm.loop !7

46:                                               ; preds = %41, %0
  %47 = phi i32 [ %3, %0 ], [ %30, %41 ]
  %48 = phi i32 [ %1, %0 ], [ %43, %41 ]
  %49 = phi i32 [ 78, %0 ], [ %44, %41 ]
  %50 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5) #3
  %51 = add i32 %48, 1
  %52 = xor i32 %48, -1
  %53 = icmp eq i32 %47, %52
  br i1 %53, label %74, label %54

54:                                               ; preds = %46
  %55 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6) #3
  %56 = xor i32 %49, %2
  %57 = srem i32 %56, %48
  %58 = mul i32 %49, %57
  %59 = sub i32 0, %58
  %60 = or i32 %59, %52
  %61 = srem i32 %60, %48
  %62 = icmp sgt i32 %2, %48
  br i1 %62, label %67, label %63

63:                                               ; preds = %54
  %64 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7) #3
  %65 = add i32 %51, %47
  %66 = add i32 %65, %49
  br label %67

67:                                               ; preds = %63, %54
  %68 = phi i32 [ %66, %63 ], [ %48, %54 ]
  %69 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8) #3
  %70 = icmp sgt i32 %61, %47
  %71 = select i1 %70, i32 9, i32 10
  %72 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef %71) #3
  %73 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11) #3
  br label %74

74:                                               ; preds = %67, %46
  %75 = phi i32 [ %68, %67 ], [ %48, %46 ]
  %76 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12) #3
  %77 = sdiv i32 %75, %49
  ret i32 %77
}

declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = tail call i32 @func0() #3
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %1) #3
  ret i32 0
}

define dso_local i32 @f_rand_0() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #4
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 noundef 0) #3
  ret i32 %1
}

declare i32 @rand() local_unnamed_addr #2

define dso_local i32 @f_rand_1() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #4
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i32 noundef 1) #3
  ret i32 %1
}

define dso_local i32 @f_rand_2() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #4
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i32 noundef 2) #3
  ret i32 %1
}

define dso_local i32 @f_rand_3() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #4
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i32 noundef 3) #3
  ret i32 %1
}

define dso_local i32 @f_rand_4() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #4
  %2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i32 noundef 4) #3
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
!7 = distinct !{!7, !6}
