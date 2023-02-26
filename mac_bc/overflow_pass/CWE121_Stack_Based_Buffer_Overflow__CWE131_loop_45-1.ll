; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !9

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %data, align 8, !dbg !28
  %2 = load i32*, i32** %data, align 8, !dbg !29
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_badData, align 8, !dbg !30
  call void @badSink(), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_good() #0 !dbg !33 {
entry:
  call void @goodG2B(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call i64 @time(i64* noundef null), !dbg !46
  %conv = trunc i64 %call to i32, !dbg !47
  call void @srand(i32 noundef %conv), !dbg !48
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !49
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_good(), !dbg !50
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !51
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_bad(), !dbg !53
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !54
  ret i32 0, !dbg !55
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !56 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_badData, align 8, !dbg !59
  store i32* %0, i32** %data, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !60, metadata !DIExpression()), !dbg !65
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !65
  call void @llvm.dbg.declare(metadata i64* %i, metadata !66, metadata !DIExpression()), !dbg !72
  store i64 0, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !76
  %cmp = icmp ult i64 %2, 10, !dbg !78
  br i1 %cmp, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !82
  %4 = load i32, i32* %arrayidx, align 4, !dbg !82
  %5 = load i32*, i32** %data, align 8, !dbg !83
  %6 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !83
  store i32 %4, i32* %arrayidx1, align 4, !dbg !85
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !87
  %inc = add i64 %7, 1, !dbg !87
  store i64 %inc, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !92
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !92
  call void @printIntLine(i32 noundef %9), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i32* null, i32** %data, align 8, !dbg !98
  %0 = alloca i8, i64 40, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %data, align 8, !dbg !101
  %2 = load i32*, i32** %data, align 8, !dbg !102
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData, align 8, !dbg !103
  call void @goodG2BSink(), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData, align 8, !dbg !109
  store i32* %0, i32** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !118
  %cmp = icmp ult i64 %2, 10, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !124
  %4 = load i32, i32* %arrayidx, align 4, !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  %6 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !125
  store i32 %4, i32* %arrayidx1, align 4, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %7, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !133
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !133
  call void @printIntLine(i32 noundef %9), !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_badData", scope: !2, file: !11, line: 19, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData", scope: !2, file: !11, line: 20, type: !5, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_bad", scope: !11, file: !11, line: 39, type: !20, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 41, type: !5)
