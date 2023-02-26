; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  store i32 10, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !28
  %1 = load i32, i32* %data, align 4, !dbg !29
  %cmp = icmp sge i32 %1, 0, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !33
  %idxprom = sext i32 %2 to i64, !dbg !35
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !35
  store i32 1, i32* %arrayidx, align 4, !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !40
  %cmp1 = icmp slt i32 %3, 10, !dbg !42
  br i1 %cmp1, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !44
  %idxprom2 = sext i32 %4 to i64, !dbg !46
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !46
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !46
  call void @printIntLine(i32 noundef %5), !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %6, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !54

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !55
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  call void @goodB2G(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* noundef null), !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 noundef %conv), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_good(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_bad(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32 -1, i32* %data, align 4, !dbg !85
  store i32 7, i32* %data, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %i, metadata !87, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !91
  %1 = load i32, i32* %data, align 4, !dbg !92
  %cmp = icmp sge i32 %1, 0, !dbg !94
  br i1 %cmp, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !96
  %idxprom = sext i32 %2 to i64, !dbg !98
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !98
  store i32 1, i32* %arrayidx, align 4, !dbg !99
  store i32 0, i32* %i, align 4, !dbg !100
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !103
  %cmp1 = icmp slt i32 %3, 10, !dbg !105
  br i1 %cmp1, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !107
  %idxprom2 = sext i32 %4 to i64, !dbg !109
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !109
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !109
  call void @printIntLine(i32 noundef %5), !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !112
  %inc = add nsw i32 %6, 1, !dbg !112
  store i32 %inc, i32* %i, align 4, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !120 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i32 -1, i32* %data, align 4, !dbg !123
  store i32 10, i32* %data, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata i32* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !128, metadata !DIExpression()), !dbg !129
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !129
  %1 = load i32, i32* %data, align 4, !dbg !130
  %cmp = icmp sge i32 %1, 0, !dbg !132
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !133

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !134
  %cmp1 = icmp slt i32 %2, 10, !dbg !135
  br i1 %cmp1, label %if.then, label %if.else, !dbg !136

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !137
  %idxprom = sext i32 %3 to i64, !dbg !139
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !139
  store i32 1, i32* %arrayidx, align 4, !dbg !140
  store i32 0, i32* %i, align 4, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !144
  %cmp2 = icmp slt i32 %4, 10, !dbg !146
  br i1 %cmp2, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !148
  %idxprom3 = sext i32 %5 to i64, !dbg !150
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !150
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !150
  call void @printIntLine(i32 noundef %6), !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !153
  %inc = add nsw i32 %7, 1, !dbg !153
  store i32 %inc, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !157

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !158
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 24, column: 9, scope: !11)
!19 = !DILocation(line: 26, column: 10, scope: !11)
!20 = !DILocation(line: 28, column: 10, scope: !11)
!21 = !DILocalVariable(name: "i", scope: !22, file: !12, line: 30, type: !17)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!23 = !DILocation(line: 30, column: 13, scope: !22)
!24 = !DILocalVariable(name: "buffer", scope: !22, file: !12, line: 31, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 31, column: 13, scope: !22)
!29 = !DILocation(line: 34, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !22, file: !12, line: 34, column: 13)
!31 = !DILocation(line: 34, column: 18, scope: !30)
!32 = !DILocation(line: 34, column: 13, scope: !22)
!33 = !DILocation(line: 36, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 35, column: 9)
!35 = !DILocation(line: 36, column: 13, scope: !34)
!36 = !DILocation(line: 36, column: 26, scope: !34)
!37 = !DILocation(line: 38, column: 19, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 38, column: 13)
!39 = !DILocation(line: 38, column: 17, scope: !38)
!40 = !DILocation(line: 38, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 38, column: 13)
!42 = !DILocation(line: 38, column: 26, scope: !41)
!43 = !DILocation(line: 38, column: 13, scope: !38)
!44 = !DILocation(line: 40, column: 37, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 39, column: 13)
!46 = !DILocation(line: 40, column: 30, scope: !45)
!47 = !DILocation(line: 40, column: 17, scope: !45)
!48 = !DILocation(line: 41, column: 13, scope: !45)
!49 = !DILocation(line: 38, column: 33, scope: !41)
!50 = !DILocation(line: 38, column: 13, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 41, column: 13, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 42, column: 9, scope: !34)
!55 = !DILocation(line: 45, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !30, file: !12, line: 44, column: 9)
!57 = !DILocation(line: 48, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_01_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!59 = !DILocation(line: 114, column: 5, scope: !58)
!60 = !DILocation(line: 115, column: 5, scope: !58)
!61 = !DILocation(line: 116, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !63, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!63 = !DISubroutineType(types: !64)
!64 = !{!17, !17, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 127, type: !17)
!69 = !DILocation(line: 127, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 127, type: !65)
!71 = !DILocation(line: 127, column: 27, scope: !62)
!72 = !DILocation(line: 130, column: 22, scope: !62)
!73 = !DILocation(line: 130, column: 12, scope: !62)
!74 = !DILocation(line: 130, column: 5, scope: !62)
!75 = !DILocation(line: 132, column: 5, scope: !62)
!76 = !DILocation(line: 133, column: 5, scope: !62)
!77 = !DILocation(line: 134, column: 5, scope: !62)
!78 = !DILocation(line: 137, column: 5, scope: !62)
!79 = !DILocation(line: 138, column: 5, scope: !62)
!80 = !DILocation(line: 139, column: 5, scope: !62)
!81 = !DILocation(line: 141, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 57, type: !17)
!84 = !DILocation(line: 57, column: 9, scope: !82)
!85 = !DILocation(line: 59, column: 10, scope: !82)
!86 = !DILocation(line: 62, column: 10, scope: !82)
!87 = !DILocalVariable(name: "i", scope: !88, file: !12, line: 64, type: !17)
!88 = distinct !DILexicalBlock(scope: !82, file: !12, line: 63, column: 5)
!89 = !DILocation(line: 64, column: 13, scope: !88)
!90 = !DILocalVariable(name: "buffer", scope: !88, file: !12, line: 65, type: !25)
!91 = !DILocation(line: 65, column: 13, scope: !88)
!92 = !DILocation(line: 68, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !12, line: 68, column: 13)
!94 = !DILocation(line: 68, column: 18, scope: !93)
!95 = !DILocation(line: 68, column: 13, scope: !88)
!96 = !DILocation(line: 70, column: 20, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !12, line: 69, column: 9)
!98 = !DILocation(line: 70, column: 13, scope: !97)
!99 = !DILocation(line: 70, column: 26, scope: !97)
!100 = !DILocation(line: 72, column: 19, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 72, column: 13)
!102 = !DILocation(line: 72, column: 17, scope: !101)
!103 = !DILocation(line: 72, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !12, line: 72, column: 13)
!105 = !DILocation(line: 72, column: 26, scope: !104)
!106 = !DILocation(line: 72, column: 13, scope: !101)
!107 = !DILocation(line: 74, column: 37, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !12, line: 73, column: 13)
!109 = !DILocation(line: 74, column: 30, scope: !108)
!110 = !DILocation(line: 74, column: 17, scope: !108)
!111 = !DILocation(line: 75, column: 13, scope: !108)
!112 = !DILocation(line: 72, column: 33, scope: !104)
!113 = !DILocation(line: 72, column: 13, scope: !104)
!114 = distinct !{!114, !106, !115, !53}
!115 = !DILocation(line: 75, column: 13, scope: !101)
!116 = !DILocation(line: 76, column: 9, scope: !97)
!117 = !DILocation(line: 79, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !93, file: !12, line: 78, column: 9)
!119 = !DILocation(line: 82, column: 1, scope: !82)
!120 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!121 = !DILocalVariable(name: "data", scope: !120, file: !12, line: 87, type: !17)
!122 = !DILocation(line: 87, column: 9, scope: !120)
!123 = !DILocation(line: 89, column: 10, scope: !120)
!124 = !DILocation(line: 91, column: 10, scope: !120)
!125 = !DILocalVariable(name: "i", scope: !126, file: !12, line: 93, type: !17)
!126 = distinct !DILexicalBlock(scope: !120, file: !12, line: 92, column: 5)
!127 = !DILocation(line: 93, column: 13, scope: !126)
!128 = !DILocalVariable(name: "buffer", scope: !126, file: !12, line: 94, type: !25)
!129 = !DILocation(line: 94, column: 13, scope: !126)
!130 = !DILocation(line: 96, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !12, line: 96, column: 13)
!132 = !DILocation(line: 96, column: 18, scope: !131)
!133 = !DILocation(line: 96, column: 23, scope: !131)
!134 = !DILocation(line: 96, column: 26, scope: !131)
!135 = !DILocation(line: 96, column: 31, scope: !131)
!136 = !DILocation(line: 96, column: 13, scope: !126)
!137 = !DILocation(line: 98, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !131, file: !12, line: 97, column: 9)
!139 = !DILocation(line: 98, column: 13, scope: !138)
!140 = !DILocation(line: 98, column: 26, scope: !138)
!141 = !DILocation(line: 100, column: 19, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !12, line: 100, column: 13)
!143 = !DILocation(line: 100, column: 17, scope: !142)
!144 = !DILocation(line: 100, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !12, line: 100, column: 13)
!146 = !DILocation(line: 100, column: 26, scope: !145)
!147 = !DILocation(line: 100, column: 13, scope: !142)
!148 = !DILocation(line: 102, column: 37, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !12, line: 101, column: 13)
!150 = !DILocation(line: 102, column: 30, scope: !149)
!151 = !DILocation(line: 102, column: 17, scope: !149)
!152 = !DILocation(line: 103, column: 13, scope: !149)
!153 = !DILocation(line: 100, column: 33, scope: !145)
!154 = !DILocation(line: 100, column: 13, scope: !145)
!155 = distinct !{!155, !147, !156, !53}
!156 = !DILocation(line: 103, column: 13, scope: !142)
!157 = !DILocation(line: 104, column: 9, scope: !138)
!158 = !DILocation(line: 107, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !131, file: !12, line: 106, column: 9)
!160 = !DILocation(line: 110, column: 1, scope: !120)
