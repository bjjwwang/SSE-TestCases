; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_2D_07-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_2D_07-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [3 x [4 x i32]], align 16
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x [4 x i32]]* %a, metadata !14, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %x, metadata !20, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %x, align 4, !dbg !22
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %x, align 4, !dbg !24
  %cmp = icmp slt i32 %0, 4, !dbg !26
  br i1 %cmp, label %for.body, label %for.end8, !dbg !27

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %y, metadata !28, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %y, align 4, !dbg !31
  br label %for.cond1, !dbg !32

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %y, align 4, !dbg !33
  %cmp2 = icmp slt i32 %1, 4, !dbg !35
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !36

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %x, align 4, !dbg !37
  %idxprom = sext i32 %2 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [3 x [4 x i32]], [3 x [4 x i32]]* %a, i64 0, i64 %idxprom, !dbg !39
  %3 = load i32, i32* %y, align 4, !dbg !40
  %idxprom4 = sext i32 %3 to i64, !dbg !39
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom4, !dbg !39
  store i32 0, i32* %arrayidx5, align 4, !dbg !41
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body3
  %4 = load i32, i32* %y, align 4, !dbg !43
  %inc = add nsw i32 %4, 1, !dbg !43
  store i32 %inc, i32* %y, align 4, !dbg !43
  br label %for.cond1, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond1
  br label %for.inc6, !dbg !48

for.inc6:                                         ; preds = %for.end
  %5 = load i32, i32* %x, align 4, !dbg !49
  %inc7 = add nsw i32 %5, 1, !dbg !49
  store i32 %inc7, i32* %x, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end8:                                         ; preds = %for.cond
  %6 = load i32, i32* %retval, align 4, !dbg !53
  ret i32 %6, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_2D_07-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_2D_07-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 384, elements: !16)
!16 = !{!17, !18}
!17 = !DISubrange(count: 3)
!18 = !DISubrange(count: 4)
!19 = !DILocation(line: 8, column: 9, scope: !9)
!20 = !DILocalVariable(name: "x", scope: !21, file: !10, line: 9, type: !13)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 5)
!22 = !DILocation(line: 9, column: 13, scope: !21)
!23 = !DILocation(line: 9, column: 9, scope: !21)
!24 = !DILocation(line: 9, column: 20, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !10, line: 9, column: 5)
!26 = !DILocation(line: 9, column: 22, scope: !25)
!27 = !DILocation(line: 9, column: 5, scope: !21)
!28 = !DILocalVariable(name: "y", scope: !29, file: !10, line: 10, type: !13)
!29 = distinct !DILexicalBlock(scope: !30, file: !10, line: 10, column: 9)
!30 = distinct !DILexicalBlock(scope: !25, file: !10, line: 9, column: 32)
!31 = !DILocation(line: 10, column: 17, scope: !29)
!32 = !DILocation(line: 10, column: 13, scope: !29)
!33 = !DILocation(line: 10, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !10, line: 10, column: 9)
!35 = !DILocation(line: 10, column: 26, scope: !34)
!36 = !DILocation(line: 10, column: 9, scope: !29)
!37 = !DILocation(line: 11, column: 15, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 10, column: 36)
!39 = !DILocation(line: 11, column: 13, scope: !38)
!40 = !DILocation(line: 11, column: 18, scope: !38)
!41 = !DILocation(line: 11, column: 21, scope: !38)
!42 = !DILocation(line: 12, column: 9, scope: !38)
!43 = !DILocation(line: 10, column: 32, scope: !34)
!44 = !DILocation(line: 10, column: 9, scope: !34)
!45 = distinct !{!45, !36, !46, !47}
!46 = !DILocation(line: 12, column: 9, scope: !29)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocation(line: 13, column: 5, scope: !30)
!49 = !DILocation(line: 9, column: 28, scope: !25)
!50 = !DILocation(line: 9, column: 5, scope: !25)
!51 = distinct !{!51, !27, !52, !47}
!52 = !DILocation(line: 13, column: 5, scope: !21)
!53 = !DILocation(line: 14, column: 1, scope: !9)
