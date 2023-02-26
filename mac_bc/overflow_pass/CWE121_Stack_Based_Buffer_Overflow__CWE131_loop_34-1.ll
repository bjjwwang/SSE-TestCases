; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = alloca i8, i64 10, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %data, align 8, !dbg !30
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !32
  store i32* %2, i32** %unionFirst, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !37
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !37
  store i32* %3, i32** %data1, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %5, 10, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !60
  %7 = load i32, i32* %arrayidx, align 4, !dbg !60
  %8 = load i32*, i32** %data1, align 8, !dbg !61
  %9 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !61
  store i32 %7, i32* %arrayidx2, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %10, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !70
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !70
  call void @printIntLine(i32 noundef %12), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* noundef null), !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 noundef %conv), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_good(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_bad(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion, metadata !99, metadata !DIExpression()), !dbg !100
  store i32* null, i32** %data, align 8, !dbg !101
  %0 = alloca i8, i64 40, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %data, align 8, !dbg !104
  %2 = load i32*, i32** %data, align 8, !dbg !105
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !106
  store i32* %2, i32** %unionFirst, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !108, metadata !DIExpression()), !dbg !110
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !111
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !111
  store i32* %3, i32** %data1, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !120
  %cmp = icmp ult i64 %5, 10, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !126
  %7 = load i32, i32* %arrayidx, align 4, !dbg !126
  %8 = load i32*, i32** %data1, align 8, !dbg !127
  %9 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !127
  store i32 %7, i32* %arrayidx2, align 4, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %10, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !135
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !135
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !135
  call void @printIntLine(i32 noundef %12), !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_bad", scope: !14, file: !14, line: 27, type: !15, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 29, type: !3)
