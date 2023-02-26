; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_07_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 400, align 16, !dbg !29
  %1 = bitcast i8* %0 to i32*, !dbg !30
  store i32* %1, i32** %dataBuffer, align 8, !dbg !28
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !31
  store i32* %2, i32** %data, align 8, !dbg !32
  %3 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %3, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !37
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 99), !dbg !39
  %5 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !49
  %7 = load i32*, i32** %data, align 8, !dbg !50
  %call1 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %7), !dbg !51
  %8 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* noundef %8), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32* @wcscat(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_07_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_07_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_07_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 400, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %dataBuffer, align 8, !dbg !83
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  store i32* %2, i32** %data, align 8, !dbg !87
  %3 = load i32, i32* @staticFive, align 4, !dbg !88
  %cmp = icmp ne i32 %3, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !97
  %5 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !103
  %7 = load i32*, i32** %data, align 8, !dbg !104
  %call1 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %7), !dbg !105
  %8 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* noundef %8), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 400, align 16, !dbg !114
  %1 = bitcast i8* %0 to i32*, !dbg !115
  store i32* %1, i32** %dataBuffer, align 8, !dbg !113
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  store i32* %2, i32** %data, align 8, !dbg !117
  %3 = load i32, i32* @staticFive, align 4, !dbg !118
  %cmp = icmp eq i32 %3, 5, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !122
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !130
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !131
  %7 = load i32*, i32** %data, align 8, !dbg !132
  %call1 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %7), !dbg !133
  %8 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* noundef %8), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"Homebrew clang version 14.0.6"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_07_bad", scope: !13, file: !13, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 31, type: !5)
