; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !28
  store i8* %call, i8** %data, align 8, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !36
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %5 = load i8*, i8** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion to i8**, !dbg !40
  store i8* %5, i8** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion to i8**, !dbg !45
  %6 = load i8*, i8** %unionSecond, align 8, !dbg !45
  store i8* %6, i8** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !51
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !52
  %8 = load i8*, i8** %data2, align 8, !dbg !52
  %call3 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef 50) #9, !dbg !52
  %9 = load i8*, i8** %data2, align 8, !dbg !53
  call void @printLine(i8* noundef %9), !dbg !54
  %10 = load i8*, i8** %data2, align 8, !dbg !55
  call void @free(i8* noundef %10), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #4

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_good() #0 !dbg !58 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* noundef null), !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 noundef %conv), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_good(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_bad(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !85
  store i8* %call, i8** %data, align 8, !dbg !86
  %0 = load i8*, i8** %data, align 8, !dbg !87
  %cmp = icmp eq i8* %0, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !93
  %2 = load i8*, i8** %data, align 8, !dbg !93
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !93
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %5 = load i8*, i8** %data, align 8, !dbg !96
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion to i8**, !dbg !97
  store i8* %5, i8** %unionFirst, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !99, metadata !DIExpression()), !dbg !101
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType* %myUnion to i8**, !dbg !102
  %6 = load i8*, i8** %unionSecond, align 8, !dbg !102
  store i8* %6, i8** %data2, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !105
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !106
  %8 = load i8*, i8** %data2, align 8, !dbg !106
  %call3 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef 50) #9, !dbg !106
  %9 = load i8*, i8** %data2, align 8, !dbg !107
  call void @printLine(i8* noundef %9), !dbg !108
  %10 = load i8*, i8** %data2, align 8, !dbg !109
  call void @free(i8* noundef %10), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !3)
!20 = !DILocation(line: 31, column: 12, scope: !14)
!21 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_unionType", file: !15, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !15, line: 23, baseType: !3, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !15, line: 24, baseType: !3, size: 64)
!27 = !DILocation(line: 32, column: 68, scope: !14)
!28 = !DILocation(line: 33, column: 20, scope: !14)
!29 = !DILocation(line: 33, column: 10, scope: !14)
!30 = !DILocation(line: 34, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!32 = !DILocation(line: 34, column: 14, scope: !31)
!33 = !DILocation(line: 34, column: 9, scope: !14)
!34 = !DILocation(line: 34, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 34, column: 23)
!36 = !DILocation(line: 36, column: 5, scope: !14)
!37 = !DILocation(line: 37, column: 5, scope: !14)
!38 = !DILocation(line: 37, column: 17, scope: !14)
!39 = !DILocation(line: 38, column: 26, scope: !14)
!40 = !DILocation(line: 38, column: 13, scope: !14)
!41 = !DILocation(line: 38, column: 24, scope: !14)
!42 = !DILocalVariable(name: "data", scope: !43, file: !15, line: 40, type: !3)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 16, scope: !43)
!45 = !DILocation(line: 40, column: 31, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !15, line: 42, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 41, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 42, column: 18, scope: !47)
!52 = !DILocation(line: 44, column: 13, scope: !47)
!53 = !DILocation(line: 45, column: 23, scope: !47)
!54 = !DILocation(line: 45, column: 13, scope: !47)
!55 = !DILocation(line: 46, column: 18, scope: !47)
!56 = !DILocation(line: 46, column: 13, scope: !47)
!57 = !DILocation(line: 49, column: 1, scope: !14)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_34_good", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!59 = !DILocation(line: 80, column: 5, scope: !58)
!60 = !DILocation(line: 81, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 92, type: !62, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !15, line: 92, type: !64)
!67 = !DILocation(line: 92, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !15, line: 92, type: !65)
!69 = !DILocation(line: 92, column: 27, scope: !61)
!70 = !DILocation(line: 95, column: 22, scope: !61)
!71 = !DILocation(line: 95, column: 12, scope: !61)
!72 = !DILocation(line: 95, column: 5, scope: !61)
!73 = !DILocation(line: 97, column: 5, scope: !61)
!74 = !DILocation(line: 98, column: 5, scope: !61)
!75 = !DILocation(line: 99, column: 5, scope: !61)
!76 = !DILocation(line: 102, column: 5, scope: !61)
!77 = !DILocation(line: 103, column: 5, scope: !61)
!78 = !DILocation(line: 104, column: 5, scope: !61)
!79 = !DILocation(line: 106, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 58, type: !3)
!82 = !DILocation(line: 58, column: 12, scope: !80)
!83 = !DILocalVariable(name: "myUnion", scope: !80, file: !15, line: 59, type: !22)
!84 = !DILocation(line: 59, column: 68, scope: !80)
!85 = !DILocation(line: 60, column: 20, scope: !80)
!86 = !DILocation(line: 60, column: 10, scope: !80)
!87 = !DILocation(line: 61, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !80, file: !15, line: 61, column: 9)
!89 = !DILocation(line: 61, column: 14, scope: !88)
!90 = !DILocation(line: 61, column: 9, scope: !80)
!91 = !DILocation(line: 61, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 61, column: 23)
!93 = !DILocation(line: 63, column: 5, scope: !80)
!94 = !DILocation(line: 64, column: 5, scope: !80)
!95 = !DILocation(line: 64, column: 16, scope: !80)
!96 = !DILocation(line: 65, column: 26, scope: !80)
!97 = !DILocation(line: 65, column: 13, scope: !80)
!98 = !DILocation(line: 65, column: 24, scope: !80)
!99 = !DILocalVariable(name: "data", scope: !100, file: !15, line: 67, type: !3)
!100 = distinct !DILexicalBlock(scope: !80, file: !15, line: 66, column: 5)
!101 = !DILocation(line: 67, column: 16, scope: !100)
!102 = !DILocation(line: 67, column: 31, scope: !100)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !15, line: 69, type: !48)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 68, column: 9)
!105 = !DILocation(line: 69, column: 18, scope: !104)
!106 = !DILocation(line: 71, column: 13, scope: !104)
!107 = !DILocation(line: 72, column: 23, scope: !104)
!108 = !DILocation(line: 72, column: 13, scope: !104)
!109 = !DILocation(line: 73, column: 18, scope: !104)
!110 = !DILocation(line: 73, column: 13, scope: !104)
!111 = !DILocation(line: 76, column: 1, scope: !80)
