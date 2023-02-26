; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
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
  %5 = load i32*, i32** %data, align 8, !dbg !39
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_badData, align 8, !dbg !40
  call void @badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* noundef null), !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 noundef %conv), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_good(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_bad(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_badData, align 8, !dbg !69
  store i32* %0, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !70, metadata !DIExpression()), !dbg !75
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !75
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !76
  %2 = load i32*, i32** %data, align 8, !dbg !77
  %call = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %2), !dbg !78
  %3 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* noundef %3), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32* @wcscpy(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 400, align 16, !dbg !87
  %1 = bitcast i8* %0 to i32*, !dbg !88
  store i32* %1, i32** %dataBuffer, align 8, !dbg !86
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  store i32* %2, i32** %data, align 8, !dbg !90
  %3 = load i32*, i32** %data, align 8, !dbg !91
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !92
  %4 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  %5 = load i32*, i32** %data, align 8, !dbg !95
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_goodG2BData, align 8, !dbg !96
  call void @goodG2BSink(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_goodG2BData, align 8, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !105
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !106
  %2 = load i32*, i32** %data, align 8, !dbg !107
  %call = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %2), !dbg !108
  %3 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* noundef %3), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_badData", scope: !2, file: !15, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_goodG2BData", scope: !2, file: !15, line: 22, type: !5, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_bad", scope: !15, file: !15, line: 37, type: !24, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !15, line: 39, type: !5)
!28 = !DILocation(line: 39, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !15, line: 40, type: !5)
!30 = !DILocation(line: 40, column: 15, scope: !23)
!31 = !DILocation(line: 40, column: 39, scope: !23)
!32 = !DILocation(line: 40, column: 28, scope: !23)
!33 = !DILocation(line: 41, column: 12, scope: !23)
!34 = !DILocation(line: 41, column: 10, scope: !23)
!35 = !DILocation(line: 43, column: 13, scope: !23)
!36 = !DILocation(line: 43, column: 5, scope: !23)
!37 = !DILocation(line: 44, column: 5, scope: !23)
!38 = !DILocation(line: 44, column: 17, scope: !23)
!39 = !DILocation(line: 45, column: 77, scope: !23)
!40 = !DILocation(line: 45, column: 75, scope: !23)
!41 = !DILocation(line: 46, column: 5, scope: !23)
!42 = !DILocation(line: 47, column: 1, scope: !23)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_45_good", scope: !15, file: !15, line: 77, type: !24, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!44 = !DILocation(line: 79, column: 5, scope: !43)
!45 = !DILocation(line: 80, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !47, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!47 = !DISubroutineType(types: !48)
!48 = !{!10, !10, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !15, line: 91, type: !10)
!53 = !DILocation(line: 91, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !15, line: 91, type: !49)
!55 = !DILocation(line: 91, column: 27, scope: !46)
!56 = !DILocation(line: 94, column: 22, scope: !46)
!57 = !DILocation(line: 94, column: 12, scope: !46)
!58 = !DILocation(line: 94, column: 5, scope: !46)
!59 = !DILocation(line: 96, column: 5, scope: !46)
!60 = !DILocation(line: 97, column: 5, scope: !46)
!61 = !DILocation(line: 98, column: 5, scope: !46)
!62 = !DILocation(line: 101, column: 5, scope: !46)
!63 = !DILocation(line: 102, column: 5, scope: !46)
!64 = !DILocation(line: 103, column: 5, scope: !46)
!65 = !DILocation(line: 105, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 26, type: !24, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!67 = !DILocalVariable(name: "data", scope: !66, file: !15, line: 28, type: !5)
!68 = !DILocation(line: 28, column: 15, scope: !66)
!69 = !DILocation(line: 28, column: 22, scope: !66)
!70 = !DILocalVariable(name: "dest", scope: !71, file: !15, line: 30, type: !72)
!71 = distinct !DILexicalBlock(scope: !66, file: !15, line: 29, column: 5)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 50)
!75 = !DILocation(line: 30, column: 17, scope: !71)
!76 = !DILocation(line: 32, column: 16, scope: !71)
!77 = !DILocation(line: 32, column: 22, scope: !71)
!78 = !DILocation(line: 32, column: 9, scope: !71)
!79 = !DILocation(line: 33, column: 20, scope: !71)
!80 = !DILocation(line: 33, column: 9, scope: !71)
!81 = !DILocation(line: 35, column: 1, scope: !66)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 65, type: !24, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 67, type: !5)
!84 = !DILocation(line: 67, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !15, line: 68, type: !5)
!86 = !DILocation(line: 68, column: 15, scope: !82)
!87 = !DILocation(line: 68, column: 39, scope: !82)
!88 = !DILocation(line: 68, column: 28, scope: !82)
!89 = !DILocation(line: 69, column: 12, scope: !82)
!90 = !DILocation(line: 69, column: 10, scope: !82)
!91 = !DILocation(line: 71, column: 13, scope: !82)
!92 = !DILocation(line: 71, column: 5, scope: !82)
!93 = !DILocation(line: 72, column: 5, scope: !82)
!94 = !DILocation(line: 72, column: 16, scope: !82)
!95 = !DILocation(line: 73, column: 81, scope: !82)
!96 = !DILocation(line: 73, column: 79, scope: !82)
!97 = !DILocation(line: 74, column: 5, scope: !82)
!98 = !DILocation(line: 75, column: 1, scope: !82)
!99 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 54, type: !24, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 56, type: !5)
!101 = !DILocation(line: 56, column: 15, scope: !99)
!102 = !DILocation(line: 56, column: 22, scope: !99)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !15, line: 58, type: !72)
!104 = distinct !DILexicalBlock(scope: !99, file: !15, line: 57, column: 5)
!105 = !DILocation(line: 58, column: 17, scope: !104)
!106 = !DILocation(line: 60, column: 16, scope: !104)
!107 = !DILocation(line: 60, column: 22, scope: !104)
!108 = !DILocation(line: 60, column: 9, scope: !104)
!109 = !DILocation(line: 61, column: 20, scope: !104)
!110 = !DILocation(line: 61, column: 9, scope: !104)
!111 = !DILocation(line: 63, column: 1, scope: !99)
