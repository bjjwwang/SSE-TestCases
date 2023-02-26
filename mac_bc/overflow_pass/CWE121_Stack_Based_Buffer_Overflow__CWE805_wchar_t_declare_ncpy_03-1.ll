; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx2, align 4, !dbg !46
  %1 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call4 = call i32* @wcsncpy(i32* noundef %1, i32* noundef %arraydecay3, i64 noundef 99), !dbg !49
  %2 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx5 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !50
  store i32 0, i32* %arrayidx5, align 4, !dbg !51
  %3 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* noundef %3), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcsncpy(i32* noundef, i32* noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !86
  store i32* %arraydecay, i32** %data, align 8, !dbg !89
  %0 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !95
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !96
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx2, align 4, !dbg !98
  %1 = load i32*, i32** %data, align 8, !dbg !99
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %call4 = call i32* @wcsncpy(i32* noundef %1, i32* noundef %arraydecay3, i64 noundef 99), !dbg !101
  %2 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx5 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !102
  store i32 0, i32* %arrayidx5, align 4, !dbg !103
  %3 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* noundef %3), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i32* %arraydecay, i32** %data, align 8, !dbg !117
  %0 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !124
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx2, align 4, !dbg !126
  %1 = load i32*, i32** %data, align 8, !dbg !127
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !128
  %call4 = call i32* @wcsncpy(i32* noundef %1, i32* noundef %arraydecay3, i64 noundef 99), !dbg !129
  %2 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx5 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !130
  store i32 0, i32* %arrayidx5, align 4, !dbg !131
  %3 = load i32*, i32** %data, align 8, !dbg !132
  call void @printWLine(i32* noundef %3), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 25, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 13, scope: !11)
!34 = !DILocation(line: 32, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !12, line: 29, column: 5)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!37 = !DILocation(line: 32, column: 14, scope: !35)
!38 = !DILocation(line: 33, column: 9, scope: !35)
!39 = !DILocation(line: 33, column: 17, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 36, type: !30)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!42 = !DILocation(line: 36, column: 17, scope: !41)
!43 = !DILocation(line: 37, column: 17, scope: !41)
!44 = !DILocation(line: 37, column: 9, scope: !41)
!45 = !DILocation(line: 38, column: 9, scope: !41)
!46 = !DILocation(line: 38, column: 23, scope: !41)
!47 = !DILocation(line: 40, column: 17, scope: !41)
!48 = !DILocation(line: 40, column: 23, scope: !41)
!49 = !DILocation(line: 40, column: 9, scope: !41)
!50 = !DILocation(line: 41, column: 9, scope: !41)
!51 = !DILocation(line: 41, column: 21, scope: !41)
!52 = !DILocation(line: 42, column: 20, scope: !41)
!53 = !DILocation(line: 42, column: 9, scope: !41)
!54 = !DILocation(line: 44, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!56 = !DILocation(line: 103, column: 5, scope: !55)
!57 = !DILocation(line: 104, column: 5, scope: !55)
!58 = !DILocation(line: 105, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !60, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!60 = !DISubroutineType(types: !61)
!61 = !{!22, !22, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 117, type: !22)
!66 = !DILocation(line: 117, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 117, type: !62)
!68 = !DILocation(line: 117, column: 27, scope: !59)
!69 = !DILocation(line: 120, column: 22, scope: !59)
!70 = !DILocation(line: 120, column: 12, scope: !59)
!71 = !DILocation(line: 120, column: 5, scope: !59)
!72 = !DILocation(line: 122, column: 5, scope: !59)
!73 = !DILocation(line: 123, column: 5, scope: !59)
!74 = !DILocation(line: 124, column: 5, scope: !59)
!75 = !DILocation(line: 127, column: 5, scope: !59)
!76 = !DILocation(line: 128, column: 5, scope: !59)
!77 = !DILocation(line: 129, column: 5, scope: !59)
!78 = !DILocation(line: 131, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 53, type: !17)
!81 = !DILocation(line: 53, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !12, line: 54, type: !25)
!83 = !DILocation(line: 54, column: 13, scope: !79)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !12, line: 55, type: !30)
!85 = !DILocation(line: 55, column: 13, scope: !79)
!86 = !DILocation(line: 64, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !88, file: !12, line: 62, column: 5)
!88 = distinct !DILexicalBlock(scope: !79, file: !12, line: 56, column: 8)
!89 = !DILocation(line: 64, column: 14, scope: !87)
!90 = !DILocation(line: 65, column: 9, scope: !87)
!91 = !DILocation(line: 65, column: 17, scope: !87)
!92 = !DILocalVariable(name: "source", scope: !93, file: !12, line: 68, type: !30)
!93 = distinct !DILexicalBlock(scope: !79, file: !12, line: 67, column: 5)
!94 = !DILocation(line: 68, column: 17, scope: !93)
!95 = !DILocation(line: 69, column: 17, scope: !93)
!96 = !DILocation(line: 69, column: 9, scope: !93)
!97 = !DILocation(line: 70, column: 9, scope: !93)
!98 = !DILocation(line: 70, column: 23, scope: !93)
!99 = !DILocation(line: 72, column: 17, scope: !93)
!100 = !DILocation(line: 72, column: 23, scope: !93)
!101 = !DILocation(line: 72, column: 9, scope: !93)
!102 = !DILocation(line: 73, column: 9, scope: !93)
!103 = !DILocation(line: 73, column: 21, scope: !93)
!104 = !DILocation(line: 74, column: 20, scope: !93)
!105 = !DILocation(line: 74, column: 9, scope: !93)
!106 = !DILocation(line: 76, column: 1, scope: !79)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 81, type: !17)
!109 = !DILocation(line: 81, column: 15, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !12, line: 82, type: !25)
!111 = !DILocation(line: 82, column: 13, scope: !107)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !12, line: 83, type: !30)
!113 = !DILocation(line: 83, column: 13, scope: !107)
!114 = !DILocation(line: 87, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !12, line: 85, column: 5)
!116 = distinct !DILexicalBlock(scope: !107, file: !12, line: 84, column: 8)
!117 = !DILocation(line: 87, column: 14, scope: !115)
!118 = !DILocation(line: 88, column: 9, scope: !115)
!119 = !DILocation(line: 88, column: 17, scope: !115)
!120 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 91, type: !30)
!121 = distinct !DILexicalBlock(scope: !107, file: !12, line: 90, column: 5)
!122 = !DILocation(line: 91, column: 17, scope: !121)
!123 = !DILocation(line: 92, column: 17, scope: !121)
!124 = !DILocation(line: 92, column: 9, scope: !121)
!125 = !DILocation(line: 93, column: 9, scope: !121)
!126 = !DILocation(line: 93, column: 23, scope: !121)
!127 = !DILocation(line: 95, column: 17, scope: !121)
!128 = !DILocation(line: 95, column: 23, scope: !121)
!129 = !DILocation(line: 95, column: 9, scope: !121)
!130 = !DILocation(line: 96, column: 9, scope: !121)
!131 = !DILocation(line: 96, column: 21, scope: !121)
!132 = !DILocation(line: 97, column: 20, scope: !121)
!133 = !DILocation(line: 97, column: 9, scope: !121)
!134 = !DILocation(line: 99, column: 1, scope: !107)
