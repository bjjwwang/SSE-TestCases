; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 10, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 11, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !31, metadata !DIExpression()), !dbg !33
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !34
  %3 = load i8*, i8** %2, align 8, !dbg !35
  store i8* %3, i8** %data1, align 8, !dbg !33
  %4 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %4, i8** %data1, align 8, !dbg !37
  %5 = load i8*, i8** %data1, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %6 = load i8*, i8** %data1, align 8, !dbg !40
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  store i8* %6, i8** %7, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !46
  %9 = load i8*, i8** %8, align 8, !dbg !47
  store i8* %9, i8** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %10 = bitcast [11 x i8]* %source to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !53
  %11 = load i8*, i8** %data2, align 8, !dbg !54
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %call = call i64 @strlen(i8* noundef %arraydecay3), !dbg !54
  %add = add i64 %call, 1, !dbg !54
  %12 = load i8*, i8** %data2, align 8, !dbg !54
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !54
  %call4 = call i8* @__strncpy_chk(i8* noundef %11, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %13) #5, !dbg !54
  %14 = load i8*, i8** %data2, align 8, !dbg !55
  call void @printLine(i8* noundef %14), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_good() #0 !dbg !58 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_bad(), !dbg !76
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
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 10, align 16, !dbg !88
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %1 = alloca i8, i64 11, align 16, !dbg !91
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !95
  %3 = load i8*, i8** %2, align 8, !dbg !96
  store i8* %3, i8** %data1, align 8, !dbg !94
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !97
  store i8* %4, i8** %data1, align 8, !dbg !98
  %5 = load i8*, i8** %data1, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  %6 = load i8*, i8** %data1, align 8, !dbg !101
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !102
  store i8* %6, i8** %7, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !104, metadata !DIExpression()), !dbg !106
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !107
  %9 = load i8*, i8** %8, align 8, !dbg !108
  store i8* %9, i8** %data2, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %10 = bitcast [11 x i8]* %source to i8*, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !111
  %11 = load i8*, i8** %data2, align 8, !dbg !112
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !112
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !112
  %call = call i64 @strlen(i8* noundef %arraydecay3), !dbg !112
  %add = add i64 %call, 1, !dbg !112
  %12 = load i8*, i8** %data2, align 8, !dbg !112
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !112
  %call4 = call i8* @__strncpy_chk(i8* noundef %11, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %13) #5, !dbg !112
  %14 = load i8*, i8** %data2, align 8, !dbg !113
  call void @printLine(i8* noundef %14), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !3)
