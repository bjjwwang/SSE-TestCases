; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@badStatic = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !7
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !11
@goodG2BStatic = internal global i32 0, align 4, !dbg !13

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fscanf_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 -1, i32* %data, align 4, !dbg !28
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !29
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !30
  store i32 1, i32* @badStatic, align 4, !dbg !31
  %1 = load i32, i32* %data, align 4, !dbg !32
  call void @badSink(i32 noundef %1), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !35 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i32, i32* @badStatic, align 4, !dbg !40
  %tobool = icmp ne i32 %0, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.end2, !dbg !42

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !43, metadata !DIExpression()), !dbg !49
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !49
  %2 = load i32, i32* %data.addr, align 4, !dbg !50
  %cmp = icmp sge i32 %2, 0, !dbg !52
  br i1 %cmp, label %if.then1, label %if.else, !dbg !53

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !54
  %idxprom = sext i32 %3 to i64, !dbg !56
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !56
  %4 = load i32, i32* %arrayidx, align 4, !dbg !56
  call void @printIntLine(i32 noundef %4), !dbg !57
  br label %if.end, !dbg !58

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !59
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !61

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fscanf_21_good() #0 !dbg !63 {
entry:
  call void @goodB2G1(), !dbg !64
  call void @goodB2G2(), !dbg !65
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* noundef null), !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 noundef %conv), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__CWE129_fscanf_21_good(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__CWE129_fscanf_21_bad(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !88 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 -1, i32* %data, align 4, !dbg !91
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !92
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !93
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !94
  %1 = load i32, i32* %data, align 4, !dbg !95
  call void @goodB2G1Sink(i32 noundef %1), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1Sink(i32 noundef %data) #0 !dbg !98 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !101
  %tobool = icmp ne i32 %0, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.else, !dbg !103

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !104
  br label %if.end4, !dbg !106

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !107, metadata !DIExpression()), !dbg !110
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !110
  %2 = load i32, i32* %data.addr, align 4, !dbg !111
  %cmp = icmp sge i32 %2, 0, !dbg !113
  br i1 %cmp, label %land.lhs.true, label %if.else3, !dbg !114

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !115
  %cmp1 = icmp slt i32 %3, 10, !dbg !116
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !117

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !118
  %idxprom = sext i32 %4 to i64, !dbg !120
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !120
  %5 = load i32, i32* %arrayidx, align 4, !dbg !120
  call void @printIntLine(i32 noundef %5), !dbg !121
  br label %if.end, !dbg !122

if.else3:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !126 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !127, metadata !DIExpression()), !dbg !128
  store i32 -1, i32* %data, align 4, !dbg !129
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !130
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !131
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !132
  %1 = load i32, i32* %data, align 4, !dbg !133
  call void @goodB2G2Sink(i32 noundef %1), !dbg !134
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2Sink(i32 noundef %data) #0 !dbg !136 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !137, metadata !DIExpression()), !dbg !138
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !139
  %tobool = icmp ne i32 %0, 0, !dbg !139
  br i1 %tobool, label %if.then, label %if.end3, !dbg !141

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !142, metadata !DIExpression()), !dbg !145
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !145
  %2 = load i32, i32* %data.addr, align 4, !dbg !146
  %cmp = icmp sge i32 %2, 0, !dbg !148
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !149

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !150
  %cmp1 = icmp slt i32 %3, 10, !dbg !151
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !152

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !153
  %idxprom = sext i32 %4 to i64, !dbg !155
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !155
  %5 = load i32, i32* %arrayidx, align 4, !dbg !155
  call void @printIntLine(i32 noundef %5), !dbg !156
  br label %if.end, !dbg !157

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !158
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end3, !dbg !160

