; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !29
  store i8* %call, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %cmp = icmp eq i8* %0, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_unionType* %myUnion to i8**, !dbg !40
  store i8* %2, i8** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_unionType* %myUnion to i8**, !dbg !45
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !45
  store i8* %3, i8** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx2, align 1, !dbg !54
  %4 = load i8*, i8** %data1, align 8, !dbg !55
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !55
  %5 = load i8*, i8** %data1, align 8, !dbg !55
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !55
  %call4 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %arraydecay3, i64 noundef 100, i64 noundef %6) #9, !dbg !55
  %7 = load i8*, i8** %data1, align 8, !dbg !56
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !56
  store i8 0, i8* %arrayidx5, align 1, !dbg !57
  %8 = load i8*, i8** %data1, align 8, !dbg !58
  call void @printLine(i8* noundef %8), !dbg !59
  %9 = load i8*, i8** %data1, align 8, !dbg !60
  call void @free(i8* noundef %9), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* noundef null), !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 noundef %conv), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_good(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_bad(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_unionType* %myUnion, metadata !88, metadata !DIExpression()), !dbg !89
  store i8* null, i8** %data, align 8, !dbg !90
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !91
  store i8* %call, i8** %data, align 8, !dbg !92
  %0 = load i8*, i8** %data, align 8, !dbg !93
  %cmp = icmp eq i8* %0, null, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  %2 = load i8*, i8** %data, align 8, !dbg !101
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_unionType* %myUnion to i8**, !dbg !102
  store i8* %2, i8** %unionFirst, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !104, metadata !DIExpression()), !dbg !106
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_unionType* %myUnion to i8**, !dbg !107
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !107
  store i8* %3, i8** %data1, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !111
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx2, align 1, !dbg !113
  %4 = load i8*, i8** %data1, align 8, !dbg !114
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !114
  %5 = load i8*, i8** %data1, align 8, !dbg !114
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !114
  %call4 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %arraydecay3, i64 noundef 100, i64 noundef %6) #9, !dbg !114
  %7 = load i8*, i8** %data1, align 8, !dbg !115
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !115
  store i8 0, i8* %arrayidx5, align 1, !dbg !116
  %8 = load i8*, i8** %data1, align 8, !dbg !117
  call void @printLine(i8* noundef %8), !dbg !118
  %9 = load i8*, i8** %data1, align 8, !dbg !119
  call void @free(i8* noundef %9), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !3)
