; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_31_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !25
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !35
  %3 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !38, metadata !DIExpression()), !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  store i32* %4, i32** %dataCopy, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !42, metadata !DIExpression()), !dbg !43
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !44
  store i32* %5, i32** %data2, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !51
  %7 = bitcast i32* %arraydecay to i8*, !dbg !51
  %8 = load i32*, i32** %data2, align 8, !dbg !51
  %9 = bitcast i32* %8 to i8*, !dbg !51
  %10 = load i32*, i32** %data2, align 8, !dbg !51
  %call3 = call i64 @wcslen(i32* noundef %10), !dbg !51
  %mul = mul i64 %call3, 4, !dbg !51
  %call4 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %9, i64 noundef %mul, i64 noundef 200) #9, !dbg !51
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !52
  store i32 0, i32* %arrayidx5, align 4, !dbg !53
  %11 = load i32*, i32** %data2, align 8, !dbg !54
  call void @printWLine(i32* noundef %11), !dbg !55
  %12 = load i32*, i32** %data2, align 8, !dbg !56
  %13 = bitcast i32* %12 to i8*, !dbg !56
  call void @free(i8* noundef %13), !dbg !57
  ret void, !dbg !58
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

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #6

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_31_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !62 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_31_good(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_31_bad(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !85
  %0 = bitcast i8* %call to i32*, !dbg !86
  store i32* %0, i32** %data, align 8, !dbg !87
  %1 = load i32*, i32** %data, align 8, !dbg !88
  %cmp = icmp eq i32* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !95
  %3 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !98, metadata !DIExpression()), !dbg !100
  %4 = load i32*, i32** %data, align 8, !dbg !101
  store i32* %4, i32** %dataCopy, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !102, metadata !DIExpression()), !dbg !103
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !104
  store i32* %5, i32** %data2, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !108
  %7 = bitcast i32* %arraydecay to i8*, !dbg !108
  %8 = load i32*, i32** %data2, align 8, !dbg !108
  %9 = bitcast i32* %8 to i8*, !dbg !108
  %10 = load i32*, i32** %data2, align 8, !dbg !108
  %call3 = call i64 @wcslen(i32* noundef %10), !dbg !108
  %mul = mul i64 %call3, 4, !dbg !108
  %call4 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %9, i64 noundef %mul, i64 noundef 200) #9, !dbg !108
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !109
  store i32 0, i32* %arrayidx5, align 4, !dbg !110
  %11 = load i32*, i32** %data2, align 8, !dbg !111
  call void @printWLine(i32* noundef %11), !dbg !112
  %12 = load i32*, i32** %data2, align 8, !dbg !113
  %13 = bitcast i32* %12 to i8*, !dbg !113
  call void @free(i8* noundef %13), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_31_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 23, scope: !18)
