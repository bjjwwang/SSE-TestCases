; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 10) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !26
  %1 = load i32*, i32** %data, align 8, !dbg !27
  %cmp = icmp eq i32* %1, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %4 = bitcast i32* %3 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !39
  %5 = bitcast i32* %arraydecay to i8*, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %7 = bitcast i32* %6 to i8*, !dbg !39
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !39
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 40, i64 noundef %8) #9, !dbg !39
  %9 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !40
  %10 = load i32, i32* %arrayidx, align 4, !dbg !40
  call void @printIntLine(i32 noundef %10), !dbg !41
  %11 = load i32*, i32** %data, align 8, !dbg !42
  %12 = bitcast i32* %11 to i8*, !dbg !42
  call void @free(i8* noundef %12), !dbg !43
  ret void, !dbg !44
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32* null, i32** %data, align 8, !dbg !72
  %call = call i8* @malloc(i64 noundef 40) #7, !dbg !73
  %0 = bitcast i8* %call to i32*, !dbg !76
  store i32* %0, i32** %data, align 8, !dbg !77
  %1 = load i32*, i32** %data, align 8, !dbg !78
  %cmp = icmp eq i32* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !86
  %3 = load i32*, i32** %data, align 8, !dbg !87
  %4 = bitcast i32* %3 to i8*, !dbg !87
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !87
  %5 = bitcast i32* %arraydecay to i8*, !dbg !87
  %6 = load i32*, i32** %data, align 8, !dbg !87
  %7 = bitcast i32* %6 to i8*, !dbg !87
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !87
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 40, i64 noundef %8) #9, !dbg !87
  %9 = load i32*, i32** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !88
  %10 = load i32, i32* %arrayidx, align 4, !dbg !88
  call void @printIntLine(i32 noundef %10), !dbg !89
  %11 = load i32*, i32** %data, align 8, !dbg !90
  %12 = bitcast i32* %11 to i8*, !dbg !90
  call void @free(i8* noundef %12), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i32* null, i32** %data, align 8, !dbg !96
  %call = call i8* @malloc(i64 noundef 40) #7, !dbg !97
  %0 = bitcast i8* %call to i32*, !dbg !100
  store i32* %0, i32** %data, align 8, !dbg !101
  %1 = load i32*, i32** %data, align 8, !dbg !102
  %cmp = icmp eq i32* %1, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !110
  %3 = load i32*, i32** %data, align 8, !dbg !111
  %4 = bitcast i32* %3 to i8*, !dbg !111
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !111
  %5 = bitcast i32* %arraydecay to i8*, !dbg !111
  %6 = load i32*, i32** %data, align 8, !dbg !111
  %7 = bitcast i32* %6 to i8*, !dbg !111
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !111
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 40, i64 noundef %8) #9, !dbg !111
  %9 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !112
  %10 = load i32, i32* %arrayidx, align 4, !dbg !112
  call void @printIntLine(i32 noundef %10), !dbg !113
  %11 = load i32*, i32** %data, align 8, !dbg !114
  %12 = bitcast i32* %11 to i8*, !dbg !114
  call void @free(i8* noundef %12), !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 11, scope: !14)
