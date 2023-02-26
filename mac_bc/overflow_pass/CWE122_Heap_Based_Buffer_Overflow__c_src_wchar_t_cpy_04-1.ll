; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_04_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !25
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  %call2 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %5), !dbg !48
  %6 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* noundef %6), !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  %8 = bitcast i32* %7 to i8*, !dbg !51
  call void @free(i8* noundef %8), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare i32* @wcscpy(i32* noundef, i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_04_good() #0 !dbg !54 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_04_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_04_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !81
  %0 = bitcast i8* %call to i32*, !dbg !82
  store i32* %0, i32** %data, align 8, !dbg !83
  %1 = load i32*, i32** %data, align 8, !dbg !84
  %cmp = icmp eq i32* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !90
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !93
  %3 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !99
  %5 = load i32*, i32** %data, align 8, !dbg !100
  %call2 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %5), !dbg !101
  %6 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* noundef %6), !dbg !103
  %7 = load i32*, i32** %data, align 8, !dbg !104
  %8 = bitcast i32* %7 to i8*, !dbg !104
  call void @free(i8* noundef %8), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !110
  %0 = bitcast i8* %call to i32*, !dbg !111
  store i32* %0, i32** %data, align 8, !dbg !112
  %1 = load i32*, i32** %data, align 8, !dbg !113
  %cmp = icmp eq i32* %1, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !119
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !122
  %3 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !127
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !128
  %5 = load i32*, i32** %data, align 8, !dbg !129
  %call2 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %5), !dbg !130
  %6 = load i32*, i32** %data, align 8, !dbg !131
  call void @printWLine(i32* noundef %6), !dbg !132
  %7 = load i32*, i32** %data, align 8, !dbg !133
  %8 = bitcast i32* %7 to i8*, !dbg !133
  call void @free(i8* noundef %8), !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_04_bad", scope: !19, file: !19, line: 30, type: !20, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 32, type: !3)
