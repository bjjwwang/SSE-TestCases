; ModuleID = 'linux_bc/pass/INTERVAL_test_30.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_30.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"Value:%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !14
  call void @srand(i32 %call) #4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !16, metadata !DIExpression()), !dbg !17
  %call1 = call i32 @rand() #4, !dbg !18
  %rem = srem i32 %call1, 999, !dbg !19
  store i32 %rem, i32* %randomNumber, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32, i32* %randomNumber, align 4, !dbg !22
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !23
  store i32 %call2, i32* %i, align 4, !dbg !21
  %1 = load i32, i32* %i, align 4, !dbg !24
  %cmp = icmp sge i32 %1, 7, !dbg !25
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !26

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %i, align 4, !dbg !27
  %cmp3 = icmp sle i32 %2, 9, !dbg !28
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !29
  call void @svf_assert(i1 zeroext %3), !dbg !30
  %4 = load i32, i32* %retval, align 4, !dbg !31
  ret i32 %4, !dbg !31
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #1

declare dso_local i32 @time(...) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #1

declare dso_local i32 @printf(i8*, ...) #2

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_30.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_30.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocation(line: 8, column: 11, scope: !9)
!15 = !DILocation(line: 8, column: 5, scope: !9)
!16 = !DILocalVariable(name: "randomNumber", scope: !9, file: !10, line: 9, type: !13)
!17 = !DILocation(line: 9, column: 6, scope: !9)
!18 = !DILocation(line: 9, column: 21, scope: !9)
!19 = !DILocation(line: 9, column: 28, scope: !9)
!20 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 10, type: !13)
!21 = !DILocation(line: 10, column: 6, scope: !9)
!22 = !DILocation(line: 10, column: 29, scope: !9)
!23 = !DILocation(line: 10, column: 10, scope: !9)
!24 = !DILocation(line: 11, column: 13, scope: !9)
!25 = !DILocation(line: 11, column: 15, scope: !9)
!26 = !DILocation(line: 11, column: 20, scope: !9)
!27 = !DILocation(line: 11, column: 23, scope: !9)
!28 = !DILocation(line: 11, column: 25, scope: !9)
!29 = !DILocation(line: 0, scope: !9)
!30 = !DILocation(line: 11, column: 2, scope: !9)
!31 = !DILocation(line: 12, column: 1, scope: !9)
