; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_42_bad() #0 !dbg !18 {
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
  %call1 = call i32* @badSource(i32* noundef %2), !dbg !35
  store i32* %call1, i32** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  %call2 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %4), !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* noundef %5), !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  %7 = bitcast i32* %6 to i8*, !dbg !48
  call void @free(i8* noundef %7), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @badSource(i32* noundef %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %0 = load i32*, i32** %data.addr, align 8, !dbg !56
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !57
  %1 = load i32*, i32** %data.addr, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !58
  store i32 0, i32* %arrayidx, align 4, !dbg !59
  %2 = load i32*, i32** %data.addr, align 8, !dbg !60
  ret i32* %2, !dbg !61
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare i32* @wcscpy(i32* noundef, i32* noundef) #5

declare void @printWLine(i32* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_42_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_42_good(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_42_bad(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !85 {
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
  %2 = load i32*, i32** %data, align 8, !dbg !97
  %call1 = call i32* @goodG2BSource(i32* noundef %2), !dbg !98
  store i32* %call1, i32** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !103
  %4 = load i32*, i32** %data, align 8, !dbg !104
  %call2 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %4), !dbg !105
  %5 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* noundef %5), !dbg !107
  %6 = load i32*, i32** %data, align 8, !dbg !108
  %7 = bitcast i32* %6 to i8*, !dbg !108
  call void @free(i8* noundef %7), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @goodG2BSource(i32* noundef %data) #0 !dbg !111 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = load i32*, i32** %data.addr, align 8, !dbg !114
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !115
  %1 = load i32*, i32** %data.addr, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %2 = load i32*, i32** %data.addr, align 8, !dbg !118
  ret i32* %2, !dbg !119
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_42_bad", scope: !19, file: !19, line: 31, type: !20, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 33, type: !3)
!24 = !DILocation(line: 33, column: 15, scope: !18)
!25 = !DILocation(line: 34, column: 23, scope: !18)
!26 = !DILocation(line: 34, column: 12, scope: !18)
!27 = !DILocation(line: 34, column: 10, scope: !18)
!28 = !DILocation(line: 35, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 9)
!30 = !DILocation(line: 35, column: 14, scope: !29)
!31 = !DILocation(line: 35, column: 9, scope: !18)
!32 = !DILocation(line: 35, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 35, column: 23)
!34 = !DILocation(line: 36, column: 22, scope: !18)
!35 = !DILocation(line: 36, column: 12, scope: !18)
!36 = !DILocation(line: 36, column: 10, scope: !18)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !19, line: 38, type: !39)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 37, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 38, column: 17, scope: !38)
!43 = !DILocation(line: 40, column: 16, scope: !38)
!44 = !DILocation(line: 40, column: 22, scope: !38)
!45 = !DILocation(line: 40, column: 9, scope: !38)
!46 = !DILocation(line: 41, column: 20, scope: !38)
!47 = !DILocation(line: 41, column: 9, scope: !38)
!48 = !DILocation(line: 42, column: 14, scope: !38)
!49 = !DILocation(line: 42, column: 9, scope: !38)
!50 = !DILocation(line: 44, column: 1, scope: !18)
!51 = distinct !DISubprogram(name: "badSource", scope: !19, file: !19, line: 23, type: !52, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!52 = !DISubroutineType(types: !53)
!53 = !{!3, !3}
!54 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !19, line: 23, type: !3)
!55 = !DILocation(line: 23, column: 38, scope: !51)
!56 = !DILocation(line: 26, column: 13, scope: !51)
!57 = !DILocation(line: 26, column: 5, scope: !51)
!58 = !DILocation(line: 27, column: 5, scope: !51)
!59 = !DILocation(line: 27, column: 17, scope: !51)
!60 = !DILocation(line: 28, column: 12, scope: !51)
!61 = !DILocation(line: 28, column: 5, scope: !51)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_42_good", scope: !19, file: !19, line: 74, type: !20, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!63 = !DILocation(line: 76, column: 5, scope: !62)
!64 = !DILocation(line: 77, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 89, type: !66, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!66 = !DISubroutineType(types: !67)
!67 = !{!8, !8, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !19, line: 89, type: !8)
!72 = !DILocation(line: 89, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !19, line: 89, type: !68)
!74 = !DILocation(line: 89, column: 27, scope: !65)
!75 = !DILocation(line: 92, column: 22, scope: !65)
!76 = !DILocation(line: 92, column: 12, scope: !65)
!77 = !DILocation(line: 92, column: 5, scope: !65)
!78 = !DILocation(line: 94, column: 5, scope: !65)
!79 = !DILocation(line: 95, column: 5, scope: !65)
!80 = !DILocation(line: 96, column: 5, scope: !65)
!81 = !DILocation(line: 99, column: 5, scope: !65)
!82 = !DILocation(line: 100, column: 5, scope: !65)
!83 = !DILocation(line: 101, column: 5, scope: !65)
!84 = !DILocation(line: 103, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!86 = !DILocalVariable(name: "data", scope: !85, file: !19, line: 61, type: !3)
!87 = !DILocation(line: 61, column: 15, scope: !85)
!88 = !DILocation(line: 62, column: 23, scope: !85)
!89 = !DILocation(line: 62, column: 12, scope: !85)
!90 = !DILocation(line: 62, column: 10, scope: !85)
!91 = !DILocation(line: 63, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !19, line: 63, column: 9)
!93 = !DILocation(line: 63, column: 14, scope: !92)
!94 = !DILocation(line: 63, column: 9, scope: !85)
!95 = !DILocation(line: 63, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !19, line: 63, column: 23)
!97 = !DILocation(line: 64, column: 26, scope: !85)
!98 = !DILocation(line: 64, column: 12, scope: !85)
!99 = !DILocation(line: 64, column: 10, scope: !85)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !19, line: 66, type: !39)
!101 = distinct !DILexicalBlock(scope: !85, file: !19, line: 65, column: 5)
!102 = !DILocation(line: 66, column: 17, scope: !101)
!103 = !DILocation(line: 68, column: 16, scope: !101)
!104 = !DILocation(line: 68, column: 22, scope: !101)
!105 = !DILocation(line: 68, column: 9, scope: !101)
!106 = !DILocation(line: 69, column: 20, scope: !101)
!107 = !DILocation(line: 69, column: 9, scope: !101)
!108 = !DILocation(line: 70, column: 14, scope: !101)
!109 = !DILocation(line: 70, column: 9, scope: !101)
!110 = !DILocation(line: 72, column: 1, scope: !85)
!111 = distinct !DISubprogram(name: "goodG2BSource", scope: !19, file: !19, line: 50, type: !52, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!112 = !DILocalVariable(name: "data", arg: 1, scope: !111, file: !19, line: 50, type: !3)
!113 = !DILocation(line: 50, column: 42, scope: !111)
!114 = !DILocation(line: 53, column: 13, scope: !111)
!115 = !DILocation(line: 53, column: 5, scope: !111)
!116 = !DILocation(line: 54, column: 5, scope: !111)
!117 = !DILocation(line: 54, column: 16, scope: !111)
!118 = !DILocation(line: 55, column: 12, scope: !111)
!119 = !DILocation(line: 55, column: 5, scope: !111)
