; ModuleID = 'linux_bc/pass/INTERVAL_test_22.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_22.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %b, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32, i32* %a, align 4, !dbg !18
  store i32 %0, i32* %b, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %i, align 4, !dbg !21
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !23
  %cmp = icmp slt i32 %1, 3, !dbg !25
  br i1 %cmp, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %b, align 4, !dbg !27
  %3 = load i32, i32* %a, align 4, !dbg !29
  %mul = mul nsw i32 %2, %3, !dbg !30
  store i32 %mul, i32* %b, align 4, !dbg !31
  br label %for.inc, !dbg !32

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !33
  %inc = add nsw i32 %4, 1, !dbg !33
  store i32 %inc, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !34, !llvm.loop !35

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %b, align 4, !dbg !38
  %cmp1 = icmp sge i32 %5, 0, !dbg !39
  call void @svf_assert(i1 zeroext %cmp1), !dbg !40
  %6 = load i32, i32* %retval, align 4, !dbg !41
  ret i32 %6, !dbg !41
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_22.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_22.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 6, type: !13)
!15 = !DILocation(line: 6, column: 9, scope: !9)
!16 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 7, type: !13)
!17 = !DILocation(line: 7, column: 9, scope: !9)
!18 = !DILocation(line: 7, column: 13, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !20, file: !10, line: 8, type: !13)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 8, column: 5)
!21 = !DILocation(line: 8, column: 13, scope: !20)
!22 = !DILocation(line: 8, column: 9, scope: !20)
!23 = !DILocation(line: 8, column: 20, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !10, line: 8, column: 5)
!25 = !DILocation(line: 8, column: 22, scope: !24)
!26 = !DILocation(line: 8, column: 5, scope: !20)
!27 = !DILocation(line: 9, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !10, line: 8, column: 32)
!29 = !DILocation(line: 9, column: 17, scope: !28)
!30 = !DILocation(line: 9, column: 15, scope: !28)
!31 = !DILocation(line: 9, column: 11, scope: !28)
!32 = !DILocation(line: 10, column: 5, scope: !28)
!33 = !DILocation(line: 8, column: 28, scope: !24)
!34 = !DILocation(line: 8, column: 5, scope: !24)
!35 = distinct !{!35, !26, !36, !37}
!36 = !DILocation(line: 10, column: 5, scope: !20)
!37 = !{!"llvm.loop.mustprogress"}
!38 = !DILocation(line: 11, column: 16, scope: !9)
!39 = !DILocation(line: 11, column: 18, scope: !9)
!40 = !DILocation(line: 11, column: 5, scope: !9)
!41 = !DILocation(line: 12, column: 1, scope: !9)
