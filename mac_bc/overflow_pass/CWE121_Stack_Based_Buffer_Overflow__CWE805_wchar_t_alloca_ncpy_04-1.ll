; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_04_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx1, align 4, !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call3 = call i32* @wcsncpy(i32* noundef %6, i32* noundef %arraydecay2, i64 noundef 99), !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !51
  store i32 0, i32* %arrayidx4, align 4, !dbg !52
  %8 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* noundef %8), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcsncpy(i32* noundef, i32* noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_04_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* noundef null), !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 noundef %conv), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_04_good(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_04_bad(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 200, align 16, !dbg !85
  %1 = bitcast i8* %0 to i32*, !dbg !86
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %2 = alloca i8, i64 400, align 16, !dbg !89
  %3 = bitcast i8* %2 to i32*, !dbg !90
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !88
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !91
  store i32* %4, i32** %data, align 8, !dbg !94
  %5 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !101
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx1, align 4, !dbg !103
  %6 = load i32*, i32** %data, align 8, !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %call3 = call i32* @wcsncpy(i32* noundef %6, i32* noundef %arraydecay2, i64 noundef 99), !dbg !106
  %7 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !107
  store i32 0, i32* %arrayidx4, align 4, !dbg !108
  %8 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* noundef %8), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = alloca i8, i64 200, align 16, !dbg !117
  %1 = bitcast i8* %0 to i32*, !dbg !118
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %2 = alloca i8, i64 400, align 16, !dbg !121
  %3 = bitcast i8* %2 to i32*, !dbg !122
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !120
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !123
  store i32* %4, i32** %data, align 8, !dbg !126
  %5 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !132
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !133
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx1, align 4, !dbg !135
  %6 = load i32*, i32** %data, align 8, !dbg !136
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !137
  %call3 = call i32* @wcsncpy(i32* noundef %6, i32* noundef %arraydecay2, i64 noundef 99), !dbg !138
  %7 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !139
  store i32 0, i32* %arrayidx4, align 4, !dbg !140
  %8 = load i32*, i32** %data, align 8, !dbg !141
  call void @printWLine(i32* noundef %8), !dbg !142
  ret void, !dbg !143
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_04_bad", scope: !18, file: !18, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 32, type: !3)
!23 = !DILocation(line: 32, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 33, type: !3)
!25 = !DILocation(line: 33, column: 15, scope: !17)
!26 = !DILocation(line: 33, column: 42, scope: !17)
!27 = !DILocation(line: 33, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 34, type: !3)
!29 = !DILocation(line: 34, column: 15, scope: !17)
!30 = !DILocation(line: 34, column: 43, scope: !17)
!31 = !DILocation(line: 34, column: 32, scope: !17)
!32 = !DILocation(line: 39, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !18, line: 36, column: 5)
!34 = distinct !DILexicalBlock(scope: !17, file: !18, line: 35, column: 8)
!35 = !DILocation(line: 39, column: 14, scope: !33)
!36 = !DILocation(line: 40, column: 9, scope: !33)
!37 = !DILocation(line: 40, column: 17, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !18, line: 43, type: !40)
!39 = distinct !DILexicalBlock(scope: !17, file: !18, line: 42, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 43, column: 17, scope: !39)
!44 = !DILocation(line: 44, column: 17, scope: !39)
!45 = !DILocation(line: 44, column: 9, scope: !39)
!46 = !DILocation(line: 45, column: 9, scope: !39)
!47 = !DILocation(line: 45, column: 23, scope: !39)
!48 = !DILocation(line: 47, column: 17, scope: !39)
!49 = !DILocation(line: 47, column: 23, scope: !39)
!50 = !DILocation(line: 47, column: 9, scope: !39)
!51 = !DILocation(line: 48, column: 9, scope: !39)
!52 = !DILocation(line: 48, column: 21, scope: !39)
!53 = !DILocation(line: 49, column: 20, scope: !39)
!54 = !DILocation(line: 49, column: 9, scope: !39)
!55 = !DILocation(line: 51, column: 1, scope: !17)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_04_good", scope: !18, file: !18, line: 108, type: !19, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!57 = !DILocation(line: 110, column: 5, scope: !56)
!58 = !DILocation(line: 111, column: 5, scope: !56)
!59 = !DILocation(line: 112, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 124, type: !61, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!61 = !DISubroutineType(types: !62)
!62 = !{!8, !8, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !18, line: 124, type: !8)
!67 = !DILocation(line: 124, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !18, line: 124, type: !63)
!69 = !DILocation(line: 124, column: 27, scope: !60)
!70 = !DILocation(line: 127, column: 22, scope: !60)
!71 = !DILocation(line: 127, column: 12, scope: !60)
!72 = !DILocation(line: 127, column: 5, scope: !60)
!73 = !DILocation(line: 129, column: 5, scope: !60)
!74 = !DILocation(line: 130, column: 5, scope: !60)
!75 = !DILocation(line: 131, column: 5, scope: !60)
!76 = !DILocation(line: 134, column: 5, scope: !60)
!77 = !DILocation(line: 135, column: 5, scope: !60)
!78 = !DILocation(line: 136, column: 5, scope: !60)
!79 = !DILocation(line: 138, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!81 = !DILocalVariable(name: "data", scope: !80, file: !18, line: 60, type: !3)
!82 = !DILocation(line: 60, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !18, line: 61, type: !3)
!84 = !DILocation(line: 61, column: 15, scope: !80)
!85 = !DILocation(line: 61, column: 42, scope: !80)
!86 = !DILocation(line: 61, column: 31, scope: !80)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !18, line: 62, type: !3)
!88 = !DILocation(line: 62, column: 15, scope: !80)
!89 = !DILocation(line: 62, column: 43, scope: !80)
!90 = !DILocation(line: 62, column: 32, scope: !80)
!91 = !DILocation(line: 71, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !18, line: 69, column: 5)
!93 = distinct !DILexicalBlock(scope: !80, file: !18, line: 63, column: 8)
!94 = !DILocation(line: 71, column: 14, scope: !92)
!95 = !DILocation(line: 72, column: 9, scope: !92)
!96 = !DILocation(line: 72, column: 17, scope: !92)
!97 = !DILocalVariable(name: "source", scope: !98, file: !18, line: 75, type: !40)
!98 = distinct !DILexicalBlock(scope: !80, file: !18, line: 74, column: 5)
!99 = !DILocation(line: 75, column: 17, scope: !98)
!100 = !DILocation(line: 76, column: 17, scope: !98)
!101 = !DILocation(line: 76, column: 9, scope: !98)
!102 = !DILocation(line: 77, column: 9, scope: !98)
!103 = !DILocation(line: 77, column: 23, scope: !98)
!104 = !DILocation(line: 79, column: 17, scope: !98)
!105 = !DILocation(line: 79, column: 23, scope: !98)
!106 = !DILocation(line: 79, column: 9, scope: !98)
!107 = !DILocation(line: 80, column: 9, scope: !98)
!108 = !DILocation(line: 80, column: 21, scope: !98)
!109 = !DILocation(line: 81, column: 20, scope: !98)
!110 = !DILocation(line: 81, column: 9, scope: !98)
!111 = !DILocation(line: 83, column: 1, scope: !80)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 86, type: !19, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!113 = !DILocalVariable(name: "data", scope: !112, file: !18, line: 88, type: !3)
!114 = !DILocation(line: 88, column: 15, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !18, line: 89, type: !3)
!116 = !DILocation(line: 89, column: 15, scope: !112)
!117 = !DILocation(line: 89, column: 42, scope: !112)
!118 = !DILocation(line: 89, column: 31, scope: !112)
!119 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !18, line: 90, type: !3)
!120 = !DILocation(line: 90, column: 15, scope: !112)
!121 = !DILocation(line: 90, column: 43, scope: !112)
!122 = !DILocation(line: 90, column: 32, scope: !112)
!123 = !DILocation(line: 94, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !125, file: !18, line: 92, column: 5)
!125 = distinct !DILexicalBlock(scope: !112, file: !18, line: 91, column: 8)
!126 = !DILocation(line: 94, column: 14, scope: !124)
!127 = !DILocation(line: 95, column: 9, scope: !124)
!128 = !DILocation(line: 95, column: 17, scope: !124)
!129 = !DILocalVariable(name: "source", scope: !130, file: !18, line: 98, type: !40)
!130 = distinct !DILexicalBlock(scope: !112, file: !18, line: 97, column: 5)
!131 = !DILocation(line: 98, column: 17, scope: !130)
!132 = !DILocation(line: 99, column: 17, scope: !130)
!133 = !DILocation(line: 99, column: 9, scope: !130)
!134 = !DILocation(line: 100, column: 9, scope: !130)
!135 = !DILocation(line: 100, column: 23, scope: !130)
!136 = !DILocation(line: 102, column: 17, scope: !130)
!137 = !DILocation(line: 102, column: 23, scope: !130)
!138 = !DILocation(line: 102, column: 9, scope: !130)
!139 = !DILocation(line: 103, column: 9, scope: !130)
!140 = !DILocation(line: 103, column: 21, scope: !130)
!141 = !DILocation(line: 104, column: 20, scope: !130)
!142 = !DILocation(line: 104, column: 9, scope: !130)
!143 = !DILocation(line: 106, column: 1, scope: !112)
