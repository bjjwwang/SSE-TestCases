; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !21, metadata !DIExpression()), !dbg !27
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !27
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !28
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !30
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !31
  %cmp = icmp ne i8* %call, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !34
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !36
  store i32 %call2, i32* %data, align 4, !dbg !37
  br label %if.end, !dbg !38

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !39
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !41, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !44, metadata !DIExpression()), !dbg !48
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !48
  %3 = load i32, i32* %data, align 4, !dbg !49
  %cmp3 = icmp sge i32 %3, 0, !dbg !51
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !52

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !53
  %idxprom = sext i32 %4 to i64, !dbg !55
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !55
  store i32 1, i32* %arrayidx, align 4, !dbg !56
  store i32 0, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !60
  %cmp5 = icmp slt i32 %5, 10, !dbg !62
  br i1 %cmp5, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !64
  %idxprom6 = sext i32 %6 to i64, !dbg !66
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !66
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !66
  call void @printIntLine(i32 noundef %7), !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !69
  %inc = add nsw i32 %8, 1, !dbg !69
  store i32 %inc, i32* %i, align 4, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !74

if.else8:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  ret void, !dbg !77
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  call void @goodB2G(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !82 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_good(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_bad(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %data, align 4, !dbg !104
  store i32 7, i32* %data, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata i32* %i, metadata !106, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !110
  %1 = load i32, i32* %data, align 4, !dbg !111
  %cmp = icmp sge i32 %1, 0, !dbg !113
  br i1 %cmp, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !115
  %idxprom = sext i32 %2 to i64, !dbg !117
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !117
  store i32 1, i32* %arrayidx, align 4, !dbg !118
  store i32 0, i32* %i, align 4, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !122
  %cmp1 = icmp slt i32 %3, 10, !dbg !124
  br i1 %cmp1, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !126
  %idxprom2 = sext i32 %4 to i64, !dbg !128
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !128
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !128
  call void @printIntLine(i32 noundef %5), !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !131
  %inc = add nsw i32 %6, 1, !dbg !131
  store i32 %inc, i32* %i, align 4, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !135

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !136
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !139 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !140, metadata !DIExpression()), !dbg !141
  store i32 -1, i32* %data, align 4, !dbg !142
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !143, metadata !DIExpression()), !dbg !145
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !145
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !146
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !148
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !149
  %cmp = icmp ne i8* %call, null, !dbg !150
  br i1 %cmp, label %if.then, label %if.else, !dbg !151

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !152
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !154
  store i32 %call2, i32* %data, align 4, !dbg !155
  br label %if.end, !dbg !156

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !157
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !159, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !162, metadata !DIExpression()), !dbg !163
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !163
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !163
  %3 = load i32, i32* %data, align 4, !dbg !164
  %cmp3 = icmp sge i32 %3, 0, !dbg !166
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !167

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !168
  %cmp4 = icmp slt i32 %4, 10, !dbg !169
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !170

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !171
  %idxprom = sext i32 %5 to i64, !dbg !173
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !173
  store i32 1, i32* %arrayidx, align 4, !dbg !174
  store i32 0, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !178
  %cmp6 = icmp slt i32 %6, 10, !dbg !180
  br i1 %cmp6, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !182
  %idxprom7 = sext i32 %7 to i64, !dbg !184
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !184
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !184
  call void @printIntLine(i32 noundef %8), !dbg !185
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !187
  %inc = add nsw i32 %9, 1, !dbg !187
  store i32 %inc, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !191

