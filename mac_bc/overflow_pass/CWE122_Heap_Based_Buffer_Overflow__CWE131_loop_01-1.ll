; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 10) #6, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !47
  %cmp1 = icmp ult i64 %3, 10, !dbg !49
  br i1 %cmp1, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !53
  %5 = load i32, i32* %arrayidx, align 4, !dbg !53
  %6 = load i32*, i32** %data, align 8, !dbg !54
  %7 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !54
  store i32 %5, i32* %arrayidx2, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %8, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !63
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !63
  call void @printIntLine(i32 noundef %10), !dbg !64
  %11 = load i32*, i32** %data, align 8, !dbg !65
  %12 = bitcast i32* %11 to i8*, !dbg !65
  call void @free(i8* noundef %12), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare void @printIntLine(i32 noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* noundef null), !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 noundef %conv), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_good(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_bad(), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !95
  %0 = bitcast i8* %call to i32*, !dbg !96
  store i32* %0, i32** %data, align 8, !dbg !97
  %1 = load i32*, i32** %data, align 8, !dbg !98
  %cmp = icmp eq i32* %1, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !108
  store i64 0, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !112
  %cmp1 = icmp ult i64 %3, 10, !dbg !114
  br i1 %cmp1, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !118
  %5 = load i32, i32* %arrayidx, align 4, !dbg !118
  %6 = load i32*, i32** %data, align 8, !dbg !119
  %7 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !119
  store i32 %5, i32* %arrayidx2, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %8, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !127
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !127
  call void @printIntLine(i32 noundef %10), !dbg !128
  %11 = load i32*, i32** %data, align 8, !dbg !129
  %12 = bitcast i32* %11 to i8*, !dbg !129
  call void @free(i8* noundef %12), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 11, scope: !14)
!21 = !DILocation(line: 24, column: 10, scope: !14)
!22 = !DILocation(line: 26, column: 19, scope: !14)
!23 = !DILocation(line: 26, column: 12, scope: !14)
!24 = !DILocation(line: 26, column: 10, scope: !14)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !14)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 27, column: 23)
!31 = !DILocalVariable(name: "source", scope: !32, file: !15, line: 29, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 10)
!36 = !DILocation(line: 29, column: 13, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 30, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 31, baseType: !40)
!39 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !41, line: 94, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 30, column: 16, scope: !32)
!44 = !DILocation(line: 32, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !32, file: !15, line: 32, column: 9)
!46 = !DILocation(line: 32, column: 14, scope: !45)
!47 = !DILocation(line: 32, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !15, line: 32, column: 9)
!49 = !DILocation(line: 32, column: 23, scope: !48)
!50 = !DILocation(line: 32, column: 9, scope: !45)
!51 = !DILocation(line: 34, column: 30, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !15, line: 33, column: 9)
!53 = !DILocation(line: 34, column: 23, scope: !52)
!54 = !DILocation(line: 34, column: 13, scope: !52)
!55 = !DILocation(line: 34, column: 18, scope: !52)
!56 = !DILocation(line: 34, column: 21, scope: !52)
!57 = !DILocation(line: 35, column: 9, scope: !52)
!58 = !DILocation(line: 32, column: 30, scope: !48)
!59 = !DILocation(line: 32, column: 9, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 35, column: 9, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 36, column: 22, scope: !32)
!64 = !DILocation(line: 36, column: 9, scope: !32)
!65 = !DILocation(line: 37, column: 14, scope: !32)
!66 = !DILocation(line: 37, column: 9, scope: !32)
!67 = !DILocation(line: 39, column: 1, scope: !14)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_01_good", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!69 = !DILocation(line: 68, column: 5, scope: !68)
!70 = !DILocation(line: 69, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 81, type: !72, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!72 = !DISubroutineType(types: !73)
!73 = !{!4, !4, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !15, line: 81, type: !4)
!78 = !DILocation(line: 81, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !15, line: 81, type: !74)
!80 = !DILocation(line: 81, column: 27, scope: !71)
!81 = !DILocation(line: 84, column: 22, scope: !71)
!82 = !DILocation(line: 84, column: 12, scope: !71)
!83 = !DILocation(line: 84, column: 5, scope: !71)
!84 = !DILocation(line: 86, column: 5, scope: !71)
!85 = !DILocation(line: 87, column: 5, scope: !71)
!86 = !DILocation(line: 88, column: 5, scope: !71)
!87 = !DILocation(line: 91, column: 5, scope: !71)
!88 = !DILocation(line: 92, column: 5, scope: !71)
!89 = !DILocation(line: 93, column: 5, scope: !71)
!90 = !DILocation(line: 95, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 46, type: !16, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!92 = !DILocalVariable(name: "data", scope: !91, file: !15, line: 48, type: !3)
!93 = !DILocation(line: 48, column: 11, scope: !91)
!94 = !DILocation(line: 49, column: 10, scope: !91)
!95 = !DILocation(line: 51, column: 19, scope: !91)
!96 = !DILocation(line: 51, column: 12, scope: !91)
!97 = !DILocation(line: 51, column: 10, scope: !91)
!98 = !DILocation(line: 52, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !91, file: !15, line: 52, column: 9)
!100 = !DILocation(line: 52, column: 14, scope: !99)
!101 = !DILocation(line: 52, column: 9, scope: !91)
!102 = !DILocation(line: 52, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 52, column: 23)
!104 = !DILocalVariable(name: "source", scope: !105, file: !15, line: 54, type: !33)
!105 = distinct !DILexicalBlock(scope: !91, file: !15, line: 53, column: 5)
!106 = !DILocation(line: 54, column: 13, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !105, file: !15, line: 55, type: !38)
!108 = !DILocation(line: 55, column: 16, scope: !105)
!109 = !DILocation(line: 57, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !15, line: 57, column: 9)
!111 = !DILocation(line: 57, column: 14, scope: !110)
!112 = !DILocation(line: 57, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !15, line: 57, column: 9)
!114 = !DILocation(line: 57, column: 23, scope: !113)
!115 = !DILocation(line: 57, column: 9, scope: !110)
!116 = !DILocation(line: 59, column: 30, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 58, column: 9)
!118 = !DILocation(line: 59, column: 23, scope: !117)
!119 = !DILocation(line: 59, column: 13, scope: !117)
!120 = !DILocation(line: 59, column: 18, scope: !117)
!121 = !DILocation(line: 59, column: 21, scope: !117)
!122 = !DILocation(line: 60, column: 9, scope: !117)
!123 = !DILocation(line: 57, column: 30, scope: !113)
!124 = !DILocation(line: 57, column: 9, scope: !113)
!125 = distinct !{!125, !115, !126, !62}
!126 = !DILocation(line: 60, column: 9, scope: !110)
!127 = !DILocation(line: 61, column: 22, scope: !105)
!128 = !DILocation(line: 61, column: 9, scope: !105)
!129 = !DILocation(line: 62, column: 14, scope: !105)
!130 = !DILocation(line: 62, column: 9, scope: !105)
!131 = !DILocation(line: 64, column: 1, scope: !91)
