; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_17_bad() #0 !dbg !17 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  store i32 0, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !37
  %cmp = icmp slt i32 %4, 1, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !41
  store i32* %5, i32** %data, align 8, !dbg !43
  %6 = load i32*, i32** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %7, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !52, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !59
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx1, align 4, !dbg !61
  %8 = load i32*, i32** %data, align 8, !dbg !62
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !63
  %call3 = call i32* @wcscpy(i32* noundef %8, i32* noundef %arraydecay2), !dbg !64
  %9 = load i32*, i32** %data, align 8, !dbg !65
  call void @printWLine(i32* noundef %9), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcscpy(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_17_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* noundef null), !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 noundef %conv), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_17_good(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_17_bad(), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 200, align 16, !dbg !98
  %1 = bitcast i8* %0 to i32*, !dbg !99
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %2 = alloca i8, i64 400, align 16, !dbg !102
  %3 = bitcast i8* %2 to i32*, !dbg !103
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !101
  store i32 0, i32* %h, align 4, !dbg !104
  br label %for.cond, !dbg !106

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !107
  %cmp = icmp slt i32 %4, 1, !dbg !109
  br i1 %cmp, label %for.body, label %for.end, !dbg !110

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !111
  store i32* %5, i32** %data, align 8, !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  br label %for.inc, !dbg !116

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %h, align 4, !dbg !117
  %inc = add nsw i32 %7, 1, !dbg !117
  store i32 %inc, i32* %h, align 4, !dbg !117
  br label %for.cond, !dbg !118, !llvm.loop !119

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !124
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !125
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx1, align 4, !dbg !127
  %8 = load i32*, i32** %data, align 8, !dbg !128
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !129
  %call3 = call i32* @wcscpy(i32* noundef %8, i32* noundef %arraydecay2), !dbg !130
  %9 = load i32*, i32** %data, align 8, !dbg !131
  call void @printWLine(i32* noundef %9), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_17_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "i", scope: !17, file: !18, line: 25, type: !8)
