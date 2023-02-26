; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !25
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !34
  %tobool = icmp ne i32 %call1, 0, !dbg !34
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !36

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end4, !dbg !42

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !49
  %5 = load i32*, i32** %data, align 8, !dbg !50
  %call5 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %5), !dbg !51
  %6 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* noundef %6), !dbg !53
  %7 = load i32*, i32** %data, align 8, !dbg !54
  %8 = bitcast i32* %7 to i8*, !dbg !54
  call void @free(i8* noundef %8), !dbg !55
  ret void, !dbg !56
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

declare i32* @wcscat(i32* noundef, i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !81 {
entry:
  ret i32 1, !dbg !84
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !88
  %0 = bitcast i8* %call to i32*, !dbg !89
  store i32* %0, i32** %data, align 8, !dbg !90
  %1 = load i32*, i32** %data, align 8, !dbg !91
  %cmp = icmp eq i32* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !97
  %tobool = icmp ne i32 %call1, 0, !dbg !97
  br i1 %tobool, label %if.then2, label %if.else, !dbg !99

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !100
  br label %if.end4, !dbg !102

if.else:                                          ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !103
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !110
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  %call5 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %5), !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* noundef %6), !dbg !115
  %7 = load i32*, i32** %data, align 8, !dbg !116
  %8 = bitcast i32* %7 to i8*, !dbg !116
  call void @free(i8* noundef %8), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !119 {
entry:
  ret i32 0, !dbg !120
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !124
  %0 = bitcast i8* %call to i32*, !dbg !125
  store i32* %0, i32** %data, align 8, !dbg !126
  %1 = load i32*, i32** %data, align 8, !dbg !127
  %cmp = icmp eq i32* %1, null, !dbg !129
  br i1 %cmp, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !131
  unreachable, !dbg !131

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !133
  %tobool = icmp ne i32 %call1, 0, !dbg !133
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !135

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !136
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !138
  %3 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !139
  store i32 0, i32* %arrayidx, align 4, !dbg !140
  br label %if.end4, !dbg !141

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !144
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !144
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !145
  %5 = load i32*, i32** %data, align 8, !dbg !146
  %call5 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %5), !dbg !147
  %6 = load i32*, i32** %data, align 8, !dbg !148
  call void @printWLine(i32* noundef %6), !dbg !149
  %7 = load i32*, i32** %data, align 8, !dbg !150
  %8 = bitcast i32* %7 to i8*, !dbg !150
  call void @free(i8* noundef %8), !dbg !151
  ret void, !dbg !152
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_bad", scope: !19, file: !19, line: 37, type: !20, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 39, type: !3)
!24 = !DILocation(line: 39, column: 15, scope: !18)
!25 = !DILocation(line: 40, column: 23, scope: !18)
!26 = !DILocation(line: 40, column: 12, scope: !18)
!27 = !DILocation(line: 40, column: 10, scope: !18)
!28 = !DILocation(line: 41, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 41, column: 9)
!30 = !DILocation(line: 41, column: 14, scope: !29)
!31 = !DILocation(line: 41, column: 9, scope: !18)
!32 = !DILocation(line: 41, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 41, column: 23)
!34 = !DILocation(line: 42, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !18, file: !19, line: 42, column: 8)
!36 = !DILocation(line: 42, column: 8, scope: !18)
!37 = !DILocation(line: 45, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !19, line: 43, column: 5)
!39 = !DILocation(line: 45, column: 9, scope: !38)
!40 = !DILocation(line: 46, column: 9, scope: !38)
!41 = !DILocation(line: 46, column: 21, scope: !38)
!42 = !DILocation(line: 47, column: 5, scope: !38)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !19, line: 49, type: !45)
!44 = distinct !DILexicalBlock(scope: !18, file: !19, line: 48, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 49, column: 17, scope: !44)
!49 = !DILocation(line: 51, column: 16, scope: !44)
!50 = !DILocation(line: 51, column: 22, scope: !44)
!51 = !DILocation(line: 51, column: 9, scope: !44)
!52 = !DILocation(line: 52, column: 20, scope: !44)
!53 = !DILocation(line: 52, column: 9, scope: !44)
!54 = !DILocation(line: 53, column: 14, scope: !44)
!55 = !DILocation(line: 53, column: 9, scope: !44)
!56 = !DILocation(line: 55, column: 1, scope: !18)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_good", scope: !19, file: !19, line: 108, type: !20, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!58 = !DILocation(line: 110, column: 5, scope: !57)
!59 = !DILocation(line: 111, column: 5, scope: !57)
!60 = !DILocation(line: 112, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 124, type: !62, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!62 = !DISubroutineType(types: !63)
!63 = !{!8, !8, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !19, line: 124, type: !8)
!68 = !DILocation(line: 124, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !19, line: 124, type: !64)
!70 = !DILocation(line: 124, column: 27, scope: !61)
!71 = !DILocation(line: 127, column: 22, scope: !61)
!72 = !DILocation(line: 127, column: 12, scope: !61)
!73 = !DILocation(line: 127, column: 5, scope: !61)
!74 = !DILocation(line: 129, column: 5, scope: !61)
!75 = !DILocation(line: 130, column: 5, scope: !61)
!76 = !DILocation(line: 131, column: 5, scope: !61)
!77 = !DILocation(line: 134, column: 5, scope: !61)
!78 = !DILocation(line: 135, column: 5, scope: !61)
!79 = !DILocation(line: 136, column: 5, scope: !61)
!80 = !DILocation(line: 138, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !19, file: !19, line: 25, type: !82, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!82 = !DISubroutineType(types: !83)
!83 = !{!8}
!84 = !DILocation(line: 27, column: 5, scope: !81)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!86 = !DILocalVariable(name: "data", scope: !85, file: !19, line: 64, type: !3)
!87 = !DILocation(line: 64, column: 15, scope: !85)
!88 = !DILocation(line: 65, column: 23, scope: !85)
!89 = !DILocation(line: 65, column: 12, scope: !85)
!90 = !DILocation(line: 65, column: 10, scope: !85)
!91 = !DILocation(line: 66, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !19, line: 66, column: 9)
!93 = !DILocation(line: 66, column: 14, scope: !92)
!94 = !DILocation(line: 66, column: 9, scope: !85)
!95 = !DILocation(line: 66, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !19, line: 66, column: 23)
!97 = !DILocation(line: 67, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !85, file: !19, line: 67, column: 8)
!99 = !DILocation(line: 67, column: 8, scope: !85)
!100 = !DILocation(line: 70, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !19, line: 68, column: 5)
!102 = !DILocation(line: 71, column: 5, scope: !101)
!103 = !DILocation(line: 75, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !19, line: 73, column: 5)
!105 = !DILocation(line: 75, column: 9, scope: !104)
!106 = !DILocation(line: 76, column: 9, scope: !104)
!107 = !DILocation(line: 76, column: 20, scope: !104)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !19, line: 79, type: !45)
!109 = distinct !DILexicalBlock(scope: !85, file: !19, line: 78, column: 5)
!110 = !DILocation(line: 79, column: 17, scope: !109)
!111 = !DILocation(line: 81, column: 16, scope: !109)
!112 = !DILocation(line: 81, column: 22, scope: !109)
!113 = !DILocation(line: 81, column: 9, scope: !109)
!114 = !DILocation(line: 82, column: 20, scope: !109)
!115 = !DILocation(line: 82, column: 9, scope: !109)
!116 = !DILocation(line: 83, column: 14, scope: !109)
!117 = !DILocation(line: 83, column: 9, scope: !109)
!118 = !DILocation(line: 85, column: 1, scope: !85)
!119 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !19, file: !19, line: 30, type: !82, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!120 = !DILocation(line: 32, column: 5, scope: !119)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 88, type: !20, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!122 = !DILocalVariable(name: "data", scope: !121, file: !19, line: 90, type: !3)
!123 = !DILocation(line: 90, column: 15, scope: !121)
!124 = !DILocation(line: 91, column: 23, scope: !121)
!125 = !DILocation(line: 91, column: 12, scope: !121)
!126 = !DILocation(line: 91, column: 10, scope: !121)
!127 = !DILocation(line: 92, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !121, file: !19, line: 92, column: 9)
!129 = !DILocation(line: 92, column: 14, scope: !128)
!130 = !DILocation(line: 92, column: 9, scope: !121)
!131 = !DILocation(line: 92, column: 24, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !19, line: 92, column: 23)
!133 = !DILocation(line: 93, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !121, file: !19, line: 93, column: 8)
!135 = !DILocation(line: 93, column: 8, scope: !121)
!136 = !DILocation(line: 96, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !19, line: 94, column: 5)
!138 = !DILocation(line: 96, column: 9, scope: !137)
!139 = !DILocation(line: 97, column: 9, scope: !137)
!140 = !DILocation(line: 97, column: 20, scope: !137)
!141 = !DILocation(line: 98, column: 5, scope: !137)
!142 = !DILocalVariable(name: "dest", scope: !143, file: !19, line: 100, type: !45)
!143 = distinct !DILexicalBlock(scope: !121, file: !19, line: 99, column: 5)
!144 = !DILocation(line: 100, column: 17, scope: !143)
!145 = !DILocation(line: 102, column: 16, scope: !143)
!146 = !DILocation(line: 102, column: 22, scope: !143)
!147 = !DILocation(line: 102, column: 9, scope: !143)
!148 = !DILocation(line: 103, column: 20, scope: !143)
!149 = !DILocation(line: 103, column: 9, scope: !143)
!150 = !DILocation(line: 104, column: 14, scope: !143)
!151 = !DILocation(line: 104, column: 9, scope: !143)
!152 = !DILocation(line: 106, column: 1, scope: !121)
