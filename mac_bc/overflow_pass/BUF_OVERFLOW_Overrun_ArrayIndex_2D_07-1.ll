; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_2D_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_2D_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [3 x [4 x i32]], align 16
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x [4 x i32]]* %a, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %x, metadata !21, metadata !DIExpression()), !dbg !23
  store i32 0, i32* %x, align 4, !dbg !23
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %x, align 4, !dbg !25
  %cmp = icmp slt i32 %0, 4, !dbg !27
  br i1 %cmp, label %for.body, label %for.end8, !dbg !28

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %y, metadata !29, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %y, align 4, !dbg !32
  br label %for.cond1, !dbg !33

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %y, align 4, !dbg !34
  %cmp2 = icmp slt i32 %1, 4, !dbg !36
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !37

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %x, align 4, !dbg !38
  %idxprom = sext i32 %2 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [3 x [4 x i32]], [3 x [4 x i32]]* %a, i64 0, i64 %idxprom, !dbg !40
  %3 = load i32, i32* %y, align 4, !dbg !41
  %idxprom4 = sext i32 %3 to i64, !dbg !40
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom4, !dbg !40
  store i32 0, i32* %arrayidx5, align 4, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body3
  %4 = load i32, i32* %y, align 4, !dbg !44
  %inc = add nsw i32 %4, 1, !dbg !44
  store i32 %inc, i32* %y, align 4, !dbg !44
  br label %for.cond1, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond1
  br label %for.inc6, !dbg !49

for.inc6:                                         ; preds = %for.end
  %5 = load i32, i32* %x, align 4, !dbg !50
  %inc7 = add nsw i32 %5, 1, !dbg !50
  store i32 %inc7, i32* %x, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end8:                                         ; preds = %for.cond
  %6 = load i32, i32* %retval, align 4, !dbg !54
  ret i32 %6, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_2D_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_2D_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 384, elements: !17)
!17 = !{!18, !19}
!18 = !DISubrange(count: 3)
!19 = !DISubrange(count: 4)
!20 = !DILocation(line: 8, column: 9, scope: !9)
!21 = !DILocalVariable(name: "x", scope: !22, file: !10, line: 9, type: !13)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 5)
!23 = !DILocation(line: 9, column: 13, scope: !22)
!24 = !DILocation(line: 9, column: 9, scope: !22)
!25 = !DILocation(line: 9, column: 20, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !10, line: 9, column: 5)
!27 = !DILocation(line: 9, column: 22, scope: !26)
!28 = !DILocation(line: 9, column: 5, scope: !22)
!29 = !DILocalVariable(name: "y", scope: !30, file: !10, line: 10, type: !13)
!30 = distinct !DILexicalBlock(scope: !31, file: !10, line: 10, column: 9)
!31 = distinct !DILexicalBlock(scope: !26, file: !10, line: 9, column: 32)
!32 = !DILocation(line: 10, column: 17, scope: !30)
!33 = !DILocation(line: 10, column: 13, scope: !30)
!34 = !DILocation(line: 10, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !30, file: !10, line: 10, column: 9)
!36 = !DILocation(line: 10, column: 26, scope: !35)
!37 = !DILocation(line: 10, column: 9, scope: !30)
!38 = !DILocation(line: 11, column: 15, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !10, line: 10, column: 36)
!40 = !DILocation(line: 11, column: 13, scope: !39)
!41 = !DILocation(line: 11, column: 18, scope: !39)
!42 = !DILocation(line: 11, column: 21, scope: !39)
!43 = !DILocation(line: 12, column: 9, scope: !39)
!44 = !DILocation(line: 10, column: 32, scope: !35)
!45 = !DILocation(line: 10, column: 9, scope: !35)
!46 = distinct !{!46, !37, !47, !48}
!47 = !DILocation(line: 12, column: 9, scope: !30)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 13, column: 5, scope: !31)
!50 = !DILocation(line: 9, column: 28, scope: !26)
!51 = !DILocation(line: 9, column: 5, scope: !26)
!52 = distinct !{!52, !28, !53, !48}
!53 = !DILocation(line: 13, column: 5, scope: !22)
!54 = !DILocation(line: 14, column: 1, scope: !9)
