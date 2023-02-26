; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overrun_01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overrun_01-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.myStruct = type { [3 x i8] }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca %struct.myStruct, align 1
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.myStruct* %s1, metadata !14, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 4, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %n2 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %s1, i32 0, i32 0, !dbg !31
  %1 = load i32, i32* %i, align 4, !dbg !33
  %idxprom = sext i32 %1 to i64, !dbg !34
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* %n2, i64 0, i64 %idxprom, !dbg !34
  store i8 98, i8* %arrayidx, align 1, !dbg !35
  br label %for.inc, !dbg !36

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !37
  %inc = add nsw i32 %2, 1, !dbg !37
  store i32 %inc, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !38, !llvm.loop !39

for.end:                                          ; preds = %for.cond
  %3 = load i32, i32* %retval, align 4, !dbg !42
  ret i32 %3, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overrun_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 11, type: !11, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overrun_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "s1", scope: !9, file: !10, line: 12, type: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "myStruct", file: !10, line: 7, size: 24, elements: !16)
!16 = !{!17}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "n2", scope: !15, file: !10, line: 8, baseType: !18, size: 24)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 24, elements: !20)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{!21}
!21 = !DISubrange(count: 3)
!22 = !DILocation(line: 12, column: 21, scope: !9)
!23 = !DILocalVariable(name: "i", scope: !24, file: !10, line: 13, type: !13)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 5)
!25 = !DILocation(line: 13, column: 13, scope: !24)
!26 = !DILocation(line: 13, column: 9, scope: !24)
!27 = !DILocation(line: 13, column: 20, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !10, line: 13, column: 5)
!29 = !DILocation(line: 13, column: 22, scope: !28)
!30 = !DILocation(line: 13, column: 5, scope: !24)
!31 = !DILocation(line: 14, column: 12, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !10, line: 13, column: 32)
!33 = !DILocation(line: 14, column: 15, scope: !32)
!34 = !DILocation(line: 14, column: 9, scope: !32)
!35 = !DILocation(line: 14, column: 18, scope: !32)
!36 = !DILocation(line: 15, column: 5, scope: !32)
!37 = !DILocation(line: 13, column: 28, scope: !28)
!38 = !DILocation(line: 13, column: 5, scope: !28)
!39 = distinct !{!39, !30, !40, !41}
!40 = !DILocation(line: 15, column: 5, scope: !24)
!41 = !{!"llvm.loop.mustprogress"}
!42 = !DILocation(line: 16, column: 1, scope: !9)
