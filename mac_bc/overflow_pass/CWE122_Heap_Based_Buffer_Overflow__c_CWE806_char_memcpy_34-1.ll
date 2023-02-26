; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_unionType, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
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
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_unionType* %myUnion to i8**, !dbg !40
  store i8* %5, i8** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_unionType* %myUnion to i8**, !dbg !45
  %6 = load i8*, i8** %unionSecond, align 8, !dbg !45
  store i8* %6, i8** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !51
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !52
  %8 = load i8*, i8** %data2, align 8, !dbg !52
  %9 = load i8*, i8** %data2, align 8, !dbg !52
  %call3 = call i64 @strlen(i8* noundef %9), !dbg !52
  %mul = mul i64 %call3, 1, !dbg !52
  %call4 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef %mul, i64 noundef 50) #9, !dbg !52
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !53
  store i8 0, i8* %arrayidx5, align 1, !dbg !54
  %10 = load i8*, i8** %data2, align 8, !dbg !55
  call void @printLine(i8* noundef %10), !dbg !56
  %11 = load i8*, i8** %data2, align 8, !dbg !57
  call void @free(i8* noundef %11), !dbg !58
  ret void, !dbg !59
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* noundef null), !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 noundef %conv), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_good(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_bad(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_unionType, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_unionType* %myUnion, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !87
  store i8* %call, i8** %data, align 8, !dbg !88
  %0 = load i8*, i8** %data, align 8, !dbg !89
  %cmp = icmp eq i8* %0, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !95
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !95
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %5 = load i8*, i8** %data, align 8, !dbg !98
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_unionType* %myUnion to i8**, !dbg !99
  store i8* %5, i8** %unionFirst, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !101, metadata !DIExpression()), !dbg !103
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_unionType* %myUnion to i8**, !dbg !104
  %6 = load i8*, i8** %unionSecond, align 8, !dbg !104
  store i8* %6, i8** %data2, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !108
  %8 = load i8*, i8** %data2, align 8, !dbg !108
  %9 = load i8*, i8** %data2, align 8, !dbg !108
  %call3 = call i64 @strlen(i8* noundef %9), !dbg !108
  %mul = mul i64 %call3, 1, !dbg !108
  %call4 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef %mul, i64 noundef 50) #9, !dbg !108
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !109
  store i8 0, i8* %arrayidx5, align 1, !dbg !110
  %10 = load i8*, i8** %data2, align 8, !dbg !111
  call void @printLine(i8* noundef %10), !dbg !112
  %11 = load i8*, i8** %data2, align 8, !dbg !113
  call void @free(i8* noundef %11), !dbg !114
  ret void, !dbg !115
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !3)
!20 = !DILocation(line: 31, column: 12, scope: !14)
!21 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_unionType", file: !15, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !15, line: 23, baseType: !3, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !15, line: 24, baseType: !3, size: 64)
!27 = !DILocation(line: 32, column: 74, scope: !14)
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
!53 = !DILocation(line: 45, column: 13, scope: !47)
!54 = !DILocation(line: 45, column: 24, scope: !47)
!55 = !DILocation(line: 46, column: 23, scope: !47)
!56 = !DILocation(line: 46, column: 13, scope: !47)
!57 = !DILocation(line: 47, column: 18, scope: !47)
!58 = !DILocation(line: 47, column: 13, scope: !47)
!59 = !DILocation(line: 50, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_34_good", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!61 = !DILocation(line: 82, column: 5, scope: !60)
!62 = !DILocation(line: 83, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 94, type: !64, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 94, type: !66)
!69 = !DILocation(line: 94, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 94, type: !67)
!71 = !DILocation(line: 94, column: 27, scope: !63)
!72 = !DILocation(line: 97, column: 22, scope: !63)
!73 = !DILocation(line: 97, column: 12, scope: !63)
!74 = !DILocation(line: 97, column: 5, scope: !63)
!75 = !DILocation(line: 99, column: 5, scope: !63)
!76 = !DILocation(line: 100, column: 5, scope: !63)
!77 = !DILocation(line: 101, column: 5, scope: !63)
!78 = !DILocation(line: 104, column: 5, scope: !63)
!79 = !DILocation(line: 105, column: 5, scope: !63)
!80 = !DILocation(line: 106, column: 5, scope: !63)
!81 = !DILocation(line: 108, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 59, type: !3)
!84 = !DILocation(line: 59, column: 12, scope: !82)
!85 = !DILocalVariable(name: "myUnion", scope: !82, file: !15, line: 60, type: !22)
!86 = !DILocation(line: 60, column: 74, scope: !82)
!87 = !DILocation(line: 61, column: 20, scope: !82)
!88 = !DILocation(line: 61, column: 10, scope: !82)
!89 = !DILocation(line: 62, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !15, line: 62, column: 9)
!91 = !DILocation(line: 62, column: 14, scope: !90)
!92 = !DILocation(line: 62, column: 9, scope: !82)
!93 = !DILocation(line: 62, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 62, column: 23)
!95 = !DILocation(line: 64, column: 5, scope: !82)
!96 = !DILocation(line: 65, column: 5, scope: !82)
!97 = !DILocation(line: 65, column: 16, scope: !82)
!98 = !DILocation(line: 66, column: 26, scope: !82)
!99 = !DILocation(line: 66, column: 13, scope: !82)
!100 = !DILocation(line: 66, column: 24, scope: !82)
!101 = !DILocalVariable(name: "data", scope: !102, file: !15, line: 68, type: !3)
!102 = distinct !DILexicalBlock(scope: !82, file: !15, line: 67, column: 5)
!103 = !DILocation(line: 68, column: 16, scope: !102)
!104 = !DILocation(line: 68, column: 31, scope: !102)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !15, line: 70, type: !48)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 69, column: 9)
!107 = !DILocation(line: 70, column: 18, scope: !106)
!108 = !DILocation(line: 72, column: 13, scope: !106)
!109 = !DILocation(line: 73, column: 13, scope: !106)
!110 = !DILocation(line: 73, column: 24, scope: !106)
!111 = !DILocation(line: 74, column: 23, scope: !106)
!112 = !DILocation(line: 74, column: 13, scope: !106)
!113 = !DILocation(line: 75, column: 18, scope: !106)
!114 = !DILocation(line: 75, column: 13, scope: !106)
!115 = !DILocation(line: 78, column: 1, scope: !82)