if.end3:                                          ; preds = %if.end, %entry
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !162 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !163, metadata !DIExpression()), !dbg !164
  store i32 -1, i32* %data, align 4, !dbg !165
  store i32 7, i32* %data, align 4, !dbg !166
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !167
  %0 = load i32, i32* %data, align 4, !dbg !168
  call void @goodG2BSink(i32 noundef %0), !dbg !169
  ret void, !dbg !170
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !171 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !172, metadata !DIExpression()), !dbg !173
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !174
  %tobool = icmp ne i32 %0, 0, !dbg !174
  br i1 %tobool, label %if.then, label %if.end2, !dbg !176

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !177, metadata !DIExpression()), !dbg !180
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !180
  %2 = load i32, i32* %data.addr, align 4, !dbg !181
  %cmp = icmp sge i32 %2, 0, !dbg !183
  br i1 %cmp, label %if.then1, label %if.else, !dbg !184

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !185
  %idxprom = sext i32 %3 to i64, !dbg !187
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !187
  %4 = load i32, i32* %arrayidx, align 4, !dbg !187
  call void @printIntLine(i32 noundef %4), !dbg !188
  br label %if.end, !dbg !189

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !190
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !192

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !193
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !9, line: 23, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7, !11, !13}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !9, line: 61, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !9, line: 62, type: !10, isLocal: true, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !9, line: 63, type: !10, isLocal: true, isDefinition: true)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Homebrew clang version 14.0.6"}
!22 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_21_bad", scope: !9, file: !9, line: 45, type: !23, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !{}
!26 = !DILocalVariable(name: "data", scope: !22, file: !9, line: 47, type: !10)
!27 = !DILocation(line: 47, column: 9, scope: !22)
!28 = !DILocation(line: 49, column: 10, scope: !22)
!29 = !DILocation(line: 51, column: 12, scope: !22)
!30 = !DILocation(line: 51, column: 5, scope: !22)
!31 = !DILocation(line: 52, column: 15, scope: !22)
!32 = !DILocation(line: 53, column: 13, scope: !22)
!33 = !DILocation(line: 53, column: 5, scope: !22)
!34 = !DILocation(line: 54, column: 1, scope: !22)
!35 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 25, type: !36, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !10}
!38 = !DILocalVariable(name: "data", arg: 1, scope: !35, file: !9, line: 25, type: !10)
!39 = !DILocation(line: 25, column: 25, scope: !35)
!40 = !DILocation(line: 27, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !9, line: 27, column: 8)
!42 = !DILocation(line: 27, column: 8, scope: !35)
!43 = !DILocalVariable(name: "buffer", scope: !44, file: !9, line: 30, type: !46)
!44 = distinct !DILexicalBlock(scope: !45, file: !9, line: 29, column: 9)
!45 = distinct !DILexicalBlock(scope: !41, file: !9, line: 28, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 10)
!49 = !DILocation(line: 30, column: 17, scope: !44)
!50 = !DILocation(line: 33, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !44, file: !9, line: 33, column: 17)
!52 = !DILocation(line: 33, column: 22, scope: !51)
!53 = !DILocation(line: 33, column: 17, scope: !44)
!54 = !DILocation(line: 35, column: 37, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !9, line: 34, column: 13)
!56 = !DILocation(line: 35, column: 30, scope: !55)
!57 = !DILocation(line: 35, column: 17, scope: !55)
!58 = !DILocation(line: 36, column: 13, scope: !55)
!59 = !DILocation(line: 39, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !51, file: !9, line: 38, column: 13)
!61 = !DILocation(line: 42, column: 5, scope: !45)
!62 = !DILocation(line: 43, column: 1, scope: !35)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_21_good", scope: !9, file: !9, line: 165, type: !23, scopeLine: 166, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!64 = !DILocation(line: 167, column: 5, scope: !63)
!65 = !DILocation(line: 168, column: 5, scope: !63)
!66 = !DILocation(line: 169, column: 5, scope: !63)
!67 = !DILocation(line: 170, column: 1, scope: !63)
!68 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 181, type: !69, scopeLine: 182, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!69 = !DISubroutineType(types: !70)
!70 = !{!10, !10, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !9, line: 181, type: !10)
!75 = !DILocation(line: 181, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !9, line: 181, type: !71)
!77 = !DILocation(line: 181, column: 27, scope: !68)
!78 = !DILocation(line: 184, column: 22, scope: !68)
!79 = !DILocation(line: 184, column: 12, scope: !68)
!80 = !DILocation(line: 184, column: 5, scope: !68)
!81 = !DILocation(line: 186, column: 5, scope: !68)
!82 = !DILocation(line: 187, column: 5, scope: !68)
!83 = !DILocation(line: 188, column: 5, scope: !68)
!84 = !DILocation(line: 191, column: 5, scope: !68)
!85 = !DILocation(line: 192, column: 5, scope: !68)
!86 = !DILocation(line: 193, column: 5, scope: !68)
!87 = !DILocation(line: 195, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodB2G1", scope: !9, file: !9, line: 90, type: !23, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!89 = !DILocalVariable(name: "data", scope: !88, file: !9, line: 92, type: !10)
!90 = !DILocation(line: 92, column: 9, scope: !88)
!91 = !DILocation(line: 94, column: 10, scope: !88)
!92 = !DILocation(line: 96, column: 12, scope: !88)
!93 = !DILocation(line: 96, column: 5, scope: !88)
!94 = !DILocation(line: 97, column: 20, scope: !88)
!95 = !DILocation(line: 98, column: 18, scope: !88)
!96 = !DILocation(line: 98, column: 5, scope: !88)
!97 = !DILocation(line: 99, column: 1, scope: !88)
!98 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !9, file: !9, line: 66, type: !36, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!99 = !DILocalVariable(name: "data", arg: 1, scope: !98, file: !9, line: 66, type: !10)
!100 = !DILocation(line: 66, column: 30, scope: !98)
!101 = !DILocation(line: 68, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !9, line: 68, column: 8)
!103 = !DILocation(line: 68, column: 8, scope: !98)
!104 = !DILocation(line: 71, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !9, line: 69, column: 5)
!106 = !DILocation(line: 72, column: 5, scope: !105)
!107 = !DILocalVariable(name: "buffer", scope: !108, file: !9, line: 76, type: !46)
!108 = distinct !DILexicalBlock(scope: !109, file: !9, line: 75, column: 9)
!109 = distinct !DILexicalBlock(scope: !102, file: !9, line: 74, column: 5)
!110 = !DILocation(line: 76, column: 17, scope: !108)
!111 = !DILocation(line: 78, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !9, line: 78, column: 17)
!113 = !DILocation(line: 78, column: 22, scope: !112)
!114 = !DILocation(line: 78, column: 27, scope: !112)
!115 = !DILocation(line: 78, column: 30, scope: !112)
!116 = !DILocation(line: 78, column: 35, scope: !112)
!117 = !DILocation(line: 78, column: 17, scope: !108)
!118 = !DILocation(line: 80, column: 37, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !9, line: 79, column: 13)
!120 = !DILocation(line: 80, column: 30, scope: !119)
!121 = !DILocation(line: 80, column: 17, scope: !119)
!122 = !DILocation(line: 81, column: 13, scope: !119)
!123 = !DILocation(line: 84, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !112, file: !9, line: 83, column: 13)
!125 = !DILocation(line: 88, column: 1, scope: !98)
!126 = distinct !DISubprogram(name: "goodB2G2", scope: !9, file: !9, line: 121, type: !23, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!127 = !DILocalVariable(name: "data", scope: !126, file: !9, line: 123, type: !10)
!128 = !DILocation(line: 123, column: 9, scope: !126)
!129 = !DILocation(line: 125, column: 10, scope: !126)
!130 = !DILocation(line: 127, column: 12, scope: !126)
!131 = !DILocation(line: 127, column: 5, scope: !126)
!132 = !DILocation(line: 128, column: 20, scope: !126)
!133 = !DILocation(line: 129, column: 18, scope: !126)
!134 = !DILocation(line: 129, column: 5, scope: !126)
!135 = !DILocation(line: 130, column: 1, scope: !126)
!136 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !9, file: !9, line: 102, type: !36, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!137 = !DILocalVariable(name: "data", arg: 1, scope: !136, file: !9, line: 102, type: !10)
!138 = !DILocation(line: 102, column: 30, scope: !136)
!139 = !DILocation(line: 104, column: 8, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !9, line: 104, column: 8)
!141 = !DILocation(line: 104, column: 8, scope: !136)
!142 = !DILocalVariable(name: "buffer", scope: !143, file: !9, line: 107, type: !46)
!143 = distinct !DILexicalBlock(scope: !144, file: !9, line: 106, column: 9)
!144 = distinct !DILexicalBlock(scope: !140, file: !9, line: 105, column: 5)
!145 = !DILocation(line: 107, column: 17, scope: !143)
!146 = !DILocation(line: 109, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !9, line: 109, column: 17)
!148 = !DILocation(line: 109, column: 22, scope: !147)
!149 = !DILocation(line: 109, column: 27, scope: !147)
!150 = !DILocation(line: 109, column: 30, scope: !147)
!151 = !DILocation(line: 109, column: 35, scope: !147)
!152 = !DILocation(line: 109, column: 17, scope: !143)
!153 = !DILocation(line: 111, column: 37, scope: !154)
!154 = distinct !DILexicalBlock(scope: !147, file: !9, line: 110, column: 13)
!155 = !DILocation(line: 111, column: 30, scope: !154)
!156 = !DILocation(line: 111, column: 17, scope: !154)
!157 = !DILocation(line: 112, column: 13, scope: !154)
!158 = !DILocation(line: 115, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !147, file: !9, line: 114, column: 13)
!160 = !DILocation(line: 118, column: 5, scope: !144)
!161 = !DILocation(line: 119, column: 1, scope: !136)
!162 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 153, type: !23, scopeLine: 154, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!163 = !DILocalVariable(name: "data", scope: !162, file: !9, line: 155, type: !10)
!164 = !DILocation(line: 155, column: 9, scope: !162)
!165 = !DILocation(line: 157, column: 10, scope: !162)
!166 = !DILocation(line: 160, column: 10, scope: !162)
!167 = !DILocation(line: 161, column: 19, scope: !162)
!168 = !DILocation(line: 162, column: 17, scope: !162)
!169 = !DILocation(line: 162, column: 5, scope: !162)
!170 = !DILocation(line: 163, column: 1, scope: !162)
!171 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 133, type: !36, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!172 = !DILocalVariable(name: "data", arg: 1, scope: !171, file: !9, line: 133, type: !10)
!173 = !DILocation(line: 133, column: 29, scope: !171)
!174 = !DILocation(line: 135, column: 8, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !9, line: 135, column: 8)
!176 = !DILocation(line: 135, column: 8, scope: !171)
!177 = !DILocalVariable(name: "buffer", scope: !178, file: !9, line: 138, type: !46)
!178 = distinct !DILexicalBlock(scope: !179, file: !9, line: 137, column: 9)
!179 = distinct !DILexicalBlock(scope: !175, file: !9, line: 136, column: 5)
!180 = !DILocation(line: 138, column: 17, scope: !178)
!181 = !DILocation(line: 141, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !9, line: 141, column: 17)
!183 = !DILocation(line: 141, column: 22, scope: !182)
!184 = !DILocation(line: 141, column: 17, scope: !178)
!185 = !DILocation(line: 143, column: 37, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !9, line: 142, column: 13)
!187 = !DILocation(line: 143, column: 30, scope: !186)
!188 = !DILocation(line: 143, column: 17, scope: !186)
!189 = !DILocation(line: 144, column: 13, scope: !186)
!190 = !DILocation(line: 147, column: 17, scope: !191)
!191 = distinct !DILexicalBlock(scope: !182, file: !9, line: 146, column: 13)
!192 = !DILocation(line: 150, column: 5, scope: !179)
!193 = !DILocation(line: 151, column: 1, scope: !171)
