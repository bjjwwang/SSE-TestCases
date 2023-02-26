; ModuleID = 'linux_bc/pass/INTERVAL_test_15.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_15.c"
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
  %rem = srem i32 %0, 5, !dbg !17
  store i32 %rem, i32* %a, align 4, !dbg !18
  %1 = load i32, i32* %a, align 4, !dbg !19
  %cmp = icmp sge i32 %1, 0, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !23
  %cmp1 = icmp sge i32 %2, 0, !dbg !25
  br i1 %cmp1, label %land.rhs, label %land.end, !dbg !26

land.rhs:                                         ; preds = %if.then
  %3 = load i32, i32* %a, align 4, !dbg !27
  %cmp2 = icmp slt i32 %3, 5, !dbg !28
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %4 = phi i1 [ false, %if.then ], [ %cmp2, %land.rhs ], !dbg !29
  call void @svf_assert(i1 zeroext %4), !dbg !30
  br label %if.end, !dbg !31

if.end:                                           ; preds = %land.end, %entry
  %5 = load i32, i32* %retval, align 4, !dbg !32
  ret i32 %5, !dbg !32
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_15.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 4, type: !11, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_15.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 5, type: !13)
!15 = !DILocation(line: 5, column: 9, scope: !9)
!16 = !DILocation(line: 6, column: 9, scope: !9)
!17 = !DILocation(line: 6, column: 11, scope: !9)
!18 = !DILocation(line: 6, column: 7, scope: !9)
!19 = !DILocation(line: 7, column: 9, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 7, column: 9)
!21 = !DILocation(line: 7, column: 11, scope: !20)
!22 = !DILocation(line: 7, column: 9, scope: !9)
!23 = !DILocation(line: 8, column: 20, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !10, line: 7, column: 17)
!25 = !DILocation(line: 8, column: 22, scope: !24)
!26 = !DILocation(line: 8, column: 27, scope: !24)
!27 = !DILocation(line: 8, column: 30, scope: !24)
!28 = !DILocation(line: 8, column: 32, scope: !24)
!29 = !DILocation(line: 0, scope: !24)
!30 = !DILocation(line: 8, column: 9, scope: !24)
!31 = !DILocation(line: 9, column: 5, scope: !24)
!32 = !DILocation(line: 10, column: 1, scope: !9)
