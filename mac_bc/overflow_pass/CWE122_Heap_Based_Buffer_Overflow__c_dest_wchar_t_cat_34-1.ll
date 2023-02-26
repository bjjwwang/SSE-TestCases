; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion, metadata !25, metadata !DIExpression()), !dbg !31
  store i32* null, i32** %data, align 8, !dbg !32
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !33
  %0 = bitcast i8* %call to i32*, !dbg !34
  store i32* %0, i32** %data, align 8, !dbg !35
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %cmp = icmp eq i32* %1, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %3 = load i32*, i32** %data, align 8, !dbg !44
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion to i32**, !dbg !45
  store i32* %3, i32** %unionFirst, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !47, metadata !DIExpression()), !dbg !49
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion to i32**, !dbg !50
  %4 = load i32*, i32** %unionSecond, align 8, !dbg !50
  store i32* %4, i32** %data1, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !57
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !58
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx3, align 4, !dbg !60
  %5 = load i32*, i32** %data1, align 8, !dbg !61
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !62
  %call5 = call i32* @wcscat(i32* noundef %5, i32* noundef %arraydecay4), !dbg !63
  %6 = load i32*, i32** %data1, align 8, !dbg !64
  call void @printWLine(i32* noundef %6), !dbg !65
  %7 = load i32*, i32** %data1, align 8, !dbg !66
  %8 = bitcast i32* %7 to i8*, !dbg !66
  call void @free(i8* noundef %8), !dbg !67
  ret void, !dbg !68
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* noundef null), !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 noundef %conv), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_good(), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_bad(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion, metadata !95, metadata !DIExpression()), !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !98
  %0 = bitcast i8* %call to i32*, !dbg !99
  store i32* %0, i32** %data, align 8, !dbg !100
  %1 = load i32*, i32** %data, align 8, !dbg !101
  %cmp = icmp eq i32* %1, null, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %3 = load i32*, i32** %data, align 8, !dbg !109
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion to i32**, !dbg !110
  store i32* %3, i32** %unionFirst, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !112, metadata !DIExpression()), !dbg !114
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType* %myUnion to i32**, !dbg !115
  %4 = load i32*, i32** %unionSecond, align 8, !dbg !115
  store i32* %4, i32** %data1, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !119
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !120
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx3, align 4, !dbg !122
  %5 = load i32*, i32** %data1, align 8, !dbg !123
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !124
  %call5 = call i32* @wcscat(i32* noundef %5, i32* noundef %arraydecay4), !dbg !125
  %6 = load i32*, i32** %data1, align 8, !dbg !126
  call void @printWLine(i32* noundef %6), !dbg !127
  %7 = load i32*, i32** %data1, align 8, !dbg !128
  %8 = bitcast i32* %7 to i8*, !dbg !128
  call void @free(i8* noundef %8), !dbg !129
  ret void, !dbg !130
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_bad", scope: !19, file: !19, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 31, type: !3)
!24 = !DILocation(line: 31, column: 15, scope: !18)
!25 = !DILocalVariable(name: "myUnion", scope: !18, file: !19, line: 32, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_unionType", file: !19, line: 25, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !19, line: 21, size: 64, elements: !28)
!28 = !{!29, !30}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !27, file: !19, line: 23, baseType: !3, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !27, file: !19, line: 24, baseType: !3, size: 64)
!31 = !DILocation(line: 32, column: 72, scope: !18)
!32 = !DILocation(line: 33, column: 10, scope: !18)
!33 = !DILocation(line: 35, column: 23, scope: !18)
!34 = !DILocation(line: 35, column: 12, scope: !18)
!35 = !DILocation(line: 35, column: 10, scope: !18)
!36 = !DILocation(line: 36, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !19, line: 36, column: 9)
!38 = !DILocation(line: 36, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 9, scope: !18)
!40 = !DILocation(line: 36, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !19, line: 36, column: 23)
!42 = !DILocation(line: 37, column: 5, scope: !18)
!43 = !DILocation(line: 37, column: 13, scope: !18)
!44 = !DILocation(line: 38, column: 26, scope: !18)
!45 = !DILocation(line: 38, column: 13, scope: !18)
!46 = !DILocation(line: 38, column: 24, scope: !18)
!47 = !DILocalVariable(name: "data", scope: !48, file: !19, line: 40, type: !3)
!48 = distinct !DILexicalBlock(scope: !18, file: !19, line: 39, column: 5)
!49 = !DILocation(line: 40, column: 19, scope: !48)
!50 = !DILocation(line: 40, column: 34, scope: !48)
!51 = !DILocalVariable(name: "source", scope: !52, file: !19, line: 42, type: !53)
!52 = distinct !DILexicalBlock(scope: !48, file: !19, line: 41, column: 9)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 42, column: 21, scope: !52)
!57 = !DILocation(line: 43, column: 21, scope: !52)
!58 = !DILocation(line: 43, column: 13, scope: !52)
!59 = !DILocation(line: 44, column: 13, scope: !52)
!60 = !DILocation(line: 44, column: 27, scope: !52)
!61 = !DILocation(line: 46, column: 20, scope: !52)
!62 = !DILocation(line: 46, column: 26, scope: !52)
!63 = !DILocation(line: 46, column: 13, scope: !52)
!64 = !DILocation(line: 47, column: 24, scope: !52)
!65 = !DILocation(line: 47, column: 13, scope: !52)
!66 = !DILocation(line: 48, column: 18, scope: !52)
!67 = !DILocation(line: 48, column: 13, scope: !52)
!68 = !DILocation(line: 51, column: 1, scope: !18)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cat_34_good", scope: !19, file: !19, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!70 = !DILocation(line: 84, column: 5, scope: !69)
!71 = !DILocation(line: 85, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 96, type: !73, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!73 = !DISubroutineType(types: !74)
!74 = !{!8, !8, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !19, line: 96, type: !8)
!79 = !DILocation(line: 96, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !19, line: 96, type: !75)
!81 = !DILocation(line: 96, column: 27, scope: !72)
!82 = !DILocation(line: 99, column: 22, scope: !72)
!83 = !DILocation(line: 99, column: 12, scope: !72)
!84 = !DILocation(line: 99, column: 5, scope: !72)
!85 = !DILocation(line: 101, column: 5, scope: !72)
!86 = !DILocation(line: 102, column: 5, scope: !72)
!87 = !DILocation(line: 103, column: 5, scope: !72)
!88 = !DILocation(line: 106, column: 5, scope: !72)
!89 = !DILocation(line: 107, column: 5, scope: !72)
!90 = !DILocation(line: 108, column: 5, scope: !72)
!91 = !DILocation(line: 110, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!93 = !DILocalVariable(name: "data", scope: !92, file: !19, line: 60, type: !3)
!94 = !DILocation(line: 60, column: 15, scope: !92)
!95 = !DILocalVariable(name: "myUnion", scope: !92, file: !19, line: 61, type: !26)
!96 = !DILocation(line: 61, column: 72, scope: !92)
!97 = !DILocation(line: 62, column: 10, scope: !92)
!98 = !DILocation(line: 64, column: 23, scope: !92)
!99 = !DILocation(line: 64, column: 12, scope: !92)
!100 = !DILocation(line: 64, column: 10, scope: !92)
!101 = !DILocation(line: 65, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !92, file: !19, line: 65, column: 9)
!103 = !DILocation(line: 65, column: 14, scope: !102)
!104 = !DILocation(line: 65, column: 9, scope: !92)
!105 = !DILocation(line: 65, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !19, line: 65, column: 23)
!107 = !DILocation(line: 66, column: 5, scope: !92)
!108 = !DILocation(line: 66, column: 13, scope: !92)
!109 = !DILocation(line: 67, column: 26, scope: !92)
!110 = !DILocation(line: 67, column: 13, scope: !92)
!111 = !DILocation(line: 67, column: 24, scope: !92)
!112 = !DILocalVariable(name: "data", scope: !113, file: !19, line: 69, type: !3)
!113 = distinct !DILexicalBlock(scope: !92, file: !19, line: 68, column: 5)
!114 = !DILocation(line: 69, column: 19, scope: !113)
!115 = !DILocation(line: 69, column: 34, scope: !113)
!116 = !DILocalVariable(name: "source", scope: !117, file: !19, line: 71, type: !53)
!117 = distinct !DILexicalBlock(scope: !113, file: !19, line: 70, column: 9)
!118 = !DILocation(line: 71, column: 21, scope: !117)
!119 = !DILocation(line: 72, column: 21, scope: !117)
!120 = !DILocation(line: 72, column: 13, scope: !117)
!121 = !DILocation(line: 73, column: 13, scope: !117)
!122 = !DILocation(line: 73, column: 27, scope: !117)
!123 = !DILocation(line: 75, column: 20, scope: !117)
!124 = !DILocation(line: 75, column: 26, scope: !117)
!125 = !DILocation(line: 75, column: 13, scope: !117)
!126 = !DILocation(line: 76, column: 24, scope: !117)
!127 = !DILocation(line: 76, column: 13, scope: !117)
!128 = !DILocation(line: 77, column: 18, scope: !117)
!129 = !DILocation(line: 77, column: 13, scope: !117)
!130 = !DILocation(line: 80, column: 1, scope: !92)
