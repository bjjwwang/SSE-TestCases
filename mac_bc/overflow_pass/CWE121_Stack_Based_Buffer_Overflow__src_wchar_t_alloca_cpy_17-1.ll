; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_17_bad() #0 !dbg !17 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !35
  %cmp = icmp slt i32 %3, 1, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data, align 8, !dbg !39
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 99), !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %6, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !55
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !56
  %8 = load i32*, i32** %data, align 8, !dbg !57
  %call1 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %8), !dbg !58
  %9 = load i32*, i32** %data, align 8, !dbg !59
  call void @printWLine(i32* noundef %9), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32* @wcscpy(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_17_good() #0 !dbg !62 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_17_good(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_17_bad(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 400, align 16, !dbg !92
  %1 = bitcast i8* %0 to i32*, !dbg !93
  store i32* %1, i32** %dataBuffer, align 8, !dbg !91
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  store i32* %2, i32** %data, align 8, !dbg !95
  store i32 0, i32* %h, align 4, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %h, align 4, !dbg !99
  %cmp = icmp slt i32 %3, 1, !dbg !101
  br i1 %cmp, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !105
  %5 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !109
  %inc = add nsw i32 %6, 1, !dbg !109
  store i32 %inc, i32* %h, align 4, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !115
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !116
  %8 = load i32*, i32** %data, align 8, !dbg !117
  %call1 = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %8), !dbg !118
  %9 = load i32*, i32** %data, align 8, !dbg !119
  call void @printWLine(i32* noundef %9), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_17_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "i", scope: !17, file: !18, line: 25, type: !8)
!23 = !DILocation(line: 25, column: 9, scope: !17)
!24 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocalVariable(name: "dataBuffer", scope: !17, file: !18, line: 27, type: !3)
!27 = !DILocation(line: 27, column: 15, scope: !17)
!28 = !DILocation(line: 27, column: 39, scope: !17)
!29 = !DILocation(line: 27, column: 28, scope: !17)
!30 = !DILocation(line: 28, column: 12, scope: !17)
!31 = !DILocation(line: 28, column: 10, scope: !17)
!32 = !DILocation(line: 29, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 29, column: 5)
!34 = !DILocation(line: 29, column: 9, scope: !33)
!35 = !DILocation(line: 29, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !18, line: 29, column: 5)
!37 = !DILocation(line: 29, column: 18, scope: !36)
!38 = !DILocation(line: 29, column: 5, scope: !33)
!39 = !DILocation(line: 32, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !18, line: 30, column: 5)
!41 = !DILocation(line: 32, column: 9, scope: !40)
!42 = !DILocation(line: 33, column: 9, scope: !40)
!43 = !DILocation(line: 33, column: 21, scope: !40)
!44 = !DILocation(line: 34, column: 5, scope: !40)
!45 = !DILocation(line: 29, column: 24, scope: !36)
!46 = !DILocation(line: 29, column: 5, scope: !36)
!47 = distinct !{!47, !38, !48, !49}
!48 = !DILocation(line: 34, column: 5, scope: !33)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocalVariable(name: "dest", scope: !51, file: !18, line: 36, type: !52)
!51 = distinct !DILexicalBlock(scope: !17, file: !18, line: 35, column: 5)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 50)
!55 = !DILocation(line: 36, column: 17, scope: !51)
!56 = !DILocation(line: 38, column: 16, scope: !51)
!57 = !DILocation(line: 38, column: 22, scope: !51)
!58 = !DILocation(line: 38, column: 9, scope: !51)
!59 = !DILocation(line: 39, column: 20, scope: !51)
!60 = !DILocation(line: 39, column: 9, scope: !51)
!61 = !DILocation(line: 41, column: 1, scope: !17)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_17_good", scope: !18, file: !18, line: 68, type: !19, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!63 = !DILocation(line: 70, column: 5, scope: !62)
!64 = !DILocation(line: 71, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 83, type: !66, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!66 = !DISubroutineType(types: !67)
!67 = !{!8, !8, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !18, line: 83, type: !8)
!72 = !DILocation(line: 83, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !18, line: 83, type: !68)
!74 = !DILocation(line: 83, column: 27, scope: !65)
!75 = !DILocation(line: 86, column: 22, scope: !65)
!76 = !DILocation(line: 86, column: 12, scope: !65)
!77 = !DILocation(line: 86, column: 5, scope: !65)
!78 = !DILocation(line: 88, column: 5, scope: !65)
!79 = !DILocation(line: 89, column: 5, scope: !65)
!80 = !DILocation(line: 90, column: 5, scope: !65)
!81 = !DILocation(line: 93, column: 5, scope: !65)
!82 = !DILocation(line: 94, column: 5, scope: !65)
!83 = !DILocation(line: 95, column: 5, scope: !65)
!84 = !DILocation(line: 97, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 48, type: !19, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!86 = !DILocalVariable(name: "h", scope: !85, file: !18, line: 50, type: !8)
!87 = !DILocation(line: 50, column: 9, scope: !85)
!88 = !DILocalVariable(name: "data", scope: !85, file: !18, line: 51, type: !3)
!89 = !DILocation(line: 51, column: 15, scope: !85)
!90 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !18, line: 52, type: !3)
!91 = !DILocation(line: 52, column: 15, scope: !85)
!92 = !DILocation(line: 52, column: 39, scope: !85)
!93 = !DILocation(line: 52, column: 28, scope: !85)
!94 = !DILocation(line: 53, column: 12, scope: !85)
!95 = !DILocation(line: 53, column: 10, scope: !85)
!96 = !DILocation(line: 54, column: 11, scope: !97)
!97 = distinct !DILexicalBlock(scope: !85, file: !18, line: 54, column: 5)
!98 = !DILocation(line: 54, column: 9, scope: !97)
!99 = !DILocation(line: 54, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !18, line: 54, column: 5)
!101 = !DILocation(line: 54, column: 18, scope: !100)
!102 = !DILocation(line: 54, column: 5, scope: !97)
!103 = !DILocation(line: 57, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !18, line: 55, column: 5)
!105 = !DILocation(line: 57, column: 9, scope: !104)
!106 = !DILocation(line: 58, column: 9, scope: !104)
!107 = !DILocation(line: 58, column: 20, scope: !104)
!108 = !DILocation(line: 59, column: 5, scope: !104)
!109 = !DILocation(line: 54, column: 24, scope: !100)
!110 = !DILocation(line: 54, column: 5, scope: !100)
!111 = distinct !{!111, !102, !112, !49}
!112 = !DILocation(line: 59, column: 5, scope: !97)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !18, line: 61, type: !52)
!114 = distinct !DILexicalBlock(scope: !85, file: !18, line: 60, column: 5)
!115 = !DILocation(line: 61, column: 17, scope: !114)
!116 = !DILocation(line: 63, column: 16, scope: !114)
!117 = !DILocation(line: 63, column: 22, scope: !114)
!118 = !DILocation(line: 63, column: 9, scope: !114)
!119 = !DILocation(line: 64, column: 20, scope: !114)
!120 = !DILocation(line: 64, column: 9, scope: !114)
!121 = !DILocation(line: 66, column: 1, scope: !85)
