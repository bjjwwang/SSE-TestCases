; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !54
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx3, align 1, !dbg !56
  %10 = load i8*, i8** %data2, align 8, !dbg !57
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !57
  %11 = load i8*, i8** %data2, align 8, !dbg !57
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !57
  %call = call i8* @__strcat_chk(i8* noundef %10, i8* noundef %arraydecay4, i64 noundef %12) #5, !dbg !57
  %13 = load i8*, i8** %data2, align 8, !dbg !58
  call void @printLine(i8* noundef %13), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_32_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* noundef null), !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 noundef %conv), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_32_good(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_32_bad(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 50, align 16, !dbg !91
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %1 = alloca i8, i64 100, align 16, !dbg !94
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !95, metadata !DIExpression()), !dbg !97
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !98
  %3 = load i8*, i8** %2, align 8, !dbg !99
  store i8* %3, i8** %data1, align 8, !dbg !97
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !100
  store i8* %4, i8** %data1, align 8, !dbg !101
  %5 = load i8*, i8** %data1, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %6 = load i8*, i8** %data1, align 8, !dbg !104
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !105
  store i8* %6, i8** %7, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !107, metadata !DIExpression()), !dbg !109
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !110
  %9 = load i8*, i8** %8, align 8, !dbg !111
  store i8* %9, i8** %data2, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx3, align 1, !dbg !117
  %10 = load i8*, i8** %data2, align 8, !dbg !118
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !118
  %11 = load i8*, i8** %data2, align 8, !dbg !118
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !118
  %call = call i8* @__strcat_chk(i8* noundef %10, i8* noundef %arraydecay4, i64 noundef %12) #5, !dbg !118
  %13 = load i8*, i8** %data2, align 8, !dbg !119
  call void @printLine(i8* noundef %13), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 28, type: !3)
!26 = !DILocation(line: 28, column: 12, scope: !13)
!27 = !DILocation(line: 28, column: 36, scope: !13)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 29, type: !3)
!29 = !DILocation(line: 29, column: 12, scope: !13)
!30 = !DILocation(line: 29, column: 37, scope: !13)
!31 = !DILocalVariable(name: "data", scope: !32, file: !14, line: 31, type: !3)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!33 = !DILocation(line: 31, column: 16, scope: !32)
!34 = !DILocation(line: 31, column: 24, scope: !32)
!35 = !DILocation(line: 31, column: 23, scope: !32)
!36 = !DILocation(line: 34, column: 16, scope: !32)
!37 = !DILocation(line: 34, column: 14, scope: !32)
!38 = !DILocation(line: 35, column: 9, scope: !32)
!39 = !DILocation(line: 35, column: 17, scope: !32)
!40 = !DILocation(line: 36, column: 21, scope: !32)
!41 = !DILocation(line: 36, column: 10, scope: !32)
!42 = !DILocation(line: 36, column: 19, scope: !32)
!43 = !DILocalVariable(name: "data", scope: !44, file: !14, line: 39, type: !3)
!44 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!45 = !DILocation(line: 39, column: 16, scope: !44)
!46 = !DILocation(line: 39, column: 24, scope: !44)
!47 = !DILocation(line: 39, column: 23, scope: !44)
!48 = !DILocalVariable(name: "source", scope: !49, file: !14, line: 41, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !14, line: 40, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 41, column: 18, scope: !49)
!54 = !DILocation(line: 42, column: 13, scope: !49)
!55 = !DILocation(line: 43, column: 13, scope: !49)
!56 = !DILocation(line: 43, column: 27, scope: !49)
!57 = !DILocation(line: 45, column: 13, scope: !49)
!58 = !DILocation(line: 46, column: 23, scope: !49)
!59 = !DILocation(line: 46, column: 13, scope: !49)
!60 = !DILocation(line: 49, column: 1, scope: !13)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_32_good", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!62 = !DILocation(line: 85, column: 5, scope: !61)
!63 = !DILocation(line: 86, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 97, type: !65, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !21}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !14, line: 97, type: !67)
!69 = !DILocation(line: 97, column: 14, scope: !64)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !14, line: 97, type: !21)
!71 = !DILocation(line: 97, column: 27, scope: !64)
!72 = !DILocation(line: 100, column: 22, scope: !64)
!73 = !DILocation(line: 100, column: 12, scope: !64)
!74 = !DILocation(line: 100, column: 5, scope: !64)
!75 = !DILocation(line: 102, column: 5, scope: !64)
!76 = !DILocation(line: 103, column: 5, scope: !64)
!77 = !DILocation(line: 104, column: 5, scope: !64)
!78 = !DILocation(line: 107, column: 5, scope: !64)
!79 = !DILocation(line: 108, column: 5, scope: !64)
!80 = !DILocation(line: 109, column: 5, scope: !64)
!81 = !DILocation(line: 111, column: 5, scope: !64)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!83 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 58, type: !3)
!84 = !DILocation(line: 58, column: 12, scope: !82)
!85 = !DILocalVariable(name: "dataPtr1", scope: !82, file: !14, line: 59, type: !21)
!86 = !DILocation(line: 59, column: 13, scope: !82)
!87 = !DILocalVariable(name: "dataPtr2", scope: !82, file: !14, line: 60, type: !21)
!88 = !DILocation(line: 60, column: 13, scope: !82)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !14, line: 61, type: !3)
!90 = !DILocation(line: 61, column: 12, scope: !82)
!91 = !DILocation(line: 61, column: 36, scope: !82)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !14, line: 62, type: !3)
!93 = !DILocation(line: 62, column: 12, scope: !82)
!94 = !DILocation(line: 62, column: 37, scope: !82)
!95 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 64, type: !3)
!96 = distinct !DILexicalBlock(scope: !82, file: !14, line: 63, column: 5)
!97 = !DILocation(line: 64, column: 16, scope: !96)
!98 = !DILocation(line: 64, column: 24, scope: !96)
!99 = !DILocation(line: 64, column: 23, scope: !96)
!100 = !DILocation(line: 66, column: 16, scope: !96)
!101 = !DILocation(line: 66, column: 14, scope: !96)
!102 = !DILocation(line: 67, column: 9, scope: !96)
!103 = !DILocation(line: 67, column: 17, scope: !96)
!104 = !DILocation(line: 68, column: 21, scope: !96)
!105 = !DILocation(line: 68, column: 10, scope: !96)
!106 = !DILocation(line: 68, column: 19, scope: !96)
!107 = !DILocalVariable(name: "data", scope: !108, file: !14, line: 71, type: !3)
!108 = distinct !DILexicalBlock(scope: !82, file: !14, line: 70, column: 5)
!109 = !DILocation(line: 71, column: 16, scope: !108)
!110 = !DILocation(line: 71, column: 24, scope: !108)
!111 = !DILocation(line: 71, column: 23, scope: !108)
!112 = !DILocalVariable(name: "source", scope: !113, file: !14, line: 73, type: !50)
!113 = distinct !DILexicalBlock(scope: !108, file: !14, line: 72, column: 9)
!114 = !DILocation(line: 73, column: 18, scope: !113)
!115 = !DILocation(line: 74, column: 13, scope: !113)
!116 = !DILocation(line: 75, column: 13, scope: !113)
!117 = !DILocation(line: 75, column: 27, scope: !113)
!118 = !DILocation(line: 77, column: 13, scope: !113)
!119 = !DILocation(line: 78, column: 23, scope: !113)
!120 = !DILocation(line: 78, column: 13, scope: !113)
!121 = !DILocation(line: 81, column: 1, scope: !82)
