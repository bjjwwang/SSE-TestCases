; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 11, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !33
  %3 = load i8*, i8** %2, align 8, !dbg !34
  store i8* %3, i8** %data1, align 8, !dbg !32
  %4 = load i8*, i8** %dataBadBuffer, align 8, !dbg !35
  store i8* %4, i8** %data1, align 8, !dbg !36
  %5 = load i8*, i8** %data1, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %6 = load i8*, i8** %data1, align 8, !dbg !39
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !40
  store i8* %6, i8** %7, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !45
  %9 = load i8*, i8** %8, align 8, !dbg !46
  store i8* %9, i8** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %10 = bitcast [11 x i8]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !52
  %11 = load i8*, i8** %data2, align 8, !dbg !53
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %call = call i8* @strcpy(i8* %11, i8* %arraydecay) #5, !dbg !55
  %12 = load i8*, i8** %data2, align 8, !dbg !56
  call void @printLine(i8* %12), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 10, align 16, !dbg !89
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %1 = alloca i8, i64 11, align 16, !dbg !92
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !93, metadata !DIExpression()), !dbg !95
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !96
  %3 = load i8*, i8** %2, align 8, !dbg !97
  store i8* %3, i8** %data1, align 8, !dbg !95
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !98
  store i8* %4, i8** %data1, align 8, !dbg !99
  %5 = load i8*, i8** %data1, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %6 = load i8*, i8** %data1, align 8, !dbg !102
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !103
  store i8* %6, i8** %7, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !105, metadata !DIExpression()), !dbg !107
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !108
  %9 = load i8*, i8** %8, align 8, !dbg !109
  store i8* %9, i8** %data2, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %10 = bitcast [11 x i8]* %source to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !112
  %11 = load i8*, i8** %data2, align 8, !dbg !113
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !114
  %call = call i8* @strcpy(i8* %11, i8* %arraydecay) #5, !dbg !115
  %12 = load i8*, i8** %data2, align 8, !dbg !116
  call void @printLine(i8* %12), !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 31, column: 13, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 32, type: !20)
