; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !7
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %0, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !39
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 99), !dbg !41
  %2 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !50
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !51
  %4 = load i32*, i32** %data, align 8, !dbg !52
  %call2 = call i32* @wcscat(i32* noundef %arraydecay1, i32* noundef %4), !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* noundef %5), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32* @wcscat(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* noundef null), !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 noundef %conv), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !86
  store i32* %arraydecay, i32** %data, align 8, !dbg !87
  %0 = load i32, i32* @staticFalse, align 4, !dbg !88
  %tobool = icmp ne i32 %0, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !94
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !96
  %2 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !101
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !102
  %4 = load i32*, i32** %data, align 8, !dbg !103
  %call2 = call i32* @wcscat(i32* noundef %arraydecay1, i32* noundef %4), !dbg !104
  %5 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* noundef %5), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay, i32** %data, align 8, !dbg !114
  %0 = load i32, i32* @staticTrue, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !118
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !120
  %2 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !126
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !127
  %4 = load i32*, i32** %data, align 8, !dbg !128
  %call2 = call i32* @wcscat(i32* noundef %arraydecay1, i32* noundef %4), !dbg !129
  %5 = load i32*, i32** %data, align 8, !dbg !130
  call void @printWLine(i32* noundef %5), !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 26, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_bad", scope: !9, file: !9, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !25, line: 34, baseType: !26)
!25 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !27, line: 106, baseType: !10)
!27 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!28 = !DILocation(line: 32, column: 15, scope: !18)
!29 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !9, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 33, column: 13, scope: !18)
!34 = !DILocation(line: 34, column: 12, scope: !18)
!35 = !DILocation(line: 34, column: 10, scope: !18)
!36 = !DILocation(line: 35, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !9, line: 35, column: 8)
!38 = !DILocation(line: 35, column: 8, scope: !18)
!39 = !DILocation(line: 38, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !9, line: 36, column: 5)
!41 = !DILocation(line: 38, column: 9, scope: !40)
!42 = !DILocation(line: 39, column: 9, scope: !40)
!43 = !DILocation(line: 39, column: 21, scope: !40)
!44 = !DILocation(line: 40, column: 5, scope: !40)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !9, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !18, file: !9, line: 41, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 42, column: 17, scope: !46)
!51 = !DILocation(line: 44, column: 16, scope: !46)
!52 = !DILocation(line: 44, column: 22, scope: !46)
!53 = !DILocation(line: 44, column: 9, scope: !46)
!54 = !DILocation(line: 45, column: 20, scope: !46)
!55 = !DILocation(line: 45, column: 9, scope: !46)
!56 = !DILocation(line: 47, column: 1, scope: !18)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_05_good", scope: !9, file: !9, line: 98, type: !19, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!58 = !DILocation(line: 100, column: 5, scope: !57)
!59 = !DILocation(line: 101, column: 5, scope: !57)
!60 = !DILocation(line: 102, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 114, type: !62, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!62 = !DISubroutineType(types: !63)
!63 = !{!10, !10, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !9, line: 114, type: !10)
!68 = !DILocation(line: 114, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !9, line: 114, type: !64)
!70 = !DILocation(line: 114, column: 27, scope: !61)
!71 = !DILocation(line: 117, column: 22, scope: !61)
!72 = !DILocation(line: 117, column: 12, scope: !61)
!73 = !DILocation(line: 117, column: 5, scope: !61)
!74 = !DILocation(line: 119, column: 5, scope: !61)
!75 = !DILocation(line: 120, column: 5, scope: !61)
!76 = !DILocation(line: 121, column: 5, scope: !61)
!77 = !DILocation(line: 124, column: 5, scope: !61)
!78 = !DILocation(line: 125, column: 5, scope: !61)
!79 = !DILocation(line: 126, column: 5, scope: !61)
!80 = !DILocation(line: 128, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 54, type: !19, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!82 = !DILocalVariable(name: "data", scope: !81, file: !9, line: 56, type: !23)
!83 = !DILocation(line: 56, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !9, line: 57, type: !30)
!85 = !DILocation(line: 57, column: 13, scope: !81)
!86 = !DILocation(line: 58, column: 12, scope: !81)
!87 = !DILocation(line: 58, column: 10, scope: !81)
!88 = !DILocation(line: 59, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !81, file: !9, line: 59, column: 8)
!90 = !DILocation(line: 59, column: 8, scope: !81)
!91 = !DILocation(line: 62, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !9, line: 60, column: 5)
!93 = !DILocation(line: 63, column: 5, scope: !92)
!94 = !DILocation(line: 67, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !9, line: 65, column: 5)
!96 = !DILocation(line: 67, column: 9, scope: !95)
!97 = !DILocation(line: 68, column: 9, scope: !95)
!98 = !DILocation(line: 68, column: 20, scope: !95)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !9, line: 71, type: !47)
!100 = distinct !DILexicalBlock(scope: !81, file: !9, line: 70, column: 5)
!101 = !DILocation(line: 71, column: 17, scope: !100)
!102 = !DILocation(line: 73, column: 16, scope: !100)
!103 = !DILocation(line: 73, column: 22, scope: !100)
!104 = !DILocation(line: 73, column: 9, scope: !100)
!105 = !DILocation(line: 74, column: 20, scope: !100)
!106 = !DILocation(line: 74, column: 9, scope: !100)
!107 = !DILocation(line: 76, column: 1, scope: !81)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!109 = !DILocalVariable(name: "data", scope: !108, file: !9, line: 81, type: !23)
!110 = !DILocation(line: 81, column: 15, scope: !108)
!111 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !9, line: 82, type: !30)
!112 = !DILocation(line: 82, column: 13, scope: !108)
!113 = !DILocation(line: 83, column: 12, scope: !108)
!114 = !DILocation(line: 83, column: 10, scope: !108)
!115 = !DILocation(line: 84, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !108, file: !9, line: 84, column: 8)
!117 = !DILocation(line: 84, column: 8, scope: !108)
!118 = !DILocation(line: 87, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !9, line: 85, column: 5)
!120 = !DILocation(line: 87, column: 9, scope: !119)
!121 = !DILocation(line: 88, column: 9, scope: !119)
!122 = !DILocation(line: 88, column: 20, scope: !119)
!123 = !DILocation(line: 89, column: 5, scope: !119)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !9, line: 91, type: !47)
!125 = distinct !DILexicalBlock(scope: !108, file: !9, line: 90, column: 5)
!126 = !DILocation(line: 91, column: 17, scope: !125)
!127 = !DILocation(line: 93, column: 16, scope: !125)
!128 = !DILocation(line: 93, column: 22, scope: !125)
!129 = !DILocation(line: 93, column: 9, scope: !125)
!130 = !DILocation(line: 94, column: 20, scope: !125)
!131 = !DILocation(line: 94, column: 9, scope: !125)
!132 = !DILocation(line: 96, column: 1, scope: !108)
