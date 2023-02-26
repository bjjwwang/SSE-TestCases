; ModuleID = 'mac_bc/pass/BASIC_test_11.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_test_11.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %data = alloca i32, align 4
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %data, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !17, metadata !DIExpression()), !dbg !19
  store i32 1, i32* %data1, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !20, metadata !DIExpression()), !dbg !22
  store i32 2, i32* %data2, align 4, !dbg !22
  %0 = load i32, i32* %data1, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 1, !dbg !24
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !25
  ret i32 0, !dbg !26
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_test_11.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 6, type: !11, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_test_11.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 7, type: !13)
!16 = !DILocation(line: 7, column: 9, scope: !9)
!17 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 9, type: !13)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 8, column: 5)
!19 = !DILocation(line: 9, column: 13, scope: !18)
!20 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 11, type: !13)
!21 = distinct !DILexicalBlock(scope: !18, file: !10, line: 10, column: 9)
!22 = !DILocation(line: 11, column: 17, scope: !21)
!23 = !DILocation(line: 13, column: 20, scope: !18)
!24 = !DILocation(line: 13, column: 25, scope: !18)
!25 = !DILocation(line: 13, column: 9, scope: !18)
!26 = !DILocation(line: 15, column: 2, scope: !9)
