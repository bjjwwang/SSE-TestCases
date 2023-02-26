; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  store i32* %arraydecay, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  store i32* %0, i32** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !38
  store i32* %1, i32** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !53
  %cmp = icmp ult i64 %3, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !59
  %5 = load i32, i32* %arrayidx, align 4, !dbg !59
  %6 = load i32*, i32** %data1, align 8, !dbg !60
  %7 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !60
  store i32 %5, i32* %arrayidx2, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %8, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data1, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !69
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !69
  call void @printIntLine(i32 noundef %10), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* noundef null), !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 noundef %conv), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_good(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_bad(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !102
  store i32* %arraydecay, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !104, metadata !DIExpression()), !dbg !106
  %0 = load i32*, i32** %data, align 8, !dbg !107
  store i32* %0, i32** %dataCopy, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !108, metadata !DIExpression()), !dbg !109
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !110
  store i32* %1, i32** %data1, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !120
  %cmp = icmp ult i64 %3, 100, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !126
  %5 = load i32, i32* %arrayidx, align 4, !dbg !126
  %6 = load i32*, i32** %data1, align 8, !dbg !127
  %7 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !127
  store i32 %5, i32* %arrayidx2, align 4, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %8, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data1, align 8, !dbg !135
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !135
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !135
  call void @printIntLine(i32 noundef %10), !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 23, column: 11, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 24, column: 9, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 25, column: 9, scope: !11)
!30 = !DILocation(line: 28, column: 12, scope: !11)
!31 = !DILocation(line: 28, column: 10, scope: !11)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !12, line: 30, type: !17)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!34 = !DILocation(line: 30, column: 15, scope: !33)
!35 = !DILocation(line: 30, column: 26, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !12, line: 31, type: !17)
!37 = !DILocation(line: 31, column: 15, scope: !33)
!38 = !DILocation(line: 31, column: 22, scope: !33)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 33, type: !26)
!40 = distinct !DILexicalBlock(scope: !33, file: !12, line: 32, column: 9)
!41 = !DILocation(line: 33, column: 17, scope: !40)
!42 = !DILocalVariable(name: "i", scope: !43, file: !12, line: 35, type: !44)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 34, column: 13)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !47, line: 94, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 35, column: 24, scope: !43)
!50 = !DILocation(line: 37, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !12, line: 37, column: 17)
!52 = !DILocation(line: 37, column: 22, scope: !51)
!53 = !DILocation(line: 37, column: 29, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !12, line: 37, column: 17)
!55 = !DILocation(line: 37, column: 31, scope: !54)
!56 = !DILocation(line: 37, column: 17, scope: !51)
!57 = !DILocation(line: 39, column: 38, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !12, line: 38, column: 17)
!59 = !DILocation(line: 39, column: 31, scope: !58)
!60 = !DILocation(line: 39, column: 21, scope: !58)
!61 = !DILocation(line: 39, column: 26, scope: !58)
!62 = !DILocation(line: 39, column: 29, scope: !58)
!63 = !DILocation(line: 40, column: 17, scope: !58)
!64 = !DILocation(line: 37, column: 39, scope: !54)
!65 = !DILocation(line: 37, column: 17, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 40, column: 17, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 41, column: 30, scope: !43)
!70 = !DILocation(line: 41, column: 17, scope: !43)
!71 = !DILocation(line: 45, column: 1, scope: !11)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_31_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!73 = !DILocation(line: 79, column: 5, scope: !72)
!74 = !DILocation(line: 80, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !76, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!76 = !DISubroutineType(types: !77)
!77 = !{!18, !18, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 91, type: !18)
!82 = !DILocation(line: 91, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 91, type: !78)
!84 = !DILocation(line: 91, column: 27, scope: !75)
!85 = !DILocation(line: 94, column: 22, scope: !75)
!86 = !DILocation(line: 94, column: 12, scope: !75)
!87 = !DILocation(line: 94, column: 5, scope: !75)
!88 = !DILocation(line: 96, column: 5, scope: !75)
!89 = !DILocation(line: 97, column: 5, scope: !75)
!90 = !DILocation(line: 98, column: 5, scope: !75)
!91 = !DILocation(line: 101, column: 5, scope: !75)
!92 = !DILocation(line: 102, column: 5, scope: !75)
!93 = !DILocation(line: 103, column: 5, scope: !75)
!94 = !DILocation(line: 105, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 54, type: !17)
!97 = !DILocation(line: 54, column: 11, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !12, line: 55, type: !21)
!99 = !DILocation(line: 55, column: 9, scope: !95)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !12, line: 56, type: !26)
!101 = !DILocation(line: 56, column: 9, scope: !95)
!102 = !DILocation(line: 58, column: 12, scope: !95)
!103 = !DILocation(line: 58, column: 10, scope: !95)
!104 = !DILocalVariable(name: "dataCopy", scope: !105, file: !12, line: 60, type: !17)
!105 = distinct !DILexicalBlock(scope: !95, file: !12, line: 59, column: 5)
!106 = !DILocation(line: 60, column: 15, scope: !105)
!107 = !DILocation(line: 60, column: 26, scope: !105)
!108 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 61, type: !17)
!109 = !DILocation(line: 61, column: 15, scope: !105)
!110 = !DILocation(line: 61, column: 22, scope: !105)
!111 = !DILocalVariable(name: "source", scope: !112, file: !12, line: 63, type: !26)
!112 = distinct !DILexicalBlock(scope: !105, file: !12, line: 62, column: 9)
!113 = !DILocation(line: 63, column: 17, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !115, file: !12, line: 65, type: !44)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 64, column: 13)
!116 = !DILocation(line: 65, column: 24, scope: !115)
!117 = !DILocation(line: 67, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 67, column: 17)
!119 = !DILocation(line: 67, column: 22, scope: !118)
!120 = !DILocation(line: 67, column: 29, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 67, column: 17)
!122 = !DILocation(line: 67, column: 31, scope: !121)
!123 = !DILocation(line: 67, column: 17, scope: !118)
!124 = !DILocation(line: 69, column: 38, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 68, column: 17)
!126 = !DILocation(line: 69, column: 31, scope: !125)
!127 = !DILocation(line: 69, column: 21, scope: !125)
!128 = !DILocation(line: 69, column: 26, scope: !125)
!129 = !DILocation(line: 69, column: 29, scope: !125)
!130 = !DILocation(line: 70, column: 17, scope: !125)
!131 = !DILocation(line: 67, column: 39, scope: !121)
!132 = !DILocation(line: 67, column: 17, scope: !121)
!133 = distinct !{!133, !123, !134, !68}
!134 = !DILocation(line: 70, column: 17, scope: !118)
!135 = !DILocation(line: 71, column: 30, scope: !115)
!136 = !DILocation(line: 71, column: 17, scope: !115)
!137 = !DILocation(line: 75, column: 1, scope: !95)
