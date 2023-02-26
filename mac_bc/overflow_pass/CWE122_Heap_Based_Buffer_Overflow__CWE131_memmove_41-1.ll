; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_badSink(i32* noundef %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !26
  %1 = load i32*, i32** %data.addr, align 8, !dbg !27
  %2 = bitcast i32* %1 to i8*, !dbg !27
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !27
  %3 = bitcast i32* %arraydecay to i8*, !dbg !27
  %4 = load i32*, i32** %data.addr, align 8, !dbg !27
  %5 = bitcast i32* %4 to i8*, !dbg !27
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !27
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 40, i64 noundef %6) #7, !dbg !27
  %7 = load i32*, i32** %data.addr, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !28
  %8 = load i32, i32* %arrayidx, align 4, !dbg !28
  call void @printIntLine(i32 noundef %8), !dbg !29
  %9 = load i32*, i32** %data.addr, align 8, !dbg !30
  %10 = bitcast i32* %9 to i8*, !dbg !30
  call void @free(i8* noundef %10), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_bad() #0 !dbg !33 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !36, metadata !DIExpression()), !dbg !37
  store i32* null, i32** %data, align 8, !dbg !38
  %call = call i8* @malloc(i64 noundef 10) #8, !dbg !39
  %0 = bitcast i8* %call to i32*, !dbg !40
  store i32* %0, i32** %data, align 8, !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %cmp = icmp eq i32* %1, null, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !46
  unreachable, !dbg !46

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !48
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_badSink(i32* noundef %2), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #5

; Function Attrs: noreturn
declare void @exit(i32 noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_goodG2BSink(i32* noundef %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !54, metadata !DIExpression()), !dbg !56
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !56
  %1 = load i32*, i32** %data.addr, align 8, !dbg !57
  %2 = bitcast i32* %1 to i8*, !dbg !57
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !57
  %3 = bitcast i32* %arraydecay to i8*, !dbg !57
  %4 = load i32*, i32** %data.addr, align 8, !dbg !57
  %5 = bitcast i32* %4 to i8*, !dbg !57
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !57
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 40, i64 noundef %6) #7, !dbg !57
  %7 = load i32*, i32** %data.addr, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !58
  %8 = load i32, i32* %arrayidx, align 4, !dbg !58
  call void @printIntLine(i32 noundef %8), !dbg !59
  %9 = load i32*, i32** %data.addr, align 8, !dbg !60
  %10 = bitcast i32* %9 to i8*, !dbg !60
  call void @free(i8* noundef %10), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_good() #0 !dbg !63 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* noundef null), !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 noundef %conv), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_good(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_bad(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i32* null, i32** %data, align 8, !dbg !89
  %call = call i8* @malloc(i64 noundef 40) #8, !dbg !90
  %0 = bitcast i8* %call to i32*, !dbg !91
  store i32* %0, i32** %data, align 8, !dbg !92
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %cmp = icmp eq i32* %1, null, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_goodG2BSink(i32* noundef %2), !dbg !100
  ret void, !dbg !101
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { allocsize(0) }
attributes #9 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_badSink", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !3}
!18 = !{}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 21, type: !3)
!20 = !DILocation(line: 21, column: 73, scope: !14)
!21 = !DILocalVariable(name: "source", scope: !22, file: !15, line: 24, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 23, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 10)
!26 = !DILocation(line: 24, column: 13, scope: !22)
!27 = !DILocation(line: 26, column: 9, scope: !22)
!28 = !DILocation(line: 27, column: 22, scope: !22)
!29 = !DILocation(line: 27, column: 9, scope: !22)
!30 = !DILocation(line: 28, column: 14, scope: !22)
!31 = !DILocation(line: 28, column: 9, scope: !22)
!32 = !DILocation(line: 30, column: 1, scope: !14)
!33 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_bad", scope: !15, file: !15, line: 32, type: !34, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !DILocalVariable(name: "data", scope: !33, file: !15, line: 34, type: !3)
!37 = !DILocation(line: 34, column: 11, scope: !33)
!38 = !DILocation(line: 35, column: 10, scope: !33)
!39 = !DILocation(line: 37, column: 19, scope: !33)
!40 = !DILocation(line: 37, column: 12, scope: !33)
!41 = !DILocation(line: 37, column: 10, scope: !33)
!42 = !DILocation(line: 38, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !33, file: !15, line: 38, column: 9)
!44 = !DILocation(line: 38, column: 14, scope: !43)
!45 = !DILocation(line: 38, column: 9, scope: !33)
!46 = !DILocation(line: 38, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 38, column: 23)
!48 = !DILocation(line: 39, column: 66, scope: !33)
!49 = !DILocation(line: 39, column: 5, scope: !33)
!50 = !DILocation(line: 40, column: 1, scope: !33)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_goodG2BSink", scope: !15, file: !15, line: 46, type: !16, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!52 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !15, line: 46, type: !3)
!53 = !DILocation(line: 46, column: 77, scope: !51)
!54 = !DILocalVariable(name: "source", scope: !55, file: !15, line: 49, type: !23)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 48, column: 5)
!56 = !DILocation(line: 49, column: 13, scope: !55)
!57 = !DILocation(line: 51, column: 9, scope: !55)
!58 = !DILocation(line: 52, column: 22, scope: !55)
!59 = !DILocation(line: 52, column: 9, scope: !55)
!60 = !DILocation(line: 53, column: 14, scope: !55)
!61 = !DILocation(line: 53, column: 9, scope: !55)
!62 = !DILocation(line: 55, column: 1, scope: !51)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_41_good", scope: !15, file: !15, line: 68, type: !34, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!64 = !DILocation(line: 70, column: 5, scope: !63)
!65 = !DILocation(line: 71, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 83, type: !67, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!67 = !DISubroutineType(types: !68)
!68 = !{!4, !4, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !15, line: 83, type: !4)
!73 = !DILocation(line: 83, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !15, line: 83, type: !69)
!75 = !DILocation(line: 83, column: 27, scope: !66)
!76 = !DILocation(line: 86, column: 22, scope: !66)
!77 = !DILocation(line: 86, column: 12, scope: !66)
!78 = !DILocation(line: 86, column: 5, scope: !66)
!79 = !DILocation(line: 88, column: 5, scope: !66)
!80 = !DILocation(line: 89, column: 5, scope: !66)
!81 = !DILocation(line: 90, column: 5, scope: !66)
!82 = !DILocation(line: 93, column: 5, scope: !66)
!83 = !DILocation(line: 94, column: 5, scope: !66)
!84 = !DILocation(line: 95, column: 5, scope: !66)
!85 = !DILocation(line: 97, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 58, type: !34, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 60, type: !3)
!88 = !DILocation(line: 60, column: 11, scope: !86)
!89 = !DILocation(line: 61, column: 10, scope: !86)
!90 = !DILocation(line: 63, column: 19, scope: !86)
!91 = !DILocation(line: 63, column: 12, scope: !86)
!92 = !DILocation(line: 63, column: 10, scope: !86)
!93 = !DILocation(line: 64, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !86, file: !15, line: 64, column: 9)
!95 = !DILocation(line: 64, column: 14, scope: !94)
!96 = !DILocation(line: 64, column: 9, scope: !86)
!97 = !DILocation(line: 64, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 64, column: 23)
!99 = !DILocation(line: 65, column: 70, scope: !86)
!100 = !DILocation(line: 65, column: 5, scope: !86)
!101 = !DILocation(line: 66, column: 1, scope: !86)
