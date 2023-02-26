; ModuleID = 'mac_bc/pass/INTERVAL_test_30.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_30.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [9 x i8] c"Value:%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !15
  call void @srand(i32 noundef %call), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !17, metadata !DIExpression()), !dbg !18
  %call1 = call i32 @rand(), !dbg !19
  %rem = srem i32 %call1, 999, !dbg !20
  store i32 %rem, i32* %randomNumber, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i32, i32* %randomNumber, align 4, !dbg !23
  %call2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 noundef %0), !dbg !24
  store i32 %call2, i32* %i, align 4, !dbg !22
  %1 = load i32, i32* %i, align 4, !dbg !25
  %cmp = icmp sge i32 %1, 7, !dbg !26
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !27

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %i, align 4, !dbg !28
  %cmp3 = icmp sle i32 %2, 9, !dbg !29
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !30
  call void @svf_assert(i1 noundef zeroext %3), !dbg !31
  %4 = load i32, i32* %retval, align 4, !dbg !32
  ret i32 %4, !dbg !32
}

declare void @srand(i32 noundef) #1

declare i32 @time(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @rand() #1

declare i32 @printf(i8* noundef, ...) #1

declare void @svf_assert(i1 noundef zeroext) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_30.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_30.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocation(line: 8, column: 11, scope: !9)
!16 = !DILocation(line: 8, column: 5, scope: !9)
!17 = !DILocalVariable(name: "randomNumber", scope: !9, file: !10, line: 9, type: !13)
!18 = !DILocation(line: 9, column: 6, scope: !9)
!19 = !DILocation(line: 9, column: 21, scope: !9)
!20 = !DILocation(line: 9, column: 28, scope: !9)
!21 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 6, scope: !9)
!23 = !DILocation(line: 10, column: 29, scope: !9)
!24 = !DILocation(line: 10, column: 10, scope: !9)
!25 = !DILocation(line: 11, column: 13, scope: !9)
!26 = !DILocation(line: 11, column: 15, scope: !9)
!27 = !DILocation(line: 11, column: 20, scope: !9)
!28 = !DILocation(line: 11, column: 23, scope: !9)
!29 = !DILocation(line: 11, column: 25, scope: !9)
!30 = !DILocation(line: 0, scope: !9)
!31 = !DILocation(line: 11, column: 2, scope: !9)
!32 = !DILocation(line: 12, column: 1, scope: !9)
