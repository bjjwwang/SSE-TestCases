; ModuleID = 'mac_bc/pass/LOOP_for01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/LOOP_for01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %i, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %j, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %j, align 4, !dbg !18
  store i32 0, i32* %i, align 4, !dbg !19
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !22
  %cmp = icmp slt i32 %0, 5, !dbg !24
  br i1 %cmp, label %for.body, label %for.end, !dbg !25

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %j, align 4, !dbg !26
  %inc = add nsw i32 %1, 1, !dbg !26
  store i32 %inc, i32* %j, align 4, !dbg !26
  br label %for.inc, !dbg !28

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !29
  %inc1 = add nsw i32 %2, 1, !dbg !29
  store i32 %inc1, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !30, !llvm.loop !31

for.end:                                          ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !34
  %cmp2 = icmp eq i32 %3, 5, !dbg !35
  br i1 %cmp2, label %land.rhs, label %land.end, !dbg !36

land.rhs:                                         ; preds = %for.end
  %4 = load i32, i32* %j, align 4, !dbg !37
  %cmp3 = icmp eq i32 %4, 5, !dbg !38
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end
  %5 = phi i1 [ false, %for.end ], [ %cmp3, %land.rhs ], !dbg !39
  call void @svf_assert(i1 noundef zeroext %5), !dbg !40
  %6 = load i32, i32* %retval, align 4, !dbg !41
  ret i32 %6, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/LOOP_for01.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/LOOP_for01.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 8, type: !13)
!16 = !DILocation(line: 8, column: 9, scope: !9)
!17 = !DILocalVariable(name: "j", scope: !9, file: !10, line: 9, type: !13)
!18 = !DILocation(line: 9, column: 9, scope: !9)
!19 = !DILocation(line: 11, column: 12, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 5)
!21 = !DILocation(line: 11, column: 10, scope: !20)
!22 = !DILocation(line: 11, column: 17, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !10, line: 11, column: 5)
!24 = !DILocation(line: 11, column: 19, scope: !23)
!25 = !DILocation(line: 11, column: 5, scope: !20)
!26 = !DILocation(line: 12, column: 10, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !10, line: 11, column: 29)
!28 = !DILocation(line: 13, column: 5, scope: !27)
!29 = !DILocation(line: 11, column: 25, scope: !23)
!30 = !DILocation(line: 11, column: 5, scope: !23)
!31 = distinct !{!31, !25, !32, !33}
!32 = !DILocation(line: 13, column: 5, scope: !20)
!33 = !{!"llvm.loop.mustprogress"}
!34 = !DILocation(line: 14, column: 16, scope: !9)
!35 = !DILocation(line: 14, column: 18, scope: !9)
!36 = !DILocation(line: 14, column: 23, scope: !9)
!37 = !DILocation(line: 14, column: 26, scope: !9)
!38 = !DILocation(line: 14, column: 28, scope: !9)
!39 = !DILocation(line: 0, scope: !9)
!40 = !DILocation(line: 14, column: 5, scope: !9)
!41 = !DILocation(line: 15, column: 1, scope: !9)
