; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  store i32* %2, i32** %data, align 8, !dbg !29
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !31
  %4 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !40
  %6 = load i32*, i32** %data, align 8, !dbg !41
  %call1 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %6), !dbg !42
  %7 = load i32*, i32** %data, align 8, !dbg !43
  call void @printWLine(i32* noundef %7), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32* @wcscpy(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 400, align 16, !dbg !75
  %1 = bitcast i8* %0 to i32*, !dbg !76
  store i32* %1, i32** %dataBuffer, align 8, !dbg !74
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  store i32* %2, i32** %data, align 8, !dbg !78
  %3 = load i32*, i32** %data, align 8, !dbg !79
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !80
  %4 = load i32*, i32** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !83, metadata !DIExpression()), !dbg !85
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !85
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !86
  %6 = load i32*, i32** %data, align 8, !dbg !87
  %call1 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %6), !dbg !88
  %7 = load i32*, i32** %data, align 8, !dbg !89
  call void @printWLine(i32* noundef %7), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 400, align 16, !dbg !97
  %1 = bitcast i8* %0 to i32*, !dbg !98
  store i32* %1, i32** %dataBuffer, align 8, !dbg !96
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  store i32* %2, i32** %data, align 8, !dbg !100
  %3 = load i32*, i32** %data, align 8, !dbg !101
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !102
  %4 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !108
  %6 = load i32*, i32** %data, align 8, !dbg !109
  %call1 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %6), !dbg !110
  %7 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* noundef %7), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 39, scope: !17)
!27 = !DILocation(line: 26, column: 28, scope: !17)
!28 = !DILocation(line: 27, column: 12, scope: !17)
!29 = !DILocation(line: 27, column: 10, scope: !17)
!30 = !DILocation(line: 32, column: 17, scope: !17)
!31 = !DILocation(line: 32, column: 9, scope: !17)
!32 = !DILocation(line: 33, column: 9, scope: !17)
!33 = !DILocation(line: 33, column: 21, scope: !17)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !18, line: 41, type: !36)
!35 = distinct !DILexicalBlock(scope: !17, file: !18, line: 40, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 41, column: 17, scope: !35)
!40 = !DILocation(line: 43, column: 16, scope: !35)
!41 = !DILocation(line: 43, column: 22, scope: !35)
!42 = !DILocation(line: 43, column: 9, scope: !35)
!43 = !DILocation(line: 44, column: 20, scope: !35)
!44 = !DILocation(line: 44, column: 9, scope: !35)
!45 = !DILocation(line: 46, column: 1, scope: !17)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_15_good", scope: !18, file: !18, line: 104, type: !19, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!47 = !DILocation(line: 106, column: 5, scope: !46)
!48 = !DILocation(line: 107, column: 5, scope: !46)
!49 = !DILocation(line: 108, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 120, type: !51, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!51 = !DISubroutineType(types: !52)
!52 = !{!8, !8, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !18, line: 120, type: !8)
!57 = !DILocation(line: 120, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !18, line: 120, type: !53)
!59 = !DILocation(line: 120, column: 27, scope: !50)
!60 = !DILocation(line: 123, column: 22, scope: !50)
!61 = !DILocation(line: 123, column: 12, scope: !50)
!62 = !DILocation(line: 123, column: 5, scope: !50)
!63 = !DILocation(line: 125, column: 5, scope: !50)
!64 = !DILocation(line: 126, column: 5, scope: !50)
!65 = !DILocation(line: 127, column: 5, scope: !50)
!66 = !DILocation(line: 130, column: 5, scope: !50)
!67 = !DILocation(line: 131, column: 5, scope: !50)
!68 = !DILocation(line: 132, column: 5, scope: !50)
!69 = !DILocation(line: 134, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!71 = !DILocalVariable(name: "data", scope: !70, file: !18, line: 55, type: !3)
!72 = !DILocation(line: 55, column: 15, scope: !70)
!73 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !18, line: 56, type: !3)
!74 = !DILocation(line: 56, column: 15, scope: !70)
!75 = !DILocation(line: 56, column: 39, scope: !70)
!76 = !DILocation(line: 56, column: 28, scope: !70)
!77 = !DILocation(line: 57, column: 12, scope: !70)
!78 = !DILocation(line: 57, column: 10, scope: !70)
!79 = !DILocation(line: 66, column: 17, scope: !70)
!80 = !DILocation(line: 66, column: 9, scope: !70)
!81 = !DILocation(line: 67, column: 9, scope: !70)
!82 = !DILocation(line: 67, column: 20, scope: !70)
!83 = !DILocalVariable(name: "dest", scope: !84, file: !18, line: 71, type: !36)
!84 = distinct !DILexicalBlock(scope: !70, file: !18, line: 70, column: 5)
!85 = !DILocation(line: 71, column: 17, scope: !84)
!86 = !DILocation(line: 73, column: 16, scope: !84)
!87 = !DILocation(line: 73, column: 22, scope: !84)
!88 = !DILocation(line: 73, column: 9, scope: !84)
!89 = !DILocation(line: 74, column: 20, scope: !84)
!90 = !DILocation(line: 74, column: 9, scope: !84)
!91 = !DILocation(line: 76, column: 1, scope: !70)
!92 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!93 = !DILocalVariable(name: "data", scope: !92, file: !18, line: 81, type: !3)
!94 = !DILocation(line: 81, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !18, line: 82, type: !3)
!96 = !DILocation(line: 82, column: 15, scope: !92)
!97 = !DILocation(line: 82, column: 39, scope: !92)
!98 = !DILocation(line: 82, column: 28, scope: !92)
!99 = !DILocation(line: 83, column: 12, scope: !92)
!100 = !DILocation(line: 83, column: 10, scope: !92)
!101 = !DILocation(line: 88, column: 17, scope: !92)
!102 = !DILocation(line: 88, column: 9, scope: !92)
!103 = !DILocation(line: 89, column: 9, scope: !92)
!104 = !DILocation(line: 89, column: 20, scope: !92)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !18, line: 97, type: !36)
!106 = distinct !DILexicalBlock(scope: !92, file: !18, line: 96, column: 5)
!107 = !DILocation(line: 97, column: 17, scope: !106)
!108 = !DILocation(line: 99, column: 16, scope: !106)
!109 = !DILocation(line: 99, column: 22, scope: !106)
!110 = !DILocation(line: 99, column: 9, scope: !106)
!111 = !DILocation(line: 100, column: 20, scope: !106)
!112 = !DILocation(line: 100, column: 9, scope: !106)
!113 = !DILocation(line: 102, column: 1, scope: !92)
