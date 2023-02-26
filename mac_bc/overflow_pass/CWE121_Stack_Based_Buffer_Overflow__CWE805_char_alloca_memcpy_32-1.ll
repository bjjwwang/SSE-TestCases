; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_32_bad() #0 !dbg !13 {
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
  %call = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %arraydecay4, i64 noundef 100, i64 noundef %12) #5, !dbg !57
  %13 = load i8*, i8** %data2, align 8, !dbg !58
  %arrayidx5 = getelementptr inbounds i8, i8* %13, i64 99, !dbg !58
  store i8 0, i8* %arrayidx5, align 1, !dbg !59
  %14 = load i8*, i8** %data2, align 8, !dbg !60
  call void @printLine(i8* noundef %14), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_32_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* noundef null), !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 noundef %conv), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_32_good(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_32_bad(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 50, align 16, !dbg !93
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %1 = alloca i8, i64 100, align 16, !dbg !96
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !97, metadata !DIExpression()), !dbg !99
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !100
  %3 = load i8*, i8** %2, align 8, !dbg !101
  store i8* %3, i8** %data1, align 8, !dbg !99
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !102
  store i8* %4, i8** %data1, align 8, !dbg !103
  %5 = load i8*, i8** %data1, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %6 = load i8*, i8** %data1, align 8, !dbg !106
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !107
  store i8* %6, i8** %7, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !109, metadata !DIExpression()), !dbg !111
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !112
  %9 = load i8*, i8** %8, align 8, !dbg !113
  store i8* %9, i8** %data2, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !117
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx3, align 1, !dbg !119
  %10 = load i8*, i8** %data2, align 8, !dbg !120
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  %11 = load i8*, i8** %data2, align 8, !dbg !120
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !120
  %call = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %arraydecay4, i64 noundef 100, i64 noundef %12) #5, !dbg !120
  %13 = load i8*, i8** %data2, align 8, !dbg !121
  %arrayidx5 = getelementptr inbounds i8, i8* %13, i64 99, !dbg !121
  store i8 0, i8* %arrayidx5, align 1, !dbg !122
  %14 = load i8*, i8** %data2, align 8, !dbg !123
  call void @printLine(i8* noundef %14), !dbg !124
  ret void, !dbg !125
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!58 = !DILocation(line: 46, column: 13, scope: !49)
!59 = !DILocation(line: 46, column: 25, scope: !49)
!60 = !DILocation(line: 47, column: 23, scope: !49)
!61 = !DILocation(line: 47, column: 13, scope: !49)
!62 = !DILocation(line: 50, column: 1, scope: !13)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_32_good", scope: !14, file: !14, line: 85, type: !15, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!64 = !DILocation(line: 87, column: 5, scope: !63)
!65 = !DILocation(line: 88, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 99, type: !67, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !21}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !14, line: 99, type: !69)
!71 = !DILocation(line: 99, column: 14, scope: !66)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !14, line: 99, type: !21)
!73 = !DILocation(line: 99, column: 27, scope: !66)
!74 = !DILocation(line: 102, column: 22, scope: !66)
!75 = !DILocation(line: 102, column: 12, scope: !66)
!76 = !DILocation(line: 102, column: 5, scope: !66)
!77 = !DILocation(line: 104, column: 5, scope: !66)
!78 = !DILocation(line: 105, column: 5, scope: !66)
!79 = !DILocation(line: 106, column: 5, scope: !66)
!80 = !DILocation(line: 109, column: 5, scope: !66)
!81 = !DILocation(line: 110, column: 5, scope: !66)
!82 = !DILocation(line: 111, column: 5, scope: !66)
!83 = !DILocation(line: 113, column: 5, scope: !66)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!85 = !DILocalVariable(name: "data", scope: !84, file: !14, line: 59, type: !3)
!86 = !DILocation(line: 59, column: 12, scope: !84)
!87 = !DILocalVariable(name: "dataPtr1", scope: !84, file: !14, line: 60, type: !21)
!88 = !DILocation(line: 60, column: 13, scope: !84)
!89 = !DILocalVariable(name: "dataPtr2", scope: !84, file: !14, line: 61, type: !21)
!90 = !DILocation(line: 61, column: 13, scope: !84)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !14, line: 62, type: !3)
!92 = !DILocation(line: 62, column: 12, scope: !84)
!93 = !DILocation(line: 62, column: 36, scope: !84)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !14, line: 63, type: !3)
!95 = !DILocation(line: 63, column: 12, scope: !84)
!96 = !DILocation(line: 63, column: 37, scope: !84)
!97 = !DILocalVariable(name: "data", scope: !98, file: !14, line: 65, type: !3)
!98 = distinct !DILexicalBlock(scope: !84, file: !14, line: 64, column: 5)
!99 = !DILocation(line: 65, column: 16, scope: !98)
!100 = !DILocation(line: 65, column: 24, scope: !98)
!101 = !DILocation(line: 65, column: 23, scope: !98)
!102 = !DILocation(line: 67, column: 16, scope: !98)
!103 = !DILocation(line: 67, column: 14, scope: !98)
!104 = !DILocation(line: 68, column: 9, scope: !98)
!105 = !DILocation(line: 68, column: 17, scope: !98)
!106 = !DILocation(line: 69, column: 21, scope: !98)
!107 = !DILocation(line: 69, column: 10, scope: !98)
!108 = !DILocation(line: 69, column: 19, scope: !98)
!109 = !DILocalVariable(name: "data", scope: !110, file: !14, line: 72, type: !3)
!110 = distinct !DILexicalBlock(scope: !84, file: !14, line: 71, column: 5)
!111 = !DILocation(line: 72, column: 16, scope: !110)
!112 = !DILocation(line: 72, column: 24, scope: !110)
!113 = !DILocation(line: 72, column: 23, scope: !110)
!114 = !DILocalVariable(name: "source", scope: !115, file: !14, line: 74, type: !50)
!115 = distinct !DILexicalBlock(scope: !110, file: !14, line: 73, column: 9)
!116 = !DILocation(line: 74, column: 18, scope: !115)
!117 = !DILocation(line: 75, column: 13, scope: !115)
!118 = !DILocation(line: 76, column: 13, scope: !115)
!119 = !DILocation(line: 76, column: 27, scope: !115)
!120 = !DILocation(line: 78, column: 13, scope: !115)
!121 = !DILocation(line: 79, column: 13, scope: !115)
!122 = !DILocation(line: 79, column: 25, scope: !115)
!123 = !DILocation(line: 80, column: 23, scope: !115)
!124 = !DILocation(line: 80, column: 13, scope: !115)
!125 = !DILocation(line: 83, column: 1, scope: !84)
