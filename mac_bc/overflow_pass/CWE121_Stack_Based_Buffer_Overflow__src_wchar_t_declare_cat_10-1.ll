; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_10-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_10-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalTrue = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_10_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %0 = load i32, i32* @globalTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %0, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !34
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 99), !dbg !36
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !45
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !46
  %4 = load i32*, i32** %data, align 8, !dbg !47
  %call2 = call i32* @wcscat(i32* noundef %arraydecay1, i32* noundef %4), !dbg !48
  %5 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* noundef %5), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32* @wcscat(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_10_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* noundef null), !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 noundef %conv), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_10_good(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_10_bad(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !81
  store i32* %arraydecay, i32** %data, align 8, !dbg !82
  %0 = load i32, i32* @globalFalse, align 4, !dbg !83
  %tobool = icmp ne i32 %0, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !91
  %2 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !96
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !97
  %4 = load i32*, i32** %data, align 8, !dbg !98
  %call2 = call i32* @wcscat(i32* noundef %arraydecay1, i32* noundef %4), !dbg !99
  %5 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* noundef %5), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay, i32** %data, align 8, !dbg !109
  %0 = load i32, i32* @globalTrue, align 4, !dbg !110
  %tobool = icmp ne i32 %0, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !113
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !115
  %2 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !121
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !122
  %4 = load i32*, i32** %data, align 8, !dbg !123
  %call2 = call i32* @wcscat(i32* noundef %arraydecay1, i32* noundef %4), !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  call void @printWLine(i32* noundef %5), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_10_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 8, scope: !11)
!34 = !DILocation(line: 31, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 29, column: 5)
!36 = !DILocation(line: 31, column: 9, scope: !35)
!37 = !DILocation(line: 32, column: 9, scope: !35)
!38 = !DILocation(line: 32, column: 21, scope: !35)
!39 = !DILocation(line: 33, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 35, column: 17, scope: !41)
!46 = !DILocation(line: 37, column: 16, scope: !41)
!47 = !DILocation(line: 37, column: 22, scope: !41)
!48 = !DILocation(line: 37, column: 9, scope: !41)
!49 = !DILocation(line: 38, column: 20, scope: !41)
!50 = !DILocation(line: 38, column: 9, scope: !41)
!51 = !DILocation(line: 40, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_10_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!53 = !DILocation(line: 93, column: 5, scope: !52)
!54 = !DILocation(line: 94, column: 5, scope: !52)
!55 = !DILocation(line: 95, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !57, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!57 = !DISubroutineType(types: !58)
!58 = !{!22, !22, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 107, type: !22)
!63 = !DILocation(line: 107, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 107, type: !59)
!65 = !DILocation(line: 107, column: 27, scope: !56)
!66 = !DILocation(line: 110, column: 22, scope: !56)
!67 = !DILocation(line: 110, column: 12, scope: !56)
!68 = !DILocation(line: 110, column: 5, scope: !56)
!69 = !DILocation(line: 112, column: 5, scope: !56)
!70 = !DILocation(line: 113, column: 5, scope: !56)
!71 = !DILocation(line: 114, column: 5, scope: !56)
!72 = !DILocation(line: 117, column: 5, scope: !56)
!73 = !DILocation(line: 118, column: 5, scope: !56)
!74 = !DILocation(line: 119, column: 5, scope: !56)
!75 = !DILocation(line: 121, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 49, type: !17)
!78 = !DILocation(line: 49, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !12, line: 50, type: !25)
!80 = !DILocation(line: 50, column: 13, scope: !76)
!81 = !DILocation(line: 51, column: 12, scope: !76)
!82 = !DILocation(line: 51, column: 10, scope: !76)
!83 = !DILocation(line: 52, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !76, file: !12, line: 52, column: 8)
!85 = !DILocation(line: 52, column: 8, scope: !76)
!86 = !DILocation(line: 55, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !12, line: 53, column: 5)
!88 = !DILocation(line: 56, column: 5, scope: !87)
!89 = !DILocation(line: 60, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !12, line: 58, column: 5)
!91 = !DILocation(line: 60, column: 9, scope: !90)
!92 = !DILocation(line: 61, column: 9, scope: !90)
!93 = !DILocation(line: 61, column: 20, scope: !90)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !12, line: 64, type: !42)
!95 = distinct !DILexicalBlock(scope: !76, file: !12, line: 63, column: 5)
!96 = !DILocation(line: 64, column: 17, scope: !95)
!97 = !DILocation(line: 66, column: 16, scope: !95)
!98 = !DILocation(line: 66, column: 22, scope: !95)
!99 = !DILocation(line: 66, column: 9, scope: !95)
!100 = !DILocation(line: 67, column: 20, scope: !95)
!101 = !DILocation(line: 67, column: 9, scope: !95)
!102 = !DILocation(line: 69, column: 1, scope: !76)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 74, type: !17)
!105 = !DILocation(line: 74, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !12, line: 75, type: !25)
!107 = !DILocation(line: 75, column: 13, scope: !103)
!108 = !DILocation(line: 76, column: 12, scope: !103)
!109 = !DILocation(line: 76, column: 10, scope: !103)
!110 = !DILocation(line: 77, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !12, line: 77, column: 8)
!112 = !DILocation(line: 77, column: 8, scope: !103)
!113 = !DILocation(line: 80, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 78, column: 5)
!115 = !DILocation(line: 80, column: 9, scope: !114)
!116 = !DILocation(line: 81, column: 9, scope: !114)
!117 = !DILocation(line: 81, column: 20, scope: !114)
!118 = !DILocation(line: 82, column: 5, scope: !114)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !12, line: 84, type: !42)
!120 = distinct !DILexicalBlock(scope: !103, file: !12, line: 83, column: 5)
!121 = !DILocation(line: 84, column: 17, scope: !120)
!122 = !DILocation(line: 86, column: 16, scope: !120)
!123 = !DILocation(line: 86, column: 22, scope: !120)
!124 = !DILocation(line: 86, column: 9, scope: !120)
!125 = !DILocation(line: 87, column: 20, scope: !120)
!126 = !DILocation(line: 87, column: 9, scope: !120)
!127 = !DILocation(line: 89, column: 1, scope: !103)
