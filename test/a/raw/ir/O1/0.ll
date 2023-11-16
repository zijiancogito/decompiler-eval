; ModuleID = '../../../test/a/raw/src/0.c'
source_filename = "../../../test/a/raw/src/0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"BB: %d\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"f_rand_0: %d\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"f_rand_1: %d\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"f_rand_2: %d\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"f_rand_3: %d\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"f_rand_4: %d\00", align 1

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local i32 @func0() local_unnamed_addr #0 {
  %1 = call i32 @f_rand_3()
  %2 = call i32 @f_rand_2()
  %3 = call i32 @f_rand_1()
  %4 = call i32 @f_rand_4()
  %5 = call i32 @f_rand_0()
  %6 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 0)
  %7 = or i32 %5, 777
  %8 = and i32 %7, %4
  %9 = add nsw i32 %8, -982
  %10 = xor i32 %9, %1
  %11 = mul nsw i32 %3, %2
  %12 = icmp sgt i32 %2, 817
  %13 = xor i32 %4, -1
  %14 = xor i32 %4, -1
  br label %15

15:                                               ; preds = %56, %0
  %16 = phi i32 [ %10, %0 ], [ %46, %56 ]
  %17 = phi i32 [ %5, %0 ], [ %61, %56 ]
  %18 = phi i32 [ %1, %0 ], [ %48, %56 ]
  %19 = phi i32 [ %8, %0 ], [ %33, %56 ]
  %20 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  %21 = and i32 %18, %11
  %22 = icmp eq i32 %3, %17
  br i1 %22, label %27, label %23

23:                                               ; preds = %15
  %24 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  %25 = and i32 %18, %17
  %26 = sdiv i32 %25, %16
  br label %31

27:                                               ; preds = %15
  %28 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  %29 = xor i32 %16, -1
  %30 = sdiv i32 %29, %3
  br label %31

31:                                               ; preds = %27, %23
  %32 = phi i32 [ %16, %23 ], [ %30, %27 ]
  %33 = phi i32 [ %26, %23 ], [ %19, %27 ]
  %34 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
  br i1 %12, label %35, label %45

35:                                               ; preds = %31, %35
  %36 = phi i32 [ %39, %35 ], [ %32, %31 ]
  %37 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 5)
  %38 = srem i32 %13, %4
  %39 = add nsw i32 %38, %36
  br i1 %12, label %35, label %40, !llvm.loop !5

40:                                               ; preds = %35
  %41 = xor i32 %39, -1
  %42 = mul nsw i32 %4, %41
  %43 = or i32 %21, 817
  %44 = sdiv i32 %43, %17
  br label %45

45:                                               ; preds = %40, %31
  %46 = phi i32 [ %39, %40 ], [ %32, %31 ]
  %47 = phi i32 [ %42, %40 ], [ %17, %31 ]
  %48 = phi i32 [ %44, %40 ], [ %18, %31 ]
  %49 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  %50 = icmp slt i32 %47, 223
  br i1 %50, label %51, label %56

51:                                               ; preds = %45
  %52 = and i32 %46, %14
  %53 = icmp slt i32 %52, 223
  br label %54

54:                                               ; preds = %51, %54
  %55 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 7)
  br i1 %53, label %54, label %56, !llvm.loop !8

56:                                               ; preds = %54, %45
  %57 = phi i32 [ %47, %45 ], [ %52, %54 ]
  %58 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 noundef 8)
  %59 = add nsw i32 %48, %46
  %60 = sdiv i32 %59, %33
  %61 = sdiv i32 %60, %57
  br label %15, !llvm.loop !9
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = call i32 @func0()
  unreachable
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_0() local_unnamed_addr #2 {
  %1 = call i32 @rand() #4
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 noundef 0)
  ret i32 %1
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_1() local_unnamed_addr #2 {
  %1 = call i32 @rand() #4
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i32 noundef 1)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_2() local_unnamed_addr #2 {
  %1 = call i32 @rand() #4
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0), i32 noundef 2)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_3() local_unnamed_addr #2 {
  %1 = call i32 @rand() #4
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i32 noundef 3)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f_rand_4() local_unnamed_addr #2 {
  %1 = call i32 @rand() #4
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i32 noundef 4)
  ret i32 %1
}

attributes #0 = { noinline noreturn nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
