; ModuleID = 'linux_bc/pass/INTERVAL_test_48.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_48.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %a, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %b, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %b, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %c, metadata !18, metadata !DIExpression()), !dbg !19
  br label %LOOP, !dbg !20

LOOP:                                             ; preds = %if.then, %entry
  call void @llvm.dbg.label(metadata !21), !dbg !22
  %0 = load i32, i32* %a, align 4, !dbg !23
  %1 = load i32, i32* %c, align 4, !dbg !25
  %cmp = icmp slt i32 %0, %1, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %LOOP
  %2 = load i32, i32* %a, align 4, !dbg !28
  %inc = add nsw i32 %2, 1, !dbg !28
  store i32 %inc, i32* %a, align 4, !dbg !28
  %3 = load i32, i32* %b, align 4, !dbg !30
  %add = add nsw i32 %3, 2, !dbg !31
  store i32 %add, i32* %b, align 4, !dbg !32
  br label %LOOP, !dbg !33

if.end:                                           ; preds = %LOOP
  %4 = load i32, i32* %a, align 4, !dbg !34
  %5 = load i32, i32* %c, align 4, !dbg !35
  %cmp1 = icmp eq i32 %4, %5, !dbg !36
  call void @svf_assert(i1 zeroext %cmp1), !dbg !37
  %6 = load i32, i32* %b, align 4, !dbg !38
  %7 = load i32, i32* %a, align 4, !dbg !39
  %mul = mul nsw i32 %7, 2, !dbg !40
  %cmp2 = icmp eq i32 %6, %mul, !dbg !41
  call void @svf_assert(i1 zeroext %cmp2), !dbg !42
  %8 = load i32, i32* %retval, align 4, !dbg !43
  ret i32 %8, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_48.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_48.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !13)
!15 = !DILocation(line: 9, column: 6, scope: !9)
!16 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 10, type: !13)
!17 = !DILocation(line: 10, column: 9, scope: !9)
!18 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 11, type: !13)
!19 = !DILocation(line: 11, column: 9, scope: !9)
!20 = !DILocation(line: 11, column: 5, scope: !9)
!21 = !DILabel(scope: !9, name: "LOOP", file: !10, line: 12)
!22 = !DILocation(line: 12, column: 5, scope: !9)
!23 = !DILocation(line: 13, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 8)
!25 = !DILocation(line: 13, column: 12, scope: !24)
!26 = !DILocation(line: 13, column: 10, scope: !24)
!27 = !DILocation(line: 13, column: 8, scope: !9)
!28 = !DILocation(line: 14, column: 10, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !10, line: 13, column: 15)
!30 = !DILocation(line: 15, column: 13, scope: !29)
!31 = !DILocation(line: 15, column: 15, scope: !29)
!32 = !DILocation(line: 15, column: 11, scope: !29)
!33 = !DILocation(line: 16, column: 9, scope: !29)
!34 = !DILocation(line: 18, column: 16, scope: !9)
!35 = !DILocation(line: 18, column: 21, scope: !9)
!36 = !DILocation(line: 18, column: 18, scope: !9)
!37 = !DILocation(line: 18, column: 5, scope: !9)
!38 = !DILocation(line: 19, column: 16, scope: !9)
!39 = !DILocation(line: 19, column: 21, scope: !9)
!40 = !DILocation(line: 19, column: 23, scope: !9)
!41 = !DILocation(line: 19, column: 18, scope: !9)
!42 = !DILocation(line: 19, column: 5, scope: !9)
!43 = !DILocation(line: 20, column: 1, scope: !9)
