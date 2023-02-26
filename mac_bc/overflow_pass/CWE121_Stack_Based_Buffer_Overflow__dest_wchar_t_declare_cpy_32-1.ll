; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !42
  %1 = load i32*, i32** %0, align 8, !dbg !43
  store i32* %1, i32** %data1, align 8, !dbg !41
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !44
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !56, metadata !DIExpression()), !dbg !58
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !59
  %call = call i32* @wmemset(i32* noundef %arraydecay3, i32 noundef 67, i64 noundef 99), !dbg !60
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx4, align 4, !dbg !62
  %7 = load i32*, i32** %data2, align 8, !dbg !63
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !64
  %call6 = call i32* @wcscpy(i32* noundef %7, i32* noundef %arraydecay5), !dbg !65
  %8 = load i32*, i32** %data2, align 8, !dbg !66
  call void @printWLine(i32* noundef %8), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcscpy(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_32_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* noundef null), !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 noundef %conv), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_32_good(), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_32_bad(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !95, metadata !DIExpression()), !dbg !96
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !97, metadata !DIExpression()), !dbg !98
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !103, metadata !DIExpression()), !dbg !105
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !106
  %1 = load i32*, i32** %0, align 8, !dbg !107
  store i32* %1, i32** %data1, align 8, !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay, i32** %data1, align 8, !dbg !109
  %2 = load i32*, i32** %data1, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  %3 = load i32*, i32** %data1, align 8, !dbg !112
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !113
  store i32* %3, i32** %4, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !115, metadata !DIExpression()), !dbg !117
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !118
  %6 = load i32*, i32** %5, align 8, !dbg !119
  store i32* %6, i32** %data2, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %call = call i32* @wmemset(i32* noundef %arraydecay3, i32 noundef 67, i64 noundef 99), !dbg !124
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx4, align 4, !dbg !126
  %7 = load i32*, i32** %data2, align 8, !dbg !127
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !128
  %call6 = call i32* @wcscpy(i32* noundef %7, i32* noundef %arraydecay5), !dbg !129
  %8 = load i32*, i32** %data2, align 8, !dbg !130
  call void @printWLine(i32* noundef %8), !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!24 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!26 = !DILocation(line: 26, column: 16, scope: !11)
