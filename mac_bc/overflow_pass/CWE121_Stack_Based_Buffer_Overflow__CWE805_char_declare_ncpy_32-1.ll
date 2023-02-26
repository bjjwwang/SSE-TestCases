; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !38
  %1 = load i8*, i8** %0, align 8, !dbg !39
  store i8* %1, i8** %data1, align 8, !dbg !37
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay, i8** %data1, align 8, !dbg !41
  %2 = load i8*, i8** %data1, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  %3 = load i8*, i8** %data1, align 8, !dbg !44
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !45
  store i8* %3, i8** %4, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !47, metadata !DIExpression()), !dbg !49
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !50
  %6 = load i8*, i8** %5, align 8, !dbg !51
  store i8* %6, i8** %data2, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !55
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx4, align 1, !dbg !57
  %7 = load i8*, i8** %data2, align 8, !dbg !58
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !58
  %8 = load i8*, i8** %data2, align 8, !dbg !58
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !58
  %call = call i8* @__strncpy_chk(i8* noundef %7, i8* noundef %arraydecay5, i64 noundef 99, i64 noundef %9) #5, !dbg !58
  %10 = load i8*, i8** %data2, align 8, !dbg !59
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !59
  store i8 0, i8* %arrayidx6, align 1, !dbg !60
  %11 = load i8*, i8** %data2, align 8, !dbg !61
  call void @printLine(i8* noundef %11), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_32_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !67 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_32_good(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_32_bad(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !99
  %1 = load i8*, i8** %0, align 8, !dbg !100
  store i8* %1, i8** %data1, align 8, !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay, i8** %data1, align 8, !dbg !102
  %2 = load i8*, i8** %data1, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %3 = load i8*, i8** %data1, align 8, !dbg !105
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !106
  store i8* %3, i8** %4, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !108, metadata !DIExpression()), !dbg !110
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !111
  %6 = load i8*, i8** %5, align 8, !dbg !112
  store i8* %6, i8** %data2, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !116
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx4, align 1, !dbg !118
  %7 = load i8*, i8** %data2, align 8, !dbg !119
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !119
  %8 = load i8*, i8** %data2, align 8, !dbg !119
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !119
  %call = call i8* @__strncpy_chk(i8* noundef %7, i8* noundef %arraydecay5, i64 noundef 99, i64 noundef %9) #5, !dbg !119
  %10 = load i8*, i8** %data2, align 8, !dbg !120
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !120
  store i8 0, i8* %arrayidx6, align 1, !dbg !121
  %11 = load i8*, i8** %data2, align 8, !dbg !122
  call void @printLine(i8* noundef %11), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !11)
