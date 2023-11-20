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
  %1 = tail call i32 @f_rand_0()
  %2 = tail call i32 @f_rand_1()
  %3 = tail call i32 @f_rand_2()
  %4 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %5 = icmp eq i32 %3, 547
  br i1 %5, label %6, label %68

6:                                                ; preds = %0
  %7 = xor i32 %2, -1
  %8 = icmp sgt i32 %2, %7
  %9 = icmp sgt i32 %2, 286
  %10 = sub nsw i32 0, %2
  %11 = add nsw i32 %2, -1
  br i1 %9, label %12, label %36

12:                                               ; preds = %6
  br i1 %8, label %13, label %30, !llvm.loop !5

13:                                               ; preds = %12, %18
  %14 = phi i32 [ %23, %18 ], [ 78, %12 ]
  %15 = phi i32 [ %25, %18 ], [ 78, %12 ]
  %16 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %17 = icmp slt i32 %15, %2
  br i1 %17, label %18, label %27

18:                                               ; preds = %27, %13
  %19 = phi i32 [ %29, %27 ], [ 547, %13 ]
  %20 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %21 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  %22 = xor i32 %19, %2
  %23 = sdiv i32 %22, %11
  %24 = mul nsw i32 %19, %10
  %25 = srem i32 %24, %2
  %26 = icmp eq i32 %19, 547
  br i1 %26, label %13, label %68, !llvm.loop !7

27:                                               ; preds = %13
  %28 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %29 = xor i32 %14, -1
  br label %18

30:                                               ; preds = %12
  %31 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  br label %32

32:                                               ; preds = %32, %30
  %33 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %34 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  %35 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  br label %32

36:                                               ; preds = %6
  %37 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %38 = icmp sgt i32 %2, 78
  br i1 %8, label %39, label %47, !llvm.loop !5

39:                                               ; preds = %36
  br i1 %38, label %40, label %58

40:                                               ; preds = %39, %40
  %41 = phi i32 [ %44, %40 ], [ 78, %39 ]
  %42 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %43 = sdiv i32 %2, %41
  %44 = sdiv i32 %43, 547
  %45 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %46 = icmp slt i32 %44, %2
  br i1 %46, label %40, label %58

47:                                               ; preds = %36
  br i1 %38, label %51, label %48

48:                                               ; preds = %51, %47
  br label %49

49:                                               ; preds = %48, %49
  %50 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  br label %49

51:                                               ; preds = %47, %51
  %52 = phi i32 [ %55, %51 ], [ 78, %47 ]
  %53 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %54 = sdiv i32 %2, %52
  %55 = sdiv i32 %54, 547
  %56 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %57 = icmp slt i32 %55, %2
  br i1 %57, label %51, label %48

58:                                               ; preds = %40, %39
  %59 = phi i32 [ 78, %39 ], [ %44, %40 ]
  %60 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %61 = xor i32 %59, 78
  %62 = add nsw i32 %61, %59
  %63 = sdiv i32 %62, %59
  %64 = or i32 %63, %2
  %65 = and i32 %64, 78
  %66 = xor i32 %65, %7
  %67 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  br label %68

68:                                               ; preds = %18, %58, %0
  %69 = phi i32 [ %3, %0 ], [ -79, %58 ], [ %19, %18 ]
  %70 = phi i32 [ %1, %0 ], [ %66, %58 ], [ %10, %18 ]
  %71 = phi i32 [ 78, %0 ], [ 78, %58 ], [ %23, %18 ]
  %72 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %73 = add i32 %70, 1
  %74 = xor i32 %70, -1
  %75 = icmp eq i32 %69, %74
  br i1 %75, label %96, label %76

76:                                               ; preds = %68
  %77 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %78 = xor i32 %71, %2
  %79 = srem i32 %78, %70
  %80 = mul i32 %71, %79
  %81 = sub i32 0, %80
  %82 = or i32 %81, %74
  %83 = srem i32 %82, %70
  %84 = icmp sgt i32 %2, %70
  br i1 %84, label %89, label %85

85:                                               ; preds = %76
  %86 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  %87 = add i32 %73, %69
  %88 = add i32 %87, %71
  br label %89

89:                                               ; preds = %85, %76
  %90 = phi i32 [ %88, %85 ], [ %70, %76 ]
  %91 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %92 = icmp sgt i32 %83, %69
  %93 = select i1 %92, i32 9, i32 10
  %94 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef %93)
  %95 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  br label %96

96:                                               ; preds = %89, %68
  %97 = phi i32 [ %90, %89 ], [ %70, %68 ]
  %98 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 12)
  %99 = sdiv i32 %97, %71
  ret i32 %99
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
!7 = distinct !{!7, !6}
