; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fscanf_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer9 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.else, !dbg !22

if.then:                                          ; preds = %entry
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !23
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !25
  br label %if.end, !dbg !26

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !27
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call2 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool3 = icmp ne i32 %call2, 0, !dbg !29
  br i1 %tobool3, label %if.then4, label %if.else8, !dbg !31

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !32, metadata !DIExpression()), !dbg !38
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !38
  %2 = load i32, i32* %data, align 4, !dbg !39
  %cmp = icmp sge i32 %2, 0, !dbg !41
  br i1 %cmp, label %if.then5, label %if.else6, !dbg !42

if.then5:                                         ; preds = %if.then4
  %3 = load i32, i32* %data, align 4, !dbg !43
  %idxprom = sext i32 %3 to i64, !dbg !45
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !45
  %4 = load i32, i32* %arrayidx, align 4, !dbg !45
  call void @printIntLine(i32 noundef %4), !dbg !46
  br label %if.end7, !dbg !47

if.else6:                                         ; preds = %if.then4
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !48
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %if.end17, !dbg !50

if.else8:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer9, metadata !51, metadata !DIExpression()), !dbg !54
  %5 = bitcast [10 x i32]* %buffer9 to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false), !dbg !54
  %6 = load i32, i32* %data, align 4, !dbg !55
  %cmp10 = icmp sge i32 %6, 0, !dbg !57
  br i1 %cmp10, label %land.lhs.true, label %if.else15, !dbg !58

land.lhs.true:                                    ; preds = %if.else8
  %7 = load i32, i32* %data, align 4, !dbg !59
  %cmp11 = icmp slt i32 %7, 10, !dbg !60
  br i1 %cmp11, label %if.then12, label %if.else15, !dbg !61

if.then12:                                        ; preds = %land.lhs.true
  %8 = load i32, i32* %data, align 4, !dbg !62
  %idxprom13 = sext i32 %8 to i64, !dbg !64
  %arrayidx14 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer9, i64 0, i64 %idxprom13, !dbg !64
  %9 = load i32, i32* %arrayidx14, align 4, !dbg !64
  call void @printIntLine(i32 noundef %9), !dbg !65
  br label %if.end16, !dbg !66

if.else15:                                        ; preds = %land.lhs.true, %if.else8
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %if.then12
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.end7
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fscanf_12_good() #0 !dbg !70 {
entry:
  call void @goodB2G(), !dbg !71
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* noundef null), !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 noundef %conv), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  call void @CWE126_Buffer_Overread__CWE129_fscanf_12_good(), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !90
  call void @CWE126_Buffer_Overread__CWE129_fscanf_12_bad(), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !94 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer11 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32 -1, i32* %data, align 4, !dbg !97
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !98
  %tobool = icmp ne i32 %call, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !101
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !103
  br label %if.end, !dbg !104

if.else:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !105
  %call2 = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call3 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !108
  %tobool4 = icmp ne i32 %call3, 0, !dbg !108
  br i1 %tobool4, label %if.then5, label %if.else10, !dbg !110

if.then5:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !111, metadata !DIExpression()), !dbg !114
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !114
  %3 = load i32, i32* %data, align 4, !dbg !115
  %cmp = icmp sge i32 %3, 0, !dbg !117
  br i1 %cmp, label %land.lhs.true, label %if.else8, !dbg !118

land.lhs.true:                                    ; preds = %if.then5
  %4 = load i32, i32* %data, align 4, !dbg !119
  %cmp6 = icmp slt i32 %4, 10, !dbg !120
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !121

if.then7:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !122
  %idxprom = sext i32 %5 to i64, !dbg !124
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !124
  %6 = load i32, i32* %arrayidx, align 4, !dbg !124
  call void @printIntLine(i32 noundef %6), !dbg !125
  br label %if.end9, !dbg !126

if.else8:                                         ; preds = %land.lhs.true, %if.then5
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !127
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %if.then7
  br label %if.end20, !dbg !129

if.else10:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer11, metadata !130, metadata !DIExpression()), !dbg !133
  %7 = bitcast [10 x i32]* %buffer11 to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !133
  %8 = load i32, i32* %data, align 4, !dbg !134
  %cmp12 = icmp sge i32 %8, 0, !dbg !136
  br i1 %cmp12, label %land.lhs.true13, label %if.else18, !dbg !137

