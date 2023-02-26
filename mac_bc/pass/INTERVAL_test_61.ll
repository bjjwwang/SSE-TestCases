; ModuleID = 'mac_bc/pass/INTERVAL_test_61.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_61.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !15, metadata !DIExpression()), !dbg !16
  br label %while.body, !dbg !17

while.body:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %a, align 4, !dbg !18
  %tobool = icmp ne i32 %0, 0, !dbg !18
  br i1 %tobool, label %if.then, label %if.else, !dbg !21

if.then:                                          ; preds = %while.body
  %1 = load i32, i32* %a, align 4, !dbg !22
  %cmp = icmp ne i32 %1, 0, !dbg !24
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !25
  call void @exit(i32 noundef 0) #4, !dbg !26
  unreachable, !dbg !26

if.else:                                          ; preds = %while.body
  %2 = load i32, i32* %a, align 4, !dbg !27
  %cmp1 = icmp sgt i32 %2, 0, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !31

if.then2:                                         ; preds = %if.else
  %3 = load i32, i32* %a, align 4, !dbg !32
  %dec = add nsw i32 %3, -1, !dbg !32
  store i32 %dec, i32* %a, align 4, !dbg !32
  br label %if.end, !dbg !34

if.else3:                                         ; preds = %if.else
  %4 = load i32, i32* %a, align 4, !dbg !35
  %inc = add nsw i32 %4, 1, !dbg !35
  store i32 %inc, i32* %a, align 4, !dbg !35
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %while.body, !dbg !37, !llvm.loop !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_61.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_61.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!16 = !DILocation(line: 10, column: 6, scope: !9)
!17 = !DILocation(line: 11, column: 2, scope: !9)
!18 = !DILocation(line: 12, column: 6, scope: !19)
!19 = distinct !DILexicalBlock(scope: !20, file: !10, line: 12, column: 6)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 14)
!21 = !DILocation(line: 12, column: 6, scope: !20)
!22 = !DILocation(line: 13, column: 15, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !10, line: 12, column: 9)
!24 = !DILocation(line: 13, column: 17, scope: !23)
!25 = !DILocation(line: 13, column: 4, scope: !23)
!26 = !DILocation(line: 14, column: 4, scope: !23)
!27 = !DILocation(line: 17, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !10, line: 17, column: 7)
!29 = distinct !DILexicalBlock(scope: !19, file: !10, line: 16, column: 8)
!30 = !DILocation(line: 17, column: 9, scope: !28)
!31 = !DILocation(line: 17, column: 7, scope: !29)
!32 = !DILocation(line: 18, column: 6, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !10, line: 17, column: 14)
!34 = !DILocation(line: 19, column: 4, scope: !33)
!35 = !DILocation(line: 21, column: 6, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !10, line: 20, column: 9)
!37 = !DILocation(line: 23, column: 4, scope: !29)
!38 = distinct !{!38, !17, !39}
!39 = !DILocation(line: 25, column: 2, scope: !9)