!24 = !DILocation(line: 41, column: 11, scope: !19)
!25 = !DILocation(line: 42, column: 10, scope: !19)
!26 = !DILocation(line: 44, column: 19, scope: !19)
!27 = !DILocation(line: 44, column: 12, scope: !19)
!28 = !DILocation(line: 44, column: 10, scope: !19)
!29 = !DILocation(line: 45, column: 66, scope: !19)
!30 = !DILocation(line: 45, column: 64, scope: !19)
!31 = !DILocation(line: 46, column: 5, scope: !19)
!32 = !DILocation(line: 47, column: 1, scope: !19)
!33 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_45_good", scope: !11, file: !11, line: 79, type: !20, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!34 = !DILocation(line: 81, column: 5, scope: !33)
!35 = !DILocation(line: 82, column: 1, scope: !33)
!36 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 93, type: !37, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!37 = !DISubroutineType(types: !38)
!38 = !{!6, !6, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !11, line: 93, type: !6)
!43 = !DILocation(line: 93, column: 14, scope: !36)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !11, line: 93, type: !39)
!45 = !DILocation(line: 93, column: 27, scope: !36)
!46 = !DILocation(line: 96, column: 22, scope: !36)
!47 = !DILocation(line: 96, column: 12, scope: !36)
!48 = !DILocation(line: 96, column: 5, scope: !36)
!49 = !DILocation(line: 98, column: 5, scope: !36)
!50 = !DILocation(line: 99, column: 5, scope: !36)
!51 = !DILocation(line: 100, column: 5, scope: !36)
!52 = !DILocation(line: 103, column: 5, scope: !36)
!53 = !DILocation(line: 104, column: 5, scope: !36)
!54 = !DILocation(line: 105, column: 5, scope: !36)
!55 = !DILocation(line: 107, column: 5, scope: !36)
!56 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!57 = !DILocalVariable(name: "data", scope: !56, file: !11, line: 26, type: !5)
!58 = !DILocation(line: 26, column: 11, scope: !56)
!59 = !DILocation(line: 26, column: 18, scope: !56)
!60 = !DILocalVariable(name: "source", scope: !61, file: !11, line: 28, type: !62)
!61 = distinct !DILexicalBlock(scope: !56, file: !11, line: 27, column: 5)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 320, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 10)
!65 = !DILocation(line: 28, column: 13, scope: !61)
!66 = !DILocalVariable(name: "i", scope: !61, file: !11, line: 29, type: !67)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !68, line: 31, baseType: !69)
!68 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !70, line: 94, baseType: !71)
!70 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!71 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!72 = !DILocation(line: 29, column: 16, scope: !61)
!73 = !DILocation(line: 31, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !61, file: !11, line: 31, column: 9)
!75 = !DILocation(line: 31, column: 14, scope: !74)
!76 = !DILocation(line: 31, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !11, line: 31, column: 9)
!78 = !DILocation(line: 31, column: 23, scope: !77)
!79 = !DILocation(line: 31, column: 9, scope: !74)
!80 = !DILocation(line: 33, column: 30, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !11, line: 32, column: 9)
!82 = !DILocation(line: 33, column: 23, scope: !81)
!83 = !DILocation(line: 33, column: 13, scope: !81)
!84 = !DILocation(line: 33, column: 18, scope: !81)
!85 = !DILocation(line: 33, column: 21, scope: !81)
!86 = !DILocation(line: 34, column: 9, scope: !81)
!87 = !DILocation(line: 31, column: 30, scope: !77)
!88 = !DILocation(line: 31, column: 9, scope: !77)
!89 = distinct !{!89, !79, !90, !91}
!90 = !DILocation(line: 34, column: 9, scope: !74)
!91 = !{!"llvm.loop.mustprogress"}
!92 = !DILocation(line: 35, column: 22, scope: !61)
!93 = !DILocation(line: 35, column: 9, scope: !61)
!94 = !DILocation(line: 37, column: 1, scope: !56)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 69, type: !20, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!96 = !DILocalVariable(name: "data", scope: !95, file: !11, line: 71, type: !5)
!97 = !DILocation(line: 71, column: 11, scope: !95)
!98 = !DILocation(line: 72, column: 10, scope: !95)
!99 = !DILocation(line: 74, column: 19, scope: !95)
!100 = !DILocation(line: 74, column: 12, scope: !95)
!101 = !DILocation(line: 74, column: 10, scope: !95)
!102 = !DILocation(line: 75, column: 70, scope: !95)
!103 = !DILocation(line: 75, column: 68, scope: !95)
!104 = !DILocation(line: 76, column: 5, scope: !95)
!105 = !DILocation(line: 77, column: 1, scope: !95)
!106 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 54, type: !20, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!107 = !DILocalVariable(name: "data", scope: !106, file: !11, line: 56, type: !5)
!108 = !DILocation(line: 56, column: 11, scope: !106)
!109 = !DILocation(line: 56, column: 18, scope: !106)
!110 = !DILocalVariable(name: "source", scope: !111, file: !11, line: 58, type: !62)
!111 = distinct !DILexicalBlock(scope: !106, file: !11, line: 57, column: 5)
!112 = !DILocation(line: 58, column: 13, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !111, file: !11, line: 59, type: !67)
!114 = !DILocation(line: 59, column: 16, scope: !111)
!115 = !DILocation(line: 61, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !11, line: 61, column: 9)
!117 = !DILocation(line: 61, column: 14, scope: !116)
!118 = !DILocation(line: 61, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !11, line: 61, column: 9)
!120 = !DILocation(line: 61, column: 23, scope: !119)
!121 = !DILocation(line: 61, column: 9, scope: !116)
!122 = !DILocation(line: 63, column: 30, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !11, line: 62, column: 9)
!124 = !DILocation(line: 63, column: 23, scope: !123)
!125 = !DILocation(line: 63, column: 13, scope: !123)
!126 = !DILocation(line: 63, column: 18, scope: !123)
!127 = !DILocation(line: 63, column: 21, scope: !123)
!128 = !DILocation(line: 64, column: 9, scope: !123)
!129 = !DILocation(line: 61, column: 30, scope: !119)
!130 = !DILocation(line: 61, column: 9, scope: !119)
!131 = distinct !{!131, !121, !132, !91}
!132 = !DILocation(line: 64, column: 9, scope: !116)
!133 = !DILocation(line: 65, column: 22, scope: !111)
!134 = !DILocation(line: 65, column: 9, scope: !111)
!135 = !DILocation(line: 67, column: 1, scope: !106)