!23 = !DILocation(line: 32, column: 13, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !4)
!25 = !DILocation(line: 33, column: 12, scope: !13)
!26 = !DILocation(line: 33, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !4)
!28 = !DILocation(line: 34, column: 12, scope: !13)
!29 = !DILocation(line: 34, column: 37, scope: !13)
!30 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 36, type: !4)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!32 = !DILocation(line: 36, column: 16, scope: !31)
!33 = !DILocation(line: 36, column: 24, scope: !31)
!34 = !DILocation(line: 36, column: 23, scope: !31)
!35 = !DILocation(line: 39, column: 16, scope: !31)
!36 = !DILocation(line: 39, column: 14, scope: !31)
!37 = !DILocation(line: 40, column: 9, scope: !31)
!38 = !DILocation(line: 40, column: 17, scope: !31)
!39 = !DILocation(line: 41, column: 21, scope: !31)
!40 = !DILocation(line: 41, column: 10, scope: !31)
!41 = !DILocation(line: 41, column: 19, scope: !31)
!42 = !DILocalVariable(name: "data", scope: !43, file: !14, line: 44, type: !4)
!43 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 5)
!44 = !DILocation(line: 44, column: 16, scope: !43)
!45 = !DILocation(line: 44, column: 24, scope: !43)
!46 = !DILocation(line: 44, column: 23, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !48, file: !14, line: 46, type: !49)
!48 = distinct !DILexicalBlock(scope: !43, file: !14, line: 45, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 46, column: 18, scope: !48)
!53 = !DILocation(line: 48, column: 20, scope: !48)
!54 = !DILocation(line: 48, column: 26, scope: !48)
!55 = !DILocation(line: 48, column: 13, scope: !48)
!56 = !DILocation(line: 49, column: 23, scope: !48)
!57 = !DILocation(line: 49, column: 13, scope: !48)
!58 = !DILocation(line: 52, column: 1, scope: !13)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_32_good", scope: !14, file: !14, line: 85, type: !15, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 87, column: 5, scope: !59)
!61 = !DILocation(line: 88, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 99, type: !63, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !20}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !14, line: 99, type: !65)
!67 = !DILocation(line: 99, column: 14, scope: !62)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !14, line: 99, type: !20)
!69 = !DILocation(line: 99, column: 27, scope: !62)
!70 = !DILocation(line: 102, column: 22, scope: !62)
!71 = !DILocation(line: 102, column: 12, scope: !62)
!72 = !DILocation(line: 102, column: 5, scope: !62)
!73 = !DILocation(line: 104, column: 5, scope: !62)
!74 = !DILocation(line: 105, column: 5, scope: !62)
!75 = !DILocation(line: 106, column: 5, scope: !62)
!76 = !DILocation(line: 109, column: 5, scope: !62)
!77 = !DILocation(line: 110, column: 5, scope: !62)
!78 = !DILocation(line: 111, column: 5, scope: !62)
!79 = !DILocation(line: 113, column: 5, scope: !62)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !14, line: 61, type: !4)
!82 = !DILocation(line: 61, column: 12, scope: !80)
!83 = !DILocalVariable(name: "dataPtr1", scope: !80, file: !14, line: 62, type: !20)
!84 = !DILocation(line: 62, column: 13, scope: !80)
!85 = !DILocalVariable(name: "dataPtr2", scope: !80, file: !14, line: 63, type: !20)
!86 = !DILocation(line: 63, column: 13, scope: !80)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !14, line: 64, type: !4)
!88 = !DILocation(line: 64, column: 12, scope: !80)
!89 = !DILocation(line: 64, column: 36, scope: !80)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !14, line: 65, type: !4)
!91 = !DILocation(line: 65, column: 12, scope: !80)
!92 = !DILocation(line: 65, column: 37, scope: !80)
!93 = !DILocalVariable(name: "data", scope: !94, file: !14, line: 67, type: !4)
!94 = distinct !DILexicalBlock(scope: !80, file: !14, line: 66, column: 5)
!95 = !DILocation(line: 67, column: 16, scope: !94)
!96 = !DILocation(line: 67, column: 24, scope: !94)
!97 = !DILocation(line: 67, column: 23, scope: !94)
!98 = !DILocation(line: 70, column: 16, scope: !94)
!99 = !DILocation(line: 70, column: 14, scope: !94)
!100 = !DILocation(line: 71, column: 9, scope: !94)
!101 = !DILocation(line: 71, column: 17, scope: !94)
!102 = !DILocation(line: 72, column: 21, scope: !94)
!103 = !DILocation(line: 72, column: 10, scope: !94)
!104 = !DILocation(line: 72, column: 19, scope: !94)
!105 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 75, type: !4)
!106 = distinct !DILexicalBlock(scope: !80, file: !14, line: 74, column: 5)
!107 = !DILocation(line: 75, column: 16, scope: !106)
!108 = !DILocation(line: 75, column: 24, scope: !106)
!109 = !DILocation(line: 75, column: 23, scope: !106)
!110 = !DILocalVariable(name: "source", scope: !111, file: !14, line: 77, type: !49)
!111 = distinct !DILexicalBlock(scope: !106, file: !14, line: 76, column: 9)
!112 = !DILocation(line: 77, column: 18, scope: !111)
!113 = !DILocation(line: 79, column: 20, scope: !111)
!114 = !DILocation(line: 79, column: 26, scope: !111)
!115 = !DILocation(line: 79, column: 13, scope: !111)
!116 = !DILocation(line: 80, column: 23, scope: !111)
!117 = !DILocation(line: 80, column: 13, scope: !111)
!118 = !DILocation(line: 83, column: 1, scope: !80)
