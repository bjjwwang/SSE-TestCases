; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_03-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_03_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !48, metadata !DIExpression()), !dbg !52
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !52
  %3 = load i32, i32* %data, align 4, !dbg !53
  %cmp3 = icmp sge i32 %3, 0, !dbg !55
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !56

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !57
  %idxprom = sext i32 %4 to i64, !dbg !59
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !59
  store i32 1, i32* %arrayidx, align 4, !dbg !60
  store i32 0, i32* %i, align 4, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !64
  %cmp5 = icmp slt i32 %5, 10, !dbg !66
  br i1 %cmp5, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !68
  %idxprom6 = sext i32 %6 to i64, !dbg !70
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !70
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !70
  call void @printIntLine(i32 noundef %7), !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !73
  %inc = add nsw i32 %8, 1, !dbg !73
  store i32 %inc, i32* %i, align 4, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !78

if.else8:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  ret void, !dbg !81
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_03_good() #0 !dbg !82 {
entry:
  call void @goodB2G1(), !dbg !83
  call void @goodB2G2(), !dbg !84
  call void @goodG2B1(), !dbg !85
  call void @goodG2B2(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* noundef null), !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 noundef %conv), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_03_good(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_03_bad(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !107 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 -1, i32* %data, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !111, metadata !DIExpression()), !dbg !115
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !115
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !116
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !118
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !119
  %cmp = icmp ne i8* %call, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !122
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !124
  store i32 %call2, i32* %data, align 4, !dbg !125
  br label %if.end, !dbg !126

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !129, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !134, metadata !DIExpression()), !dbg !135
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !135
  %3 = load i32, i32* %data, align 4, !dbg !136
  %cmp3 = icmp sge i32 %3, 0, !dbg !138
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !139

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !140
  %cmp4 = icmp slt i32 %4, 10, !dbg !141
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !142

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !143
  %idxprom = sext i32 %5 to i64, !dbg !145
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !145
  store i32 1, i32* %arrayidx, align 4, !dbg !146
  store i32 0, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !150
  %cmp6 = icmp slt i32 %6, 10, !dbg !152
  br i1 %cmp6, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !154
  %idxprom7 = sext i32 %7 to i64, !dbg !156
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !156
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !156
  call void @printIntLine(i32 noundef %8), !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !159
  %inc = add nsw i32 %9, 1, !dbg !159
  store i32 %inc, i32* %i, align 4, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !163

if.else9:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !164
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  ret void, !dbg !166
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !167 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !168, metadata !DIExpression()), !dbg !169
  store i32 -1, i32* %data, align 4, !dbg !170
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !171, metadata !DIExpression()), !dbg !175
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !175
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !176
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !178
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !179
  %cmp = icmp ne i8* %call, null, !dbg !180
  br i1 %cmp, label %if.then, label %if.else, !dbg !181

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !182
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !184
  store i32 %call2, i32* %data, align 4, !dbg !185
  br label %if.end, !dbg !186

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !187
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !189, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !194, metadata !DIExpression()), !dbg !195
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !195
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !195
  %3 = load i32, i32* %data, align 4, !dbg !196
  %cmp3 = icmp sge i32 %3, 0, !dbg !198
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !199

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !200
  %cmp4 = icmp slt i32 %4, 10, !dbg !201
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !202

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !203
  %idxprom = sext i32 %5 to i64, !dbg !205
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !205
  store i32 1, i32* %arrayidx, align 4, !dbg !206
  store i32 0, i32* %i, align 4, !dbg !207
  br label %for.cond, !dbg !209

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !210
  %cmp6 = icmp slt i32 %6, 10, !dbg !212
  br i1 %cmp6, label %for.body, label %for.end, !dbg !213

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !214
  %idxprom7 = sext i32 %7 to i64, !dbg !216
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !216
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !216
  call void @printIntLine(i32 noundef %8), !dbg !217
  br label %for.inc, !dbg !218

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !219
  %inc = add nsw i32 %9, 1, !dbg !219
  store i32 %inc, i32* %i, align 4, !dbg !219
  br label %for.cond, !dbg !220, !llvm.loop !221

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !223

