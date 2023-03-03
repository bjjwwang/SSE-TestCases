; ModuleID = 'mac_bc/paper_case/test3.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/paper_case/test3.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %a = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !14, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %a, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* %a, i32** %data, align 8, !dbg !20
  %0 = load i32*, i32** %data, align 8, !dbg !21
  store i32 3, i32* %0, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !23, metadata !DIExpression()), !dbg !27
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !27
  store i32 10, i32* %a, align 4, !dbg !28
  %2 = load i32*, i32** %data, align 8, !dbg !29
  %3 = load i32, i32* %2, align 4, !dbg !31
  %cmp = icmp sge i32 %3, 0, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %5 = load i32, i32* %4, align 4, !dbg !36
  %idxprom = sext i32 %5 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !37
  store i32 1, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !41 {
entry:
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad(), !dbg !44
  ret i32 0, !dbg !45
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/paper_case/test3.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad", scope: !10, file: !10, line: 5, type: !11, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "src/paper_case/test3.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 7, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 7, column: 10, scope: !9)
!18 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 8, type: !16)
!19 = !DILocation(line: 8, column: 9, scope: !9)
!20 = !DILocation(line: 9, column: 10, scope: !9)
!21 = !DILocation(line: 11, column: 6, scope: !9)
!22 = !DILocation(line: 11, column: 11, scope: !9)
!23 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 12, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 12, column: 9, scope: !9)
!28 = !DILocation(line: 15, column: 7, scope: !9)
!29 = !DILocation(line: 16, column: 10, scope: !30)
!30 = distinct !DILexicalBlock(scope: !9, file: !10, line: 16, column: 9)
!31 = !DILocation(line: 16, column: 9, scope: !30)
!32 = !DILocation(line: 16, column: 15, scope: !30)
!33 = !DILocation(line: 16, column: 9, scope: !9)
!34 = !DILocation(line: 18, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !30, file: !10, line: 17, column: 5)
!36 = !DILocation(line: 18, column: 16, scope: !35)
!37 = !DILocation(line: 18, column: 9, scope: !35)
!38 = !DILocation(line: 18, column: 23, scope: !35)
!39 = !DILocation(line: 19, column: 5, scope: !35)
!40 = !DILocation(line: 20, column: 1, scope: !9)
!41 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 22, type: !42, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!42 = !DISubroutineType(types: !43)
!43 = !{!16}
!44 = !DILocation(line: 23, column: 5, scope: !41)
!45 = !DILocation(line: 24, column: 1, scope: !41)