!27 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !25)
!28 = !DILocation(line: 27, column: 16, scope: !11)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 28, column: 13, scope: !11)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 29, column: 13, scope: !11)
!39 = !DILocalVariable(name: "data", scope: !40, file: !12, line: 31, type: !17)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!41 = !DILocation(line: 31, column: 19, scope: !40)
!42 = !DILocation(line: 31, column: 27, scope: !40)
!43 = !DILocation(line: 31, column: 26, scope: !40)
!44 = !DILocation(line: 34, column: 16, scope: !40)
!45 = !DILocation(line: 34, column: 14, scope: !40)
!46 = !DILocation(line: 35, column: 9, scope: !40)
!47 = !DILocation(line: 35, column: 17, scope: !40)
!48 = !DILocation(line: 36, column: 21, scope: !40)
!49 = !DILocation(line: 36, column: 10, scope: !40)
!50 = !DILocation(line: 36, column: 19, scope: !40)
!51 = !DILocalVariable(name: "data", scope: !52, file: !12, line: 39, type: !17)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!53 = !DILocation(line: 39, column: 19, scope: !52)
!54 = !DILocation(line: 39, column: 27, scope: !52)
!55 = !DILocation(line: 39, column: 26, scope: !52)
!56 = !DILocalVariable(name: "source", scope: !57, file: !12, line: 41, type: !35)
!57 = distinct !DILexicalBlock(scope: !52, file: !12, line: 40, column: 9)
!58 = !DILocation(line: 41, column: 21, scope: !57)
!59 = !DILocation(line: 42, column: 21, scope: !57)
!60 = !DILocation(line: 42, column: 13, scope: !57)
!61 = !DILocation(line: 43, column: 13, scope: !57)
!62 = !DILocation(line: 43, column: 27, scope: !57)
!63 = !DILocation(line: 45, column: 20, scope: !57)
!64 = !DILocation(line: 45, column: 26, scope: !57)
!65 = !DILocation(line: 45, column: 13, scope: !57)
!66 = !DILocation(line: 46, column: 24, scope: !57)
!67 = !DILocation(line: 46, column: 13, scope: !57)
!68 = !DILocation(line: 49, column: 1, scope: !11)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_declare_cpy_32_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!70 = !DILocation(line: 85, column: 5, scope: !69)
!71 = !DILocation(line: 86, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !73, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!73 = !DISubroutineType(types: !74)
!74 = !{!22, !22, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 97, type: !22)
!79 = !DILocation(line: 97, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 97, type: !75)
!81 = !DILocation(line: 97, column: 27, scope: !72)
!82 = !DILocation(line: 100, column: 22, scope: !72)
!83 = !DILocation(line: 100, column: 12, scope: !72)
!84 = !DILocation(line: 100, column: 5, scope: !72)
!85 = !DILocation(line: 102, column: 5, scope: !72)
!86 = !DILocation(line: 103, column: 5, scope: !72)
!87 = !DILocation(line: 104, column: 5, scope: !72)
!88 = !DILocation(line: 107, column: 5, scope: !72)
!89 = !DILocation(line: 108, column: 5, scope: !72)
!90 = !DILocation(line: 109, column: 5, scope: !72)
!91 = !DILocation(line: 111, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 58, type: !17)
!94 = !DILocation(line: 58, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataPtr1", scope: !92, file: !12, line: 59, type: !25)
!96 = !DILocation(line: 59, column: 16, scope: !92)
!97 = !DILocalVariable(name: "dataPtr2", scope: !92, file: !12, line: 60, type: !25)
!98 = !DILocation(line: 60, column: 16, scope: !92)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !12, line: 61, type: !30)
!100 = !DILocation(line: 61, column: 13, scope: !92)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !12, line: 62, type: !35)
!102 = !DILocation(line: 62, column: 13, scope: !92)
!103 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 64, type: !17)
!104 = distinct !DILexicalBlock(scope: !92, file: !12, line: 63, column: 5)
!105 = !DILocation(line: 64, column: 19, scope: !104)
!106 = !DILocation(line: 64, column: 27, scope: !104)
!107 = !DILocation(line: 64, column: 26, scope: !104)
!108 = !DILocation(line: 66, column: 16, scope: !104)
!109 = !DILocation(line: 66, column: 14, scope: !104)
!110 = !DILocation(line: 67, column: 9, scope: !104)
!111 = !DILocation(line: 67, column: 17, scope: !104)
!112 = !DILocation(line: 68, column: 21, scope: !104)
!113 = !DILocation(line: 68, column: 10, scope: !104)
!114 = !DILocation(line: 68, column: 19, scope: !104)
!115 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 71, type: !17)
!116 = distinct !DILexicalBlock(scope: !92, file: !12, line: 70, column: 5)
!117 = !DILocation(line: 71, column: 19, scope: !116)
!118 = !DILocation(line: 71, column: 27, scope: !116)
!119 = !DILocation(line: 71, column: 26, scope: !116)
!120 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 73, type: !35)
!121 = distinct !DILexicalBlock(scope: !116, file: !12, line: 72, column: 9)
!122 = !DILocation(line: 73, column: 21, scope: !121)
!123 = !DILocation(line: 74, column: 21, scope: !121)
!124 = !DILocation(line: 74, column: 13, scope: !121)
!125 = !DILocation(line: 75, column: 13, scope: !121)
!126 = !DILocation(line: 75, column: 27, scope: !121)
!127 = !DILocation(line: 77, column: 20, scope: !121)
!128 = !DILocation(line: 77, column: 26, scope: !121)
!129 = !DILocation(line: 77, column: 13, scope: !121)
!130 = !DILocation(line: 78, column: 24, scope: !121)
!131 = !DILocation(line: 78, column: 13, scope: !121)
!132 = !DILocation(line: 81, column: 1, scope: !92)
