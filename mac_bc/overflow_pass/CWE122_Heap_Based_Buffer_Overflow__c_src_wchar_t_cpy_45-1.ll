; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_goodG2BData = internal global i32* null, align 8, !dbg !14

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !28, metadata !DIExpression()), !dbg !29
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %data, align 8, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %4 = load i32*, i32** %data, align 8, !dbg !43
  store i32* %4, i32** @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_badData, align 8, !dbg !44
  call void @badSink(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_badData, align 8, !dbg !73
  store i32* %0, i32** %data, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !74, metadata !DIExpression()), !dbg !79
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !79
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !80
  %2 = load i32*, i32** %data, align 8, !dbg !81
  %call = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %2), !dbg !82
  %3 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* noundef %3), !dbg !84
  %4 = load i32*, i32** %data, align 8, !dbg !85
  %5 = bitcast i32* %4 to i8*, !dbg !85
  call void @free(i8* noundef %5), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare i32* @wcscpy(i32* noundef, i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !91
  %0 = bitcast i8* %call to i32*, !dbg !92
  store i32* %0, i32** %data, align 8, !dbg !93
  %1 = load i32*, i32** %data, align 8, !dbg !94
  %cmp = icmp eq i32* %1, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %4 = load i32*, i32** %data, align 8, !dbg !104
  store i32* %4, i32** @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_goodG2BData, align 8, !dbg !105
  call void @goodG2BSink(), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_goodG2BData, align 8, !dbg !111
  store i32* %0, i32** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !114
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !115
  %2 = load i32*, i32** %data, align 8, !dbg !116
  %call = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %2), !dbg !117
  %3 = load i32*, i32** %data, align 8, !dbg !118
  call void @printWLine(i32* noundef %3), !dbg !119
  %4 = load i32*, i32** %data, align 8, !dbg !120
  %5 = bitcast i32* %4 to i8*, !dbg !120
  call void @free(i8* noundef %5), !dbg !121
  ret void, !dbg !122
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
!llvm.module.flags = !{!17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_badData", scope: !2, file: !16, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11, !12}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_goodG2BData", scope: !2, file: !16, line: 22, type: !5, isLocal: true, isDefinition: true)
!16 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Homebrew clang version 14.0.6"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_bad", scope: !16, file: !16, line: 38, type: !25, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !{}
!28 = !DILocalVariable(name: "data", scope: !24, file: !16, line: 40, type: !5)
!29 = !DILocation(line: 40, column: 15, scope: !24)
!30 = !DILocation(line: 41, column: 23, scope: !24)
!31 = !DILocation(line: 41, column: 12, scope: !24)
!32 = !DILocation(line: 41, column: 10, scope: !24)
!33 = !DILocation(line: 42, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !24, file: !16, line: 42, column: 9)
!35 = !DILocation(line: 42, column: 14, scope: !34)
!36 = !DILocation(line: 42, column: 9, scope: !24)
!37 = !DILocation(line: 42, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !16, line: 42, column: 23)
!39 = !DILocation(line: 44, column: 13, scope: !24)
!40 = !DILocation(line: 44, column: 5, scope: !24)
!41 = !DILocation(line: 45, column: 5, scope: !24)
!42 = !DILocation(line: 45, column: 17, scope: !24)
!43 = !DILocation(line: 46, column: 71, scope: !24)
!44 = !DILocation(line: 46, column: 69, scope: !24)
!45 = !DILocation(line: 47, column: 5, scope: !24)
!46 = !DILocation(line: 48, column: 1, scope: !24)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_45_good", scope: !16, file: !16, line: 79, type: !25, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!48 = !DILocation(line: 81, column: 5, scope: !47)
!49 = !DILocation(line: 82, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 93, type: !51, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!51 = !DISubroutineType(types: !52)
!52 = !{!10, !10, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !16, line: 93, type: !10)
!57 = !DILocation(line: 93, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !16, line: 93, type: !53)
!59 = !DILocation(line: 93, column: 27, scope: !50)
!60 = !DILocation(line: 96, column: 22, scope: !50)
!61 = !DILocation(line: 96, column: 12, scope: !50)
!62 = !DILocation(line: 96, column: 5, scope: !50)
!63 = !DILocation(line: 98, column: 5, scope: !50)
!64 = !DILocation(line: 99, column: 5, scope: !50)
!65 = !DILocation(line: 100, column: 5, scope: !50)
!66 = !DILocation(line: 103, column: 5, scope: !50)
!67 = !DILocation(line: 104, column: 5, scope: !50)
!68 = !DILocation(line: 105, column: 5, scope: !50)
!69 = !DILocation(line: 107, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 26, type: !25, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!71 = !DILocalVariable(name: "data", scope: !70, file: !16, line: 28, type: !5)
!72 = !DILocation(line: 28, column: 15, scope: !70)
!73 = !DILocation(line: 28, column: 22, scope: !70)
!74 = !DILocalVariable(name: "dest", scope: !75, file: !16, line: 30, type: !76)
!75 = distinct !DILexicalBlock(scope: !70, file: !16, line: 29, column: 5)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 50)
!79 = !DILocation(line: 30, column: 17, scope: !75)
!80 = !DILocation(line: 32, column: 16, scope: !75)
!81 = !DILocation(line: 32, column: 22, scope: !75)
!82 = !DILocation(line: 32, column: 9, scope: !75)
!83 = !DILocation(line: 33, column: 20, scope: !75)
!84 = !DILocation(line: 33, column: 9, scope: !75)
!85 = !DILocation(line: 34, column: 14, scope: !75)
!86 = !DILocation(line: 34, column: 9, scope: !75)
!87 = !DILocation(line: 36, column: 1, scope: !70)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 67, type: !25, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!89 = !DILocalVariable(name: "data", scope: !88, file: !16, line: 69, type: !5)
!90 = !DILocation(line: 69, column: 15, scope: !88)
!91 = !DILocation(line: 70, column: 23, scope: !88)
!92 = !DILocation(line: 70, column: 12, scope: !88)
!93 = !DILocation(line: 70, column: 10, scope: !88)
!94 = !DILocation(line: 71, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !16, line: 71, column: 9)
!96 = !DILocation(line: 71, column: 14, scope: !95)
!97 = !DILocation(line: 71, column: 9, scope: !88)
!98 = !DILocation(line: 71, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !16, line: 71, column: 23)
!100 = !DILocation(line: 73, column: 13, scope: !88)
!101 = !DILocation(line: 73, column: 5, scope: !88)
!102 = !DILocation(line: 74, column: 5, scope: !88)
!103 = !DILocation(line: 74, column: 16, scope: !88)
!104 = !DILocation(line: 75, column: 75, scope: !88)
!105 = !DILocation(line: 75, column: 73, scope: !88)
!106 = !DILocation(line: 76, column: 5, scope: !88)
!107 = !DILocation(line: 77, column: 1, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 55, type: !25, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!109 = !DILocalVariable(name: "data", scope: !108, file: !16, line: 57, type: !5)
!110 = !DILocation(line: 57, column: 15, scope: !108)
!111 = !DILocation(line: 57, column: 22, scope: !108)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !16, line: 59, type: !76)
!113 = distinct !DILexicalBlock(scope: !108, file: !16, line: 58, column: 5)
!114 = !DILocation(line: 59, column: 17, scope: !113)
!115 = !DILocation(line: 61, column: 16, scope: !113)
!116 = !DILocation(line: 61, column: 22, scope: !113)
!117 = !DILocation(line: 61, column: 9, scope: !113)
!118 = !DILocation(line: 62, column: 20, scope: !113)
!119 = !DILocation(line: 62, column: 9, scope: !113)
!120 = !DILocation(line: 63, column: 14, scope: !113)
!121 = !DILocation(line: 63, column: 9, scope: !113)
!122 = !DILocation(line: 65, column: 1, scope: !108)
