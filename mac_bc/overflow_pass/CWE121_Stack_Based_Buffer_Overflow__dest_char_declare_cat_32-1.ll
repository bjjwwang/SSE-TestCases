; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_32_bad() #0 !dbg !11 {
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
  %call = call i8* @__strcat_chk(i8* noundef %7, i8* noundef %arraydecay5, i64 noundef %9) #5, !dbg !58
  %10 = load i8*, i8** %data2, align 8, !dbg !59
  call void @printLine(i8* noundef %10), !dbg !60
  ret void, !dbg !61
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
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_32_good() #0 !dbg !62 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* noundef null), !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 noundef %conv), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_32_good(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_32_bad(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !94, metadata !DIExpression()), !dbg !96
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !97
  %1 = load i8*, i8** %0, align 8, !dbg !98
  store i8* %1, i8** %data1, align 8, !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i8* %arraydecay, i8** %data1, align 8, !dbg !100
  %2 = load i8*, i8** %data1, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  %3 = load i8*, i8** %data1, align 8, !dbg !103
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !104
  store i8* %3, i8** %4, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !106, metadata !DIExpression()), !dbg !108
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !109
  %6 = load i8*, i8** %5, align 8, !dbg !110
  store i8* %6, i8** %data2, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !114
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx4, align 1, !dbg !116
  %7 = load i8*, i8** %data2, align 8, !dbg !117
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !117
  %8 = load i8*, i8** %data2, align 8, !dbg !117
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !117
  %call = call i8* @__strcat_chk(i8* noundef %7, i8* noundef %arraydecay5, i64 noundef %9) #5, !dbg !117
  %10 = load i8*, i8** %data2, align 8, !dbg !118
  call void @printLine(i8* noundef %10), !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!59 = !DILocation(line: 46, column: 23, scope: !53)
!60 = !DILocation(line: 46, column: 13, scope: !53)
!61 = !DILocation(line: 49, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_32_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!63 = !DILocation(line: 85, column: 5, scope: !62)
!64 = !DILocation(line: 86, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !66, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !21}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 97, type: !68)
!70 = !DILocation(line: 97, column: 14, scope: !65)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 97, type: !21)
!72 = !DILocation(line: 97, column: 27, scope: !65)
!73 = !DILocation(line: 100, column: 22, scope: !65)
!74 = !DILocation(line: 100, column: 12, scope: !65)
!75 = !DILocation(line: 100, column: 5, scope: !65)
!76 = !DILocation(line: 102, column: 5, scope: !65)
!77 = !DILocation(line: 103, column: 5, scope: !65)
!78 = !DILocation(line: 104, column: 5, scope: !65)
!79 = !DILocation(line: 107, column: 5, scope: !65)
!80 = !DILocation(line: 108, column: 5, scope: !65)
!81 = !DILocation(line: 109, column: 5, scope: !65)
!82 = !DILocation(line: 111, column: 5, scope: !65)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 58, type: !17)
!85 = !DILocation(line: 58, column: 12, scope: !83)
!86 = !DILocalVariable(name: "dataPtr1", scope: !83, file: !12, line: 59, type: !21)
!87 = !DILocation(line: 59, column: 13, scope: !83)
!88 = !DILocalVariable(name: "dataPtr2", scope: !83, file: !12, line: 60, type: !21)
!89 = !DILocation(line: 60, column: 13, scope: !83)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 61, type: !26)
!91 = !DILocation(line: 61, column: 10, scope: !83)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 62, type: !31)
!93 = !DILocation(line: 62, column: 10, scope: !83)
!94 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 64, type: !17)
!95 = distinct !DILexicalBlock(scope: !83, file: !12, line: 63, column: 5)
!96 = !DILocation(line: 64, column: 16, scope: !95)
!97 = !DILocation(line: 64, column: 24, scope: !95)
!98 = !DILocation(line: 64, column: 23, scope: !95)
!99 = !DILocation(line: 66, column: 16, scope: !95)
!100 = !DILocation(line: 66, column: 14, scope: !95)
!101 = !DILocation(line: 67, column: 9, scope: !95)
!102 = !DILocation(line: 67, column: 17, scope: !95)
!103 = !DILocation(line: 68, column: 21, scope: !95)
!104 = !DILocation(line: 68, column: 10, scope: !95)
!105 = !DILocation(line: 68, column: 19, scope: !95)
!106 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 71, type: !17)
!107 = distinct !DILexicalBlock(scope: !83, file: !12, line: 70, column: 5)
!108 = !DILocation(line: 71, column: 16, scope: !107)
!109 = !DILocation(line: 71, column: 24, scope: !107)
!110 = !DILocation(line: 71, column: 23, scope: !107)
!111 = !DILocalVariable(name: "source", scope: !112, file: !12, line: 73, type: !31)
!112 = distinct !DILexicalBlock(scope: !107, file: !12, line: 72, column: 9)
!113 = !DILocation(line: 73, column: 18, scope: !112)
!114 = !DILocation(line: 74, column: 13, scope: !112)
!115 = !DILocation(line: 75, column: 13, scope: !112)
!116 = !DILocation(line: 75, column: 27, scope: !112)
!117 = !DILocation(line: 77, column: 13, scope: !112)
!118 = !DILocation(line: 78, column: 23, scope: !112)
!119 = !DILocation(line: 78, column: 13, scope: !112)
!120 = !DILocation(line: 81, column: 1, scope: !83)
