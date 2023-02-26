; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %0, i8** %dataBuffer, align 8, !dbg !26
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  store i8* %1, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !33
  %3 = load i8*, i8** %2, align 8, !dbg !34
  store i8* %3, i8** %data1, align 8, !dbg !32
  %4 = load i8*, i8** %data1, align 8, !dbg !35
  %5 = load i8*, i8** %data1, align 8, !dbg !35
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !35
  %call = call i8* @__memset_chk(i8* noundef %4, i32 noundef 65, i64 noundef 99, i64 noundef %6) #5, !dbg !35
  %7 = load i8*, i8** %data1, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %8 = load i8*, i8** %data1, align 8, !dbg !38
  %9 = load i8**, i8*** %dataPtr1, align 8, !dbg !39
  store i8* %8, i8** %9, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !41, metadata !DIExpression()), !dbg !43
  %10 = load i8**, i8*** %dataPtr2, align 8, !dbg !44
  %11 = load i8*, i8** %10, align 8, !dbg !45
  store i8* %11, i8** %data2, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %12 = bitcast [50 x i8]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 50, i1 false), !dbg !51
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !52
  %13 = load i8*, i8** %data2, align 8, !dbg !52
  %14 = load i8*, i8** %data2, align 8, !dbg !52
  %call3 = call i64 @strlen(i8* noundef %14), !dbg !52
  %call4 = call i8* @__strncat_chk(i8* noundef %arraydecay, i8* noundef %13, i64 noundef %call3, i64 noundef 50) #5, !dbg !52
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !53
  store i8 0, i8* %arrayidx5, align 1, !dbg !54
  %15 = load i8*, i8** %data2, align 8, !dbg !55
  call void @printLine(i8* noundef %15), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_32_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_32_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_32_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 100, align 16, !dbg !88
  store i8* %0, i8** %dataBuffer, align 8, !dbg !87
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !89
  store i8* %1, i8** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !91, metadata !DIExpression()), !dbg !93
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !94
  %3 = load i8*, i8** %2, align 8, !dbg !95
  store i8* %3, i8** %data1, align 8, !dbg !93
  %4 = load i8*, i8** %data1, align 8, !dbg !96
  %5 = load i8*, i8** %data1, align 8, !dbg !96
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !96
  %call = call i8* @__memset_chk(i8* noundef %4, i32 noundef 65, i64 noundef 49, i64 noundef %6) #5, !dbg !96
  %7 = load i8*, i8** %data1, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 49, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %8 = load i8*, i8** %data1, align 8, !dbg !99
  %9 = load i8**, i8*** %dataPtr1, align 8, !dbg !100
  store i8* %8, i8** %9, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !102, metadata !DIExpression()), !dbg !104
  %10 = load i8**, i8*** %dataPtr2, align 8, !dbg !105
  %11 = load i8*, i8** %10, align 8, !dbg !106
  store i8* %11, i8** %data2, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %12 = bitcast [50 x i8]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 50, i1 false), !dbg !109
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !110
  %13 = load i8*, i8** %data2, align 8, !dbg !110
  %14 = load i8*, i8** %data2, align 8, !dbg !110
  %call3 = call i64 @strlen(i8* noundef %14), !dbg !110
  %call4 = call i8* @__strncat_chk(i8* noundef %arraydecay, i8* noundef %13, i64 noundef %call3, i64 noundef 50) #5, !dbg !110
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !111
  store i8 0, i8* %arrayidx5, align 1, !dbg !112
  %15 = load i8*, i8** %data2, align 8, !dbg !113
  call void @printLine(i8* noundef %15), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !13)
