; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i32* %data, i32** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* %data, i32** %dataPtr2, align 8, !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !25, metadata !DIExpression()), !dbg !27
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !28
  %1 = load i32, i32* %0, align 4, !dbg !29
  store i32 %1, i32* %data1, align 4, !dbg !27
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !30
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %2, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data1), !dbg !31
  %3 = load i32, i32* %data1, align 4, !dbg !32
  %4 = load i32*, i32** %dataPtr1, align 8, !dbg !33
  store i32 %3, i32* %4, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !35, metadata !DIExpression()), !dbg !37
  %5 = load i32*, i32** %dataPtr2, align 8, !dbg !38
  %6 = load i32, i32* %5, align 4, !dbg !39
  store i32 %6, i32* %data2, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %i, metadata !40, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !43, metadata !DIExpression()), !dbg !47
  %7 = bitcast [10 x i32]* %buffer to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !47
  %8 = load i32, i32* %data2, align 4, !dbg !48
  %cmp = icmp sge i32 %8, 0, !dbg !50
  br i1 %cmp, label %if.then, label %if.else, !dbg !51

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %data2, align 4, !dbg !52
  %idxprom = sext i32 %9 to i64, !dbg !54
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !54
  store i32 1, i32* %arrayidx, align 4, !dbg !55
  store i32 0, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.then
  %10 = load i32, i32* %i, align 4, !dbg !59
  %cmp3 = icmp slt i32 %10, 10, !dbg !61
  br i1 %cmp3, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %11 = load i32, i32* %i, align 4, !dbg !63
  %idxprom4 = sext i32 %11 to i64, !dbg !65
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !65
  %12 = load i32, i32* %arrayidx5, align 4, !dbg !65
  call void @printIntLine(i32 noundef %12), !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4, !dbg !68
  %inc = add nsw i32 %13, 1, !dbg !68
  store i32 %inc, i32* %i, align 4, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !73

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_32_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  call void @goodB2G(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* noundef null), !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 noundef %conv), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_32_good(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_32_bad(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !104, metadata !DIExpression()), !dbg !105
  store i32* %data, i32** %dataPtr1, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !106, metadata !DIExpression()), !dbg !107
  store i32* %data, i32** %dataPtr2, align 8, !dbg !107
  store i32 -1, i32* %data, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !109, metadata !DIExpression()), !dbg !111
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !112
  %1 = load i32, i32* %0, align 4, !dbg !113
  store i32 %1, i32* %data1, align 4, !dbg !111
  store i32 7, i32* %data1, align 4, !dbg !114
  %2 = load i32, i32* %data1, align 4, !dbg !115
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !116
  store i32 %2, i32* %3, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !118, metadata !DIExpression()), !dbg !120
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !121
  %5 = load i32, i32* %4, align 4, !dbg !122
  store i32 %5, i32* %data2, align 4, !dbg !120
  call void @llvm.dbg.declare(metadata i32* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !126, metadata !DIExpression()), !dbg !127
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !127
  %7 = load i32, i32* %data2, align 4, !dbg !128
  %cmp = icmp sge i32 %7, 0, !dbg !130
  br i1 %cmp, label %if.then, label %if.else, !dbg !131

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !132
  %idxprom = sext i32 %8 to i64, !dbg !134
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !134
  store i32 1, i32* %arrayidx, align 4, !dbg !135
  store i32 0, i32* %i, align 4, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !139
  %cmp3 = icmp slt i32 %9, 10, !dbg !141
  br i1 %cmp3, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !143
  %idxprom4 = sext i32 %10 to i64, !dbg !145
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !145
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !145
  call void @printIntLine(i32 noundef %11), !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !148
  %inc = add nsw i32 %12, 1, !dbg !148
  store i32 %inc, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !152

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !153
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !156 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !159, metadata !DIExpression()), !dbg !160
  store i32* %data, i32** %dataPtr1, align 8, !dbg !160
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !161, metadata !DIExpression()), !dbg !162
  store i32* %data, i32** %dataPtr2, align 8, !dbg !162
  store i32 -1, i32* %data, align 4, !dbg !163
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !164, metadata !DIExpression()), !dbg !166
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !167
  %1 = load i32, i32* %0, align 4, !dbg !168
  store i32 %1, i32* %data1, align 4, !dbg !166
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !169
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %2, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data1), !dbg !170
  %3 = load i32, i32* %data1, align 4, !dbg !171
  %4 = load i32*, i32** %dataPtr1, align 8, !dbg !172
  store i32 %3, i32* %4, align 4, !dbg !173
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !174, metadata !DIExpression()), !dbg !176
  %5 = load i32*, i32** %dataPtr2, align 8, !dbg !177
  %6 = load i32, i32* %5, align 4, !dbg !178
  store i32 %6, i32* %data2, align 4, !dbg !176
  call void @llvm.dbg.declare(metadata i32* %i, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !182, metadata !DIExpression()), !dbg !183
  %7 = bitcast [10 x i32]* %buffer to i8*, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !183
  %8 = load i32, i32* %data2, align 4, !dbg !184
  %cmp = icmp sge i32 %8, 0, !dbg !186
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !187