!23 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 28, column: 10, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 29, column: 10, scope: !11)
!35 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 31, type: !17)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!37 = !DILocation(line: 31, column: 16, scope: !36)
!38 = !DILocation(line: 31, column: 24, scope: !36)
!39 = !DILocation(line: 31, column: 23, scope: !36)
!40 = !DILocation(line: 34, column: 16, scope: !36)
!41 = !DILocation(line: 34, column: 14, scope: !36)
!42 = !DILocation(line: 35, column: 9, scope: !36)
!43 = !DILocation(line: 35, column: 17, scope: !36)
!44 = !DILocation(line: 36, column: 21, scope: !36)
!45 = !DILocation(line: 36, column: 10, scope: !36)
!46 = !DILocation(line: 36, column: 19, scope: !36)
!47 = !DILocalVariable(name: "data", scope: !48, file: !12, line: 39, type: !17)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!49 = !DILocation(line: 39, column: 16, scope: !48)
!50 = !DILocation(line: 39, column: 24, scope: !48)
!51 = !DILocation(line: 39, column: 23, scope: !48)
!52 = !DILocalVariable(name: "source", scope: !53, file: !12, line: 41, type: !31)
!53 = distinct !DILexicalBlock(scope: !48, file: !12, line: 40, column: 9)
!54 = !DILocation(line: 41, column: 18, scope: !53)
!55 = !DILocation(line: 42, column: 13, scope: !53)
!56 = !DILocation(line: 43, column: 13, scope: !53)
!57 = !DILocation(line: 43, column: 27, scope: !53)
!58 = !DILocation(line: 45, column: 13, scope: !53)
!59 = !DILocation(line: 46, column: 13, scope: !53)
!60 = !DILocation(line: 46, column: 25, scope: !53)
!61 = !DILocation(line: 47, column: 23, scope: !53)
!62 = !DILocation(line: 47, column: 13, scope: !53)
!63 = !DILocation(line: 50, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_32_good", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!65 = !DILocation(line: 87, column: 5, scope: !64)
!66 = !DILocation(line: 88, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !68, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !21}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 99, type: !70)
!72 = !DILocation(line: 99, column: 14, scope: !67)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 99, type: !21)
!74 = !DILocation(line: 99, column: 27, scope: !67)
!75 = !DILocation(line: 102, column: 22, scope: !67)
!76 = !DILocation(line: 102, column: 12, scope: !67)
!77 = !DILocation(line: 102, column: 5, scope: !67)
!78 = !DILocation(line: 104, column: 5, scope: !67)
!79 = !DILocation(line: 105, column: 5, scope: !67)
!80 = !DILocation(line: 106, column: 5, scope: !67)
!81 = !DILocation(line: 109, column: 5, scope: !67)
!82 = !DILocation(line: 110, column: 5, scope: !67)
!83 = !DILocation(line: 111, column: 5, scope: !67)
!84 = !DILocation(line: 113, column: 5, scope: !67)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 59, type: !17)
!87 = !DILocation(line: 59, column: 12, scope: !85)
!88 = !DILocalVariable(name: "dataPtr1", scope: !85, file: !12, line: 60, type: !21)
!89 = !DILocation(line: 60, column: 13, scope: !85)
!90 = !DILocalVariable(name: "dataPtr2", scope: !85, file: !12, line: 61, type: !21)
!91 = !DILocation(line: 61, column: 13, scope: !85)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !12, line: 62, type: !26)
!93 = !DILocation(line: 62, column: 10, scope: !85)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !12, line: 63, type: !31)
!95 = !DILocation(line: 63, column: 10, scope: !85)
!96 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 65, type: !17)
!97 = distinct !DILexicalBlock(scope: !85, file: !12, line: 64, column: 5)
!98 = !DILocation(line: 65, column: 16, scope: !97)
!99 = !DILocation(line: 65, column: 24, scope: !97)
!100 = !DILocation(line: 65, column: 23, scope: !97)
!101 = !DILocation(line: 67, column: 16, scope: !97)
!102 = !DILocation(line: 67, column: 14, scope: !97)
!103 = !DILocation(line: 68, column: 9, scope: !97)
!104 = !DILocation(line: 68, column: 17, scope: !97)
!105 = !DILocation(line: 69, column: 21, scope: !97)
!106 = !DILocation(line: 69, column: 10, scope: !97)
!107 = !DILocation(line: 69, column: 19, scope: !97)
!108 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 72, type: !17)
!109 = distinct !DILexicalBlock(scope: !85, file: !12, line: 71, column: 5)
!110 = !DILocation(line: 72, column: 16, scope: !109)
!111 = !DILocation(line: 72, column: 24, scope: !109)
!112 = !DILocation(line: 72, column: 23, scope: !109)
!113 = !DILocalVariable(name: "source", scope: !114, file: !12, line: 74, type: !31)
!114 = distinct !DILexicalBlock(scope: !109, file: !12, line: 73, column: 9)
!115 = !DILocation(line: 74, column: 18, scope: !114)
!116 = !DILocation(line: 75, column: 13, scope: !114)
!117 = !DILocation(line: 76, column: 13, scope: !114)
!118 = !DILocation(line: 76, column: 27, scope: !114)
!119 = !DILocation(line: 78, column: 13, scope: !114)
!120 = !DILocation(line: 79, column: 13, scope: !114)
!121 = !DILocation(line: 79, column: 25, scope: !114)
!122 = !DILocation(line: 80, column: 23, scope: !114)
!123 = !DILocation(line: 80, column: 13, scope: !114)
!124 = !DILocation(line: 83, column: 1, scope: !85)