!26 = !DILocation(line: 26, column: 12, scope: !18)
!27 = !DILocation(line: 26, column: 10, scope: !18)
!28 = !DILocation(line: 27, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 9)
!30 = !DILocation(line: 27, column: 14, scope: !29)
!31 = !DILocation(line: 27, column: 9, scope: !18)
!32 = !DILocation(line: 27, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 27, column: 23)
!34 = !DILocation(line: 29, column: 13, scope: !18)
!35 = !DILocation(line: 29, column: 5, scope: !18)
!36 = !DILocation(line: 30, column: 5, scope: !18)
!37 = !DILocation(line: 30, column: 17, scope: !18)
!38 = !DILocalVariable(name: "dataCopy", scope: !39, file: !19, line: 32, type: !3)
!39 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 5)
!40 = !DILocation(line: 32, column: 19, scope: !39)
!41 = !DILocation(line: 32, column: 30, scope: !39)
!42 = !DILocalVariable(name: "data", scope: !39, file: !19, line: 33, type: !3)
!43 = !DILocation(line: 33, column: 19, scope: !39)
!44 = !DILocation(line: 33, column: 26, scope: !39)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !19, line: 35, type: !47)
!46 = distinct !DILexicalBlock(scope: !39, file: !19, line: 34, column: 9)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 35, column: 21, scope: !46)
!51 = !DILocation(line: 37, column: 13, scope: !46)
!52 = !DILocation(line: 38, column: 13, scope: !46)
!53 = !DILocation(line: 38, column: 24, scope: !46)
!54 = !DILocation(line: 39, column: 24, scope: !46)
!55 = !DILocation(line: 39, column: 13, scope: !46)
!56 = !DILocation(line: 40, column: 18, scope: !46)
!57 = !DILocation(line: 40, column: 13, scope: !46)
!58 = !DILocation(line: 43, column: 1, scope: !18)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_31_good", scope: !19, file: !19, line: 72, type: !20, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!60 = !DILocation(line: 74, column: 5, scope: !59)
!61 = !DILocation(line: 75, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 86, type: !63, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!63 = !DISubroutineType(types: !64)
!64 = !{!8, !8, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !19, line: 86, type: !8)
!69 = !DILocation(line: 86, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !19, line: 86, type: !65)
!71 = !DILocation(line: 86, column: 27, scope: !62)
!72 = !DILocation(line: 89, column: 22, scope: !62)
!73 = !DILocation(line: 89, column: 12, scope: !62)
!74 = !DILocation(line: 89, column: 5, scope: !62)
!75 = !DILocation(line: 91, column: 5, scope: !62)
!76 = !DILocation(line: 92, column: 5, scope: !62)
!77 = !DILocation(line: 93, column: 5, scope: !62)
!78 = !DILocation(line: 96, column: 5, scope: !62)
!79 = !DILocation(line: 97, column: 5, scope: !62)
!80 = !DILocation(line: 98, column: 5, scope: !62)
!81 = !DILocation(line: 100, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 50, type: !20, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!83 = !DILocalVariable(name: "data", scope: !82, file: !19, line: 52, type: !3)
!84 = !DILocation(line: 52, column: 15, scope: !82)
!85 = !DILocation(line: 53, column: 23, scope: !82)
!86 = !DILocation(line: 53, column: 12, scope: !82)
!87 = !DILocation(line: 53, column: 10, scope: !82)
!88 = !DILocation(line: 54, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !19, line: 54, column: 9)
!90 = !DILocation(line: 54, column: 14, scope: !89)
!91 = !DILocation(line: 54, column: 9, scope: !82)
!92 = !DILocation(line: 54, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !19, line: 54, column: 23)
!94 = !DILocation(line: 56, column: 13, scope: !82)
!95 = !DILocation(line: 56, column: 5, scope: !82)
!96 = !DILocation(line: 57, column: 5, scope: !82)
!97 = !DILocation(line: 57, column: 16, scope: !82)
!98 = !DILocalVariable(name: "dataCopy", scope: !99, file: !19, line: 59, type: !3)
!99 = distinct !DILexicalBlock(scope: !82, file: !19, line: 58, column: 5)
!100 = !DILocation(line: 59, column: 19, scope: !99)
!101 = !DILocation(line: 59, column: 30, scope: !99)
!102 = !DILocalVariable(name: "data", scope: !99, file: !19, line: 60, type: !3)
!103 = !DILocation(line: 60, column: 19, scope: !99)
!104 = !DILocation(line: 60, column: 26, scope: !99)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !19, line: 62, type: !47)
!106 = distinct !DILexicalBlock(scope: !99, file: !19, line: 61, column: 9)
!107 = !DILocation(line: 62, column: 21, scope: !106)
!108 = !DILocation(line: 64, column: 13, scope: !106)
!109 = !DILocation(line: 65, column: 13, scope: !106)
!110 = !DILocation(line: 65, column: 24, scope: !106)
!111 = !DILocation(line: 66, column: 24, scope: !106)
!112 = !DILocation(line: 66, column: 13, scope: !106)
!113 = !DILocation(line: 67, column: 18, scope: !106)
!114 = !DILocation(line: 67, column: 13, scope: !106)
!115 = !DILocation(line: 70, column: 1, scope: !82)
