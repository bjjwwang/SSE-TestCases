; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_07_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !37
  %cmp1 = icmp eq i32 %2, 5, !dbg !39
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !40

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  br label %if.end4, !dbg !46

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !52
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !53
  %6 = load i32*, i32** %data, align 8, !dbg !54
  %call5 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %6), !dbg !55
  %7 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* noundef %7), !dbg !57
  %8 = load i32*, i32** %data, align 8, !dbg !58
  %9 = bitcast i32* %8 to i8*, !dbg !58
  call void @free(i8* noundef %9), !dbg !59
  ret void, !dbg !60
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

declare i32* @wcscat(i32* noundef, i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_07_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* noundef null), !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 noundef %conv), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_07_good(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_07_bad(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !88
  %0 = bitcast i8* %call to i32*, !dbg !89
  store i32* %0, i32** %data, align 8, !dbg !90
  %1 = load i32*, i32** %data, align 8, !dbg !91
  %cmp = icmp eq i32* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !97
  %cmp1 = icmp ne i32 %2, 5, !dbg !99
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !100

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !101
  br label %if.end4, !dbg !103

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !104
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !106
  %4 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !111
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !112
  %6 = load i32*, i32** %data, align 8, !dbg !113
  %call5 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %6), !dbg !114
  %7 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* noundef %7), !dbg !116
  %8 = load i32*, i32** %data, align 8, !dbg !117
  %9 = bitcast i32* %8 to i8*, !dbg !117
  call void @free(i8* noundef %9), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !123
  %0 = bitcast i8* %call to i32*, !dbg !124
  store i32* %0, i32** %data, align 8, !dbg !125
  %1 = load i32*, i32** %data, align 8, !dbg !126
  %cmp = icmp eq i32* %1, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !132
  %cmp1 = icmp eq i32 %2, 5, !dbg !134
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !135

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !136
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !138
  %4 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !139
  store i32 0, i32* %arrayidx, align 4, !dbg !140
  br label %if.end4, !dbg !141

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !144
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !144
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !145
  %6 = load i32*, i32** %data, align 8, !dbg !146
  %call5 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %6), !dbg !147
  %7 = load i32*, i32** %data, align 8, !dbg !148
  call void @printWLine(i32* noundef %7), !dbg !149
  %8 = load i32*, i32** %data, align 8, !dbg !150
  %9 = bitcast i32* %8 to i8*, !dbg !150
  call void @free(i8* noundef %9), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !14, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11, !12}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0}
