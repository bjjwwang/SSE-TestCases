; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_goodG2BData = internal global i8* null, align 8, !dbg !8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %1 = load i8*, i8** %data, align 8, !dbg !38
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #5, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #5, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_badData, align 8, !dbg !67
  store i8* %0, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !68, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !71
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %1 = load i8*, i8** %data, align 8, !dbg !74
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !75
  %call = call i8* @strncat(i8* %1, i8* %arraydecay1, i64 100) #5, !dbg !76
  %2 = load i8*, i8** %data, align 8, !dbg !77
  call void @printLine(i8* %2), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i8* %arraydecay, i8** %data, align 8, !dbg !88
  %0 = load i8*, i8** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  %1 = load i8*, i8** %data, align 8, !dbg !91
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_goodG2BData, align 8, !dbg !92
  call void @goodG2BSink(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_goodG2BData, align 8, !dbg !98
  store i8* %0, i8** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !102
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %1 = load i8*, i8** %data, align 8, !dbg !105
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !106
  %call = call i8* @strncat(i8* %1, i8* %arraydecay1, i64 100) #5, !dbg !107
  %2 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %2), !dbg !109
  ret void, !dbg !110
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
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_bad", scope: !10, file: !10, line: 39, type: !20, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 41, type: !11)
!23 = !DILocation(line: 41, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !10, line: 42, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 42, column: 10, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !10, line: 43, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 43, column: 10, scope: !19)
!34 = !DILocation(line: 46, column: 12, scope: !19)
!35 = !DILocation(line: 46, column: 10, scope: !19)
!36 = !DILocation(line: 47, column: 5, scope: !19)
!37 = !DILocation(line: 47, column: 13, scope: !19)
!38 = !DILocation(line: 48, column: 79, scope: !19)
!39 = !DILocation(line: 48, column: 77, scope: !19)
!40 = !DILocation(line: 49, column: 5, scope: !19)
!41 = !DILocation(line: 50, column: 1, scope: !19)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_45_good", scope: !10, file: !10, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 84, column: 5, scope: !42)
!44 = !DILocation(line: 85, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 96, type: !46, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !10, line: 96, type: !48)
!51 = !DILocation(line: 96, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !10, line: 96, type: !49)
!53 = !DILocation(line: 96, column: 27, scope: !45)
!54 = !DILocation(line: 99, column: 22, scope: !45)
!55 = !DILocation(line: 99, column: 12, scope: !45)
!56 = !DILocation(line: 99, column: 5, scope: !45)
!57 = !DILocation(line: 101, column: 5, scope: !45)
!58 = !DILocation(line: 102, column: 5, scope: !45)
!59 = !DILocation(line: 103, column: 5, scope: !45)
!60 = !DILocation(line: 106, column: 5, scope: !45)
!61 = !DILocation(line: 107, column: 5, scope: !45)
!62 = !DILocation(line: 108, column: 5, scope: !45)
!63 = !DILocation(line: 110, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 28, type: !11)
!66 = !DILocation(line: 28, column: 12, scope: !64)
!67 = !DILocation(line: 28, column: 19, scope: !64)
!68 = !DILocalVariable(name: "source", scope: !69, file: !10, line: 30, type: !30)
!69 = distinct !DILexicalBlock(scope: !64, file: !10, line: 29, column: 5)
!70 = !DILocation(line: 30, column: 14, scope: !69)
!71 = !DILocation(line: 31, column: 9, scope: !69)
!72 = !DILocation(line: 32, column: 9, scope: !69)
!73 = !DILocation(line: 32, column: 23, scope: !69)
!74 = !DILocation(line: 34, column: 17, scope: !69)
!75 = !DILocation(line: 34, column: 23, scope: !69)
!76 = !DILocation(line: 34, column: 9, scope: !69)
!77 = !DILocation(line: 35, column: 19, scope: !69)
!78 = !DILocation(line: 35, column: 9, scope: !69)
!79 = !DILocation(line: 37, column: 1, scope: !64)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 70, type: !20, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !10, line: 72, type: !11)
!82 = !DILocation(line: 72, column: 12, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !10, line: 73, type: !25)
!84 = !DILocation(line: 73, column: 10, scope: !80)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !10, line: 74, type: !30)
!86 = !DILocation(line: 74, column: 10, scope: !80)
!87 = !DILocation(line: 76, column: 12, scope: !80)
!88 = !DILocation(line: 76, column: 10, scope: !80)
!89 = !DILocation(line: 77, column: 5, scope: !80)
!90 = !DILocation(line: 77, column: 13, scope: !80)
!91 = !DILocation(line: 78, column: 83, scope: !80)
!92 = !DILocation(line: 78, column: 81, scope: !80)
!93 = !DILocation(line: 79, column: 5, scope: !80)
!94 = !DILocation(line: 80, column: 1, scope: !80)
!95 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !10, line: 59, type: !11)
!97 = !DILocation(line: 59, column: 12, scope: !95)
!98 = !DILocation(line: 59, column: 19, scope: !95)
!99 = !DILocalVariable(name: "source", scope: !100, file: !10, line: 61, type: !30)
!100 = distinct !DILexicalBlock(scope: !95, file: !10, line: 60, column: 5)
!101 = !DILocation(line: 61, column: 14, scope: !100)
!102 = !DILocation(line: 62, column: 9, scope: !100)
!103 = !DILocation(line: 63, column: 9, scope: !100)
!104 = !DILocation(line: 63, column: 23, scope: !100)
!105 = !DILocation(line: 65, column: 17, scope: !100)
!106 = !DILocation(line: 65, column: 23, scope: !100)
!107 = !DILocation(line: 65, column: 9, scope: !100)
!108 = !DILocation(line: 66, column: 19, scope: !100)
!109 = !DILocation(line: 66, column: 9, scope: !100)
!110 = !DILocation(line: 68, column: 1, scope: !95)
