; ModuleID = 'mac_bc/pass/INTERVAL_test_23.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_23.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %input = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %input, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %a, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %input, align 4, !dbg !19
  store i32 %0, i32* %a, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %b, metadata !20, metadata !DIExpression()), !dbg !21
  %1 = load i32, i32* %b, align 4, !dbg !22
  %cmp = icmp ne i32 %1, 0, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !26
  %3 = load i32, i32* %b, align 4, !dbg !28
  %div = sdiv i32 %2, %3, !dbg !29
  %4 = load i32, i32* %b, align 4, !dbg !30
  %mul = mul nsw i32 %div, %4, !dbg !31
  %5 = load i32, i32* %a, align 4, !dbg !32
  %6 = load i32, i32* %b, align 4, !dbg !33
  %rem = srem i32 %5, %6, !dbg !34
  %add = add nsw i32 %mul, %rem, !dbg !35
  store i32 %add, i32* %a, align 4, !dbg !36
  %7 = load i32, i32* %a, align 4, !dbg !37
  %8 = load i32, i32* %input, align 4, !dbg !38
  %cmp1 = icmp eq i32 %7, %8, !dbg !39
  call void @svf_assert(i1 noundef zeroext %cmp1), !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  %9 = load i32, i32* %retval, align 4, !dbg !42
  ret i32 %9, !dbg !42
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_23.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_23.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "input", scope: !9, file: !10, line: 6, type: !13)
!16 = !DILocation(line: 6, column: 9, scope: !9)
!17 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 7, type: !13)
!18 = !DILocation(line: 7, column: 9, scope: !9)
!19 = !DILocation(line: 7, column: 13, scope: !9)
!20 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 8, type: !13)
!21 = !DILocation(line: 8, column: 9, scope: !9)
!22 = !DILocation(line: 9, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 8)
!24 = !DILocation(line: 9, column: 10, scope: !23)
!25 = !DILocation(line: 9, column: 8, scope: !9)
!26 = !DILocation(line: 11, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !10, line: 9, column: 16)
!28 = !DILocation(line: 11, column: 18, scope: !27)
!29 = !DILocation(line: 11, column: 16, scope: !27)
!30 = !DILocation(line: 11, column: 23, scope: !27)
!31 = !DILocation(line: 11, column: 21, scope: !27)
!32 = !DILocation(line: 11, column: 27, scope: !27)
!33 = !DILocation(line: 11, column: 31, scope: !27)
!34 = !DILocation(line: 11, column: 29, scope: !27)
!35 = !DILocation(line: 11, column: 25, scope: !27)
!36 = !DILocation(line: 11, column: 11, scope: !27)
!37 = !DILocation(line: 12, column: 20, scope: !27)
!38 = !DILocation(line: 12, column: 25, scope: !27)
!39 = !DILocation(line: 12, column: 22, scope: !27)
!40 = !DILocation(line: 12, column: 9, scope: !27)
!41 = !DILocation(line: 13, column: 5, scope: !27)
!42 = !DILocation(line: 14, column: 1, scope: !9)
