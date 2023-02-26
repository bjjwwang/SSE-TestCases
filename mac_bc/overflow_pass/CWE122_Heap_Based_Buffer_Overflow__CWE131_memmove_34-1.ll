; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %call = call i8* @malloc(i64 noundef 10) #7, !dbg !29
  %0 = bitcast i8* %call to i32*, !dbg !30
  store i32* %0, i32** %data, align 8, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion to i32**, !dbg !39
  store i32* %2, i32** %unionFirst, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion to i32**, !dbg !44
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !44
  store i32* %3, i32** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !50
  %5 = load i32*, i32** %data1, align 8, !dbg !51
  %6 = bitcast i32* %5 to i8*, !dbg !51
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !51
  %7 = bitcast i32* %arraydecay to i8*, !dbg !51
  %8 = load i32*, i32** %data1, align 8, !dbg !51
  %9 = bitcast i32* %8 to i8*, !dbg !51
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !51
  %call2 = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %7, i64 noundef 40, i64 noundef %10) #9, !dbg !51
  %11 = load i32*, i32** %data1, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 0, !dbg !52
  %12 = load i32, i32* %arrayidx, align 4, !dbg !52
  call void @printIntLine(i32 noundef %12), !dbg !53
  %13 = load i32*, i32** %data1, align 8, !dbg !54
  %14 = bitcast i32* %13 to i8*, !dbg !54
  call void @free(i8* noundef %14), !dbg !55
  ret void, !dbg !56
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

declare void @printIntLine(i32 noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !60 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_good(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_bad(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %call = call i8* @malloc(i64 noundef 40) #7, !dbg !86
  %0 = bitcast i8* %call to i32*, !dbg !87
  store i32* %0, i32** %data, align 8, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %cmp = icmp eq i32* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !95
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion to i32**, !dbg !96
  store i32* %2, i32** %unionFirst, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !98, metadata !DIExpression()), !dbg !100
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType* %myUnion to i32**, !dbg !101
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !101
  store i32* %3, i32** %data1, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !104
  %5 = load i32*, i32** %data1, align 8, !dbg !105
  %6 = bitcast i32* %5 to i8*, !dbg !105
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !105
  %7 = bitcast i32* %arraydecay to i8*, !dbg !105
  %8 = load i32*, i32** %data1, align 8, !dbg !105
  %9 = bitcast i32* %8 to i8*, !dbg !105
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !105
  %call2 = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %7, i64 noundef 40, i64 noundef %10) #9, !dbg !105
  %11 = load i32*, i32** %data1, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 0, !dbg !106
  %12 = load i32, i32* %arrayidx, align 4, !dbg !106
  call void @printIntLine(i32 noundef %12), !dbg !107
  %13 = load i32*, i32** %data1, align 8, !dbg !108
  %14 = bitcast i32* %13 to i8*, !dbg !108
  call void @free(i8* noundef %14), !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_bad", scope: !15, file: !15, line: 27, type: !16, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 29, type: !3)
!20 = !DILocation(line: 29, column: 11, scope: !14)
!21 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 30, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_unionType", file: !15, line: 23, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 19, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !15, line: 21, baseType: !3, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !15, line: 22, baseType: !3, size: 64)
!27 = !DILocation(line: 30, column: 68, scope: !14)
!28 = !DILocation(line: 31, column: 10, scope: !14)
!29 = !DILocation(line: 33, column: 19, scope: !14)
!30 = !DILocation(line: 33, column: 12, scope: !14)
!31 = !DILocation(line: 33, column: 10, scope: !14)
!32 = !DILocation(line: 34, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!34 = !DILocation(line: 34, column: 14, scope: !33)
!35 = !DILocation(line: 34, column: 9, scope: !14)
!36 = !DILocation(line: 34, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !15, line: 34, column: 23)
!38 = !DILocation(line: 35, column: 26, scope: !14)
!39 = !DILocation(line: 35, column: 13, scope: !14)
!40 = !DILocation(line: 35, column: 24, scope: !14)
!41 = !DILocalVariable(name: "data", scope: !42, file: !15, line: 37, type: !3)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 5)
!43 = !DILocation(line: 37, column: 15, scope: !42)
!44 = !DILocation(line: 37, column: 30, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !15, line: 39, type: !47)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 38, column: 9)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 10)
!50 = !DILocation(line: 39, column: 17, scope: !46)
!51 = !DILocation(line: 41, column: 13, scope: !46)
!52 = !DILocation(line: 42, column: 26, scope: !46)
!53 = !DILocation(line: 42, column: 13, scope: !46)
!54 = !DILocation(line: 43, column: 18, scope: !46)
!55 = !DILocation(line: 43, column: 13, scope: !46)
!56 = !DILocation(line: 46, column: 1, scope: !14)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_34_good", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!58 = !DILocation(line: 76, column: 5, scope: !57)
!59 = !DILocation(line: 77, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 88, type: !61, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!61 = !DISubroutineType(types: !62)
!62 = !{!4, !4, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 88, type: !4)
!67 = !DILocation(line: 88, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 88, type: !63)
!69 = !DILocation(line: 88, column: 27, scope: !60)
!70 = !DILocation(line: 91, column: 22, scope: !60)
!71 = !DILocation(line: 91, column: 12, scope: !60)
!72 = !DILocation(line: 91, column: 5, scope: !60)
!73 = !DILocation(line: 93, column: 5, scope: !60)
!74 = !DILocation(line: 94, column: 5, scope: !60)
!75 = !DILocation(line: 95, column: 5, scope: !60)
!76 = !DILocation(line: 98, column: 5, scope: !60)
!77 = !DILocation(line: 99, column: 5, scope: !60)
!78 = !DILocation(line: 100, column: 5, scope: !60)
!79 = !DILocation(line: 102, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 53, type: !16, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 55, type: !3)
!82 = !DILocation(line: 55, column: 11, scope: !80)
!83 = !DILocalVariable(name: "myUnion", scope: !80, file: !15, line: 56, type: !22)
!84 = !DILocation(line: 56, column: 68, scope: !80)
!85 = !DILocation(line: 57, column: 10, scope: !80)
!86 = !DILocation(line: 59, column: 19, scope: !80)
!87 = !DILocation(line: 59, column: 12, scope: !80)
!88 = !DILocation(line: 59, column: 10, scope: !80)
!89 = !DILocation(line: 60, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !15, line: 60, column: 9)
!91 = !DILocation(line: 60, column: 14, scope: !90)
!92 = !DILocation(line: 60, column: 9, scope: !80)
!93 = !DILocation(line: 60, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 60, column: 23)
!95 = !DILocation(line: 61, column: 26, scope: !80)
!96 = !DILocation(line: 61, column: 13, scope: !80)
!97 = !DILocation(line: 61, column: 24, scope: !80)
!98 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 63, type: !3)
!99 = distinct !DILexicalBlock(scope: !80, file: !15, line: 62, column: 5)
!100 = !DILocation(line: 63, column: 15, scope: !99)
!101 = !DILocation(line: 63, column: 30, scope: !99)
!102 = !DILocalVariable(name: "source", scope: !103, file: !15, line: 65, type: !47)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 64, column: 9)
!104 = !DILocation(line: 65, column: 17, scope: !103)
!105 = !DILocation(line: 67, column: 13, scope: !103)
!106 = !DILocation(line: 68, column: 26, scope: !103)
!107 = !DILocation(line: 68, column: 13, scope: !103)
!108 = !DILocation(line: 69, column: 18, scope: !103)
!109 = !DILocation(line: 69, column: 13, scope: !103)
!110 = !DILocation(line: 72, column: 1, scope: !80)
