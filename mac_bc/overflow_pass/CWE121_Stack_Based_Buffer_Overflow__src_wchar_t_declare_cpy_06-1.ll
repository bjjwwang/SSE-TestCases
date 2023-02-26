; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_06_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !34
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %3 = load i32*, i32** %data, align 8, !dbg !44
  %call2 = call i32* @wcscpy(i32* noundef %arraydecay1, i32* noundef %3), !dbg !45
  %4 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* noundef %4), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32* @wcscpy(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_06_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* noundef null), !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 noundef %conv), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_06_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_06_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !78
  store i32* %arraydecay, i32** %data, align 8, !dbg !79
  %0 = load i32*, i32** %data, align 8, !dbg !80
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !83
  %1 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !86, metadata !DIExpression()), !dbg !88
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !88
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !89
  %3 = load i32*, i32** %data, align 8, !dbg !90
  %call2 = call i32* @wcscpy(i32* noundef %arraydecay1, i32* noundef %3), !dbg !91
  %4 = load i32*, i32** %data, align 8, !dbg !92
  call void @printWLine(i32* noundef %4), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !100
  store i32* %arraydecay, i32** %data, align 8, !dbg !101
  %0 = load i32*, i32** %data, align 8, !dbg !102
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !105
  %1 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !110
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !111
  %3 = load i32*, i32** %data, align 8, !dbg !112
  %call2 = call i32* @wcscpy(i32* noundef %arraydecay1, i32* noundef %3), !dbg !113
  %4 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* noundef %4), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_06_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 29, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 29, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 30, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 30, column: 13, scope: !11)
!29 = !DILocation(line: 31, column: 12, scope: !11)
!30 = !DILocation(line: 31, column: 10, scope: !11)
!31 = !DILocation(line: 35, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !12, line: 33, column: 5)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!34 = !DILocation(line: 35, column: 9, scope: !32)
!35 = !DILocation(line: 36, column: 9, scope: !32)
!36 = !DILocation(line: 36, column: 21, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 39, type: !39)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 39, column: 17, scope: !38)
!43 = !DILocation(line: 41, column: 16, scope: !38)
!44 = !DILocation(line: 41, column: 22, scope: !38)
!45 = !DILocation(line: 41, column: 9, scope: !38)
!46 = !DILocation(line: 42, column: 20, scope: !38)
!47 = !DILocation(line: 42, column: 9, scope: !38)
!48 = !DILocation(line: 44, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_06_good", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!50 = !DILocation(line: 97, column: 5, scope: !49)
!51 = !DILocation(line: 98, column: 5, scope: !49)
!52 = !DILocation(line: 99, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 111, type: !54, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!54 = !DISubroutineType(types: !55)
!55 = !{!22, !22, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 111, type: !22)
!60 = !DILocation(line: 111, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 111, type: !56)
!62 = !DILocation(line: 111, column: 27, scope: !53)
!63 = !DILocation(line: 114, column: 22, scope: !53)
!64 = !DILocation(line: 114, column: 12, scope: !53)
!65 = !DILocation(line: 114, column: 5, scope: !53)
!66 = !DILocation(line: 116, column: 5, scope: !53)
!67 = !DILocation(line: 117, column: 5, scope: !53)
!68 = !DILocation(line: 118, column: 5, scope: !53)
!69 = !DILocation(line: 121, column: 5, scope: !53)
!70 = !DILocation(line: 122, column: 5, scope: !53)
!71 = !DILocation(line: 123, column: 5, scope: !53)
!72 = !DILocation(line: 125, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 53, type: !17)
!75 = !DILocation(line: 53, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !12, line: 54, type: !25)
!77 = !DILocation(line: 54, column: 13, scope: !73)
!78 = !DILocation(line: 55, column: 12, scope: !73)
!79 = !DILocation(line: 55, column: 10, scope: !73)
!80 = !DILocation(line: 64, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !12, line: 62, column: 5)
!82 = distinct !DILexicalBlock(scope: !73, file: !12, line: 56, column: 8)
!83 = !DILocation(line: 64, column: 9, scope: !81)
!84 = !DILocation(line: 65, column: 9, scope: !81)
!85 = !DILocation(line: 65, column: 20, scope: !81)
!86 = !DILocalVariable(name: "dest", scope: !87, file: !12, line: 68, type: !39)
!87 = distinct !DILexicalBlock(scope: !73, file: !12, line: 67, column: 5)
!88 = !DILocation(line: 68, column: 17, scope: !87)
!89 = !DILocation(line: 70, column: 16, scope: !87)
!90 = !DILocation(line: 70, column: 22, scope: !87)
!91 = !DILocation(line: 70, column: 9, scope: !87)
!92 = !DILocation(line: 71, column: 20, scope: !87)
!93 = !DILocation(line: 71, column: 9, scope: !87)
!94 = !DILocation(line: 73, column: 1, scope: !73)
!95 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 78, type: !17)
!97 = !DILocation(line: 78, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !12, line: 79, type: !25)
!99 = !DILocation(line: 79, column: 13, scope: !95)
!100 = !DILocation(line: 80, column: 12, scope: !95)
!101 = !DILocation(line: 80, column: 10, scope: !95)
!102 = !DILocation(line: 84, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !12, line: 82, column: 5)
!104 = distinct !DILexicalBlock(scope: !95, file: !12, line: 81, column: 8)
!105 = !DILocation(line: 84, column: 9, scope: !103)
!106 = !DILocation(line: 85, column: 9, scope: !103)
!107 = !DILocation(line: 85, column: 20, scope: !103)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !12, line: 88, type: !39)
!109 = distinct !DILexicalBlock(scope: !95, file: !12, line: 87, column: 5)
!110 = !DILocation(line: 88, column: 17, scope: !109)
!111 = !DILocation(line: 90, column: 16, scope: !109)
!112 = !DILocation(line: 90, column: 22, scope: !109)
!113 = !DILocation(line: 90, column: 9, scope: !109)
!114 = !DILocation(line: 91, column: 20, scope: !109)
!115 = !DILocation(line: 91, column: 9, scope: !109)
!116 = !DILocation(line: 93, column: 1, scope: !95)
