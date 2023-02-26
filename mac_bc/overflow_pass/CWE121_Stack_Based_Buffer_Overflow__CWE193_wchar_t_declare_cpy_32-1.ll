; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !42
  %1 = load i32*, i32** %0, align 8, !dbg !43
  store i32* %1, i32** %data1, align 8, !dbg !41
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !44
  store i32* %arraydecay, i32** %data1, align 8, !dbg !45
  %2 = load i32*, i32** %data1, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  %3 = load i32*, i32** %data1, align 8, !dbg !48
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !49
  store i32* %3, i32** %4, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !51, metadata !DIExpression()), !dbg !53
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !54
  %6 = load i32*, i32** %5, align 8, !dbg !55
  store i32* %6, i32** %data2, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !56, metadata !DIExpression()), !dbg !58
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32_bad.source to i8*), i64 44, i1 false), !dbg !58
  %8 = load i32*, i32** %data2, align 8, !dbg !59
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !60
  %call = call i32* @wcscpy(i32* noundef %8, i32* noundef %arraydecay3), !dbg !61
  %9 = load i32*, i32** %data2, align 8, !dbg !62
  call void @printWLine(i32* noundef %9), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32* @wcscpy(i32* noundef, i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* noundef null), !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 noundef %conv), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32_good(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32_bad(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !91, metadata !DIExpression()), !dbg !92
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !93, metadata !DIExpression()), !dbg !94
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !99, metadata !DIExpression()), !dbg !101
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !102
  %1 = load i32*, i32** %0, align 8, !dbg !103
  store i32* %1, i32** %data1, align 8, !dbg !101
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store i32* %arraydecay, i32** %data1, align 8, !dbg !105
  %2 = load i32*, i32** %data1, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %3 = load i32*, i32** %data1, align 8, !dbg !108
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !109
  store i32* %3, i32** %4, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !111, metadata !DIExpression()), !dbg !113
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !114
  %6 = load i32*, i32** %5, align 8, !dbg !115
  store i32* %6, i32** %data2, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !118
  %8 = load i32*, i32** %data2, align 8, !dbg !119
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !120
  %call = call i32* @wcscpy(i32* noundef %8, i32* noundef %arraydecay3), !dbg !121
  %9 = load i32*, i32** %data2, align 8, !dbg !122
  call void @printWLine(i32* noundef %9), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 30, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 31, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!26 = !DILocation(line: 31, column: 16, scope: !11)
!27 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 32, type: !25)
!28 = !DILocation(line: 32, column: 16, scope: !11)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 33, column: 13, scope: !11)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 34, column: 13, scope: !11)
!39 = !DILocalVariable(name: "data", scope: !40, file: !12, line: 36, type: !17)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!41 = !DILocation(line: 36, column: 19, scope: !40)
!42 = !DILocation(line: 36, column: 27, scope: !40)
!43 = !DILocation(line: 36, column: 26, scope: !40)
!44 = !DILocation(line: 39, column: 16, scope: !40)
!45 = !DILocation(line: 39, column: 14, scope: !40)
!46 = !DILocation(line: 40, column: 9, scope: !40)
!47 = !DILocation(line: 40, column: 17, scope: !40)
!48 = !DILocation(line: 41, column: 21, scope: !40)
!49 = !DILocation(line: 41, column: 10, scope: !40)
!50 = !DILocation(line: 41, column: 19, scope: !40)
!51 = !DILocalVariable(name: "data", scope: !52, file: !12, line: 44, type: !17)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!53 = !DILocation(line: 44, column: 19, scope: !52)
!54 = !DILocation(line: 44, column: 27, scope: !52)
!55 = !DILocation(line: 44, column: 26, scope: !52)
!56 = !DILocalVariable(name: "source", scope: !57, file: !12, line: 46, type: !35)
!57 = distinct !DILexicalBlock(scope: !52, file: !12, line: 45, column: 9)
!58 = !DILocation(line: 46, column: 21, scope: !57)
!59 = !DILocation(line: 48, column: 20, scope: !57)
!60 = !DILocation(line: 48, column: 26, scope: !57)
!61 = !DILocation(line: 48, column: 13, scope: !57)
!62 = !DILocation(line: 49, column: 24, scope: !57)
!63 = !DILocation(line: 49, column: 13, scope: !57)
!64 = !DILocation(line: 52, column: 1, scope: !11)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_32_good", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!66 = !DILocation(line: 87, column: 5, scope: !65)
!67 = !DILocation(line: 88, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !69, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!69 = !DISubroutineType(types: !70)
!70 = !{!22, !22, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 99, type: !22)
!75 = !DILocation(line: 99, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 99, type: !71)
!77 = !DILocation(line: 99, column: 27, scope: !68)
!78 = !DILocation(line: 102, column: 22, scope: !68)
!79 = !DILocation(line: 102, column: 12, scope: !68)
!80 = !DILocation(line: 102, column: 5, scope: !68)
!81 = !DILocation(line: 104, column: 5, scope: !68)
!82 = !DILocation(line: 105, column: 5, scope: !68)
!83 = !DILocation(line: 106, column: 5, scope: !68)
!84 = !DILocation(line: 109, column: 5, scope: !68)
!85 = !DILocation(line: 110, column: 5, scope: !68)
!86 = !DILocation(line: 111, column: 5, scope: !68)
!87 = !DILocation(line: 113, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 61, type: !17)
!90 = !DILocation(line: 61, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataPtr1", scope: !88, file: !12, line: 62, type: !25)
!92 = !DILocation(line: 62, column: 16, scope: !88)
!93 = !DILocalVariable(name: "dataPtr2", scope: !88, file: !12, line: 63, type: !25)
!94 = !DILocation(line: 63, column: 16, scope: !88)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !12, line: 64, type: !30)
!96 = !DILocation(line: 64, column: 13, scope: !88)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !12, line: 65, type: !35)
!98 = !DILocation(line: 65, column: 13, scope: !88)
!99 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 67, type: !17)
!100 = distinct !DILexicalBlock(scope: !88, file: !12, line: 66, column: 5)
!101 = !DILocation(line: 67, column: 19, scope: !100)
!102 = !DILocation(line: 67, column: 27, scope: !100)
!103 = !DILocation(line: 67, column: 26, scope: !100)
!104 = !DILocation(line: 70, column: 16, scope: !100)
!105 = !DILocation(line: 70, column: 14, scope: !100)
!106 = !DILocation(line: 71, column: 9, scope: !100)
!107 = !DILocation(line: 71, column: 17, scope: !100)
!108 = !DILocation(line: 72, column: 21, scope: !100)
!109 = !DILocation(line: 72, column: 10, scope: !100)
!110 = !DILocation(line: 72, column: 19, scope: !100)
!111 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 75, type: !17)
!112 = distinct !DILexicalBlock(scope: !88, file: !12, line: 74, column: 5)
!113 = !DILocation(line: 75, column: 19, scope: !112)
!114 = !DILocation(line: 75, column: 27, scope: !112)
!115 = !DILocation(line: 75, column: 26, scope: !112)
!116 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 77, type: !35)
!117 = distinct !DILexicalBlock(scope: !112, file: !12, line: 76, column: 9)
!118 = !DILocation(line: 77, column: 21, scope: !117)
!119 = !DILocation(line: 79, column: 20, scope: !117)
!120 = !DILocation(line: 79, column: 26, scope: !117)
!121 = !DILocation(line: 79, column: 13, scope: !117)
!122 = !DILocation(line: 80, column: 24, scope: !117)
!123 = !DILocation(line: 80, column: 13, scope: !117)
!124 = !DILocation(line: 83, column: 1, scope: !88)