if.else9:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !224
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  ret void, !dbg !226
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !227 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !228, metadata !DIExpression()), !dbg !229
  store i32 -1, i32* %data, align 4, !dbg !230
  store i32 7, i32* %data, align 4, !dbg !231
  call void @llvm.dbg.declare(metadata i32* %i, metadata !234, metadata !DIExpression()), !dbg !238
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !239, metadata !DIExpression()), !dbg !240
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !240
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !240
  %1 = load i32, i32* %data, align 4, !dbg !241
  %cmp = icmp sge i32 %1, 0, !dbg !243
  br i1 %cmp, label %if.then, label %if.else, !dbg !244

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !245
  %idxprom = sext i32 %2 to i64, !dbg !247
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !247
  store i32 1, i32* %arrayidx, align 4, !dbg !248
  store i32 0, i32* %i, align 4, !dbg !249
  br label %for.cond, !dbg !251

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !252
  %cmp1 = icmp slt i32 %3, 10, !dbg !254
  br i1 %cmp1, label %for.body, label %for.end, !dbg !255

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !256
  %idxprom2 = sext i32 %4 to i64, !dbg !258
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !258
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !258
  call void @printIntLine(i32 noundef %5), !dbg !259
  br label %for.inc, !dbg !260

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !261
  %inc = add nsw i32 %6, 1, !dbg !261
  store i32 %inc, i32* %i, align 4, !dbg !261
  br label %for.cond, !dbg !262, !llvm.loop !263

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !265

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !266
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !268
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !269 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !270, metadata !DIExpression()), !dbg !271
  store i32 -1, i32* %data, align 4, !dbg !272
  store i32 7, i32* %data, align 4, !dbg !273
  call void @llvm.dbg.declare(metadata i32* %i, metadata !276, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !281, metadata !DIExpression()), !dbg !282
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !282
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !282
  %1 = load i32, i32* %data, align 4, !dbg !283
  %cmp = icmp sge i32 %1, 0, !dbg !285
  br i1 %cmp, label %if.then, label %if.else, !dbg !286

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !287
  %idxprom = sext i32 %2 to i64, !dbg !289
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !289
  store i32 1, i32* %arrayidx, align 4, !dbg !290
  store i32 0, i32* %i, align 4, !dbg !291
  br label %for.cond, !dbg !293

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !294
  %cmp1 = icmp slt i32 %3, 10, !dbg !296
  br i1 %cmp1, label %for.body, label %for.end, !dbg !297

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !298
  %idxprom2 = sext i32 %4 to i64, !dbg !300
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !300
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !300
  call void @printIntLine(i32 noundef %5), !dbg !301
  br label %for.inc, !dbg !302

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !303
  %inc = add nsw i32 %6, 1, !dbg !303
  store i32 %inc, i32* %i, align 4, !dbg !303
  br label %for.cond, !dbg !304, !llvm.loop !305

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !307

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !308
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !310
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_03_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!43 = !DILocalVariable(name: "i", scope: !44, file: !13, line: 48, type: !18)
!44 = distinct !DILexicalBlock(scope: !45, file: !13, line: 47, column: 9)
!45 = distinct !DILexicalBlock(scope: !46, file: !13, line: 46, column: 5)
!46 = distinct !DILexicalBlock(scope: !12, file: !13, line: 45, column: 8)
!47 = !DILocation(line: 48, column: 17, scope: !44)
!48 = !DILocalVariable(name: "buffer", scope: !44, file: !13, line: 49, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 10)
!52 = !DILocation(line: 49, column: 17, scope: !44)
!53 = !DILocation(line: 52, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !44, file: !13, line: 52, column: 17)
!55 = !DILocation(line: 52, column: 22, scope: !54)
!56 = !DILocation(line: 52, column: 17, scope: !44)
!57 = !DILocation(line: 54, column: 24, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !13, line: 53, column: 13)
!59 = !DILocation(line: 54, column: 17, scope: !58)
!60 = !DILocation(line: 54, column: 30, scope: !58)
!61 = !DILocation(line: 56, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !13, line: 56, column: 17)
!63 = !DILocation(line: 56, column: 21, scope: !62)
!64 = !DILocation(line: 56, column: 28, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !13, line: 56, column: 17)
!66 = !DILocation(line: 56, column: 30, scope: !65)
!67 = !DILocation(line: 56, column: 17, scope: !62)
!68 = !DILocation(line: 58, column: 41, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !13, line: 57, column: 17)
!70 = !DILocation(line: 58, column: 34, scope: !69)
!71 = !DILocation(line: 58, column: 21, scope: !69)
!72 = !DILocation(line: 59, column: 17, scope: !69)
!73 = !DILocation(line: 56, column: 37, scope: !65)
!74 = !DILocation(line: 56, column: 17, scope: !65)
!75 = distinct !{!75, !67, !76, !77}
!76 = !DILocation(line: 59, column: 17, scope: !62)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 60, column: 13, scope: !58)
!79 = !DILocation(line: 63, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !54, file: !13, line: 62, column: 13)
!81 = !DILocation(line: 67, column: 1, scope: !12)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_03_good", scope: !13, file: !13, line: 245, type: !14, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!83 = !DILocation(line: 247, column: 5, scope: !82)
!84 = !DILocation(line: 248, column: 5, scope: !82)
!85 = !DILocation(line: 249, column: 5, scope: !82)
!86 = !DILocation(line: 250, column: 5, scope: !82)
!87 = !DILocation(line: 251, column: 1, scope: !82)
!88 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 262, type: !89, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!89 = !DISubroutineType(types: !90)
!90 = !{!18, !18, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !13, line: 262, type: !18)
!94 = !DILocation(line: 262, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !13, line: 262, type: !91)
!96 = !DILocation(line: 262, column: 27, scope: !88)
!97 = !DILocation(line: 265, column: 22, scope: !88)
!98 = !DILocation(line: 265, column: 12, scope: !88)
!99 = !DILocation(line: 265, column: 5, scope: !88)
!100 = !DILocation(line: 267, column: 5, scope: !88)
!101 = !DILocation(line: 268, column: 5, scope: !88)
!102 = !DILocation(line: 269, column: 5, scope: !88)
!103 = !DILocation(line: 272, column: 5, scope: !88)
!104 = !DILocation(line: 273, column: 5, scope: !88)
!105 = !DILocation(line: 274, column: 5, scope: !88)
!106 = !DILocation(line: 276, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 74, type: !14, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!108 = !DILocalVariable(name: "data", scope: !107, file: !13, line: 76, type: !18)
!109 = !DILocation(line: 76, column: 9, scope: !107)
!110 = !DILocation(line: 78, column: 10, scope: !107)
!111 = !DILocalVariable(name: "inputBuffer", scope: !112, file: !13, line: 82, type: !25)
!112 = distinct !DILexicalBlock(scope: !113, file: !13, line: 81, column: 9)
!113 = distinct !DILexicalBlock(scope: !114, file: !13, line: 80, column: 5)
!114 = distinct !DILexicalBlock(scope: !107, file: !13, line: 79, column: 8)
!115 = !DILocation(line: 82, column: 18, scope: !112)
!116 = !DILocation(line: 84, column: 23, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !13, line: 84, column: 17)
!118 = !DILocation(line: 84, column: 53, scope: !117)
!119 = !DILocation(line: 84, column: 17, scope: !117)
!120 = !DILocation(line: 84, column: 60, scope: !117)
!121 = !DILocation(line: 84, column: 17, scope: !112)
!122 = !DILocation(line: 87, column: 29, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !13, line: 85, column: 13)
!124 = !DILocation(line: 87, column: 24, scope: !123)
!125 = !DILocation(line: 87, column: 22, scope: !123)
!126 = !DILocation(line: 88, column: 13, scope: !123)
!127 = !DILocation(line: 91, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !117, file: !13, line: 90, column: 13)
!129 = !DILocalVariable(name: "i", scope: !130, file: !13, line: 103, type: !18)
!130 = distinct !DILexicalBlock(scope: !131, file: !13, line: 102, column: 9)
!131 = distinct !DILexicalBlock(scope: !132, file: !13, line: 101, column: 5)
!132 = distinct !DILexicalBlock(scope: !107, file: !13, line: 95, column: 8)
!133 = !DILocation(line: 103, column: 17, scope: !130)
!134 = !DILocalVariable(name: "buffer", scope: !130, file: !13, line: 104, type: !49)
!135 = !DILocation(line: 104, column: 17, scope: !130)
!136 = !DILocation(line: 106, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !130, file: !13, line: 106, column: 17)
!138 = !DILocation(line: 106, column: 22, scope: !137)
!139 = !DILocation(line: 106, column: 27, scope: !137)
!140 = !DILocation(line: 106, column: 30, scope: !137)
!141 = !DILocation(line: 106, column: 35, scope: !137)
!142 = !DILocation(line: 106, column: 17, scope: !130)
!143 = !DILocation(line: 108, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !13, line: 107, column: 13)
!145 = !DILocation(line: 108, column: 17, scope: !144)
!146 = !DILocation(line: 108, column: 30, scope: !144)
!147 = !DILocation(line: 110, column: 23, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !13, line: 110, column: 17)
!149 = !DILocation(line: 110, column: 21, scope: !148)
!150 = !DILocation(line: 110, column: 28, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !13, line: 110, column: 17)
!152 = !DILocation(line: 110, column: 30, scope: !151)
!153 = !DILocation(line: 110, column: 17, scope: !148)
!154 = !DILocation(line: 112, column: 41, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !13, line: 111, column: 17)
!156 = !DILocation(line: 112, column: 34, scope: !155)
!157 = !DILocation(line: 112, column: 21, scope: !155)
!158 = !DILocation(line: 113, column: 17, scope: !155)
!159 = !DILocation(line: 110, column: 37, scope: !151)
!160 = !DILocation(line: 110, column: 17, scope: !151)
!161 = distinct !{!161, !153, !162, !77}
!162 = !DILocation(line: 113, column: 17, scope: !148)
!163 = !DILocation(line: 114, column: 13, scope: !144)
!164 = !DILocation(line: 117, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !137, file: !13, line: 116, column: 13)
!166 = !DILocation(line: 121, column: 1, scope: !107)
!167 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 124, type: !14, scopeLine: 125, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!168 = !DILocalVariable(name: "data", scope: !167, file: !13, line: 126, type: !18)
!169 = !DILocation(line: 126, column: 9, scope: !167)
!170 = !DILocation(line: 128, column: 10, scope: !167)
!171 = !DILocalVariable(name: "inputBuffer", scope: !172, file: !13, line: 132, type: !25)
!172 = distinct !DILexicalBlock(scope: !173, file: !13, line: 131, column: 9)
!173 = distinct !DILexicalBlock(scope: !174, file: !13, line: 130, column: 5)
!174 = distinct !DILexicalBlock(scope: !167, file: !13, line: 129, column: 8)
!175 = !DILocation(line: 132, column: 18, scope: !172)
!176 = !DILocation(line: 134, column: 23, scope: !177)
!177 = distinct !DILexicalBlock(scope: !172, file: !13, line: 134, column: 17)
!178 = !DILocation(line: 134, column: 53, scope: !177)
!179 = !DILocation(line: 134, column: 17, scope: !177)
!180 = !DILocation(line: 134, column: 60, scope: !177)
!181 = !DILocation(line: 134, column: 17, scope: !172)
!182 = !DILocation(line: 137, column: 29, scope: !183)
!183 = distinct !DILexicalBlock(scope: !177, file: !13, line: 135, column: 13)
!184 = !DILocation(line: 137, column: 24, scope: !183)
!185 = !DILocation(line: 137, column: 22, scope: !183)
!186 = !DILocation(line: 138, column: 13, scope: !183)
!187 = !DILocation(line: 141, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !177, file: !13, line: 140, column: 13)
!189 = !DILocalVariable(name: "i", scope: !190, file: !13, line: 148, type: !18)
!190 = distinct !DILexicalBlock(scope: !191, file: !13, line: 147, column: 9)
!191 = distinct !DILexicalBlock(scope: !192, file: !13, line: 146, column: 5)
!192 = distinct !DILexicalBlock(scope: !167, file: !13, line: 145, column: 8)
!193 = !DILocation(line: 148, column: 17, scope: !190)
!194 = !DILocalVariable(name: "buffer", scope: !190, file: !13, line: 149, type: !49)
!195 = !DILocation(line: 149, column: 17, scope: !190)
!196 = !DILocation(line: 151, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !190, file: !13, line: 151, column: 17)
!198 = !DILocation(line: 151, column: 22, scope: !197)
!199 = !DILocation(line: 151, column: 27, scope: !197)
!200 = !DILocation(line: 151, column: 30, scope: !197)
!201 = !DILocation(line: 151, column: 35, scope: !197)
!202 = !DILocation(line: 151, column: 17, scope: !190)
!203 = !DILocation(line: 153, column: 24, scope: !204)
!204 = distinct !DILexicalBlock(scope: !197, file: !13, line: 152, column: 13)
!205 = !DILocation(line: 153, column: 17, scope: !204)
!206 = !DILocation(line: 153, column: 30, scope: !204)
!207 = !DILocation(line: 155, column: 23, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !13, line: 155, column: 17)
!209 = !DILocation(line: 155, column: 21, scope: !208)
!210 = !DILocation(line: 155, column: 28, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !13, line: 155, column: 17)
!212 = !DILocation(line: 155, column: 30, scope: !211)
!213 = !DILocation(line: 155, column: 17, scope: !208)
!214 = !DILocation(line: 157, column: 41, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !13, line: 156, column: 17)
!216 = !DILocation(line: 157, column: 34, scope: !215)
!217 = !DILocation(line: 157, column: 21, scope: !215)
!218 = !DILocation(line: 158, column: 17, scope: !215)
!219 = !DILocation(line: 155, column: 37, scope: !211)
!220 = !DILocation(line: 155, column: 17, scope: !211)
!221 = distinct !{!221, !213, !222, !77}
!222 = !DILocation(line: 158, column: 17, scope: !208)
!223 = !DILocation(line: 159, column: 13, scope: !204)
!224 = !DILocation(line: 162, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !197, file: !13, line: 161, column: 13)
!226 = !DILocation(line: 166, column: 1, scope: !167)
!227 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 169, type: !14, scopeLine: 170, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!228 = !DILocalVariable(name: "data", scope: !227, file: !13, line: 171, type: !18)
!229 = !DILocation(line: 171, column: 9, scope: !227)
!230 = !DILocation(line: 173, column: 10, scope: !227)
!231 = !DILocation(line: 183, column: 14, scope: !232)
!232 = distinct !DILexicalBlock(scope: !233, file: !13, line: 180, column: 5)
!233 = distinct !DILexicalBlock(scope: !227, file: !13, line: 174, column: 8)
!234 = !DILocalVariable(name: "i", scope: !235, file: !13, line: 188, type: !18)
!235 = distinct !DILexicalBlock(scope: !236, file: !13, line: 187, column: 9)
!236 = distinct !DILexicalBlock(scope: !237, file: !13, line: 186, column: 5)
!237 = distinct !DILexicalBlock(scope: !227, file: !13, line: 185, column: 8)
!238 = !DILocation(line: 188, column: 17, scope: !235)
!239 = !DILocalVariable(name: "buffer", scope: !235, file: !13, line: 189, type: !49)
!240 = !DILocation(line: 189, column: 17, scope: !235)
!241 = !DILocation(line: 192, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !235, file: !13, line: 192, column: 17)
!243 = !DILocation(line: 192, column: 22, scope: !242)
!244 = !DILocation(line: 192, column: 17, scope: !235)
!245 = !DILocation(line: 194, column: 24, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !13, line: 193, column: 13)
!247 = !DILocation(line: 194, column: 17, scope: !246)
!248 = !DILocation(line: 194, column: 30, scope: !246)
!249 = !DILocation(line: 196, column: 23, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !13, line: 196, column: 17)
!251 = !DILocation(line: 196, column: 21, scope: !250)
!252 = !DILocation(line: 196, column: 28, scope: !253)
!253 = distinct !DILexicalBlock(scope: !250, file: !13, line: 196, column: 17)
!254 = !DILocation(line: 196, column: 30, scope: !253)
!255 = !DILocation(line: 196, column: 17, scope: !250)
!256 = !DILocation(line: 198, column: 41, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !13, line: 197, column: 17)
!258 = !DILocation(line: 198, column: 34, scope: !257)
!259 = !DILocation(line: 198, column: 21, scope: !257)
!260 = !DILocation(line: 199, column: 17, scope: !257)
!261 = !DILocation(line: 196, column: 37, scope: !253)
!262 = !DILocation(line: 196, column: 17, scope: !253)
!263 = distinct !{!263, !255, !264, !77}
!264 = !DILocation(line: 199, column: 17, scope: !250)
!265 = !DILocation(line: 200, column: 13, scope: !246)
!266 = !DILocation(line: 203, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !242, file: !13, line: 202, column: 13)
!268 = !DILocation(line: 207, column: 1, scope: !227)
!269 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 210, type: !14, scopeLine: 211, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!270 = !DILocalVariable(name: "data", scope: !269, file: !13, line: 212, type: !18)
!271 = !DILocation(line: 212, column: 9, scope: !269)
!272 = !DILocation(line: 214, column: 10, scope: !269)
!273 = !DILocation(line: 219, column: 14, scope: !274)
!274 = distinct !DILexicalBlock(scope: !275, file: !13, line: 216, column: 5)
!275 = distinct !DILexicalBlock(scope: !269, file: !13, line: 215, column: 8)
!276 = !DILocalVariable(name: "i", scope: !277, file: !13, line: 224, type: !18)
!277 = distinct !DILexicalBlock(scope: !278, file: !13, line: 223, column: 9)
!278 = distinct !DILexicalBlock(scope: !279, file: !13, line: 222, column: 5)
!279 = distinct !DILexicalBlock(scope: !269, file: !13, line: 221, column: 8)
!280 = !DILocation(line: 224, column: 17, scope: !277)
!281 = !DILocalVariable(name: "buffer", scope: !277, file: !13, line: 225, type: !49)
!282 = !DILocation(line: 225, column: 17, scope: !277)
!283 = !DILocation(line: 228, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !277, file: !13, line: 228, column: 17)
!285 = !DILocation(line: 228, column: 22, scope: !284)
!286 = !DILocation(line: 228, column: 17, scope: !277)
!287 = !DILocation(line: 230, column: 24, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !13, line: 229, column: 13)
!289 = !DILocation(line: 230, column: 17, scope: !288)
!290 = !DILocation(line: 230, column: 30, scope: !288)
!291 = !DILocation(line: 232, column: 23, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !13, line: 232, column: 17)
!293 = !DILocation(line: 232, column: 21, scope: !292)
!294 = !DILocation(line: 232, column: 28, scope: !295)
!295 = distinct !DILexicalBlock(scope: !292, file: !13, line: 232, column: 17)
!296 = !DILocation(line: 232, column: 30, scope: !295)
!297 = !DILocation(line: 232, column: 17, scope: !292)
!298 = !DILocation(line: 234, column: 41, scope: !299)
!299 = distinct !DILexicalBlock(scope: !295, file: !13, line: 233, column: 17)
!300 = !DILocation(line: 234, column: 34, scope: !299)
!301 = !DILocation(line: 234, column: 21, scope: !299)
!302 = !DILocation(line: 235, column: 17, scope: !299)
!303 = !DILocation(line: 232, column: 37, scope: !295)
!304 = !DILocation(line: 232, column: 17, scope: !295)
!305 = distinct !{!305, !297, !306, !77}
!306 = !DILocation(line: 235, column: 17, scope: !292)
!307 = !DILocation(line: 236, column: 13, scope: !288)
!308 = !DILocation(line: 239, column: 17, scope: !309)
!309 = distinct !DILexicalBlock(scope: !284, file: !13, line: 238, column: 13)
!310 = !DILocation(line: 243, column: 1, scope: !269)
