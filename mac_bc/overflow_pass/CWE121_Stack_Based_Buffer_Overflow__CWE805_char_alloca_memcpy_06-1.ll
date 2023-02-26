; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_06_bad() #0 !dbg !13 {
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
  %call = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %6) #5, !dbg !41
  %7 = load i8*, i8** %data, align 8, !dbg !42
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !42
  store i8 0, i8* %arrayidx3, align 1, !dbg !43
  %8 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* noundef %8), !dbg !45
  ret void, !dbg !46
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_06_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_06_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_06_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 50, align 16, !dbg !75
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %1 = alloca i8, i64 100, align 16, !dbg !78
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !77
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !79
  store i8* %2, i8** %data, align 8, !dbg !82
  %3 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !88
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx1, align 1, !dbg !90
  %4 = load i8*, i8** %data, align 8, !dbg !91
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !91
  %5 = load i8*, i8** %data, align 8, !dbg !91
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !91
  %call = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %6) #5, !dbg !91
  %7 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !92
  store i8 0, i8* %arrayidx3, align 1, !dbg !93
  %8 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* noundef %8), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 50, align 16, !dbg !102
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %1 = alloca i8, i64 100, align 16, !dbg !105
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !104
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !106
  store i8* %2, i8** %data, align 8, !dbg !109
  %3 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx1, align 1, !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !118
  %5 = load i8*, i8** %data, align 8, !dbg !118
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !118
  %call = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %6) #5, !dbg !118
  %7 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !119
  store i8 0, i8* %arrayidx3, align 1, !dbg !120
  %8 = load i8*, i8** %data, align 8, !dbg !121
  call void @printLine(i8* noundef %8), !dbg !122
  ret void, !dbg !123
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_06_bad", scope: !14, file: !14, line: 27, type: !15, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!42 = !DILocation(line: 45, column: 9, scope: !33)
!43 = !DILocation(line: 45, column: 21, scope: !33)
!44 = !DILocation(line: 46, column: 19, scope: !33)
!45 = !DILocation(line: 46, column: 9, scope: !33)
!46 = !DILocation(line: 48, column: 1, scope: !13)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_06_good", scope: !14, file: !14, line: 105, type: !15, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!48 = !DILocation(line: 107, column: 5, scope: !47)
!49 = !DILocation(line: 108, column: 5, scope: !47)
!50 = !DILocation(line: 109, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 121, type: !52, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 121, type: !54)
!57 = !DILocation(line: 121, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 121, type: !55)
!59 = !DILocation(line: 121, column: 27, scope: !51)
!60 = !DILocation(line: 124, column: 22, scope: !51)
!61 = !DILocation(line: 124, column: 12, scope: !51)
!62 = !DILocation(line: 124, column: 5, scope: !51)
!63 = !DILocation(line: 126, column: 5, scope: !51)
!64 = !DILocation(line: 127, column: 5, scope: !51)
!65 = !DILocation(line: 128, column: 5, scope: !51)
!66 = !DILocation(line: 131, column: 5, scope: !51)
!67 = !DILocation(line: 132, column: 5, scope: !51)
!68 = !DILocation(line: 133, column: 5, scope: !51)
!69 = !DILocation(line: 135, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!71 = !DILocalVariable(name: "data", scope: !70, file: !14, line: 57, type: !3)
!72 = !DILocation(line: 57, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !14, line: 58, type: !3)
!74 = !DILocation(line: 58, column: 12, scope: !70)
!75 = !DILocation(line: 58, column: 36, scope: !70)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !14, line: 59, type: !3)
!77 = !DILocation(line: 59, column: 12, scope: !70)
!78 = !DILocation(line: 59, column: 37, scope: !70)
!79 = !DILocation(line: 68, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !14, line: 66, column: 5)
!81 = distinct !DILexicalBlock(scope: !70, file: !14, line: 60, column: 8)
!82 = !DILocation(line: 68, column: 14, scope: !80)
!83 = !DILocation(line: 69, column: 9, scope: !80)
!84 = !DILocation(line: 69, column: 17, scope: !80)
!85 = !DILocalVariable(name: "source", scope: !86, file: !14, line: 72, type: !34)
!86 = distinct !DILexicalBlock(scope: !70, file: !14, line: 71, column: 5)
!87 = !DILocation(line: 72, column: 14, scope: !86)
!88 = !DILocation(line: 73, column: 9, scope: !86)
!89 = !DILocation(line: 74, column: 9, scope: !86)
!90 = !DILocation(line: 74, column: 23, scope: !86)
!91 = !DILocation(line: 76, column: 9, scope: !86)
!92 = !DILocation(line: 77, column: 9, scope: !86)
!93 = !DILocation(line: 77, column: 21, scope: !86)
!94 = !DILocation(line: 78, column: 19, scope: !86)
!95 = !DILocation(line: 78, column: 9, scope: !86)
!96 = !DILocation(line: 80, column: 1, scope: !70)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!98 = !DILocalVariable(name: "data", scope: !97, file: !14, line: 85, type: !3)
!99 = !DILocation(line: 85, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !14, line: 86, type: !3)
!101 = !DILocation(line: 86, column: 12, scope: !97)
!102 = !DILocation(line: 86, column: 36, scope: !97)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !14, line: 87, type: !3)
!104 = !DILocation(line: 87, column: 12, scope: !97)
!105 = !DILocation(line: 87, column: 37, scope: !97)
!106 = !DILocation(line: 91, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !108, file: !14, line: 89, column: 5)
!108 = distinct !DILexicalBlock(scope: !97, file: !14, line: 88, column: 8)
!109 = !DILocation(line: 91, column: 14, scope: !107)
!110 = !DILocation(line: 92, column: 9, scope: !107)
!111 = !DILocation(line: 92, column: 17, scope: !107)
!112 = !DILocalVariable(name: "source", scope: !113, file: !14, line: 95, type: !34)
!113 = distinct !DILexicalBlock(scope: !97, file: !14, line: 94, column: 5)
!114 = !DILocation(line: 95, column: 14, scope: !113)
!115 = !DILocation(line: 96, column: 9, scope: !113)
!116 = !DILocation(line: 97, column: 9, scope: !113)
!117 = !DILocation(line: 97, column: 23, scope: !113)
!118 = !DILocation(line: 99, column: 9, scope: !113)
!119 = !DILocation(line: 100, column: 9, scope: !113)
!120 = !DILocation(line: 100, column: 21, scope: !113)
!121 = !DILocation(line: 101, column: 19, scope: !113)
!122 = !DILocation(line: 101, column: 9, scope: !113)
!123 = !DILocation(line: 103, column: 1, scope: !97)
