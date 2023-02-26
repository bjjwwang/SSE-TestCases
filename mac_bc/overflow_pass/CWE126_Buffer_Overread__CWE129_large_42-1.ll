; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_large_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_large_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_large_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* %data, align 4, !dbg !20
  %call = call i32 @badSource(i32 noundef %0), !dbg !21
  store i32 %call, i32* %data, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !23, metadata !DIExpression()), !dbg !28
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !28
  %2 = load i32, i32* %data, align 4, !dbg !29
  %cmp = icmp sge i32 %2, 0, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !33
  %idxprom = sext i32 %3 to i64, !dbg !35
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !35
  %4 = load i32, i32* %arrayidx, align 4, !dbg !35
  call void @printIntLine(i32 noundef %4), !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @badSource(i32 noundef %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 10, i32* %data.addr, align 4, !dbg !46
  %0 = load i32, i32* %data.addr, align 4, !dbg !47
  ret i32 %0, !dbg !48
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_large_42_good() #0 !dbg !49 {
entry:
  call void @goodB2G(), !dbg !50
  call void @goodG2B(), !dbg !51
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
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @CWE126_Buffer_Overread__CWE129_large_42_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__CWE129_large_42_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !73 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 -1, i32* %data, align 4, !dbg !76
  %0 = load i32, i32* %data, align 4, !dbg !77
  %call = call i32 @goodB2GSource(i32 noundef %0), !dbg !78
  store i32 %call, i32* %data, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !80, metadata !DIExpression()), !dbg !82
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !82
  %2 = load i32, i32* %data, align 4, !dbg !83
  %cmp = icmp sge i32 %2, 0, !dbg !85
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !86

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !87
  %cmp1 = icmp slt i32 %3, 10, !dbg !88
  br i1 %cmp1, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !90
  %idxprom = sext i32 %4 to i64, !dbg !92
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !92
  %5 = load i32, i32* %arrayidx, align 4, !dbg !92
  call void @printIntLine(i32 noundef %5), !dbg !93
  br label %if.end, !dbg !94

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodB2GSource(i32 noundef %data) #0 !dbg !98 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i32 10, i32* %data.addr, align 4, !dbg !101
  %0 = load i32, i32* %data.addr, align 4, !dbg !102
  ret i32 %0, !dbg !103
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %data, align 4, !dbg !107
  %0 = load i32, i32* %data, align 4, !dbg !108
  %call = call i32 @goodG2BSource(i32 noundef %0), !dbg !109
  store i32 %call, i32* %data, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !111, metadata !DIExpression()), !dbg !113
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !113
  %2 = load i32, i32* %data, align 4, !dbg !114
  %cmp = icmp sge i32 %2, 0, !dbg !116
  br i1 %cmp, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !118
  %idxprom = sext i32 %3 to i64, !dbg !120
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !120
  %4 = load i32, i32* %arrayidx, align 4, !dbg !120
  call void @printIntLine(i32 noundef %4), !dbg !121
  br label %if.end, !dbg !122

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodG2BSource(i32 noundef %data) #0 !dbg !126 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !127, metadata !DIExpression()), !dbg !128
  store i32 7, i32* %data.addr, align 4, !dbg !129
  %0 = load i32, i32* %data.addr, align 4, !dbg !130
  ret i32 %0, !dbg !131
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_large_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_42_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_large_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 31, column: 9, scope: !11)
!19 = !DILocation(line: 33, column: 10, scope: !11)
!20 = !DILocation(line: 34, column: 22, scope: !11)
!21 = !DILocation(line: 34, column: 12, scope: !11)
!22 = !DILocation(line: 34, column: 10, scope: !11)
!23 = !DILocalVariable(name: "buffer", scope: !24, file: !12, line: 36, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 36, column: 13, scope: !24)
!29 = !DILocation(line: 39, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !24, file: !12, line: 39, column: 13)
!31 = !DILocation(line: 39, column: 18, scope: !30)
!32 = !DILocation(line: 39, column: 13, scope: !24)
!33 = !DILocation(line: 41, column: 33, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 40, column: 9)
!35 = !DILocation(line: 41, column: 26, scope: !34)
!36 = !DILocation(line: 41, column: 13, scope: !34)
!37 = !DILocation(line: 42, column: 9, scope: !34)
!38 = !DILocation(line: 45, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !12, line: 44, column: 9)
!40 = !DILocation(line: 48, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 22, type: !42, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!42 = !DISubroutineType(types: !43)
!43 = !{!17, !17}
!44 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !12, line: 22, type: !17)
!45 = !DILocation(line: 22, column: 26, scope: !41)
!46 = !DILocation(line: 25, column: 10, scope: !41)
!47 = !DILocation(line: 26, column: 12, scope: !41)
!48 = !DILocation(line: 26, column: 5, scope: !41)
!49 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_42_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!50 = !DILocation(line: 114, column: 5, scope: !49)
!51 = !DILocation(line: 115, column: 5, scope: !49)
!52 = !DILocation(line: 116, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !54, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!54 = !DISubroutineType(types: !55)
!55 = !{!17, !17, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 127, type: !17)
!60 = !DILocation(line: 127, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 127, type: !56)
!62 = !DILocation(line: 127, column: 27, scope: !53)
!63 = !DILocation(line: 130, column: 22, scope: !53)
!64 = !DILocation(line: 130, column: 12, scope: !53)
!65 = !DILocation(line: 130, column: 5, scope: !53)
!66 = !DILocation(line: 132, column: 5, scope: !53)
!67 = !DILocation(line: 133, column: 5, scope: !53)
!68 = !DILocation(line: 134, column: 5, scope: !53)
!69 = !DILocation(line: 137, column: 5, scope: !53)
!70 = !DILocation(line: 138, column: 5, scope: !53)
!71 = !DILocation(line: 139, column: 5, scope: !53)
!72 = !DILocation(line: 141, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 94, type: !17)
!75 = !DILocation(line: 94, column: 9, scope: !73)
!76 = !DILocation(line: 96, column: 10, scope: !73)
!77 = !DILocation(line: 97, column: 26, scope: !73)
!78 = !DILocation(line: 97, column: 12, scope: !73)
!79 = !DILocation(line: 97, column: 10, scope: !73)
!80 = !DILocalVariable(name: "buffer", scope: !81, file: !12, line: 99, type: !25)
!81 = distinct !DILexicalBlock(scope: !73, file: !12, line: 98, column: 5)
!82 = !DILocation(line: 99, column: 13, scope: !81)
!83 = !DILocation(line: 101, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !12, line: 101, column: 13)
!85 = !DILocation(line: 101, column: 18, scope: !84)
!86 = !DILocation(line: 101, column: 23, scope: !84)
!87 = !DILocation(line: 101, column: 26, scope: !84)
!88 = !DILocation(line: 101, column: 31, scope: !84)
!89 = !DILocation(line: 101, column: 13, scope: !81)
!90 = !DILocation(line: 103, column: 33, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !12, line: 102, column: 9)
!92 = !DILocation(line: 103, column: 26, scope: !91)
!93 = !DILocation(line: 103, column: 13, scope: !91)
!94 = !DILocation(line: 104, column: 9, scope: !91)
!95 = !DILocation(line: 107, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !84, file: !12, line: 106, column: 9)
!97 = !DILocation(line: 110, column: 1, scope: !73)
!98 = distinct !DISubprogram(name: "goodB2GSource", scope: !12, file: !12, line: 85, type: !42, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!99 = !DILocalVariable(name: "data", arg: 1, scope: !98, file: !12, line: 85, type: !17)
!100 = !DILocation(line: 85, column: 30, scope: !98)
!101 = !DILocation(line: 88, column: 10, scope: !98)
!102 = !DILocation(line: 89, column: 12, scope: !98)
!103 = !DILocation(line: 89, column: 5, scope: !98)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 65, type: !17)
!106 = !DILocation(line: 65, column: 9, scope: !104)
!107 = !DILocation(line: 67, column: 10, scope: !104)
!108 = !DILocation(line: 68, column: 26, scope: !104)
!109 = !DILocation(line: 68, column: 12, scope: !104)
!110 = !DILocation(line: 68, column: 10, scope: !104)
!111 = !DILocalVariable(name: "buffer", scope: !112, file: !12, line: 70, type: !25)
!112 = distinct !DILexicalBlock(scope: !104, file: !12, line: 69, column: 5)
!113 = !DILocation(line: 70, column: 13, scope: !112)
!114 = !DILocation(line: 73, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 73, column: 13)
!116 = !DILocation(line: 73, column: 18, scope: !115)
!117 = !DILocation(line: 73, column: 13, scope: !112)
!118 = !DILocation(line: 75, column: 33, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 74, column: 9)
!120 = !DILocation(line: 75, column: 26, scope: !119)
!121 = !DILocation(line: 75, column: 13, scope: !119)
!122 = !DILocation(line: 76, column: 9, scope: !119)
!123 = !DILocation(line: 79, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !115, file: !12, line: 78, column: 9)
!125 = !DILocation(line: 82, column: 1, scope: !104)
!126 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 55, type: !42, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!127 = !DILocalVariable(name: "data", arg: 1, scope: !126, file: !12, line: 55, type: !17)
!128 = !DILocation(line: 55, column: 30, scope: !126)
!129 = !DILocation(line: 59, column: 10, scope: !126)
!130 = !DILocation(line: 60, column: 12, scope: !126)
!131 = !DILocation(line: 60, column: 5, scope: !126)
