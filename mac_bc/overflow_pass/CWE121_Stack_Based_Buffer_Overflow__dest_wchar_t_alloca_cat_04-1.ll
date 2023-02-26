; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_04_bad() #0 !dbg !17 {
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
  %call3 = call i32* @wcscat(i32* noundef %6, i32* noundef %arraydecay2), !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* noundef %7), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcscat(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_04_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* noundef null), !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 noundef %conv), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_04_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_04_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 200, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %2 = alloca i8, i64 400, align 16, !dbg !87
  %3 = bitcast i8* %2 to i32*, !dbg !88
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !86
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !89
  store i32* %4, i32** %data, align 8, !dbg !92
  %5 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !98
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !99
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !100
  store i32 0, i32* %arrayidx1, align 4, !dbg !101
  %6 = load i32*, i32** %data, align 8, !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !103
  %call3 = call i32* @wcscat(i32* noundef %6, i32* noundef %arraydecay2), !dbg !104
  %7 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* noundef %7), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 200, align 16, !dbg !113
  %1 = bitcast i8* %0 to i32*, !dbg !114
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = alloca i8, i64 400, align 16, !dbg !117
  %3 = bitcast i8* %2 to i32*, !dbg !118
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !116
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !119
  store i32* %4, i32** %data, align 8, !dbg !122
  %5 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !128
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !129
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx1, align 4, !dbg !131
  %6 = load i32*, i32** %data, align 8, !dbg !132
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !133
  %call3 = call i32* @wcscat(i32* noundef %6, i32* noundef %arraydecay2), !dbg !134
  %7 = load i32*, i32** %data, align 8, !dbg !135
  call void @printWLine(i32* noundef %7), !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_04_bad", scope: !18, file: !18, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!48 = !DILocation(line: 47, column: 16, scope: !39)
!49 = !DILocation(line: 47, column: 22, scope: !39)
!50 = !DILocation(line: 47, column: 9, scope: !39)
!51 = !DILocation(line: 48, column: 20, scope: !39)
!52 = !DILocation(line: 48, column: 9, scope: !39)
!53 = !DILocation(line: 50, column: 1, scope: !17)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_04_good", scope: !18, file: !18, line: 105, type: !19, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!55 = !DILocation(line: 107, column: 5, scope: !54)
!56 = !DILocation(line: 108, column: 5, scope: !54)
!57 = !DILocation(line: 109, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 121, type: !59, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!59 = !DISubroutineType(types: !60)
!60 = !{!8, !8, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !18, line: 121, type: !8)
!65 = !DILocation(line: 121, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !18, line: 121, type: !61)
!67 = !DILocation(line: 121, column: 27, scope: !58)
!68 = !DILocation(line: 124, column: 22, scope: !58)
!69 = !DILocation(line: 124, column: 12, scope: !58)
!70 = !DILocation(line: 124, column: 5, scope: !58)
!71 = !DILocation(line: 126, column: 5, scope: !58)
!72 = !DILocation(line: 127, column: 5, scope: !58)
!73 = !DILocation(line: 128, column: 5, scope: !58)
!74 = !DILocation(line: 131, column: 5, scope: !58)
!75 = !DILocation(line: 132, column: 5, scope: !58)
!76 = !DILocation(line: 133, column: 5, scope: !58)
!77 = !DILocation(line: 135, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 57, type: !19, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!79 = !DILocalVariable(name: "data", scope: !78, file: !18, line: 59, type: !3)
!80 = !DILocation(line: 59, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !18, line: 60, type: !3)
!82 = !DILocation(line: 60, column: 15, scope: !78)
!83 = !DILocation(line: 60, column: 42, scope: !78)
!84 = !DILocation(line: 60, column: 31, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !18, line: 61, type: !3)
!86 = !DILocation(line: 61, column: 15, scope: !78)
!87 = !DILocation(line: 61, column: 43, scope: !78)
!88 = !DILocation(line: 61, column: 32, scope: !78)
!89 = !DILocation(line: 70, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !91, file: !18, line: 68, column: 5)
!91 = distinct !DILexicalBlock(scope: !78, file: !18, line: 62, column: 8)
!92 = !DILocation(line: 70, column: 14, scope: !90)
!93 = !DILocation(line: 71, column: 9, scope: !90)
!94 = !DILocation(line: 71, column: 17, scope: !90)
!95 = !DILocalVariable(name: "source", scope: !96, file: !18, line: 74, type: !40)
!96 = distinct !DILexicalBlock(scope: !78, file: !18, line: 73, column: 5)
!97 = !DILocation(line: 74, column: 17, scope: !96)
!98 = !DILocation(line: 75, column: 17, scope: !96)
!99 = !DILocation(line: 75, column: 9, scope: !96)
!100 = !DILocation(line: 76, column: 9, scope: !96)
!101 = !DILocation(line: 76, column: 23, scope: !96)
!102 = !DILocation(line: 78, column: 16, scope: !96)
!103 = !DILocation(line: 78, column: 22, scope: !96)
!104 = !DILocation(line: 78, column: 9, scope: !96)
!105 = !DILocation(line: 79, column: 20, scope: !96)
!106 = !DILocation(line: 79, column: 9, scope: !96)
!107 = !DILocation(line: 81, column: 1, scope: !78)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 84, type: !19, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!109 = !DILocalVariable(name: "data", scope: !108, file: !18, line: 86, type: !3)
!110 = !DILocation(line: 86, column: 15, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !18, line: 87, type: !3)
!112 = !DILocation(line: 87, column: 15, scope: !108)
!113 = !DILocation(line: 87, column: 42, scope: !108)
!114 = !DILocation(line: 87, column: 31, scope: !108)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !18, line: 88, type: !3)
!116 = !DILocation(line: 88, column: 15, scope: !108)
!117 = !DILocation(line: 88, column: 43, scope: !108)
!118 = !DILocation(line: 88, column: 32, scope: !108)
!119 = !DILocation(line: 92, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !121, file: !18, line: 90, column: 5)
!121 = distinct !DILexicalBlock(scope: !108, file: !18, line: 89, column: 8)
!122 = !DILocation(line: 92, column: 14, scope: !120)
!123 = !DILocation(line: 93, column: 9, scope: !120)
!124 = !DILocation(line: 93, column: 17, scope: !120)
!125 = !DILocalVariable(name: "source", scope: !126, file: !18, line: 96, type: !40)
!126 = distinct !DILexicalBlock(scope: !108, file: !18, line: 95, column: 5)
!127 = !DILocation(line: 96, column: 17, scope: !126)
!128 = !DILocation(line: 97, column: 17, scope: !126)
!129 = !DILocation(line: 97, column: 9, scope: !126)
!130 = !DILocation(line: 98, column: 9, scope: !126)
!131 = !DILocation(line: 98, column: 23, scope: !126)
!132 = !DILocation(line: 100, column: 16, scope: !126)
!133 = !DILocation(line: 100, column: 22, scope: !126)
!134 = !DILocation(line: 100, column: 9, scope: !126)
!135 = !DILocation(line: 101, column: 20, scope: !126)
!136 = !DILocation(line: 101, column: 9, scope: !126)
!137 = !DILocation(line: 103, column: 1, scope: !108)
