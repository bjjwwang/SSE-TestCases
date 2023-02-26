; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_goodG2BData = internal global i8* null, align 8, !dbg !9

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  store i8* %2, i8** %data, align 8, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* noundef null), !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 noundef %conv), !dbg !53
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_good(), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_bad(), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !61 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_badData, align 8, !dbg !64
  store i8* %0, i8** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !65, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !71
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %1 = load i8*, i8** %data, align 8, !dbg !74
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !74
  %2 = load i8*, i8** %data, align 8, !dbg !74
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !74
  %call = call i8* @__strncpy_chk(i8* noundef %1, i8* noundef %arraydecay1, i64 noundef 99, i64 noundef %3) #5, !dbg !74
  %4 = load i8*, i8** %data, align 8, !dbg !75
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !75
  store i8 0, i8* %arrayidx2, align 1, !dbg !76
  %5 = load i8*, i8** %data, align 8, !dbg !77
  call void @printLine(i8* noundef %5), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 50, align 16, !dbg !85
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %1 = alloca i8, i64 100, align 16, !dbg !88
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !87
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !89
  store i8* %2, i8** %data, align 8, !dbg !90
  %3 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %4 = load i8*, i8** %data, align 8, !dbg !93
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_goodG2BData, align 8, !dbg !94
  call void @goodG2BSink(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_goodG2BData, align 8, !dbg !100
  store i8* %0, i8** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !104
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %1 = load i8*, i8** %data, align 8, !dbg !107
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  %2 = load i8*, i8** %data, align 8, !dbg !107
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !107
  %call = call i8* @__strncpy_chk(i8* noundef %1, i8* noundef %arraydecay1, i64 noundef 99, i64 noundef %3) #5, !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !108
  store i8 0, i8* %arrayidx2, align 1, !dbg !109
  %5 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* noundef %5), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_badData", scope: !2, file: !11, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_goodG2BData", scope: !2, file: !11, line: 22, type: !5, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_bad", scope: !11, file: !11, line: 40, type: !20, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 42, type: !5)
!24 = !DILocation(line: 42, column: 12, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !11, line: 43, type: !5)
!26 = !DILocation(line: 43, column: 12, scope: !19)
!27 = !DILocation(line: 43, column: 36, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !11, line: 44, type: !5)
!29 = !DILocation(line: 44, column: 12, scope: !19)
!30 = !DILocation(line: 44, column: 37, scope: !19)
!31 = !DILocation(line: 47, column: 12, scope: !19)
!32 = !DILocation(line: 47, column: 10, scope: !19)
!33 = !DILocation(line: 48, column: 5, scope: !19)
!34 = !DILocation(line: 48, column: 13, scope: !19)
!35 = !DILocation(line: 49, column: 78, scope: !19)
!36 = !DILocation(line: 49, column: 76, scope: !19)
!37 = !DILocation(line: 50, column: 5, scope: !19)
!38 = !DILocation(line: 51, column: 1, scope: !19)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_good", scope: !11, file: !11, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!40 = !DILocation(line: 86, column: 5, scope: !39)
!41 = !DILocation(line: 87, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 98, type: !43, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !11, line: 98, type: !45)
!48 = !DILocation(line: 98, column: 14, scope: !42)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !11, line: 98, type: !46)
!50 = !DILocation(line: 98, column: 27, scope: !42)
!51 = !DILocation(line: 101, column: 22, scope: !42)
!52 = !DILocation(line: 101, column: 12, scope: !42)
!53 = !DILocation(line: 101, column: 5, scope: !42)
!54 = !DILocation(line: 103, column: 5, scope: !42)
!55 = !DILocation(line: 104, column: 5, scope: !42)
!56 = !DILocation(line: 105, column: 5, scope: !42)
!57 = !DILocation(line: 108, column: 5, scope: !42)
!58 = !DILocation(line: 109, column: 5, scope: !42)
!59 = !DILocation(line: 110, column: 5, scope: !42)
!60 = !DILocation(line: 112, column: 5, scope: !42)
!61 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!62 = !DILocalVariable(name: "data", scope: !61, file: !11, line: 28, type: !5)
!63 = !DILocation(line: 28, column: 12, scope: !61)
!64 = !DILocation(line: 28, column: 19, scope: !61)
!65 = !DILocalVariable(name: "source", scope: !66, file: !11, line: 30, type: !67)
!66 = distinct !DILexicalBlock(scope: !61, file: !11, line: 29, column: 5)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 100)
!70 = !DILocation(line: 30, column: 14, scope: !66)
!71 = !DILocation(line: 31, column: 9, scope: !66)
!72 = !DILocation(line: 32, column: 9, scope: !66)
!73 = !DILocation(line: 32, column: 23, scope: !66)
!74 = !DILocation(line: 34, column: 9, scope: !66)
!75 = !DILocation(line: 35, column: 9, scope: !66)
!76 = !DILocation(line: 35, column: 21, scope: !66)
!77 = !DILocation(line: 36, column: 19, scope: !66)
!78 = !DILocation(line: 36, column: 9, scope: !66)
!79 = !DILocation(line: 38, column: 1, scope: !61)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 72, type: !20, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!81 = !DILocalVariable(name: "data", scope: !80, file: !11, line: 74, type: !5)
!82 = !DILocation(line: 74, column: 12, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !11, line: 75, type: !5)
!84 = !DILocation(line: 75, column: 12, scope: !80)
!85 = !DILocation(line: 75, column: 36, scope: !80)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !11, line: 76, type: !5)
!87 = !DILocation(line: 76, column: 12, scope: !80)
!88 = !DILocation(line: 76, column: 37, scope: !80)
!89 = !DILocation(line: 78, column: 12, scope: !80)
!90 = !DILocation(line: 78, column: 10, scope: !80)
!91 = !DILocation(line: 79, column: 5, scope: !80)
!92 = !DILocation(line: 79, column: 13, scope: !80)
!93 = !DILocation(line: 80, column: 82, scope: !80)
!94 = !DILocation(line: 80, column: 80, scope: !80)
!95 = !DILocation(line: 81, column: 5, scope: !80)
!96 = !DILocation(line: 82, column: 1, scope: !80)
!97 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!98 = !DILocalVariable(name: "data", scope: !97, file: !11, line: 60, type: !5)
!99 = !DILocation(line: 60, column: 12, scope: !97)
!100 = !DILocation(line: 60, column: 19, scope: !97)
!101 = !DILocalVariable(name: "source", scope: !102, file: !11, line: 62, type: !67)
!102 = distinct !DILexicalBlock(scope: !97, file: !11, line: 61, column: 5)
!103 = !DILocation(line: 62, column: 14, scope: !102)
!104 = !DILocation(line: 63, column: 9, scope: !102)
!105 = !DILocation(line: 64, column: 9, scope: !102)
!106 = !DILocation(line: 64, column: 23, scope: !102)
!107 = !DILocation(line: 66, column: 9, scope: !102)
!108 = !DILocation(line: 67, column: 9, scope: !102)
!109 = !DILocation(line: 67, column: 21, scope: !102)
!110 = !DILocation(line: 68, column: 19, scope: !102)
!111 = !DILocation(line: 68, column: 9, scope: !102)
!112 = !DILocation(line: 70, column: 1, scope: !97)
