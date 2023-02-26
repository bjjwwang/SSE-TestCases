; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overrun_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overrun_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.myStruct = type { [3 x i8] }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca %struct.myStruct, align 1
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.myStruct* %s1, metadata !15, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !26
  store i32 0, i32* %i, align 4, !dbg !26
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %0, 4, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %n2 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %s1, i32 0, i32 0, !dbg !32
  %1 = load i32, i32* %i, align 4, !dbg !34
  %idxprom = sext i32 %1 to i64, !dbg !35
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* %n2, i64 0, i64 %idxprom, !dbg !35
  store i8 98, i8* %arrayidx, align 1, !dbg !36
  br label %for.inc, !dbg !37

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !38
  %inc = add nsw i32 %2, 1, !dbg !38
  store i32 %inc, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !39, !llvm.loop !40

for.end:                                          ; preds = %for.cond
  %3 = load i32, i32* %retval, align 4, !dbg !43
  ret i32 %3, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overrun_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 11, type: !11, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overrun_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "s1", scope: !9, file: !10, line: 12, type: !16)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "myStruct", file: !10, line: 7, size: 24, elements: !17)
!17 = !{!18}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "n2", scope: !16, file: !10, line: 8, baseType: !19, size: 24)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 24, elements: !21)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !{!22}
!22 = !DISubrange(count: 3)
!23 = !DILocation(line: 12, column: 21, scope: !9)
!24 = !DILocalVariable(name: "i", scope: !25, file: !10, line: 13, type: !13)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 5)
!26 = !DILocation(line: 13, column: 13, scope: !25)
!27 = !DILocation(line: 13, column: 9, scope: !25)
!28 = !DILocation(line: 13, column: 20, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !10, line: 13, column: 5)
!30 = !DILocation(line: 13, column: 22, scope: !29)
!31 = !DILocation(line: 13, column: 5, scope: !25)
!32 = !DILocation(line: 14, column: 12, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 13, column: 32)
!34 = !DILocation(line: 14, column: 15, scope: !33)
!35 = !DILocation(line: 14, column: 9, scope: !33)
!36 = !DILocation(line: 14, column: 18, scope: !33)
!37 = !DILocation(line: 15, column: 5, scope: !33)
!38 = !DILocation(line: 13, column: 28, scope: !29)
!39 = !DILocation(line: 13, column: 5, scope: !29)
!40 = distinct !{!40, !31, !41, !42}
!41 = !DILocation(line: 15, column: 5, scope: !25)
!42 = !{!"llvm.loop.mustprogress"}
!43 = !DILocation(line: 16, column: 1, scope: !9)