!24 = !DILocation(line: 32, column: 15, scope: !18)
!25 = !DILocation(line: 33, column: 23, scope: !18)
!26 = !DILocation(line: 33, column: 12, scope: !18)
!27 = !DILocation(line: 33, column: 10, scope: !18)
!28 = !DILocation(line: 34, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 9)
!30 = !DILocation(line: 34, column: 14, scope: !29)
!31 = !DILocation(line: 34, column: 9, scope: !18)
!32 = !DILocation(line: 34, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 34, column: 23)
!34 = !DILocation(line: 38, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !19, line: 36, column: 5)
!36 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 8)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 39, column: 9, scope: !35)
!39 = !DILocation(line: 39, column: 21, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !19, line: 42, type: !42)
!41 = distinct !DILexicalBlock(scope: !18, file: !19, line: 41, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 42, column: 17, scope: !41)
!46 = !DILocation(line: 44, column: 16, scope: !41)
!47 = !DILocation(line: 44, column: 22, scope: !41)
!48 = !DILocation(line: 44, column: 9, scope: !41)
!49 = !DILocation(line: 45, column: 20, scope: !41)
!50 = !DILocation(line: 45, column: 9, scope: !41)
!51 = !DILocation(line: 46, column: 14, scope: !41)
!52 = !DILocation(line: 46, column: 9, scope: !41)
!53 = !DILocation(line: 48, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_04_good", scope: !19, file: !19, line: 101, type: !20, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!55 = !DILocation(line: 103, column: 5, scope: !54)
!56 = !DILocation(line: 104, column: 5, scope: !54)
!57 = !DILocation(line: 105, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 117, type: !59, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!59 = !DISubroutineType(types: !60)
!60 = !{!8, !8, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !19, line: 117, type: !8)
!65 = !DILocation(line: 117, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !19, line: 117, type: !61)
!67 = !DILocation(line: 117, column: 27, scope: !58)
!68 = !DILocation(line: 120, column: 22, scope: !58)
!69 = !DILocation(line: 120, column: 12, scope: !58)
!70 = !DILocation(line: 120, column: 5, scope: !58)
!71 = !DILocation(line: 122, column: 5, scope: !58)
!72 = !DILocation(line: 123, column: 5, scope: !58)
!73 = !DILocation(line: 124, column: 5, scope: !58)
!74 = !DILocation(line: 127, column: 5, scope: !58)
!75 = !DILocation(line: 128, column: 5, scope: !58)
!76 = !DILocation(line: 129, column: 5, scope: !58)
!77 = !DILocation(line: 131, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!79 = !DILocalVariable(name: "data", scope: !78, file: !19, line: 57, type: !3)
!80 = !DILocation(line: 57, column: 15, scope: !78)
!81 = !DILocation(line: 58, column: 23, scope: !78)
!82 = !DILocation(line: 58, column: 12, scope: !78)
!83 = !DILocation(line: 58, column: 10, scope: !78)
!84 = !DILocation(line: 59, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !19, line: 59, column: 9)
!86 = !DILocation(line: 59, column: 14, scope: !85)
!87 = !DILocation(line: 59, column: 9, scope: !78)
!88 = !DILocation(line: 59, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !19, line: 59, column: 23)
!90 = !DILocation(line: 68, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !92, file: !19, line: 66, column: 5)
!92 = distinct !DILexicalBlock(scope: !78, file: !19, line: 60, column: 8)
!93 = !DILocation(line: 68, column: 9, scope: !91)
!94 = !DILocation(line: 69, column: 9, scope: !91)
!95 = !DILocation(line: 69, column: 20, scope: !91)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !19, line: 72, type: !42)
!97 = distinct !DILexicalBlock(scope: !78, file: !19, line: 71, column: 5)
!98 = !DILocation(line: 72, column: 17, scope: !97)
!99 = !DILocation(line: 74, column: 16, scope: !97)
!100 = !DILocation(line: 74, column: 22, scope: !97)
!101 = !DILocation(line: 74, column: 9, scope: !97)
!102 = !DILocation(line: 75, column: 20, scope: !97)
!103 = !DILocation(line: 75, column: 9, scope: !97)
!104 = !DILocation(line: 76, column: 14, scope: !97)
!105 = !DILocation(line: 76, column: 9, scope: !97)
!106 = !DILocation(line: 78, column: 1, scope: !78)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 81, type: !20, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!108 = !DILocalVariable(name: "data", scope: !107, file: !19, line: 83, type: !3)
!109 = !DILocation(line: 83, column: 15, scope: !107)
!110 = !DILocation(line: 84, column: 23, scope: !107)
!111 = !DILocation(line: 84, column: 12, scope: !107)
!112 = !DILocation(line: 84, column: 10, scope: !107)
!113 = !DILocation(line: 85, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !19, line: 85, column: 9)
!115 = !DILocation(line: 85, column: 14, scope: !114)
!116 = !DILocation(line: 85, column: 9, scope: !107)
!117 = !DILocation(line: 85, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !19, line: 85, column: 23)
!119 = !DILocation(line: 89, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !121, file: !19, line: 87, column: 5)
!121 = distinct !DILexicalBlock(scope: !107, file: !19, line: 86, column: 8)
!122 = !DILocation(line: 89, column: 9, scope: !120)
!123 = !DILocation(line: 90, column: 9, scope: !120)
!124 = !DILocation(line: 90, column: 20, scope: !120)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !19, line: 93, type: !42)
!126 = distinct !DILexicalBlock(scope: !107, file: !19, line: 92, column: 5)
!127 = !DILocation(line: 93, column: 17, scope: !126)
!128 = !DILocation(line: 95, column: 16, scope: !126)
!129 = !DILocation(line: 95, column: 22, scope: !126)
!130 = !DILocation(line: 95, column: 9, scope: !126)
!131 = !DILocation(line: 96, column: 20, scope: !126)
!132 = !DILocation(line: 96, column: 9, scope: !126)
!133 = !DILocation(line: 97, column: 14, scope: !126)
!134 = !DILocation(line: 97, column: 9, scope: !126)
!135 = !DILocation(line: 99, column: 1, scope: !107)