land.lhs.true:                                    ; preds = %entry
  %9 = load i32, i32* %data2, align 4, !dbg !188
  %cmp3 = icmp slt i32 %9, 10, !dbg !189
  br i1 %cmp3, label %if.then, label %if.else, !dbg !190

if.then:                                          ; preds = %land.lhs.true
  %10 = load i32, i32* %data2, align 4, !dbg !191
  %idxprom = sext i32 %10 to i64, !dbg !193
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !193
  store i32 1, i32* %arrayidx, align 4, !dbg !194
  store i32 0, i32* %i, align 4, !dbg !195
  br label %for.cond, !dbg !197

for.cond:                                         ; preds = %for.inc, %if.then
  %11 = load i32, i32* %i, align 4, !dbg !198
  %cmp4 = icmp slt i32 %11, 10, !dbg !200
  br i1 %cmp4, label %for.body, label %for.end, !dbg !201

for.body:                                         ; preds = %for.cond
  %12 = load i32, i32* %i, align 4, !dbg !202
  %idxprom5 = sext i32 %12 to i64, !dbg !204
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !204
  %13 = load i32, i32* %arrayidx6, align 4, !dbg !204
  call void @printIntLine(i32 noundef %13), !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4, !dbg !207
  %inc = add nsw i32 %14, 1, !dbg !207
  store i32 %inc, i32* %i, align 4, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !211

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !212
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !214
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_32_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 24, column: 9, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 25, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!21 = !DILocation(line: 25, column: 10, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 26, type: !20)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 28, column: 10, scope: !11)
!25 = !DILocalVariable(name: "data", scope: !26, file: !12, line: 30, type: !17)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!27 = !DILocation(line: 30, column: 13, scope: !26)
!28 = !DILocation(line: 30, column: 21, scope: !26)
!29 = !DILocation(line: 30, column: 20, scope: !26)
!30 = !DILocation(line: 32, column: 16, scope: !26)
!31 = !DILocation(line: 32, column: 9, scope: !26)
!32 = !DILocation(line: 33, column: 21, scope: !26)
!33 = !DILocation(line: 33, column: 10, scope: !26)
!34 = !DILocation(line: 33, column: 19, scope: !26)
!35 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 36, type: !17)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!37 = !DILocation(line: 36, column: 13, scope: !36)
!38 = !DILocation(line: 36, column: 21, scope: !36)
!39 = !DILocation(line: 36, column: 20, scope: !36)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 38, type: !17)
!41 = distinct !DILexicalBlock(scope: !36, file: !12, line: 37, column: 9)
!42 = !DILocation(line: 38, column: 17, scope: !41)
!43 = !DILocalVariable(name: "buffer", scope: !41, file: !12, line: 39, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 10)
!47 = !DILocation(line: 39, column: 17, scope: !41)
!48 = !DILocation(line: 42, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !12, line: 42, column: 17)
!50 = !DILocation(line: 42, column: 22, scope: !49)
!51 = !DILocation(line: 42, column: 17, scope: !41)
!52 = !DILocation(line: 44, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 43, column: 13)
!54 = !DILocation(line: 44, column: 17, scope: !53)
!55 = !DILocation(line: 44, column: 30, scope: !53)
!56 = !DILocation(line: 46, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 46, column: 17)
!58 = !DILocation(line: 46, column: 21, scope: !57)
!59 = !DILocation(line: 46, column: 28, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 46, column: 17)
!61 = !DILocation(line: 46, column: 30, scope: !60)
!62 = !DILocation(line: 46, column: 17, scope: !57)
!63 = !DILocation(line: 48, column: 41, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !12, line: 47, column: 17)
!65 = !DILocation(line: 48, column: 34, scope: !64)
!66 = !DILocation(line: 48, column: 21, scope: !64)
!67 = !DILocation(line: 49, column: 17, scope: !64)
!68 = !DILocation(line: 46, column: 37, scope: !60)
!69 = !DILocation(line: 46, column: 17, scope: !60)
!70 = distinct !{!70, !62, !71, !72}
!71 = !DILocation(line: 49, column: 17, scope: !57)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 50, column: 13, scope: !53)
!74 = !DILocation(line: 53, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !49, file: !12, line: 52, column: 13)
!76 = !DILocation(line: 57, column: 1, scope: !11)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_32_good", scope: !12, file: !12, line: 139, type: !13, scopeLine: 140, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!78 = !DILocation(line: 141, column: 5, scope: !77)
!79 = !DILocation(line: 142, column: 5, scope: !77)
!80 = !DILocation(line: 143, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 153, type: !82, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!82 = !DISubroutineType(types: !83)
!83 = !{!17, !17, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 153, type: !17)
!88 = !DILocation(line: 153, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 153, type: !84)
!90 = !DILocation(line: 153, column: 27, scope: !81)
!91 = !DILocation(line: 156, column: 22, scope: !81)
!92 = !DILocation(line: 156, column: 12, scope: !81)
!93 = !DILocation(line: 156, column: 5, scope: !81)
!94 = !DILocation(line: 158, column: 5, scope: !81)
!95 = !DILocation(line: 159, column: 5, scope: !81)
!96 = !DILocation(line: 160, column: 5, scope: !81)
!97 = !DILocation(line: 163, column: 5, scope: !81)
!98 = !DILocation(line: 164, column: 5, scope: !81)
!99 = !DILocation(line: 165, column: 5, scope: !81)
!100 = !DILocation(line: 167, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 64, type: !13, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 66, type: !17)
!103 = !DILocation(line: 66, column: 9, scope: !101)
!104 = !DILocalVariable(name: "dataPtr1", scope: !101, file: !12, line: 67, type: !20)
!105 = !DILocation(line: 67, column: 10, scope: !101)
!106 = !DILocalVariable(name: "dataPtr2", scope: !101, file: !12, line: 68, type: !20)
!107 = !DILocation(line: 68, column: 10, scope: !101)
!108 = !DILocation(line: 70, column: 10, scope: !101)
!109 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 72, type: !17)
!110 = distinct !DILexicalBlock(scope: !101, file: !12, line: 71, column: 5)
!111 = !DILocation(line: 72, column: 13, scope: !110)
!112 = !DILocation(line: 72, column: 21, scope: !110)
!113 = !DILocation(line: 72, column: 20, scope: !110)
!114 = !DILocation(line: 75, column: 14, scope: !110)
!115 = !DILocation(line: 76, column: 21, scope: !110)
!116 = !DILocation(line: 76, column: 10, scope: !110)
!117 = !DILocation(line: 76, column: 19, scope: !110)
!118 = !DILocalVariable(name: "data", scope: !119, file: !12, line: 79, type: !17)
!119 = distinct !DILexicalBlock(scope: !101, file: !12, line: 78, column: 5)
!120 = !DILocation(line: 79, column: 13, scope: !119)
!121 = !DILocation(line: 79, column: 21, scope: !119)
!122 = !DILocation(line: 79, column: 20, scope: !119)
!123 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 81, type: !17)
!124 = distinct !DILexicalBlock(scope: !119, file: !12, line: 80, column: 9)
!125 = !DILocation(line: 81, column: 17, scope: !124)
!126 = !DILocalVariable(name: "buffer", scope: !124, file: !12, line: 82, type: !44)
!127 = !DILocation(line: 82, column: 17, scope: !124)
!128 = !DILocation(line: 85, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !12, line: 85, column: 17)
!130 = !DILocation(line: 85, column: 22, scope: !129)
!131 = !DILocation(line: 85, column: 17, scope: !124)
!132 = !DILocation(line: 87, column: 24, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !12, line: 86, column: 13)
!134 = !DILocation(line: 87, column: 17, scope: !133)
!135 = !DILocation(line: 87, column: 30, scope: !133)
!136 = !DILocation(line: 89, column: 23, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !12, line: 89, column: 17)
!138 = !DILocation(line: 89, column: 21, scope: !137)
!139 = !DILocation(line: 89, column: 28, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 89, column: 17)
!141 = !DILocation(line: 89, column: 30, scope: !140)
!142 = !DILocation(line: 89, column: 17, scope: !137)
!143 = !DILocation(line: 91, column: 41, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !12, line: 90, column: 17)
!145 = !DILocation(line: 91, column: 34, scope: !144)
!146 = !DILocation(line: 91, column: 21, scope: !144)
!147 = !DILocation(line: 92, column: 17, scope: !144)
!148 = !DILocation(line: 89, column: 37, scope: !140)
!149 = !DILocation(line: 89, column: 17, scope: !140)
!150 = distinct !{!150, !142, !151, !72}
!151 = !DILocation(line: 92, column: 17, scope: !137)
!152 = !DILocation(line: 93, column: 13, scope: !133)
!153 = !DILocation(line: 96, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !129, file: !12, line: 95, column: 13)
!155 = !DILocation(line: 100, column: 1, scope: !101)
!156 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!157 = !DILocalVariable(name: "data", scope: !156, file: !12, line: 105, type: !17)
!158 = !DILocation(line: 105, column: 9, scope: !156)
!159 = !DILocalVariable(name: "dataPtr1", scope: !156, file: !12, line: 106, type: !20)
!160 = !DILocation(line: 106, column: 10, scope: !156)
!161 = !DILocalVariable(name: "dataPtr2", scope: !156, file: !12, line: 107, type: !20)
!162 = !DILocation(line: 107, column: 10, scope: !156)
!163 = !DILocation(line: 109, column: 10, scope: !156)
!164 = !DILocalVariable(name: "data", scope: !165, file: !12, line: 111, type: !17)
!165 = distinct !DILexicalBlock(scope: !156, file: !12, line: 110, column: 5)
!166 = !DILocation(line: 111, column: 13, scope: !165)
!167 = !DILocation(line: 111, column: 21, scope: !165)
!168 = !DILocation(line: 111, column: 20, scope: !165)
!169 = !DILocation(line: 113, column: 16, scope: !165)
!170 = !DILocation(line: 113, column: 9, scope: !165)
!171 = !DILocation(line: 114, column: 21, scope: !165)
!172 = !DILocation(line: 114, column: 10, scope: !165)
!173 = !DILocation(line: 114, column: 19, scope: !165)
!174 = !DILocalVariable(name: "data", scope: !175, file: !12, line: 117, type: !17)
!175 = distinct !DILexicalBlock(scope: !156, file: !12, line: 116, column: 5)
!176 = !DILocation(line: 117, column: 13, scope: !175)
!177 = !DILocation(line: 117, column: 21, scope: !175)
!178 = !DILocation(line: 117, column: 20, scope: !175)
!179 = !DILocalVariable(name: "i", scope: !180, file: !12, line: 119, type: !17)
!180 = distinct !DILexicalBlock(scope: !175, file: !12, line: 118, column: 9)
!181 = !DILocation(line: 119, column: 17, scope: !180)
!182 = !DILocalVariable(name: "buffer", scope: !180, file: !12, line: 120, type: !44)
!183 = !DILocation(line: 120, column: 17, scope: !180)
!184 = !DILocation(line: 122, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !12, line: 122, column: 17)
!186 = !DILocation(line: 122, column: 22, scope: !185)
!187 = !DILocation(line: 122, column: 27, scope: !185)
!188 = !DILocation(line: 122, column: 30, scope: !185)
!189 = !DILocation(line: 122, column: 35, scope: !185)
!190 = !DILocation(line: 122, column: 17, scope: !180)
!191 = !DILocation(line: 124, column: 24, scope: !192)
!192 = distinct !DILexicalBlock(scope: !185, file: !12, line: 123, column: 13)
!193 = !DILocation(line: 124, column: 17, scope: !192)
!194 = !DILocation(line: 124, column: 30, scope: !192)
!195 = !DILocation(line: 126, column: 23, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !12, line: 126, column: 17)
!197 = !DILocation(line: 126, column: 21, scope: !196)
!198 = !DILocation(line: 126, column: 28, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !12, line: 126, column: 17)
!200 = !DILocation(line: 126, column: 30, scope: !199)
!201 = !DILocation(line: 126, column: 17, scope: !196)
!202 = !DILocation(line: 128, column: 41, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !12, line: 127, column: 17)
!204 = !DILocation(line: 128, column: 34, scope: !203)
!205 = !DILocation(line: 128, column: 21, scope: !203)
!206 = !DILocation(line: 129, column: 17, scope: !203)
!207 = !DILocation(line: 126, column: 37, scope: !199)
!208 = !DILocation(line: 126, column: 17, scope: !199)
!209 = distinct !{!209, !201, !210, !72}
!210 = !DILocation(line: 129, column: 17, scope: !196)
!211 = !DILocation(line: 130, column: 13, scope: !192)
!212 = !DILocation(line: 133, column: 17, scope: !213)
!213 = distinct !DILexicalBlock(scope: !185, file: !12, line: 132, column: 13)
!214 = !DILocation(line: 137, column: 1, scope: !156)
