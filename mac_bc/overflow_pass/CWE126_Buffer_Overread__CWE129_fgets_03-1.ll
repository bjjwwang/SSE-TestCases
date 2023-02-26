; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fgets_03_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !21, metadata !DIExpression()), !dbg !29
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !30
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !32
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !33
  %cmp = icmp ne i8* %call, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !36
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !38
  store i32 %call2, i32* %data, align 4, !dbg !39
  br label %if.end, !dbg !40

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !43, metadata !DIExpression()), !dbg !50
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !50
  %3 = load i32, i32* %data, align 4, !dbg !51
  %cmp3 = icmp sge i32 %3, 0, !dbg !53
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !54

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !55
  %idxprom = sext i32 %4 to i64, !dbg !57
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !57
  %5 = load i32, i32* %arrayidx, align 4, !dbg !57
  call void @printIntLine(i32 noundef %5), !dbg !58
  br label %if.end6, !dbg !59

if.else5:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i8* @fgets(i8* noundef, i32 noundef, %struct.__sFILE* noundef) #3

declare i32 @atoi(i8* noundef) #3

declare void @printLine(i8* noundef) #3

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fgets_03_good() #0 !dbg !63 {
entry:
  call void @goodB2G1(), !dbg !64
  call void @goodB2G2(), !dbg !65
  call void @goodG2B1(), !dbg !66
  call void @goodG2B2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !69 {
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
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__CWE129_fgets_03_good(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__CWE129_fgets_03_bad(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !88 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 -1, i32* %data, align 4, !dbg !91
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !92, metadata !DIExpression()), !dbg !96
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !97
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !99
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !100
  %cmp = icmp ne i8* %call, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.else, !dbg !102

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !103
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !105
  store i32 %call2, i32* %data, align 4, !dbg !106
  br label %if.end, !dbg !107

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !108
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !110, metadata !DIExpression()), !dbg !114
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !114
  %3 = load i32, i32* %data, align 4, !dbg !115
  %cmp3 = icmp sge i32 %3, 0, !dbg !117
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !118

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !119
  %cmp4 = icmp slt i32 %4, 10, !dbg !120
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !121

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !122
  %idxprom = sext i32 %5 to i64, !dbg !124
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !124
  %6 = load i32, i32* %arrayidx, align 4, !dbg !124
  call void @printIntLine(i32 noundef %6), !dbg !125
  br label %if.end7, !dbg !126

if.else6:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !127
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !130 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !131, metadata !DIExpression()), !dbg !132
  store i32 -1, i32* %data, align 4, !dbg !133
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !134, metadata !DIExpression()), !dbg !138
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !138
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !139
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !141
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !142
  %cmp = icmp ne i8* %call, null, !dbg !143
  br i1 %cmp, label %if.then, label %if.else, !dbg !144

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !145
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !147
  store i32 %call2, i32* %data, align 4, !dbg !148
  br label %if.end, !dbg !149

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !150
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !152, metadata !DIExpression()), !dbg !156
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !156
  %3 = load i32, i32* %data, align 4, !dbg !157
  %cmp3 = icmp sge i32 %3, 0, !dbg !159
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !160

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !161
  %cmp4 = icmp slt i32 %4, 10, !dbg !162
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !163

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !164
  %idxprom = sext i32 %5 to i64, !dbg !166
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !166
  %6 = load i32, i32* %arrayidx, align 4, !dbg !166
  call void @printIntLine(i32 noundef %6), !dbg !167
  br label %if.end7, !dbg !168