!20 = !DILocation(line: 31, column: 12, scope: !14)
!21 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_unionType", file: !15, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !15, line: 23, baseType: !3, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !15, line: 24, baseType: !3, size: 64)
!27 = !DILocation(line: 32, column: 75, scope: !14)
!28 = !DILocation(line: 33, column: 10, scope: !14)
!29 = !DILocation(line: 35, column: 20, scope: !14)
!30 = !DILocation(line: 35, column: 10, scope: !14)
!31 = !DILocation(line: 36, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 9)
!33 = !DILocation(line: 36, column: 14, scope: !32)
!34 = !DILocation(line: 36, column: 9, scope: !14)
!35 = !DILocation(line: 36, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 36, column: 23)
!37 = !DILocation(line: 37, column: 5, scope: !14)
!38 = !DILocation(line: 37, column: 13, scope: !14)
!39 = !DILocation(line: 38, column: 26, scope: !14)
!40 = !DILocation(line: 38, column: 13, scope: !14)
!41 = !DILocation(line: 38, column: 24, scope: !14)
!42 = !DILocalVariable(name: "data", scope: !43, file: !15, line: 40, type: !3)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 16, scope: !43)
!45 = !DILocation(line: 40, column: 31, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !15, line: 42, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 41, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 42, column: 18, scope: !47)
!52 = !DILocation(line: 43, column: 13, scope: !47)
!53 = !DILocation(line: 44, column: 13, scope: !47)
!54 = !DILocation(line: 44, column: 27, scope: !47)
!55 = !DILocation(line: 46, column: 13, scope: !47)
!56 = !DILocation(line: 47, column: 13, scope: !47)
!57 = !DILocation(line: 47, column: 25, scope: !47)
!58 = !DILocation(line: 48, column: 23, scope: !47)
!59 = !DILocation(line: 48, column: 13, scope: !47)
!60 = !DILocation(line: 49, column: 18, scope: !47)
!61 = !DILocation(line: 49, column: 13, scope: !47)
!62 = !DILocation(line: 52, column: 1, scope: !14)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_34_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!64 = !DILocation(line: 86, column: 5, scope: !63)
!65 = !DILocation(line: 87, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 98, type: !67, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !70}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !15, line: 98, type: !69)
!72 = !DILocation(line: 98, column: 14, scope: !66)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !15, line: 98, type: !70)
!74 = !DILocation(line: 98, column: 27, scope: !66)
!75 = !DILocation(line: 101, column: 22, scope: !66)
!76 = !DILocation(line: 101, column: 12, scope: !66)
!77 = !DILocation(line: 101, column: 5, scope: !66)
!78 = !DILocation(line: 103, column: 5, scope: !66)
!79 = !DILocation(line: 104, column: 5, scope: !66)
!80 = !DILocation(line: 105, column: 5, scope: !66)
!81 = !DILocation(line: 108, column: 5, scope: !66)
!82 = !DILocation(line: 109, column: 5, scope: !66)
!83 = !DILocation(line: 110, column: 5, scope: !66)
!84 = !DILocation(line: 112, column: 5, scope: !66)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!86 = !DILocalVariable(name: "data", scope: !85, file: !15, line: 61, type: !3)
!87 = !DILocation(line: 61, column: 12, scope: !85)
!88 = !DILocalVariable(name: "myUnion", scope: !85, file: !15, line: 62, type: !22)
!89 = !DILocation(line: 62, column: 75, scope: !85)
!90 = !DILocation(line: 63, column: 10, scope: !85)
!91 = !DILocation(line: 65, column: 20, scope: !85)
!92 = !DILocation(line: 65, column: 10, scope: !85)
!93 = !DILocation(line: 66, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !85, file: !15, line: 66, column: 9)
!95 = !DILocation(line: 66, column: 14, scope: !94)
!96 = !DILocation(line: 66, column: 9, scope: !85)
!97 = !DILocation(line: 66, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 66, column: 23)
!99 = !DILocation(line: 67, column: 5, scope: !85)
!100 = !DILocation(line: 67, column: 13, scope: !85)
!101 = !DILocation(line: 68, column: 26, scope: !85)
!102 = !DILocation(line: 68, column: 13, scope: !85)
!103 = !DILocation(line: 68, column: 24, scope: !85)
!104 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 70, type: !3)
!105 = distinct !DILexicalBlock(scope: !85, file: !15, line: 69, column: 5)
!106 = !DILocation(line: 70, column: 16, scope: !105)
!107 = !DILocation(line: 70, column: 31, scope: !105)
!108 = !DILocalVariable(name: "source", scope: !109, file: !15, line: 72, type: !48)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 71, column: 9)
!110 = !DILocation(line: 72, column: 18, scope: !109)
!111 = !DILocation(line: 73, column: 13, scope: !109)
!112 = !DILocation(line: 74, column: 13, scope: !109)
!113 = !DILocation(line: 74, column: 27, scope: !109)
!114 = !DILocation(line: 76, column: 13, scope: !109)
!115 = !DILocation(line: 77, column: 13, scope: !109)
!116 = !DILocation(line: 77, column: 25, scope: !109)
!117 = !DILocation(line: 78, column: 23, scope: !109)
!118 = !DILocation(line: 78, column: 13, scope: !109)
!119 = !DILocation(line: 79, column: 18, scope: !109)
!120 = !DILocation(line: 79, column: 13, scope: !109)
!121 = !DILocation(line: 82, column: 1, scope: !85)
