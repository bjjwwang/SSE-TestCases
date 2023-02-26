; ModuleID = 'linux_bc/pass/LOOP_for_inc.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/LOOP_for_inc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %i, align 4, !dbg !15
  store i32 0, i32* %i, align 4, !dbg !16
  br label %for.cond, !dbg !18

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !19
  %cmp = icmp slt i32 %0, 5, !dbg !21
  br i1 %cmp, label %for.body, label %for.end, !dbg !22

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !23
  %inc = add nsw i32 %1, 1, !dbg !23
  store i32 %inc, i32* %i, align 4, !dbg !23
  br label %for.inc, !dbg !25

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !26
  %inc1 = add nsw i32 %2, 1, !dbg !26
  store i32 %inc1, i32* %i, align 4, !dbg !26
  br label %for.cond, !dbg !27, !llvm.loop !28

for.end:                                          ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !31
  %cmp2 = icmp eq i32 %3, 6, !dbg !32
  call void @svf_assert(i1 zeroext %cmp2), !dbg !33
  %4 = load i32, i32* %retval, align 4, !dbg !34
  ret i32 %4, !dbg !34
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/LOOP_for_inc.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/LOOP_for_inc.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 4, type: !13)
!15 = !DILocation(line: 4, column: 9, scope: !9)
!16 = !DILocation(line: 5, column: 12, scope: !17)
!17 = distinct !DILexicalBlock(scope: !9, file: !10, line: 5, column: 5)
!18 = !DILocation(line: 5, column: 10, scope: !17)
!19 = !DILocation(line: 5, column: 17, scope: !20)
!20 = distinct !DILexicalBlock(scope: !17, file: !10, line: 5, column: 5)
!21 = !DILocation(line: 5, column: 19, scope: !20)
!22 = !DILocation(line: 5, column: 5, scope: !17)
!23 = !DILocation(line: 6, column: 10, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !10, line: 5, column: 29)
!25 = !DILocation(line: 7, column: 5, scope: !24)
!26 = !DILocation(line: 5, column: 25, scope: !20)
!27 = !DILocation(line: 5, column: 5, scope: !20)
!28 = distinct !{!28, !22, !29, !30}
!29 = !DILocation(line: 7, column: 5, scope: !17)
!30 = !{!"llvm.loop.mustprogress"}
!31 = !DILocation(line: 8, column: 16, scope: !9)
!32 = !DILocation(line: 8, column: 18, scope: !9)
!33 = !DILocation(line: 8, column: 5, scope: !9)
!34 = !DILocation(line: 9, column: 1, scope: !9)
