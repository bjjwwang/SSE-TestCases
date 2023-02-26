; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_badSink(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !25
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  %0 = load i8*, i8** %data.addr, align 8, !dbg !28
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !29
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #5, !dbg !30
  %1 = load i8*, i8** %data.addr, align 8, !dbg !31
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !31
  store i8 0, i8* %arrayidx2, align 1, !dbg !32
  %2 = load i8*, i8** %data.addr, align 8, !dbg !33
  call void @printLine(i8* %2), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_bad() #0 !dbg !36 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = alloca i8, i64 50, align 16, !dbg !43
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !44, metadata !DIExpression()), !dbg !45
  %1 = alloca i8, i64 100, align 16, !dbg !46
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !45
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !47
  store i8* %2, i8** %data, align 8, !dbg !48
  %3 = load i8*, i8** %data, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !49
  store i8 0, i8* %arrayidx, align 1, !dbg !50
  %4 = load i8*, i8** %data, align 8, !dbg !51
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_badSink(i8* %4), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_goodG2BSink(i8* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !57, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !60
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !61
  store i8 0, i8* %arrayidx, align 1, !dbg !62
  %0 = load i8*, i8** %data.addr, align 8, !dbg !63
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !64
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #5, !dbg !65
  %1 = load i8*, i8** %data.addr, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !66
  store i8 0, i8* %arrayidx2, align 1, !dbg !67
  %2 = load i8*, i8** %data.addr, align 8, !dbg !68
  call void @printLine(i8* %2), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 50, align 16, !dbg !98
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %1 = alloca i8, i64 100, align 16, !dbg !101
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !100
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !102
  store i8* %2, i8** %data, align 8, !dbg !103
  %3 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %4 = load i8*, i8** %data, align 8, !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_goodG2BSink(i8* %4), !dbg !107
  ret void, !dbg !108
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41-1.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 84, scope: !13)
!19 = !DILocalVariable(name: "source", scope: !20, file: !14, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 14, scope: !20)
!25 = !DILocation(line: 27, column: 9, scope: !20)
!26 = !DILocation(line: 28, column: 9, scope: !20)
!27 = !DILocation(line: 28, column: 23, scope: !20)
!28 = !DILocation(line: 30, column: 17, scope: !20)
!29 = !DILocation(line: 30, column: 23, scope: !20)
!30 = !DILocation(line: 30, column: 9, scope: !20)
!31 = !DILocation(line: 31, column: 9, scope: !20)
!32 = !DILocation(line: 31, column: 21, scope: !20)
!33 = !DILocation(line: 32, column: 19, scope: !20)
!34 = !DILocation(line: 32, column: 9, scope: !20)
!35 = !DILocation(line: 34, column: 1, scope: !13)
!36 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_bad", scope: !14, file: !14, line: 36, type: !37, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !14, line: 38, type: !4)
!40 = !DILocation(line: 38, column: 12, scope: !36)
!41 = !DILocalVariable(name: "dataBadBuffer", scope: !36, file: !14, line: 39, type: !4)
!42 = !DILocation(line: 39, column: 12, scope: !36)
!43 = !DILocation(line: 39, column: 36, scope: !36)
!44 = !DILocalVariable(name: "dataGoodBuffer", scope: !36, file: !14, line: 40, type: !4)
!45 = !DILocation(line: 40, column: 12, scope: !36)
!46 = !DILocation(line: 40, column: 37, scope: !36)
!47 = !DILocation(line: 43, column: 12, scope: !36)
!48 = !DILocation(line: 43, column: 10, scope: !36)
!49 = !DILocation(line: 44, column: 5, scope: !36)
!50 = !DILocation(line: 44, column: 13, scope: !36)
!51 = !DILocation(line: 45, column: 76, scope: !36)
!52 = !DILocation(line: 45, column: 5, scope: !36)
!53 = !DILocation(line: 46, column: 1, scope: !36)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_goodG2BSink", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !14, line: 52, type: !4)
!56 = !DILocation(line: 52, column: 88, scope: !54)
!57 = !DILocalVariable(name: "source", scope: !58, file: !14, line: 55, type: !21)
!58 = distinct !DILexicalBlock(scope: !54, file: !14, line: 54, column: 5)
!59 = !DILocation(line: 55, column: 14, scope: !58)
!60 = !DILocation(line: 56, column: 9, scope: !58)
!61 = !DILocation(line: 57, column: 9, scope: !58)
!62 = !DILocation(line: 57, column: 23, scope: !58)
!63 = !DILocation(line: 59, column: 17, scope: !58)
!64 = !DILocation(line: 59, column: 23, scope: !58)
!65 = !DILocation(line: 59, column: 9, scope: !58)
!66 = !DILocation(line: 60, column: 9, scope: !58)
!67 = !DILocation(line: 60, column: 21, scope: !58)
!68 = !DILocation(line: 61, column: 19, scope: !58)
!69 = !DILocation(line: 61, column: 9, scope: !58)
!70 = !DILocation(line: 63, column: 1, scope: !54)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_41_good", scope: !14, file: !14, line: 77, type: !37, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 79, column: 5, scope: !71)
!73 = !DILocation(line: 80, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 92, type: !75, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !14, line: 92, type: !77)
!80 = !DILocation(line: 92, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !14, line: 92, type: !78)
!82 = !DILocation(line: 92, column: 27, scope: !74)
!83 = !DILocation(line: 95, column: 22, scope: !74)
!84 = !DILocation(line: 95, column: 12, scope: !74)
!85 = !DILocation(line: 95, column: 5, scope: !74)
!86 = !DILocation(line: 97, column: 5, scope: !74)
!87 = !DILocation(line: 98, column: 5, scope: !74)
!88 = !DILocation(line: 99, column: 5, scope: !74)
!89 = !DILocation(line: 102, column: 5, scope: !74)
!90 = !DILocation(line: 103, column: 5, scope: !74)
!91 = !DILocation(line: 104, column: 5, scope: !74)
!92 = !DILocation(line: 106, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 66, type: !37, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !14, line: 68, type: !4)
!95 = !DILocation(line: 68, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !14, line: 69, type: !4)
!97 = !DILocation(line: 69, column: 12, scope: !93)
!98 = !DILocation(line: 69, column: 36, scope: !93)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !14, line: 70, type: !4)
!100 = !DILocation(line: 70, column: 12, scope: !93)
!101 = !DILocation(line: 70, column: 37, scope: !93)
!102 = !DILocation(line: 72, column: 12, scope: !93)
!103 = !DILocation(line: 72, column: 10, scope: !93)
!104 = !DILocation(line: 73, column: 5, scope: !93)
!105 = !DILocation(line: 73, column: 13, scope: !93)
!106 = !DILocation(line: 74, column: 80, scope: !93)
!107 = !DILocation(line: 74, column: 5, scope: !93)
!108 = !DILocation(line: 75, column: 1, scope: !93)
