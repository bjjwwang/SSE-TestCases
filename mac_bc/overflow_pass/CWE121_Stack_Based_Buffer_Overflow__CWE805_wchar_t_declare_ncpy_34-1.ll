; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !36, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i32* %arraydecay, i32** %data, align 8, !dbg !42
  %0 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %1 = load i32*, i32** %data, align 8, !dbg !45
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !46
  store i32* %1, i32** %unionFirst, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !48, metadata !DIExpression()), !dbg !50
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !51
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !51
  store i32* %2, i32** %data1, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %call = call i32* @wmemset(i32* noundef %arraydecay2, i32 noundef 67, i64 noundef 99), !dbg !56
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx3, align 4, !dbg !58
  %3 = load i32*, i32** %data1, align 8, !dbg !59
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !60
  %call5 = call i32* @wcsncpy(i32* noundef %3, i32* noundef %arraydecay4, i64 noundef 99), !dbg !61
  %4 = load i32*, i32** %data1, align 8, !dbg !62
  %arrayidx6 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !62
  store i32 0, i32* %arrayidx6, align 4, !dbg !63
  %5 = load i32*, i32** %data1, align 8, !dbg !64
  call void @printWLine(i32* noundef %5), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcsncpy(i32* noundef, i32* noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* noundef null), !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 noundef %conv), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_good(), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_bad(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_unionType* %myUnion, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i32* %arraydecay, i32** %data, align 8, !dbg !100
  %0 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %1 = load i32*, i32** %data, align 8, !dbg !103
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !104
  store i32* %1, i32** %unionFirst, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !106, metadata !DIExpression()), !dbg !108
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_unionType* %myUnion to i32**, !dbg !109
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !109
  store i32* %2, i32** %data1, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !113
  %call = call i32* @wmemset(i32* noundef %arraydecay2, i32 noundef 67, i64 noundef 99), !dbg !114
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx3, align 4, !dbg !116
  %3 = load i32*, i32** %data1, align 8, !dbg !117
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !118
  %call5 = call i32* @wcsncpy(i32* noundef %3, i32* noundef %arraydecay4, i64 noundef 99), !dbg !119
  %4 = load i32*, i32** %data1, align 8, !dbg !120
  %arrayidx6 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !120
  store i32 0, i32* %arrayidx6, align 4, !dbg !121
  %5 = load i32*, i32** %data1, align 8, !dbg !122
  call void @printWLine(i32* noundef %5), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 31, column: 15, scope: !11)
