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

define dso_local i32 @func0() local_unnamed_addr #0 {
  %1 = call i32 @f_rand_0()
  %2 = call i32 @f_rand_4()
  %3 = call i32 @f_rand_2()
  %4 = call i32 @f_rand_1()
  %5 = call i32 @f_rand_3()
  %6 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %7 = srem i32 %5, 298
  %8 = add nsw i32 %7, 298
  %9 = icmp slt i32 %8, %2
  br i1 %9, label %51, label %10

10:                                               ; preds = %0
  %11 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
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
  %22 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
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
  %35 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %36 = add nsw i32 %33, %32
  %37 = srem i32 %36, %1
  %38 = mul nsw i32 %37, 298
  %39 = srem i32 %38, %34
  %40 = add nsw i32 %39, %34
  %41 = xor i32 %32, -1
  %42 = add nsw i32 %34, %41
  %43 = icmp eq i32 %34, 298
  br i1 %43, label %44, label %77

44:                                               ; preds = %31
  %45 = add i32 %32, 1
  %46 = sub i32 %45, %1
  %47 = add i32 %46, %40
  %48 = icmp eq i32 %47, 298
  br label %49

49:                                               ; preds = %44, %49
  %50 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  br i1 %48, label %49, label %77, !llvm.loop !8

51:                                               ; preds = %0
  %52 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %53 = icmp slt i32 %5, %3
  br i1 %53, label %54, label %57

54:                                               ; preds = %51, %54
  %55 = phi i1 [ %53, %54 ], [ true, %51 ]
  %56 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  br i1 %55, label %54, label %57, !llvm.loop !9

57:                                               ; preds = %54, %51
  %58 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  %59 = mul nsw i32 %8, %5
  %60 = and i32 %59, %1
  %61 = xor i32 %8, %4
  %62 = mul nsw i32 %61, %1
  %63 = xor i32 %62, %5
  %64 = sdiv i32 %5, %63
  %65 = or i32 %64, %5
  %66 = icmp sgt i32 %4, 406
  br i1 %66, label %67, label %77

67:                                               ; preds = %57
  %68 = mul nsw i32 %63, %63
  %69 = icmp ugt i32 %68, 406
  br label %70

70:                                               ; preds = %67, %70
  %71 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  br i1 %69, label %70, label %72, !llvm.loop !10

72:                                               ; preds = %70
  %73 = xor i32 %4, %8
  %74 = mul nsw i32 %73, %65
  %75 = xor i32 %74, -1
  %76 = or i32 %63, %75
  br label %77

77:                                               ; preds = %49, %31, %57, %72
  %78 = phi i32 [ %8, %72 ], [ %8, %57 ], [ %32, %31 ], [ %32, %49 ]
  %79 = phi i32 [ %68, %72 ], [ %4, %57 ], [ %34, %31 ], [ %47, %49 ]
  %80 = phi i32 [ %76, %72 ], [ %60, %57 ], [ %42, %31 ], [ %40, %49 ]
  %81 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %82 = add nsw i32 %78, 298
  %83 = or i32 %82, 1
  %84 = add nsw i32 %83, %80
  %85 = sub nsw i32 %80, %79
  %86 = xor i32 %85, %80
  %87 = sdiv i32 %86, %84
  %88 = add nsw i32 %87, %82
  %89 = or i32 %88, %82
  %90 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %91 = xor i32 %89, 298
  ret i32 %91
}

declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = call i32 @func0()
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %1)
  ret i32 0
}

define dso_local i32 @f_rand_0() local_unnamed_addr #0 {
  %1 = call i32 @rand() #3
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 noundef 0)
  ret i32 %1
}

declare i32 @rand() local_unnamed_addr #2

define dso_local i32 @f_rand_1() local_unnamed_addr #0 {
  %1 = call i32 @rand() #3
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i32 noundef 1)
  ret i32 %1
}

define dso_local i32 @f_rand_2() local_unnamed_addr #0 {
  %1 = call i32 @rand() #3
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i32 noundef 2)
  ret i32 %1
}

define dso_local i32 @f_rand_3() local_unnamed_addr #0 {
  %1 = call i32 @rand() #3
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i32 noundef 3)
  ret i32 %1
}

define dso_local i32 @f_rand_4() local_unnamed_addr #0 {
  %1 = call i32 @rand() #3
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i32 noundef 4)
  ret i32 %1
}


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
