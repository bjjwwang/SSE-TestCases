; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@GLOBAL_CONST_FIVE = external constant i32, align 4
@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fscanf_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !20
  %cmp = icmp eq i32 %0, 5, !dbg !22
  br i1 %cmp, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !24
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !26
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !28
  %cmp1 = icmp eq i32 %2, 5, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !31

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !32, metadata !DIExpression()), !dbg !38
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !38
  %4 = load i32, i32* %data, align 4, !dbg !39
  %cmp3 = icmp sge i32 %4, 0, !dbg !41
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !42

if.then4:                                         ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !43
  %idxprom = sext i32 %5 to i64, !dbg !45
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !45
  %6 = load i32, i32* %arrayidx, align 4, !dbg !45
  call void @printIntLine(i32 noundef %6), !dbg !46
  br label %if.end5, !dbg !47

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !48
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !50

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fscanf_13_good() #0 !dbg !52 {
entry:
  call void @goodB2G1(), !dbg !53
  call void @goodB2G2(), !dbg !54
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* noundef null), !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 noundef %conv), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__CWE129_fscanf_13_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  call void @CWE126_Buffer_Overread__CWE129_fscanf_13_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !78 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 -1, i32* %data, align 4, !dbg !81
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !82
  %cmp = icmp eq i32 %0, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !86
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !88
  br label %if.end, !dbg !89

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !90
  %cmp1 = icmp ne i32 %2, 5, !dbg !92
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !93

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !94
  br label %if.end8, !dbg !96

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !97, metadata !DIExpression()), !dbg !100
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !100
  %4 = load i32, i32* %data, align 4, !dbg !101
  %cmp3 = icmp sge i32 %4, 0, !dbg !103
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !104

land.lhs.true:                                    ; preds = %if.else
  %5 = load i32, i32* %data, align 4, !dbg !105
  %cmp4 = icmp slt i32 %5, 10, !dbg !106
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !107

if.then5:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !108
  %idxprom = sext i32 %6 to i64, !dbg !110
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !110
  %7 = load i32, i32* %arrayidx, align 4, !dbg !110
  call void @printIntLine(i32 noundef %7), !dbg !111
  br label %if.end7, !dbg !112

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !113
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then2
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !116 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 -1, i32* %data, align 4, !dbg !119
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !120
  %cmp = icmp eq i32 %0, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !124
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !128
  %cmp1 = icmp eq i32 %2, 5, !dbg !130
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !131

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !132, metadata !DIExpression()), !dbg !135
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !135
  %4 = load i32, i32* %data, align 4, !dbg !136
  %cmp3 = icmp sge i32 %4, 0, !dbg !138
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !139

land.lhs.true:                                    ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !140
  %cmp4 = icmp slt i32 %5, 10, !dbg !141
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !142

