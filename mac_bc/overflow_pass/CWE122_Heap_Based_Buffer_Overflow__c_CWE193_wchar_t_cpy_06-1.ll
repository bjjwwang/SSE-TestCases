; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06_bad.source to i8*), i64 44, i1 false), !dbg !42
  %3 = load i32*, i32** %data, align 8, !dbg !43
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %call1 = call i32* @wcscpy(i32* noundef %3, i32* noundef %arraydecay), !dbg !45
  %4 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* noundef %4), !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %6 = bitcast i32* %5 to i8*, !dbg !48
  call void @free(i8* noundef %6), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare i32* @wcscpy(i32* noundef, i32* noundef) #5

declare void @printWLine(i32* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* noundef null), !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 noundef %conv), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06_bad(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i32* null, i32** %data, align 8, !dbg !78
  %call = call i8* @malloc(i64 noundef 44) #6, !dbg !79
  %0 = bitcast i8* %call to i32*, !dbg !82
  store i32* %0, i32** %data, align 8, !dbg !83
  %1 = load i32*, i32** %data, align 8, !dbg !84
  %cmp = icmp eq i32* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !92
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !92
  %3 = load i32*, i32** %data, align 8, !dbg !93
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !94
  %call1 = call i32* @wcscpy(i32* noundef %3, i32* noundef %arraydecay), !dbg !95
  %4 = load i32*, i32** %data, align 8, !dbg !96
  call void @printWLine(i32* noundef %4), !dbg !97
  %5 = load i32*, i32** %data, align 8, !dbg !98
  %6 = bitcast i32* %5 to i8*, !dbg !98
  call void @free(i8* noundef %6), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i32* null, i32** %data, align 8, !dbg !104
  %call = call i8* @malloc(i64 noundef 44) #6, !dbg !105
  %0 = bitcast i8* %call to i32*, !dbg !108
  store i32* %0, i32** %data, align 8, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %cmp = icmp eq i32* %1, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !118
  %3 = load i32*, i32** %data, align 8, !dbg !119
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !120
  %call1 = call i32* @wcscpy(i32* noundef %3, i32* noundef %arraydecay), !dbg !121
  %4 = load i32*, i32** %data, align 8, !dbg !122
  call void @printWLine(i32* noundef %4), !dbg !123
  %5 = load i32*, i32** %data, align 8, !dbg !124
  %6 = bitcast i32* %5 to i8*, !dbg !124
  call void @free(i8* noundef %6), !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9, !10}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06_bad", scope: !19, file: !19, line: 32, type: !20, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 34, type: !3)