land.lhs.true13:                                  ; preds = %if.else10
  %9 = load i32, i32* %data, align 4, !dbg !138
  %cmp14 = icmp slt i32 %9, 10, !dbg !139
  br i1 %cmp14, label %if.then15, label %if.else18, !dbg !140

if.then15:                                        ; preds = %land.lhs.true13
  %10 = load i32, i32* %data, align 4, !dbg !141
  %idxprom16 = sext i32 %10 to i64, !dbg !143
  %arrayidx17 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer11, i64 0, i64 %idxprom16, !dbg !143
  %11 = load i32, i32* %arrayidx17, align 4, !dbg !143
  call void @printIntLine(i32 noundef %11), !dbg !144
  br label %if.end19, !dbg !145

if.else18:                                        ; preds = %land.lhs.true13, %if.else10
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !146
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then15
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.end9
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !149 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer8 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !150, metadata !DIExpression()), !dbg !151
  store i32 -1, i32* %data, align 4, !dbg !152
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !153
  %tobool = icmp ne i32 %call, 0, !dbg !153
  br i1 %tobool, label %if.then, label %if.else, !dbg !155

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !156
  br label %if.end, !dbg !158

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !159
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !161
  %tobool2 = icmp ne i32 %call1, 0, !dbg !161
  br i1 %tobool2, label %if.then3, label %if.else7, !dbg !163

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !164, metadata !DIExpression()), !dbg !167
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !167
  %1 = load i32, i32* %data, align 4, !dbg !168
  %cmp = icmp sge i32 %1, 0, !dbg !170
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !171

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !172
  %idxprom = sext i32 %2 to i64, !dbg !174
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !174
  %3 = load i32, i32* %arrayidx, align 4, !dbg !174
  call void @printIntLine(i32 noundef %3), !dbg !175
  br label %if.end6, !dbg !176

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !177
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end15, !dbg !179

if.else7:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer8, metadata !180, metadata !DIExpression()), !dbg !183
  %4 = bitcast [10 x i32]* %buffer8 to i8*, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !183
  %5 = load i32, i32* %data, align 4, !dbg !184
  %cmp9 = icmp sge i32 %5, 0, !dbg !186
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !187

if.then10:                                        ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !188
  %idxprom11 = sext i32 %6 to i64, !dbg !190
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer8, i64 0, i64 %idxprom11, !dbg !190
  %7 = load i32, i32* %arrayidx12, align 4, !dbg !190
  call void @printIntLine(i32 noundef %7), !dbg !191
  br label %if.end14, !dbg !192

