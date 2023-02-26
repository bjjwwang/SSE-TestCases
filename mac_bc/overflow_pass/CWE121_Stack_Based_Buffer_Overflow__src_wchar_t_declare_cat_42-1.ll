; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* noundef %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !39
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !40
  %2 = load i32*, i32** %data, align 8, !dbg !41
  %call2 = call i32* @wcscat(i32* noundef %arraydecay1, i32* noundef %2), !dbg !42
  %3 = load i32*, i32** %data, align 8, !dbg !43
  call void @printWLine(i32* noundef %3), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @badSource(i32* noundef %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %0 = load i32*, i32** %data.addr, align 8, !dbg !51
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !52
  %1 = load i32*, i32** %data.addr, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  %2 = load i32*, i32** %data.addr, align 8, !dbg !55
  ret i32* %2, !dbg !56
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i32* @wcscat(i32* noundef, i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* noundef null), !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 noundef %conv), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_good(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_bad(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !85
  store i32* %arraydecay, i32** %data, align 8, !dbg !86
  %0 = load i32*, i32** %data, align 8, !dbg !87
  %call = call i32* @goodG2BSource(i32* noundef %0), !dbg !88
  store i32* %call, i32** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !92
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !93
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %call2 = call i32* @wcscat(i32* noundef %arraydecay1, i32* noundef %2), !dbg !95
  %3 = load i32*, i32** %data, align 8, !dbg !96
  call void @printWLine(i32* noundef %3), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @goodG2BSource(i32* noundef %data) #0 !dbg !99 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = load i32*, i32** %data.addr, align 8, !dbg !102
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !103
  %1 = load i32*, i32** %data.addr, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %2 = load i32*, i32** %data.addr, align 8, !dbg !106
  ret i32* %2, !dbg !107
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 33, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 34, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 34, column: 13, scope: !11)
!29 = !DILocation(line: 35, column: 12, scope: !11)
!30 = !DILocation(line: 35, column: 10, scope: !11)
!31 = !DILocation(line: 36, column: 22, scope: !11)
!32 = !DILocation(line: 36, column: 12, scope: !11)
!33 = !DILocation(line: 36, column: 10, scope: !11)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !12, line: 38, type: !36)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 38, column: 17, scope: !35)
!40 = !DILocation(line: 40, column: 16, scope: !35)
!41 = !DILocation(line: 40, column: 22, scope: !35)
!42 = !DILocation(line: 40, column: 9, scope: !35)
!43 = !DILocation(line: 41, column: 20, scope: !35)
!44 = !DILocation(line: 41, column: 9, scope: !35)
!45 = !DILocation(line: 43, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 23, type: !47, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!47 = !DISubroutineType(types: !48)
!48 = !{!17, !17}
!49 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !12, line: 23, type: !17)
!50 = !DILocation(line: 23, column: 38, scope: !46)
!51 = !DILocation(line: 26, column: 13, scope: !46)
!52 = !DILocation(line: 26, column: 5, scope: !46)
!53 = !DILocation(line: 27, column: 5, scope: !46)
!54 = !DILocation(line: 27, column: 17, scope: !46)
!55 = !DILocation(line: 28, column: 12, scope: !46)
!56 = !DILocation(line: 28, column: 5, scope: !46)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_42_good", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!58 = !DILocation(line: 74, column: 5, scope: !57)
!59 = !DILocation(line: 75, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !61, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!61 = !DISubroutineType(types: !62)
!62 = !{!22, !22, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 87, type: !22)
!67 = !DILocation(line: 87, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 87, type: !63)
!69 = !DILocation(line: 87, column: 27, scope: !60)
!70 = !DILocation(line: 90, column: 22, scope: !60)
!71 = !DILocation(line: 90, column: 12, scope: !60)
!72 = !DILocation(line: 90, column: 5, scope: !60)
!73 = !DILocation(line: 92, column: 5, scope: !60)
!74 = !DILocation(line: 93, column: 5, scope: !60)
!75 = !DILocation(line: 94, column: 5, scope: !60)
!76 = !DILocation(line: 97, column: 5, scope: !60)
!77 = !DILocation(line: 98, column: 5, scope: !60)
!78 = !DILocation(line: 99, column: 5, scope: !60)
!79 = !DILocation(line: 101, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 60, type: !17)
!82 = !DILocation(line: 60, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !12, line: 61, type: !25)
!84 = !DILocation(line: 61, column: 13, scope: !80)
!85 = !DILocation(line: 62, column: 12, scope: !80)
!86 = !DILocation(line: 62, column: 10, scope: !80)
!87 = !DILocation(line: 63, column: 26, scope: !80)
!88 = !DILocation(line: 63, column: 12, scope: !80)
!89 = !DILocation(line: 63, column: 10, scope: !80)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !12, line: 65, type: !36)
!91 = distinct !DILexicalBlock(scope: !80, file: !12, line: 64, column: 5)
!92 = !DILocation(line: 65, column: 17, scope: !91)
!93 = !DILocation(line: 67, column: 16, scope: !91)
!94 = !DILocation(line: 67, column: 22, scope: !91)
!95 = !DILocation(line: 67, column: 9, scope: !91)
!96 = !DILocation(line: 68, column: 20, scope: !91)
!97 = !DILocation(line: 68, column: 9, scope: !91)
!98 = !DILocation(line: 70, column: 1, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 49, type: !47, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!100 = !DILocalVariable(name: "data", arg: 1, scope: !99, file: !12, line: 49, type: !17)
!101 = !DILocation(line: 49, column: 42, scope: !99)
!102 = !DILocation(line: 52, column: 13, scope: !99)
!103 = !DILocation(line: 52, column: 5, scope: !99)
!104 = !DILocation(line: 53, column: 5, scope: !99)
!105 = !DILocation(line: 53, column: 16, scope: !99)
!106 = !DILocation(line: 54, column: 12, scope: !99)
!107 = !DILocation(line: 54, column: 5, scope: !99)