!24 = !DILocation(line: 34, column: 15, scope: !18)
!25 = !DILocation(line: 35, column: 10, scope: !18)
!26 = !DILocation(line: 39, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !19, line: 37, column: 5)
!28 = distinct !DILexicalBlock(scope: !18, file: !19, line: 36, column: 8)
!29 = !DILocation(line: 39, column: 16, scope: !27)
!30 = !DILocation(line: 39, column: 14, scope: !27)
!31 = !DILocation(line: 40, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !19, line: 40, column: 13)
!33 = !DILocation(line: 40, column: 18, scope: !32)
!34 = !DILocation(line: 40, column: 13, scope: !27)
!35 = !DILocation(line: 40, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 40, column: 27)
!37 = !DILocalVariable(name: "source", scope: !38, file: !19, line: 43, type: !39)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 42, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 11)
!42 = !DILocation(line: 43, column: 17, scope: !38)
!43 = !DILocation(line: 45, column: 16, scope: !38)
!44 = !DILocation(line: 45, column: 22, scope: !38)
!45 = !DILocation(line: 45, column: 9, scope: !38)
!46 = !DILocation(line: 46, column: 20, scope: !38)
!47 = !DILocation(line: 46, column: 9, scope: !38)
!48 = !DILocation(line: 47, column: 14, scope: !38)
!49 = !DILocation(line: 47, column: 9, scope: !38)
!50 = !DILocation(line: 49, column: 1, scope: !18)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_06_good", scope: !19, file: !19, line: 100, type: !20, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!52 = !DILocation(line: 102, column: 5, scope: !51)
!53 = !DILocation(line: 103, column: 5, scope: !51)
!54 = !DILocation(line: 104, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 116, type: !56, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!56 = !DISubroutineType(types: !57)
!57 = !{!8, !8, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !19, line: 116, type: !8)
!62 = !DILocation(line: 116, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !19, line: 116, type: !58)
!64 = !DILocation(line: 116, column: 27, scope: !55)
!65 = !DILocation(line: 119, column: 22, scope: !55)
!66 = !DILocation(line: 119, column: 12, scope: !55)
!67 = !DILocation(line: 119, column: 5, scope: !55)
!68 = !DILocation(line: 121, column: 5, scope: !55)
!69 = !DILocation(line: 122, column: 5, scope: !55)
!70 = !DILocation(line: 123, column: 5, scope: !55)
!71 = !DILocation(line: 126, column: 5, scope: !55)
!72 = !DILocation(line: 127, column: 5, scope: !55)
!73 = !DILocation(line: 128, column: 5, scope: !55)
!74 = !DILocation(line: 130, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!76 = !DILocalVariable(name: "data", scope: !75, file: !19, line: 58, type: !3)
!77 = !DILocation(line: 58, column: 15, scope: !75)
!78 = !DILocation(line: 59, column: 10, scope: !75)
!79 = !DILocation(line: 68, column: 27, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !19, line: 66, column: 5)
!81 = distinct !DILexicalBlock(scope: !75, file: !19, line: 60, column: 8)
!82 = !DILocation(line: 68, column: 16, scope: !80)
!83 = !DILocation(line: 68, column: 14, scope: !80)
!84 = !DILocation(line: 69, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !19, line: 69, column: 13)
!86 = !DILocation(line: 69, column: 18, scope: !85)
!87 = !DILocation(line: 69, column: 13, scope: !80)
!88 = !DILocation(line: 69, column: 28, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !19, line: 69, column: 27)
!90 = !DILocalVariable(name: "source", scope: !91, file: !19, line: 72, type: !39)
!91 = distinct !DILexicalBlock(scope: !75, file: !19, line: 71, column: 5)
!92 = !DILocation(line: 72, column: 17, scope: !91)
!93 = !DILocation(line: 74, column: 16, scope: !91)
!94 = !DILocation(line: 74, column: 22, scope: !91)
!95 = !DILocation(line: 74, column: 9, scope: !91)
!96 = !DILocation(line: 75, column: 20, scope: !91)
!97 = !DILocation(line: 75, column: 9, scope: !91)
!98 = !DILocation(line: 76, column: 14, scope: !91)
!99 = !DILocation(line: 76, column: 9, scope: !91)
!100 = !DILocation(line: 78, column: 1, scope: !75)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 81, type: !20, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!102 = !DILocalVariable(name: "data", scope: !101, file: !19, line: 83, type: !3)
!103 = !DILocation(line: 83, column: 15, scope: !101)
!104 = !DILocation(line: 84, column: 10, scope: !101)
!105 = !DILocation(line: 88, column: 27, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !19, line: 86, column: 5)
!107 = distinct !DILexicalBlock(scope: !101, file: !19, line: 85, column: 8)
!108 = !DILocation(line: 88, column: 16, scope: !106)
!109 = !DILocation(line: 88, column: 14, scope: !106)
!110 = !DILocation(line: 89, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !19, line: 89, column: 13)
!112 = !DILocation(line: 89, column: 18, scope: !111)
!113 = !DILocation(line: 89, column: 13, scope: !106)
!114 = !DILocation(line: 89, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !19, line: 89, column: 27)
!116 = !DILocalVariable(name: "source", scope: !117, file: !19, line: 92, type: !39)
!117 = distinct !DILexicalBlock(scope: !101, file: !19, line: 91, column: 5)
!118 = !DILocation(line: 92, column: 17, scope: !117)
!119 = !DILocation(line: 94, column: 16, scope: !117)
!120 = !DILocation(line: 94, column: 22, scope: !117)
!121 = !DILocation(line: 94, column: 9, scope: !117)
!122 = !DILocation(line: 95, column: 20, scope: !117)
!123 = !DILocation(line: 95, column: 9, scope: !117)
!124 = !DILocation(line: 96, column: 14, scope: !117)
!125 = !DILocation(line: 96, column: 9, scope: !117)
!126 = !DILocation(line: 98, column: 1, scope: !101)
