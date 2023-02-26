; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_15_bad() #0 !dbg !13 {
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
  store i8* %2, i8** %data, align 8, !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !36
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !37
  store i8 0, i8* %arrayidx1, align 1, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  %5 = load i8*, i8** %data, align 8, !dbg !39
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !39
  %call = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %6) #5, !dbg !39
  %7 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !40
  store i8 0, i8* %arrayidx3, align 1, !dbg !41
  %8 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* noundef %8), !dbg !43
  ret void, !dbg !44
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_15_good() #0 !dbg !45 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_15_good(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_15_bad(), !dbg !65
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
  store i8* %2, i8** %data, align 8, !dbg !78
  %3 = load i8*, i8** %data, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !84
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx1, align 1, !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !87
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !87
  %5 = load i8*, i8** %data, align 8, !dbg !87
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !87
  %call = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %6) #5, !dbg !87
  %7 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !88
  store i8 0, i8* %arrayidx3, align 1, !dbg !89
  %8 = load i8*, i8** %data, align 8, !dbg !90
  call void @printLine(i8* noundef %8), !dbg !91
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
  store i8* %2, i8** %data, align 8, !dbg !103
  %3 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !109
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx1, align 1, !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  %5 = load i8*, i8** %data, align 8, !dbg !112
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !112
  %call = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %6) #5, !dbg !112
  %7 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !113
  store i8 0, i8* %arrayidx3, align 1, !dbg !114
  %8 = load i8*, i8** %data, align 8, !dbg !115
  call void @printLine(i8* noundef %8), !dbg !116
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 37, scope: !13)
!26 = !DILocation(line: 33, column: 16, scope: !13)
!27 = !DILocation(line: 33, column: 14, scope: !13)
!28 = !DILocation(line: 34, column: 9, scope: !13)
!29 = !DILocation(line: 34, column: 17, scope: !13)
!30 = !DILocalVariable(name: "source", scope: !31, file: !14, line: 42, type: !32)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 42, column: 14, scope: !31)
!36 = !DILocation(line: 43, column: 9, scope: !31)
!37 = !DILocation(line: 44, column: 9, scope: !31)
!38 = !DILocation(line: 44, column: 23, scope: !31)
!39 = !DILocation(line: 46, column: 9, scope: !31)
!40 = !DILocation(line: 47, column: 9, scope: !31)
!41 = !DILocation(line: 47, column: 21, scope: !31)
!42 = !DILocation(line: 48, column: 19, scope: !31)
!43 = !DILocation(line: 48, column: 9, scope: !31)
!44 = !DILocation(line: 50, column: 1, scope: !13)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_15_good", scope: !14, file: !14, line: 114, type: !15, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocation(line: 116, column: 5, scope: !45)
!47 = !DILocation(line: 117, column: 5, scope: !45)
!48 = !DILocation(line: 118, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 130, type: !50, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !14, line: 130, type: !52)
!55 = !DILocation(line: 130, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !14, line: 130, type: !53)
!57 = !DILocation(line: 130, column: 27, scope: !49)
!58 = !DILocation(line: 133, column: 22, scope: !49)
!59 = !DILocation(line: 133, column: 12, scope: !49)
!60 = !DILocation(line: 133, column: 5, scope: !49)
!61 = !DILocation(line: 135, column: 5, scope: !49)
!62 = !DILocation(line: 136, column: 5, scope: !49)
!63 = !DILocation(line: 137, column: 5, scope: !49)
!64 = !DILocation(line: 140, column: 5, scope: !49)
!65 = !DILocation(line: 141, column: 5, scope: !49)
!66 = !DILocation(line: 142, column: 5, scope: !49)
!67 = !DILocation(line: 144, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!69 = !DILocalVariable(name: "data", scope: !68, file: !14, line: 59, type: !3)
!70 = !DILocation(line: 59, column: 12, scope: !68)
!71 = !DILocalVariable(name: "dataBadBuffer", scope: !68, file: !14, line: 60, type: !3)
!72 = !DILocation(line: 60, column: 12, scope: !68)
!73 = !DILocation(line: 60, column: 36, scope: !68)
!74 = !DILocalVariable(name: "dataGoodBuffer", scope: !68, file: !14, line: 61, type: !3)
!75 = !DILocation(line: 61, column: 12, scope: !68)
!76 = !DILocation(line: 61, column: 37, scope: !68)
!77 = !DILocation(line: 70, column: 16, scope: !68)
!78 = !DILocation(line: 70, column: 14, scope: !68)
!79 = !DILocation(line: 71, column: 9, scope: !68)
!80 = !DILocation(line: 71, column: 17, scope: !68)
!81 = !DILocalVariable(name: "source", scope: !82, file: !14, line: 75, type: !32)
!82 = distinct !DILexicalBlock(scope: !68, file: !14, line: 74, column: 5)
!83 = !DILocation(line: 75, column: 14, scope: !82)
!84 = !DILocation(line: 76, column: 9, scope: !82)
!85 = !DILocation(line: 77, column: 9, scope: !82)
!86 = !DILocation(line: 77, column: 23, scope: !82)
!87 = !DILocation(line: 79, column: 9, scope: !82)
!88 = !DILocation(line: 80, column: 9, scope: !82)
!89 = !DILocation(line: 80, column: 21, scope: !82)
!90 = !DILocation(line: 81, column: 19, scope: !82)
!91 = !DILocation(line: 81, column: 9, scope: !82)
!92 = !DILocation(line: 83, column: 1, scope: !68)
!93 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!94 = !DILocalVariable(name: "data", scope: !93, file: !14, line: 88, type: !3)
!95 = !DILocation(line: 88, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !14, line: 89, type: !3)
!97 = !DILocation(line: 89, column: 12, scope: !93)
!98 = !DILocation(line: 89, column: 36, scope: !93)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !14, line: 90, type: !3)
!100 = !DILocation(line: 90, column: 12, scope: !93)
!101 = !DILocation(line: 90, column: 37, scope: !93)
!102 = !DILocation(line: 95, column: 16, scope: !93)
!103 = !DILocation(line: 95, column: 14, scope: !93)
!104 = !DILocation(line: 96, column: 9, scope: !93)
!105 = !DILocation(line: 96, column: 17, scope: !93)
!106 = !DILocalVariable(name: "source", scope: !107, file: !14, line: 104, type: !32)
!107 = distinct !DILexicalBlock(scope: !93, file: !14, line: 103, column: 5)
!108 = !DILocation(line: 104, column: 14, scope: !107)
!109 = !DILocation(line: 105, column: 9, scope: !107)
!110 = !DILocation(line: 106, column: 9, scope: !107)
!111 = !DILocation(line: 106, column: 23, scope: !107)
!112 = !DILocation(line: 108, column: 9, scope: !107)
!113 = !DILocation(line: 109, column: 9, scope: !107)
!114 = !DILocation(line: 109, column: 21, scope: !107)
!115 = !DILocation(line: 110, column: 19, scope: !107)
!116 = !DILocation(line: 110, column: 9, scope: !107)
!117 = !DILocation(line: 112, column: 1, scope: !93)