!19 = !DILocation(line: 30, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!22 = !DILocation(line: 31, column: 13, scope: !13)
!23 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 32, type: !21)
!24 = !DILocation(line: 32, column: 13, scope: !13)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !3)
!26 = !DILocation(line: 33, column: 12, scope: !13)
!27 = !DILocation(line: 33, column: 36, scope: !13)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !3)
!29 = !DILocation(line: 34, column: 12, scope: !13)
!30 = !DILocation(line: 34, column: 37, scope: !13)
!31 = !DILocalVariable(name: "data", scope: !32, file: !14, line: 36, type: !3)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!33 = !DILocation(line: 36, column: 16, scope: !32)
!34 = !DILocation(line: 36, column: 24, scope: !32)
!35 = !DILocation(line: 36, column: 23, scope: !32)
!36 = !DILocation(line: 39, column: 16, scope: !32)
!37 = !DILocation(line: 39, column: 14, scope: !32)
!38 = !DILocation(line: 40, column: 9, scope: !32)
!39 = !DILocation(line: 40, column: 17, scope: !32)
!40 = !DILocation(line: 41, column: 21, scope: !32)
!41 = !DILocation(line: 41, column: 10, scope: !32)
!42 = !DILocation(line: 41, column: 19, scope: !32)
!43 = !DILocalVariable(name: "data", scope: !44, file: !14, line: 44, type: !3)
!44 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 5)
!45 = !DILocation(line: 44, column: 16, scope: !44)
!46 = !DILocation(line: 44, column: 24, scope: !44)
!47 = !DILocation(line: 44, column: 23, scope: !44)
!48 = !DILocalVariable(name: "source", scope: !49, file: !14, line: 46, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !14, line: 45, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 11)
!53 = !DILocation(line: 46, column: 18, scope: !49)
!54 = !DILocation(line: 49, column: 13, scope: !49)
!55 = !DILocation(line: 50, column: 23, scope: !49)
!56 = !DILocation(line: 50, column: 13, scope: !49)
!57 = !DILocation(line: 53, column: 1, scope: !13)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_32_good", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!59 = !DILocation(line: 89, column: 5, scope: !58)
!60 = !DILocation(line: 90, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 101, type: !62, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !21}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !14, line: 101, type: !64)
!66 = !DILocation(line: 101, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !14, line: 101, type: !21)
!68 = !DILocation(line: 101, column: 27, scope: !61)
!69 = !DILocation(line: 104, column: 22, scope: !61)
!70 = !DILocation(line: 104, column: 12, scope: !61)
!71 = !DILocation(line: 104, column: 5, scope: !61)
!72 = !DILocation(line: 106, column: 5, scope: !61)
!73 = !DILocation(line: 107, column: 5, scope: !61)
!74 = !DILocation(line: 108, column: 5, scope: !61)
!75 = !DILocation(line: 111, column: 5, scope: !61)
!76 = !DILocation(line: 112, column: 5, scope: !61)
!77 = !DILocation(line: 113, column: 5, scope: !61)
!78 = !DILocation(line: 115, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!80 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 62, type: !3)
!81 = !DILocation(line: 62, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataPtr1", scope: !79, file: !14, line: 63, type: !21)
!83 = !DILocation(line: 63, column: 13, scope: !79)
!84 = !DILocalVariable(name: "dataPtr2", scope: !79, file: !14, line: 64, type: !21)
!85 = !DILocation(line: 64, column: 13, scope: !79)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !14, line: 65, type: !3)
!87 = !DILocation(line: 65, column: 12, scope: !79)
!88 = !DILocation(line: 65, column: 36, scope: !79)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !14, line: 66, type: !3)
!90 = !DILocation(line: 66, column: 12, scope: !79)
!91 = !DILocation(line: 66, column: 37, scope: !79)
!92 = !DILocalVariable(name: "data", scope: !93, file: !14, line: 68, type: !3)
!93 = distinct !DILexicalBlock(scope: !79, file: !14, line: 67, column: 5)
!94 = !DILocation(line: 68, column: 16, scope: !93)
!95 = !DILocation(line: 68, column: 24, scope: !93)
!96 = !DILocation(line: 68, column: 23, scope: !93)
!97 = !DILocation(line: 71, column: 16, scope: !93)
!98 = !DILocation(line: 71, column: 14, scope: !93)
!99 = !DILocation(line: 72, column: 9, scope: !93)
!100 = !DILocation(line: 72, column: 17, scope: !93)
!101 = !DILocation(line: 73, column: 21, scope: !93)
!102 = !DILocation(line: 73, column: 10, scope: !93)
!103 = !DILocation(line: 73, column: 19, scope: !93)
!104 = !DILocalVariable(name: "data", scope: !105, file: !14, line: 76, type: !3)
!105 = distinct !DILexicalBlock(scope: !79, file: !14, line: 75, column: 5)
!106 = !DILocation(line: 76, column: 16, scope: !105)
!107 = !DILocation(line: 76, column: 24, scope: !105)
!108 = !DILocation(line: 76, column: 23, scope: !105)
!109 = !DILocalVariable(name: "source", scope: !110, file: !14, line: 78, type: !50)
!110 = distinct !DILexicalBlock(scope: !105, file: !14, line: 77, column: 9)
!111 = !DILocation(line: 78, column: 18, scope: !110)
!112 = !DILocation(line: 81, column: 13, scope: !110)
!113 = !DILocation(line: 82, column: 23, scope: !110)
!114 = !DILocation(line: 82, column: 13, scope: !110)
!115 = !DILocation(line: 85, column: 1, scope: !79)
