; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_17_bad() #0 !dbg !18 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !39
  %cmp1 = icmp slt i32 %2, 1, !dbg !41
  br i1 %cmp1, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !43
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !45
  %4 = load i32*, i32** %data, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %5, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !54, metadata !DIExpression()), !dbg !59
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !59
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !60
  %7 = load i32*, i32** %data, align 8, !dbg !61
  %call3 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %7), !dbg !62
  %8 = load i32*, i32** %data, align 8, !dbg !63
  call void @printWLine(i32* noundef %8), !dbg !64
  %9 = load i32*, i32** %data, align 8, !dbg !65
  %10 = bitcast i32* %9 to i8*, !dbg !65
  call void @free(i8* noundef %10), !dbg !66
  ret void, !dbg !67
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_17_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* noundef null), !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 noundef %conv), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_17_good(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_17_bad(), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !96
  %0 = bitcast i8* %call to i32*, !dbg !97
  store i32* %0, i32** %data, align 8, !dbg !98
  %1 = load i32*, i32** %data, align 8, !dbg !99
  %cmp = icmp eq i32* %1, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  store i32 0, i32* %h, align 4, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %h, align 4, !dbg !108
  %cmp1 = icmp slt i32 %2, 1, !dbg !110
  br i1 %cmp1, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !112
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !114
  %4 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !118
  %inc = add nsw i32 %5, 1, !dbg !118
  store i32 %inc, i32* %h, align 4, !dbg !118
  br label %for.cond, !dbg !119, !llvm.loop !120

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !124
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !125
  %7 = load i32*, i32** %data, align 8, !dbg !126
  %call3 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %7), !dbg !127
  %8 = load i32*, i32** %data, align 8, !dbg !128
  call void @printWLine(i32* noundef %8), !dbg !129
  %9 = load i32*, i32** %data, align 8, !dbg !130
  %10 = bitcast i32* %9 to i8*, !dbg !130
  call void @free(i8* noundef %10), !dbg !131
  ret void, !dbg !132
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_17_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "i", scope: !18, file: !19, line: 25, type: !8)
!24 = !DILocation(line: 25, column: 9, scope: !18)
!25 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 26, type: !3)
!26 = !DILocation(line: 26, column: 15, scope: !18)
!27 = !DILocation(line: 27, column: 23, scope: !18)
!28 = !DILocation(line: 27, column: 12, scope: !18)
!29 = !DILocation(line: 27, column: 10, scope: !18)
!30 = !DILocation(line: 28, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 9)
!32 = !DILocation(line: 28, column: 14, scope: !31)
!33 = !DILocation(line: 28, column: 9, scope: !18)
!34 = !DILocation(line: 28, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !19, line: 28, column: 23)
!36 = !DILocation(line: 29, column: 11, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 5)
!38 = !DILocation(line: 29, column: 9, scope: !37)
!39 = !DILocation(line: 29, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !19, line: 29, column: 5)
!41 = !DILocation(line: 29, column: 18, scope: !40)
!42 = !DILocation(line: 29, column: 5, scope: !37)
!43 = !DILocation(line: 32, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !19, line: 30, column: 5)
!45 = !DILocation(line: 32, column: 9, scope: !44)
!46 = !DILocation(line: 33, column: 9, scope: !44)
!47 = !DILocation(line: 33, column: 21, scope: !44)
!48 = !DILocation(line: 34, column: 5, scope: !44)
!49 = !DILocation(line: 29, column: 24, scope: !40)
!50 = !DILocation(line: 29, column: 5, scope: !40)
!51 = distinct !{!51, !42, !52, !53}
!52 = !DILocation(line: 34, column: 5, scope: !37)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocalVariable(name: "dest", scope: !55, file: !19, line: 36, type: !56)
!55 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 5)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 50)
!59 = !DILocation(line: 36, column: 17, scope: !55)
!60 = !DILocation(line: 38, column: 16, scope: !55)
!61 = !DILocation(line: 38, column: 22, scope: !55)
!62 = !DILocation(line: 38, column: 9, scope: !55)
!63 = !DILocation(line: 39, column: 20, scope: !55)
!64 = !DILocation(line: 39, column: 9, scope: !55)
!65 = !DILocation(line: 40, column: 14, scope: !55)
!66 = !DILocation(line: 40, column: 9, scope: !55)
!67 = !DILocation(line: 42, column: 1, scope: !18)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_17_good", scope: !19, file: !19, line: 70, type: !20, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!69 = !DILocation(line: 72, column: 5, scope: !68)
!70 = !DILocation(line: 73, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 85, type: !72, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!72 = !DISubroutineType(types: !73)
!73 = !{!8, !8, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !19, line: 85, type: !8)
!78 = !DILocation(line: 85, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !19, line: 85, type: !74)
!80 = !DILocation(line: 85, column: 27, scope: !71)
!81 = !DILocation(line: 88, column: 22, scope: !71)
!82 = !DILocation(line: 88, column: 12, scope: !71)
!83 = !DILocation(line: 88, column: 5, scope: !71)
!84 = !DILocation(line: 90, column: 5, scope: !71)
!85 = !DILocation(line: 91, column: 5, scope: !71)
!86 = !DILocation(line: 92, column: 5, scope: !71)
!87 = !DILocation(line: 95, column: 5, scope: !71)
!88 = !DILocation(line: 96, column: 5, scope: !71)
!89 = !DILocation(line: 97, column: 5, scope: !71)
!90 = !DILocation(line: 99, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 49, type: !20, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!92 = !DILocalVariable(name: "h", scope: !91, file: !19, line: 51, type: !8)
!93 = !DILocation(line: 51, column: 9, scope: !91)
!94 = !DILocalVariable(name: "data", scope: !91, file: !19, line: 52, type: !3)
!95 = !DILocation(line: 52, column: 15, scope: !91)
!96 = !DILocation(line: 53, column: 23, scope: !91)
!97 = !DILocation(line: 53, column: 12, scope: !91)
!98 = !DILocation(line: 53, column: 10, scope: !91)
!99 = !DILocation(line: 54, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !91, file: !19, line: 54, column: 9)
!101 = !DILocation(line: 54, column: 14, scope: !100)
!102 = !DILocation(line: 54, column: 9, scope: !91)
!103 = !DILocation(line: 54, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !19, line: 54, column: 23)
!105 = !DILocation(line: 55, column: 11, scope: !106)
!106 = distinct !DILexicalBlock(scope: !91, file: !19, line: 55, column: 5)
!107 = !DILocation(line: 55, column: 9, scope: !106)
!108 = !DILocation(line: 55, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !19, line: 55, column: 5)
!110 = !DILocation(line: 55, column: 18, scope: !109)
!111 = !DILocation(line: 55, column: 5, scope: !106)
!112 = !DILocation(line: 58, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !19, line: 56, column: 5)
!114 = !DILocation(line: 58, column: 9, scope: !113)
!115 = !DILocation(line: 59, column: 9, scope: !113)
!116 = !DILocation(line: 59, column: 20, scope: !113)
!117 = !DILocation(line: 60, column: 5, scope: !113)
!118 = !DILocation(line: 55, column: 24, scope: !109)
!119 = !DILocation(line: 55, column: 5, scope: !109)
!120 = distinct !{!120, !111, !121, !53}
!121 = !DILocation(line: 60, column: 5, scope: !106)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !19, line: 62, type: !56)
!123 = distinct !DILexicalBlock(scope: !91, file: !19, line: 61, column: 5)
!124 = !DILocation(line: 62, column: 17, scope: !123)
!125 = !DILocation(line: 64, column: 16, scope: !123)
!126 = !DILocation(line: 64, column: 22, scope: !123)
!127 = !DILocation(line: 64, column: 9, scope: !123)
!128 = !DILocation(line: 65, column: 20, scope: !123)
!129 = !DILocation(line: 65, column: 9, scope: !123)
!130 = !DILocation(line: 66, column: 14, scope: !123)
!131 = !DILocation(line: 66, column: 9, scope: !123)
!132 = !DILocation(line: 68, column: 1, scope: !91)
