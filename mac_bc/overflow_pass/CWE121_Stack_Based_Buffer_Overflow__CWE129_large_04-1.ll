; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  store i32 10, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !32
  %1 = load i32, i32* %data, align 4, !dbg !33
  %cmp = icmp sge i32 %1, 0, !dbg !35
  br i1 %cmp, label %if.then, label %if.else, !dbg !36

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !37
  %idxprom = sext i32 %2 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !39
  store i32 1, i32* %arrayidx, align 4, !dbg !40
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !44
  %cmp1 = icmp slt i32 %3, 10, !dbg !46
  br i1 %cmp1, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !48
  %idxprom2 = sext i32 %4 to i64, !dbg !50
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !50
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !50
  call void @printIntLine(i32 noundef %5), !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %6, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !58

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !59
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_good() #0 !dbg !62 {
entry:
  call void @goodB2G1(), !dbg !63
  call void @goodB2G2(), !dbg !64
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_good(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_bad(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !88 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 -1, i32* %data, align 4, !dbg !91
  store i32 10, i32* %data, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata i32* %i, metadata !95, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !101
  %1 = load i32, i32* %data, align 4, !dbg !102
  %cmp = icmp sge i32 %1, 0, !dbg !104
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !105

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !106
  %cmp1 = icmp slt i32 %2, 10, !dbg !107
  br i1 %cmp1, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !109
  %idxprom = sext i32 %3 to i64, !dbg !111
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !111
  store i32 1, i32* %arrayidx, align 4, !dbg !112
  store i32 0, i32* %i, align 4, !dbg !113
  br label %for.cond, !dbg !115

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !116
  %cmp2 = icmp slt i32 %4, 10, !dbg !118
  br i1 %cmp2, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !120
  %idxprom3 = sext i32 %5 to i64, !dbg !122
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !122
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !122
  call void @printIntLine(i32 noundef %6), !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !125
  %inc = add nsw i32 %7, 1, !dbg !125
  store i32 %inc, i32* %i, align 4, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !129

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !130
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !133 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !134, metadata !DIExpression()), !dbg !135
  store i32 -1, i32* %data, align 4, !dbg !136
  store i32 10, i32* %data, align 4, !dbg !137
  call void @llvm.dbg.declare(metadata i32* %i, metadata !140, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !146
  %1 = load i32, i32* %data, align 4, !dbg !147
  %cmp = icmp sge i32 %1, 0, !dbg !149
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !150

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !151
  %cmp1 = icmp slt i32 %2, 10, !dbg !152
  br i1 %cmp1, label %if.then, label %if.else, !dbg !153

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !154
  %idxprom = sext i32 %3 to i64, !dbg !156
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !156
  store i32 1, i32* %arrayidx, align 4, !dbg !157
  store i32 0, i32* %i, align 4, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !161
  %cmp2 = icmp slt i32 %4, 10, !dbg !163
  br i1 %cmp2, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !165
  %idxprom3 = sext i32 %5 to i64, !dbg !167
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !167
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !167
  call void @printIntLine(i32 noundef %6), !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !170
  %inc = add nsw i32 %7, 1, !dbg !170
  store i32 %inc, i32* %i, align 4, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !174

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !175
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !177
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !178 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !179, metadata !DIExpression()), !dbg !180
  store i32 -1, i32* %data, align 4, !dbg !181
  store i32 7, i32* %data, align 4, !dbg !182
  call void @llvm.dbg.declare(metadata i32* %i, metadata !185, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !190, metadata !DIExpression()), !dbg !191
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !191
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !191
  %1 = load i32, i32* %data, align 4, !dbg !192
  %cmp = icmp sge i32 %1, 0, !dbg !194
  br i1 %cmp, label %if.then, label %if.else, !dbg !195

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !196
  %idxprom = sext i32 %2 to i64, !dbg !198
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !198
  store i32 1, i32* %arrayidx, align 4, !dbg !199
  store i32 0, i32* %i, align 4, !dbg !200
  br label %for.cond, !dbg !202

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !203
  %cmp1 = icmp slt i32 %3, 10, !dbg !205
  br i1 %cmp1, label %for.body, label %for.end, !dbg !206

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !207
  %idxprom2 = sext i32 %4 to i64, !dbg !209
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !209
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !209
  call void @printIntLine(i32 noundef %5), !dbg !210
  br label %for.inc, !dbg !211

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !212
  %inc = add nsw i32 %6, 1, !dbg !212
  store i32 %inc, i32* %i, align 4, !dbg !212
  br label %for.cond, !dbg !213, !llvm.loop !214

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !216

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !217
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !219
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !220 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !221, metadata !DIExpression()), !dbg !222
  store i32 -1, i32* %data, align 4, !dbg !223
  store i32 7, i32* %data, align 4, !dbg !224
  call void @llvm.dbg.declare(metadata i32* %i, metadata !227, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !232, metadata !DIExpression()), !dbg !233
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !233
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !233
  %1 = load i32, i32* %data, align 4, !dbg !234
  %cmp = icmp sge i32 %1, 0, !dbg !236
  br i1 %cmp, label %if.then, label %if.else, !dbg !237

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !238
  %idxprom = sext i32 %2 to i64, !dbg !240
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !240
  store i32 1, i32* %arrayidx, align 4, !dbg !241
  store i32 0, i32* %i, align 4, !dbg !242
  br label %for.cond, !dbg !244

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !245
  %cmp1 = icmp slt i32 %3, 10, !dbg !247
  br i1 %cmp1, label %for.body, label %for.end, !dbg !248

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !249
  %idxprom2 = sext i32 %4 to i64, !dbg !251
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !251
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !251
  call void @printIntLine(i32 noundef %5), !dbg !252
  br label %for.inc, !dbg !253

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !254
  %inc = add nsw i32 %6, 1, !dbg !254
  store i32 %inc, i32* %i, align 4, !dbg !254
  br label %for.cond, !dbg !255, !llvm.loop !256

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !258

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !259
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !261
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 30, column: 9, scope: !11)
!19 = !DILocation(line: 32, column: 10, scope: !11)
!20 = !DILocation(line: 36, column: 14, scope: !21)
!21 = distinct !DILexicalBlock(scope: !22, file: !12, line: 34, column: 5)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!23 = !DILocalVariable(name: "i", scope: !24, file: !12, line: 41, type: !17)
!24 = distinct !DILexicalBlock(scope: !25, file: !12, line: 40, column: 9)
!25 = distinct !DILexicalBlock(scope: !26, file: !12, line: 39, column: 5)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 8)
!27 = !DILocation(line: 41, column: 17, scope: !24)
!28 = !DILocalVariable(name: "buffer", scope: !24, file: !12, line: 42, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 10)
!32 = !DILocation(line: 42, column: 17, scope: !24)
!33 = !DILocation(line: 45, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !24, file: !12, line: 45, column: 17)
!35 = !DILocation(line: 45, column: 22, scope: !34)
!36 = !DILocation(line: 45, column: 17, scope: !24)
!37 = !DILocation(line: 47, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 46, column: 13)
!39 = !DILocation(line: 47, column: 17, scope: !38)
!40 = !DILocation(line: 47, column: 30, scope: !38)
!41 = !DILocation(line: 49, column: 23, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 49, column: 17)
!43 = !DILocation(line: 49, column: 21, scope: !42)
!44 = !DILocation(line: 49, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !12, line: 49, column: 17)
!46 = !DILocation(line: 49, column: 30, scope: !45)
!47 = !DILocation(line: 49, column: 17, scope: !42)
!48 = !DILocation(line: 51, column: 41, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 50, column: 17)
!50 = !DILocation(line: 51, column: 34, scope: !49)
!51 = !DILocation(line: 51, column: 21, scope: !49)
!52 = !DILocation(line: 52, column: 17, scope: !49)
!53 = !DILocation(line: 49, column: 37, scope: !45)
!54 = !DILocation(line: 49, column: 17, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 52, column: 17, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 53, column: 13, scope: !38)
!59 = !DILocation(line: 56, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !34, file: !12, line: 55, column: 13)
!61 = !DILocation(line: 60, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_04_good", scope: !12, file: !12, line: 216, type: !13, scopeLine: 217, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!63 = !DILocation(line: 218, column: 5, scope: !62)
!64 = !DILocation(line: 219, column: 5, scope: !62)
!65 = !DILocation(line: 220, column: 5, scope: !62)
!66 = !DILocation(line: 221, column: 5, scope: !62)
!67 = !DILocation(line: 222, column: 1, scope: !62)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 233, type: !69, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!69 = !DISubroutineType(types: !70)
!70 = !{!17, !17, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 233, type: !17)
!75 = !DILocation(line: 233, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 233, type: !71)
!77 = !DILocation(line: 233, column: 27, scope: !68)
!78 = !DILocation(line: 236, column: 22, scope: !68)
!79 = !DILocation(line: 236, column: 12, scope: !68)
!80 = !DILocation(line: 236, column: 5, scope: !68)
!81 = !DILocation(line: 238, column: 5, scope: !68)
!82 = !DILocation(line: 239, column: 5, scope: !68)
!83 = !DILocation(line: 240, column: 5, scope: !68)
!84 = !DILocation(line: 243, column: 5, scope: !68)
!85 = !DILocation(line: 244, column: 5, scope: !68)
!86 = !DILocation(line: 245, column: 5, scope: !68)
!87 = !DILocation(line: 247, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 69, type: !17)
!90 = !DILocation(line: 69, column: 9, scope: !88)
!91 = !DILocation(line: 71, column: 10, scope: !88)
!92 = !DILocation(line: 75, column: 14, scope: !93)
!93 = distinct !DILexicalBlock(scope: !94, file: !12, line: 73, column: 5)
!94 = distinct !DILexicalBlock(scope: !88, file: !12, line: 72, column: 8)
!95 = !DILocalVariable(name: "i", scope: !96, file: !12, line: 85, type: !17)
!96 = distinct !DILexicalBlock(scope: !97, file: !12, line: 84, column: 9)
!97 = distinct !DILexicalBlock(scope: !98, file: !12, line: 83, column: 5)
!98 = distinct !DILexicalBlock(scope: !88, file: !12, line: 77, column: 8)
!99 = !DILocation(line: 85, column: 17, scope: !96)
!100 = !DILocalVariable(name: "buffer", scope: !96, file: !12, line: 86, type: !29)
!101 = !DILocation(line: 86, column: 17, scope: !96)
!102 = !DILocation(line: 88, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !12, line: 88, column: 17)
!104 = !DILocation(line: 88, column: 22, scope: !103)
!105 = !DILocation(line: 88, column: 27, scope: !103)
!106 = !DILocation(line: 88, column: 30, scope: !103)
!107 = !DILocation(line: 88, column: 35, scope: !103)
!108 = !DILocation(line: 88, column: 17, scope: !96)
!109 = !DILocation(line: 90, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !12, line: 89, column: 13)
!111 = !DILocation(line: 90, column: 17, scope: !110)
!112 = !DILocation(line: 90, column: 30, scope: !110)
!113 = !DILocation(line: 92, column: 23, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 92, column: 17)
!115 = !DILocation(line: 92, column: 21, scope: !114)
!116 = !DILocation(line: 92, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 92, column: 17)
!118 = !DILocation(line: 92, column: 30, scope: !117)
!119 = !DILocation(line: 92, column: 17, scope: !114)
!120 = !DILocation(line: 94, column: 41, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 93, column: 17)
!122 = !DILocation(line: 94, column: 34, scope: !121)
!123 = !DILocation(line: 94, column: 21, scope: !121)
!124 = !DILocation(line: 95, column: 17, scope: !121)
!125 = !DILocation(line: 92, column: 37, scope: !117)
!126 = !DILocation(line: 92, column: 17, scope: !117)
!127 = distinct !{!127, !119, !128, !57}
!128 = !DILocation(line: 95, column: 17, scope: !114)
!129 = !DILocation(line: 96, column: 13, scope: !110)
!130 = !DILocation(line: 99, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !103, file: !12, line: 98, column: 13)
!132 = !DILocation(line: 103, column: 1, scope: !88)
!133 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 106, type: !13, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!134 = !DILocalVariable(name: "data", scope: !133, file: !12, line: 108, type: !17)
!135 = !DILocation(line: 108, column: 9, scope: !133)
!136 = !DILocation(line: 110, column: 10, scope: !133)
!137 = !DILocation(line: 114, column: 14, scope: !138)
!138 = distinct !DILexicalBlock(scope: !139, file: !12, line: 112, column: 5)
!139 = distinct !DILexicalBlock(scope: !133, file: !12, line: 111, column: 8)
!140 = !DILocalVariable(name: "i", scope: !141, file: !12, line: 119, type: !17)
!141 = distinct !DILexicalBlock(scope: !142, file: !12, line: 118, column: 9)
!142 = distinct !DILexicalBlock(scope: !143, file: !12, line: 117, column: 5)
!143 = distinct !DILexicalBlock(scope: !133, file: !12, line: 116, column: 8)
!144 = !DILocation(line: 119, column: 17, scope: !141)
!145 = !DILocalVariable(name: "buffer", scope: !141, file: !12, line: 120, type: !29)
!146 = !DILocation(line: 120, column: 17, scope: !141)
!147 = !DILocation(line: 122, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !141, file: !12, line: 122, column: 17)
!149 = !DILocation(line: 122, column: 22, scope: !148)
!150 = !DILocation(line: 122, column: 27, scope: !148)
!151 = !DILocation(line: 122, column: 30, scope: !148)
!152 = !DILocation(line: 122, column: 35, scope: !148)
!153 = !DILocation(line: 122, column: 17, scope: !141)
!154 = !DILocation(line: 124, column: 24, scope: !155)
!155 = distinct !DILexicalBlock(scope: !148, file: !12, line: 123, column: 13)
!156 = !DILocation(line: 124, column: 17, scope: !155)
!157 = !DILocation(line: 124, column: 30, scope: !155)
!158 = !DILocation(line: 126, column: 23, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !12, line: 126, column: 17)
!160 = !DILocation(line: 126, column: 21, scope: !159)
!161 = !DILocation(line: 126, column: 28, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 126, column: 17)
!163 = !DILocation(line: 126, column: 30, scope: !162)
!164 = !DILocation(line: 126, column: 17, scope: !159)
!165 = !DILocation(line: 128, column: 41, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !12, line: 127, column: 17)
!167 = !DILocation(line: 128, column: 34, scope: !166)
!168 = !DILocation(line: 128, column: 21, scope: !166)
!169 = !DILocation(line: 129, column: 17, scope: !166)
!170 = !DILocation(line: 126, column: 37, scope: !162)
!171 = !DILocation(line: 126, column: 17, scope: !162)
!172 = distinct !{!172, !164, !173, !57}
!173 = !DILocation(line: 129, column: 17, scope: !159)
!174 = !DILocation(line: 130, column: 13, scope: !155)
!175 = !DILocation(line: 133, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !148, file: !12, line: 132, column: 13)
!177 = !DILocation(line: 137, column: 1, scope: !133)
!178 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 140, type: !13, scopeLine: 141, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!179 = !DILocalVariable(name: "data", scope: !178, file: !12, line: 142, type: !17)
!180 = !DILocation(line: 142, column: 9, scope: !178)
!181 = !DILocation(line: 144, column: 10, scope: !178)
!182 = !DILocation(line: 154, column: 14, scope: !183)
!183 = distinct !DILexicalBlock(scope: !184, file: !12, line: 151, column: 5)
!184 = distinct !DILexicalBlock(scope: !178, file: !12, line: 145, column: 8)
!185 = !DILocalVariable(name: "i", scope: !186, file: !12, line: 159, type: !17)
!186 = distinct !DILexicalBlock(scope: !187, file: !12, line: 158, column: 9)
!187 = distinct !DILexicalBlock(scope: !188, file: !12, line: 157, column: 5)
!188 = distinct !DILexicalBlock(scope: !178, file: !12, line: 156, column: 8)
!189 = !DILocation(line: 159, column: 17, scope: !186)
!190 = !DILocalVariable(name: "buffer", scope: !186, file: !12, line: 160, type: !29)
!191 = !DILocation(line: 160, column: 17, scope: !186)
!192 = !DILocation(line: 163, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !186, file: !12, line: 163, column: 17)
!194 = !DILocation(line: 163, column: 22, scope: !193)
!195 = !DILocation(line: 163, column: 17, scope: !186)
!196 = !DILocation(line: 165, column: 24, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !12, line: 164, column: 13)
!198 = !DILocation(line: 165, column: 17, scope: !197)
!199 = !DILocation(line: 165, column: 30, scope: !197)
!200 = !DILocation(line: 167, column: 23, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !12, line: 167, column: 17)
!202 = !DILocation(line: 167, column: 21, scope: !201)
!203 = !DILocation(line: 167, column: 28, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !12, line: 167, column: 17)
!205 = !DILocation(line: 167, column: 30, scope: !204)
!206 = !DILocation(line: 167, column: 17, scope: !201)
!207 = !DILocation(line: 169, column: 41, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !12, line: 168, column: 17)
!209 = !DILocation(line: 169, column: 34, scope: !208)
!210 = !DILocation(line: 169, column: 21, scope: !208)
!211 = !DILocation(line: 170, column: 17, scope: !208)
!212 = !DILocation(line: 167, column: 37, scope: !204)
!213 = !DILocation(line: 167, column: 17, scope: !204)
!214 = distinct !{!214, !206, !215, !57}
!215 = !DILocation(line: 170, column: 17, scope: !201)
!216 = !DILocation(line: 171, column: 13, scope: !197)
!217 = !DILocation(line: 174, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !193, file: !12, line: 173, column: 13)
!219 = !DILocation(line: 178, column: 1, scope: !178)
!220 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 181, type: !13, scopeLine: 182, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!221 = !DILocalVariable(name: "data", scope: !220, file: !12, line: 183, type: !17)
!222 = !DILocation(line: 183, column: 9, scope: !220)
!223 = !DILocation(line: 185, column: 10, scope: !220)
!224 = !DILocation(line: 190, column: 14, scope: !225)
!225 = distinct !DILexicalBlock(scope: !226, file: !12, line: 187, column: 5)
!226 = distinct !DILexicalBlock(scope: !220, file: !12, line: 186, column: 8)
!227 = !DILocalVariable(name: "i", scope: !228, file: !12, line: 195, type: !17)
!228 = distinct !DILexicalBlock(scope: !229, file: !12, line: 194, column: 9)
!229 = distinct !DILexicalBlock(scope: !230, file: !12, line: 193, column: 5)
!230 = distinct !DILexicalBlock(scope: !220, file: !12, line: 192, column: 8)
!231 = !DILocation(line: 195, column: 17, scope: !228)
!232 = !DILocalVariable(name: "buffer", scope: !228, file: !12, line: 196, type: !29)
!233 = !DILocation(line: 196, column: 17, scope: !228)
!234 = !DILocation(line: 199, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !228, file: !12, line: 199, column: 17)
!236 = !DILocation(line: 199, column: 22, scope: !235)
!237 = !DILocation(line: 199, column: 17, scope: !228)
!238 = !DILocation(line: 201, column: 24, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !12, line: 200, column: 13)
!240 = !DILocation(line: 201, column: 17, scope: !239)
!241 = !DILocation(line: 201, column: 30, scope: !239)
!242 = !DILocation(line: 203, column: 23, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !12, line: 203, column: 17)
!244 = !DILocation(line: 203, column: 21, scope: !243)
!245 = !DILocation(line: 203, column: 28, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !12, line: 203, column: 17)
!247 = !DILocation(line: 203, column: 30, scope: !246)
!248 = !DILocation(line: 203, column: 17, scope: !243)
!249 = !DILocation(line: 205, column: 41, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !12, line: 204, column: 17)
!251 = !DILocation(line: 205, column: 34, scope: !250)
!252 = !DILocation(line: 205, column: 21, scope: !250)
!253 = !DILocation(line: 206, column: 17, scope: !250)
!254 = !DILocation(line: 203, column: 37, scope: !246)
!255 = !DILocation(line: 203, column: 17, scope: !246)
!256 = distinct !{!256, !248, !257, !57}
!257 = !DILocation(line: 206, column: 17, scope: !243)
!258 = !DILocation(line: 207, column: 13, scope: !239)
!259 = !DILocation(line: 210, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !235, file: !12, line: 209, column: 13)
!261 = !DILocation(line: 214, column: 1, scope: !220)
