; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_02_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  store i32* %2, i32** %data, align 8, !dbg !29
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !33
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !42
  %6 = bitcast i32* %arraydecay to i8*, !dbg !42
  %7 = load i32*, i32** %data, align 8, !dbg !42
  %8 = bitcast i32* %7 to i8*, !dbg !42
  %9 = load i32*, i32** %data, align 8, !dbg !42
  %call1 = call i64 @wcslen(i32* noundef %9), !dbg !42
  %mul = mul i64 %call1, 4, !dbg !42
  %call2 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #5, !dbg !42
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !43
  store i32 0, i32* %arrayidx3, align 4, !dbg !44
  %10 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* noundef %10), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_02_good() #0 !dbg !48 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_02_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_02_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 400, align 16, !dbg !77
  %1 = bitcast i8* %0 to i32*, !dbg !78
  store i32* %1, i32** %dataBuffer, align 8, !dbg !76
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  store i32* %2, i32** %data, align 8, !dbg !80
  %3 = load i32*, i32** %data, align 8, !dbg !81
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !84
  %4 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !87, metadata !DIExpression()), !dbg !89
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !89
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !90
  %6 = bitcast i32* %arraydecay to i8*, !dbg !90
  %7 = load i32*, i32** %data, align 8, !dbg !90
  %8 = bitcast i32* %7 to i8*, !dbg !90
  %9 = load i32*, i32** %data, align 8, !dbg !90
  %call1 = call i64 @wcslen(i32* noundef %9), !dbg !90
  %mul = mul i64 %call1, 4, !dbg !90
  %call2 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #5, !dbg !90
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !91
  store i32 0, i32* %arrayidx3, align 4, !dbg !92
  %10 = load i32*, i32** %data, align 8, !dbg !93
  call void @printWLine(i32* noundef %10), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 400, align 16, !dbg !101
  %1 = bitcast i8* %0 to i32*, !dbg !102
  store i32* %1, i32** %dataBuffer, align 8, !dbg !100
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  store i32* %2, i32** %data, align 8, !dbg !104
  %3 = load i32*, i32** %data, align 8, !dbg !105
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !108
  %4 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !113
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !114
  %6 = bitcast i32* %arraydecay to i8*, !dbg !114
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %8 = bitcast i32* %7 to i8*, !dbg !114
  %9 = load i32*, i32** %data, align 8, !dbg !114
  %call1 = call i64 @wcslen(i32* noundef %9), !dbg !114
  %mul = mul i64 %call1, 4, !dbg !114
  %call2 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #5, !dbg !114
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !115
  store i32 0, i32* %arrayidx3, align 4, !dbg !116
  %10 = load i32*, i32** %data, align 8, !dbg !117
  call void @printWLine(i32* noundef %10), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_02_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 39, scope: !17)
