; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !14
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_05_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
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
  %2 = load i32, i32* @staticTrue, align 4, !dbg !39
  %tobool = icmp ne i32 %2, 0, !dbg !39
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !41

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !44
  %4 = load i32*, i32** %data, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  br label %if.end3, !dbg !47

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !53
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !54
  %6 = load i32*, i32** %data, align 8, !dbg !55
  %call4 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %6), !dbg !56
  %7 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* noundef %7), !dbg !58
  %8 = load i32*, i32** %data, align 8, !dbg !59
  %9 = bitcast i32* %8 to i8*, !dbg !59
  call void @free(i8* noundef %9), !dbg !60
  ret void, !dbg !61
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_05_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* noundef null), !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 noundef %conv), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_05_good(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_05_bad(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !89
  %0 = bitcast i8* %call to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFalse, align 4, !dbg !98
  %tobool = icmp ne i32 %2, 0, !dbg !98
  br i1 %tobool, label %if.then1, label %if.else, !dbg !100

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !101
  br label %if.end3, !dbg !103

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !104
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !106
  %4 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !111
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !112
  %6 = load i32*, i32** %data, align 8, !dbg !113
  %call4 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %6), !dbg !114
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
  %2 = load i32, i32* @staticTrue, align 4, !dbg !132
  %tobool = icmp ne i32 %2, 0, !dbg !132
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !134

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !135
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !137
  %4 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !138
  store i32 0, i32* %arrayidx, align 4, !dbg !139
  br label %if.end3, !dbg !140

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !141, metadata !DIExpression()), !dbg !143
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !143
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !144
  %6 = load i32*, i32** %data, align 8, !dbg !145
  %call4 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %6), !dbg !146
  %7 = load i32*, i32** %data, align 8, !dbg !147
  call void @printWLine(i32* noundef %7), !dbg !148
  %8 = load i32*, i32** %data, align 8, !dbg !149
  %9 = bitcast i32* %8 to i8*, !dbg !149
  call void @free(i8* noundef %9), !dbg !150
  ret void, !dbg !151
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
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !16, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!15 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !16, line: 26, type: !10, isLocal: true, isDefinition: true)
!16 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Homebrew clang version 14.0.6"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_05_bad", scope: !16, file: !16, line: 30, type: !25, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !{}
!28 = !DILocalVariable(name: "data", scope: !24, file: !16, line: 32, type: !5)
!29 = !DILocation(line: 32, column: 15, scope: !24)
!30 = !DILocation(line: 33, column: 23, scope: !24)
!31 = !DILocation(line: 33, column: 12, scope: !24)
!32 = !DILocation(line: 33, column: 10, scope: !24)
!33 = !DILocation(line: 34, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !24, file: !16, line: 34, column: 9)
!35 = !DILocation(line: 34, column: 14, scope: !34)
!36 = !DILocation(line: 34, column: 9, scope: !24)
!37 = !DILocation(line: 34, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !16, line: 34, column: 23)
!39 = !DILocation(line: 35, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !24, file: !16, line: 35, column: 8)
!41 = !DILocation(line: 35, column: 8, scope: !24)
!42 = !DILocation(line: 38, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !16, line: 36, column: 5)
!44 = !DILocation(line: 38, column: 9, scope: !43)
!45 = !DILocation(line: 39, column: 9, scope: !43)
!46 = !DILocation(line: 39, column: 21, scope: !43)
!47 = !DILocation(line: 40, column: 5, scope: !43)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !16, line: 42, type: !50)
!49 = distinct !DILexicalBlock(scope: !24, file: !16, line: 41, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 50)
!53 = !DILocation(line: 42, column: 17, scope: !49)
!54 = !DILocation(line: 44, column: 16, scope: !49)
!55 = !DILocation(line: 44, column: 22, scope: !49)
!56 = !DILocation(line: 44, column: 9, scope: !49)
!57 = !DILocation(line: 45, column: 20, scope: !49)
!58 = !DILocation(line: 45, column: 9, scope: !49)
!59 = !DILocation(line: 46, column: 14, scope: !49)
!60 = !DILocation(line: 46, column: 9, scope: !49)
!61 = !DILocation(line: 48, column: 1, scope: !24)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_05_good", scope: !16, file: !16, line: 101, type: !25, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!63 = !DILocation(line: 103, column: 5, scope: !62)
!64 = !DILocation(line: 104, column: 5, scope: !62)
!65 = !DILocation(line: 105, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 117, type: !67, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!67 = !DISubroutineType(types: !68)
!68 = !{!10, !10, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !16, line: 117, type: !10)
!73 = !DILocation(line: 117, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !16, line: 117, type: !69)
!75 = !DILocation(line: 117, column: 27, scope: !66)
!76 = !DILocation(line: 120, column: 22, scope: !66)
!77 = !DILocation(line: 120, column: 12, scope: !66)
!78 = !DILocation(line: 120, column: 5, scope: !66)
!79 = !DILocation(line: 122, column: 5, scope: !66)
!80 = !DILocation(line: 123, column: 5, scope: !66)
!81 = !DILocation(line: 124, column: 5, scope: !66)
!82 = !DILocation(line: 127, column: 5, scope: !66)
!83 = !DILocation(line: 128, column: 5, scope: !66)
!84 = !DILocation(line: 129, column: 5, scope: !66)
!85 = !DILocation(line: 131, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 55, type: !25, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!87 = !DILocalVariable(name: "data", scope: !86, file: !16, line: 57, type: !5)
!88 = !DILocation(line: 57, column: 15, scope: !86)
!89 = !DILocation(line: 58, column: 23, scope: !86)
!90 = !DILocation(line: 58, column: 12, scope: !86)
!91 = !DILocation(line: 58, column: 10, scope: !86)
!92 = !DILocation(line: 59, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !16, line: 59, column: 9)
!94 = !DILocation(line: 59, column: 14, scope: !93)
!95 = !DILocation(line: 59, column: 9, scope: !86)
!96 = !DILocation(line: 59, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !16, line: 59, column: 23)
!98 = !DILocation(line: 60, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !86, file: !16, line: 60, column: 8)
!100 = !DILocation(line: 60, column: 8, scope: !86)
!101 = !DILocation(line: 63, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !16, line: 61, column: 5)
!103 = !DILocation(line: 64, column: 5, scope: !102)
!104 = !DILocation(line: 68, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !16, line: 66, column: 5)
!106 = !DILocation(line: 68, column: 9, scope: !105)
!107 = !DILocation(line: 69, column: 9, scope: !105)
!108 = !DILocation(line: 69, column: 20, scope: !105)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !16, line: 72, type: !50)
!110 = distinct !DILexicalBlock(scope: !86, file: !16, line: 71, column: 5)
!111 = !DILocation(line: 72, column: 17, scope: !110)
!112 = !DILocation(line: 74, column: 16, scope: !110)
!113 = !DILocation(line: 74, column: 22, scope: !110)
!114 = !DILocation(line: 74, column: 9, scope: !110)
!115 = !DILocation(line: 75, column: 20, scope: !110)
!116 = !DILocation(line: 75, column: 9, scope: !110)
!117 = !DILocation(line: 76, column: 14, scope: !110)
!118 = !DILocation(line: 76, column: 9, scope: !110)
!119 = !DILocation(line: 78, column: 1, scope: !86)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 81, type: !25, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!121 = !DILocalVariable(name: "data", scope: !120, file: !16, line: 83, type: !5)
!122 = !DILocation(line: 83, column: 15, scope: !120)
!123 = !DILocation(line: 84, column: 23, scope: !120)
!124 = !DILocation(line: 84, column: 12, scope: !120)
!125 = !DILocation(line: 84, column: 10, scope: !120)
!126 = !DILocation(line: 85, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !16, line: 85, column: 9)
!128 = !DILocation(line: 85, column: 14, scope: !127)
!129 = !DILocation(line: 85, column: 9, scope: !120)
!130 = !DILocation(line: 85, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !16, line: 85, column: 23)
!132 = !DILocation(line: 86, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !120, file: !16, line: 86, column: 8)
!134 = !DILocation(line: 86, column: 8, scope: !120)
!135 = !DILocation(line: 89, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !16, line: 87, column: 5)
!137 = !DILocation(line: 89, column: 9, scope: !136)
!138 = !DILocation(line: 90, column: 9, scope: !136)
!139 = !DILocation(line: 90, column: 20, scope: !136)
!140 = !DILocation(line: 91, column: 5, scope: !136)
!141 = !DILocalVariable(name: "dest", scope: !142, file: !16, line: 93, type: !50)
!142 = distinct !DILexicalBlock(scope: !120, file: !16, line: 92, column: 5)
!143 = !DILocation(line: 93, column: 17, scope: !142)
!144 = !DILocation(line: 95, column: 16, scope: !142)
!145 = !DILocation(line: 95, column: 22, scope: !142)
!146 = !DILocation(line: 95, column: 9, scope: !142)
!147 = !DILocation(line: 96, column: 20, scope: !142)
!148 = !DILocation(line: 96, column: 9, scope: !142)
!149 = !DILocation(line: 97, column: 14, scope: !142)
!150 = !DILocation(line: 97, column: 9, scope: !142)
!151 = !DILocation(line: 99, column: 1, scope: !120)