!21 = !DILocation(line: 24, column: 10, scope: !14)
!22 = !DILocation(line: 28, column: 23, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 26, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 8)
!25 = !DILocation(line: 28, column: 16, scope: !23)
!26 = !DILocation(line: 28, column: 14, scope: !23)
!27 = !DILocation(line: 29, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !15, line: 29, column: 13)
!29 = !DILocation(line: 29, column: 18, scope: !28)
!30 = !DILocation(line: 29, column: 13, scope: !23)
!31 = !DILocation(line: 29, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 29, column: 27)
!33 = !DILocalVariable(name: "source", scope: !34, file: !15, line: 32, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 10)
!38 = !DILocation(line: 32, column: 13, scope: !34)
!39 = !DILocation(line: 34, column: 9, scope: !34)
!40 = !DILocation(line: 35, column: 22, scope: !34)
!41 = !DILocation(line: 35, column: 9, scope: !34)
!42 = !DILocation(line: 36, column: 14, scope: !34)
!43 = !DILocation(line: 36, column: 9, scope: !34)
!44 = !DILocation(line: 38, column: 1, scope: !14)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_02_good", scope: !15, file: !15, line: 89, type: !16, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!46 = !DILocation(line: 91, column: 5, scope: !45)
!47 = !DILocation(line: 92, column: 5, scope: !45)
!48 = !DILocation(line: 93, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 105, type: !50, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!50 = !DISubroutineType(types: !51)
!51 = !{!4, !4, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !15, line: 105, type: !4)
!56 = !DILocation(line: 105, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !15, line: 105, type: !52)
!58 = !DILocation(line: 105, column: 27, scope: !49)
!59 = !DILocation(line: 108, column: 22, scope: !49)
!60 = !DILocation(line: 108, column: 12, scope: !49)
!61 = !DILocation(line: 108, column: 5, scope: !49)
!62 = !DILocation(line: 110, column: 5, scope: !49)
!63 = !DILocation(line: 111, column: 5, scope: !49)
!64 = !DILocation(line: 112, column: 5, scope: !49)
!65 = !DILocation(line: 115, column: 5, scope: !49)
!66 = !DILocation(line: 116, column: 5, scope: !49)
!67 = !DILocation(line: 117, column: 5, scope: !49)
!68 = !DILocation(line: 119, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 45, type: !16, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!70 = !DILocalVariable(name: "data", scope: !69, file: !15, line: 47, type: !3)
!71 = !DILocation(line: 47, column: 11, scope: !69)
!72 = !DILocation(line: 48, column: 10, scope: !69)
!73 = !DILocation(line: 57, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !15, line: 55, column: 5)
!75 = distinct !DILexicalBlock(scope: !69, file: !15, line: 49, column: 8)
!76 = !DILocation(line: 57, column: 16, scope: !74)
!77 = !DILocation(line: 57, column: 14, scope: !74)
!78 = !DILocation(line: 58, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !15, line: 58, column: 13)
!80 = !DILocation(line: 58, column: 18, scope: !79)
!81 = !DILocation(line: 58, column: 13, scope: !74)
!82 = !DILocation(line: 58, column: 28, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 58, column: 27)
!84 = !DILocalVariable(name: "source", scope: !85, file: !15, line: 61, type: !35)
!85 = distinct !DILexicalBlock(scope: !69, file: !15, line: 60, column: 5)
!86 = !DILocation(line: 61, column: 13, scope: !85)
!87 = !DILocation(line: 63, column: 9, scope: !85)
!88 = !DILocation(line: 64, column: 22, scope: !85)
!89 = !DILocation(line: 64, column: 9, scope: !85)
!90 = !DILocation(line: 65, column: 14, scope: !85)
!91 = !DILocation(line: 65, column: 9, scope: !85)
!92 = !DILocation(line: 67, column: 1, scope: !69)
!93 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!94 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 72, type: !3)
!95 = !DILocation(line: 72, column: 11, scope: !93)
!96 = !DILocation(line: 73, column: 10, scope: !93)
!97 = !DILocation(line: 77, column: 23, scope: !98)
!98 = distinct !DILexicalBlock(scope: !99, file: !15, line: 75, column: 5)
!99 = distinct !DILexicalBlock(scope: !93, file: !15, line: 74, column: 8)
!100 = !DILocation(line: 77, column: 16, scope: !98)
!101 = !DILocation(line: 77, column: 14, scope: !98)
!102 = !DILocation(line: 78, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !15, line: 78, column: 13)
!104 = !DILocation(line: 78, column: 18, scope: !103)
!105 = !DILocation(line: 78, column: 13, scope: !98)
!106 = !DILocation(line: 78, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 78, column: 27)
!108 = !DILocalVariable(name: "source", scope: !109, file: !15, line: 81, type: !35)
!109 = distinct !DILexicalBlock(scope: !93, file: !15, line: 80, column: 5)
!110 = !DILocation(line: 81, column: 13, scope: !109)
!111 = !DILocation(line: 83, column: 9, scope: !109)
!112 = !DILocation(line: 84, column: 22, scope: !109)
!113 = !DILocation(line: 84, column: 9, scope: !109)
!114 = !DILocation(line: 85, column: 14, scope: !109)
!115 = !DILocation(line: 85, column: 9, scope: !109)
!116 = !DILocation(line: 87, column: 1, scope: !93)