!24 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_unionType", file: !12, line: 25, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !12, line: 23, baseType: !17, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !12, line: 24, baseType: !17, size: 64)
!30 = !DILocation(line: 32, column: 82, scope: !11)
!31 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 33, column: 13, scope: !11)
!36 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 34, column: 13, scope: !11)
!41 = !DILocation(line: 37, column: 12, scope: !11)
!42 = !DILocation(line: 37, column: 10, scope: !11)
!43 = !DILocation(line: 38, column: 5, scope: !11)
!44 = !DILocation(line: 38, column: 13, scope: !11)
!45 = !DILocation(line: 39, column: 26, scope: !11)
!46 = !DILocation(line: 39, column: 13, scope: !11)
!47 = !DILocation(line: 39, column: 24, scope: !11)
!48 = !DILocalVariable(name: "data", scope: !49, file: !12, line: 41, type: !17)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!50 = !DILocation(line: 41, column: 19, scope: !49)
!51 = !DILocation(line: 41, column: 34, scope: !49)
!52 = !DILocalVariable(name: "source", scope: !53, file: !12, line: 43, type: !37)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 42, column: 9)
!54 = !DILocation(line: 43, column: 21, scope: !53)
!55 = !DILocation(line: 44, column: 21, scope: !53)
!56 = !DILocation(line: 44, column: 13, scope: !53)
!57 = !DILocation(line: 45, column: 13, scope: !53)
!58 = !DILocation(line: 45, column: 27, scope: !53)
!59 = !DILocation(line: 47, column: 21, scope: !53)
!60 = !DILocation(line: 47, column: 27, scope: !53)
!61 = !DILocation(line: 47, column: 13, scope: !53)
!62 = !DILocation(line: 48, column: 13, scope: !53)
!63 = !DILocation(line: 48, column: 25, scope: !53)
!64 = !DILocation(line: 49, column: 24, scope: !53)
!65 = !DILocation(line: 49, column: 13, scope: !53)
!66 = !DILocation(line: 52, column: 1, scope: !11)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_34_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!68 = !DILocation(line: 85, column: 5, scope: !67)
!69 = !DILocation(line: 86, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !71, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!71 = !DISubroutineType(types: !72)
!72 = !{!22, !22, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !12, line: 97, type: !22)
!77 = !DILocation(line: 97, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !12, line: 97, type: !73)
!79 = !DILocation(line: 97, column: 27, scope: !70)
!80 = !DILocation(line: 100, column: 22, scope: !70)
!81 = !DILocation(line: 100, column: 12, scope: !70)
!82 = !DILocation(line: 100, column: 5, scope: !70)
!83 = !DILocation(line: 102, column: 5, scope: !70)
!84 = !DILocation(line: 103, column: 5, scope: !70)
!85 = !DILocation(line: 104, column: 5, scope: !70)
!86 = !DILocation(line: 107, column: 5, scope: !70)
!87 = !DILocation(line: 108, column: 5, scope: !70)
!88 = !DILocation(line: 109, column: 5, scope: !70)
!89 = !DILocation(line: 111, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 61, type: !17)
!92 = !DILocation(line: 61, column: 15, scope: !90)
!93 = !DILocalVariable(name: "myUnion", scope: !90, file: !12, line: 62, type: !25)
!94 = !DILocation(line: 62, column: 82, scope: !90)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !12, line: 63, type: !32)
!96 = !DILocation(line: 63, column: 13, scope: !90)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !12, line: 64, type: !37)
!98 = !DILocation(line: 64, column: 13, scope: !90)
!99 = !DILocation(line: 66, column: 12, scope: !90)
!100 = !DILocation(line: 66, column: 10, scope: !90)
!101 = !DILocation(line: 67, column: 5, scope: !90)
!102 = !DILocation(line: 67, column: 13, scope: !90)
!103 = !DILocation(line: 68, column: 26, scope: !90)
!104 = !DILocation(line: 68, column: 13, scope: !90)
!105 = !DILocation(line: 68, column: 24, scope: !90)
!106 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 70, type: !17)
!107 = distinct !DILexicalBlock(scope: !90, file: !12, line: 69, column: 5)
!108 = !DILocation(line: 70, column: 19, scope: !107)
!109 = !DILocation(line: 70, column: 34, scope: !107)
!110 = !DILocalVariable(name: "source", scope: !111, file: !12, line: 72, type: !37)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 71, column: 9)
!112 = !DILocation(line: 72, column: 21, scope: !111)
!113 = !DILocation(line: 73, column: 21, scope: !111)
!114 = !DILocation(line: 73, column: 13, scope: !111)
!115 = !DILocation(line: 74, column: 13, scope: !111)
!116 = !DILocation(line: 74, column: 27, scope: !111)
!117 = !DILocation(line: 76, column: 21, scope: !111)
!118 = !DILocation(line: 76, column: 27, scope: !111)
!119 = !DILocation(line: 76, column: 13, scope: !111)
!120 = !DILocation(line: 77, column: 13, scope: !111)
!121 = !DILocation(line: 77, column: 25, scope: !111)
!122 = !DILocation(line: 78, column: 24, scope: !111)
!123 = !DILocation(line: 78, column: 13, scope: !111)
!124 = !DILocation(line: 81, column: 1, scope: !90)
