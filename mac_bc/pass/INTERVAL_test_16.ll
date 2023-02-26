; ModuleID = 'mac_bc/pass/INTERVAL_test_16.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_16.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @foo(i32* noundef %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32*, align 8
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32*, i32** %i.addr, align 8, !dbg !18
  %1 = load i32, i32* %0, align 4, !dbg !19
  %add = add nsw i32 %1, 1, !dbg !20
  %2 = load i32*, i32** %i.addr, align 8, !dbg !21
  store i32 %add, i32* %2, align 4, !dbg !22
  %3 = load i32*, i32** %i.addr, align 8, !dbg !23
  %4 = load i32, i32* %3, align 4, !dbg !25
  %cmp = icmp slt i32 %4, 10, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %i.addr, align 8, !dbg !28
  call void @foo(i32* noundef %5), !dbg !30
  br label %if.end, !dbg !31

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !33 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !36, metadata !DIExpression()), !dbg !37
  call void @foo(i32* noundef %i), !dbg !38
  %0 = load i32, i32* %i, align 4, !dbg !39
  %cmp = icmp sge i32 %0, 10, !dbg !40
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !41
  ret i32 0, !dbg !42
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_16.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_16.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 5, type: !13)
!17 = !DILocation(line: 5, column: 15, scope: !9)
!18 = !DILocation(line: 6, column: 11, scope: !9)
!19 = !DILocation(line: 6, column: 10, scope: !9)
!20 = !DILocation(line: 6, column: 13, scope: !9)
!21 = !DILocation(line: 6, column: 6, scope: !9)
!22 = !DILocation(line: 6, column: 8, scope: !9)
!23 = !DILocation(line: 7, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 7, column: 8)
!25 = !DILocation(line: 7, column: 8, scope: !24)
!26 = !DILocation(line: 7, column: 11, scope: !24)
!27 = !DILocation(line: 7, column: 8, scope: !9)
!28 = !DILocation(line: 8, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !10, line: 7, column: 17)
!30 = !DILocation(line: 8, column: 9, scope: !29)
!31 = !DILocation(line: 9, column: 5, scope: !29)
!32 = !DILocation(line: 10, column: 1, scope: !9)
!33 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !34, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!34 = !DISubroutineType(types: !35)
!35 = !{!14}
!36 = !DILocalVariable(name: "i", scope: !33, file: !10, line: 13, type: !14)
!37 = !DILocation(line: 13, column: 9, scope: !33)
!38 = !DILocation(line: 14, column: 5, scope: !33)
!39 = !DILocation(line: 15, column: 16, scope: !33)
!40 = !DILocation(line: 15, column: 18, scope: !33)
!41 = !DILocation(line: 15, column: 5, scope: !33)
!42 = !DILocation(line: 16, column: 1, scope: !33)
