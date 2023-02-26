; ModuleID = 'mac_bc/pass/INTERVAL_test_48.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_48.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %a, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %b, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %b, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %c, metadata !19, metadata !DIExpression()), !dbg !20
  br label %LOOP, !dbg !21

LOOP:                                             ; preds = %if.then, %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  %0 = load i32, i32* %a, align 4, !dbg !24
  %1 = load i32, i32* %c, align 4, !dbg !26
  %cmp = icmp slt i32 %0, %1, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %LOOP
  %2 = load i32, i32* %a, align 4, !dbg !29
  %inc = add nsw i32 %2, 1, !dbg !29
  store i32 %inc, i32* %a, align 4, !dbg !29
  %3 = load i32, i32* %b, align 4, !dbg !31
  %add = add nsw i32 %3, 2, !dbg !32
  store i32 %add, i32* %b, align 4, !dbg !33
  br label %LOOP, !dbg !34

if.end:                                           ; preds = %LOOP
  %4 = load i32, i32* %a, align 4, !dbg !35
  %5 = load i32, i32* %c, align 4, !dbg !36
  %cmp1 = icmp eq i32 %4, %5, !dbg !37
  call void @svf_assert(i1 noundef zeroext %cmp1), !dbg !38
  %6 = load i32, i32* %b, align 4, !dbg !39
  %7 = load i32, i32* %a, align 4, !dbg !40
  %mul = mul nsw i32 %7, 2, !dbg !41
  %cmp2 = icmp eq i32 %6, %mul, !dbg !42
  call void @svf_assert(i1 noundef zeroext %cmp2), !dbg !43
  %8 = load i32, i32* %retval, align 4, !dbg !44
  ret i32 %8, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_48.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_48.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !13)
!16 = !DILocation(line: 9, column: 6, scope: !9)
!17 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 10, type: !13)
!18 = !DILocation(line: 10, column: 9, scope: !9)
!19 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 11, type: !13)
!20 = !DILocation(line: 11, column: 9, scope: !9)
!21 = !DILocation(line: 11, column: 5, scope: !9)
!22 = !DILabel(scope: !9, name: "LOOP", file: !10, line: 12)
!23 = !DILocation(line: 12, column: 5, scope: !9)
!24 = !DILocation(line: 13, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 8)
!26 = !DILocation(line: 13, column: 12, scope: !25)
!27 = !DILocation(line: 13, column: 10, scope: !25)
!28 = !DILocation(line: 13, column: 8, scope: !9)
!29 = !DILocation(line: 14, column: 10, scope: !30)
!30 = distinct !DILexicalBlock(scope: !25, file: !10, line: 13, column: 15)
!31 = !DILocation(line: 15, column: 13, scope: !30)
!32 = !DILocation(line: 15, column: 15, scope: !30)
!33 = !DILocation(line: 15, column: 11, scope: !30)
!34 = !DILocation(line: 16, column: 9, scope: !30)
!35 = !DILocation(line: 18, column: 16, scope: !9)
!36 = !DILocation(line: 18, column: 21, scope: !9)
!37 = !DILocation(line: 18, column: 18, scope: !9)
!38 = !DILocation(line: 18, column: 5, scope: !9)
!39 = !DILocation(line: 19, column: 16, scope: !9)
!40 = !DILocation(line: 19, column: 21, scope: !9)
!41 = !DILocation(line: 19, column: 23, scope: !9)
!42 = !DILocation(line: 19, column: 18, scope: !9)
!43 = !DILocation(line: 19, column: 5, scope: !9)
!44 = !DILocation(line: 20, column: 1, scope: !9)
