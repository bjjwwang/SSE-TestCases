; ModuleID = 'linux_bc/pass/INTERVAL_test_10.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* %a, align 4, !dbg !16
  %cmp = icmp sgt i32 %0, 5, !dbg !18
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !19

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %a, align 4, !dbg !20
  %cmp1 = icmp slt i32 %1, 7, !dbg !21
  br i1 %cmp1, label %if.then, label %if.else, !dbg !22

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* %a, align 4, !dbg !23
  %cmp2 = icmp eq i32 %2, 6, !dbg !25
  call void @svf_assert(i1 zeroext %cmp2), !dbg !26
  br label %if.end, !dbg !27

if.else:                                          ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* %a, align 4, !dbg !28
  %cmp3 = icmp sle i32 %3, 5, !dbg !30
  br i1 %cmp3, label %lor.end, label %lor.rhs, !dbg !31

lor.rhs:                                          ; preds = %if.else
  %4 = load i32, i32* %a, align 4, !dbg !32
  %cmp4 = icmp sge i32 %4, 7, !dbg !33
  br label %lor.end, !dbg !31

lor.end:                                          ; preds = %lor.rhs, %if.else
  %5 = phi i1 [ true, %if.else ], [ %cmp4, %lor.rhs ]
  call void @svf_assert(i1 zeroext %5), !dbg !34
  br label %if.end

if.end:                                           ; preds = %lor.end, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !35
  ret i32 %6, !dbg !35
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_10.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_10.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 6, type: !13)
!15 = !DILocation(line: 6, column: 6, scope: !9)
!16 = !DILocation(line: 7, column: 9, scope: !17)
!17 = distinct !DILexicalBlock(scope: !9, file: !10, line: 7, column: 9)
!18 = !DILocation(line: 7, column: 11, scope: !17)
!19 = !DILocation(line: 7, column: 15, scope: !17)
!20 = !DILocation(line: 7, column: 18, scope: !17)
!21 = !DILocation(line: 7, column: 20, scope: !17)
!22 = !DILocation(line: 7, column: 9, scope: !9)
!23 = !DILocation(line: 8, column: 20, scope: !24)
!24 = distinct !DILexicalBlock(scope: !17, file: !10, line: 7, column: 25)
!25 = !DILocation(line: 8, column: 22, scope: !24)
!26 = !DILocation(line: 8, column: 9, scope: !24)
!27 = !DILocation(line: 9, column: 5, scope: !24)
!28 = !DILocation(line: 11, column: 20, scope: !29)
!29 = distinct !DILexicalBlock(scope: !17, file: !10, line: 10, column: 10)
!30 = !DILocation(line: 11, column: 22, scope: !29)
!31 = !DILocation(line: 11, column: 27, scope: !29)
!32 = !DILocation(line: 11, column: 30, scope: !29)
!33 = !DILocation(line: 11, column: 32, scope: !29)
!34 = !DILocation(line: 11, column: 9, scope: !29)
!35 = !DILocation(line: 13, column: 1, scope: !9)
