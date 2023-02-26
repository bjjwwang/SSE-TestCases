; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_12_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
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
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !34
  %tobool = icmp ne i32 %call1, 0, !dbg !34
  br i1 %tobool, label %if.then2, label %if.else, !dbg !36

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end6, !dbg !42

if.else:                                          ; preds = %if.end
  %4 = load i32*, i32** %data, align 8, !dbg !43
  %call4 = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !46
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 49, !dbg !46
  store i32 0, i32* %arrayidx5, align 4, !dbg !47
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !53
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !54
  %7 = bitcast i32* %arraydecay to i8*, !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !54
  %9 = bitcast i32* %8 to i8*, !dbg !54
  %10 = load i32*, i32** %data, align 8, !dbg !54
  %call7 = call i64 @wcslen(i32* noundef %10), !dbg !54
  %mul = mul i64 %call7, 4, !dbg !54
  %call8 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %9, i64 noundef %mul, i64 noundef 200) #9, !dbg !54
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !55
  store i32 0, i32* %arrayidx9, align 4, !dbg !56
  %11 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* noundef %11), !dbg !58
  %12 = load i32*, i32** %data, align 8, !dbg !59
  %13 = bitcast i32* %12 to i8*, !dbg !59
  call void @free(i8* noundef %13), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32 @globalReturnsTrueOrFalse(...) #4

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #6

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_12_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !65 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_12_good(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_12_bad(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !88
  %0 = bitcast i8* %call to i32*, !dbg !89
  store i32* %0, i32** %data, align 8, !dbg !90
  %1 = load i32*, i32** %data, align 8, !dbg !91
  %cmp = icmp eq i32* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !97
  %tobool = icmp ne i32 %call1, 0, !dbg !97
  br i1 %tobool, label %if.then2, label %if.else, !dbg !99

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  br label %if.end6, !dbg !105

if.else:                                          ; preds = %if.end
  %4 = load i32*, i32** %data, align 8, !dbg !106
  %call4 = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 49, !dbg !109
  store i32 0, i32* %arrayidx5, align 4, !dbg !110
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !113
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !114
  %7 = bitcast i32* %arraydecay to i8*, !dbg !114
  %8 = load i32*, i32** %data, align 8, !dbg !114
  %9 = bitcast i32* %8 to i8*, !dbg !114
  %10 = load i32*, i32** %data, align 8, !dbg !114
  %call7 = call i64 @wcslen(i32* noundef %10), !dbg !114
  %mul = mul i64 %call7, 4, !dbg !114
  %call8 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %9, i64 noundef %mul, i64 noundef 200) #9, !dbg !114
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !115
  store i32 0, i32* %arrayidx9, align 4, !dbg !116
  %11 = load i32*, i32** %data, align 8, !dbg !117
  call void @printWLine(i32* noundef %11), !dbg !118
  %12 = load i32*, i32** %data, align 8, !dbg !119
  %13 = bitcast i32* %12 to i8*, !dbg !119
  call void @free(i8* noundef %13), !dbg !120
  ret void, !dbg !121
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_12_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 28, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 8)
!36 = !DILocation(line: 28, column: 8, scope: !18)
!37 = !DILocation(line: 31, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !19, line: 29, column: 5)
!39 = !DILocation(line: 31, column: 9, scope: !38)
!40 = !DILocation(line: 32, column: 9, scope: !38)
!41 = !DILocation(line: 32, column: 21, scope: !38)
!42 = !DILocation(line: 33, column: 5, scope: !38)
!43 = !DILocation(line: 37, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !35, file: !19, line: 35, column: 5)
!45 = !DILocation(line: 37, column: 9, scope: !44)
!46 = !DILocation(line: 38, column: 9, scope: !44)
!47 = !DILocation(line: 38, column: 20, scope: !44)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !19, line: 41, type: !50)
!49 = distinct !DILexicalBlock(scope: !18, file: !19, line: 40, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 50)
!53 = !DILocation(line: 41, column: 17, scope: !49)
!54 = !DILocation(line: 43, column: 9, scope: !49)
!55 = !DILocation(line: 44, column: 9, scope: !49)
!56 = !DILocation(line: 44, column: 20, scope: !49)
!57 = !DILocation(line: 45, column: 20, scope: !49)
!58 = !DILocation(line: 45, column: 9, scope: !49)
!59 = !DILocation(line: 46, column: 14, scope: !49)
!60 = !DILocation(line: 46, column: 9, scope: !49)
!61 = !DILocation(line: 48, column: 1, scope: !18)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_12_good", scope: !19, file: !19, line: 83, type: !20, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!63 = !DILocation(line: 85, column: 5, scope: !62)
!64 = !DILocation(line: 86, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 98, type: !66, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!66 = !DISubroutineType(types: !67)
!67 = !{!8, !8, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !19, line: 98, type: !8)
!72 = !DILocation(line: 98, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !19, line: 98, type: !68)
!74 = !DILocation(line: 98, column: 27, scope: !65)
!75 = !DILocation(line: 101, column: 22, scope: !65)
!76 = !DILocation(line: 101, column: 12, scope: !65)
!77 = !DILocation(line: 101, column: 5, scope: !65)
!78 = !DILocation(line: 103, column: 5, scope: !65)
!79 = !DILocation(line: 104, column: 5, scope: !65)
!80 = !DILocation(line: 105, column: 5, scope: !65)
!81 = !DILocation(line: 108, column: 5, scope: !65)
!82 = !DILocation(line: 109, column: 5, scope: !65)
!83 = !DILocation(line: 110, column: 5, scope: !65)
!84 = !DILocation(line: 112, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!86 = !DILocalVariable(name: "data", scope: !85, file: !19, line: 58, type: !3)
!87 = !DILocation(line: 58, column: 15, scope: !85)
!88 = !DILocation(line: 59, column: 23, scope: !85)
!89 = !DILocation(line: 59, column: 12, scope: !85)
!90 = !DILocation(line: 59, column: 10, scope: !85)
!91 = !DILocation(line: 60, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !19, line: 60, column: 9)
!93 = !DILocation(line: 60, column: 14, scope: !92)
!94 = !DILocation(line: 60, column: 9, scope: !85)
!95 = !DILocation(line: 60, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !19, line: 60, column: 23)
!97 = !DILocation(line: 61, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !85, file: !19, line: 61, column: 8)
!99 = !DILocation(line: 61, column: 8, scope: !85)
!100 = !DILocation(line: 64, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !19, line: 62, column: 5)
!102 = !DILocation(line: 64, column: 9, scope: !101)
!103 = !DILocation(line: 65, column: 9, scope: !101)
!104 = !DILocation(line: 65, column: 20, scope: !101)
!105 = !DILocation(line: 66, column: 5, scope: !101)
!106 = !DILocation(line: 70, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !98, file: !19, line: 68, column: 5)
!108 = !DILocation(line: 70, column: 9, scope: !107)
!109 = !DILocation(line: 71, column: 9, scope: !107)
!110 = !DILocation(line: 71, column: 20, scope: !107)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !19, line: 74, type: !50)
!112 = distinct !DILexicalBlock(scope: !85, file: !19, line: 73, column: 5)
!113 = !DILocation(line: 74, column: 17, scope: !112)
!114 = !DILocation(line: 76, column: 9, scope: !112)
!115 = !DILocation(line: 77, column: 9, scope: !112)
!116 = !DILocation(line: 77, column: 20, scope: !112)
!117 = !DILocation(line: 78, column: 20, scope: !112)
!118 = !DILocation(line: 78, column: 9, scope: !112)
!119 = !DILocation(line: 79, column: 14, scope: !112)
!120 = !DILocation(line: 79, column: 9, scope: !112)
!121 = !DILocation(line: 81, column: 1, scope: !85)