if.else9:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !192
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  ret void, !dbg !194
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 26, column: 9, scope: !12)
!20 = !DILocation(line: 28, column: 10, scope: !12)
!21 = !DILocalVariable(name: "inputBuffer", scope: !22, file: !13, line: 30, type: !23)
!22 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 112, elements: !25)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!26}
!26 = !DISubrange(count: 14)
!27 = !DILocation(line: 30, column: 14, scope: !22)
!28 = !DILocation(line: 32, column: 19, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !13, line: 32, column: 13)
!30 = !DILocation(line: 32, column: 49, scope: !29)
!31 = !DILocation(line: 32, column: 13, scope: !29)
!32 = !DILocation(line: 32, column: 56, scope: !29)
!33 = !DILocation(line: 32, column: 13, scope: !22)
!34 = !DILocation(line: 35, column: 25, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !13, line: 33, column: 9)
!36 = !DILocation(line: 35, column: 20, scope: !35)
!37 = !DILocation(line: 35, column: 18, scope: !35)
!38 = !DILocation(line: 36, column: 9, scope: !35)
!39 = !DILocation(line: 39, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !29, file: !13, line: 38, column: 9)
!41 = !DILocalVariable(name: "i", scope: !42, file: !13, line: 43, type: !18)
!42 = distinct !DILexicalBlock(scope: !12, file: !13, line: 42, column: 5)
!43 = !DILocation(line: 43, column: 13, scope: !42)
!44 = !DILocalVariable(name: "buffer", scope: !42, file: !13, line: 44, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 10)
!48 = !DILocation(line: 44, column: 13, scope: !42)
!49 = !DILocation(line: 47, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !42, file: !13, line: 47, column: 13)
!51 = !DILocation(line: 47, column: 18, scope: !50)
!52 = !DILocation(line: 47, column: 13, scope: !42)
!53 = !DILocation(line: 49, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !13, line: 48, column: 9)
!55 = !DILocation(line: 49, column: 13, scope: !54)
!56 = !DILocation(line: 49, column: 26, scope: !54)
!57 = !DILocation(line: 51, column: 19, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !13, line: 51, column: 13)
!59 = !DILocation(line: 51, column: 17, scope: !58)
!60 = !DILocation(line: 51, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !13, line: 51, column: 13)
!62 = !DILocation(line: 51, column: 26, scope: !61)
!63 = !DILocation(line: 51, column: 13, scope: !58)
!64 = !DILocation(line: 53, column: 37, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !13, line: 52, column: 13)
!66 = !DILocation(line: 53, column: 30, scope: !65)
!67 = !DILocation(line: 53, column: 17, scope: !65)
!68 = !DILocation(line: 54, column: 13, scope: !65)
!69 = !DILocation(line: 51, column: 33, scope: !61)
!70 = !DILocation(line: 51, column: 13, scope: !61)
!71 = distinct !{!71, !63, !72, !73}
!72 = !DILocation(line: 54, column: 13, scope: !58)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 55, column: 9, scope: !54)
!75 = !DILocation(line: 58, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !50, file: !13, line: 57, column: 9)
!77 = !DILocation(line: 61, column: 1, scope: !12)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_01_good", scope: !13, file: !13, line: 136, type: !14, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!79 = !DILocation(line: 138, column: 5, scope: !78)
!80 = !DILocation(line: 139, column: 5, scope: !78)
!81 = !DILocation(line: 140, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 151, type: !83, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!83 = !DISubroutineType(types: !84)
!84 = !{!18, !18, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !13, line: 151, type: !18)
!88 = !DILocation(line: 151, column: 14, scope: !82)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !13, line: 151, type: !85)
!90 = !DILocation(line: 151, column: 27, scope: !82)
!91 = !DILocation(line: 154, column: 22, scope: !82)
!92 = !DILocation(line: 154, column: 12, scope: !82)
!93 = !DILocation(line: 154, column: 5, scope: !82)
!94 = !DILocation(line: 156, column: 5, scope: !82)
!95 = !DILocation(line: 157, column: 5, scope: !82)
!96 = !DILocation(line: 158, column: 5, scope: !82)
!97 = !DILocation(line: 161, column: 5, scope: !82)
!98 = !DILocation(line: 162, column: 5, scope: !82)
!99 = !DILocation(line: 163, column: 5, scope: !82)
!100 = !DILocation(line: 165, column: 5, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 68, type: !14, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!102 = !DILocalVariable(name: "data", scope: !101, file: !13, line: 70, type: !18)
!103 = !DILocation(line: 70, column: 9, scope: !101)
!104 = !DILocation(line: 72, column: 10, scope: !101)
!105 = !DILocation(line: 75, column: 10, scope: !101)
!106 = !DILocalVariable(name: "i", scope: !107, file: !13, line: 77, type: !18)
!107 = distinct !DILexicalBlock(scope: !101, file: !13, line: 76, column: 5)
!108 = !DILocation(line: 77, column: 13, scope: !107)
!109 = !DILocalVariable(name: "buffer", scope: !107, file: !13, line: 78, type: !45)
!110 = !DILocation(line: 78, column: 13, scope: !107)
!111 = !DILocation(line: 81, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !13, line: 81, column: 13)
!113 = !DILocation(line: 81, column: 18, scope: !112)
!114 = !DILocation(line: 81, column: 13, scope: !107)
!115 = !DILocation(line: 83, column: 20, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !13, line: 82, column: 9)
!117 = !DILocation(line: 83, column: 13, scope: !116)
!118 = !DILocation(line: 83, column: 26, scope: !116)
!119 = !DILocation(line: 85, column: 19, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !13, line: 85, column: 13)
!121 = !DILocation(line: 85, column: 17, scope: !120)
!122 = !DILocation(line: 85, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !13, line: 85, column: 13)
!124 = !DILocation(line: 85, column: 26, scope: !123)
!125 = !DILocation(line: 85, column: 13, scope: !120)
!126 = !DILocation(line: 87, column: 37, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !13, line: 86, column: 13)
!128 = !DILocation(line: 87, column: 30, scope: !127)
!129 = !DILocation(line: 87, column: 17, scope: !127)
!130 = !DILocation(line: 88, column: 13, scope: !127)
!131 = !DILocation(line: 85, column: 33, scope: !123)
!132 = !DILocation(line: 85, column: 13, scope: !123)
!133 = distinct !{!133, !125, !134, !73}
!134 = !DILocation(line: 88, column: 13, scope: !120)
!135 = !DILocation(line: 89, column: 9, scope: !116)
!136 = !DILocation(line: 92, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !112, file: !13, line: 91, column: 9)
!138 = !DILocation(line: 95, column: 1, scope: !101)
!139 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 98, type: !14, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!140 = !DILocalVariable(name: "data", scope: !139, file: !13, line: 100, type: !18)
!141 = !DILocation(line: 100, column: 9, scope: !139)
!142 = !DILocation(line: 102, column: 10, scope: !139)
!143 = !DILocalVariable(name: "inputBuffer", scope: !144, file: !13, line: 104, type: !23)
!144 = distinct !DILexicalBlock(scope: !139, file: !13, line: 103, column: 5)
!145 = !DILocation(line: 104, column: 14, scope: !144)
!146 = !DILocation(line: 106, column: 19, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !13, line: 106, column: 13)
!148 = !DILocation(line: 106, column: 49, scope: !147)
!149 = !DILocation(line: 106, column: 13, scope: !147)
!150 = !DILocation(line: 106, column: 56, scope: !147)
!151 = !DILocation(line: 106, column: 13, scope: !144)
!152 = !DILocation(line: 109, column: 25, scope: !153)
!153 = distinct !DILexicalBlock(scope: !147, file: !13, line: 107, column: 9)
!154 = !DILocation(line: 109, column: 20, scope: !153)
!155 = !DILocation(line: 109, column: 18, scope: !153)
!156 = !DILocation(line: 110, column: 9, scope: !153)
!157 = !DILocation(line: 113, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !147, file: !13, line: 112, column: 9)
!159 = !DILocalVariable(name: "i", scope: !160, file: !13, line: 117, type: !18)
!160 = distinct !DILexicalBlock(scope: !139, file: !13, line: 116, column: 5)
!161 = !DILocation(line: 117, column: 13, scope: !160)
!162 = !DILocalVariable(name: "buffer", scope: !160, file: !13, line: 118, type: !45)
!163 = !DILocation(line: 118, column: 13, scope: !160)
!164 = !DILocation(line: 120, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !160, file: !13, line: 120, column: 13)
!166 = !DILocation(line: 120, column: 18, scope: !165)
!167 = !DILocation(line: 120, column: 23, scope: !165)
!168 = !DILocation(line: 120, column: 26, scope: !165)
!169 = !DILocation(line: 120, column: 31, scope: !165)
!170 = !DILocation(line: 120, column: 13, scope: !160)
!171 = !DILocation(line: 122, column: 20, scope: !172)
!172 = distinct !DILexicalBlock(scope: !165, file: !13, line: 121, column: 9)
!173 = !DILocation(line: 122, column: 13, scope: !172)
!174 = !DILocation(line: 122, column: 26, scope: !172)
!175 = !DILocation(line: 124, column: 19, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !13, line: 124, column: 13)
!177 = !DILocation(line: 124, column: 17, scope: !176)
!178 = !DILocation(line: 124, column: 24, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !13, line: 124, column: 13)
!180 = !DILocation(line: 124, column: 26, scope: !179)
!181 = !DILocation(line: 124, column: 13, scope: !176)
!182 = !DILocation(line: 126, column: 37, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !13, line: 125, column: 13)
!184 = !DILocation(line: 126, column: 30, scope: !183)
!185 = !DILocation(line: 126, column: 17, scope: !183)
!186 = !DILocation(line: 127, column: 13, scope: !183)
!187 = !DILocation(line: 124, column: 33, scope: !179)
!188 = !DILocation(line: 124, column: 13, scope: !179)
!189 = distinct !{!189, !181, !190, !73}
!190 = !DILocation(line: 127, column: 13, scope: !176)
!191 = !DILocation(line: 128, column: 9, scope: !172)
!192 = !DILocation(line: 131, column: 13, scope: !193)
!193 = distinct !DILexicalBlock(scope: !165, file: !13, line: 130, column: 9)
!194 = !DILocation(line: 134, column: 1, scope: !139)
