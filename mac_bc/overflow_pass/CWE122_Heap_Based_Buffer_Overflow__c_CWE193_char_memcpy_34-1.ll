; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_unionType = type { i8* }

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  %call = call i8* @malloc(i64 noundef 10) #7, !dbg !29
  store i8* %call, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %cmp = icmp eq i8* %0, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_unionType* %myUnion to i8**, !dbg !38
  store i8* %1, i8** %unionFirst, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !40, metadata !DIExpression()), !dbg !42
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_unionType* %myUnion to i8**, !dbg !43
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !43
  store i8* %2, i8** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !49
  %4 = load i8*, i8** %data1, align 8, !dbg !50
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !50
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !50
  %call3 = call i64 @strlen(i8* noundef %arraydecay2), !dbg !50
  %add = add i64 %call3, 1, !dbg !50
  %mul = mul i64 %add, 1, !dbg !50
  %5 = load i8*, i8** %data1, align 8, !dbg !50
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !50
  %call4 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %6) #9, !dbg !50
  %7 = load i8*, i8** %data1, align 8, !dbg !51
  call void @printLine(i8* noundef %7), !dbg !52
  %8 = load i8*, i8** %data1, align 8, !dbg !53
  call void @free(i8* noundef %8), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

declare i64 @strlen(i8* noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* noundef null), !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 noundef %conv), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_unionType* %myUnion, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* null, i8** %data, align 8, !dbg !83
  %call = call i8* @malloc(i64 noundef 11) #7, !dbg !84
  store i8* %call, i8** %data, align 8, !dbg !85
  %0 = load i8*, i8** %data, align 8, !dbg !86
  %cmp = icmp eq i8* %0, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !92
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_unionType* %myUnion to i8**, !dbg !93
  store i8* %1, i8** %unionFirst, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !95, metadata !DIExpression()), !dbg !97
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_unionType* %myUnion to i8**, !dbg !98
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !98
  store i8* %2, i8** %data1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !101
  %4 = load i8*, i8** %data1, align 8, !dbg !102
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !102
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !102
  %call3 = call i64 @strlen(i8* noundef %arraydecay2), !dbg !102
  %add = add i64 %call3, 1, !dbg !102
  %mul = mul i64 %add, 1, !dbg !102
  %5 = load i8*, i8** %data1, align 8, !dbg !102
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !102
  %call4 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %6) #9, !dbg !102
  %7 = load i8*, i8** %data1, align 8, !dbg !103
  call void @printLine(i8* noundef %7), !dbg !104
  %8 = load i8*, i8** %data1, align 8, !dbg !105
  call void @free(i8* noundef %8), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_bad", scope: !15, file: !15, line: 34, type: !16, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 36, type: !3)
!20 = !DILocation(line: 36, column: 12, scope: !14)
!21 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 37, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_unionType", file: !15, line: 30, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 26, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !15, line: 28, baseType: !3, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !15, line: 29, baseType: !3, size: 64)
!27 = !DILocation(line: 37, column: 74, scope: !14)
!28 = !DILocation(line: 38, column: 10, scope: !14)
!29 = !DILocation(line: 40, column: 20, scope: !14)
!30 = !DILocation(line: 40, column: 10, scope: !14)
!31 = !DILocation(line: 41, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 9)
!33 = !DILocation(line: 41, column: 14, scope: !32)
!34 = !DILocation(line: 41, column: 9, scope: !14)
!35 = !DILocation(line: 41, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 41, column: 23)
!37 = !DILocation(line: 42, column: 26, scope: !14)
!38 = !DILocation(line: 42, column: 13, scope: !14)
!39 = !DILocation(line: 42, column: 24, scope: !14)
!40 = !DILocalVariable(name: "data", scope: !41, file: !15, line: 44, type: !3)
!41 = distinct !DILexicalBlock(scope: !14, file: !15, line: 43, column: 5)
!42 = !DILocation(line: 44, column: 16, scope: !41)
!43 = !DILocation(line: 44, column: 31, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !15, line: 46, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 45, column: 9)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 11)
!49 = !DILocation(line: 46, column: 18, scope: !45)
!50 = !DILocation(line: 49, column: 13, scope: !45)
!51 = !DILocation(line: 50, column: 23, scope: !45)
!52 = !DILocation(line: 50, column: 13, scope: !45)
!53 = !DILocation(line: 51, column: 18, scope: !45)
!54 = !DILocation(line: 51, column: 13, scope: !45)
!55 = !DILocation(line: 54, column: 1, scope: !14)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_34_good", scope: !15, file: !15, line: 83, type: !16, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!57 = !DILocation(line: 85, column: 5, scope: !56)
!58 = !DILocation(line: 86, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 97, type: !60, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 97, type: !62)
!65 = !DILocation(line: 97, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 97, type: !63)
!67 = !DILocation(line: 97, column: 27, scope: !59)
!68 = !DILocation(line: 100, column: 22, scope: !59)
!69 = !DILocation(line: 100, column: 12, scope: !59)
!70 = !DILocation(line: 100, column: 5, scope: !59)
!71 = !DILocation(line: 102, column: 5, scope: !59)
!72 = !DILocation(line: 103, column: 5, scope: !59)
!73 = !DILocation(line: 104, column: 5, scope: !59)
!74 = !DILocation(line: 107, column: 5, scope: !59)
!75 = !DILocation(line: 108, column: 5, scope: !59)
!76 = !DILocation(line: 109, column: 5, scope: !59)
!77 = !DILocation(line: 111, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 63, type: !3)
!80 = !DILocation(line: 63, column: 12, scope: !78)
!81 = !DILocalVariable(name: "myUnion", scope: !78, file: !15, line: 64, type: !22)
!82 = !DILocation(line: 64, column: 74, scope: !78)
!83 = !DILocation(line: 65, column: 10, scope: !78)
!84 = !DILocation(line: 67, column: 20, scope: !78)
!85 = !DILocation(line: 67, column: 10, scope: !78)
!86 = !DILocation(line: 68, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !78, file: !15, line: 68, column: 9)
!88 = !DILocation(line: 68, column: 14, scope: !87)
!89 = !DILocation(line: 68, column: 9, scope: !78)
!90 = !DILocation(line: 68, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 68, column: 23)
!92 = !DILocation(line: 69, column: 26, scope: !78)
!93 = !DILocation(line: 69, column: 13, scope: !78)
!94 = !DILocation(line: 69, column: 24, scope: !78)
!95 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 71, type: !3)
!96 = distinct !DILexicalBlock(scope: !78, file: !15, line: 70, column: 5)
!97 = !DILocation(line: 71, column: 16, scope: !96)
!98 = !DILocation(line: 71, column: 31, scope: !96)
!99 = !DILocalVariable(name: "source", scope: !100, file: !15, line: 73, type: !46)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 72, column: 9)
!101 = !DILocation(line: 73, column: 18, scope: !100)
!102 = !DILocation(line: 76, column: 13, scope: !100)
!103 = !DILocation(line: 77, column: 23, scope: !100)
!104 = !DILocation(line: 77, column: 13, scope: !100)
!105 = !DILocation(line: 78, column: 18, scope: !100)
!106 = !DILocation(line: 78, column: 13, scope: !100)
!107 = !DILocation(line: 81, column: 1, scope: !78)
