; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_06_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  store i8* %2, i8** %data, align 8, !dbg !29
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx1, align 1, !dbg !40
  %4 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  %5 = load i8*, i8** %data, align 8, !dbg !41
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !41
  %call = call i8* @__strcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef %6) #5, !dbg !41
  %7 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* noundef %7), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_06_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* noundef null), !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 noundef %conv), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_06_good(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_06_bad(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = alloca i8, i64 50, align 16, !dbg !73
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %1 = alloca i8, i64 100, align 16, !dbg !76
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !75
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !77
  store i8* %2, i8** %data, align 8, !dbg !80
  %3 = load i8*, i8** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !86
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !87
  store i8 0, i8* %arrayidx1, align 1, !dbg !88
  %4 = load i8*, i8** %data, align 8, !dbg !89
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !89
  %5 = load i8*, i8** %data, align 8, !dbg !89
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !89
  %call = call i8* @__strcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef %6) #5, !dbg !89
  %7 = load i8*, i8** %data, align 8, !dbg !90
  call void @printLine(i8* noundef %7), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 50, align 16, !dbg !98
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %1 = alloca i8, i64 100, align 16, !dbg !101
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !100
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !102
  store i8* %2, i8** %data, align 8, !dbg !105
  %3 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !111
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx1, align 1, !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !114
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !114
  %5 = load i8*, i8** %data, align 8, !dbg !114
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !114
  %call = call i8* @__strcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef %6) #5, !dbg !114
  %7 = load i8*, i8** %data, align 8, !dbg !115
  call void @printLine(i8* noundef %7), !dbg !116
  ret void, !dbg !117
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_06_bad", scope: !14, file: !14, line: 27, type: !15, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 29, type: !3)
!19 = !DILocation(line: 29, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 30, type: !3)
!21 = !DILocation(line: 30, column: 12, scope: !13)
!22 = !DILocation(line: 30, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 31, type: !3)
!24 = !DILocation(line: 31, column: 12, scope: !13)
!25 = !DILocation(line: 31, column: 37, scope: !13)
!26 = !DILocation(line: 36, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !14, line: 33, column: 5)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!29 = !DILocation(line: 36, column: 14, scope: !27)
!30 = !DILocation(line: 37, column: 9, scope: !27)
!31 = !DILocation(line: 37, column: 17, scope: !27)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 40, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 40, column: 14, scope: !33)
!38 = !DILocation(line: 41, column: 9, scope: !33)
!39 = !DILocation(line: 42, column: 9, scope: !33)
!40 = !DILocation(line: 42, column: 23, scope: !33)
!41 = !DILocation(line: 44, column: 9, scope: !33)
!42 = !DILocation(line: 45, column: 19, scope: !33)
!43 = !DILocation(line: 45, column: 9, scope: !33)
!44 = !DILocation(line: 47, column: 1, scope: !13)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_06_good", scope: !14, file: !14, line: 102, type: !15, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocation(line: 104, column: 5, scope: !45)
!47 = !DILocation(line: 105, column: 5, scope: !45)
!48 = !DILocation(line: 106, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 118, type: !50, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !14, line: 118, type: !52)
!55 = !DILocation(line: 118, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !14, line: 118, type: !53)
!57 = !DILocation(line: 118, column: 27, scope: !49)
!58 = !DILocation(line: 121, column: 22, scope: !49)
!59 = !DILocation(line: 121, column: 12, scope: !49)
!60 = !DILocation(line: 121, column: 5, scope: !49)
!61 = !DILocation(line: 123, column: 5, scope: !49)
!62 = !DILocation(line: 124, column: 5, scope: !49)
!63 = !DILocation(line: 125, column: 5, scope: !49)
!64 = !DILocation(line: 128, column: 5, scope: !49)
!65 = !DILocation(line: 129, column: 5, scope: !49)
!66 = !DILocation(line: 130, column: 5, scope: !49)
!67 = !DILocation(line: 132, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!69 = !DILocalVariable(name: "data", scope: !68, file: !14, line: 56, type: !3)
!70 = !DILocation(line: 56, column: 12, scope: !68)
!71 = !DILocalVariable(name: "dataBadBuffer", scope: !68, file: !14, line: 57, type: !3)
!72 = !DILocation(line: 57, column: 12, scope: !68)
!73 = !DILocation(line: 57, column: 36, scope: !68)
!74 = !DILocalVariable(name: "dataGoodBuffer", scope: !68, file: !14, line: 58, type: !3)
!75 = !DILocation(line: 58, column: 12, scope: !68)
!76 = !DILocation(line: 58, column: 37, scope: !68)
!77 = !DILocation(line: 67, column: 16, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !14, line: 65, column: 5)
!79 = distinct !DILexicalBlock(scope: !68, file: !14, line: 59, column: 8)
!80 = !DILocation(line: 67, column: 14, scope: !78)
!81 = !DILocation(line: 68, column: 9, scope: !78)
!82 = !DILocation(line: 68, column: 17, scope: !78)
!83 = !DILocalVariable(name: "source", scope: !84, file: !14, line: 71, type: !34)
!84 = distinct !DILexicalBlock(scope: !68, file: !14, line: 70, column: 5)
!85 = !DILocation(line: 71, column: 14, scope: !84)
!86 = !DILocation(line: 72, column: 9, scope: !84)
!87 = !DILocation(line: 73, column: 9, scope: !84)
!88 = !DILocation(line: 73, column: 23, scope: !84)
!89 = !DILocation(line: 75, column: 9, scope: !84)
!90 = !DILocation(line: 76, column: 19, scope: !84)
!91 = !DILocation(line: 76, column: 9, scope: !84)
!92 = !DILocation(line: 78, column: 1, scope: !68)
!93 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!94 = !DILocalVariable(name: "data", scope: !93, file: !14, line: 83, type: !3)
!95 = !DILocation(line: 83, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !14, line: 84, type: !3)
!97 = !DILocation(line: 84, column: 12, scope: !93)
!98 = !DILocation(line: 84, column: 36, scope: !93)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !14, line: 85, type: !3)
!100 = !DILocation(line: 85, column: 12, scope: !93)
!101 = !DILocation(line: 85, column: 37, scope: !93)
!102 = !DILocation(line: 89, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !14, line: 87, column: 5)
!104 = distinct !DILexicalBlock(scope: !93, file: !14, line: 86, column: 8)
!105 = !DILocation(line: 89, column: 14, scope: !103)
!106 = !DILocation(line: 90, column: 9, scope: !103)
!107 = !DILocation(line: 90, column: 17, scope: !103)
!108 = !DILocalVariable(name: "source", scope: !109, file: !14, line: 93, type: !34)
!109 = distinct !DILexicalBlock(scope: !93, file: !14, line: 92, column: 5)
!110 = !DILocation(line: 93, column: 14, scope: !109)
!111 = !DILocation(line: 94, column: 9, scope: !109)
!112 = !DILocation(line: 95, column: 9, scope: !109)
!113 = !DILocation(line: 95, column: 23, scope: !109)
!114 = !DILocation(line: 97, column: 9, scope: !109)
!115 = !DILocation(line: 98, column: 19, scope: !109)
!116 = !DILocation(line: 98, column: 9, scope: !109)
!117 = !DILocation(line: 100, column: 1, scope: !93)
