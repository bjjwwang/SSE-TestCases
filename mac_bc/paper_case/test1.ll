; ModuleID = 'mac_bc/paper_case/test1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/paper_case/test1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !14, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %a, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %b, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* %a, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  store i32 3, i32* %0, align 4, !dbg !24
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !25
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %b), !dbg !26
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !27, metadata !DIExpression()), !dbg !32
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !32
  store i32* %b, i32** %data, align 8, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %4 = load i32, i32* %3, align 4, !dbg !36
  %cmp = icmp sge i32 %4, 0, !dbg !37
  br i1 %cmp, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %data, align 8, !dbg !39
  %6 = load i32, i32* %5, align 4, !dbg !41
  %idxprom = sext i32 %6 to i64, !dbg !42
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !42
  store i32 1, i32* %arrayidx, align 4, !dbg !43
  br label %if.end, !dbg !44

if.else:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) bitcast (i32 (...)* @printLine to i32 (i8*, ...)*)(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !45
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @printLine(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !48 {
entry:
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad(), !dbg !51
  ret i32 0, !dbg !52
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/paper_case/test1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad", scope: !10, file: !10, line: 5, type: !11, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "src/paper_case/test1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 7, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 7, column: 10, scope: !9)
!18 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 8, type: !16)
!19 = !DILocation(line: 8, column: 9, scope: !9)
!20 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 8, type: !16)
!21 = !DILocation(line: 8, column: 12, scope: !9)
!22 = !DILocation(line: 9, column: 10, scope: !9)
!23 = !DILocation(line: 11, column: 6, scope: !9)
!24 = !DILocation(line: 11, column: 11, scope: !9)
!25 = !DILocation(line: 13, column: 12, scope: !9)
!26 = !DILocation(line: 13, column: 5, scope: !9)
!27 = !DILocalVariable(name: "buffer", scope: !28, file: !10, line: 15, type: !29)
!28 = distinct !DILexicalBlock(scope: !9, file: !10, line: 14, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 10)
!32 = !DILocation(line: 15, column: 13, scope: !28)
!33 = !DILocation(line: 18, column: 14, scope: !28)
!34 = !DILocation(line: 19, column: 14, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !10, line: 19, column: 13)
!36 = !DILocation(line: 19, column: 13, scope: !35)
!37 = !DILocation(line: 19, column: 19, scope: !35)
!38 = !DILocation(line: 19, column: 13, scope: !28)
!39 = !DILocation(line: 21, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !35, file: !10, line: 20, column: 9)
!41 = !DILocation(line: 21, column: 20, scope: !40)
!42 = !DILocation(line: 21, column: 13, scope: !40)
!43 = !DILocation(line: 21, column: 27, scope: !40)
!44 = !DILocation(line: 22, column: 9, scope: !40)
!45 = !DILocation(line: 25, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !35, file: !10, line: 24, column: 9)
!47 = !DILocation(line: 28, column: 1, scope: !9)
!48 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 30, type: !49, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!49 = !DISubroutineType(types: !50)
!50 = !{!16}
!51 = !DILocation(line: 31, column: 5, scope: !48)
!52 = !DILocation(line: 32, column: 1, scope: !48)
