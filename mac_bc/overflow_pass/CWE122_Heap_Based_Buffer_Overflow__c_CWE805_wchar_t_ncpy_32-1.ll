; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !25, metadata !DIExpression()), !dbg !27
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !28, metadata !DIExpression()), !dbg !29
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !29
  store i32* null, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !34
  %1 = load i32*, i32** %0, align 8, !dbg !35
  store i32* %1, i32** %data1, align 8, !dbg !33
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !36
  %2 = bitcast i8* %call to i32*, !dbg !37
  store i32* %2, i32** %data1, align 8, !dbg !38
  %3 = load i32*, i32** %data1, align 8, !dbg !39
  %cmp = icmp eq i32* %3, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  %5 = load i32*, i32** %data1, align 8, !dbg !47
  %6 = load i32**, i32*** %dataPtr1, align 8, !dbg !48
  store i32* %5, i32** %6, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !50, metadata !DIExpression()), !dbg !52
  %7 = load i32**, i32*** %dataPtr2, align 8, !dbg !53
  %8 = load i32*, i32** %7, align 8, !dbg !54
  store i32* %8, i32** %data2, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !55, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !62
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx4, align 4, !dbg !64
  %9 = load i32*, i32** %data2, align 8, !dbg !65
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !66
  %call6 = call i32* @wcsncpy(i32* noundef %9, i32* noundef %arraydecay5, i64 noundef 99), !dbg !67
  %10 = load i32*, i32** %data2, align 8, !dbg !68
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !68
  store i32 0, i32* %arrayidx7, align 4, !dbg !69
  %11 = load i32*, i32** %data2, align 8, !dbg !70
  call void @printWLine(i32* noundef %11), !dbg !71
  %12 = load i32*, i32** %data2, align 8, !dbg !72
  %13 = bitcast i32* %12 to i8*, !dbg !72
  call void @free(i8* noundef %13), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

