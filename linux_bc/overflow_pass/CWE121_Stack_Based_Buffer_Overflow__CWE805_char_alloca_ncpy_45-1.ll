; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_goodG2BData = internal global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_badData, align 8, !dbg !35
  call void @badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #5, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #5, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_badData, align 8, !dbg !63
  store i8* %0, i8** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !64, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !70
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !71
  store i8 0, i8* %arrayidx, align 1, !dbg !72
  %1 = load i8*, i8** %data, align 8, !dbg !73
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !74
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #5, !dbg !75
  %2 = load i8*, i8** %data, align 8, !dbg !76
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !76
  store i8 0, i8* %arrayidx2, align 1, !dbg !77
  %3 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* %3), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 50, align 16, !dbg !86
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %1 = alloca i8, i64 100, align 16, !dbg !89
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !88
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !90
  store i8* %2, i8** %data, align 8, !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_goodG2BData, align 8, !dbg !95
  call void @goodG2BSink(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_goodG2BData, align 8, !dbg !101
  store i8* %0, i8** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !105
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %1 = load i8*, i8** %data, align 8, !dbg !108
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !109
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #5, !dbg !110
  %2 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !111
  store i8 0, i8* %arrayidx2, align 1, !dbg !112
  %3 = load i8*, i8** %data, align 8, !dbg !113
  call void @printLine(i8* %3), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_badData", scope: !2, file: !12, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_goodG2BData", scope: !2, file: !12, line: 22, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_bad", scope: !12, file: !12, line: 40, type: !20, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 42, type: !6)
!23 = !DILocation(line: 42, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 43, type: !6)
!25 = !DILocation(line: 43, column: 12, scope: !19)
!26 = !DILocation(line: 43, column: 36, scope: !19)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 44, type: !6)
!28 = !DILocation(line: 44, column: 12, scope: !19)
!29 = !DILocation(line: 44, column: 37, scope: !19)
!30 = !DILocation(line: 47, column: 12, scope: !19)
!31 = !DILocation(line: 47, column: 10, scope: !19)
!32 = !DILocation(line: 48, column: 5, scope: !19)
!33 = !DILocation(line: 48, column: 13, scope: !19)
!34 = !DILocation(line: 49, column: 78, scope: !19)
!35 = !DILocation(line: 49, column: 76, scope: !19)
!36 = !DILocation(line: 50, column: 5, scope: !19)
!37 = !DILocation(line: 51, column: 1, scope: !19)
!38 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_45_good", scope: !12, file: !12, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 86, column: 5, scope: !38)
!40 = !DILocation(line: 87, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !42, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !12, line: 98, type: !44)
!47 = !DILocation(line: 98, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !12, line: 98, type: !45)
!49 = !DILocation(line: 98, column: 27, scope: !41)
!50 = !DILocation(line: 101, column: 22, scope: !41)
!51 = !DILocation(line: 101, column: 12, scope: !41)
!52 = !DILocation(line: 101, column: 5, scope: !41)
!53 = !DILocation(line: 103, column: 5, scope: !41)
!54 = !DILocation(line: 104, column: 5, scope: !41)
!55 = !DILocation(line: 105, column: 5, scope: !41)
!56 = !DILocation(line: 108, column: 5, scope: !41)
!57 = !DILocation(line: 109, column: 5, scope: !41)
!58 = !DILocation(line: 110, column: 5, scope: !41)
!59 = !DILocation(line: 112, column: 5, scope: !41)
!60 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocalVariable(name: "data", scope: !60, file: !12, line: 28, type: !6)
!62 = !DILocation(line: 28, column: 12, scope: !60)
!63 = !DILocation(line: 28, column: 19, scope: !60)
!64 = !DILocalVariable(name: "source", scope: !65, file: !12, line: 30, type: !66)
!65 = distinct !DILexicalBlock(scope: !60, file: !12, line: 29, column: 5)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 100)
!69 = !DILocation(line: 30, column: 14, scope: !65)
!70 = !DILocation(line: 31, column: 9, scope: !65)
!71 = !DILocation(line: 32, column: 9, scope: !65)
!72 = !DILocation(line: 32, column: 23, scope: !65)
!73 = !DILocation(line: 34, column: 17, scope: !65)
!74 = !DILocation(line: 34, column: 23, scope: !65)
!75 = !DILocation(line: 34, column: 9, scope: !65)
!76 = !DILocation(line: 35, column: 9, scope: !65)
!77 = !DILocation(line: 35, column: 21, scope: !65)
!78 = !DILocation(line: 36, column: 19, scope: !65)
!79 = !DILocation(line: 36, column: 9, scope: !65)
!80 = !DILocation(line: 38, column: 1, scope: !60)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 72, type: !20, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 74, type: !6)
!83 = !DILocation(line: 74, column: 12, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !12, line: 75, type: !6)
!85 = !DILocation(line: 75, column: 12, scope: !81)
!86 = !DILocation(line: 75, column: 36, scope: !81)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !12, line: 76, type: !6)
!88 = !DILocation(line: 76, column: 12, scope: !81)
!89 = !DILocation(line: 76, column: 37, scope: !81)
!90 = !DILocation(line: 78, column: 12, scope: !81)
!91 = !DILocation(line: 78, column: 10, scope: !81)
!92 = !DILocation(line: 79, column: 5, scope: !81)
!93 = !DILocation(line: 79, column: 13, scope: !81)
!94 = !DILocation(line: 80, column: 82, scope: !81)
!95 = !DILocation(line: 80, column: 80, scope: !81)
!96 = !DILocation(line: 81, column: 5, scope: !81)
!97 = !DILocation(line: 82, column: 1, scope: !81)
!98 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 60, type: !6)
!100 = !DILocation(line: 60, column: 12, scope: !98)
!101 = !DILocation(line: 60, column: 19, scope: !98)
!102 = !DILocalVariable(name: "source", scope: !103, file: !12, line: 62, type: !66)
!103 = distinct !DILexicalBlock(scope: !98, file: !12, line: 61, column: 5)
!104 = !DILocation(line: 62, column: 14, scope: !103)
!105 = !DILocation(line: 63, column: 9, scope: !103)
!106 = !DILocation(line: 64, column: 9, scope: !103)
!107 = !DILocation(line: 64, column: 23, scope: !103)
!108 = !DILocation(line: 66, column: 17, scope: !103)
!109 = !DILocation(line: 66, column: 23, scope: !103)
!110 = !DILocation(line: 66, column: 9, scope: !103)
!111 = !DILocation(line: 67, column: 9, scope: !103)
!112 = !DILocation(line: 67, column: 21, scope: !103)
!113 = !DILocation(line: 68, column: 19, scope: !103)
!114 = !DILocation(line: 68, column: 9, scope: !103)
!115 = !DILocation(line: 70, column: 1, scope: !98)
