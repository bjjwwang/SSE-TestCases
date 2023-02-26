; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_04_bad() #0 !dbg !11 {
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
  %call = call i8* @__memcpy_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef 100, i64 noundef %3) #5, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !43
  store i8 0, i8* %arrayidx4, align 1, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* noundef %5), !dbg !46
  ret void, !dbg !47
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_04_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* noundef null), !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 noundef %conv), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_04_good(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_04_bad(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !78
  store i8* %arraydecay, i8** %data, align 8, !dbg !81
  %0 = load i8*, i8** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !87
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !88
  store i8 0, i8* %arrayidx2, align 1, !dbg !89
  %1 = load i8*, i8** %data, align 8, !dbg !90
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !90
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !90
  %call = call i8* @__memcpy_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef 100, i64 noundef %3) #5, !dbg !90
  %4 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !91
  store i8 0, i8* %arrayidx4, align 1, !dbg !92
  %5 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* noundef %5), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  store i8* %arraydecay, i8** %data, align 8, !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx2, align 1, !dbg !114
  %1 = load i8*, i8** %data, align 8, !dbg !115
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !115
  %2 = load i8*, i8** %data, align 8, !dbg !115
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !115
  %call = call i8* @__memcpy_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef 100, i64 noundef %3) #5, !dbg !115
  %4 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !116
  store i8 0, i8* %arrayidx4, align 1, !dbg !117
  %5 = load i8*, i8** %data, align 8, !dbg !118
  call void @printLine(i8* noundef %5), !dbg !119
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 32, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 33, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 34, column: 10, scope: !11)
!30 = !DILocation(line: 39, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 36, column: 5)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 8)
!33 = !DILocation(line: 39, column: 14, scope: !31)
!34 = !DILocation(line: 40, column: 9, scope: !31)
!35 = !DILocation(line: 40, column: 17, scope: !31)
!36 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 43, type: !26)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 5)
!38 = !DILocation(line: 43, column: 14, scope: !37)
!39 = !DILocation(line: 44, column: 9, scope: !37)
!40 = !DILocation(line: 45, column: 9, scope: !37)
!41 = !DILocation(line: 45, column: 23, scope: !37)
!42 = !DILocation(line: 47, column: 9, scope: !37)
!43 = !DILocation(line: 48, column: 9, scope: !37)
!44 = !DILocation(line: 48, column: 21, scope: !37)
!45 = !DILocation(line: 49, column: 19, scope: !37)
!46 = !DILocation(line: 49, column: 9, scope: !37)
!47 = !DILocation(line: 51, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_04_good", scope: !12, file: !12, line: 108, type: !13, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!49 = !DILocation(line: 110, column: 5, scope: !48)
!50 = !DILocation(line: 111, column: 5, scope: !48)
!51 = !DILocation(line: 112, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 124, type: !53, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 124, type: !55)
!58 = !DILocation(line: 124, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 124, type: !56)
!60 = !DILocation(line: 124, column: 27, scope: !52)
!61 = !DILocation(line: 127, column: 22, scope: !52)
!62 = !DILocation(line: 127, column: 12, scope: !52)
!63 = !DILocation(line: 127, column: 5, scope: !52)
!64 = !DILocation(line: 129, column: 5, scope: !52)
!65 = !DILocation(line: 130, column: 5, scope: !52)
!66 = !DILocation(line: 131, column: 5, scope: !52)
!67 = !DILocation(line: 134, column: 5, scope: !52)
!68 = !DILocation(line: 135, column: 5, scope: !52)
!69 = !DILocation(line: 136, column: 5, scope: !52)
!70 = !DILocation(line: 138, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 60, type: !17)
!73 = !DILocation(line: 60, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !12, line: 61, type: !21)
!75 = !DILocation(line: 61, column: 10, scope: !71)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !12, line: 62, type: !26)
!77 = !DILocation(line: 62, column: 10, scope: !71)
!78 = !DILocation(line: 71, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !12, line: 69, column: 5)
!80 = distinct !DILexicalBlock(scope: !71, file: !12, line: 63, column: 8)
!81 = !DILocation(line: 71, column: 14, scope: !79)
!82 = !DILocation(line: 72, column: 9, scope: !79)
!83 = !DILocation(line: 72, column: 17, scope: !79)
!84 = !DILocalVariable(name: "source", scope: !85, file: !12, line: 75, type: !26)
!85 = distinct !DILexicalBlock(scope: !71, file: !12, line: 74, column: 5)
!86 = !DILocation(line: 75, column: 14, scope: !85)
!87 = !DILocation(line: 76, column: 9, scope: !85)
!88 = !DILocation(line: 77, column: 9, scope: !85)
!89 = !DILocation(line: 77, column: 23, scope: !85)
!90 = !DILocation(line: 79, column: 9, scope: !85)
!91 = !DILocation(line: 80, column: 9, scope: !85)
!92 = !DILocation(line: 80, column: 21, scope: !85)
!93 = !DILocation(line: 81, column: 19, scope: !85)
!94 = !DILocation(line: 81, column: 9, scope: !85)
!95 = !DILocation(line: 83, column: 1, scope: !71)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 88, type: !17)
!98 = !DILocation(line: 88, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !12, line: 89, type: !21)
!100 = !DILocation(line: 89, column: 10, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !12, line: 90, type: !26)
!102 = !DILocation(line: 90, column: 10, scope: !96)
!103 = !DILocation(line: 94, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !12, line: 92, column: 5)
!105 = distinct !DILexicalBlock(scope: !96, file: !12, line: 91, column: 8)
!106 = !DILocation(line: 94, column: 14, scope: !104)
!107 = !DILocation(line: 95, column: 9, scope: !104)
!108 = !DILocation(line: 95, column: 17, scope: !104)
!109 = !DILocalVariable(name: "source", scope: !110, file: !12, line: 98, type: !26)
!110 = distinct !DILexicalBlock(scope: !96, file: !12, line: 97, column: 5)
!111 = !DILocation(line: 98, column: 14, scope: !110)
!112 = !DILocation(line: 99, column: 9, scope: !110)
!113 = !DILocation(line: 100, column: 9, scope: !110)
!114 = !DILocation(line: 100, column: 23, scope: !110)
!115 = !DILocation(line: 102, column: 9, scope: !110)
!116 = !DILocation(line: 103, column: 9, scope: !110)
!117 = !DILocation(line: 103, column: 21, scope: !110)
!118 = !DILocation(line: 104, column: 19, scope: !110)
!119 = !DILocation(line: 104, column: 9, scope: !110)
!120 = !DILocation(line: 106, column: 1, scope: !96)
