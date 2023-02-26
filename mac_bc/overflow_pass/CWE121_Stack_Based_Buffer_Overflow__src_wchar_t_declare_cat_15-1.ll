; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !40
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !41
  %3 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i32* @wcscat(i32* noundef %arraydecay1, i32* noundef %3), !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* noundef %4), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32* @wcscat(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_good() #0 !dbg !47 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* noundef null), !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 noundef %conv), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_good(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_bad(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !76
  store i32* %arraydecay, i32** %data, align 8, !dbg !77
  %0 = load i32*, i32** %data, align 8, !dbg !78
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !79
  %1 = load i32*, i32** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !84
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !85
  %3 = load i32*, i32** %data, align 8, !dbg !86
  %call2 = call i32* @wcscat(i32* noundef %arraydecay1, i32* noundef %3), !dbg !87
  %4 = load i32*, i32** %data, align 8, !dbg !88
  call void @printWLine(i32* noundef %4), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay, i32** %data, align 8, !dbg !97
  %0 = load i32*, i32** %data, align 8, !dbg !98
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !99
  %1 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !104
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %call2 = call i32* @wcscat(i32* noundef %arraydecay1, i32* noundef %3), !dbg !107
  %4 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* noundef %4), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 25, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocation(line: 27, column: 12, scope: !11)
!30 = !DILocation(line: 27, column: 10, scope: !11)
!31 = !DILocation(line: 32, column: 17, scope: !11)
!32 = !DILocation(line: 32, column: 9, scope: !11)
!33 = !DILocation(line: 33, column: 9, scope: !11)
!34 = !DILocation(line: 33, column: 21, scope: !11)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 41, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 41, column: 17, scope: !36)
!41 = !DILocation(line: 43, column: 16, scope: !36)
!42 = !DILocation(line: 43, column: 22, scope: !36)
!43 = !DILocation(line: 43, column: 9, scope: !36)
!44 = !DILocation(line: 44, column: 20, scope: !36)
!45 = !DILocation(line: 44, column: 9, scope: !36)
!46 = !DILocation(line: 46, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_15_good", scope: !12, file: !12, line: 104, type: !13, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!48 = !DILocation(line: 106, column: 5, scope: !47)
!49 = !DILocation(line: 107, column: 5, scope: !47)
!50 = !DILocation(line: 108, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 120, type: !52, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!52 = !DISubroutineType(types: !53)
!53 = !{!22, !22, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 120, type: !22)
!58 = !DILocation(line: 120, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 120, type: !54)
!60 = !DILocation(line: 120, column: 27, scope: !51)
!61 = !DILocation(line: 123, column: 22, scope: !51)
!62 = !DILocation(line: 123, column: 12, scope: !51)
!63 = !DILocation(line: 123, column: 5, scope: !51)
!64 = !DILocation(line: 125, column: 5, scope: !51)
!65 = !DILocation(line: 126, column: 5, scope: !51)
!66 = !DILocation(line: 127, column: 5, scope: !51)
!67 = !DILocation(line: 130, column: 5, scope: !51)
!68 = !DILocation(line: 131, column: 5, scope: !51)
!69 = !DILocation(line: 132, column: 5, scope: !51)
!70 = !DILocation(line: 134, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 55, type: !17)
!73 = !DILocation(line: 55, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !12, line: 56, type: !25)
!75 = !DILocation(line: 56, column: 13, scope: !71)
!76 = !DILocation(line: 57, column: 12, scope: !71)
!77 = !DILocation(line: 57, column: 10, scope: !71)
!78 = !DILocation(line: 66, column: 17, scope: !71)
!79 = !DILocation(line: 66, column: 9, scope: !71)
!80 = !DILocation(line: 67, column: 9, scope: !71)
!81 = !DILocation(line: 67, column: 20, scope: !71)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !12, line: 71, type: !37)
!83 = distinct !DILexicalBlock(scope: !71, file: !12, line: 70, column: 5)
!84 = !DILocation(line: 71, column: 17, scope: !83)
!85 = !DILocation(line: 73, column: 16, scope: !83)
!86 = !DILocation(line: 73, column: 22, scope: !83)
!87 = !DILocation(line: 73, column: 9, scope: !83)
!88 = !DILocation(line: 74, column: 20, scope: !83)
!89 = !DILocation(line: 74, column: 9, scope: !83)
!90 = !DILocation(line: 76, column: 1, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 81, type: !17)
!93 = !DILocation(line: 81, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !12, line: 82, type: !25)
!95 = !DILocation(line: 82, column: 13, scope: !91)
!96 = !DILocation(line: 83, column: 12, scope: !91)
!97 = !DILocation(line: 83, column: 10, scope: !91)
!98 = !DILocation(line: 88, column: 17, scope: !91)
!99 = !DILocation(line: 88, column: 9, scope: !91)
!100 = !DILocation(line: 89, column: 9, scope: !91)
!101 = !DILocation(line: 89, column: 20, scope: !91)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !12, line: 97, type: !37)
!103 = distinct !DILexicalBlock(scope: !91, file: !12, line: 96, column: 5)
!104 = !DILocation(line: 97, column: 17, scope: !103)
!105 = !DILocation(line: 99, column: 16, scope: !103)
!106 = !DILocation(line: 99, column: 22, scope: !103)
!107 = !DILocation(line: 99, column: 9, scope: !103)
!108 = !DILocation(line: 100, column: 20, scope: !103)
!109 = !DILocation(line: 100, column: 9, scope: !103)
!110 = !DILocation(line: 102, column: 1, scope: !91)