!27 = !DILocation(line: 26, column: 28, scope: !17)
!28 = !DILocation(line: 27, column: 12, scope: !17)
!29 = !DILocation(line: 27, column: 10, scope: !17)
!30 = !DILocation(line: 31, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !18, line: 29, column: 5)
!32 = distinct !DILexicalBlock(scope: !17, file: !18, line: 28, column: 8)
!33 = !DILocation(line: 31, column: 9, scope: !31)
!34 = !DILocation(line: 32, column: 9, scope: !31)
!35 = !DILocation(line: 32, column: 21, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !18, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !17, file: !18, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 35, column: 17, scope: !37)
!42 = !DILocation(line: 37, column: 9, scope: !37)
!43 = !DILocation(line: 38, column: 9, scope: !37)
!44 = !DILocation(line: 38, column: 20, scope: !37)
!45 = !DILocation(line: 39, column: 20, scope: !37)
!46 = !DILocation(line: 39, column: 9, scope: !37)
!47 = !DILocation(line: 41, column: 1, scope: !17)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_02_good", scope: !18, file: !18, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!49 = !DILocation(line: 96, column: 5, scope: !48)
!50 = !DILocation(line: 97, column: 5, scope: !48)
!51 = !DILocation(line: 98, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 110, type: !53, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!53 = !DISubroutineType(types: !54)
!54 = !{!8, !8, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !18, line: 110, type: !8)
!59 = !DILocation(line: 110, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !18, line: 110, type: !55)
!61 = !DILocation(line: 110, column: 27, scope: !52)
!62 = !DILocation(line: 113, column: 22, scope: !52)
!63 = !DILocation(line: 113, column: 12, scope: !52)
!64 = !DILocation(line: 113, column: 5, scope: !52)
!65 = !DILocation(line: 115, column: 5, scope: !52)
!66 = !DILocation(line: 116, column: 5, scope: !52)
!67 = !DILocation(line: 117, column: 5, scope: !52)
!68 = !DILocation(line: 120, column: 5, scope: !52)
!69 = !DILocation(line: 121, column: 5, scope: !52)
!70 = !DILocation(line: 122, column: 5, scope: !52)
!71 = !DILocation(line: 124, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 48, type: !19, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!73 = !DILocalVariable(name: "data", scope: !72, file: !18, line: 50, type: !3)
!74 = !DILocation(line: 50, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !18, line: 51, type: !3)
!76 = !DILocation(line: 51, column: 15, scope: !72)
!77 = !DILocation(line: 51, column: 39, scope: !72)
!78 = !DILocation(line: 51, column: 28, scope: !72)
!79 = !DILocation(line: 52, column: 12, scope: !72)
!80 = !DILocation(line: 52, column: 10, scope: !72)
!81 = !DILocation(line: 61, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !18, line: 59, column: 5)
!83 = distinct !DILexicalBlock(scope: !72, file: !18, line: 53, column: 8)
!84 = !DILocation(line: 61, column: 9, scope: !82)
!85 = !DILocation(line: 62, column: 9, scope: !82)
!86 = !DILocation(line: 62, column: 20, scope: !82)
!87 = !DILocalVariable(name: "dest", scope: !88, file: !18, line: 65, type: !38)
!88 = distinct !DILexicalBlock(scope: !72, file: !18, line: 64, column: 5)
!89 = !DILocation(line: 65, column: 17, scope: !88)
!90 = !DILocation(line: 67, column: 9, scope: !88)
!91 = !DILocation(line: 68, column: 9, scope: !88)
!92 = !DILocation(line: 68, column: 20, scope: !88)
!93 = !DILocation(line: 69, column: 20, scope: !88)
!94 = !DILocation(line: 69, column: 9, scope: !88)
!95 = !DILocation(line: 71, column: 1, scope: !72)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 74, type: !19, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!97 = !DILocalVariable(name: "data", scope: !96, file: !18, line: 76, type: !3)
!98 = !DILocation(line: 76, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !18, line: 77, type: !3)
!100 = !DILocation(line: 77, column: 15, scope: !96)
!101 = !DILocation(line: 77, column: 39, scope: !96)
!102 = !DILocation(line: 77, column: 28, scope: !96)
!103 = !DILocation(line: 78, column: 12, scope: !96)
!104 = !DILocation(line: 78, column: 10, scope: !96)
!105 = !DILocation(line: 82, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !18, line: 80, column: 5)
!107 = distinct !DILexicalBlock(scope: !96, file: !18, line: 79, column: 8)
!108 = !DILocation(line: 82, column: 9, scope: !106)
!109 = !DILocation(line: 83, column: 9, scope: !106)
!110 = !DILocation(line: 83, column: 20, scope: !106)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !18, line: 86, type: !38)
!112 = distinct !DILexicalBlock(scope: !96, file: !18, line: 85, column: 5)
!113 = !DILocation(line: 86, column: 17, scope: !112)
!114 = !DILocation(line: 88, column: 9, scope: !112)
!115 = !DILocation(line: 89, column: 9, scope: !112)
!116 = !DILocation(line: 89, column: 20, scope: !112)
!117 = !DILocation(line: 90, column: 20, scope: !112)
!118 = !DILocation(line: 90, column: 9, scope: !112)
!119 = !DILocation(line: 92, column: 1, scope: !96)
