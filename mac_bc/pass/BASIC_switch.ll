; ModuleID = 'mac_bc/pass/BASIC_switch.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_switch.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %cond = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %y, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 1, i32* %x, align 4, !dbg !19
  store i32 0, i32* %y, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i8* %cond, metadata !21, metadata !DIExpression()), !dbg !23
  store i8 97, i8* %cond, align 1, !dbg !23
  %0 = load i8, i8* %cond, align 1, !dbg !24
  %conv = sext i8 %0 to i32, !dbg !24
  switch i32 %conv, label %sw.default [
    i32 97, label %sw.bb
    i32 25186, label %sw.bb1
    i32 99, label %sw.bb3
  ], !dbg !25

sw.bb:                                            ; preds = %entry
  %1 = load i32, i32* %x, align 4, !dbg !26
  %add = add nsw i32 %1, 1, !dbg !26
  store i32 %add, i32* %x, align 4, !dbg !26
  br label %sw.epilog, !dbg !28

sw.bb1:                                           ; preds = %entry
  %2 = load i32, i32* %y, align 4, !dbg !29
  %3 = load i32, i32* %x, align 4, !dbg !30
  %add2 = add nsw i32 %3, %2, !dbg !30
  store i32 %add2, i32* %x, align 4, !dbg !30
  br label %sw.bb3, !dbg !31

sw.bb3:                                           ; preds = %sw.bb1, %entry
  %4 = load i32, i32* %y, align 4, !dbg !32
  %5 = load i32, i32* %x, align 4, !dbg !33
  %sub = sub nsw i32 %5, %4, !dbg !33
  store i32 %sub, i32* %x, align 4, !dbg !33
  br label %sw.default, !dbg !34

sw.default:                                       ; preds = %sw.bb3, %entry
  %6 = load i32, i32* %x, align 4, !dbg !35
  %inc = add nsw i32 %6, 1, !dbg !35
  store i32 %inc, i32* %x, align 4, !dbg !35
  %7 = load i32, i32* %y, align 4, !dbg !36
  %inc4 = add nsw i32 %7, 1, !dbg !36
  store i32 %inc4, i32* %y, align 4, !dbg !36
  br label %sw.epilog, !dbg !37

sw.epilog:                                        ; preds = %sw.default, %sw.bb
  %8 = load i32, i32* %x, align 4, !dbg !38
  %9 = load i32, i32* %y, align 4, !dbg !39
  %cmp = icmp sge i32 %8, %9, !dbg !40
  %conv5 = zext i1 %cmp to i32, !dbg !40
  %call = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 noundef %conv5), !dbg !41
  ret i32 0, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @svf_assert(...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_switch.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 6, type: !11, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_switch.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 7, type: !13)
!16 = !DILocation(line: 7, column: 9, scope: !9)
!17 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 7, type: !13)
!18 = !DILocation(line: 7, column: 12, scope: !9)
!19 = !DILocation(line: 8, column: 7, scope: !9)
!20 = !DILocation(line: 9, column: 7, scope: !9)
!21 = !DILocalVariable(name: "cond", scope: !9, file: !10, line: 10, type: !22)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !DILocation(line: 10, column: 10, scope: !9)
!24 = !DILocation(line: 11, column: 13, scope: !9)
!25 = !DILocation(line: 11, column: 5, scope: !9)
!26 = !DILocation(line: 14, column: 15, scope: !27)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 5)
!28 = !DILocation(line: 15, column: 13, scope: !27)
!29 = !DILocation(line: 17, column: 18, scope: !27)
!30 = !DILocation(line: 17, column: 15, scope: !27)
!31 = !DILocation(line: 17, column: 13, scope: !27)
!32 = !DILocation(line: 19, column: 18, scope: !27)
!33 = !DILocation(line: 19, column: 15, scope: !27)
!34 = !DILocation(line: 19, column: 13, scope: !27)
!35 = !DILocation(line: 21, column: 14, scope: !27)
!36 = !DILocation(line: 22, column: 14, scope: !27)
!37 = !DILocation(line: 23, column: 13, scope: !27)
!38 = !DILocation(line: 25, column: 16, scope: !9)
!39 = !DILocation(line: 25, column: 21, scope: !9)
!40 = !DILocation(line: 25, column: 18, scope: !9)
!41 = !DILocation(line: 25, column: 5, scope: !9)
!42 = !DILocation(line: 26, column: 5, scope: !9)