!14 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Homebrew clang version 14.0.6"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_07_bad", scope: !14, file: !14, line: 29, type: !23, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !{}
!26 = !DILocalVariable(name: "data", scope: !22, file: !14, line: 31, type: !5)
!27 = !DILocation(line: 31, column: 15, scope: !22)
!28 = !DILocation(line: 32, column: 23, scope: !22)
!29 = !DILocation(line: 32, column: 12, scope: !22)
!30 = !DILocation(line: 32, column: 10, scope: !22)
!31 = !DILocation(line: 33, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !14, line: 33, column: 9)
!33 = !DILocation(line: 33, column: 14, scope: !32)
!34 = !DILocation(line: 33, column: 9, scope: !22)
!35 = !DILocation(line: 33, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !14, line: 33, column: 23)
!37 = !DILocation(line: 34, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !22, file: !14, line: 34, column: 8)
!39 = !DILocation(line: 34, column: 18, scope: !38)
!40 = !DILocation(line: 34, column: 8, scope: !22)
!41 = !DILocation(line: 37, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !14, line: 35, column: 5)
!43 = !DILocation(line: 37, column: 9, scope: !42)
!44 = !DILocation(line: 38, column: 9, scope: !42)
!45 = !DILocation(line: 38, column: 21, scope: !42)
!46 = !DILocation(line: 39, column: 5, scope: !42)
!47 = !DILocalVariable(name: "dest", scope: !48, file: !14, line: 41, type: !49)
!48 = distinct !DILexicalBlock(scope: !22, file: !14, line: 40, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 50)
!52 = !DILocation(line: 41, column: 17, scope: !48)
!53 = !DILocation(line: 43, column: 16, scope: !48)
!54 = !DILocation(line: 43, column: 22, scope: !48)
!55 = !DILocation(line: 43, column: 9, scope: !48)
!56 = !DILocation(line: 44, column: 20, scope: !48)
!57 = !DILocation(line: 44, column: 9, scope: !48)
!58 = !DILocation(line: 45, column: 14, scope: !48)
!59 = !DILocation(line: 45, column: 9, scope: !48)
!60 = !DILocation(line: 47, column: 1, scope: !22)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_07_good", scope: !14, file: !14, line: 100, type: !23, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!62 = !DILocation(line: 102, column: 5, scope: !61)
!63 = !DILocation(line: 103, column: 5, scope: !61)
!64 = !DILocation(line: 104, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 116, type: !66, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!66 = !DISubroutineType(types: !67)
!67 = !{!10, !10, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !14, line: 116, type: !10)
!72 = !DILocation(line: 116, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !14, line: 116, type: !68)
!74 = !DILocation(line: 116, column: 27, scope: !65)
!75 = !DILocation(line: 119, column: 22, scope: !65)
!76 = !DILocation(line: 119, column: 12, scope: !65)
!77 = !DILocation(line: 119, column: 5, scope: !65)
!78 = !DILocation(line: 121, column: 5, scope: !65)
!79 = !DILocation(line: 122, column: 5, scope: !65)
!80 = !DILocation(line: 123, column: 5, scope: !65)
!81 = !DILocation(line: 126, column: 5, scope: !65)
!82 = !DILocation(line: 127, column: 5, scope: !65)
!83 = !DILocation(line: 128, column: 5, scope: !65)
!84 = !DILocation(line: 130, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !23, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!86 = !DILocalVariable(name: "data", scope: !85, file: !14, line: 56, type: !5)
!87 = !DILocation(line: 56, column: 15, scope: !85)
!88 = !DILocation(line: 57, column: 23, scope: !85)
!89 = !DILocation(line: 57, column: 12, scope: !85)
!90 = !DILocation(line: 57, column: 10, scope: !85)
!91 = !DILocation(line: 58, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !14, line: 58, column: 9)
!93 = !DILocation(line: 58, column: 14, scope: !92)
!94 = !DILocation(line: 58, column: 9, scope: !85)
!95 = !DILocation(line: 58, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !14, line: 58, column: 23)
!97 = !DILocation(line: 59, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !85, file: !14, line: 59, column: 8)
!99 = !DILocation(line: 59, column: 18, scope: !98)
!100 = !DILocation(line: 59, column: 8, scope: !85)
!101 = !DILocation(line: 62, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !14, line: 60, column: 5)
!103 = !DILocation(line: 63, column: 5, scope: !102)
!104 = !DILocation(line: 67, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !98, file: !14, line: 65, column: 5)
!106 = !DILocation(line: 67, column: 9, scope: !105)
!107 = !DILocation(line: 68, column: 9, scope: !105)
!108 = !DILocation(line: 68, column: 20, scope: !105)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !14, line: 71, type: !49)
!110 = distinct !DILexicalBlock(scope: !85, file: !14, line: 70, column: 5)
!111 = !DILocation(line: 71, column: 17, scope: !110)
!112 = !DILocation(line: 73, column: 16, scope: !110)
!113 = !DILocation(line: 73, column: 22, scope: !110)
!114 = !DILocation(line: 73, column: 9, scope: !110)
!115 = !DILocation(line: 74, column: 20, scope: !110)
!116 = !DILocation(line: 74, column: 9, scope: !110)
!117 = !DILocation(line: 75, column: 14, scope: !110)
!118 = !DILocation(line: 75, column: 9, scope: !110)
!119 = !DILocation(line: 77, column: 1, scope: !85)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 80, type: !23, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!121 = !DILocalVariable(name: "data", scope: !120, file: !14, line: 82, type: !5)
!122 = !DILocation(line: 82, column: 15, scope: !120)
!123 = !DILocation(line: 83, column: 23, scope: !120)
!124 = !DILocation(line: 83, column: 12, scope: !120)
!125 = !DILocation(line: 83, column: 10, scope: !120)
!126 = !DILocation(line: 84, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !14, line: 84, column: 9)
!128 = !DILocation(line: 84, column: 14, scope: !127)
!129 = !DILocation(line: 84, column: 9, scope: !120)
!130 = !DILocation(line: 84, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !14, line: 84, column: 23)
!132 = !DILocation(line: 85, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !120, file: !14, line: 85, column: 8)
!134 = !DILocation(line: 85, column: 18, scope: !133)
!135 = !DILocation(line: 85, column: 8, scope: !120)
!136 = !DILocation(line: 88, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !14, line: 86, column: 5)
!138 = !DILocation(line: 88, column: 9, scope: !137)
!139 = !DILocation(line: 89, column: 9, scope: !137)
!140 = !DILocation(line: 89, column: 20, scope: !137)
!141 = !DILocation(line: 90, column: 5, scope: !137)
!142 = !DILocalVariable(name: "dest", scope: !143, file: !14, line: 92, type: !49)
!143 = distinct !DILexicalBlock(scope: !120, file: !14, line: 91, column: 5)
!144 = !DILocation(line: 92, column: 17, scope: !143)
!145 = !DILocation(line: 94, column: 16, scope: !143)
!146 = !DILocation(line: 94, column: 22, scope: !143)
!147 = !DILocation(line: 94, column: 9, scope: !143)
!148 = !DILocation(line: 95, column: 20, scope: !143)
!149 = !DILocation(line: 95, column: 9, scope: !143)
!150 = !DILocation(line: 96, column: 14, scope: !143)
!151 = !DILocation(line: 96, column: 9, scope: !143)
!152 = !DILocation(line: 98, column: 1, scope: !120)