if.then5:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !143
  %idxprom = sext i32 %6 to i64, !dbg !145
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !145
  %7 = load i32, i32* %arrayidx, align 4, !dbg !145
  call void @printIntLine(i32 noundef %7), !dbg !146
  br label %if.end6, !dbg !147

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !148
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then5
  br label %if.end7, !dbg !150

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !152 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !153, metadata !DIExpression()), !dbg !154
  store i32 -1, i32* %data, align 4, !dbg !155
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !156
  %cmp = icmp ne i32 %0, 5, !dbg !158
  br i1 %cmp, label %if.then, label %if.else, !dbg !159

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !160
  br label %if.end, !dbg !162

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !163
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !165
  %cmp1 = icmp eq i32 %1, 5, !dbg !167
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !168

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !169, metadata !DIExpression()), !dbg !172
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !172
  %3 = load i32, i32* %data, align 4, !dbg !173
  %cmp3 = icmp sge i32 %3, 0, !dbg !175
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !176

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !177
  %idxprom = sext i32 %4 to i64, !dbg !179
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !179
  %5 = load i32, i32* %arrayidx, align 4, !dbg !179
  call void @printIntLine(i32 noundef %5), !dbg !180
  br label %if.end6, !dbg !181

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !182
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !184

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !185
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !186 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !187, metadata !DIExpression()), !dbg !188
  store i32 -1, i32* %data, align 4, !dbg !189
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !190
  %cmp = icmp eq i32 %0, 5, !dbg !192
  br i1 %cmp, label %if.then, label %if.end, !dbg !193

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !194
  br label %if.end, !dbg !196

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !197
  %cmp1 = icmp eq i32 %1, 5, !dbg !199
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !200

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !201, metadata !DIExpression()), !dbg !204
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !204
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !204
  %3 = load i32, i32* %data, align 4, !dbg !205
  %cmp3 = icmp sge i32 %3, 0, !dbg !207
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !208

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !209
  %idxprom = sext i32 %4 to i64, !dbg !211
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !211
  %5 = load i32, i32* %arrayidx, align 4, !dbg !211
  call void @printIntLine(i32 noundef %5), !dbg !212
  br label %if.end5, !dbg !213

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !214
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !216

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !217
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_13_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 24, column: 9, scope: !11)
!19 = !DILocation(line: 26, column: 10, scope: !11)
!20 = !DILocation(line: 27, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!22 = !DILocation(line: 27, column: 25, scope: !21)
!23 = !DILocation(line: 27, column: 8, scope: !11)
!24 = !DILocation(line: 30, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !12, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 9, scope: !25)
!27 = !DILocation(line: 31, column: 5, scope: !25)
!28 = !DILocation(line: 32, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!30 = !DILocation(line: 32, column: 25, scope: !29)
!31 = !DILocation(line: 32, column: 8, scope: !11)
!32 = !DILocalVariable(name: "buffer", scope: !33, file: !12, line: 35, type: !35)
!33 = distinct !DILexicalBlock(scope: !34, file: !12, line: 34, column: 9)
!34 = distinct !DILexicalBlock(scope: !29, file: !12, line: 33, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 10)
!38 = !DILocation(line: 35, column: 17, scope: !33)
!39 = !DILocation(line: 38, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !33, file: !12, line: 38, column: 17)
!41 = !DILocation(line: 38, column: 22, scope: !40)
!42 = !DILocation(line: 38, column: 17, scope: !33)
!43 = !DILocation(line: 40, column: 37, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 39, column: 13)
!45 = !DILocation(line: 40, column: 30, scope: !44)
!46 = !DILocation(line: 40, column: 17, scope: !44)
!47 = !DILocation(line: 41, column: 13, scope: !44)
!48 = !DILocation(line: 44, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !40, file: !12, line: 43, column: 13)
!50 = !DILocation(line: 47, column: 5, scope: !34)
!51 = !DILocation(line: 48, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_13_good", scope: !12, file: !12, line: 180, type: !13, scopeLine: 181, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!53 = !DILocation(line: 182, column: 5, scope: !52)
!54 = !DILocation(line: 183, column: 5, scope: !52)
!55 = !DILocation(line: 184, column: 5, scope: !52)
!56 = !DILocation(line: 185, column: 5, scope: !52)
!57 = !DILocation(line: 186, column: 1, scope: !52)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 197, type: !59, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!59 = !DISubroutineType(types: !60)
!60 = !{!17, !17, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 197, type: !17)
!65 = !DILocation(line: 197, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 197, type: !61)
!67 = !DILocation(line: 197, column: 27, scope: !58)
!68 = !DILocation(line: 200, column: 22, scope: !58)
!69 = !DILocation(line: 200, column: 12, scope: !58)
!70 = !DILocation(line: 200, column: 5, scope: !58)
!71 = !DILocation(line: 202, column: 5, scope: !58)
!72 = !DILocation(line: 203, column: 5, scope: !58)
!73 = !DILocation(line: 204, column: 5, scope: !58)
!74 = !DILocation(line: 207, column: 5, scope: !58)
!75 = !DILocation(line: 208, column: 5, scope: !58)
!76 = !DILocation(line: 209, column: 5, scope: !58)
!77 = !DILocation(line: 211, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 57, type: !17)
!80 = !DILocation(line: 57, column: 9, scope: !78)
!81 = !DILocation(line: 59, column: 10, scope: !78)
!82 = !DILocation(line: 60, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !12, line: 60, column: 8)
!84 = !DILocation(line: 60, column: 25, scope: !83)
!85 = !DILocation(line: 60, column: 8, scope: !78)
!86 = !DILocation(line: 63, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !12, line: 61, column: 5)
!88 = !DILocation(line: 63, column: 9, scope: !87)
!89 = !DILocation(line: 64, column: 5, scope: !87)
!90 = !DILocation(line: 65, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !78, file: !12, line: 65, column: 8)
!92 = !DILocation(line: 65, column: 25, scope: !91)
!93 = !DILocation(line: 65, column: 8, scope: !78)
!94 = !DILocation(line: 68, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !12, line: 66, column: 5)
!96 = !DILocation(line: 69, column: 5, scope: !95)
!97 = !DILocalVariable(name: "buffer", scope: !98, file: !12, line: 73, type: !35)
!98 = distinct !DILexicalBlock(scope: !99, file: !12, line: 72, column: 9)
!99 = distinct !DILexicalBlock(scope: !91, file: !12, line: 71, column: 5)
!100 = !DILocation(line: 73, column: 17, scope: !98)
!101 = !DILocation(line: 75, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 75, column: 17)
!103 = !DILocation(line: 75, column: 22, scope: !102)
!104 = !DILocation(line: 75, column: 27, scope: !102)
!105 = !DILocation(line: 75, column: 30, scope: !102)
!106 = !DILocation(line: 75, column: 35, scope: !102)
!107 = !DILocation(line: 75, column: 17, scope: !98)
!108 = !DILocation(line: 77, column: 37, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !12, line: 76, column: 13)
!110 = !DILocation(line: 77, column: 30, scope: !109)
!111 = !DILocation(line: 77, column: 17, scope: !109)
!112 = !DILocation(line: 78, column: 13, scope: !109)
!113 = !DILocation(line: 81, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !102, file: !12, line: 80, column: 13)
!115 = !DILocation(line: 85, column: 1, scope: !78)
!116 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!117 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 90, type: !17)
!118 = !DILocation(line: 90, column: 9, scope: !116)
!119 = !DILocation(line: 92, column: 10, scope: !116)
!120 = !DILocation(line: 93, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !12, line: 93, column: 8)
!122 = !DILocation(line: 93, column: 25, scope: !121)
!123 = !DILocation(line: 93, column: 8, scope: !116)
!124 = !DILocation(line: 96, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 94, column: 5)
!126 = !DILocation(line: 96, column: 9, scope: !125)
!127 = !DILocation(line: 97, column: 5, scope: !125)
!128 = !DILocation(line: 98, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !116, file: !12, line: 98, column: 8)
!130 = !DILocation(line: 98, column: 25, scope: !129)
!131 = !DILocation(line: 98, column: 8, scope: !116)
!132 = !DILocalVariable(name: "buffer", scope: !133, file: !12, line: 101, type: !35)
!133 = distinct !DILexicalBlock(scope: !134, file: !12, line: 100, column: 9)
!134 = distinct !DILexicalBlock(scope: !129, file: !12, line: 99, column: 5)
!135 = !DILocation(line: 101, column: 17, scope: !133)
!136 = !DILocation(line: 103, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !12, line: 103, column: 17)
!138 = !DILocation(line: 103, column: 22, scope: !137)
!139 = !DILocation(line: 103, column: 27, scope: !137)
!140 = !DILocation(line: 103, column: 30, scope: !137)
!141 = !DILocation(line: 103, column: 35, scope: !137)
!142 = !DILocation(line: 103, column: 17, scope: !133)
!143 = !DILocation(line: 105, column: 37, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !12, line: 104, column: 13)
!145 = !DILocation(line: 105, column: 30, scope: !144)
!146 = !DILocation(line: 105, column: 17, scope: !144)
!147 = !DILocation(line: 106, column: 13, scope: !144)
!148 = !DILocation(line: 109, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !137, file: !12, line: 108, column: 13)
!150 = !DILocation(line: 112, column: 5, scope: !134)
!151 = !DILocation(line: 113, column: 1, scope: !116)
!152 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!153 = !DILocalVariable(name: "data", scope: !152, file: !12, line: 118, type: !17)
!154 = !DILocation(line: 118, column: 9, scope: !152)
!155 = !DILocation(line: 120, column: 10, scope: !152)
!156 = !DILocation(line: 121, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !12, line: 121, column: 8)
!158 = !DILocation(line: 121, column: 25, scope: !157)
!159 = !DILocation(line: 121, column: 8, scope: !152)
!160 = !DILocation(line: 124, column: 9, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !12, line: 122, column: 5)
!162 = !DILocation(line: 125, column: 5, scope: !161)
!163 = !DILocation(line: 130, column: 14, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !12, line: 127, column: 5)
!165 = !DILocation(line: 132, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !152, file: !12, line: 132, column: 8)
!167 = !DILocation(line: 132, column: 25, scope: !166)
!168 = !DILocation(line: 132, column: 8, scope: !152)
!169 = !DILocalVariable(name: "buffer", scope: !170, file: !12, line: 135, type: !35)
!170 = distinct !DILexicalBlock(scope: !171, file: !12, line: 134, column: 9)
!171 = distinct !DILexicalBlock(scope: !166, file: !12, line: 133, column: 5)
!172 = !DILocation(line: 135, column: 17, scope: !170)
!173 = !DILocation(line: 138, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !12, line: 138, column: 17)
!175 = !DILocation(line: 138, column: 22, scope: !174)
!176 = !DILocation(line: 138, column: 17, scope: !170)
!177 = !DILocation(line: 140, column: 37, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !12, line: 139, column: 13)
!179 = !DILocation(line: 140, column: 30, scope: !178)
!180 = !DILocation(line: 140, column: 17, scope: !178)
!181 = !DILocation(line: 141, column: 13, scope: !178)
!182 = !DILocation(line: 144, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !174, file: !12, line: 143, column: 13)
!184 = !DILocation(line: 147, column: 5, scope: !171)
!185 = !DILocation(line: 148, column: 1, scope: !152)
!186 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 151, type: !13, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!187 = !DILocalVariable(name: "data", scope: !186, file: !12, line: 153, type: !17)
!188 = !DILocation(line: 153, column: 9, scope: !186)
!189 = !DILocation(line: 155, column: 10, scope: !186)
!190 = !DILocation(line: 156, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !186, file: !12, line: 156, column: 8)
!192 = !DILocation(line: 156, column: 25, scope: !191)
!193 = !DILocation(line: 156, column: 8, scope: !186)
!194 = !DILocation(line: 160, column: 14, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !12, line: 157, column: 5)
!196 = !DILocation(line: 161, column: 5, scope: !195)
!197 = !DILocation(line: 162, column: 8, scope: !198)
!198 = distinct !DILexicalBlock(scope: !186, file: !12, line: 162, column: 8)
!199 = !DILocation(line: 162, column: 25, scope: !198)
!200 = !DILocation(line: 162, column: 8, scope: !186)
!201 = !DILocalVariable(name: "buffer", scope: !202, file: !12, line: 165, type: !35)
!202 = distinct !DILexicalBlock(scope: !203, file: !12, line: 164, column: 9)
!203 = distinct !DILexicalBlock(scope: !198, file: !12, line: 163, column: 5)
!204 = !DILocation(line: 165, column: 17, scope: !202)
!205 = !DILocation(line: 168, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !12, line: 168, column: 17)
!207 = !DILocation(line: 168, column: 22, scope: !206)
!208 = !DILocation(line: 168, column: 17, scope: !202)
!209 = !DILocation(line: 170, column: 37, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !12, line: 169, column: 13)
!211 = !DILocation(line: 170, column: 30, scope: !210)
!212 = !DILocation(line: 170, column: 17, scope: !210)
!213 = !DILocation(line: 171, column: 13, scope: !210)
!214 = !DILocation(line: 174, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !206, file: !12, line: 173, column: 13)
!216 = !DILocation(line: 177, column: 5, scope: !203)
!217 = !DILocation(line: 178, column: 1, scope: !186)