!23 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !13)
!25 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 28, type: !3)
!26 = !DILocation(line: 28, column: 12, scope: !13)
!27 = !DILocation(line: 28, column: 33, scope: !13)
!28 = !DILocation(line: 29, column: 12, scope: !13)
!29 = !DILocation(line: 29, column: 10, scope: !13)
!30 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 31, type: !3)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!32 = !DILocation(line: 31, column: 16, scope: !31)
!33 = !DILocation(line: 31, column: 24, scope: !31)
!34 = !DILocation(line: 31, column: 23, scope: !31)
!35 = !DILocation(line: 33, column: 9, scope: !31)
!36 = !DILocation(line: 34, column: 9, scope: !31)
!37 = !DILocation(line: 34, column: 21, scope: !31)
!38 = !DILocation(line: 35, column: 21, scope: !31)
!39 = !DILocation(line: 35, column: 10, scope: !31)
!40 = !DILocation(line: 35, column: 19, scope: !31)
!41 = !DILocalVariable(name: "data", scope: !42, file: !14, line: 38, type: !3)
!42 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!43 = !DILocation(line: 38, column: 16, scope: !42)
!44 = !DILocation(line: 38, column: 24, scope: !42)
!45 = !DILocation(line: 38, column: 23, scope: !42)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !14, line: 40, type: !48)
!47 = distinct !DILexicalBlock(scope: !42, file: !14, line: 39, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 40, column: 18, scope: !47)
!52 = !DILocation(line: 42, column: 13, scope: !47)
!53 = !DILocation(line: 43, column: 13, scope: !47)
!54 = !DILocation(line: 43, column: 24, scope: !47)
!55 = !DILocation(line: 44, column: 23, scope: !47)
!56 = !DILocation(line: 44, column: 13, scope: !47)
!57 = !DILocation(line: 47, column: 1, scope: !13)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_32_good", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!59 = !DILocation(line: 82, column: 5, scope: !58)
!60 = !DILocation(line: 83, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 94, type: !62, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !21}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !14, line: 94, type: !64)
!66 = !DILocation(line: 94, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !14, line: 94, type: !21)
!68 = !DILocation(line: 94, column: 27, scope: !61)
!69 = !DILocation(line: 97, column: 22, scope: !61)
!70 = !DILocation(line: 97, column: 12, scope: !61)
!71 = !DILocation(line: 97, column: 5, scope: !61)
!72 = !DILocation(line: 99, column: 5, scope: !61)
!73 = !DILocation(line: 100, column: 5, scope: !61)
!74 = !DILocation(line: 101, column: 5, scope: !61)
!75 = !DILocation(line: 104, column: 5, scope: !61)
!76 = !DILocation(line: 105, column: 5, scope: !61)
!77 = !DILocation(line: 106, column: 5, scope: !61)
!78 = !DILocation(line: 108, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!80 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 56, type: !3)
!81 = !DILocation(line: 56, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataPtr1", scope: !79, file: !14, line: 57, type: !21)
!83 = !DILocation(line: 57, column: 13, scope: !79)
!84 = !DILocalVariable(name: "dataPtr2", scope: !79, file: !14, line: 58, type: !21)
!85 = !DILocation(line: 58, column: 13, scope: !79)
!86 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !14, line: 59, type: !3)
!87 = !DILocation(line: 59, column: 12, scope: !79)
!88 = !DILocation(line: 59, column: 33, scope: !79)
!89 = !DILocation(line: 60, column: 12, scope: !79)
!90 = !DILocation(line: 60, column: 10, scope: !79)
!91 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 62, type: !3)
!92 = distinct !DILexicalBlock(scope: !79, file: !14, line: 61, column: 5)
!93 = !DILocation(line: 62, column: 16, scope: !92)
!94 = !DILocation(line: 62, column: 24, scope: !92)
!95 = !DILocation(line: 62, column: 23, scope: !92)
!96 = !DILocation(line: 64, column: 9, scope: !92)
!97 = !DILocation(line: 65, column: 9, scope: !92)
!98 = !DILocation(line: 65, column: 20, scope: !92)
!99 = !DILocation(line: 66, column: 21, scope: !92)
!100 = !DILocation(line: 66, column: 10, scope: !92)
!101 = !DILocation(line: 66, column: 19, scope: !92)
!102 = !DILocalVariable(name: "data", scope: !103, file: !14, line: 69, type: !3)
!103 = distinct !DILexicalBlock(scope: !79, file: !14, line: 68, column: 5)
!104 = !DILocation(line: 69, column: 16, scope: !103)
!105 = !DILocation(line: 69, column: 24, scope: !103)
!106 = !DILocation(line: 69, column: 23, scope: !103)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !14, line: 71, type: !48)
!108 = distinct !DILexicalBlock(scope: !103, file: !14, line: 70, column: 9)
!109 = !DILocation(line: 71, column: 18, scope: !108)
!110 = !DILocation(line: 73, column: 13, scope: !108)
!111 = !DILocation(line: 74, column: 13, scope: !108)
!112 = !DILocation(line: 74, column: 24, scope: !108)
!113 = !DILocation(line: 75, column: 23, scope: !108)
!114 = !DILocation(line: 75, column: 13, scope: !108)
!115 = !DILocation(line: 78, column: 1, scope: !79)
