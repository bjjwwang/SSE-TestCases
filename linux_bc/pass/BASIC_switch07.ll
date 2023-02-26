; ModuleID = 'linux_bc/pass/BASIC_switch07.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_switch07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @nd() #0 !dbg !9 {
entry:
  ret i32 1, !dbg !14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !15 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %y, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 1, i32* %x, align 4, !dbg !20
  store i32 0, i32* %y, align 4, !dbg !21
  %call = call i32 @nd(), !dbg !22
  switch i32 %call, label %sw.default [
    i32 1, label %sw.bb
    i32 0, label %sw.bb1
    i32 2, label %sw.bb3
  ], !dbg !23

sw.bb:                                            ; preds = %entry
  %0 = load i32, i32* %x, align 4, !dbg !24
  %add = add nsw i32 %0, 1, !dbg !24
  store i32 %add, i32* %x, align 4, !dbg !24
  br label %sw.epilog, !dbg !26

sw.bb1:                                           ; preds = %entry
  %1 = load i32, i32* %y, align 4, !dbg !27
  %2 = load i32, i32* %x, align 4, !dbg !28
  %add2 = add nsw i32 %2, %1, !dbg !28
  store i32 %add2, i32* %x, align 4, !dbg !28
  br label %sw.epilog, !dbg !29

sw.bb3:                                           ; preds = %entry
  %3 = load i32, i32* %y, align 4, !dbg !30
  %4 = load i32, i32* %x, align 4, !dbg !31
  %sub = sub nsw i32 %4, %3, !dbg !31
  store i32 %sub, i32* %x, align 4, !dbg !31
  br label %sw.epilog, !dbg !32

sw.default:                                       ; preds = %entry
  %5 = load i32, i32* %x, align 4, !dbg !33
  %inc = add nsw i32 %5, 1, !dbg !33
  store i32 %inc, i32* %x, align 4, !dbg !33
  %6 = load i32, i32* %y, align 4, !dbg !34
  %inc4 = add nsw i32 %6, 1, !dbg !34
  store i32 %inc4, i32* %y, align 4, !dbg !34
  br label %sw.epilog, !dbg !35

sw.epilog:                                        ; preds = %sw.default, %sw.bb3, %sw.bb1, %sw.bb
  %7 = load i32, i32* %x, align 4, !dbg !36
  %8 = load i32, i32* %y, align 4, !dbg !37
  %cmp = icmp sge i32 %7, %8, !dbg !38
  call void @svf_assert(i1 zeroext %cmp), !dbg !39
  ret i32 0, !dbg !40
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_switch07.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "nd", scope: !10, file: !10, line: 4, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_switch07.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocation(line: 6, column: 5, scope: !9)
!15 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DILocalVariable(name: "x", scope: !15, file: !10, line: 10, type: !13)
!17 = !DILocation(line: 10, column: 9, scope: !15)
!18 = !DILocalVariable(name: "y", scope: !15, file: !10, line: 10, type: !13)
!19 = !DILocation(line: 10, column: 12, scope: !15)
!20 = !DILocation(line: 11, column: 7, scope: !15)
!21 = !DILocation(line: 12, column: 7, scope: !15)
!22 = !DILocation(line: 13, column: 13, scope: !15)
!23 = !DILocation(line: 13, column: 5, scope: !15)
!24 = !DILocation(line: 16, column: 15, scope: !25)
!25 = distinct !DILexicalBlock(scope: !15, file: !10, line: 14, column: 5)
!26 = !DILocation(line: 17, column: 13, scope: !25)
!27 = !DILocation(line: 19, column: 18, scope: !25)
!28 = !DILocation(line: 19, column: 15, scope: !25)
!29 = !DILocation(line: 20, column: 13, scope: !25)
!30 = !DILocation(line: 22, column: 18, scope: !25)
!31 = !DILocation(line: 22, column: 15, scope: !25)
!32 = !DILocation(line: 23, column: 13, scope: !25)
!33 = !DILocation(line: 25, column: 14, scope: !25)
!34 = !DILocation(line: 26, column: 14, scope: !25)
!35 = !DILocation(line: 27, column: 13, scope: !25)
!36 = !DILocation(line: 29, column: 16, scope: !15)
!37 = !DILocation(line: 29, column: 21, scope: !15)
!38 = !DILocation(line: 29, column: 18, scope: !15)
!39 = !DILocation(line: 29, column: 5, scope: !15)
!40 = !DILocation(line: 30, column: 5, scope: !15)
