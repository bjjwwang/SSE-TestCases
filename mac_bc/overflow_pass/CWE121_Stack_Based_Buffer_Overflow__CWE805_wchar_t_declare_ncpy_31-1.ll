; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !38, metadata !DIExpression()), !dbg !40
  %1 = load i32*, i32** %data, align 8, !dbg !41
  store i32* %1, i32** %dataCopy, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !42, metadata !DIExpression()), !dbg !43
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !44
  store i32* %2, i32** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i32* @wmemset(i32* noundef %arraydecay2, i32 noundef 67, i64 noundef 99), !dbg !49
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx3, align 4, !dbg !51
  %3 = load i32*, i32** %data1, align 8, !dbg !52
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call5 = call i32* @wcsncpy(i32* noundef %3, i32* noundef %arraydecay4, i64 noundef 99), !dbg !54
  %4 = load i32*, i32** %data1, align 8, !dbg !55
  %arrayidx6 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !55
  store i32 0, i32* %arrayidx6, align 4, !dbg !56
  %5 = load i32*, i32** %data1, align 8, !dbg !57
  call void @printWLine(i32* noundef %5), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcsncpy(i32* noundef, i32* noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* noundef null), !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 noundef %conv), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_good(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_bad(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !90
  store i32* %arraydecay, i32** %data, align 8, !dbg !91
  %0 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !94, metadata !DIExpression()), !dbg !96
  %1 = load i32*, i32** %data, align 8, !dbg !97
  store i32* %1, i32** %dataCopy, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !98, metadata !DIExpression()), !dbg !99
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !100
  store i32* %2, i32** %data1, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !104
  %call = call i32* @wmemset(i32* noundef %arraydecay2, i32 noundef 67, i64 noundef 99), !dbg !105
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx3, align 4, !dbg !107
  %3 = load i32*, i32** %data1, align 8, !dbg !108
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %call5 = call i32* @wcsncpy(i32* noundef %3, i32* noundef %arraydecay4, i64 noundef 99), !dbg !110
  %4 = load i32*, i32** %data1, align 8, !dbg !111
  %arrayidx6 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !111
  store i32 0, i32* %arrayidx6, align 4, !dbg !112
  %5 = load i32*, i32** %data1, align 8, !dbg !113
  call void @printWLine(i32* noundef %5), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 30, column: 12, scope: !11)
!35 = !DILocation(line: 30, column: 10, scope: !11)
!36 = !DILocation(line: 31, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 13, scope: !11)
!38 = !DILocalVariable(name: "dataCopy", scope: !39, file: !12, line: 33, type: !17)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!40 = !DILocation(line: 33, column: 19, scope: !39)
!41 = !DILocation(line: 33, column: 30, scope: !39)
!42 = !DILocalVariable(name: "data", scope: !39, file: !12, line: 34, type: !17)
!43 = !DILocation(line: 34, column: 19, scope: !39)
!44 = !DILocation(line: 34, column: 26, scope: !39)
!45 = !DILocalVariable(name: "source", scope: !46, file: !12, line: 36, type: !30)
!46 = distinct !DILexicalBlock(scope: !39, file: !12, line: 35, column: 9)
!47 = !DILocation(line: 36, column: 21, scope: !46)
!48 = !DILocation(line: 37, column: 21, scope: !46)
!49 = !DILocation(line: 37, column: 13, scope: !46)
!50 = !DILocation(line: 38, column: 13, scope: !46)
!51 = !DILocation(line: 38, column: 27, scope: !46)
!52 = !DILocation(line: 40, column: 21, scope: !46)
!53 = !DILocation(line: 40, column: 27, scope: !46)
!54 = !DILocation(line: 40, column: 13, scope: !46)
!55 = !DILocation(line: 41, column: 13, scope: !46)
!56 = !DILocation(line: 41, column: 25, scope: !46)
!57 = !DILocation(line: 42, column: 24, scope: !46)
!58 = !DILocation(line: 42, column: 13, scope: !46)
!59 = !DILocation(line: 45, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!61 = !DILocation(line: 77, column: 5, scope: !60)
!62 = !DILocation(line: 78, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !64, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!64 = !DISubroutineType(types: !65)
!65 = !{!22, !22, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 89, type: !22)
!70 = !DILocation(line: 89, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 89, type: !66)
!72 = !DILocation(line: 89, column: 27, scope: !63)
!73 = !DILocation(line: 92, column: 22, scope: !63)
!74 = !DILocation(line: 92, column: 12, scope: !63)
!75 = !DILocation(line: 92, column: 5, scope: !63)
!76 = !DILocation(line: 94, column: 5, scope: !63)
!77 = !DILocation(line: 95, column: 5, scope: !63)
!78 = !DILocation(line: 96, column: 5, scope: !63)
!79 = !DILocation(line: 99, column: 5, scope: !63)
!80 = !DILocation(line: 100, column: 5, scope: !63)
!81 = !DILocation(line: 101, column: 5, scope: !63)
!82 = !DILocation(line: 103, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 54, type: !17)
!85 = !DILocation(line: 54, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 55, type: !25)
!87 = !DILocation(line: 55, column: 13, scope: !83)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 56, type: !30)
!89 = !DILocation(line: 56, column: 13, scope: !83)
!90 = !DILocation(line: 58, column: 12, scope: !83)
!91 = !DILocation(line: 58, column: 10, scope: !83)
!92 = !DILocation(line: 59, column: 5, scope: !83)
!93 = !DILocation(line: 59, column: 13, scope: !83)
!94 = !DILocalVariable(name: "dataCopy", scope: !95, file: !12, line: 61, type: !17)
!95 = distinct !DILexicalBlock(scope: !83, file: !12, line: 60, column: 5)
!96 = !DILocation(line: 61, column: 19, scope: !95)
!97 = !DILocation(line: 61, column: 30, scope: !95)
!98 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 62, type: !17)
!99 = !DILocation(line: 62, column: 19, scope: !95)
!100 = !DILocation(line: 62, column: 26, scope: !95)
!101 = !DILocalVariable(name: "source", scope: !102, file: !12, line: 64, type: !30)
!102 = distinct !DILexicalBlock(scope: !95, file: !12, line: 63, column: 9)
!103 = !DILocation(line: 64, column: 21, scope: !102)
!104 = !DILocation(line: 65, column: 21, scope: !102)
!105 = !DILocation(line: 65, column: 13, scope: !102)
!106 = !DILocation(line: 66, column: 13, scope: !102)
!107 = !DILocation(line: 66, column: 27, scope: !102)
!108 = !DILocation(line: 68, column: 21, scope: !102)
!109 = !DILocation(line: 68, column: 27, scope: !102)
!110 = !DILocation(line: 68, column: 13, scope: !102)
!111 = !DILocation(line: 69, column: 13, scope: !102)
!112 = !DILocation(line: 69, column: 25, scope: !102)
!113 = !DILocation(line: 70, column: 24, scope: !102)
!114 = !DILocation(line: 70, column: 13, scope: !102)
!115 = !DILocation(line: 73, column: 1, scope: !83)
