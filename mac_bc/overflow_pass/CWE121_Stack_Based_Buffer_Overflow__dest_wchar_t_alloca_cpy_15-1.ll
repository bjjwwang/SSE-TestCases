; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_15_bad() #0 !dbg !17 {
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
  store i32* %4, i32** %data, align 8, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !43
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx1, align 4, !dbg !45
  %6 = load i32*, i32** %data, align 8, !dbg !46
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call3 = call i32* @wcscpy(i32* noundef %6, i32* noundef %arraydecay2), !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* noundef %7), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcscpy(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_15_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* noundef null), !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 noundef %conv), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_15_good(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_15_bad(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 200, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %2 = alloca i8, i64 400, align 16, !dbg !85
  %3 = bitcast i8* %2 to i32*, !dbg !86
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !84
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !87
  store i32* %4, i32** %data, align 8, !dbg !88
  %5 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !94
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !95
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !96
  store i32 0, i32* %arrayidx1, align 4, !dbg !97
  %6 = load i32*, i32** %data, align 8, !dbg !98
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !99
  %call3 = call i32* @wcscpy(i32* noundef %6, i32* noundef %arraydecay2), !dbg !100
  %7 = load i32*, i32** %data, align 8, !dbg !101
  call void @printWLine(i32* noundef %7), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 200, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 400, align 16, !dbg !113
  %3 = bitcast i8* %2 to i32*, !dbg !114
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !112
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !115
  store i32* %4, i32** %data, align 8, !dbg !116
  %5 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !122
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !123
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx1, align 4, !dbg !125
  %6 = load i32*, i32** %data, align 8, !dbg !126
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !127
  %call3 = call i32* @wcscpy(i32* noundef %6, i32* noundef %arraydecay2), !dbg !128
  %7 = load i32*, i32** %data, align 8, !dbg !129
  call void @printWLine(i32* noundef %7), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_15_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 42, scope: !17)
!27 = !DILocation(line: 26, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 27, type: !3)
!29 = !DILocation(line: 27, column: 15, scope: !17)
!30 = !DILocation(line: 27, column: 43, scope: !17)
!31 = !DILocation(line: 27, column: 32, scope: !17)
!32 = !DILocation(line: 33, column: 16, scope: !17)
!33 = !DILocation(line: 33, column: 14, scope: !17)
!34 = !DILocation(line: 34, column: 9, scope: !17)
!35 = !DILocation(line: 34, column: 17, scope: !17)
!36 = !DILocalVariable(name: "source", scope: !37, file: !18, line: 42, type: !38)
!37 = distinct !DILexicalBlock(scope: !17, file: !18, line: 41, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 42, column: 17, scope: !37)
!42 = !DILocation(line: 43, column: 17, scope: !37)
!43 = !DILocation(line: 43, column: 9, scope: !37)
!44 = !DILocation(line: 44, column: 9, scope: !37)
!45 = !DILocation(line: 44, column: 23, scope: !37)
!46 = !DILocation(line: 46, column: 16, scope: !37)
!47 = !DILocation(line: 46, column: 22, scope: !37)
!48 = !DILocation(line: 46, column: 9, scope: !37)
!49 = !DILocation(line: 47, column: 20, scope: !37)
!50 = !DILocation(line: 47, column: 9, scope: !37)
!51 = !DILocation(line: 49, column: 1, scope: !17)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_15_good", scope: !18, file: !18, line: 111, type: !19, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!53 = !DILocation(line: 113, column: 5, scope: !52)
!54 = !DILocation(line: 114, column: 5, scope: !52)
!55 = !DILocation(line: 115, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 127, type: !57, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!57 = !DISubroutineType(types: !58)
!58 = !{!8, !8, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !18, line: 127, type: !8)
!63 = !DILocation(line: 127, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !18, line: 127, type: !59)
!65 = !DILocation(line: 127, column: 27, scope: !56)
!66 = !DILocation(line: 130, column: 22, scope: !56)
!67 = !DILocation(line: 130, column: 12, scope: !56)
!68 = !DILocation(line: 130, column: 5, scope: !56)
!69 = !DILocation(line: 132, column: 5, scope: !56)
!70 = !DILocation(line: 133, column: 5, scope: !56)
!71 = !DILocation(line: 134, column: 5, scope: !56)
!72 = !DILocation(line: 137, column: 5, scope: !56)
!73 = !DILocation(line: 138, column: 5, scope: !56)
!74 = !DILocation(line: 139, column: 5, scope: !56)
!75 = !DILocation(line: 141, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 56, type: !19, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!77 = !DILocalVariable(name: "data", scope: !76, file: !18, line: 58, type: !3)
!78 = !DILocation(line: 58, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !18, line: 59, type: !3)
!80 = !DILocation(line: 59, column: 15, scope: !76)
!81 = !DILocation(line: 59, column: 42, scope: !76)
!82 = !DILocation(line: 59, column: 31, scope: !76)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !18, line: 60, type: !3)
!84 = !DILocation(line: 60, column: 15, scope: !76)
!85 = !DILocation(line: 60, column: 43, scope: !76)
!86 = !DILocation(line: 60, column: 32, scope: !76)
!87 = !DILocation(line: 69, column: 16, scope: !76)
!88 = !DILocation(line: 69, column: 14, scope: !76)
!89 = !DILocation(line: 70, column: 9, scope: !76)
!90 = !DILocation(line: 70, column: 17, scope: !76)
!91 = !DILocalVariable(name: "source", scope: !92, file: !18, line: 74, type: !38)
!92 = distinct !DILexicalBlock(scope: !76, file: !18, line: 73, column: 5)
!93 = !DILocation(line: 74, column: 17, scope: !92)
!94 = !DILocation(line: 75, column: 17, scope: !92)
!95 = !DILocation(line: 75, column: 9, scope: !92)
!96 = !DILocation(line: 76, column: 9, scope: !92)
!97 = !DILocation(line: 76, column: 23, scope: !92)
!98 = !DILocation(line: 78, column: 16, scope: !92)
!99 = !DILocation(line: 78, column: 22, scope: !92)
!100 = !DILocation(line: 78, column: 9, scope: !92)
!101 = !DILocation(line: 79, column: 20, scope: !92)
!102 = !DILocation(line: 79, column: 9, scope: !92)
!103 = !DILocation(line: 81, column: 1, scope: !76)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 84, type: !19, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!105 = !DILocalVariable(name: "data", scope: !104, file: !18, line: 86, type: !3)
!106 = !DILocation(line: 86, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !18, line: 87, type: !3)
!108 = !DILocation(line: 87, column: 15, scope: !104)
!109 = !DILocation(line: 87, column: 42, scope: !104)
!110 = !DILocation(line: 87, column: 31, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !18, line: 88, type: !3)
!112 = !DILocation(line: 88, column: 15, scope: !104)
!113 = !DILocation(line: 88, column: 43, scope: !104)
!114 = !DILocation(line: 88, column: 32, scope: !104)
!115 = !DILocation(line: 93, column: 16, scope: !104)
!116 = !DILocation(line: 93, column: 14, scope: !104)
!117 = !DILocation(line: 94, column: 9, scope: !104)
!118 = !DILocation(line: 94, column: 17, scope: !104)
!119 = !DILocalVariable(name: "source", scope: !120, file: !18, line: 102, type: !38)
!120 = distinct !DILexicalBlock(scope: !104, file: !18, line: 101, column: 5)
!121 = !DILocation(line: 102, column: 17, scope: !120)
!122 = !DILocation(line: 103, column: 17, scope: !120)
!123 = !DILocation(line: 103, column: 9, scope: !120)
!124 = !DILocation(line: 104, column: 9, scope: !120)
!125 = !DILocation(line: 104, column: 23, scope: !120)
!126 = !DILocation(line: 106, column: 16, scope: !120)
!127 = !DILocation(line: 106, column: 22, scope: !120)
!128 = !DILocation(line: 106, column: 9, scope: !120)
!129 = !DILocation(line: 107, column: 20, scope: !120)
!130 = !DILocation(line: 107, column: 9, scope: !120)
!131 = !DILocation(line: 109, column: 1, scope: !104)