!19 = !DILocation(line: 29, column: 11, scope: !13)
!20 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 30, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_unionType", file: !14, line: 23, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 19, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !14, line: 21, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !14, line: 22, baseType: !3, size: 64)
!26 = !DILocation(line: 30, column: 66, scope: !13)
!27 = !DILocation(line: 31, column: 10, scope: !13)
!28 = !DILocation(line: 33, column: 19, scope: !13)
!29 = !DILocation(line: 33, column: 12, scope: !13)
!30 = !DILocation(line: 33, column: 10, scope: !13)
!31 = !DILocation(line: 34, column: 26, scope: !13)
!32 = !DILocation(line: 34, column: 13, scope: !13)
!33 = !DILocation(line: 34, column: 24, scope: !13)
!34 = !DILocalVariable(name: "data", scope: !35, file: !14, line: 36, type: !3)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!36 = !DILocation(line: 36, column: 15, scope: !35)
!37 = !DILocation(line: 36, column: 30, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !14, line: 38, type: !40)
!39 = distinct !DILexicalBlock(scope: !35, file: !14, line: 37, column: 9)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 10)
!43 = !DILocation(line: 38, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !14, line: 39, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 31, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !48, line: 94, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 39, column: 20, scope: !39)
!51 = !DILocation(line: 41, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !39, file: !14, line: 41, column: 13)
!53 = !DILocation(line: 41, column: 18, scope: !52)
!54 = !DILocation(line: 41, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !14, line: 41, column: 13)
!56 = !DILocation(line: 41, column: 27, scope: !55)
!57 = !DILocation(line: 41, column: 13, scope: !52)
!58 = !DILocation(line: 43, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !14, line: 42, column: 13)
!60 = !DILocation(line: 43, column: 27, scope: !59)
!61 = !DILocation(line: 43, column: 17, scope: !59)
!62 = !DILocation(line: 43, column: 22, scope: !59)
!63 = !DILocation(line: 43, column: 25, scope: !59)
!64 = !DILocation(line: 44, column: 13, scope: !59)
!65 = !DILocation(line: 41, column: 34, scope: !55)
!66 = !DILocation(line: 41, column: 13, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 44, column: 13, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 45, column: 26, scope: !39)
!71 = !DILocation(line: 45, column: 13, scope: !39)
!72 = !DILocation(line: 48, column: 1, scope: !13)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_34_good", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!74 = !DILocation(line: 80, column: 5, scope: !73)
!75 = !DILocation(line: 81, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 92, type: !77, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DISubroutineType(types: !78)
!78 = !{!4, !4, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !14, line: 92, type: !4)
!83 = !DILocation(line: 92, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !14, line: 92, type: !79)
!85 = !DILocation(line: 92, column: 27, scope: !76)
!86 = !DILocation(line: 95, column: 22, scope: !76)
!87 = !DILocation(line: 95, column: 12, scope: !76)
!88 = !DILocation(line: 95, column: 5, scope: !76)
!89 = !DILocation(line: 97, column: 5, scope: !76)
!90 = !DILocation(line: 98, column: 5, scope: !76)
!91 = !DILocation(line: 99, column: 5, scope: !76)
!92 = !DILocation(line: 102, column: 5, scope: !76)
!93 = !DILocation(line: 103, column: 5, scope: !76)
!94 = !DILocation(line: 104, column: 5, scope: !76)
!95 = !DILocation(line: 106, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 57, type: !3)
!98 = !DILocation(line: 57, column: 11, scope: !96)
!99 = !DILocalVariable(name: "myUnion", scope: !96, file: !14, line: 58, type: !21)
!100 = !DILocation(line: 58, column: 66, scope: !96)
!101 = !DILocation(line: 59, column: 10, scope: !96)
!102 = !DILocation(line: 61, column: 19, scope: !96)
!103 = !DILocation(line: 61, column: 12, scope: !96)
!104 = !DILocation(line: 61, column: 10, scope: !96)
!105 = !DILocation(line: 62, column: 26, scope: !96)
!106 = !DILocation(line: 62, column: 13, scope: !96)
!107 = !DILocation(line: 62, column: 24, scope: !96)
!108 = !DILocalVariable(name: "data", scope: !109, file: !14, line: 64, type: !3)
!109 = distinct !DILexicalBlock(scope: !96, file: !14, line: 63, column: 5)
!110 = !DILocation(line: 64, column: 15, scope: !109)
!111 = !DILocation(line: 64, column: 30, scope: !109)
!112 = !DILocalVariable(name: "source", scope: !113, file: !14, line: 66, type: !40)
!113 = distinct !DILexicalBlock(scope: !109, file: !14, line: 65, column: 9)
!114 = !DILocation(line: 66, column: 17, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !113, file: !14, line: 67, type: !45)
!116 = !DILocation(line: 67, column: 20, scope: !113)
!117 = !DILocation(line: 69, column: 20, scope: !118)
!118 = distinct !DILexicalBlock(scope: !113, file: !14, line: 69, column: 13)
!119 = !DILocation(line: 69, column: 18, scope: !118)
!120 = !DILocation(line: 69, column: 25, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !14, line: 69, column: 13)
!122 = !DILocation(line: 69, column: 27, scope: !121)
!123 = !DILocation(line: 69, column: 13, scope: !118)
!124 = !DILocation(line: 71, column: 34, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !14, line: 70, column: 13)
!126 = !DILocation(line: 71, column: 27, scope: !125)
!127 = !DILocation(line: 71, column: 17, scope: !125)
!128 = !DILocation(line: 71, column: 22, scope: !125)
!129 = !DILocation(line: 71, column: 25, scope: !125)
!130 = !DILocation(line: 72, column: 13, scope: !125)
!131 = !DILocation(line: 69, column: 34, scope: !121)
!132 = !DILocation(line: 69, column: 13, scope: !121)
!133 = distinct !{!133, !123, !134, !69}
!134 = !DILocation(line: 72, column: 13, scope: !118)
!135 = !DILocation(line: 73, column: 26, scope: !113)
!136 = !DILocation(line: 73, column: 13, scope: !113)
!137 = !DILocation(line: 76, column: 1, scope: !96)
