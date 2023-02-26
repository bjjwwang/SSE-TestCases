; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_16_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  br label %while.body, !dbg !26

while.body:                                       ; preds = %entry
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %while.body
  call void @exit(i32 noundef -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %while.end, !dbg !39

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx2, align 4, !dbg !49
  %3 = load i32*, i32** %data, align 8, !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call4 = call i32* @wcscat(i32* noundef %3, i32* noundef %arraydecay3), !dbg !52
  %4 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* noundef %4), !dbg !54
  %5 = load i32*, i32** %data, align 8, !dbg !55
  %6 = bitcast i32* %5 to i8*, !dbg !55
  call void @free(i8* noundef %6), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

declare i32* @wcscat(i32* noundef, i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_16_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* noundef null), !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 noundef %conv), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_16_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_16_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32* null, i32** %data, align 8, !dbg !84
  br label %while.body, !dbg !85

while.body:                                       ; preds = %entry
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !86
  %0 = bitcast i8* %call to i32*, !dbg !88
  store i32* %0, i32** %data, align 8, !dbg !89
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %cmp = icmp eq i32* %1, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %while.body
  call void @exit(i32 noundef -1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  br label %while.end, !dbg !98

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !102
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !103
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx2, align 4, !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %call4 = call i32* @wcscat(i32* noundef %3, i32* noundef %arraydecay3), !dbg !108
  %4 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* noundef %4), !dbg !110
  %5 = load i32*, i32** %data, align 8, !dbg !111
  %6 = bitcast i32* %5 to i8*, !dbg !111
  call void @free(i8* noundef %6), !dbg !112
  ret void, !dbg !113
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_16_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 10, scope: !18)
!26 = !DILocation(line: 27, column: 5, scope: !18)
!27 = !DILocation(line: 30, column: 27, scope: !28)
!28 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 5)
!29 = !DILocation(line: 30, column: 16, scope: !28)
!30 = !DILocation(line: 30, column: 14, scope: !28)
!31 = !DILocation(line: 31, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !19, line: 31, column: 13)
!33 = !DILocation(line: 31, column: 18, scope: !32)
!34 = !DILocation(line: 31, column: 13, scope: !28)
!35 = !DILocation(line: 31, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 31, column: 27)
!37 = !DILocation(line: 32, column: 9, scope: !28)
!38 = !DILocation(line: 32, column: 17, scope: !28)
!39 = !DILocation(line: 33, column: 9, scope: !28)
!40 = !DILocalVariable(name: "source", scope: !41, file: !19, line: 36, type: !42)
!41 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 36, column: 17, scope: !41)
!46 = !DILocation(line: 37, column: 17, scope: !41)
!47 = !DILocation(line: 37, column: 9, scope: !41)
!48 = !DILocation(line: 38, column: 9, scope: !41)
!49 = !DILocation(line: 38, column: 23, scope: !41)
!50 = !DILocation(line: 40, column: 16, scope: !41)
!51 = !DILocation(line: 40, column: 22, scope: !41)
!52 = !DILocation(line: 40, column: 9, scope: !41)
!53 = !DILocation(line: 41, column: 20, scope: !41)
!54 = !DILocation(line: 41, column: 9, scope: !41)
!55 = !DILocation(line: 42, column: 14, scope: !41)
!56 = !DILocation(line: 42, column: 9, scope: !41)
!57 = !DILocation(line: 44, column: 1, scope: !18)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_16_good", scope: !19, file: !19, line: 74, type: !20, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!59 = !DILocation(line: 76, column: 5, scope: !58)
!60 = !DILocation(line: 77, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 89, type: !62, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!62 = !DISubroutineType(types: !63)
!63 = !{!8, !8, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !19, line: 89, type: !8)
!68 = !DILocation(line: 89, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !19, line: 89, type: !64)
!70 = !DILocation(line: 89, column: 27, scope: !61)
!71 = !DILocation(line: 92, column: 22, scope: !61)
!72 = !DILocation(line: 92, column: 12, scope: !61)
!73 = !DILocation(line: 92, column: 5, scope: !61)
!74 = !DILocation(line: 94, column: 5, scope: !61)
!75 = !DILocation(line: 95, column: 5, scope: !61)
!76 = !DILocation(line: 96, column: 5, scope: !61)
!77 = !DILocation(line: 99, column: 5, scope: !61)
!78 = !DILocation(line: 100, column: 5, scope: !61)
!79 = !DILocation(line: 101, column: 5, scope: !61)
!80 = !DILocation(line: 103, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 51, type: !20, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!82 = !DILocalVariable(name: "data", scope: !81, file: !19, line: 53, type: !3)
!83 = !DILocation(line: 53, column: 15, scope: !81)
!84 = !DILocation(line: 54, column: 10, scope: !81)
!85 = !DILocation(line: 55, column: 5, scope: !81)
!86 = !DILocation(line: 58, column: 27, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !19, line: 56, column: 5)
!88 = !DILocation(line: 58, column: 16, scope: !87)
!89 = !DILocation(line: 58, column: 14, scope: !87)
!90 = !DILocation(line: 59, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !19, line: 59, column: 13)
!92 = !DILocation(line: 59, column: 18, scope: !91)
!93 = !DILocation(line: 59, column: 13, scope: !87)
!94 = !DILocation(line: 59, column: 28, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !19, line: 59, column: 27)
!96 = !DILocation(line: 60, column: 9, scope: !87)
!97 = !DILocation(line: 60, column: 17, scope: !87)
!98 = !DILocation(line: 61, column: 9, scope: !87)
!99 = !DILocalVariable(name: "source", scope: !100, file: !19, line: 64, type: !42)
!100 = distinct !DILexicalBlock(scope: !81, file: !19, line: 63, column: 5)
!101 = !DILocation(line: 64, column: 17, scope: !100)
!102 = !DILocation(line: 65, column: 17, scope: !100)
!103 = !DILocation(line: 65, column: 9, scope: !100)
!104 = !DILocation(line: 66, column: 9, scope: !100)
!105 = !DILocation(line: 66, column: 23, scope: !100)
!106 = !DILocation(line: 68, column: 16, scope: !100)
!107 = !DILocation(line: 68, column: 22, scope: !100)
!108 = !DILocation(line: 68, column: 9, scope: !100)
!109 = !DILocation(line: 69, column: 20, scope: !100)
!110 = !DILocation(line: 69, column: 9, scope: !100)
!111 = !DILocation(line: 70, column: 14, scope: !100)
!112 = !DILocation(line: 70, column: 9, scope: !100)
!113 = !DILocation(line: 72, column: 1, scope: !81)
