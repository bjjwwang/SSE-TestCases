; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !37, metadata !DIExpression()), !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %3, i32** %dataCopy, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !41, metadata !DIExpression()), !dbg !42
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !43
  store i32* %4, i32** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !51
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx3, align 4, !dbg !53
  %5 = load i32*, i32** %data1, align 8, !dbg !54
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %call5 = call i32* @wcscpy(i32* noundef %5, i32* noundef %arraydecay4), !dbg !56
  %6 = load i32*, i32** %data1, align 8, !dbg !57
  call void @printWLine(i32* noundef %6), !dbg !58
  %7 = load i32*, i32** %data1, align 8, !dbg !59
  %8 = bitcast i32* %7 to i8*, !dbg !59
  call void @free(i8* noundef %8), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

declare i32* @wcscpy(i32* noundef, i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_good() #0 !dbg !62 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_good(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_bad(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !89
  %0 = bitcast i8* %call to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !100, metadata !DIExpression()), !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  store i32* %3, i32** %dataCopy, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !104, metadata !DIExpression()), !dbg !105
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !106
  store i32* %4, i32** %data1, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !111
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx3, align 4, !dbg !113
  %5 = load i32*, i32** %data1, align 8, !dbg !114
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %call5 = call i32* @wcscpy(i32* noundef %5, i32* noundef %arraydecay4), !dbg !116
  %6 = load i32*, i32** %data1, align 8, !dbg !117
  call void @printWLine(i32* noundef %6), !dbg !118
  %7 = load i32*, i32** %data1, align 8, !dbg !119
  %8 = bitcast i32* %7 to i8*, !dbg !119
  call void @free(i8* noundef %8), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 10, scope: !18)
!26 = !DILocation(line: 28, column: 23, scope: !18)
!27 = !DILocation(line: 28, column: 12, scope: !18)
!28 = !DILocation(line: 28, column: 10, scope: !18)
!29 = !DILocation(line: 29, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 9)
!31 = !DILocation(line: 29, column: 14, scope: !30)
!32 = !DILocation(line: 29, column: 9, scope: !18)
!33 = !DILocation(line: 29, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !19, line: 29, column: 23)
!35 = !DILocation(line: 30, column: 5, scope: !18)
!36 = !DILocation(line: 30, column: 13, scope: !18)
!37 = !DILocalVariable(name: "dataCopy", scope: !38, file: !19, line: 32, type: !3)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 5)
!39 = !DILocation(line: 32, column: 19, scope: !38)
!40 = !DILocation(line: 32, column: 30, scope: !38)
!41 = !DILocalVariable(name: "data", scope: !38, file: !19, line: 33, type: !3)
!42 = !DILocation(line: 33, column: 19, scope: !38)
!43 = !DILocation(line: 33, column: 26, scope: !38)
!44 = !DILocalVariable(name: "source", scope: !45, file: !19, line: 35, type: !46)
!45 = distinct !DILexicalBlock(scope: !38, file: !19, line: 34, column: 9)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 35, column: 21, scope: !45)
!50 = !DILocation(line: 36, column: 21, scope: !45)
!51 = !DILocation(line: 36, column: 13, scope: !45)
!52 = !DILocation(line: 37, column: 13, scope: !45)
!53 = !DILocation(line: 37, column: 27, scope: !45)
!54 = !DILocation(line: 39, column: 20, scope: !45)
!55 = !DILocation(line: 39, column: 26, scope: !45)
!56 = !DILocation(line: 39, column: 13, scope: !45)
!57 = !DILocation(line: 40, column: 24, scope: !45)
!58 = !DILocation(line: 40, column: 13, scope: !45)
!59 = !DILocation(line: 41, column: 18, scope: !45)
!60 = !DILocation(line: 41, column: 13, scope: !45)
!61 = !DILocation(line: 44, column: 1, scope: !18)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_31_good", scope: !19, file: !19, line: 74, type: !20, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!63 = !DILocation(line: 76, column: 5, scope: !62)
!64 = !DILocation(line: 77, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 88, type: !66, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!66 = !DISubroutineType(types: !67)
!67 = !{!8, !8, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !19, line: 88, type: !8)
!72 = !DILocation(line: 88, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !19, line: 88, type: !68)
!74 = !DILocation(line: 88, column: 27, scope: !65)
!75 = !DILocation(line: 91, column: 22, scope: !65)
!76 = !DILocation(line: 91, column: 12, scope: !65)
!77 = !DILocation(line: 91, column: 5, scope: !65)
!78 = !DILocation(line: 93, column: 5, scope: !65)
!79 = !DILocation(line: 94, column: 5, scope: !65)
!80 = !DILocation(line: 95, column: 5, scope: !65)
!81 = !DILocation(line: 98, column: 5, scope: !65)
!82 = !DILocation(line: 99, column: 5, scope: !65)
!83 = !DILocation(line: 100, column: 5, scope: !65)
!84 = !DILocation(line: 102, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 51, type: !20, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!86 = !DILocalVariable(name: "data", scope: !85, file: !19, line: 53, type: !3)
!87 = !DILocation(line: 53, column: 15, scope: !85)
!88 = !DILocation(line: 54, column: 10, scope: !85)
!89 = !DILocation(line: 56, column: 23, scope: !85)
!90 = !DILocation(line: 56, column: 12, scope: !85)
!91 = !DILocation(line: 56, column: 10, scope: !85)
!92 = !DILocation(line: 57, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !85, file: !19, line: 57, column: 9)
!94 = !DILocation(line: 57, column: 14, scope: !93)
!95 = !DILocation(line: 57, column: 9, scope: !85)
!96 = !DILocation(line: 57, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !19, line: 57, column: 23)
!98 = !DILocation(line: 58, column: 5, scope: !85)
!99 = !DILocation(line: 58, column: 13, scope: !85)
!100 = !DILocalVariable(name: "dataCopy", scope: !101, file: !19, line: 60, type: !3)
!101 = distinct !DILexicalBlock(scope: !85, file: !19, line: 59, column: 5)
!102 = !DILocation(line: 60, column: 19, scope: !101)
!103 = !DILocation(line: 60, column: 30, scope: !101)
!104 = !DILocalVariable(name: "data", scope: !101, file: !19, line: 61, type: !3)
!105 = !DILocation(line: 61, column: 19, scope: !101)
!106 = !DILocation(line: 61, column: 26, scope: !101)
!107 = !DILocalVariable(name: "source", scope: !108, file: !19, line: 63, type: !46)
!108 = distinct !DILexicalBlock(scope: !101, file: !19, line: 62, column: 9)
!109 = !DILocation(line: 63, column: 21, scope: !108)
!110 = !DILocation(line: 64, column: 21, scope: !108)
!111 = !DILocation(line: 64, column: 13, scope: !108)
!112 = !DILocation(line: 65, column: 13, scope: !108)
!113 = !DILocation(line: 65, column: 27, scope: !108)
!114 = !DILocation(line: 67, column: 20, scope: !108)
!115 = !DILocation(line: 67, column: 26, scope: !108)
!116 = !DILocation(line: 67, column: 13, scope: !108)
!117 = !DILocation(line: 68, column: 24, scope: !108)
!118 = !DILocation(line: 68, column: 13, scope: !108)
!119 = !DILocation(line: 69, column: 18, scope: !108)
!120 = !DILocation(line: 69, column: 13, scope: !108)
!121 = !DILocation(line: 72, column: 1, scope: !85)