!26 = !DILocation(line: 31, column: 15, scope: !21)
!27 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !13, line: 32, type: !5)
!28 = !DILocation(line: 32, column: 15, scope: !21)
!29 = !DILocation(line: 32, column: 39, scope: !21)
!30 = !DILocation(line: 32, column: 28, scope: !21)
!31 = !DILocation(line: 33, column: 12, scope: !21)
!32 = !DILocation(line: 33, column: 10, scope: !21)
!33 = !DILocation(line: 34, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 8)
!35 = !DILocation(line: 34, column: 18, scope: !34)
!36 = !DILocation(line: 34, column: 8, scope: !21)
!37 = !DILocation(line: 37, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 35, column: 5)
!39 = !DILocation(line: 37, column: 9, scope: !38)
!40 = !DILocation(line: 38, column: 9, scope: !38)
!41 = !DILocation(line: 38, column: 21, scope: !38)
!42 = !DILocation(line: 39, column: 5, scope: !38)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !13, line: 41, type: !45)
!44 = distinct !DILexicalBlock(scope: !21, file: !13, line: 40, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 41, column: 17, scope: !44)
!49 = !DILocation(line: 43, column: 16, scope: !44)
!50 = !DILocation(line: 43, column: 22, scope: !44)
!51 = !DILocation(line: 43, column: 9, scope: !44)
!52 = !DILocation(line: 44, column: 20, scope: !44)
!53 = !DILocation(line: 44, column: 9, scope: !44)
!54 = !DILocation(line: 46, column: 1, scope: !21)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_07_good", scope: !13, file: !13, line: 97, type: !22, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!56 = !DILocation(line: 99, column: 5, scope: !55)
!57 = !DILocation(line: 100, column: 5, scope: !55)
!58 = !DILocation(line: 101, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 113, type: !60, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!60 = !DISubroutineType(types: !61)
!61 = !{!10, !10, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !13, line: 113, type: !10)
!66 = !DILocation(line: 113, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !13, line: 113, type: !62)
!68 = !DILocation(line: 113, column: 27, scope: !59)
!69 = !DILocation(line: 116, column: 22, scope: !59)
!70 = !DILocation(line: 116, column: 12, scope: !59)
!71 = !DILocation(line: 116, column: 5, scope: !59)
!72 = !DILocation(line: 118, column: 5, scope: !59)
!73 = !DILocation(line: 119, column: 5, scope: !59)
!74 = !DILocation(line: 120, column: 5, scope: !59)
!75 = !DILocation(line: 123, column: 5, scope: !59)
!76 = !DILocation(line: 124, column: 5, scope: !59)
!77 = !DILocation(line: 125, column: 5, scope: !59)
!78 = !DILocation(line: 127, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 53, type: !22, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!80 = !DILocalVariable(name: "data", scope: !79, file: !13, line: 55, type: !5)
!81 = !DILocation(line: 55, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !13, line: 56, type: !5)
!83 = !DILocation(line: 56, column: 15, scope: !79)
!84 = !DILocation(line: 56, column: 39, scope: !79)
!85 = !DILocation(line: 56, column: 28, scope: !79)
!86 = !DILocation(line: 57, column: 12, scope: !79)
!87 = !DILocation(line: 57, column: 10, scope: !79)
!88 = !DILocation(line: 58, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !79, file: !13, line: 58, column: 8)
!90 = !DILocation(line: 58, column: 18, scope: !89)
!91 = !DILocation(line: 58, column: 8, scope: !79)
!92 = !DILocation(line: 61, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !13, line: 59, column: 5)
!94 = !DILocation(line: 62, column: 5, scope: !93)
!95 = !DILocation(line: 66, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !13, line: 64, column: 5)
!97 = !DILocation(line: 66, column: 9, scope: !96)
!98 = !DILocation(line: 67, column: 9, scope: !96)
!99 = !DILocation(line: 67, column: 20, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !13, line: 70, type: !45)
!101 = distinct !DILexicalBlock(scope: !79, file: !13, line: 69, column: 5)
!102 = !DILocation(line: 70, column: 17, scope: !101)
!103 = !DILocation(line: 72, column: 16, scope: !101)
!104 = !DILocation(line: 72, column: 22, scope: !101)
!105 = !DILocation(line: 72, column: 9, scope: !101)
!106 = !DILocation(line: 73, column: 20, scope: !101)
!107 = !DILocation(line: 73, column: 9, scope: !101)
!108 = !DILocation(line: 75, column: 1, scope: !79)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 78, type: !22, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!110 = !DILocalVariable(name: "data", scope: !109, file: !13, line: 80, type: !5)
!111 = !DILocation(line: 80, column: 15, scope: !109)
!112 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !13, line: 81, type: !5)
!113 = !DILocation(line: 81, column: 15, scope: !109)
!114 = !DILocation(line: 81, column: 39, scope: !109)
!115 = !DILocation(line: 81, column: 28, scope: !109)
!116 = !DILocation(line: 82, column: 12, scope: !109)
!117 = !DILocation(line: 82, column: 10, scope: !109)
!118 = !DILocation(line: 83, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !109, file: !13, line: 83, column: 8)
!120 = !DILocation(line: 83, column: 18, scope: !119)
!121 = !DILocation(line: 83, column: 8, scope: !109)
!122 = !DILocation(line: 86, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !13, line: 84, column: 5)
!124 = !DILocation(line: 86, column: 9, scope: !123)
!125 = !DILocation(line: 87, column: 9, scope: !123)
!126 = !DILocation(line: 87, column: 20, scope: !123)
!127 = !DILocation(line: 88, column: 5, scope: !123)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !13, line: 90, type: !45)
!129 = distinct !DILexicalBlock(scope: !109, file: !13, line: 89, column: 5)
!130 = !DILocation(line: 90, column: 17, scope: !129)
!131 = !DILocation(line: 92, column: 16, scope: !129)
!132 = !DILocation(line: 92, column: 22, scope: !129)
!133 = !DILocation(line: 92, column: 9, scope: !129)
!134 = !DILocation(line: 93, column: 20, scope: !129)
!135 = !DILocation(line: 93, column: 9, scope: !129)
!136 = !DILocation(line: 95, column: 1, scope: !109)
