; ModuleID = 'mac_bc/pass/LOOP_while_nested.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/LOOP_while_nested.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %y, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 1, i32* %x, align 4, !dbg !19
  br label %while.cond, !dbg !20

while.cond:                                       ; preds = %for.end, %entry
  %0 = load i32, i32* %x, align 4, !dbg !21
  %cmp = icmp slt i32 %0, 5, !dbg !22
  br i1 %cmp, label %while.body, label %while.end, !dbg !20

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %y, align 4, !dbg !23
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %while.body
  %1 = load i32, i32* %y, align 4, !dbg !27
  %cmp1 = icmp slt i32 %1, 3, !dbg !29
  br i1 %cmp1, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %x, align 4, !dbg !31
  %inc = add nsw i32 %2, 1, !dbg !31
  store i32 %inc, i32* %x, align 4, !dbg !31
  br label %for.inc, !dbg !32

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %y, align 4, !dbg !33
  %inc2 = add nsw i32 %3, 1, !dbg !33
  store i32 %inc2, i32* %y, align 4, !dbg !33
  br label %for.cond, !dbg !34, !llvm.loop !35

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !20, !llvm.loop !38

while.end:                                        ; preds = %while.cond
  %4 = load i32, i32* %x, align 4, !dbg !40
  %cmp3 = icmp eq i32 %4, 7, !dbg !41
  call void @svf_assert(i1 noundef zeroext %cmp3), !dbg !42
  ret i32 0, !dbg !43
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/LOOP_while_nested.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 4, type: !11, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/LOOP_while_nested.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 5, type: !13)
!16 = !DILocation(line: 5, column: 9, scope: !9)
!17 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 5, type: !13)
!18 = !DILocation(line: 5, column: 12, scope: !9)
!19 = !DILocation(line: 6, column: 6, scope: !9)
!20 = !DILocation(line: 7, column: 5, scope: !9)
!21 = !DILocation(line: 7, column: 11, scope: !9)
!22 = !DILocation(line: 7, column: 12, scope: !9)
!23 = !DILocation(line: 8, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !25, file: !10, line: 8, column: 9)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 7, column: 16)
!26 = !DILocation(line: 8, column: 14, scope: !24)
!27 = !DILocation(line: 8, column: 21, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !10, line: 8, column: 9)
!29 = !DILocation(line: 8, column: 23, scope: !28)
!30 = !DILocation(line: 8, column: 9, scope: !24)
!31 = !DILocation(line: 9, column: 14, scope: !28)
!32 = !DILocation(line: 9, column: 13, scope: !28)
!33 = !DILocation(line: 8, column: 28, scope: !28)
!34 = !DILocation(line: 8, column: 9, scope: !28)
!35 = distinct !{!35, !30, !36, !37}
!36 = !DILocation(line: 9, column: 14, scope: !24)
!37 = !{!"llvm.loop.mustprogress"}
!38 = distinct !{!38, !20, !39, !37}
!39 = !DILocation(line: 10, column: 5, scope: !9)
!40 = !DILocation(line: 11, column: 16, scope: !9)
!41 = !DILocation(line: 11, column: 18, scope: !9)
!42 = !DILocation(line: 11, column: 5, scope: !9)
!43 = !DILocation(line: 12, column: 5, scope: !9)
