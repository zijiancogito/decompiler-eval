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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @func0() local_unnamed_addr #0 {
  %1 = tail call i32 @f_rand_0()
  %2 = tail call i32 @f_rand_4()
  %3 = tail call i32 @f_rand_2()
  %4 = tail call i32 @f_rand_1()
  %5 = tail call i32 @f_rand_3()
  %6 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %7 = srem i32 %5, 298
  %8 = add nsw i32 %7, 298
  %9 = icmp slt i32 %8, %2
  br i1 %9, label %63, label %10

10:                                               ; preds = %0
  %11 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %12 = xor i32 %8, %5
  %13 = add i32 %5, %3
  %14 = add i32 %13, %12
  %15 = icmp sgt i32 %4, 685
  br i1 %15, label %16, label %41

16:                                               ; preds = %10
  %17 = add nsw i32 %2, %1
  %18 = mul nsw i32 %17, %2
  %19 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %20 = trunc i32 %8 to i16
  %21 = urem i16 298, %20
  %22 = zext i16 %21 to i32
  %23 = sub nsw i32 %22, %3
  %24 = sdiv i32 298, %3
  %25 = srem i32 %24, %3
  %26 = icmp sgt i32 %23, 685
  br i1 %26, label %27, label %36

27:                                               ; preds = %16
  %28 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %29 = trunc i32 %25 to i16
  %30 = sdiv i16 298, %29
  %31 = trunc i32 %25 to i16
  %32 = srem i16 %30, %31
  %33 = sext i16 %32 to i32
  %34 = srem i32 298, %18
  %35 = sub nsw i32 %34, %25
  br label %36

36:                                               ; preds = %27, %16
  %37 = phi i32 [ %23, %16 ], [ %35, %27 ]
  %38 = phi i32 [ %25, %16 ], [ %33, %27 ]
  %39 = srem i32 %1, %37
  %40 = add nsw i32 %39, %38
  br label %41

41:                                               ; preds = %36, %10
  %42 = phi i32 [ %18, %36 ], [ %8, %10 ]
  %43 = phi i32 [ %40, %36 ], [ %14, %10 ]
  %44 = phi i32 [ %37, %36 ], [ %4, %10 ]
  %45 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %46 = add nsw i32 %43, %42
  %47 = srem i32 %46, %1
  %48 = mul nsw i32 %47, 298
  %49 = srem i32 %48, %44
  %50 = add nsw i32 %49, %44
  %51 = xor i32 %42, -1
  %52 = add nsw i32 %44, %51
  %53 = icmp eq i32 %44, 298
  br i1 %53, label %54, label %88

54:                                               ; preds = %41
  %55 = add i32 %42, 1
  %56 = sub i32 %55, %1
  %57 = add i32 %56, %50
  %58 = icmp eq i32 %57, 298
  br i1 %58, label %59, label %61, !llvm.loop !5

59:                                               ; preds = %54, %59
  %60 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  br label %59

61:                                               ; preds = %54
  %62 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  br label %88

63:                                               ; preds = %0
  %64 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %65 = icmp slt i32 %5, %3
  br i1 %65, label %66, label %68

66:                                               ; preds = %63, %66
  %67 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  br label %66

68:                                               ; preds = %63
  %69 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  %70 = mul nsw i32 %8, %5
  %71 = and i32 %70, %1
  %72 = xor i32 %8, %4
  %73 = mul nsw i32 %72, %1
  %74 = xor i32 %73, %5
  %75 = sdiv i32 %5, %74
  %76 = or i32 %75, %5
  %77 = icmp sgt i32 %4, 406
  br i1 %77, label %78, label %88

78:                                               ; preds = %68
  %79 = mul nsw i32 %74, %74
  %80 = icmp ugt i32 %79, 406
  br i1 %80, label %81, label %83, !llvm.loop !7

81:                                               ; preds = %78, %81
  %82 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  br label %81

83:                                               ; preds = %78
  %84 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %85 = mul nsw i32 %72, %76
  %86 = xor i32 %85, -1
  %87 = or i32 %74, %86
  br label %88

88:                                               ; preds = %41, %61, %68, %83
  %89 = phi i32 [ %8, %83 ], [ %8, %68 ], [ %42, %61 ], [ %42, %41 ]
  %90 = phi i32 [ %79, %83 ], [ %4, %68 ], [ %57, %61 ], [ %44, %41 ]
  %91 = phi i32 [ %87, %83 ], [ %71, %68 ], [ %50, %61 ], [ %52, %41 ]
  %92 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 9)
  %93 = add nsw i32 %89, 298
  %94 = or i32 %93, 1
  %95 = add nsw i32 %94, %91
  %96 = sub nsw i32 %91, %90
  %97 = xor i32 %96, %91
  %98 = sdiv i32 %97, %95
  %99 = add nsw i32 %98, %93
  %100 = or i32 %99, %93
  %101 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 10)
  %102 = xor i32 %100, 298
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
!7 = distinct !{!7, !6}
