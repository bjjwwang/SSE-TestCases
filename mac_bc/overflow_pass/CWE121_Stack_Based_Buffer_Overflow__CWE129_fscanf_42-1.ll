; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__stdinp = external global %struct.__sFILE*, align 8
@.str.5 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* %data, align 4, !dbg !20
  %call = call i32 @badSource(i32 noundef %0), !dbg !21
  store i32 %call, i32* %data, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !26, metadata !DIExpression()), !dbg !30
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !30
  %2 = load i32, i32* %data, align 4, !dbg !31
  %cmp = icmp sge i32 %2, 0, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !35
  %idxprom = sext i32 %3 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !37
  store i32 1, i32* %arrayidx, align 4, !dbg !38
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !42
  %cmp1 = icmp slt i32 %4, 10, !dbg !44
  br i1 %cmp1, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !46
  %idxprom2 = sext i32 %5 to i64, !dbg !48
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !48
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !48
  call void @printIntLine(i32 noundef %6), !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %7, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !56

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !57
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @badSource(i32 noundef %data) #0 !dbg !60 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !65
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i32* noundef %data.addr), !dbg !66
  %1 = load i32, i32* %data.addr, align 4, !dbg !67
  ret i32 %1, !dbg !68
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_good() #0 !dbg !69 {
entry:
  call void @goodB2G(), !dbg !70
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* noundef null), !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 noundef %conv), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_good(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_bad(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !93 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i32 -1, i32* %data, align 4, !dbg !96
  %0 = load i32, i32* %data, align 4, !dbg !97
  %call = call i32 @goodB2GSource(i32 noundef %0), !dbg !98
  store i32 %call, i32* %data, align 4, !dbg !99
  call void @llvm.dbg.declare(metadata i32* %i, metadata !100, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !103, metadata !DIExpression()), !dbg !104
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !104
  %2 = load i32, i32* %data, align 4, !dbg !105
  %cmp = icmp sge i32 %2, 0, !dbg !107
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !108

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !109
  %cmp1 = icmp slt i32 %3, 10, !dbg !110
  br i1 %cmp1, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !112
  %idxprom = sext i32 %4 to i64, !dbg !114
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !114
  store i32 1, i32* %arrayidx, align 4, !dbg !115
  store i32 0, i32* %i, align 4, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !119
  %cmp2 = icmp slt i32 %5, 10, !dbg !121
  br i1 %cmp2, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !123
  %idxprom3 = sext i32 %6 to i64, !dbg !125
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !125
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !125
  call void @printIntLine(i32 noundef %7), !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !128
  %inc = add nsw i32 %8, 1, !dbg !128
  store i32 %inc, i32* %i, align 4, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !132

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !133
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodB2GSource(i32 noundef %data) #0 !dbg !136 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !137, metadata !DIExpression()), !dbg !138
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !139
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i32* noundef %data.addr), !dbg !140
  %1 = load i32, i32* %data.addr, align 4, !dbg !141
  ret i32 %1, !dbg !142
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !143 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !144, metadata !DIExpression()), !dbg !145
  store i32 -1, i32* %data, align 4, !dbg !146
  %0 = load i32, i32* %data, align 4, !dbg !147
  %call = call i32 @goodG2BSource(i32 noundef %0), !dbg !148
  store i32 %call, i32* %data, align 4, !dbg !149
  call void @llvm.dbg.declare(metadata i32* %i, metadata !150, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !153, metadata !DIExpression()), !dbg !154
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !154
  %2 = load i32, i32* %data, align 4, !dbg !155
  %cmp = icmp sge i32 %2, 0, !dbg !157
  br i1 %cmp, label %if.then, label %if.else, !dbg !158

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !159
  %idxprom = sext i32 %3 to i64, !dbg !161
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !161
  store i32 1, i32* %arrayidx, align 4, !dbg !162
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !166
  %cmp1 = icmp slt i32 %4, 10, !dbg !168
  br i1 %cmp1, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !170
  %idxprom2 = sext i32 %5 to i64, !dbg !172
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !172
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !172
  call void @printIntLine(i32 noundef %6), !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !175
  %inc = add nsw i32 %7, 1, !dbg !175
  store i32 %inc, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !179

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !180
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !182
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodG2BSource(i32 noundef %data) #0 !dbg !183 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !184, metadata !DIExpression()), !dbg !185
  store i32 7, i32* %data.addr, align 4, !dbg !186
  %0 = load i32, i32* %data.addr, align 4, !dbg !187
  ret i32 %0, !dbg !188
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!23 = !DILocalVariable(name: "i", scope: !24, file: !12, line: 36, type: !17)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!25 = !DILocation(line: 36, column: 13, scope: !24)
!26 = !DILocalVariable(name: "buffer", scope: !24, file: !12, line: 37, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 37, column: 13, scope: !24)
!31 = !DILocation(line: 40, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !12, line: 40, column: 13)
!33 = !DILocation(line: 40, column: 18, scope: !32)
!34 = !DILocation(line: 40, column: 13, scope: !24)
!35 = !DILocation(line: 42, column: 20, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 41, column: 9)
!37 = !DILocation(line: 42, column: 13, scope: !36)
!38 = !DILocation(line: 42, column: 26, scope: !36)
!39 = !DILocation(line: 44, column: 19, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 44, column: 13)
!41 = !DILocation(line: 44, column: 17, scope: !40)
!42 = !DILocation(line: 44, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 44, column: 13)
!44 = !DILocation(line: 44, column: 26, scope: !43)
!45 = !DILocation(line: 44, column: 13, scope: !40)
!46 = !DILocation(line: 46, column: 37, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 45, column: 13)
!48 = !DILocation(line: 46, column: 30, scope: !47)
!49 = !DILocation(line: 46, column: 17, scope: !47)
!50 = !DILocation(line: 47, column: 13, scope: !47)
!51 = !DILocation(line: 44, column: 33, scope: !43)
!52 = !DILocation(line: 44, column: 13, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 47, column: 13, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 48, column: 9, scope: !36)
!57 = !DILocation(line: 51, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !32, file: !12, line: 50, column: 9)
!59 = !DILocation(line: 54, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 22, type: !61, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!61 = !DISubroutineType(types: !62)
!62 = !{!17, !17}
!63 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !12, line: 22, type: !17)
!64 = !DILocation(line: 22, column: 26, scope: !60)
!65 = !DILocation(line: 25, column: 12, scope: !60)
!66 = !DILocation(line: 25, column: 5, scope: !60)
!67 = !DILocation(line: 26, column: 12, scope: !60)
!68 = !DILocation(line: 26, column: 5, scope: !60)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_42_good", scope: !12, file: !12, line: 130, type: !13, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!70 = !DILocation(line: 132, column: 5, scope: !69)
!71 = !DILocation(line: 133, column: 5, scope: !69)
!72 = !DILocation(line: 134, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 145, type: !74, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!74 = !DISubroutineType(types: !75)
!75 = !{!17, !17, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 145, type: !17)
!80 = !DILocation(line: 145, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 145, type: !76)
!82 = !DILocation(line: 145, column: 27, scope: !73)
!83 = !DILocation(line: 148, column: 22, scope: !73)
!84 = !DILocation(line: 148, column: 12, scope: !73)
!85 = !DILocation(line: 148, column: 5, scope: !73)
!86 = !DILocation(line: 150, column: 5, scope: !73)
!87 = !DILocation(line: 151, column: 5, scope: !73)
!88 = !DILocation(line: 152, column: 5, scope: !73)
!89 = !DILocation(line: 155, column: 5, scope: !73)
!90 = !DILocation(line: 156, column: 5, scope: !73)
!91 = !DILocation(line: 157, column: 5, scope: !73)
!92 = !DILocation(line: 159, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 104, type: !13, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 106, type: !17)
!95 = !DILocation(line: 106, column: 9, scope: !93)
!96 = !DILocation(line: 108, column: 10, scope: !93)
!97 = !DILocation(line: 109, column: 26, scope: !93)
!98 = !DILocation(line: 109, column: 12, scope: !93)
!99 = !DILocation(line: 109, column: 10, scope: !93)
!100 = !DILocalVariable(name: "i", scope: !101, file: !12, line: 111, type: !17)
!101 = distinct !DILexicalBlock(scope: !93, file: !12, line: 110, column: 5)
!102 = !DILocation(line: 111, column: 13, scope: !101)
!103 = !DILocalVariable(name: "buffer", scope: !101, file: !12, line: 112, type: !27)
!104 = !DILocation(line: 112, column: 13, scope: !101)
!105 = !DILocation(line: 114, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !12, line: 114, column: 13)
!107 = !DILocation(line: 114, column: 18, scope: !106)
!108 = !DILocation(line: 114, column: 23, scope: !106)
!109 = !DILocation(line: 114, column: 26, scope: !106)
!110 = !DILocation(line: 114, column: 31, scope: !106)
!111 = !DILocation(line: 114, column: 13, scope: !101)
!112 = !DILocation(line: 116, column: 20, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !12, line: 115, column: 9)
!114 = !DILocation(line: 116, column: 13, scope: !113)
!115 = !DILocation(line: 116, column: 26, scope: !113)
!116 = !DILocation(line: 118, column: 19, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 118, column: 13)
!118 = !DILocation(line: 118, column: 17, scope: !117)
!119 = !DILocation(line: 118, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 118, column: 13)
!121 = !DILocation(line: 118, column: 26, scope: !120)
!122 = !DILocation(line: 118, column: 13, scope: !117)
!123 = !DILocation(line: 120, column: 37, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !12, line: 119, column: 13)
!125 = !DILocation(line: 120, column: 30, scope: !124)
!126 = !DILocation(line: 120, column: 17, scope: !124)
!127 = !DILocation(line: 121, column: 13, scope: !124)
!128 = !DILocation(line: 118, column: 33, scope: !120)
!129 = !DILocation(line: 118, column: 13, scope: !120)
!130 = distinct !{!130, !122, !131, !55}
!131 = !DILocation(line: 121, column: 13, scope: !117)
!132 = !DILocation(line: 122, column: 9, scope: !113)
!133 = !DILocation(line: 125, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !106, file: !12, line: 124, column: 9)
!135 = !DILocation(line: 128, column: 1, scope: !93)
!136 = distinct !DISubprogram(name: "goodB2GSource", scope: !12, file: !12, line: 97, type: !61, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!137 = !DILocalVariable(name: "data", arg: 1, scope: !136, file: !12, line: 97, type: !17)
!138 = !DILocation(line: 97, column: 30, scope: !136)
!139 = !DILocation(line: 100, column: 12, scope: !136)
!140 = !DILocation(line: 100, column: 5, scope: !136)
!141 = !DILocation(line: 101, column: 12, scope: !136)
!142 = !DILocation(line: 101, column: 5, scope: !136)
!143 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!144 = !DILocalVariable(name: "data", scope: !143, file: !12, line: 71, type: !17)
!145 = !DILocation(line: 71, column: 9, scope: !143)
!146 = !DILocation(line: 73, column: 10, scope: !143)
!147 = !DILocation(line: 74, column: 26, scope: !143)
!148 = !DILocation(line: 74, column: 12, scope: !143)
!149 = !DILocation(line: 74, column: 10, scope: !143)
!150 = !DILocalVariable(name: "i", scope: !151, file: !12, line: 76, type: !17)
!151 = distinct !DILexicalBlock(scope: !143, file: !12, line: 75, column: 5)
!152 = !DILocation(line: 76, column: 13, scope: !151)
!153 = !DILocalVariable(name: "buffer", scope: !151, file: !12, line: 77, type: !27)
!154 = !DILocation(line: 77, column: 13, scope: !151)
!155 = !DILocation(line: 80, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !12, line: 80, column: 13)
!157 = !DILocation(line: 80, column: 18, scope: !156)
!158 = !DILocation(line: 80, column: 13, scope: !151)
!159 = !DILocation(line: 82, column: 20, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !12, line: 81, column: 9)
!161 = !DILocation(line: 82, column: 13, scope: !160)
!162 = !DILocation(line: 82, column: 26, scope: !160)
!163 = !DILocation(line: 84, column: 19, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !12, line: 84, column: 13)
!165 = !DILocation(line: 84, column: 17, scope: !164)
!166 = !DILocation(line: 84, column: 24, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !12, line: 84, column: 13)
!168 = !DILocation(line: 84, column: 26, scope: !167)
!169 = !DILocation(line: 84, column: 13, scope: !164)
!170 = !DILocation(line: 86, column: 37, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !12, line: 85, column: 13)
!172 = !DILocation(line: 86, column: 30, scope: !171)
!173 = !DILocation(line: 86, column: 17, scope: !171)
!174 = !DILocation(line: 87, column: 13, scope: !171)
!175 = !DILocation(line: 84, column: 33, scope: !167)
!176 = !DILocation(line: 84, column: 13, scope: !167)
!177 = distinct !{!177, !169, !178, !55}
!178 = !DILocation(line: 87, column: 13, scope: !164)
!179 = !DILocation(line: 88, column: 9, scope: !160)
!180 = !DILocation(line: 91, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !156, file: !12, line: 90, column: 9)
!182 = !DILocation(line: 94, column: 1, scope: !143)
!183 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 61, type: !61, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!184 = !DILocalVariable(name: "data", arg: 1, scope: !183, file: !12, line: 61, type: !17)
!185 = !DILocation(line: 61, column: 30, scope: !183)
!186 = !DILocation(line: 65, column: 10, scope: !183)
!187 = !DILocation(line: 66, column: 12, scope: !183)
!188 = !DILocation(line: 66, column: 5, scope: !183)