if.else13:                                        ; preds = %if.else7
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !193
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end6
  ret void, !dbg !195
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_12_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 24, column: 9, scope: !11)
!19 = !DILocation(line: 26, column: 10, scope: !11)
!20 = !DILocation(line: 27, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!22 = !DILocation(line: 27, column: 8, scope: !11)
!23 = !DILocation(line: 30, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !12, line: 28, column: 5)
!25 = !DILocation(line: 30, column: 9, scope: !24)
!26 = !DILocation(line: 31, column: 5, scope: !24)
!27 = !DILocation(line: 36, column: 14, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !12, line: 33, column: 5)
!29 = !DILocation(line: 38, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 8)
!31 = !DILocation(line: 38, column: 8, scope: !11)
!32 = !DILocalVariable(name: "buffer", scope: !33, file: !12, line: 41, type: !35)
!33 = distinct !DILexicalBlock(scope: !34, file: !12, line: 40, column: 9)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 39, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 10)
!38 = !DILocation(line: 41, column: 17, scope: !33)
!39 = !DILocation(line: 44, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !33, file: !12, line: 44, column: 17)
!41 = !DILocation(line: 44, column: 22, scope: !40)
!42 = !DILocation(line: 44, column: 17, scope: !33)
!43 = !DILocation(line: 46, column: 37, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 45, column: 13)
!45 = !DILocation(line: 46, column: 30, scope: !44)
!46 = !DILocation(line: 46, column: 17, scope: !44)
!47 = !DILocation(line: 47, column: 13, scope: !44)
!48 = !DILocation(line: 50, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !40, file: !12, line: 49, column: 13)
!50 = !DILocation(line: 53, column: 5, scope: !34)
!51 = !DILocalVariable(name: "buffer", scope: !52, file: !12, line: 57, type: !35)
!52 = distinct !DILexicalBlock(scope: !53, file: !12, line: 56, column: 9)
!53 = distinct !DILexicalBlock(scope: !30, file: !12, line: 55, column: 5)
!54 = !DILocation(line: 57, column: 17, scope: !52)
!55 = !DILocation(line: 59, column: 17, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 59, column: 17)
!57 = !DILocation(line: 59, column: 22, scope: !56)
!58 = !DILocation(line: 59, column: 27, scope: !56)
!59 = !DILocation(line: 59, column: 30, scope: !56)
!60 = !DILocation(line: 59, column: 35, scope: !56)
!61 = !DILocation(line: 59, column: 17, scope: !52)
!62 = !DILocation(line: 61, column: 37, scope: !63)
!63 = distinct !DILexicalBlock(scope: !56, file: !12, line: 60, column: 13)
!64 = !DILocation(line: 61, column: 30, scope: !63)
!65 = !DILocation(line: 61, column: 17, scope: !63)
!66 = !DILocation(line: 62, column: 13, scope: !63)
!67 = !DILocation(line: 65, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !56, file: !12, line: 64, column: 13)
!69 = !DILocation(line: 69, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_12_good", scope: !12, file: !12, line: 179, type: !13, scopeLine: 180, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!71 = !DILocation(line: 181, column: 5, scope: !70)
!72 = !DILocation(line: 182, column: 5, scope: !70)
!73 = !DILocation(line: 183, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 194, type: !75, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!75 = !DISubroutineType(types: !76)
!76 = !{!17, !17, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 194, type: !17)
!81 = !DILocation(line: 194, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 194, type: !77)
!83 = !DILocation(line: 194, column: 27, scope: !74)
!84 = !DILocation(line: 197, column: 22, scope: !74)
!85 = !DILocation(line: 197, column: 12, scope: !74)
!86 = !DILocation(line: 197, column: 5, scope: !74)
!87 = !DILocation(line: 199, column: 5, scope: !74)
!88 = !DILocation(line: 200, column: 5, scope: !74)
!89 = !DILocation(line: 201, column: 5, scope: !74)
!90 = !DILocation(line: 204, column: 5, scope: !74)
!91 = !DILocation(line: 205, column: 5, scope: !74)
!92 = !DILocation(line: 206, column: 5, scope: !74)
!93 = !DILocation(line: 208, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 80, type: !17)
!96 = !DILocation(line: 80, column: 9, scope: !94)
!97 = !DILocation(line: 82, column: 10, scope: !94)
!98 = !DILocation(line: 83, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !12, line: 83, column: 8)
!100 = !DILocation(line: 83, column: 8, scope: !94)
!101 = !DILocation(line: 86, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !12, line: 84, column: 5)
!103 = !DILocation(line: 86, column: 9, scope: !102)
!104 = !DILocation(line: 87, column: 5, scope: !102)
!105 = !DILocation(line: 91, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !99, file: !12, line: 89, column: 5)
!107 = !DILocation(line: 91, column: 9, scope: !106)
!108 = !DILocation(line: 93, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !94, file: !12, line: 93, column: 8)
!110 = !DILocation(line: 93, column: 8, scope: !94)
!111 = !DILocalVariable(name: "buffer", scope: !112, file: !12, line: 96, type: !35)
!112 = distinct !DILexicalBlock(scope: !113, file: !12, line: 95, column: 9)
!113 = distinct !DILexicalBlock(scope: !109, file: !12, line: 94, column: 5)
!114 = !DILocation(line: 96, column: 17, scope: !112)
!115 = !DILocation(line: 98, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !12, line: 98, column: 17)
!117 = !DILocation(line: 98, column: 22, scope: !116)
!118 = !DILocation(line: 98, column: 27, scope: !116)
!119 = !DILocation(line: 98, column: 30, scope: !116)
!120 = !DILocation(line: 98, column: 35, scope: !116)
!121 = !DILocation(line: 98, column: 17, scope: !112)
!122 = !DILocation(line: 100, column: 37, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !12, line: 99, column: 13)
!124 = !DILocation(line: 100, column: 30, scope: !123)
!125 = !DILocation(line: 100, column: 17, scope: !123)
!126 = !DILocation(line: 101, column: 13, scope: !123)
!127 = !DILocation(line: 104, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !12, line: 103, column: 13)
!129 = !DILocation(line: 107, column: 5, scope: !113)
!130 = !DILocalVariable(name: "buffer", scope: !131, file: !12, line: 111, type: !35)
!131 = distinct !DILexicalBlock(scope: !132, file: !12, line: 110, column: 9)
!132 = distinct !DILexicalBlock(scope: !109, file: !12, line: 109, column: 5)
!133 = !DILocation(line: 111, column: 17, scope: !131)
!134 = !DILocation(line: 113, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !12, line: 113, column: 17)
!136 = !DILocation(line: 113, column: 22, scope: !135)
!137 = !DILocation(line: 113, column: 27, scope: !135)
!138 = !DILocation(line: 113, column: 30, scope: !135)
!139 = !DILocation(line: 113, column: 35, scope: !135)
!140 = !DILocation(line: 113, column: 17, scope: !131)
!141 = !DILocation(line: 115, column: 37, scope: !142)
!142 = distinct !DILexicalBlock(scope: !135, file: !12, line: 114, column: 13)
!143 = !DILocation(line: 115, column: 30, scope: !142)
!144 = !DILocation(line: 115, column: 17, scope: !142)
!145 = !DILocation(line: 116, column: 13, scope: !142)
!146 = !DILocation(line: 119, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !135, file: !12, line: 118, column: 13)
!148 = !DILocation(line: 123, column: 1, scope: !94)
!149 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 128, type: !13, scopeLine: 129, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!150 = !DILocalVariable(name: "data", scope: !149, file: !12, line: 130, type: !17)
!151 = !DILocation(line: 130, column: 9, scope: !149)
!152 = !DILocation(line: 132, column: 10, scope: !149)
!153 = !DILocation(line: 133, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !12, line: 133, column: 8)
!155 = !DILocation(line: 133, column: 8, scope: !149)
!156 = !DILocation(line: 137, column: 14, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !12, line: 134, column: 5)
!158 = !DILocation(line: 138, column: 5, scope: !157)
!159 = !DILocation(line: 143, column: 14, scope: !160)
!160 = distinct !DILexicalBlock(scope: !154, file: !12, line: 140, column: 5)
!161 = !DILocation(line: 145, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !149, file: !12, line: 145, column: 8)
!163 = !DILocation(line: 145, column: 8, scope: !149)
!164 = !DILocalVariable(name: "buffer", scope: !165, file: !12, line: 148, type: !35)
!165 = distinct !DILexicalBlock(scope: !166, file: !12, line: 147, column: 9)
!166 = distinct !DILexicalBlock(scope: !162, file: !12, line: 146, column: 5)
!167 = !DILocation(line: 148, column: 17, scope: !165)
!168 = !DILocation(line: 151, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !12, line: 151, column: 17)
!170 = !DILocation(line: 151, column: 22, scope: !169)
!171 = !DILocation(line: 151, column: 17, scope: !165)
!172 = !DILocation(line: 153, column: 37, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !12, line: 152, column: 13)
!174 = !DILocation(line: 153, column: 30, scope: !173)
!175 = !DILocation(line: 153, column: 17, scope: !173)
!176 = !DILocation(line: 154, column: 13, scope: !173)
!177 = !DILocation(line: 157, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !169, file: !12, line: 156, column: 13)
!179 = !DILocation(line: 160, column: 5, scope: !166)
!180 = !DILocalVariable(name: "buffer", scope: !181, file: !12, line: 164, type: !35)
!181 = distinct !DILexicalBlock(scope: !182, file: !12, line: 163, column: 9)
!182 = distinct !DILexicalBlock(scope: !162, file: !12, line: 162, column: 5)
!183 = !DILocation(line: 164, column: 17, scope: !181)
!184 = !DILocation(line: 167, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !12, line: 167, column: 17)
!186 = !DILocation(line: 167, column: 22, scope: !185)
!187 = !DILocation(line: 167, column: 17, scope: !181)
!188 = !DILocation(line: 169, column: 37, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !12, line: 168, column: 13)
!190 = !DILocation(line: 169, column: 30, scope: !189)
!191 = !DILocation(line: 169, column: 17, scope: !189)
!192 = !DILocation(line: 170, column: 13, scope: !189)
!193 = !DILocation(line: 173, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !185, file: !12, line: 172, column: 13)
!195 = !DILocation(line: 177, column: 1, scope: !149)
