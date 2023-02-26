; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx2, align 4, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %1, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !60
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !60
  %4 = load i32*, i32** %data, align 8, !dbg !61
  %5 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !61
  store i32 %3, i32* %arrayidx4, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %6, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !70
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !70
  store i32 0, i32* %arrayidx5, align 4, !dbg !71
  %8 = load i32*, i32** %data, align 8, !dbg !72
  call void @printWLine(i32* noundef %8), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* noundef null), !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 noundef %conv), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_good(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_bad(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !105
  store i32* %arraydecay, i32** %data, align 8, !dbg !106
  %0 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !115
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx2, align 4, !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !121
  %cmp = icmp ult i64 %1, 100, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !127
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !127
  %4 = load i32*, i32** %data, align 8, !dbg !128
  %5 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !128
  store i32 %3, i32* %arrayidx4, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %6, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !136
  store i32 0, i32* %arrayidx5, align 4, !dbg !137
  %8 = load i32*, i32** %data, align 8, !dbg !138
  call void @printWLine(i32* noundef %8), !dbg !139
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 13, scope: !11)
!34 = !DILocation(line: 30, column: 12, scope: !11)
!35 = !DILocation(line: 30, column: 10, scope: !11)
!36 = !DILocation(line: 31, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 13, scope: !11)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 33, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 31, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !43)
!43 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 33, column: 16, scope: !39)
!45 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 34, type: !30)
!46 = !DILocation(line: 34, column: 17, scope: !39)
!47 = !DILocation(line: 35, column: 17, scope: !39)
!48 = !DILocation(line: 35, column: 9, scope: !39)
!49 = !DILocation(line: 36, column: 9, scope: !39)
!50 = !DILocation(line: 36, column: 23, scope: !39)
!51 = !DILocation(line: 38, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !39, file: !12, line: 38, column: 9)
!53 = !DILocation(line: 38, column: 14, scope: !52)
!54 = !DILocation(line: 38, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 38, column: 9)
!56 = !DILocation(line: 38, column: 23, scope: !55)
!57 = !DILocation(line: 38, column: 9, scope: !52)
!58 = !DILocation(line: 40, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 39, column: 9)
!60 = !DILocation(line: 40, column: 23, scope: !59)
!61 = !DILocation(line: 40, column: 13, scope: !59)
!62 = !DILocation(line: 40, column: 18, scope: !59)
!63 = !DILocation(line: 40, column: 21, scope: !59)
!64 = !DILocation(line: 41, column: 9, scope: !59)
!65 = !DILocation(line: 38, column: 31, scope: !55)
!66 = !DILocation(line: 38, column: 9, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 41, column: 9, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 42, column: 9, scope: !39)
!71 = !DILocation(line: 42, column: 21, scope: !39)
!72 = !DILocation(line: 43, column: 20, scope: !39)
!73 = !DILocation(line: 43, column: 9, scope: !39)
!74 = !DILocation(line: 45, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!76 = !DILocation(line: 77, column: 5, scope: !75)
!77 = !DILocation(line: 78, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !79, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!79 = !DISubroutineType(types: !80)
!80 = !{!22, !22, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !12, line: 90, type: !22)
!85 = !DILocation(line: 90, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !12, line: 90, type: !81)
!87 = !DILocation(line: 90, column: 27, scope: !78)
!88 = !DILocation(line: 93, column: 22, scope: !78)
!89 = !DILocation(line: 93, column: 12, scope: !78)
!90 = !DILocation(line: 93, column: 5, scope: !78)
!91 = !DILocation(line: 95, column: 5, scope: !78)
!92 = !DILocation(line: 96, column: 5, scope: !78)
!93 = !DILocation(line: 97, column: 5, scope: !78)
!94 = !DILocation(line: 100, column: 5, scope: !78)
!95 = !DILocation(line: 101, column: 5, scope: !78)
!96 = !DILocation(line: 102, column: 5, scope: !78)
!97 = !DILocation(line: 104, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 54, type: !17)
!100 = !DILocation(line: 54, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !12, line: 55, type: !25)
!102 = !DILocation(line: 55, column: 13, scope: !98)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !12, line: 56, type: !30)
!104 = !DILocation(line: 56, column: 13, scope: !98)
!105 = !DILocation(line: 58, column: 12, scope: !98)
!106 = !DILocation(line: 58, column: 10, scope: !98)
!107 = !DILocation(line: 59, column: 5, scope: !98)
!108 = !DILocation(line: 59, column: 13, scope: !98)
!109 = !DILocalVariable(name: "i", scope: !110, file: !12, line: 61, type: !40)
!110 = distinct !DILexicalBlock(scope: !98, file: !12, line: 60, column: 5)
!111 = !DILocation(line: 61, column: 16, scope: !110)
!112 = !DILocalVariable(name: "source", scope: !110, file: !12, line: 62, type: !30)
!113 = !DILocation(line: 62, column: 17, scope: !110)
!114 = !DILocation(line: 63, column: 17, scope: !110)
!115 = !DILocation(line: 63, column: 9, scope: !110)
!116 = !DILocation(line: 64, column: 9, scope: !110)
!117 = !DILocation(line: 64, column: 23, scope: !110)
!118 = !DILocation(line: 66, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !110, file: !12, line: 66, column: 9)
!120 = !DILocation(line: 66, column: 14, scope: !119)
!121 = !DILocation(line: 66, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 66, column: 9)
!123 = !DILocation(line: 66, column: 23, scope: !122)
!124 = !DILocation(line: 66, column: 9, scope: !119)
!125 = !DILocation(line: 68, column: 30, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 67, column: 9)
!127 = !DILocation(line: 68, column: 23, scope: !126)
!128 = !DILocation(line: 68, column: 13, scope: !126)
!129 = !DILocation(line: 68, column: 18, scope: !126)
!130 = !DILocation(line: 68, column: 21, scope: !126)
!131 = !DILocation(line: 69, column: 9, scope: !126)
!132 = !DILocation(line: 66, column: 31, scope: !122)
!133 = !DILocation(line: 66, column: 9, scope: !122)
!134 = distinct !{!134, !124, !135, !69}
!135 = !DILocation(line: 69, column: 9, scope: !119)
!136 = !DILocation(line: 70, column: 9, scope: !110)
!137 = !DILocation(line: 70, column: 21, scope: !110)
!138 = !DILocation(line: 71, column: 20, scope: !110)
!139 = !DILocation(line: 71, column: 9, scope: !110)
!140 = !DILocation(line: 73, column: 1, scope: !98)
