; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !39
  %1 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %2 = load i32*, i32** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_unionType* %myUnion to i32**, !dbg !43
  store i32* %2, i32** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_unionType* %myUnion to i32**, !dbg !48
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !48
  store i32* %3, i32** %data1, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !54
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !55
  %5 = bitcast i32* %arraydecay2 to i8*, !dbg !55
  %6 = load i32*, i32** %data1, align 8, !dbg !55
  %7 = bitcast i32* %6 to i8*, !dbg !55
  %8 = load i32*, i32** %data1, align 8, !dbg !55
  %call3 = call i64 @wcslen(i32* noundef %8), !dbg !55
  %mul = mul i64 %call3, 4, !dbg !55
  %call4 = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %7, i64 noundef %mul, i64 noundef 200) #5, !dbg !55
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !56
  store i32 0, i32* %arrayidx5, align 4, !dbg !57
  %9 = load i32*, i32** %data1, align 8, !dbg !58
  call void @printWLine(i32* noundef %9), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !64 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_good(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_bad(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_unionType* %myUnion, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !91
  store i32* %arraydecay, i32** %data, align 8, !dbg !92
  %0 = load i32*, i32** %data, align 8, !dbg !93
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  %2 = load i32*, i32** %data, align 8, !dbg !97
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_unionType* %myUnion to i32**, !dbg !98
  store i32* %2, i32** %unionFirst, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !100, metadata !DIExpression()), !dbg !102
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_unionType* %myUnion to i32**, !dbg !103
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !103
  store i32* %3, i32** %data1, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !106
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !107
  %5 = bitcast i32* %arraydecay2 to i8*, !dbg !107
  %6 = load i32*, i32** %data1, align 8, !dbg !107
  %7 = bitcast i32* %6 to i8*, !dbg !107
  %8 = load i32*, i32** %data1, align 8, !dbg !107
  %call3 = call i64 @wcslen(i32* noundef %8), !dbg !107
  %mul = mul i64 %call3, 4, !dbg !107
  %call4 = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %7, i64 noundef %mul, i64 noundef 200) #5, !dbg !107
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !108
  store i32 0, i32* %arrayidx5, align 4, !dbg !109
  %9 = load i32*, i32** %data1, align 8, !dbg !110
  call void @printWLine(i32* noundef %9), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 31, column: 15, scope: !11)
!24 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_unionType", file: !12, line: 25, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !12, line: 23, baseType: !17, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !12, line: 24, baseType: !17, size: 64)
!30 = !DILocation(line: 32, column: 85, scope: !11)
!31 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 33, column: 13, scope: !11)
!36 = !DILocation(line: 34, column: 12, scope: !11)
!37 = !DILocation(line: 34, column: 10, scope: !11)
!38 = !DILocation(line: 36, column: 13, scope: !11)
!39 = !DILocation(line: 36, column: 5, scope: !11)
!40 = !DILocation(line: 37, column: 5, scope: !11)
!41 = !DILocation(line: 37, column: 17, scope: !11)
!42 = !DILocation(line: 38, column: 26, scope: !11)
!43 = !DILocation(line: 38, column: 13, scope: !11)
!44 = !DILocation(line: 38, column: 24, scope: !11)
!45 = !DILocalVariable(name: "data", scope: !46, file: !12, line: 40, type: !17)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!47 = !DILocation(line: 40, column: 19, scope: !46)
!48 = !DILocation(line: 40, column: 34, scope: !46)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !12, line: 42, type: !51)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 41, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 50)
!54 = !DILocation(line: 42, column: 21, scope: !50)
!55 = !DILocation(line: 44, column: 13, scope: !50)
!56 = !DILocation(line: 45, column: 13, scope: !50)
!57 = !DILocation(line: 45, column: 24, scope: !50)
!58 = !DILocation(line: 46, column: 24, scope: !50)
!59 = !DILocation(line: 46, column: 13, scope: !50)
!60 = !DILocation(line: 49, column: 1, scope: !11)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_34_good", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!62 = !DILocation(line: 80, column: 5, scope: !61)
!63 = !DILocation(line: 81, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !65, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!65 = !DISubroutineType(types: !66)
!66 = !{!22, !22, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !12, line: 92, type: !22)
!71 = !DILocation(line: 92, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !12, line: 92, type: !67)
!73 = !DILocation(line: 92, column: 27, scope: !64)
!74 = !DILocation(line: 95, column: 22, scope: !64)
!75 = !DILocation(line: 95, column: 12, scope: !64)
!76 = !DILocation(line: 95, column: 5, scope: !64)
!77 = !DILocation(line: 97, column: 5, scope: !64)
!78 = !DILocation(line: 98, column: 5, scope: !64)
!79 = !DILocation(line: 99, column: 5, scope: !64)
!80 = !DILocation(line: 102, column: 5, scope: !64)
!81 = !DILocation(line: 103, column: 5, scope: !64)
!82 = !DILocation(line: 104, column: 5, scope: !64)
!83 = !DILocation(line: 106, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!85 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 58, type: !17)
!86 = !DILocation(line: 58, column: 15, scope: !84)
!87 = !DILocalVariable(name: "myUnion", scope: !84, file: !12, line: 59, type: !25)
!88 = !DILocation(line: 59, column: 85, scope: !84)
!89 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !12, line: 60, type: !32)
!90 = !DILocation(line: 60, column: 13, scope: !84)
!91 = !DILocation(line: 61, column: 12, scope: !84)
!92 = !DILocation(line: 61, column: 10, scope: !84)
!93 = !DILocation(line: 63, column: 13, scope: !84)
!94 = !DILocation(line: 63, column: 5, scope: !84)
!95 = !DILocation(line: 64, column: 5, scope: !84)
!96 = !DILocation(line: 64, column: 16, scope: !84)
!97 = !DILocation(line: 65, column: 26, scope: !84)
!98 = !DILocation(line: 65, column: 13, scope: !84)
!99 = !DILocation(line: 65, column: 24, scope: !84)
!100 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 67, type: !17)
!101 = distinct !DILexicalBlock(scope: !84, file: !12, line: 66, column: 5)
!102 = !DILocation(line: 67, column: 19, scope: !101)
!103 = !DILocation(line: 67, column: 34, scope: !101)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !12, line: 69, type: !51)
!105 = distinct !DILexicalBlock(scope: !101, file: !12, line: 68, column: 9)
!106 = !DILocation(line: 69, column: 21, scope: !105)
!107 = !DILocation(line: 71, column: 13, scope: !105)
!108 = !DILocation(line: 72, column: 13, scope: !105)
!109 = !DILocation(line: 72, column: 24, scope: !105)
!110 = !DILocation(line: 73, column: 24, scope: !105)
!111 = !DILocation(line: 73, column: 13, scope: !105)
!112 = !DILocation(line: 76, column: 1, scope: !84)
