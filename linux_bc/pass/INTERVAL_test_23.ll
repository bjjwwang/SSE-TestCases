; ModuleID = 'linux_bc/pass/INTERVAL_test_23.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_23.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %input = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %input, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %a, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32, i32* %input, align 4, !dbg !18
  store i32 %0, i32* %a, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %b, metadata !19, metadata !DIExpression()), !dbg !20
  %1 = load i32, i32* %b, align 4, !dbg !21
  %cmp = icmp ne i32 %1, 0, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !25
  %3 = load i32, i32* %b, align 4, !dbg !27
  %div = sdiv i32 %2, %3, !dbg !28
  %4 = load i32, i32* %b, align 4, !dbg !29
  %mul = mul nsw i32 %div, %4, !dbg !30
  %5 = load i32, i32* %a, align 4, !dbg !31
  %6 = load i32, i32* %b, align 4, !dbg !32
  %rem = srem i32 %5, %6, !dbg !33
  %add = add nsw i32 %mul, %rem, !dbg !34
  store i32 %add, i32* %a, align 4, !dbg !35
  %7 = load i32, i32* %a, align 4, !dbg !36
  %8 = load i32, i32* %input, align 4, !dbg !37
  %cmp1 = icmp eq i32 %7, %8, !dbg !38
  call void @svf_assert(i1 zeroext %cmp1), !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  %9 = load i32, i32* %retval, align 4, !dbg !41
  ret i32 %9, !dbg !41
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_23.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_23.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "input", scope: !9, file: !10, line: 6, type: !13)
!15 = !DILocation(line: 6, column: 9, scope: !9)
!16 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 7, type: !13)
!17 = !DILocation(line: 7, column: 9, scope: !9)
!18 = !DILocation(line: 7, column: 13, scope: !9)
!19 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 8, type: !13)
!20 = !DILocation(line: 8, column: 9, scope: !9)
!21 = !DILocation(line: 9, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 8)
!23 = !DILocation(line: 9, column: 10, scope: !22)
!24 = !DILocation(line: 9, column: 8, scope: !9)
!25 = !DILocation(line: 11, column: 14, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !10, line: 9, column: 16)
!27 = !DILocation(line: 11, column: 18, scope: !26)
!28 = !DILocation(line: 11, column: 16, scope: !26)
!29 = !DILocation(line: 11, column: 23, scope: !26)
!30 = !DILocation(line: 11, column: 21, scope: !26)
!31 = !DILocation(line: 11, column: 27, scope: !26)
!32 = !DILocation(line: 11, column: 31, scope: !26)
!33 = !DILocation(line: 11, column: 29, scope: !26)
!34 = !DILocation(line: 11, column: 25, scope: !26)
!35 = !DILocation(line: 11, column: 11, scope: !26)
!36 = !DILocation(line: 12, column: 20, scope: !26)
!37 = !DILocation(line: 12, column: 25, scope: !26)
!38 = !DILocation(line: 12, column: 22, scope: !26)
!39 = !DILocation(line: 12, column: 9, scope: !26)
!40 = !DILocation(line: 13, column: 5, scope: !26)
!41 = !DILocation(line: 14, column: 1, scope: !9)
