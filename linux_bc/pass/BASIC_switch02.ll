; ModuleID = 'linux_bc/pass/BASIC_switch02.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_switch02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %cond = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %y, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 1, i32* %x, align 4, !dbg !18
  store i32 0, i32* %y, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i8* %cond, metadata !20, metadata !DIExpression()), !dbg !22
  store i8 97, i8* %cond, align 1, !dbg !22
  %0 = load i8, i8* %cond, align 1, !dbg !23
  %conv = sext i8 %0 to i32, !dbg !23
  switch i32 %conv, label %sw.default [
    i32 97, label %sw.bb
    i32 25186, label %sw.bb1
    i32 99, label %sw.bb3
  ], !dbg !24

sw.bb:                                            ; preds = %entry
  %1 = load i32, i32* %x, align 4, !dbg !25
  %add = add nsw i32 %1, 1, !dbg !25
  store i32 %add, i32* %x, align 4, !dbg !25
  br label %sw.epilog, !dbg !27

sw.bb1:                                           ; preds = %entry
  %2 = load i32, i32* %y, align 4, !dbg !28
  %3 = load i32, i32* %x, align 4, !dbg !29
  %add2 = add nsw i32 %3, %2, !dbg !29
  store i32 %add2, i32* %x, align 4, !dbg !29
  br label %sw.bb3, !dbg !30

sw.bb3:                                           ; preds = %sw.bb1, %entry
  %4 = load i32, i32* %y, align 4, !dbg !31
  %5 = load i32, i32* %x, align 4, !dbg !32
  %sub = sub nsw i32 %5, %4, !dbg !32
  store i32 %sub, i32* %x, align 4, !dbg !32
  br label %sw.default, !dbg !33

sw.default:                                       ; preds = %sw.bb3, %entry
  %6 = load i32, i32* %x, align 4, !dbg !34
  %inc = add nsw i32 %6, 1, !dbg !34
  store i32 %inc, i32* %x, align 4, !dbg !34
  %7 = load i32, i32* %y, align 4, !dbg !35
  %inc4 = add nsw i32 %7, 1, !dbg !35
  store i32 %inc4, i32* %y, align 4, !dbg !35
  br label %sw.epilog, !dbg !36

sw.epilog:                                        ; preds = %sw.default, %sw.bb
  %8 = load i32, i32* %x, align 4, !dbg !37
  %9 = load i32, i32* %y, align 4, !dbg !38
  %cmp = icmp sge i32 %8, %9, !dbg !39
  call void @svf_assert(i1 zeroext %cmp), !dbg !40
  ret i32 0, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_switch02.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 6, type: !11, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_switch02.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 7, type: !13)
!15 = !DILocation(line: 7, column: 9, scope: !9)
!16 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 7, type: !13)
!17 = !DILocation(line: 7, column: 12, scope: !9)
!18 = !DILocation(line: 8, column: 7, scope: !9)
!19 = !DILocation(line: 9, column: 7, scope: !9)
!20 = !DILocalVariable(name: "cond", scope: !9, file: !10, line: 10, type: !21)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 10, column: 10, scope: !9)
!23 = !DILocation(line: 11, column: 13, scope: !9)
!24 = !DILocation(line: 11, column: 5, scope: !9)
!25 = !DILocation(line: 14, column: 15, scope: !26)
!26 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 5)
!27 = !DILocation(line: 15, column: 13, scope: !26)
!28 = !DILocation(line: 17, column: 18, scope: !26)
!29 = !DILocation(line: 17, column: 15, scope: !26)
!30 = !DILocation(line: 17, column: 13, scope: !26)
!31 = !DILocation(line: 19, column: 18, scope: !26)
!32 = !DILocation(line: 19, column: 15, scope: !26)
!33 = !DILocation(line: 19, column: 13, scope: !26)
!34 = !DILocation(line: 21, column: 14, scope: !26)
!35 = !DILocation(line: 22, column: 14, scope: !26)
!36 = !DILocation(line: 23, column: 13, scope: !26)
!37 = !DILocation(line: 25, column: 16, scope: !9)
!38 = !DILocation(line: 25, column: 21, scope: !9)
!39 = !DILocation(line: 25, column: 18, scope: !9)
!40 = !DILocation(line: 25, column: 5, scope: !9)
!41 = !DILocation(line: 26, column: 5, scope: !9)
