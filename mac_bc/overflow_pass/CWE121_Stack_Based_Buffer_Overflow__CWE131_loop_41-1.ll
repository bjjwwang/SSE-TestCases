; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_badSink(i32* noundef %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !36
  %cmp = icmp ult i64 %1, 10, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !40
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %2, !dbg !42
  %3 = load i32, i32* %arrayidx, align 4, !dbg !42
  %4 = load i32*, i32** %data.addr, align 8, !dbg !43
  %5 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !43
  store i32 %3, i32* %arrayidx1, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !47
  %inc = add i64 %6, 1, !dbg !47
  store i64 %inc, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !52
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !52
  call void @printIntLine(i32 noundef %8), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_bad() #0 !dbg !55 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !DIExpression()), !dbg !59
  store i32* null, i32** %data, align 8, !dbg !60
  %0 = alloca i8, i64 10, align 16, !dbg !61
  %1 = bitcast i8* %0 to i32*, !dbg !62
  store i32* %1, i32** %data, align 8, !dbg !63
  %2 = load i32*, i32** %data, align 8, !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_badSink(i32* noundef %2), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_goodG2BSink(i32* noundef %data) #0 !dbg !67 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !70, metadata !DIExpression()), !dbg !72
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !74
  store i64 0, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !78
  %cmp = icmp ult i64 %1, 10, !dbg !80
  br i1 %cmp, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %2, !dbg !84
  %3 = load i32, i32* %arrayidx, align 4, !dbg !84
  %4 = load i32*, i32** %data.addr, align 8, !dbg !85
  %5 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !85
  store i32 %3, i32* %arrayidx1, align 4, !dbg !87
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !89
  %inc = add i64 %6, 1, !dbg !89
  store i64 %inc, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !90, !llvm.loop !91

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data.addr, align 8, !dbg !93
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !93
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !93
  call void @printIntLine(i32 noundef %8), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_good() #0 !dbg !96 {
entry:
  call void @goodG2B(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i64 @time(i64* noundef null), !dbg !109
  %conv = trunc i64 %call to i32, !dbg !110
  call void @srand(i32 noundef %conv), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !112
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_good(), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !115
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_bad(), !dbg !116
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  store i32* null, i32** %data, align 8, !dbg !122
  %0 = alloca i8, i64 40, align 16, !dbg !123
  %1 = bitcast i8* %0 to i32*, !dbg !124
  store i32* %1, i32** %data, align 8, !dbg !125
  %2 = load i32*, i32** %data, align 8, !dbg !126
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_goodG2BSink(i32* noundef %2), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_badSink", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !3}
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 21, type: !3)
!19 = !DILocation(line: 21, column: 71, scope: !13)
!20 = !DILocalVariable(name: "source", scope: !21, file: !14, line: 24, type: !22)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 23, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 24, column: 13, scope: !21)
!26 = !DILocalVariable(name: "i", scope: !21, file: !14, line: 25, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !28, line: 31, baseType: !29)
!28 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !30, line: 94, baseType: !31)
!30 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!31 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 25, column: 16, scope: !21)
!33 = !DILocation(line: 27, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !21, file: !14, line: 27, column: 9)
!35 = !DILocation(line: 27, column: 14, scope: !34)
!36 = !DILocation(line: 27, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !14, line: 27, column: 9)
!38 = !DILocation(line: 27, column: 23, scope: !37)
!39 = !DILocation(line: 27, column: 9, scope: !34)
!40 = !DILocation(line: 29, column: 30, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 28, column: 9)
!42 = !DILocation(line: 29, column: 23, scope: !41)
!43 = !DILocation(line: 29, column: 13, scope: !41)
!44 = !DILocation(line: 29, column: 18, scope: !41)
!45 = !DILocation(line: 29, column: 21, scope: !41)
!46 = !DILocation(line: 30, column: 9, scope: !41)
!47 = !DILocation(line: 27, column: 30, scope: !37)
!48 = !DILocation(line: 27, column: 9, scope: !37)
!49 = distinct !{!49, !39, !50, !51}
!50 = !DILocation(line: 30, column: 9, scope: !34)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 31, column: 22, scope: !21)
!53 = !DILocation(line: 31, column: 9, scope: !21)
!54 = !DILocation(line: 33, column: 1, scope: !13)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_bad", scope: !14, file: !14, line: 35, type: !56, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!56 = !DISubroutineType(types: !57)
!57 = !{null}
!58 = !DILocalVariable(name: "data", scope: !55, file: !14, line: 37, type: !3)
!59 = !DILocation(line: 37, column: 11, scope: !55)
!60 = !DILocation(line: 38, column: 10, scope: !55)
!61 = !DILocation(line: 40, column: 19, scope: !55)
!62 = !DILocation(line: 40, column: 12, scope: !55)
!63 = !DILocation(line: 40, column: 10, scope: !55)
!64 = !DILocation(line: 41, column: 64, scope: !55)
!65 = !DILocation(line: 41, column: 5, scope: !55)
!66 = !DILocation(line: 42, column: 1, scope: !55)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_goodG2BSink", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!68 = !DILocalVariable(name: "data", arg: 1, scope: !67, file: !14, line: 48, type: !3)
!69 = !DILocation(line: 48, column: 75, scope: !67)
!70 = !DILocalVariable(name: "source", scope: !71, file: !14, line: 51, type: !22)
!71 = distinct !DILexicalBlock(scope: !67, file: !14, line: 50, column: 5)
!72 = !DILocation(line: 51, column: 13, scope: !71)
!73 = !DILocalVariable(name: "i", scope: !71, file: !14, line: 52, type: !27)
!74 = !DILocation(line: 52, column: 16, scope: !71)
!75 = !DILocation(line: 54, column: 16, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !14, line: 54, column: 9)
!77 = !DILocation(line: 54, column: 14, scope: !76)
!78 = !DILocation(line: 54, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !14, line: 54, column: 9)
!80 = !DILocation(line: 54, column: 23, scope: !79)
!81 = !DILocation(line: 54, column: 9, scope: !76)
!82 = !DILocation(line: 56, column: 30, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !14, line: 55, column: 9)
!84 = !DILocation(line: 56, column: 23, scope: !83)
!85 = !DILocation(line: 56, column: 13, scope: !83)
!86 = !DILocation(line: 56, column: 18, scope: !83)
!87 = !DILocation(line: 56, column: 21, scope: !83)
!88 = !DILocation(line: 57, column: 9, scope: !83)
!89 = !DILocation(line: 54, column: 30, scope: !79)
!90 = !DILocation(line: 54, column: 9, scope: !79)
!91 = distinct !{!91, !81, !92, !51}
!92 = !DILocation(line: 57, column: 9, scope: !76)
!93 = !DILocation(line: 58, column: 22, scope: !71)
!94 = !DILocation(line: 58, column: 9, scope: !71)
!95 = !DILocation(line: 60, column: 1, scope: !67)
!96 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_41_good", scope: !14, file: !14, line: 72, type: !56, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!97 = !DILocation(line: 74, column: 5, scope: !96)
!98 = !DILocation(line: 75, column: 1, scope: !96)
!99 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 87, type: !100, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!100 = !DISubroutineType(types: !101)
!101 = !{!4, !4, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !14, line: 87, type: !4)
!106 = !DILocation(line: 87, column: 14, scope: !99)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !14, line: 87, type: !102)
!108 = !DILocation(line: 87, column: 27, scope: !99)
!109 = !DILocation(line: 90, column: 22, scope: !99)
!110 = !DILocation(line: 90, column: 12, scope: !99)
!111 = !DILocation(line: 90, column: 5, scope: !99)
!112 = !DILocation(line: 92, column: 5, scope: !99)
!113 = !DILocation(line: 93, column: 5, scope: !99)
!114 = !DILocation(line: 94, column: 5, scope: !99)
!115 = !DILocation(line: 97, column: 5, scope: !99)
!116 = !DILocation(line: 98, column: 5, scope: !99)
!117 = !DILocation(line: 99, column: 5, scope: !99)
!118 = !DILocation(line: 101, column: 5, scope: !99)
!119 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 63, type: !56, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!120 = !DILocalVariable(name: "data", scope: !119, file: !14, line: 65, type: !3)
!121 = !DILocation(line: 65, column: 11, scope: !119)
!122 = !DILocation(line: 66, column: 10, scope: !119)
!123 = !DILocation(line: 68, column: 19, scope: !119)
!124 = !DILocation(line: 68, column: 12, scope: !119)
!125 = !DILocation(line: 68, column: 10, scope: !119)
!126 = !DILocation(line: 69, column: 68, scope: !119)
!127 = !DILocation(line: 69, column: 5, scope: !119)
!128 = !DILocation(line: 70, column: 1, scope: !119)