!23 = !DILocation(line: 25, column: 9, scope: !17)
!24 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 27, type: !3)
!27 = !DILocation(line: 27, column: 15, scope: !17)
!28 = !DILocation(line: 27, column: 42, scope: !17)
!29 = !DILocation(line: 27, column: 31, scope: !17)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 28, type: !3)
!31 = !DILocation(line: 28, column: 15, scope: !17)
!32 = !DILocation(line: 28, column: 43, scope: !17)
!33 = !DILocation(line: 28, column: 32, scope: !17)
!34 = !DILocation(line: 29, column: 11, scope: !35)
!35 = distinct !DILexicalBlock(scope: !17, file: !18, line: 29, column: 5)
!36 = !DILocation(line: 29, column: 9, scope: !35)
!37 = !DILocation(line: 29, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !18, line: 29, column: 5)
!39 = !DILocation(line: 29, column: 18, scope: !38)
!40 = !DILocation(line: 29, column: 5, scope: !35)
!41 = !DILocation(line: 33, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !18, line: 30, column: 5)
!43 = !DILocation(line: 33, column: 14, scope: !42)
!44 = !DILocation(line: 34, column: 9, scope: !42)
!45 = !DILocation(line: 34, column: 17, scope: !42)
!46 = !DILocation(line: 35, column: 5, scope: !42)
!47 = !DILocation(line: 29, column: 24, scope: !38)
!48 = !DILocation(line: 29, column: 5, scope: !38)
!49 = distinct !{!49, !40, !50, !51}
!50 = !DILocation(line: 35, column: 5, scope: !35)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocalVariable(name: "source", scope: !53, file: !18, line: 37, type: !54)
!53 = distinct !DILexicalBlock(scope: !17, file: !18, line: 36, column: 5)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 37, column: 17, scope: !53)
!58 = !DILocation(line: 38, column: 17, scope: !53)
!59 = !DILocation(line: 38, column: 9, scope: !53)
!60 = !DILocation(line: 39, column: 9, scope: !53)
!61 = !DILocation(line: 39, column: 23, scope: !53)
!62 = !DILocation(line: 41, column: 16, scope: !53)
!63 = !DILocation(line: 41, column: 22, scope: !53)
!64 = !DILocation(line: 41, column: 9, scope: !53)
!65 = !DILocation(line: 42, column: 20, scope: !53)
!66 = !DILocation(line: 42, column: 9, scope: !53)
!67 = !DILocation(line: 44, column: 1, scope: !17)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_17_good", scope: !18, file: !18, line: 73, type: !19, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!69 = !DILocation(line: 75, column: 5, scope: !68)
!70 = !DILocation(line: 76, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 88, type: !72, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!72 = !DISubroutineType(types: !73)
!73 = !{!8, !8, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !18, line: 88, type: !8)
!78 = !DILocation(line: 88, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !18, line: 88, type: !74)
!80 = !DILocation(line: 88, column: 27, scope: !71)
!81 = !DILocation(line: 91, column: 22, scope: !71)
!82 = !DILocation(line: 91, column: 12, scope: !71)
!83 = !DILocation(line: 91, column: 5, scope: !71)
!84 = !DILocation(line: 93, column: 5, scope: !71)
!85 = !DILocation(line: 94, column: 5, scope: !71)
!86 = !DILocation(line: 95, column: 5, scope: !71)
!87 = !DILocation(line: 98, column: 5, scope: !71)
!88 = !DILocation(line: 99, column: 5, scope: !71)
!89 = !DILocation(line: 100, column: 5, scope: !71)
!90 = !DILocation(line: 102, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!92 = !DILocalVariable(name: "h", scope: !91, file: !18, line: 53, type: !8)
!93 = !DILocation(line: 53, column: 9, scope: !91)
!94 = !DILocalVariable(name: "data", scope: !91, file: !18, line: 54, type: !3)
!95 = !DILocation(line: 54, column: 15, scope: !91)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !18, line: 55, type: !3)
!97 = !DILocation(line: 55, column: 15, scope: !91)
!98 = !DILocation(line: 55, column: 42, scope: !91)
!99 = !DILocation(line: 55, column: 31, scope: !91)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !18, line: 56, type: !3)
!101 = !DILocation(line: 56, column: 15, scope: !91)
!102 = !DILocation(line: 56, column: 43, scope: !91)
!103 = !DILocation(line: 56, column: 32, scope: !91)
!104 = !DILocation(line: 57, column: 11, scope: !105)
!105 = distinct !DILexicalBlock(scope: !91, file: !18, line: 57, column: 5)
!106 = !DILocation(line: 57, column: 9, scope: !105)
!107 = !DILocation(line: 57, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !18, line: 57, column: 5)
!109 = !DILocation(line: 57, column: 18, scope: !108)
!110 = !DILocation(line: 57, column: 5, scope: !105)
!111 = !DILocation(line: 60, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !18, line: 58, column: 5)
!113 = !DILocation(line: 60, column: 14, scope: !112)
!114 = !DILocation(line: 61, column: 9, scope: !112)
!115 = !DILocation(line: 61, column: 17, scope: !112)
!116 = !DILocation(line: 62, column: 5, scope: !112)
!117 = !DILocation(line: 57, column: 24, scope: !108)
!118 = !DILocation(line: 57, column: 5, scope: !108)
!119 = distinct !{!119, !110, !120, !51}
!120 = !DILocation(line: 62, column: 5, scope: !105)
!121 = !DILocalVariable(name: "source", scope: !122, file: !18, line: 64, type: !54)
!122 = distinct !DILexicalBlock(scope: !91, file: !18, line: 63, column: 5)
!123 = !DILocation(line: 64, column: 17, scope: !122)
!124 = !DILocation(line: 65, column: 17, scope: !122)
!125 = !DILocation(line: 65, column: 9, scope: !122)
!126 = !DILocation(line: 66, column: 9, scope: !122)
!127 = !DILocation(line: 66, column: 23, scope: !122)
!128 = !DILocation(line: 68, column: 16, scope: !122)
!129 = !DILocation(line: 68, column: 22, scope: !122)
!130 = !DILocation(line: 68, column: 9, scope: !122)
!131 = !DILocation(line: 69, column: 20, scope: !122)
!132 = !DILocation(line: 69, column: 9, scope: !122)
!133 = !DILocation(line: 71, column: 1, scope: !91)