if.else6:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !169
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !172 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !173, metadata !DIExpression()), !dbg !174
  store i32 -1, i32* %data, align 4, !dbg !175
  store i32 7, i32* %data, align 4, !dbg !176
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !179, metadata !DIExpression()), !dbg !183
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !183
  %1 = load i32, i32* %data, align 4, !dbg !184
  %cmp = icmp sge i32 %1, 0, !dbg !186
  br i1 %cmp, label %if.then, label %if.else, !dbg !187

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !188
  %idxprom = sext i32 %2 to i64, !dbg !190
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !190
  %3 = load i32, i32* %arrayidx, align 4, !dbg !190
  call void @printIntLine(i32 noundef %3), !dbg !191
  br label %if.end, !dbg !192

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !193
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !195
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !196 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !197, metadata !DIExpression()), !dbg !198
  store i32 -1, i32* %data, align 4, !dbg !199
  store i32 7, i32* %data, align 4, !dbg !200
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !203, metadata !DIExpression()), !dbg !207
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !207
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !207
  %1 = load i32, i32* %data, align 4, !dbg !208
  %cmp = icmp sge i32 %1, 0, !dbg !210
  br i1 %cmp, label %if.then, label %if.else, !dbg !211

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !212
  %idxprom = sext i32 %2 to i64, !dbg !214
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !214
  %3 = load i32, i32* %arrayidx, align 4, !dbg !214
  call void @printIntLine(i32 noundef %3), !dbg !215
  br label %if.end, !dbg !216

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !217
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !219
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_03_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 26, column: 9, scope: !12)
!20 = !DILocation(line: 28, column: 10, scope: !12)
!21 = !DILocalVariable(name: "inputBuffer", scope: !22, file: !13, line: 32, type: !25)
!22 = distinct !DILexicalBlock(scope: !23, file: !13, line: 31, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !13, line: 30, column: 5)
!24 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 8)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 112, elements: !27)
!26 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!27 = !{!28}
!28 = !DISubrange(count: 14)
!29 = !DILocation(line: 32, column: 18, scope: !22)
!30 = !DILocation(line: 34, column: 23, scope: !31)
!31 = distinct !DILexicalBlock(scope: !22, file: !13, line: 34, column: 17)
!32 = !DILocation(line: 34, column: 53, scope: !31)
!33 = !DILocation(line: 34, column: 17, scope: !31)
!34 = !DILocation(line: 34, column: 60, scope: !31)
!35 = !DILocation(line: 34, column: 17, scope: !22)
!36 = !DILocation(line: 37, column: 29, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !13, line: 35, column: 13)
!38 = !DILocation(line: 37, column: 24, scope: !37)
!39 = !DILocation(line: 37, column: 22, scope: !37)
!40 = !DILocation(line: 38, column: 13, scope: !37)
!41 = !DILocation(line: 41, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !31, file: !13, line: 40, column: 13)
!43 = !DILocalVariable(name: "buffer", scope: !44, file: !13, line: 48, type: !47)
!44 = distinct !DILexicalBlock(scope: !45, file: !13, line: 47, column: 9)
!45 = distinct !DILexicalBlock(scope: !46, file: !13, line: 46, column: 5)
!46 = distinct !DILexicalBlock(scope: !12, file: !13, line: 45, column: 8)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 10)
!50 = !DILocation(line: 48, column: 17, scope: !44)
!51 = !DILocation(line: 51, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !44, file: !13, line: 51, column: 17)
!53 = !DILocation(line: 51, column: 22, scope: !52)
!54 = !DILocation(line: 51, column: 17, scope: !44)
!55 = !DILocation(line: 53, column: 37, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !13, line: 52, column: 13)
!57 = !DILocation(line: 53, column: 30, scope: !56)
!58 = !DILocation(line: 53, column: 17, scope: !56)
!59 = !DILocation(line: 54, column: 13, scope: !56)
!60 = !DILocation(line: 57, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !52, file: !13, line: 56, column: 13)
!62 = !DILocation(line: 61, column: 1, scope: !12)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_03_good", scope: !13, file: !13, line: 215, type: !14, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!64 = !DILocation(line: 217, column: 5, scope: !63)
!65 = !DILocation(line: 218, column: 5, scope: !63)
!66 = !DILocation(line: 219, column: 5, scope: !63)
!67 = !DILocation(line: 220, column: 5, scope: !63)
!68 = !DILocation(line: 221, column: 1, scope: !63)
!69 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 232, type: !70, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!70 = !DISubroutineType(types: !71)
!71 = !{!18, !18, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !13, line: 232, type: !18)
!75 = !DILocation(line: 232, column: 14, scope: !69)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !13, line: 232, type: !72)
!77 = !DILocation(line: 232, column: 27, scope: !69)
!78 = !DILocation(line: 235, column: 22, scope: !69)
!79 = !DILocation(line: 235, column: 12, scope: !69)
!80 = !DILocation(line: 235, column: 5, scope: !69)
!81 = !DILocation(line: 237, column: 5, scope: !69)
!82 = !DILocation(line: 238, column: 5, scope: !69)
!83 = !DILocation(line: 239, column: 5, scope: !69)
!84 = !DILocation(line: 242, column: 5, scope: !69)
!85 = !DILocation(line: 243, column: 5, scope: !69)
!86 = !DILocation(line: 244, column: 5, scope: !69)
!87 = !DILocation(line: 246, column: 5, scope: !69)
!88 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 68, type: !14, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!89 = !DILocalVariable(name: "data", scope: !88, file: !13, line: 70, type: !18)
!90 = !DILocation(line: 70, column: 9, scope: !88)
!91 = !DILocation(line: 72, column: 10, scope: !88)
!92 = !DILocalVariable(name: "inputBuffer", scope: !93, file: !13, line: 76, type: !25)
!93 = distinct !DILexicalBlock(scope: !94, file: !13, line: 75, column: 9)
!94 = distinct !DILexicalBlock(scope: !95, file: !13, line: 74, column: 5)
!95 = distinct !DILexicalBlock(scope: !88, file: !13, line: 73, column: 8)
!96 = !DILocation(line: 76, column: 18, scope: !93)
!97 = !DILocation(line: 78, column: 23, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !13, line: 78, column: 17)
!99 = !DILocation(line: 78, column: 53, scope: !98)
!100 = !DILocation(line: 78, column: 17, scope: !98)
!101 = !DILocation(line: 78, column: 60, scope: !98)
!102 = !DILocation(line: 78, column: 17, scope: !93)
!103 = !DILocation(line: 81, column: 29, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !13, line: 79, column: 13)
!105 = !DILocation(line: 81, column: 24, scope: !104)
!106 = !DILocation(line: 81, column: 22, scope: !104)
!107 = !DILocation(line: 82, column: 13, scope: !104)
!108 = !DILocation(line: 85, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !98, file: !13, line: 84, column: 13)
!110 = !DILocalVariable(name: "buffer", scope: !111, file: !13, line: 97, type: !47)
!111 = distinct !DILexicalBlock(scope: !112, file: !13, line: 96, column: 9)
!112 = distinct !DILexicalBlock(scope: !113, file: !13, line: 95, column: 5)
!113 = distinct !DILexicalBlock(scope: !88, file: !13, line: 89, column: 8)
!114 = !DILocation(line: 97, column: 17, scope: !111)
!115 = !DILocation(line: 99, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !13, line: 99, column: 17)
!117 = !DILocation(line: 99, column: 22, scope: !116)
!118 = !DILocation(line: 99, column: 27, scope: !116)
!119 = !DILocation(line: 99, column: 30, scope: !116)
!120 = !DILocation(line: 99, column: 35, scope: !116)
!121 = !DILocation(line: 99, column: 17, scope: !111)
!122 = !DILocation(line: 101, column: 37, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !13, line: 100, column: 13)
!124 = !DILocation(line: 101, column: 30, scope: !123)
!125 = !DILocation(line: 101, column: 17, scope: !123)
!126 = !DILocation(line: 102, column: 13, scope: !123)
!127 = !DILocation(line: 105, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !13, line: 104, column: 13)
!129 = !DILocation(line: 109, column: 1, scope: !88)
!130 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 112, type: !14, scopeLine: 113, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!131 = !DILocalVariable(name: "data", scope: !130, file: !13, line: 114, type: !18)
!132 = !DILocation(line: 114, column: 9, scope: !130)
!133 = !DILocation(line: 116, column: 10, scope: !130)
!134 = !DILocalVariable(name: "inputBuffer", scope: !135, file: !13, line: 120, type: !25)
!135 = distinct !DILexicalBlock(scope: !136, file: !13, line: 119, column: 9)
!136 = distinct !DILexicalBlock(scope: !137, file: !13, line: 118, column: 5)
!137 = distinct !DILexicalBlock(scope: !130, file: !13, line: 117, column: 8)
!138 = !DILocation(line: 120, column: 18, scope: !135)
!139 = !DILocation(line: 122, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !13, line: 122, column: 17)
!141 = !DILocation(line: 122, column: 53, scope: !140)
!142 = !DILocation(line: 122, column: 17, scope: !140)
!143 = !DILocation(line: 122, column: 60, scope: !140)
!144 = !DILocation(line: 122, column: 17, scope: !135)
!145 = !DILocation(line: 125, column: 29, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !13, line: 123, column: 13)
!147 = !DILocation(line: 125, column: 24, scope: !146)
!148 = !DILocation(line: 125, column: 22, scope: !146)
!149 = !DILocation(line: 126, column: 13, scope: !146)
!150 = !DILocation(line: 129, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !140, file: !13, line: 128, column: 13)
!152 = !DILocalVariable(name: "buffer", scope: !153, file: !13, line: 136, type: !47)
!153 = distinct !DILexicalBlock(scope: !154, file: !13, line: 135, column: 9)
!154 = distinct !DILexicalBlock(scope: !155, file: !13, line: 134, column: 5)
!155 = distinct !DILexicalBlock(scope: !130, file: !13, line: 133, column: 8)
!156 = !DILocation(line: 136, column: 17, scope: !153)
!157 = !DILocation(line: 138, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !13, line: 138, column: 17)
!159 = !DILocation(line: 138, column: 22, scope: !158)
!160 = !DILocation(line: 138, column: 27, scope: !158)
!161 = !DILocation(line: 138, column: 30, scope: !158)
!162 = !DILocation(line: 138, column: 35, scope: !158)
!163 = !DILocation(line: 138, column: 17, scope: !153)
!164 = !DILocation(line: 140, column: 37, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !13, line: 139, column: 13)
!166 = !DILocation(line: 140, column: 30, scope: !165)
!167 = !DILocation(line: 140, column: 17, scope: !165)
!168 = !DILocation(line: 141, column: 13, scope: !165)
!169 = !DILocation(line: 144, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !158, file: !13, line: 143, column: 13)
!171 = !DILocation(line: 148, column: 1, scope: !130)
!172 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 151, type: !14, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!173 = !DILocalVariable(name: "data", scope: !172, file: !13, line: 153, type: !18)
!174 = !DILocation(line: 153, column: 9, scope: !172)
!175 = !DILocation(line: 155, column: 10, scope: !172)
!176 = !DILocation(line: 165, column: 14, scope: !177)
!177 = distinct !DILexicalBlock(scope: !178, file: !13, line: 162, column: 5)
!178 = distinct !DILexicalBlock(scope: !172, file: !13, line: 156, column: 8)
!179 = !DILocalVariable(name: "buffer", scope: !180, file: !13, line: 170, type: !47)
!180 = distinct !DILexicalBlock(scope: !181, file: !13, line: 169, column: 9)
!181 = distinct !DILexicalBlock(scope: !182, file: !13, line: 168, column: 5)
!182 = distinct !DILexicalBlock(scope: !172, file: !13, line: 167, column: 8)
!183 = !DILocation(line: 170, column: 17, scope: !180)
!184 = !DILocation(line: 173, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !13, line: 173, column: 17)
!186 = !DILocation(line: 173, column: 22, scope: !185)
!187 = !DILocation(line: 173, column: 17, scope: !180)
!188 = !DILocation(line: 175, column: 37, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !13, line: 174, column: 13)
!190 = !DILocation(line: 175, column: 30, scope: !189)
!191 = !DILocation(line: 175, column: 17, scope: !189)
!192 = !DILocation(line: 176, column: 13, scope: !189)
!193 = !DILocation(line: 179, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !185, file: !13, line: 178, column: 13)
!195 = !DILocation(line: 183, column: 1, scope: !172)
!196 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 186, type: !14, scopeLine: 187, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!197 = !DILocalVariable(name: "data", scope: !196, file: !13, line: 188, type: !18)
!198 = !DILocation(line: 188, column: 9, scope: !196)
!199 = !DILocation(line: 190, column: 10, scope: !196)
!200 = !DILocation(line: 195, column: 14, scope: !201)
!201 = distinct !DILexicalBlock(scope: !202, file: !13, line: 192, column: 5)
!202 = distinct !DILexicalBlock(scope: !196, file: !13, line: 191, column: 8)
!203 = !DILocalVariable(name: "buffer", scope: !204, file: !13, line: 200, type: !47)
!204 = distinct !DILexicalBlock(scope: !205, file: !13, line: 199, column: 9)
!205 = distinct !DILexicalBlock(scope: !206, file: !13, line: 198, column: 5)
!206 = distinct !DILexicalBlock(scope: !196, file: !13, line: 197, column: 8)
!207 = !DILocation(line: 200, column: 17, scope: !204)
!208 = !DILocation(line: 203, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !13, line: 203, column: 17)
!210 = !DILocation(line: 203, column: 22, scope: !209)
!211 = !DILocation(line: 203, column: 17, scope: !204)
!212 = !DILocation(line: 205, column: 37, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !13, line: 204, column: 13)
!214 = !DILocation(line: 205, column: 30, scope: !213)
!215 = !DILocation(line: 205, column: 17, scope: !213)
!216 = !DILocation(line: 206, column: 13, scope: !213)
!217 = !DILocation(line: 209, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !209, file: !13, line: 208, column: 13)
!219 = !DILocation(line: 213, column: 1, scope: !196)
