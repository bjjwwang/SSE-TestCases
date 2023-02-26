; ModuleID = 'linux_bc/pass/INTERVAL_test_29.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_29.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %ch = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %ch, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* %ch, align 4, !dbg !16
  %cmp = icmp sge i32 %0, 97, !dbg !18
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !19

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %ch, align 4, !dbg !20
  %cmp1 = icmp sle i32 %1, 122, !dbg !21
  br i1 %cmp1, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* %ch, align 4, !dbg !23
  %call = call i32 @toupper(i32 %2) #4, !dbg !25
  store i32 %call, i32* %ch, align 4, !dbg !26
  %3 = load i32, i32* %ch, align 4, !dbg !27
  %cmp2 = icmp sge i32 %3, 65, !dbg !28
  br i1 %cmp2, label %land.rhs, label %land.end, !dbg !29

land.rhs:                                         ; preds = %if.then
  %4 = load i32, i32* %ch, align 4, !dbg !30
  %cmp3 = icmp sle i32 %4, 90, !dbg !31
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %5 = phi i1 [ false, %if.then ], [ %cmp3, %land.rhs ], !dbg !32
  call void @svf_assert(i1 zeroext %5), !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %land.end, %land.lhs.true, %entry
  %6 = load i32, i32* %retval, align 4, !dbg !35
  ret i32 %6, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @toupper(i32) #2

declare dso_local void @svf_assert(i1 zeroext) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_29.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_29.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "ch", scope: !9, file: !10, line: 8, type: !13)
!15 = !DILocation(line: 8, column: 6, scope: !9)
!16 = !DILocation(line: 9, column: 6, scope: !17)
!17 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 6)
!18 = !DILocation(line: 9, column: 9, scope: !17)
!19 = !DILocation(line: 9, column: 15, scope: !17)
!20 = !DILocation(line: 9, column: 18, scope: !17)
!21 = !DILocation(line: 9, column: 21, scope: !17)
!22 = !DILocation(line: 9, column: 6, scope: !9)
!23 = !DILocation(line: 10, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !17, file: !10, line: 9, column: 29)
!25 = !DILocation(line: 10, column: 8, scope: !24)
!26 = !DILocation(line: 10, column: 6, scope: !24)
!27 = !DILocation(line: 11, column: 14, scope: !24)
!28 = !DILocation(line: 11, column: 17, scope: !24)
!29 = !DILocation(line: 11, column: 23, scope: !24)
!30 = !DILocation(line: 11, column: 26, scope: !24)
!31 = !DILocation(line: 11, column: 29, scope: !24)
!32 = !DILocation(line: 0, scope: !24)
!33 = !DILocation(line: 11, column: 3, scope: !24)
!34 = !DILocation(line: 12, column: 2, scope: !24)
!35 = !DILocation(line: 13, column: 1, scope: !9)
