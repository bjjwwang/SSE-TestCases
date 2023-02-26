; ModuleID = 'linux_bc/pass/LOOP_for_nested.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/LOOP_for_nested.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %i, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %j, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %j, align 4, !dbg !17
  store i32 0, i32* %i, align 4, !dbg !18
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.inc4, %entry
  %0 = load i32, i32* %i, align 4, !dbg !21
  %cmp = icmp slt i32 %0, 5, !dbg !23
  br i1 %cmp, label %for.body, label %for.end6, !dbg !24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !25
  br label %for.cond1, !dbg !28

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !29
  %cmp2 = icmp slt i32 %1, 3, !dbg !31
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !32

for.body3:                                        ; preds = %for.cond1
  br label %for.inc, !dbg !33

for.inc:                                          ; preds = %for.body3
  %2 = load i32, i32* %j, align 4, !dbg !35
  %inc = add nsw i32 %2, 1, !dbg !35
  store i32 %inc, i32* %j, align 4, !dbg !35
  br label %for.cond1, !dbg !36, !llvm.loop !37

for.end:                                          ; preds = %for.cond1
  br label %for.inc4, !dbg !40

for.inc4:                                         ; preds = %for.end
  %3 = load i32, i32* %i, align 4, !dbg !41
  %inc5 = add nsw i32 %3, 1, !dbg !41
  store i32 %inc5, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !42, !llvm.loop !43

for.end6:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !45
  %cmp7 = icmp eq i32 %4, 5, !dbg !46
  br i1 %cmp7, label %land.rhs, label %land.end, !dbg !47

land.rhs:                                         ; preds = %for.end6
  %5 = load i32, i32* %j, align 4, !dbg !48
  %cmp8 = icmp eq i32 %5, 3, !dbg !49
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end6
  %6 = phi i1 [ false, %for.end6 ], [ %cmp8, %land.rhs ], !dbg !50
  call void @svf_assert(i1 zeroext %6), !dbg !51
  %7 = load i32, i32* %retval, align 4, !dbg !52
  ret i32 %7, !dbg !52
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/LOOP_for_nested.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/LOOP_for_nested.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 4, type: !13)
!15 = !DILocation(line: 4, column: 9, scope: !9)
!16 = !DILocalVariable(name: "j", scope: !9, file: !10, line: 5, type: !13)
!17 = !DILocation(line: 5, column: 9, scope: !9)
!18 = !DILocation(line: 6, column: 12, scope: !19)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 6, column: 5)
!20 = !DILocation(line: 6, column: 10, scope: !19)
!21 = !DILocation(line: 6, column: 17, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !10, line: 6, column: 5)
!23 = !DILocation(line: 6, column: 19, scope: !22)
!24 = !DILocation(line: 6, column: 5, scope: !19)
!25 = !DILocation(line: 7, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !10, line: 7, column: 9)
!27 = distinct !DILexicalBlock(scope: !22, file: !10, line: 6, column: 29)
!28 = !DILocation(line: 7, column: 14, scope: !26)
!29 = !DILocation(line: 7, column: 21, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !10, line: 7, column: 9)
!31 = !DILocation(line: 7, column: 23, scope: !30)
!32 = !DILocation(line: 7, column: 9, scope: !26)
!33 = !DILocation(line: 9, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 7, column: 33)
!35 = !DILocation(line: 7, column: 28, scope: !30)
!36 = !DILocation(line: 7, column: 9, scope: !30)
!37 = distinct !{!37, !32, !38, !39}
!38 = !DILocation(line: 9, column: 9, scope: !26)
!39 = !{!"llvm.loop.mustprogress"}
!40 = !DILocation(line: 10, column: 5, scope: !27)
!41 = !DILocation(line: 6, column: 25, scope: !22)
!42 = !DILocation(line: 6, column: 5, scope: !22)
!43 = distinct !{!43, !24, !44, !39}
!44 = !DILocation(line: 10, column: 5, scope: !19)
!45 = !DILocation(line: 11, column: 16, scope: !9)
!46 = !DILocation(line: 11, column: 18, scope: !9)
!47 = !DILocation(line: 11, column: 23, scope: !9)
!48 = !DILocation(line: 11, column: 26, scope: !9)
!49 = !DILocation(line: 11, column: 28, scope: !9)
!50 = !DILocation(line: 0, scope: !9)
!51 = !DILocation(line: 11, column: 5, scope: !9)
!52 = !DILocation(line: 12, column: 1, scope: !9)
