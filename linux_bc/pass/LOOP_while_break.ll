; ModuleID = 'linux_bc/pass/LOOP_while_break.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/LOOP_while_break.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 1, i32* %x, align 4, !dbg !16
  br label %while.cond, !dbg !17

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %x, align 4, !dbg !18
  %cmp = icmp slt i32 %0, 5, !dbg !19
  br i1 %cmp, label %while.body, label %while.end, !dbg !17

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %x, align 4, !dbg !20
  %inc = add nsw i32 %1, 1, !dbg !20
  store i32 %inc, i32* %x, align 4, !dbg !20
  %2 = load i32, i32* %x, align 4, !dbg !22
  %cmp1 = icmp eq i32 %2, 3, !dbg !24
  br i1 %cmp1, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %while.body
  br label %while.end, !dbg !26

if.end:                                           ; preds = %while.body
  br label %while.cond, !dbg !17, !llvm.loop !27

while.end:                                        ; preds = %if.then, %while.cond
  %3 = load i32, i32* %x, align 4, !dbg !30
  %cmp2 = icmp eq i32 %3, 3, !dbg !31
  call void @svf_assert(i1 zeroext %cmp2), !dbg !32
  ret i32 0, !dbg !33
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/LOOP_while_break.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 4, type: !11, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/LOOP_while_break.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 5, type: !13)
!15 = !DILocation(line: 5, column: 9, scope: !9)
!16 = !DILocation(line: 6, column: 6, scope: !9)
!17 = !DILocation(line: 7, column: 5, scope: !9)
!18 = !DILocation(line: 7, column: 11, scope: !9)
!19 = !DILocation(line: 7, column: 12, scope: !9)
!20 = !DILocation(line: 8, column: 10, scope: !21)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 7, column: 16)
!22 = !DILocation(line: 9, column: 12, scope: !23)
!23 = distinct !DILexicalBlock(scope: !21, file: !10, line: 9, column: 12)
!24 = !DILocation(line: 9, column: 13, scope: !23)
!25 = !DILocation(line: 9, column: 12, scope: !21)
!26 = !DILocation(line: 9, column: 18, scope: !23)
!27 = distinct !{!27, !17, !28, !29}
!28 = !DILocation(line: 10, column: 5, scope: !9)
!29 = !{!"llvm.loop.mustprogress"}
!30 = !DILocation(line: 11, column: 16, scope: !9)
!31 = !DILocation(line: 11, column: 18, scope: !9)
!32 = !DILocation(line: 11, column: 5, scope: !9)
!33 = !DILocation(line: 12, column: 5, scope: !9)