declare i32* @wcsncpy(i32* noundef, i32* noundef, i64 noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* noundef null), !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 noundef %conv), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_good(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_bad(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !101, metadata !DIExpression()), !dbg !102
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !103, metadata !DIExpression()), !dbg !104
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !104
  store i32* null, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !106, metadata !DIExpression()), !dbg !108
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !109
  %1 = load i32*, i32** %0, align 8, !dbg !110
  store i32* %1, i32** %data1, align 8, !dbg !108
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !111
  %2 = bitcast i8* %call to i32*, !dbg !112
  store i32* %2, i32** %data1, align 8, !dbg !113
  %3 = load i32*, i32** %data1, align 8, !dbg !114
  %cmp = icmp eq i32* %3, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  %5 = load i32*, i32** %data1, align 8, !dbg !122
  %6 = load i32**, i32*** %dataPtr1, align 8, !dbg !123
  store i32* %5, i32** %6, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !125, metadata !DIExpression()), !dbg !127
  %7 = load i32**, i32*** %dataPtr2, align 8, !dbg !128
  %8 = load i32*, i32** %7, align 8, !dbg !129
  store i32* %8, i32** %data2, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !133
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !134
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx4, align 4, !dbg !136
  %9 = load i32*, i32** %data2, align 8, !dbg !137
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !138
  %call6 = call i32* @wcsncpy(i32* noundef %9, i32* noundef %arraydecay5, i64 noundef 99), !dbg !139
  %10 = load i32*, i32** %data2, align 8, !dbg !140
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !140
  store i32 0, i32* %arrayidx7, align 4, !dbg !141
  %11 = load i32*, i32** %data2, align 8, !dbg !142
  call void @printWLine(i32* noundef %11), !dbg !143
  %12 = load i32*, i32** %data2, align 8, !dbg !144
  %13 = bitcast i32* %12 to i8*, !dbg !144
  call void @free(i8* noundef %13), !dbg !145
  ret void, !dbg !146
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocalVariable(name: "dataPtr1", scope: !18, file: !19, line: 26, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!27 = !DILocation(line: 26, column: 16, scope: !18)
!28 = !DILocalVariable(name: "dataPtr2", scope: !18, file: !19, line: 27, type: !26)
!29 = !DILocation(line: 27, column: 16, scope: !18)
!30 = !DILocation(line: 28, column: 10, scope: !18)
!31 = !DILocalVariable(name: "data", scope: !32, file: !19, line: 30, type: !3)
!32 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 5)
!33 = !DILocation(line: 30, column: 19, scope: !32)
!34 = !DILocation(line: 30, column: 27, scope: !32)
!35 = !DILocation(line: 30, column: 26, scope: !32)
!36 = !DILocation(line: 32, column: 27, scope: !32)
!37 = !DILocation(line: 32, column: 16, scope: !32)
!38 = !DILocation(line: 32, column: 14, scope: !32)
!39 = !DILocation(line: 33, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !19, line: 33, column: 13)
!41 = !DILocation(line: 33, column: 18, scope: !40)
!42 = !DILocation(line: 33, column: 13, scope: !32)
!43 = !DILocation(line: 33, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !19, line: 33, column: 27)
!45 = !DILocation(line: 34, column: 9, scope: !32)
!46 = !DILocation(line: 34, column: 17, scope: !32)
!47 = !DILocation(line: 35, column: 21, scope: !32)
!48 = !DILocation(line: 35, column: 10, scope: !32)
!49 = !DILocation(line: 35, column: 19, scope: !32)
!50 = !DILocalVariable(name: "data", scope: !51, file: !19, line: 38, type: !3)
!51 = distinct !DILexicalBlock(scope: !18, file: !19, line: 37, column: 5)
!52 = !DILocation(line: 38, column: 19, scope: !51)
!53 = !DILocation(line: 38, column: 27, scope: !51)
!54 = !DILocation(line: 38, column: 26, scope: !51)
!55 = !DILocalVariable(name: "source", scope: !56, file: !19, line: 40, type: !57)
!56 = distinct !DILexicalBlock(scope: !51, file: !19, line: 39, column: 9)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 100)
!60 = !DILocation(line: 40, column: 21, scope: !56)
!61 = !DILocation(line: 41, column: 21, scope: !56)
!62 = !DILocation(line: 41, column: 13, scope: !56)
!63 = !DILocation(line: 42, column: 13, scope: !56)
!64 = !DILocation(line: 42, column: 27, scope: !56)
!65 = !DILocation(line: 44, column: 21, scope: !56)
!66 = !DILocation(line: 44, column: 27, scope: !56)
!67 = !DILocation(line: 44, column: 13, scope: !56)
!68 = !DILocation(line: 45, column: 13, scope: !56)
!69 = !DILocation(line: 45, column: 25, scope: !56)
!70 = !DILocation(line: 46, column: 24, scope: !56)
!71 = !DILocation(line: 46, column: 13, scope: !56)
!72 = !DILocation(line: 47, column: 18, scope: !56)
!73 = !DILocation(line: 47, column: 13, scope: !56)
!74 = !DILocation(line: 50, column: 1, scope: !18)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_32_good", scope: !19, file: !19, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!76 = !DILocation(line: 88, column: 5, scope: !75)
!77 = !DILocation(line: 89, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 100, type: !79, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!79 = !DISubroutineType(types: !80)
!80 = !{!8, !8, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !19, line: 100, type: !8)
!85 = !DILocation(line: 100, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !19, line: 100, type: !81)
!87 = !DILocation(line: 100, column: 27, scope: !78)
!88 = !DILocation(line: 103, column: 22, scope: !78)
!89 = !DILocation(line: 103, column: 12, scope: !78)
!90 = !DILocation(line: 103, column: 5, scope: !78)
!91 = !DILocation(line: 105, column: 5, scope: !78)
!92 = !DILocation(line: 106, column: 5, scope: !78)
!93 = !DILocation(line: 107, column: 5, scope: !78)
!94 = !DILocation(line: 110, column: 5, scope: !78)
!95 = !DILocation(line: 111, column: 5, scope: !78)
!96 = !DILocation(line: 112, column: 5, scope: !78)
!97 = !DILocation(line: 114, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!99 = !DILocalVariable(name: "data", scope: !98, file: !19, line: 59, type: !3)
!100 = !DILocation(line: 59, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataPtr1", scope: !98, file: !19, line: 60, type: !26)
!102 = !DILocation(line: 60, column: 16, scope: !98)
!103 = !DILocalVariable(name: "dataPtr2", scope: !98, file: !19, line: 61, type: !26)
!104 = !DILocation(line: 61, column: 16, scope: !98)
!105 = !DILocation(line: 62, column: 10, scope: !98)
!106 = !DILocalVariable(name: "data", scope: !107, file: !19, line: 64, type: !3)
!107 = distinct !DILexicalBlock(scope: !98, file: !19, line: 63, column: 5)
!108 = !DILocation(line: 64, column: 19, scope: !107)
!109 = !DILocation(line: 64, column: 27, scope: !107)
!110 = !DILocation(line: 64, column: 26, scope: !107)
!111 = !DILocation(line: 66, column: 27, scope: !107)
!112 = !DILocation(line: 66, column: 16, scope: !107)
!113 = !DILocation(line: 66, column: 14, scope: !107)
!114 = !DILocation(line: 67, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !19, line: 67, column: 13)
!116 = !DILocation(line: 67, column: 18, scope: !115)
!117 = !DILocation(line: 67, column: 13, scope: !107)
!118 = !DILocation(line: 67, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !19, line: 67, column: 27)
!120 = !DILocation(line: 68, column: 9, scope: !107)
!121 = !DILocation(line: 68, column: 17, scope: !107)
!122 = !DILocation(line: 69, column: 21, scope: !107)
!123 = !DILocation(line: 69, column: 10, scope: !107)
!124 = !DILocation(line: 69, column: 19, scope: !107)
!125 = !DILocalVariable(name: "data", scope: !126, file: !19, line: 72, type: !3)
!126 = distinct !DILexicalBlock(scope: !98, file: !19, line: 71, column: 5)
!127 = !DILocation(line: 72, column: 19, scope: !126)
!128 = !DILocation(line: 72, column: 27, scope: !126)
!129 = !DILocation(line: 72, column: 26, scope: !126)
!130 = !DILocalVariable(name: "source", scope: !131, file: !19, line: 74, type: !57)
!131 = distinct !DILexicalBlock(scope: !126, file: !19, line: 73, column: 9)
!132 = !DILocation(line: 74, column: 21, scope: !131)
!133 = !DILocation(line: 75, column: 21, scope: !131)
!134 = !DILocation(line: 75, column: 13, scope: !131)
!135 = !DILocation(line: 76, column: 13, scope: !131)
!136 = !DILocation(line: 76, column: 27, scope: !131)
!137 = !DILocation(line: 78, column: 21, scope: !131)
!138 = !DILocation(line: 78, column: 27, scope: !131)
!139 = !DILocation(line: 78, column: 13, scope: !131)
!140 = !DILocation(line: 79, column: 13, scope: !131)
!141 = !DILocation(line: 79, column: 25, scope: !131)
!142 = !DILocation(line: 80, column: 24, scope: !131)
!143 = !DILocation(line: 80, column: 13, scope: !131)
!144 = !DILocation(line: 81, column: 18, scope: !131)
!145 = !DILocation(line: 81, column: 13, scope: !131)
!146 = !DILocation(line: 84, column: 1, scope: !98)
