; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_badSink(i32* noundef %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !30
  %1 = load i32*, i32** %data.addr, align 8, !dbg !31
  %call = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %1), !dbg !32
  %2 = load i32*, i32** %data.addr, align 8, !dbg !33
  call void @printWLine(i32* noundef %2), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i32* @wcscpy(i32* noundef, i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_bad() #0 !dbg !36 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = alloca i8, i64 400, align 16, !dbg !43
  %1 = bitcast i8* %0 to i32*, !dbg !44
  store i32* %1, i32** %dataBuffer, align 8, !dbg !42
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !45
  store i32* %2, i32** %data, align 8, !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !48
  %4 = load i32*, i32** %data, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_badSink(i32* noundef %5), !dbg !52
  ret void, !dbg !53
}

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_goodG2BSink(i32* noundef %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !57, metadata !DIExpression()), !dbg !59
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !59
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !60
  %1 = load i32*, i32** %data.addr, align 8, !dbg !61
  %call = call i32* @wcscpy(i32* noundef %arraydecay, i32* noundef %1), !dbg !62
  %2 = load i32*, i32** %data.addr, align 8, !dbg !63
  call void @printWLine(i32* noundef %2), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* noundef null), !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 noundef %conv), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_good(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_bad(), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 400, align 16, !dbg !94
  %1 = bitcast i8* %0 to i32*, !dbg !95
  store i32* %1, i32** %dataBuffer, align 8, !dbg !93
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  store i32* %2, i32** %data, align 8, !dbg !97
  %3 = load i32*, i32** %data, align 8, !dbg !98
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !99
  %4 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  %5 = load i32*, i32** %data, align 8, !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_goodG2BSink(i32* noundef %5), !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_badSink", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !3}
!21 = !{}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 23, type: !3)
!23 = !DILocation(line: 23, column: 86, scope: !17)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !18, line: 26, type: !26)
!25 = distinct !DILexicalBlock(scope: !17, file: !18, line: 25, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 26, column: 17, scope: !25)
!30 = !DILocation(line: 28, column: 16, scope: !25)
!31 = !DILocation(line: 28, column: 22, scope: !25)
!32 = !DILocation(line: 28, column: 9, scope: !25)
!33 = !DILocation(line: 29, column: 20, scope: !25)
!34 = !DILocation(line: 29, column: 9, scope: !25)
!35 = !DILocation(line: 31, column: 1, scope: !17)
!36 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_bad", scope: !18, file: !18, line: 33, type: !37, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !18, line: 35, type: !3)
!40 = !DILocation(line: 35, column: 15, scope: !36)
!41 = !DILocalVariable(name: "dataBuffer", scope: !36, file: !18, line: 36, type: !3)
!42 = !DILocation(line: 36, column: 15, scope: !36)
!43 = !DILocation(line: 36, column: 39, scope: !36)
!44 = !DILocation(line: 36, column: 28, scope: !36)
!45 = !DILocation(line: 37, column: 12, scope: !36)
!46 = !DILocation(line: 37, column: 10, scope: !36)
!47 = !DILocation(line: 39, column: 13, scope: !36)
!48 = !DILocation(line: 39, column: 5, scope: !36)
!49 = !DILocation(line: 40, column: 5, scope: !36)
!50 = !DILocation(line: 40, column: 17, scope: !36)
!51 = !DILocation(line: 41, column: 75, scope: !36)
!52 = !DILocation(line: 41, column: 5, scope: !36)
!53 = !DILocation(line: 42, column: 1, scope: !36)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_goodG2BSink", scope: !18, file: !18, line: 48, type: !19, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!55 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !18, line: 48, type: !3)
!56 = !DILocation(line: 48, column: 90, scope: !54)
!57 = !DILocalVariable(name: "dest", scope: !58, file: !18, line: 51, type: !26)
!58 = distinct !DILexicalBlock(scope: !54, file: !18, line: 50, column: 5)
!59 = !DILocation(line: 51, column: 17, scope: !58)
!60 = !DILocation(line: 53, column: 16, scope: !58)
!61 = !DILocation(line: 53, column: 22, scope: !58)
!62 = !DILocation(line: 53, column: 9, scope: !58)
!63 = !DILocation(line: 54, column: 20, scope: !58)
!64 = !DILocation(line: 54, column: 9, scope: !58)
!65 = !DILocation(line: 56, column: 1, scope: !54)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_41_good", scope: !18, file: !18, line: 70, type: !37, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!67 = !DILocation(line: 72, column: 5, scope: !66)
!68 = !DILocation(line: 73, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 85, type: !70, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!70 = !DISubroutineType(types: !71)
!71 = !{!8, !8, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !18, line: 85, type: !8)
!76 = !DILocation(line: 85, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !18, line: 85, type: !72)
!78 = !DILocation(line: 85, column: 27, scope: !69)
!79 = !DILocation(line: 88, column: 22, scope: !69)
!80 = !DILocation(line: 88, column: 12, scope: !69)
!81 = !DILocation(line: 88, column: 5, scope: !69)
!82 = !DILocation(line: 90, column: 5, scope: !69)
!83 = !DILocation(line: 91, column: 5, scope: !69)
!84 = !DILocation(line: 92, column: 5, scope: !69)
!85 = !DILocation(line: 95, column: 5, scope: !69)
!86 = !DILocation(line: 96, column: 5, scope: !69)
!87 = !DILocation(line: 97, column: 5, scope: !69)
!88 = !DILocation(line: 99, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 59, type: !37, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!90 = !DILocalVariable(name: "data", scope: !89, file: !18, line: 61, type: !3)
!91 = !DILocation(line: 61, column: 15, scope: !89)
!92 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !18, line: 62, type: !3)
!93 = !DILocation(line: 62, column: 15, scope: !89)
!94 = !DILocation(line: 62, column: 39, scope: !89)
!95 = !DILocation(line: 62, column: 28, scope: !89)
!96 = !DILocation(line: 63, column: 12, scope: !89)
!97 = !DILocation(line: 63, column: 10, scope: !89)
!98 = !DILocation(line: 65, column: 13, scope: !89)
!99 = !DILocation(line: 65, column: 5, scope: !89)
!100 = !DILocation(line: 66, column: 5, scope: !89)
!101 = !DILocation(line: 66, column: 16, scope: !89)
!102 = !DILocation(line: 67, column: 79, scope: !89)
!103 = !DILocation(line: 67, column: 5, scope: !89)
!104 = !DILocation(line: 68, column: 1, scope: !89)
