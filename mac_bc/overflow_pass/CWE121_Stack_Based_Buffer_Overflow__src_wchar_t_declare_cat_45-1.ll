; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_goodG2BData = internal global i32* null, align 8, !dbg !7

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %2 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* noundef null), !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 noundef %conv), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_good(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_bad(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_badData, align 8, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !71, metadata !DIExpression()), !dbg !76
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !76
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !77
  %2 = load i32*, i32** %data, align 8, !dbg !78
  %call = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %2), !dbg !79
  %3 = load i32*, i32** %data, align 8, !dbg !80
  call void @printWLine(i32* noundef %3), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32* @wcscat(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !88
  store i32* %arraydecay, i32** %data, align 8, !dbg !89
  %0 = load i32*, i32** %data, align 8, !dbg !90
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  %2 = load i32*, i32** %data, align 8, !dbg !94
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_goodG2BData, align 8, !dbg !95
  call void @goodG2BSink(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_goodG2BData, align 8, !dbg !101
  store i32* %0, i32** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !105
  %2 = load i32*, i32** %data, align 8, !dbg !106
  %call = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %2), !dbg !107
  %3 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* noundef %3), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_badData", scope: !2, file: !9, line: 21, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_goodG2BData", scope: !2, file: !9, line: 22, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 34, baseType: !13)
!12 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !14, line: 106, baseType: !15)
!14 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_bad", scope: !9, file: !9, line: 37, type: !24, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !9, line: 39, type: !10)
!28 = !DILocation(line: 39, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !9, line: 40, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 40, column: 13, scope: !23)
!34 = !DILocation(line: 41, column: 12, scope: !23)
!35 = !DILocation(line: 41, column: 10, scope: !23)
!36 = !DILocation(line: 43, column: 13, scope: !23)
!37 = !DILocation(line: 43, column: 5, scope: !23)
!38 = !DILocation(line: 44, column: 5, scope: !23)
!39 = !DILocation(line: 44, column: 17, scope: !23)
!40 = !DILocation(line: 45, column: 78, scope: !23)
!41 = !DILocation(line: 45, column: 76, scope: !23)
!42 = !DILocation(line: 46, column: 5, scope: !23)
!43 = !DILocation(line: 47, column: 1, scope: !23)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_45_good", scope: !9, file: !9, line: 77, type: !24, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!45 = !DILocation(line: 79, column: 5, scope: !44)
!46 = !DILocation(line: 80, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 91, type: !48, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!48 = !DISubroutineType(types: !49)
!49 = !{!15, !15, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !9, line: 91, type: !15)
!54 = !DILocation(line: 91, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !9, line: 91, type: !50)
!56 = !DILocation(line: 91, column: 27, scope: !47)
!57 = !DILocation(line: 94, column: 22, scope: !47)
!58 = !DILocation(line: 94, column: 12, scope: !47)
!59 = !DILocation(line: 94, column: 5, scope: !47)
!60 = !DILocation(line: 96, column: 5, scope: !47)
!61 = !DILocation(line: 97, column: 5, scope: !47)
!62 = !DILocation(line: 98, column: 5, scope: !47)
!63 = !DILocation(line: 101, column: 5, scope: !47)
!64 = !DILocation(line: 102, column: 5, scope: !47)
!65 = !DILocation(line: 103, column: 5, scope: !47)
!66 = !DILocation(line: 105, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 26, type: !24, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!68 = !DILocalVariable(name: "data", scope: !67, file: !9, line: 28, type: !10)
!69 = !DILocation(line: 28, column: 15, scope: !67)
!70 = !DILocation(line: 28, column: 22, scope: !67)
!71 = !DILocalVariable(name: "dest", scope: !72, file: !9, line: 30, type: !73)
!72 = distinct !DILexicalBlock(scope: !67, file: !9, line: 29, column: 5)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1600, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 50)
!76 = !DILocation(line: 30, column: 17, scope: !72)
!77 = !DILocation(line: 32, column: 16, scope: !72)
!78 = !DILocation(line: 32, column: 22, scope: !72)
!79 = !DILocation(line: 32, column: 9, scope: !72)
!80 = !DILocation(line: 33, column: 20, scope: !72)
!81 = !DILocation(line: 33, column: 9, scope: !72)
!82 = !DILocation(line: 35, column: 1, scope: !67)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 65, type: !24, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!84 = !DILocalVariable(name: "data", scope: !83, file: !9, line: 67, type: !10)
!85 = !DILocation(line: 67, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !9, line: 68, type: !30)
!87 = !DILocation(line: 68, column: 13, scope: !83)
!88 = !DILocation(line: 69, column: 12, scope: !83)
!89 = !DILocation(line: 69, column: 10, scope: !83)
!90 = !DILocation(line: 71, column: 13, scope: !83)
!91 = !DILocation(line: 71, column: 5, scope: !83)
!92 = !DILocation(line: 72, column: 5, scope: !83)
!93 = !DILocation(line: 72, column: 16, scope: !83)
!94 = !DILocation(line: 73, column: 82, scope: !83)
!95 = !DILocation(line: 73, column: 80, scope: !83)
!96 = !DILocation(line: 74, column: 5, scope: !83)
!97 = !DILocation(line: 75, column: 1, scope: !83)
!98 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 54, type: !24, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!99 = !DILocalVariable(name: "data", scope: !98, file: !9, line: 56, type: !10)
!100 = !DILocation(line: 56, column: 15, scope: !98)
!101 = !DILocation(line: 56, column: 22, scope: !98)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !9, line: 58, type: !73)
!103 = distinct !DILexicalBlock(scope: !98, file: !9, line: 57, column: 5)
!104 = !DILocation(line: 58, column: 17, scope: !103)
!105 = !DILocation(line: 60, column: 16, scope: !103)
!106 = !DILocation(line: 60, column: 22, scope: !103)
!107 = !DILocation(line: 60, column: 9, scope: !103)
!108 = !DILocation(line: 61, column: 20, scope: !103)
!109 = !DILocation(line: 61, column: 9, scope: !103)
!110 = !DILocation(line: 63, column: 1, scope: !98)
