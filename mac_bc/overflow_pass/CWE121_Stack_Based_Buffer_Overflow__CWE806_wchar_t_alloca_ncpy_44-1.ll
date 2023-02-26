; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !24, metadata !DIExpression()), !dbg !28
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 400, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBuffer, align 8, !dbg !30
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  store i32* %2, i32** %data, align 8, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !36
  %4 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  call void %5(i32* noundef %6), !dbg !39
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !42 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !51
  %1 = load i32*, i32** %data.addr, align 8, !dbg !52
  %2 = load i32*, i32** %data.addr, align 8, !dbg !53
  %call = call i64 @wcslen(i32* noundef %2), !dbg !54
  %call1 = call i32* @wcsncpy(i32* noundef %arraydecay, i32* noundef %1, i64 noundef %call), !dbg !55
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !56
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  %3 = load i32*, i32** %data.addr, align 8, !dbg !58
  call void @printWLine(i32* noundef %3), !dbg !59
  ret void, !dbg !60
}

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* noundef null), !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 noundef %conv), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_good(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_bad(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32* @wcsncpy(i32* noundef, i32* noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !87, metadata !DIExpression()), !dbg !88
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 400, align 16, !dbg !91
  %1 = bitcast i8* %0 to i32*, !dbg !92
  store i32* %1, i32** %dataBuffer, align 8, !dbg !90
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  store i32* %2, i32** %data, align 8, !dbg !94
  %3 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !96
  %4 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !99
  %6 = load i32*, i32** %data, align 8, !dbg !100
  call void %5(i32* noundef %6), !dbg !99
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !102 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !108
  %1 = load i32*, i32** %data.addr, align 8, !dbg !109
  %2 = load i32*, i32** %data.addr, align 8, !dbg !110
  %call = call i64 @wcslen(i32* noundef %2), !dbg !111
  %call1 = call i32* @wcsncpy(i32* noundef %arraydecay, i32* noundef %1, i64 noundef %call), !dbg !112
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %3 = load i32*, i32** %data.addr, align 8, !dbg !115
  call void @printWLine(i32* noundef %3), !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_bad", scope: !18, file: !18, line: 34, type: !19, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 36, type: !3)
!23 = !DILocation(line: 36, column: 15, scope: !17)
!24 = !DILocalVariable(name: "funcPtr", scope: !17, file: !18, line: 38, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !3}
!28 = !DILocation(line: 38, column: 12, scope: !17)
!29 = !DILocalVariable(name: "dataBuffer", scope: !17, file: !18, line: 39, type: !3)
!30 = !DILocation(line: 39, column: 15, scope: !17)
!31 = !DILocation(line: 39, column: 39, scope: !17)
!32 = !DILocation(line: 39, column: 28, scope: !17)
!33 = !DILocation(line: 40, column: 12, scope: !17)
!34 = !DILocation(line: 40, column: 10, scope: !17)
!35 = !DILocation(line: 42, column: 13, scope: !17)
!36 = !DILocation(line: 42, column: 5, scope: !17)
!37 = !DILocation(line: 43, column: 5, scope: !17)
!38 = !DILocation(line: 43, column: 17, scope: !17)
!39 = !DILocation(line: 45, column: 5, scope: !17)
!40 = !DILocation(line: 45, column: 13, scope: !17)
!41 = !DILocation(line: 46, column: 1, scope: !17)
!42 = distinct !DISubprogram(name: "badSink", scope: !18, file: !18, line: 23, type: !26, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!43 = !DILocalVariable(name: "data", arg: 1, scope: !42, file: !18, line: 23, type: !3)
!44 = !DILocation(line: 23, column: 31, scope: !42)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !18, line: 26, type: !47)
!46 = distinct !DILexicalBlock(scope: !42, file: !18, line: 25, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 26, column: 17, scope: !46)
!51 = !DILocation(line: 28, column: 17, scope: !46)
!52 = !DILocation(line: 28, column: 23, scope: !46)
!53 = !DILocation(line: 28, column: 36, scope: !46)
!54 = !DILocation(line: 28, column: 29, scope: !46)
!55 = !DILocation(line: 28, column: 9, scope: !46)
!56 = !DILocation(line: 29, column: 9, scope: !46)
!57 = !DILocation(line: 29, column: 20, scope: !46)
!58 = !DILocation(line: 30, column: 20, scope: !46)
!59 = !DILocation(line: 30, column: 9, scope: !46)
!60 = !DILocation(line: 32, column: 1, scope: !42)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_44_good", scope: !18, file: !18, line: 76, type: !19, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!62 = !DILocation(line: 78, column: 5, scope: !61)
!63 = !DILocation(line: 79, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 90, type: !65, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!65 = !DISubroutineType(types: !66)
!66 = !{!8, !8, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !18, line: 90, type: !8)
!71 = !DILocation(line: 90, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !18, line: 90, type: !67)
!73 = !DILocation(line: 90, column: 27, scope: !64)
!74 = !DILocation(line: 93, column: 22, scope: !64)
!75 = !DILocation(line: 93, column: 12, scope: !64)
!76 = !DILocation(line: 93, column: 5, scope: !64)
!77 = !DILocation(line: 95, column: 5, scope: !64)
!78 = !DILocation(line: 96, column: 5, scope: !64)
!79 = !DILocation(line: 97, column: 5, scope: !64)
!80 = !DILocation(line: 100, column: 5, scope: !64)
!81 = !DILocation(line: 101, column: 5, scope: !64)
!82 = !DILocation(line: 102, column: 5, scope: !64)
!83 = !DILocation(line: 104, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 64, type: !19, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!85 = !DILocalVariable(name: "data", scope: !84, file: !18, line: 66, type: !3)
!86 = !DILocation(line: 66, column: 15, scope: !84)
!87 = !DILocalVariable(name: "funcPtr", scope: !84, file: !18, line: 67, type: !25)
!88 = !DILocation(line: 67, column: 12, scope: !84)
!89 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !18, line: 68, type: !3)
!90 = !DILocation(line: 68, column: 15, scope: !84)
!91 = !DILocation(line: 68, column: 39, scope: !84)
!92 = !DILocation(line: 68, column: 28, scope: !84)
!93 = !DILocation(line: 69, column: 12, scope: !84)
!94 = !DILocation(line: 69, column: 10, scope: !84)
!95 = !DILocation(line: 71, column: 13, scope: !84)
!96 = !DILocation(line: 71, column: 5, scope: !84)
!97 = !DILocation(line: 72, column: 5, scope: !84)
!98 = !DILocation(line: 72, column: 16, scope: !84)
!99 = !DILocation(line: 73, column: 5, scope: !84)
!100 = !DILocation(line: 73, column: 13, scope: !84)
!101 = !DILocation(line: 74, column: 1, scope: !84)
!102 = distinct !DISubprogram(name: "goodG2BSink", scope: !18, file: !18, line: 53, type: !26, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!103 = !DILocalVariable(name: "data", arg: 1, scope: !102, file: !18, line: 53, type: !3)
!104 = !DILocation(line: 53, column: 35, scope: !102)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !18, line: 56, type: !47)
!106 = distinct !DILexicalBlock(scope: !102, file: !18, line: 55, column: 5)
!107 = !DILocation(line: 56, column: 17, scope: !106)
!108 = !DILocation(line: 58, column: 17, scope: !106)
!109 = !DILocation(line: 58, column: 23, scope: !106)
!110 = !DILocation(line: 58, column: 36, scope: !106)
!111 = !DILocation(line: 58, column: 29, scope: !106)
!112 = !DILocation(line: 58, column: 9, scope: !106)
!113 = !DILocation(line: 59, column: 9, scope: !106)
!114 = !DILocation(line: 59, column: 20, scope: !106)
!115 = !DILocation(line: 60, column: 20, scope: !106)
!116 = !DILocation(line: 60, column: 9, scope: !106)
!117 = !DILocation(line: 62, column: 1, scope: !102)
