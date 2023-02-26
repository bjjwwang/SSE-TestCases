; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_15_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx2, align 4, !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call4 = call i32* @wcscpy(i32* noundef %3, i32* noundef %arraydecay3), !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* noundef %4), !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !52
  %6 = bitcast i32* %5 to i8*, !dbg !52
  call void @free(i8* noundef %6), !dbg !53
  ret void, !dbg !54
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_15_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_15_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_15_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !83
  %0 = bitcast i8* %call to i32*, !dbg !84
  store i32* %0, i32** %data, align 8, !dbg !85
  %1 = load i32*, i32** %data, align 8, !dbg !86
  %cmp = icmp eq i32* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !97
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !98
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !99
  store i32 0, i32* %arrayidx2, align 4, !dbg !100
  %3 = load i32*, i32** %data, align 8, !dbg !101
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !102
  %call4 = call i32* @wcscpy(i32* noundef %3, i32* noundef %arraydecay3), !dbg !103
  %4 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* noundef %4), !dbg !105
  %5 = load i32*, i32** %data, align 8, !dbg !106
  %6 = bitcast i32* %5 to i8*, !dbg !106
  call void @free(i8* noundef %6), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  store i32* null, i32** %data, align 8, !dbg !112
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !113
  %0 = bitcast i8* %call to i32*, !dbg !114
  store i32* %0, i32** %data, align 8, !dbg !115
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %cmp = icmp eq i32* %1, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !127
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !128
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx2, align 4, !dbg !130
  %3 = load i32*, i32** %data, align 8, !dbg !131
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !132
  %call4 = call i32* @wcscpy(i32* noundef %3, i32* noundef %arraydecay3), !dbg !133
  %4 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* noundef %4), !dbg !135
  %5 = load i32*, i32** %data, align 8, !dbg !136
  %6 = bitcast i32* %5 to i8*, !dbg !136
  call void @free(i8* noundef %6), !dbg !137
  ret void, !dbg !138
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_15_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 10, scope: !18)
!26 = !DILocation(line: 31, column: 27, scope: !18)
!27 = !DILocation(line: 31, column: 16, scope: !18)
!28 = !DILocation(line: 31, column: 14, scope: !18)
!29 = !DILocation(line: 32, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !19, line: 32, column: 13)
!31 = !DILocation(line: 32, column: 18, scope: !30)
!32 = !DILocation(line: 32, column: 13, scope: !18)
!33 = !DILocation(line: 32, column: 28, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !19, line: 32, column: 27)
!35 = !DILocation(line: 33, column: 9, scope: !18)
!36 = !DILocation(line: 33, column: 17, scope: !18)
!37 = !DILocalVariable(name: "source", scope: !38, file: !19, line: 41, type: !39)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 40, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 41, column: 17, scope: !38)
!43 = !DILocation(line: 42, column: 17, scope: !38)
!44 = !DILocation(line: 42, column: 9, scope: !38)
!45 = !DILocation(line: 43, column: 9, scope: !38)
!46 = !DILocation(line: 43, column: 23, scope: !38)
!47 = !DILocation(line: 45, column: 16, scope: !38)
!48 = !DILocation(line: 45, column: 22, scope: !38)
!49 = !DILocation(line: 45, column: 9, scope: !38)
!50 = !DILocation(line: 46, column: 20, scope: !38)
!51 = !DILocation(line: 46, column: 9, scope: !38)
!52 = !DILocation(line: 47, column: 14, scope: !38)
!53 = !DILocation(line: 47, column: 9, scope: !38)
!54 = !DILocation(line: 49, column: 1, scope: !18)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_15_good", scope: !19, file: !19, line: 113, type: !20, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!56 = !DILocation(line: 115, column: 5, scope: !55)
!57 = !DILocation(line: 116, column: 5, scope: !55)
!58 = !DILocation(line: 117, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 129, type: !60, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!60 = !DISubroutineType(types: !61)
!61 = !{!8, !8, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !19, line: 129, type: !8)
!66 = !DILocation(line: 129, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !19, line: 129, type: !62)
!68 = !DILocation(line: 129, column: 27, scope: !59)
!69 = !DILocation(line: 132, column: 22, scope: !59)
!70 = !DILocation(line: 132, column: 12, scope: !59)
!71 = !DILocation(line: 132, column: 5, scope: !59)
!72 = !DILocation(line: 134, column: 5, scope: !59)
!73 = !DILocation(line: 135, column: 5, scope: !59)
!74 = !DILocation(line: 136, column: 5, scope: !59)
!75 = !DILocation(line: 139, column: 5, scope: !59)
!76 = !DILocation(line: 140, column: 5, scope: !59)
!77 = !DILocation(line: 141, column: 5, scope: !59)
!78 = !DILocation(line: 143, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!80 = !DILocalVariable(name: "data", scope: !79, file: !19, line: 58, type: !3)
!81 = !DILocation(line: 58, column: 15, scope: !79)
!82 = !DILocation(line: 59, column: 10, scope: !79)
!83 = !DILocation(line: 68, column: 27, scope: !79)
!84 = !DILocation(line: 68, column: 16, scope: !79)
!85 = !DILocation(line: 68, column: 14, scope: !79)
!86 = !DILocation(line: 69, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !19, line: 69, column: 13)
!88 = !DILocation(line: 69, column: 18, scope: !87)
!89 = !DILocation(line: 69, column: 13, scope: !79)
!90 = !DILocation(line: 69, column: 28, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !19, line: 69, column: 27)
!92 = !DILocation(line: 70, column: 9, scope: !79)
!93 = !DILocation(line: 70, column: 17, scope: !79)
!94 = !DILocalVariable(name: "source", scope: !95, file: !19, line: 74, type: !39)
!95 = distinct !DILexicalBlock(scope: !79, file: !19, line: 73, column: 5)
!96 = !DILocation(line: 74, column: 17, scope: !95)
!97 = !DILocation(line: 75, column: 17, scope: !95)
!98 = !DILocation(line: 75, column: 9, scope: !95)
!99 = !DILocation(line: 76, column: 9, scope: !95)
!100 = !DILocation(line: 76, column: 23, scope: !95)
!101 = !DILocation(line: 78, column: 16, scope: !95)
!102 = !DILocation(line: 78, column: 22, scope: !95)
!103 = !DILocation(line: 78, column: 9, scope: !95)
!104 = !DILocation(line: 79, column: 20, scope: !95)
!105 = !DILocation(line: 79, column: 9, scope: !95)
!106 = !DILocation(line: 80, column: 14, scope: !95)
!107 = !DILocation(line: 80, column: 9, scope: !95)
!108 = !DILocation(line: 82, column: 1, scope: !79)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 85, type: !20, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!110 = !DILocalVariable(name: "data", scope: !109, file: !19, line: 87, type: !3)
!111 = !DILocation(line: 87, column: 15, scope: !109)
!112 = !DILocation(line: 88, column: 10, scope: !109)
!113 = !DILocation(line: 93, column: 27, scope: !109)
!114 = !DILocation(line: 93, column: 16, scope: !109)
!115 = !DILocation(line: 93, column: 14, scope: !109)
!116 = !DILocation(line: 94, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !19, line: 94, column: 13)
!118 = !DILocation(line: 94, column: 18, scope: !117)
!119 = !DILocation(line: 94, column: 13, scope: !109)
!120 = !DILocation(line: 94, column: 28, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !19, line: 94, column: 27)
!122 = !DILocation(line: 95, column: 9, scope: !109)
!123 = !DILocation(line: 95, column: 17, scope: !109)
!124 = !DILocalVariable(name: "source", scope: !125, file: !19, line: 103, type: !39)
!125 = distinct !DILexicalBlock(scope: !109, file: !19, line: 102, column: 5)
!126 = !DILocation(line: 103, column: 17, scope: !125)
!127 = !DILocation(line: 104, column: 17, scope: !125)
!128 = !DILocation(line: 104, column: 9, scope: !125)
!129 = !DILocation(line: 105, column: 9, scope: !125)
!130 = !DILocation(line: 105, column: 23, scope: !125)
!131 = !DILocation(line: 107, column: 16, scope: !125)
!132 = !DILocation(line: 107, column: 22, scope: !125)
!133 = !DILocation(line: 107, column: 9, scope: !125)
!134 = !DILocation(line: 108, column: 20, scope: !125)
!135 = !DILocation(line: 108, column: 9, scope: !125)
!136 = !DILocation(line: 109, column: 14, scope: !125)
!137 = !DILocation(line: 109, column: 9, scope: !125)
!138 = !DILocation(line: 111, column: 1, scope: !109)
