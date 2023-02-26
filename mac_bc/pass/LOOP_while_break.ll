; ModuleID = 'mac_bc/pass/LOOP_while_break.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/LOOP_while_break.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 1, i32* %x, align 4, !dbg !17
  br label %while.cond, !dbg !18

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %x, align 4, !dbg !19
  %cmp = icmp slt i32 %0, 5, !dbg !20
  br i1 %cmp, label %while.body, label %while.end, !dbg !18

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %x, align 4, !dbg !21
  %inc = add nsw i32 %1, 1, !dbg !21
  store i32 %inc, i32* %x, align 4, !dbg !21
  %2 = load i32, i32* %x, align 4, !dbg !23
  %cmp1 = icmp eq i32 %2, 3, !dbg !25
  br i1 %cmp1, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %while.body
  br label %while.end, !dbg !27

if.end:                                           ; preds = %while.body
  br label %while.cond, !dbg !18, !llvm.loop !28

while.end:                                        ; preds = %if.then, %while.cond
  %3 = load i32, i32* %x, align 4, !dbg !31
  %cmp2 = icmp eq i32 %3, 3, !dbg !32
  call void @svf_assert(i1 noundef zeroext %cmp2), !dbg !33
  ret i32 0, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/LOOP_while_break.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 4, type: !11, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/LOOP_while_break.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 5, type: !13)
!16 = !DILocation(line: 5, column: 9, scope: !9)
!17 = !DILocation(line: 6, column: 6, scope: !9)
!18 = !DILocation(line: 7, column: 5, scope: !9)
!19 = !DILocation(line: 7, column: 11, scope: !9)
!20 = !DILocation(line: 7, column: 12, scope: !9)
!21 = !DILocation(line: 8, column: 10, scope: !22)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 7, column: 16)
!23 = !DILocation(line: 9, column: 12, scope: !24)
!24 = distinct !DILexicalBlock(scope: !22, file: !10, line: 9, column: 12)
!25 = !DILocation(line: 9, column: 13, scope: !24)
!26 = !DILocation(line: 9, column: 12, scope: !22)
!27 = !DILocation(line: 9, column: 18, scope: !24)
!28 = distinct !{!28, !18, !29, !30}
!29 = !DILocation(line: 10, column: 5, scope: !9)
!30 = !{!"llvm.loop.mustprogress"}
!31 = !DILocation(line: 11, column: 16, scope: !9)
!32 = !DILocation(line: 11, column: 18, scope: !9)
!33 = !DILocation(line: 11, column: 5, scope: !9)
!34 = !DILocation(line: 12, column: 5, scope: !9)
