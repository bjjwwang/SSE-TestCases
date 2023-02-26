; ModuleID = 'mac_bc/unpass/LOOP_while03.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/LOOP_while03.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %y, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 1, i32* %x, align 4, !dbg !19
  store i32 1, i32* %y, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %n, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 1, i32* %n, align 4, !dbg !23
  br label %while.cond, !dbg !24

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %n, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !24
  br i1 %tobool, label %while.body, label %while.end, !dbg !24

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %n, align 4, !dbg !26
  %tobool1 = icmp ne i32 %1, 0, !dbg !26
  br i1 %tobool1, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %while.body
  %2 = load i32, i32* %x, align 4, !dbg !30
  %inc = add nsw i32 %2, 1, !dbg !30
  store i32 %inc, i32* %x, align 4, !dbg !30
  %3 = load i32, i32* %y, align 4, !dbg !32
  %inc2 = add nsw i32 %3, 1, !dbg !32
  store i32 %inc2, i32* %y, align 4, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %while.body
  %4 = load i32, i32* %n, align 4, !dbg !34
  %dec = add nsw i32 %4, -1, !dbg !34
  store i32 %dec, i32* %n, align 4, !dbg !34
  br label %while.cond, !dbg !24, !llvm.loop !35

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* %x, align 4, !dbg !38
  %6 = load i32, i32* %y, align 4, !dbg !39
  %cmp = icmp eq i32 %5, %6, !dbg !40
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !41
  ret i32 0, !dbg !42
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/LOOP_while03.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/unpass/LOOP_while03.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 9, type: !13)
!16 = !DILocation(line: 9, column: 9, scope: !9)
!17 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 9, type: !13)
!18 = !DILocation(line: 9, column: 11, scope: !9)
!19 = !DILocation(line: 10, column: 6, scope: !9)
!20 = !DILocation(line: 10, column: 11, scope: !9)
!21 = !DILocalVariable(name: "n", scope: !9, file: !10, line: 11, type: !13)
!22 = !DILocation(line: 11, column: 9, scope: !9)
!23 = !DILocation(line: 12, column: 7, scope: !9)
!24 = !DILocation(line: 13, column: 5, scope: !9)
!25 = !DILocation(line: 13, column: 11, scope: !9)
!26 = !DILocation(line: 14, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !10, line: 14, column: 13)
!28 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 14)
!29 = !DILocation(line: 14, column: 13, scope: !28)
!30 = !DILocation(line: 15, column: 14, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !10, line: 14, column: 16)
!32 = !DILocation(line: 16, column: 14, scope: !31)
!33 = !DILocation(line: 17, column: 9, scope: !31)
!34 = !DILocation(line: 18, column: 10, scope: !28)
!35 = distinct !{!35, !24, !36, !37}
!36 = !DILocation(line: 19, column: 5, scope: !9)
!37 = !{!"llvm.loop.mustprogress"}
!38 = !DILocation(line: 20, column: 16, scope: !9)
!39 = !DILocation(line: 20, column: 21, scope: !9)
!40 = !DILocation(line: 20, column: 18, scope: !9)
!41 = !DILocation(line: 20, column: 5, scope: !9)
!42 = !DILocation(line: 21, column: 5, scope: !9)
