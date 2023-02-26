; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_02_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  %0 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !38
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx2, align 1, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  %2 = load i8*, i8** %data, align 8, !dbg !42
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !42
  %call = call i8* @__strncat_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef 100, i64 noundef %3) #5, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* noundef %4), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_02_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_02_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_02_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !76
  store i8* %arraydecay, i8** %data, align 8, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !85
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !86
  store i8 0, i8* %arrayidx2, align 1, !dbg !87
  %1 = load i8*, i8** %data, align 8, !dbg !88
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !88
  %2 = load i8*, i8** %data, align 8, !dbg !88
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !88
  %call = call i8* @__strncat_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef 100, i64 noundef %3) #5, !dbg !88
  %4 = load i8*, i8** %data, align 8, !dbg !89
  call void @printLine(i8* noundef %4), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i8* %arraydecay, i8** %data, align 8, !dbg !102
  %0 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !108
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx2, align 1, !dbg !110
  %1 = load i8*, i8** %data, align 8, !dbg !111
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  %2 = load i8*, i8** %data, align 8, !dbg !111
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !111
  %call = call i8* @__strncat_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef 100, i64 noundef %3) #5, !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  call void @printLine(i8* noundef %4), !dbg !113
  ret void, !dbg !114
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_02_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 10, scope: !11)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 29, column: 5)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 9, scope: !31)
!35 = !DILocation(line: 33, column: 17, scope: !31)
!36 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 36, type: !26)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!38 = !DILocation(line: 36, column: 14, scope: !37)
!39 = !DILocation(line: 37, column: 9, scope: !37)
!40 = !DILocation(line: 38, column: 9, scope: !37)
!41 = !DILocation(line: 38, column: 23, scope: !37)
!42 = !DILocation(line: 40, column: 9, scope: !37)
!43 = !DILocation(line: 41, column: 19, scope: !37)
!44 = !DILocation(line: 41, column: 9, scope: !37)
!45 = !DILocation(line: 43, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncat_02_good", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!47 = !DILocation(line: 100, column: 5, scope: !46)
!48 = !DILocation(line: 101, column: 5, scope: !46)
!49 = !DILocation(line: 102, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 114, type: !51, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 114, type: !53)
!56 = !DILocation(line: 114, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 114, type: !54)
!58 = !DILocation(line: 114, column: 27, scope: !50)
!59 = !DILocation(line: 117, column: 22, scope: !50)
!60 = !DILocation(line: 117, column: 12, scope: !50)
!61 = !DILocation(line: 117, column: 5, scope: !50)
!62 = !DILocation(line: 119, column: 5, scope: !50)
!63 = !DILocation(line: 120, column: 5, scope: !50)
!64 = !DILocation(line: 121, column: 5, scope: !50)
!65 = !DILocation(line: 124, column: 5, scope: !50)
!66 = !DILocation(line: 125, column: 5, scope: !50)
!67 = !DILocation(line: 126, column: 5, scope: !50)
!68 = !DILocation(line: 128, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 52, type: !17)
!71 = !DILocation(line: 52, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !12, line: 53, type: !21)
!73 = !DILocation(line: 53, column: 10, scope: !69)
!74 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !12, line: 54, type: !26)
!75 = !DILocation(line: 54, column: 10, scope: !69)
!76 = !DILocation(line: 63, column: 16, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !12, line: 61, column: 5)
!78 = distinct !DILexicalBlock(scope: !69, file: !12, line: 55, column: 8)
!79 = !DILocation(line: 63, column: 14, scope: !77)
!80 = !DILocation(line: 64, column: 9, scope: !77)
!81 = !DILocation(line: 64, column: 17, scope: !77)
!82 = !DILocalVariable(name: "source", scope: !83, file: !12, line: 67, type: !26)
!83 = distinct !DILexicalBlock(scope: !69, file: !12, line: 66, column: 5)
!84 = !DILocation(line: 67, column: 14, scope: !83)
!85 = !DILocation(line: 68, column: 9, scope: !83)
!86 = !DILocation(line: 69, column: 9, scope: !83)
!87 = !DILocation(line: 69, column: 23, scope: !83)
!88 = !DILocation(line: 71, column: 9, scope: !83)
!89 = !DILocation(line: 72, column: 19, scope: !83)
!90 = !DILocation(line: 72, column: 9, scope: !83)
!91 = !DILocation(line: 74, column: 1, scope: !69)
!92 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 79, type: !17)
!94 = !DILocation(line: 79, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !12, line: 80, type: !21)
!96 = !DILocation(line: 80, column: 10, scope: !92)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !12, line: 81, type: !26)
!98 = !DILocation(line: 81, column: 10, scope: !92)
!99 = !DILocation(line: 85, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !12, line: 83, column: 5)
!101 = distinct !DILexicalBlock(scope: !92, file: !12, line: 82, column: 8)
!102 = !DILocation(line: 85, column: 14, scope: !100)
!103 = !DILocation(line: 86, column: 9, scope: !100)
!104 = !DILocation(line: 86, column: 17, scope: !100)
!105 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 89, type: !26)
!106 = distinct !DILexicalBlock(scope: !92, file: !12, line: 88, column: 5)
!107 = !DILocation(line: 89, column: 14, scope: !106)
!108 = !DILocation(line: 90, column: 9, scope: !106)
!109 = !DILocation(line: 91, column: 9, scope: !106)
!110 = !DILocation(line: 91, column: 23, scope: !106)
!111 = !DILocation(line: 93, column: 9, scope: !106)
!112 = !DILocation(line: 94, column: 19, scope: !106)
!113 = !DILocation(line: 94, column: 9, scope: !106)
!114 = !DILocation(line: 96, column: 1, scope: !92)
