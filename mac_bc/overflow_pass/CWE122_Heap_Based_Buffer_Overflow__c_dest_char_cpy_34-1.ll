; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
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
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_unionType* %myUnion to i8**, !dbg !40
  store i8* %2, i8** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_unionType* %myUnion to i8**, !dbg !45
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
  %call4 = call i8* @__strcpy_chk(i8* noundef %4, i8* noundef %arraydecay3, i64 noundef %6) #9, !dbg !55
  %7 = load i8*, i8** %data1, align 8, !dbg !56
  call void @printLine(i8* noundef %7), !dbg !57
  %8 = load i8*, i8** %data1, align 8, !dbg !58
  call void @free(i8* noundef %8), !dbg !59
  ret void, !dbg !60
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
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* noundef null), !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 noundef %conv), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_good(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_bad(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_unionType* %myUnion, metadata !86, metadata !DIExpression()), !dbg !87
  store i8* null, i8** %data, align 8, !dbg !88
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !89
  store i8* %call, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %cmp = icmp eq i8* %0, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %2 = load i8*, i8** %data, align 8, !dbg !99
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_unionType* %myUnion to i8**, !dbg !100
  store i8* %2, i8** %unionFirst, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !102, metadata !DIExpression()), !dbg !104
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_unionType* %myUnion to i8**, !dbg !105
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !105
  store i8* %3, i8** %data1, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !109
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx2, align 1, !dbg !111
  %4 = load i8*, i8** %data1, align 8, !dbg !112
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  %5 = load i8*, i8** %data1, align 8, !dbg !112
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !112
  %call4 = call i8* @__strcpy_chk(i8* noundef %4, i8* noundef %arraydecay3, i64 noundef %6) #9, !dbg !112
  %7 = load i8*, i8** %data1, align 8, !dbg !113
  call void @printLine(i8* noundef %7), !dbg !114
  %8 = load i8*, i8** %data1, align 8, !dbg !115
  call void @free(i8* noundef %8), !dbg !116
  ret void, !dbg !117
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !3)
!20 = !DILocation(line: 31, column: 12, scope: !14)
!21 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_unionType", file: !15, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !15, line: 23, baseType: !3, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !15, line: 24, baseType: !3, size: 64)
!27 = !DILocation(line: 32, column: 69, scope: !14)
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
!56 = !DILocation(line: 47, column: 23, scope: !47)
!57 = !DILocation(line: 47, column: 13, scope: !47)
!58 = !DILocation(line: 48, column: 18, scope: !47)
!59 = !DILocation(line: 48, column: 13, scope: !47)
!60 = !DILocation(line: 51, column: 1, scope: !14)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_34_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!62 = !DILocation(line: 84, column: 5, scope: !61)
!63 = !DILocation(line: 85, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !65, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !15, line: 96, type: !67)
!70 = !DILocation(line: 96, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !15, line: 96, type: !68)
!72 = !DILocation(line: 96, column: 27, scope: !64)
!73 = !DILocation(line: 99, column: 22, scope: !64)
!74 = !DILocation(line: 99, column: 12, scope: !64)
!75 = !DILocation(line: 99, column: 5, scope: !64)
!76 = !DILocation(line: 101, column: 5, scope: !64)
!77 = !DILocation(line: 102, column: 5, scope: !64)
!78 = !DILocation(line: 103, column: 5, scope: !64)
!79 = !DILocation(line: 106, column: 5, scope: !64)
!80 = !DILocation(line: 107, column: 5, scope: !64)
!81 = !DILocation(line: 108, column: 5, scope: !64)
!82 = !DILocation(line: 110, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!84 = !DILocalVariable(name: "data", scope: !83, file: !15, line: 60, type: !3)
!85 = !DILocation(line: 60, column: 12, scope: !83)
!86 = !DILocalVariable(name: "myUnion", scope: !83, file: !15, line: 61, type: !22)
!87 = !DILocation(line: 61, column: 69, scope: !83)
!88 = !DILocation(line: 62, column: 10, scope: !83)
!89 = !DILocation(line: 64, column: 20, scope: !83)
!90 = !DILocation(line: 64, column: 10, scope: !83)
!91 = !DILocation(line: 65, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !83, file: !15, line: 65, column: 9)
!93 = !DILocation(line: 65, column: 14, scope: !92)
!94 = !DILocation(line: 65, column: 9, scope: !83)
!95 = !DILocation(line: 65, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 65, column: 23)
!97 = !DILocation(line: 66, column: 5, scope: !83)
!98 = !DILocation(line: 66, column: 13, scope: !83)
!99 = !DILocation(line: 67, column: 26, scope: !83)
!100 = !DILocation(line: 67, column: 13, scope: !83)
!101 = !DILocation(line: 67, column: 24, scope: !83)
!102 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 69, type: !3)
!103 = distinct !DILexicalBlock(scope: !83, file: !15, line: 68, column: 5)
!104 = !DILocation(line: 69, column: 16, scope: !103)
!105 = !DILocation(line: 69, column: 31, scope: !103)
!106 = !DILocalVariable(name: "source", scope: !107, file: !15, line: 71, type: !48)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 70, column: 9)
!108 = !DILocation(line: 71, column: 18, scope: !107)
!109 = !DILocation(line: 72, column: 13, scope: !107)
!110 = !DILocation(line: 73, column: 13, scope: !107)
!111 = !DILocation(line: 73, column: 27, scope: !107)
!112 = !DILocation(line: 75, column: 13, scope: !107)
!113 = !DILocation(line: 76, column: 23, scope: !107)
!114 = !DILocation(line: 76, column: 13, scope: !107)
!115 = !DILocation(line: 77, column: 18, scope: !107)
!116 = !DILocation(line: 77, column: 13, scope: !107)
!117 = !DILocation(line: 80, column: 1, scope: !83)
