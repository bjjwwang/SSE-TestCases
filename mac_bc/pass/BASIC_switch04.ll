; ModuleID = 'mac_bc/pass/BASIC_switch04.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_switch04.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @nd() #0 !dbg !9 {
entry:
  ret i32 1, !dbg !15
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !16 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %y, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 1, i32* %x, align 4, !dbg !21
  store i32 0, i32* %y, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  store i32 1, i32* %i, align 4, !dbg !25
  %0 = load i32, i32* %x, align 4, !dbg !26
  switch i32 %0, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb3
  ], !dbg !27

sw.bb:                                            ; preds = %entry
  %1 = load i32, i32* %x, align 4, !dbg !28
  %add = add nsw i32 %1, 1, !dbg !28
  store i32 %add, i32* %x, align 4, !dbg !28
  br label %sw.epilog, !dbg !30

sw.bb1:                                           ; preds = %entry
  %2 = load i32, i32* %y, align 4, !dbg !31
  %3 = load i32, i32* %x, align 4, !dbg !32
  %add2 = add nsw i32 %3, %2, !dbg !32
  store i32 %add2, i32* %x, align 4, !dbg !32
  br label %sw.epilog, !dbg !33

sw.bb3:                                           ; preds = %entry
  %4 = load i32, i32* %y, align 4, !dbg !34
  %5 = load i32, i32* %x, align 4, !dbg !35
  %sub = sub nsw i32 %5, %4, !dbg !35
  store i32 %sub, i32* %x, align 4, !dbg !35
  br label %sw.epilog, !dbg !36

sw.default:                                       ; preds = %entry
  %6 = load i32, i32* %x, align 4, !dbg !37
  %inc = add nsw i32 %6, 1, !dbg !37
  store i32 %inc, i32* %x, align 4, !dbg !37
  %7 = load i32, i32* %y, align 4, !dbg !38
  %inc4 = add nsw i32 %7, 1, !dbg !38
  store i32 %inc4, i32* %y, align 4, !dbg !38
  br label %sw.epilog, !dbg !39

sw.epilog:                                        ; preds = %sw.default, %sw.bb3, %sw.bb1, %sw.bb
  %8 = load i32, i32* %x, align 4, !dbg !40
  %9 = load i32, i32* %y, align 4, !dbg !41
  %cmp = icmp sge i32 %8, %9, !dbg !42
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !43
  ret i32 0, !dbg !44
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_switch04.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "nd", scope: !10, file: !10, line: 4, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_switch04.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocation(line: 6, column: 5, scope: !9)
!16 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!17 = !DILocalVariable(name: "x", scope: !16, file: !10, line: 10, type: !13)
!18 = !DILocation(line: 10, column: 7, scope: !16)
!19 = !DILocalVariable(name: "y", scope: !16, file: !10, line: 10, type: !13)
!20 = !DILocation(line: 10, column: 10, scope: !16)
!21 = !DILocation(line: 11, column: 5, scope: !16)
!22 = !DILocation(line: 12, column: 5, scope: !16)
!23 = !DILocalVariable(name: "i", scope: !16, file: !10, line: 13, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!25 = !DILocation(line: 13, column: 13, scope: !16)
!26 = !DILocation(line: 14, column: 11, scope: !16)
!27 = !DILocation(line: 14, column: 3, scope: !16)
!28 = !DILocation(line: 17, column: 11, scope: !29)
!29 = distinct !DILexicalBlock(scope: !16, file: !10, line: 15, column: 3)
!30 = !DILocation(line: 18, column: 9, scope: !29)
!31 = !DILocation(line: 20, column: 14, scope: !29)
!32 = !DILocation(line: 20, column: 11, scope: !29)
!33 = !DILocation(line: 21, column: 9, scope: !29)
!34 = !DILocation(line: 23, column: 14, scope: !29)
!35 = !DILocation(line: 23, column: 11, scope: !29)
!36 = !DILocation(line: 24, column: 9, scope: !29)
!37 = !DILocation(line: 26, column: 10, scope: !29)
!38 = !DILocation(line: 27, column: 10, scope: !29)
!39 = !DILocation(line: 28, column: 9, scope: !29)
!40 = !DILocation(line: 30, column: 16, scope: !16)
!41 = !DILocation(line: 30, column: 21, scope: !16)
!42 = !DILocation(line: 30, column: 18, scope: !16)
!43 = !DILocation(line: 30, column: 5, scope: !16)
!44 = !DILocation(line: 31, column: 5, scope: !16)
