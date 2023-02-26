; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  store i8* %2, i8** %data, align 8, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !37
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !38
  %add = add i64 %call, 1, !dbg !39
  %mul = mul i64 %add, 1, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !36
  %6 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* %6), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #7, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #7, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = alloca i8, i64 10, align 16, !dbg !72
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %1 = alloca i8, i64 11, align 16, !dbg !75
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !74
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !76
  store i8* %2, i8** %data, align 8, !dbg !77
  %3 = load i8*, i8** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !82
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !82
  %5 = load i8*, i8** %data, align 8, !dbg !83
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !84
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !85
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !86
  %add = add i64 %call, 1, !dbg !87
  %mul = mul i64 %add, 1, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !84
  %6 = load i8*, i8** %data, align 8, !dbg !89
  call void @printLine(i8* %6), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 10, align 16, !dbg !97
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %1 = alloca i8, i64 11, align 16, !dbg !100
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !99
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !101
  store i8* %2, i8** %data, align 8, !dbg !102
  %3 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !107
  %5 = load i8*, i8** %data, align 8, !dbg !108
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !109
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !110
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !111
  %add = add i64 %call, 1, !dbg !112
  %mul = mul i64 %add, 1, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !109
  %6 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* %6), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15-1.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 38, column: 16, scope: !13)
!26 = !DILocation(line: 38, column: 14, scope: !13)
!27 = !DILocation(line: 39, column: 9, scope: !13)
!28 = !DILocation(line: 39, column: 17, scope: !13)
!29 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 47, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 46, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 47, column: 14, scope: !30)
!35 = !DILocation(line: 50, column: 16, scope: !30)
!36 = !DILocation(line: 50, column: 9, scope: !30)
!37 = !DILocation(line: 50, column: 38, scope: !30)
!38 = !DILocation(line: 50, column: 31, scope: !30)
!39 = !DILocation(line: 50, column: 46, scope: !30)
!40 = !DILocation(line: 50, column: 51, scope: !30)
!41 = !DILocation(line: 51, column: 19, scope: !30)
!42 = !DILocation(line: 51, column: 9, scope: !30)
!43 = !DILocation(line: 53, column: 1, scope: !13)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_15_good", scope: !14, file: !14, line: 115, type: !15, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 117, column: 5, scope: !44)
!46 = !DILocation(line: 118, column: 5, scope: !44)
!47 = !DILocation(line: 119, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 131, type: !49, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !14, line: 131, type: !51)
!54 = !DILocation(line: 131, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !14, line: 131, type: !52)
!56 = !DILocation(line: 131, column: 27, scope: !48)
!57 = !DILocation(line: 134, column: 22, scope: !48)
!58 = !DILocation(line: 134, column: 12, scope: !48)
!59 = !DILocation(line: 134, column: 5, scope: !48)
!60 = !DILocation(line: 136, column: 5, scope: !48)
!61 = !DILocation(line: 137, column: 5, scope: !48)
!62 = !DILocation(line: 138, column: 5, scope: !48)
!63 = !DILocation(line: 141, column: 5, scope: !48)
!64 = !DILocation(line: 142, column: 5, scope: !48)
!65 = !DILocation(line: 143, column: 5, scope: !48)
!66 = !DILocation(line: 145, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !14, line: 62, type: !4)
!69 = !DILocation(line: 62, column: 12, scope: !67)
!70 = !DILocalVariable(name: "dataBadBuffer", scope: !67, file: !14, line: 63, type: !4)
!71 = !DILocation(line: 63, column: 12, scope: !67)
!72 = !DILocation(line: 63, column: 36, scope: !67)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !67, file: !14, line: 64, type: !4)
!74 = !DILocation(line: 64, column: 12, scope: !67)
!75 = !DILocation(line: 64, column: 37, scope: !67)
!76 = !DILocation(line: 74, column: 16, scope: !67)
!77 = !DILocation(line: 74, column: 14, scope: !67)
!78 = !DILocation(line: 75, column: 9, scope: !67)
!79 = !DILocation(line: 75, column: 17, scope: !67)
!80 = !DILocalVariable(name: "source", scope: !81, file: !14, line: 79, type: !31)
!81 = distinct !DILexicalBlock(scope: !67, file: !14, line: 78, column: 5)
!82 = !DILocation(line: 79, column: 14, scope: !81)
!83 = !DILocation(line: 82, column: 16, scope: !81)
!84 = !DILocation(line: 82, column: 9, scope: !81)
!85 = !DILocation(line: 82, column: 38, scope: !81)
!86 = !DILocation(line: 82, column: 31, scope: !81)
!87 = !DILocation(line: 82, column: 46, scope: !81)
!88 = !DILocation(line: 82, column: 51, scope: !81)
!89 = !DILocation(line: 83, column: 19, scope: !81)
!90 = !DILocation(line: 83, column: 9, scope: !81)
!91 = !DILocation(line: 85, column: 1, scope: !67)
!92 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 90, type: !4)
!94 = !DILocation(line: 90, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !14, line: 91, type: !4)
!96 = !DILocation(line: 91, column: 12, scope: !92)
!97 = !DILocation(line: 91, column: 36, scope: !92)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !14, line: 92, type: !4)
!99 = !DILocation(line: 92, column: 12, scope: !92)
!100 = !DILocation(line: 92, column: 37, scope: !92)
!101 = !DILocation(line: 98, column: 16, scope: !92)
!102 = !DILocation(line: 98, column: 14, scope: !92)
!103 = !DILocation(line: 99, column: 9, scope: !92)
!104 = !DILocation(line: 99, column: 17, scope: !92)
!105 = !DILocalVariable(name: "source", scope: !106, file: !14, line: 107, type: !31)
!106 = distinct !DILexicalBlock(scope: !92, file: !14, line: 106, column: 5)
!107 = !DILocation(line: 107, column: 14, scope: !106)
!108 = !DILocation(line: 110, column: 16, scope: !106)
!109 = !DILocation(line: 110, column: 9, scope: !106)
!110 = !DILocation(line: 110, column: 38, scope: !106)
!111 = !DILocation(line: 110, column: 31, scope: !106)
!112 = !DILocation(line: 110, column: 46, scope: !106)
!113 = !DILocation(line: 110, column: 51, scope: !106)
!114 = !DILocation(line: 111, column: 19, scope: !106)
!115 = !DILocation(line: 111, column: 9, scope: !106)
!116 = !DILocation(line: 113, column: 1, scope: !92)
