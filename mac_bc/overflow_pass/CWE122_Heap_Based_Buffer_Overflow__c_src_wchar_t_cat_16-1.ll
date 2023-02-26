; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_bad() #0 !dbg !18 {
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
  br label %while.body, !dbg !34

while.body:                                       ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %while.end, !dbg !40

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %call2 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %5), !dbg !49
  %6 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* noundef %6), !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  %8 = bitcast i32* %7 to i8*, !dbg !52
  call void @free(i8* noundef %8), !dbg !53
  ret void, !dbg !54
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !81
  %0 = bitcast i8* %call to i32*, !dbg !82
  store i32* %0, i32** %data, align 8, !dbg !83
  %1 = load i32*, i32** %data, align 8, !dbg !84
  %cmp = icmp eq i32* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  br label %while.body, !dbg !90

while.body:                                       ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !91
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !93
  %3 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %while.end, !dbg !96

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !100
  %5 = load i32*, i32** %data, align 8, !dbg !101
  %call2 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %5), !dbg !102
  %6 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* noundef %6), !dbg !104
  %7 = load i32*, i32** %data, align 8, !dbg !105
  %8 = bitcast i32* %7 to i8*, !dbg !105
  call void @free(i8* noundef %8), !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 28, column: 5, scope: !18)
!35 = !DILocation(line: 31, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 5)
!37 = !DILocation(line: 31, column: 9, scope: !36)
!38 = !DILocation(line: 32, column: 9, scope: !36)
!39 = !DILocation(line: 32, column: 21, scope: !36)
!40 = !DILocation(line: 33, column: 9, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !19, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 36, column: 17, scope: !42)
!47 = !DILocation(line: 38, column: 16, scope: !42)
!48 = !DILocation(line: 38, column: 22, scope: !42)
!49 = !DILocation(line: 38, column: 9, scope: !42)
!50 = !DILocation(line: 39, column: 20, scope: !42)
!51 = !DILocation(line: 39, column: 9, scope: !42)
!52 = !DILocation(line: 40, column: 14, scope: !42)
!53 = !DILocation(line: 40, column: 9, scope: !42)
!54 = !DILocation(line: 42, column: 1, scope: !18)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_16_good", scope: !19, file: !19, line: 70, type: !20, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!56 = !DILocation(line: 72, column: 5, scope: !55)
!57 = !DILocation(line: 73, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 85, type: !59, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!59 = !DISubroutineType(types: !60)
!60 = !{!8, !8, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !19, line: 85, type: !8)
!65 = !DILocation(line: 85, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !19, line: 85, type: !61)
!67 = !DILocation(line: 85, column: 27, scope: !58)
!68 = !DILocation(line: 88, column: 22, scope: !58)
!69 = !DILocation(line: 88, column: 12, scope: !58)
!70 = !DILocation(line: 88, column: 5, scope: !58)
!71 = !DILocation(line: 90, column: 5, scope: !58)
!72 = !DILocation(line: 91, column: 5, scope: !58)
!73 = !DILocation(line: 92, column: 5, scope: !58)
!74 = !DILocation(line: 95, column: 5, scope: !58)
!75 = !DILocation(line: 96, column: 5, scope: !58)
!76 = !DILocation(line: 97, column: 5, scope: !58)
!77 = !DILocation(line: 99, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 49, type: !20, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!79 = !DILocalVariable(name: "data", scope: !78, file: !19, line: 51, type: !3)
!80 = !DILocation(line: 51, column: 15, scope: !78)
!81 = !DILocation(line: 52, column: 23, scope: !78)
!82 = !DILocation(line: 52, column: 12, scope: !78)
!83 = !DILocation(line: 52, column: 10, scope: !78)
!84 = !DILocation(line: 53, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !19, line: 53, column: 9)
!86 = !DILocation(line: 53, column: 14, scope: !85)
!87 = !DILocation(line: 53, column: 9, scope: !78)
!88 = !DILocation(line: 53, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !19, line: 53, column: 23)
!90 = !DILocation(line: 54, column: 5, scope: !78)
!91 = !DILocation(line: 57, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !78, file: !19, line: 55, column: 5)
!93 = !DILocation(line: 57, column: 9, scope: !92)
!94 = !DILocation(line: 58, column: 9, scope: !92)
!95 = !DILocation(line: 58, column: 20, scope: !92)
!96 = !DILocation(line: 59, column: 9, scope: !92)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !19, line: 62, type: !43)
!98 = distinct !DILexicalBlock(scope: !78, file: !19, line: 61, column: 5)
!99 = !DILocation(line: 62, column: 17, scope: !98)
!100 = !DILocation(line: 64, column: 16, scope: !98)
!101 = !DILocation(line: 64, column: 22, scope: !98)
!102 = !DILocation(line: 64, column: 9, scope: !98)
!103 = !DILocation(line: 65, column: 20, scope: !98)
!104 = !DILocation(line: 65, column: 9, scope: !98)
!105 = !DILocation(line: 66, column: 14, scope: !98)
!106 = !DILocation(line: 66, column: 9, scope: !98)
!107 = !DILocation(line: 68, column: 1, scope: !78)
