; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@globalFive = external global i32, align 4
@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* @globalFive, align 4, !dbg !20
  %cmp = icmp eq i32 %0, 5, !dbg !22
  br i1 %cmp, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !24
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !26
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !28
  %cmp1 = icmp eq i32 %2, 5, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !31

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !36, metadata !DIExpression()), !dbg !40
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !40
  %4 = load i32, i32* %data, align 4, !dbg !41
  %cmp3 = icmp sge i32 %4, 0, !dbg !43
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !44

if.then4:                                         ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !45
  %idxprom = sext i32 %5 to i64, !dbg !47
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !47
  store i32 1, i32* %arrayidx, align 4, !dbg !48
  store i32 0, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.then4
  %6 = load i32, i32* %i, align 4, !dbg !52
  %cmp5 = icmp slt i32 %6, 10, !dbg !54
  br i1 %cmp5, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !56
  %idxprom6 = sext i32 %7 to i64, !dbg !58
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !58
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !58
  call void @printIntLine(i32 noundef %8), !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !61
  %inc = add nsw i32 %9, 1, !dbg !61
  store i32 %inc, i32* %i, align 4, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !66

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !69

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_14_good() #0 !dbg !71 {
entry:
  call void @goodB2G1(), !dbg !72
  call void @goodB2G2(), !dbg !73
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* noundef null), !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 noundef %conv), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_14_good(), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_14_bad(), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !97 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 -1, i32* %data, align 4, !dbg !100
  %0 = load i32, i32* @globalFive, align 4, !dbg !101
  %cmp = icmp eq i32 %0, 5, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !105
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !107
  br label %if.end, !dbg !108

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !109
  %cmp1 = icmp ne i32 %2, 5, !dbg !111
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !112

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !113
  br label %if.end11, !dbg !115

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !116, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !120, metadata !DIExpression()), !dbg !121
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !121
  %4 = load i32, i32* %data, align 4, !dbg !122
  %cmp3 = icmp sge i32 %4, 0, !dbg !124
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !125

land.lhs.true:                                    ; preds = %if.else
  %5 = load i32, i32* %data, align 4, !dbg !126
  %cmp4 = icmp slt i32 %5, 10, !dbg !127
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !128

if.then5:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !129
  %idxprom = sext i32 %6 to i64, !dbg !131
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !131
  store i32 1, i32* %arrayidx, align 4, !dbg !132
  store i32 0, i32* %i, align 4, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.then5
  %7 = load i32, i32* %i, align 4, !dbg !136
  %cmp6 = icmp slt i32 %7, 10, !dbg !138
  br i1 %cmp6, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !140
  %idxprom7 = sext i32 %8 to i64, !dbg !142
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !142
  %9 = load i32, i32* %arrayidx8, align 4, !dbg !142
  call void @printIntLine(i32 noundef %9), !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !145
  %inc = add nsw i32 %10, 1, !dbg !145
  store i32 %inc, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !149

if.else9:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !150
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.then2
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !153 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !154, metadata !DIExpression()), !dbg !155
  store i32 -1, i32* %data, align 4, !dbg !156
  %0 = load i32, i32* @globalFive, align 4, !dbg !157
  %cmp = icmp eq i32 %0, 5, !dbg !159
  br i1 %cmp, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !161
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !165
  %cmp1 = icmp eq i32 %2, 5, !dbg !167
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !168

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !169, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !173, metadata !DIExpression()), !dbg !174
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !174
  %4 = load i32, i32* %data, align 4, !dbg !175
  %cmp3 = icmp sge i32 %4, 0, !dbg !177
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !178

land.lhs.true:                                    ; preds = %if.then2
  %5 = load i32, i32* %data, align 4, !dbg !179
  %cmp4 = icmp slt i32 %5, 10, !dbg !180
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !181

if.then5:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !182
  %idxprom = sext i32 %6 to i64, !dbg !184
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !184
  store i32 1, i32* %arrayidx, align 4, !dbg !185
  store i32 0, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.then5
  %7 = load i32, i32* %i, align 4, !dbg !189
  %cmp6 = icmp slt i32 %7, 10, !dbg !191
  br i1 %cmp6, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !193
  %idxprom7 = sext i32 %8 to i64, !dbg !195
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !195
  %9 = load i32, i32* %arrayidx8, align 4, !dbg !195
  call void @printIntLine(i32 noundef %9), !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !198
  %inc = add nsw i32 %10, 1, !dbg !198
  store i32 %inc, i32* %i, align 4, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !202

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !203
  br label %if.end9

if.end9:                                          ; preds = %if.else, %for.end
  br label %if.end10, !dbg !205

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !206
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !207 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !208, metadata !DIExpression()), !dbg !209
  store i32 -1, i32* %data, align 4, !dbg !210
  %0 = load i32, i32* @globalFive, align 4, !dbg !211
  %cmp = icmp ne i32 %0, 5, !dbg !213
  br i1 %cmp, label %if.then, label %if.else, !dbg !214

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !215
  br label %if.end, !dbg !217

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !218
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !220
  %cmp1 = icmp eq i32 %1, 5, !dbg !222
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !223

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !224, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !228, metadata !DIExpression()), !dbg !229
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !229
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !229
  %3 = load i32, i32* %data, align 4, !dbg !230
  %cmp3 = icmp sge i32 %3, 0, !dbg !232
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !233

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !234
  %idxprom = sext i32 %4 to i64, !dbg !236
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !236
  store i32 1, i32* %arrayidx, align 4, !dbg !237
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond, !dbg !240

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !241
  %cmp5 = icmp slt i32 %5, 10, !dbg !243
  br i1 %cmp5, label %for.body, label %for.end, !dbg !244

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !245
  %idxprom6 = sext i32 %6 to i64, !dbg !247
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !247
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !247
  call void @printIntLine(i32 noundef %7), !dbg !248
  br label %for.inc, !dbg !249

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !250
  %inc = add nsw i32 %8, 1, !dbg !250
  store i32 %inc, i32* %i, align 4, !dbg !250
  br label %for.cond, !dbg !251, !llvm.loop !252

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !254

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !255
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !257

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !258
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !259 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !260, metadata !DIExpression()), !dbg !261
  store i32 -1, i32* %data, align 4, !dbg !262
  %0 = load i32, i32* @globalFive, align 4, !dbg !263
  %cmp = icmp eq i32 %0, 5, !dbg !265
  br i1 %cmp, label %if.then, label %if.end, !dbg !266

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !267
  br label %if.end, !dbg !269

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !270
  %cmp1 = icmp eq i32 %1, 5, !dbg !272
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !273

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !274, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !278, metadata !DIExpression()), !dbg !279
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !279
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !279
  %3 = load i32, i32* %data, align 4, !dbg !280
  %cmp3 = icmp sge i32 %3, 0, !dbg !282
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !283

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !284
  %idxprom = sext i32 %4 to i64, !dbg !286
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !286
  store i32 1, i32* %arrayidx, align 4, !dbg !287
  store i32 0, i32* %i, align 4, !dbg !288
  br label %for.cond, !dbg !290

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !291
  %cmp5 = icmp slt i32 %5, 10, !dbg !293
  br i1 %cmp5, label %for.body, label %for.end, !dbg !294

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !295
  %idxprom6 = sext i32 %6 to i64, !dbg !297
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !297
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !297
  call void @printIntLine(i32 noundef %7), !dbg !298
  br label %for.inc, !dbg !299

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !300
  %inc = add nsw i32 %8, 1, !dbg !300
  store i32 %inc, i32* %i, align 4, !dbg !300
  br label %for.cond, !dbg !301, !llvm.loop !302

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !304

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !305
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !307

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !308
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_14_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 24, column: 9, scope: !11)
!19 = !DILocation(line: 26, column: 10, scope: !11)
!20 = !DILocation(line: 27, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!22 = !DILocation(line: 27, column: 18, scope: !21)
!23 = !DILocation(line: 27, column: 8, scope: !11)
!24 = !DILocation(line: 30, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !12, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 9, scope: !25)
!27 = !DILocation(line: 31, column: 5, scope: !25)
!28 = !DILocation(line: 32, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!30 = !DILocation(line: 32, column: 18, scope: !29)
!31 = !DILocation(line: 32, column: 8, scope: !11)
!32 = !DILocalVariable(name: "i", scope: !33, file: !12, line: 35, type: !17)
!33 = distinct !DILexicalBlock(scope: !34, file: !12, line: 34, column: 9)
!34 = distinct !DILexicalBlock(scope: !29, file: !12, line: 33, column: 5)
!35 = !DILocation(line: 35, column: 17, scope: !33)
!36 = !DILocalVariable(name: "buffer", scope: !33, file: !12, line: 36, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 10)
!40 = !DILocation(line: 36, column: 17, scope: !33)
!41 = !DILocation(line: 39, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !33, file: !12, line: 39, column: 17)
!43 = !DILocation(line: 39, column: 22, scope: !42)
!44 = !DILocation(line: 39, column: 17, scope: !33)
!45 = !DILocation(line: 41, column: 24, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 40, column: 13)
!47 = !DILocation(line: 41, column: 17, scope: !46)
!48 = !DILocation(line: 41, column: 30, scope: !46)
!49 = !DILocation(line: 43, column: 23, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 43, column: 17)
!51 = !DILocation(line: 43, column: 21, scope: !50)
!52 = !DILocation(line: 43, column: 28, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 43, column: 17)
!54 = !DILocation(line: 43, column: 30, scope: !53)
!55 = !DILocation(line: 43, column: 17, scope: !50)
!56 = !DILocation(line: 45, column: 41, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 44, column: 17)
!58 = !DILocation(line: 45, column: 34, scope: !57)
!59 = !DILocation(line: 45, column: 21, scope: !57)
!60 = !DILocation(line: 46, column: 17, scope: !57)
!61 = !DILocation(line: 43, column: 37, scope: !53)
!62 = !DILocation(line: 43, column: 17, scope: !53)
!63 = distinct !{!63, !55, !64, !65}
!64 = !DILocation(line: 46, column: 17, scope: !50)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 47, column: 13, scope: !46)
!67 = !DILocation(line: 50, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !42, file: !12, line: 49, column: 13)
!69 = !DILocation(line: 53, column: 5, scope: !34)
!70 = !DILocation(line: 54, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_14_good", scope: !12, file: !12, line: 210, type: !13, scopeLine: 211, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DILocation(line: 212, column: 5, scope: !71)
!73 = !DILocation(line: 213, column: 5, scope: !71)
!74 = !DILocation(line: 214, column: 5, scope: !71)
!75 = !DILocation(line: 215, column: 5, scope: !71)
!76 = !DILocation(line: 216, column: 1, scope: !71)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 227, type: !78, scopeLine: 228, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!78 = !DISubroutineType(types: !79)
!79 = !{!17, !17, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 227, type: !17)
!84 = !DILocation(line: 227, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 227, type: !80)
!86 = !DILocation(line: 227, column: 27, scope: !77)
!87 = !DILocation(line: 230, column: 22, scope: !77)
!88 = !DILocation(line: 230, column: 12, scope: !77)
!89 = !DILocation(line: 230, column: 5, scope: !77)
!90 = !DILocation(line: 232, column: 5, scope: !77)
!91 = !DILocation(line: 233, column: 5, scope: !77)
!92 = !DILocation(line: 234, column: 5, scope: !77)
!93 = !DILocation(line: 237, column: 5, scope: !77)
!94 = !DILocation(line: 238, column: 5, scope: !77)
!95 = !DILocation(line: 239, column: 5, scope: !77)
!96 = !DILocation(line: 241, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 63, type: !17)
!99 = !DILocation(line: 63, column: 9, scope: !97)
!100 = !DILocation(line: 65, column: 10, scope: !97)
!101 = !DILocation(line: 66, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !12, line: 66, column: 8)
!103 = !DILocation(line: 66, column: 18, scope: !102)
!104 = !DILocation(line: 66, column: 8, scope: !97)
!105 = !DILocation(line: 69, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !12, line: 67, column: 5)
!107 = !DILocation(line: 69, column: 9, scope: !106)
!108 = !DILocation(line: 70, column: 5, scope: !106)
!109 = !DILocation(line: 71, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !97, file: !12, line: 71, column: 8)
!111 = !DILocation(line: 71, column: 18, scope: !110)
!112 = !DILocation(line: 71, column: 8, scope: !97)
!113 = !DILocation(line: 74, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 72, column: 5)
!115 = !DILocation(line: 75, column: 5, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !117, file: !12, line: 79, type: !17)
!117 = distinct !DILexicalBlock(scope: !118, file: !12, line: 78, column: 9)
!118 = distinct !DILexicalBlock(scope: !110, file: !12, line: 77, column: 5)
!119 = !DILocation(line: 79, column: 17, scope: !117)
!120 = !DILocalVariable(name: "buffer", scope: !117, file: !12, line: 80, type: !37)
!121 = !DILocation(line: 80, column: 17, scope: !117)
!122 = !DILocation(line: 82, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !12, line: 82, column: 17)
!124 = !DILocation(line: 82, column: 22, scope: !123)
!125 = !DILocation(line: 82, column: 27, scope: !123)
!126 = !DILocation(line: 82, column: 30, scope: !123)
!127 = !DILocation(line: 82, column: 35, scope: !123)
!128 = !DILocation(line: 82, column: 17, scope: !117)
!129 = !DILocation(line: 84, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !123, file: !12, line: 83, column: 13)
!131 = !DILocation(line: 84, column: 17, scope: !130)
!132 = !DILocation(line: 84, column: 30, scope: !130)
!133 = !DILocation(line: 86, column: 23, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 86, column: 17)
!135 = !DILocation(line: 86, column: 21, scope: !134)
!136 = !DILocation(line: 86, column: 28, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 86, column: 17)
!138 = !DILocation(line: 86, column: 30, scope: !137)
!139 = !DILocation(line: 86, column: 17, scope: !134)
!140 = !DILocation(line: 88, column: 41, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !12, line: 87, column: 17)
!142 = !DILocation(line: 88, column: 34, scope: !141)
!143 = !DILocation(line: 88, column: 21, scope: !141)
!144 = !DILocation(line: 89, column: 17, scope: !141)
!145 = !DILocation(line: 86, column: 37, scope: !137)
!146 = !DILocation(line: 86, column: 17, scope: !137)
!147 = distinct !{!147, !139, !148, !65}
!148 = !DILocation(line: 89, column: 17, scope: !134)
!149 = !DILocation(line: 90, column: 13, scope: !130)
!150 = !DILocation(line: 93, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !123, file: !12, line: 92, column: 13)
!152 = !DILocation(line: 97, column: 1, scope: !97)
!153 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!154 = !DILocalVariable(name: "data", scope: !153, file: !12, line: 102, type: !17)
!155 = !DILocation(line: 102, column: 9, scope: !153)
!156 = !DILocation(line: 104, column: 10, scope: !153)
!157 = !DILocation(line: 105, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !12, line: 105, column: 8)
!159 = !DILocation(line: 105, column: 18, scope: !158)
!160 = !DILocation(line: 105, column: 8, scope: !153)
!161 = !DILocation(line: 108, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 106, column: 5)
!163 = !DILocation(line: 108, column: 9, scope: !162)
!164 = !DILocation(line: 109, column: 5, scope: !162)
!165 = !DILocation(line: 110, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !153, file: !12, line: 110, column: 8)
!167 = !DILocation(line: 110, column: 18, scope: !166)
!168 = !DILocation(line: 110, column: 8, scope: !153)
!169 = !DILocalVariable(name: "i", scope: !170, file: !12, line: 113, type: !17)
!170 = distinct !DILexicalBlock(scope: !171, file: !12, line: 112, column: 9)
!171 = distinct !DILexicalBlock(scope: !166, file: !12, line: 111, column: 5)
!172 = !DILocation(line: 113, column: 17, scope: !170)
!173 = !DILocalVariable(name: "buffer", scope: !170, file: !12, line: 114, type: !37)
!174 = !DILocation(line: 114, column: 17, scope: !170)
!175 = !DILocation(line: 116, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !170, file: !12, line: 116, column: 17)
!177 = !DILocation(line: 116, column: 22, scope: !176)
!178 = !DILocation(line: 116, column: 27, scope: !176)
!179 = !DILocation(line: 116, column: 30, scope: !176)
!180 = !DILocation(line: 116, column: 35, scope: !176)
!181 = !DILocation(line: 116, column: 17, scope: !170)
!182 = !DILocation(line: 118, column: 24, scope: !183)
!183 = distinct !DILexicalBlock(scope: !176, file: !12, line: 117, column: 13)
!184 = !DILocation(line: 118, column: 17, scope: !183)
!185 = !DILocation(line: 118, column: 30, scope: !183)
!186 = !DILocation(line: 120, column: 23, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !12, line: 120, column: 17)
!188 = !DILocation(line: 120, column: 21, scope: !187)
!189 = !DILocation(line: 120, column: 28, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !12, line: 120, column: 17)
!191 = !DILocation(line: 120, column: 30, scope: !190)
!192 = !DILocation(line: 120, column: 17, scope: !187)
!193 = !DILocation(line: 122, column: 41, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !12, line: 121, column: 17)
!195 = !DILocation(line: 122, column: 34, scope: !194)
!196 = !DILocation(line: 122, column: 21, scope: !194)
!197 = !DILocation(line: 123, column: 17, scope: !194)
!198 = !DILocation(line: 120, column: 37, scope: !190)
!199 = !DILocation(line: 120, column: 17, scope: !190)
!200 = distinct !{!200, !192, !201, !65}
!201 = !DILocation(line: 123, column: 17, scope: !187)
!202 = !DILocation(line: 124, column: 13, scope: !183)
!203 = !DILocation(line: 127, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !176, file: !12, line: 126, column: 13)
!205 = !DILocation(line: 130, column: 5, scope: !171)
!206 = !DILocation(line: 131, column: 1, scope: !153)
!207 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 134, type: !13, scopeLine: 135, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!208 = !DILocalVariable(name: "data", scope: !207, file: !12, line: 136, type: !17)
!209 = !DILocation(line: 136, column: 9, scope: !207)
!210 = !DILocation(line: 138, column: 10, scope: !207)
!211 = !DILocation(line: 139, column: 8, scope: !212)
!212 = distinct !DILexicalBlock(scope: !207, file: !12, line: 139, column: 8)
!213 = !DILocation(line: 139, column: 18, scope: !212)
!214 = !DILocation(line: 139, column: 8, scope: !207)
!215 = !DILocation(line: 142, column: 9, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !12, line: 140, column: 5)
!217 = !DILocation(line: 143, column: 5, scope: !216)
!218 = !DILocation(line: 148, column: 14, scope: !219)
!219 = distinct !DILexicalBlock(scope: !212, file: !12, line: 145, column: 5)
!220 = !DILocation(line: 150, column: 8, scope: !221)
!221 = distinct !DILexicalBlock(scope: !207, file: !12, line: 150, column: 8)
!222 = !DILocation(line: 150, column: 18, scope: !221)
!223 = !DILocation(line: 150, column: 8, scope: !207)
!224 = !DILocalVariable(name: "i", scope: !225, file: !12, line: 153, type: !17)
!225 = distinct !DILexicalBlock(scope: !226, file: !12, line: 152, column: 9)
!226 = distinct !DILexicalBlock(scope: !221, file: !12, line: 151, column: 5)
!227 = !DILocation(line: 153, column: 17, scope: !225)
!228 = !DILocalVariable(name: "buffer", scope: !225, file: !12, line: 154, type: !37)
!229 = !DILocation(line: 154, column: 17, scope: !225)
!230 = !DILocation(line: 157, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !225, file: !12, line: 157, column: 17)
!232 = !DILocation(line: 157, column: 22, scope: !231)
!233 = !DILocation(line: 157, column: 17, scope: !225)
!234 = !DILocation(line: 159, column: 24, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !12, line: 158, column: 13)
!236 = !DILocation(line: 159, column: 17, scope: !235)
!237 = !DILocation(line: 159, column: 30, scope: !235)
!238 = !DILocation(line: 161, column: 23, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !12, line: 161, column: 17)
!240 = !DILocation(line: 161, column: 21, scope: !239)
!241 = !DILocation(line: 161, column: 28, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !12, line: 161, column: 17)
!243 = !DILocation(line: 161, column: 30, scope: !242)
!244 = !DILocation(line: 161, column: 17, scope: !239)
!245 = !DILocation(line: 163, column: 41, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !12, line: 162, column: 17)
!247 = !DILocation(line: 163, column: 34, scope: !246)
!248 = !DILocation(line: 163, column: 21, scope: !246)
!249 = !DILocation(line: 164, column: 17, scope: !246)
!250 = !DILocation(line: 161, column: 37, scope: !242)
!251 = !DILocation(line: 161, column: 17, scope: !242)
!252 = distinct !{!252, !244, !253, !65}
!253 = !DILocation(line: 164, column: 17, scope: !239)
!254 = !DILocation(line: 165, column: 13, scope: !235)
!255 = !DILocation(line: 168, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !231, file: !12, line: 167, column: 13)
!257 = !DILocation(line: 171, column: 5, scope: !226)
!258 = !DILocation(line: 172, column: 1, scope: !207)
!259 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 175, type: !13, scopeLine: 176, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!260 = !DILocalVariable(name: "data", scope: !259, file: !12, line: 177, type: !17)
!261 = !DILocation(line: 177, column: 9, scope: !259)
!262 = !DILocation(line: 179, column: 10, scope: !259)
!263 = !DILocation(line: 180, column: 8, scope: !264)
!264 = distinct !DILexicalBlock(scope: !259, file: !12, line: 180, column: 8)
!265 = !DILocation(line: 180, column: 18, scope: !264)
!266 = !DILocation(line: 180, column: 8, scope: !259)
!267 = !DILocation(line: 184, column: 14, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !12, line: 181, column: 5)
!269 = !DILocation(line: 185, column: 5, scope: !268)
!270 = !DILocation(line: 186, column: 8, scope: !271)
!271 = distinct !DILexicalBlock(scope: !259, file: !12, line: 186, column: 8)
!272 = !DILocation(line: 186, column: 18, scope: !271)
!273 = !DILocation(line: 186, column: 8, scope: !259)
!274 = !DILocalVariable(name: "i", scope: !275, file: !12, line: 189, type: !17)
!275 = distinct !DILexicalBlock(scope: !276, file: !12, line: 188, column: 9)
!276 = distinct !DILexicalBlock(scope: !271, file: !12, line: 187, column: 5)
!277 = !DILocation(line: 189, column: 17, scope: !275)
!278 = !DILocalVariable(name: "buffer", scope: !275, file: !12, line: 190, type: !37)
!279 = !DILocation(line: 190, column: 17, scope: !275)
!280 = !DILocation(line: 193, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !275, file: !12, line: 193, column: 17)
!282 = !DILocation(line: 193, column: 22, scope: !281)
!283 = !DILocation(line: 193, column: 17, scope: !275)
!284 = !DILocation(line: 195, column: 24, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !12, line: 194, column: 13)
!286 = !DILocation(line: 195, column: 17, scope: !285)
!287 = !DILocation(line: 195, column: 30, scope: !285)
!288 = !DILocation(line: 197, column: 23, scope: !289)
!289 = distinct !DILexicalBlock(scope: !285, file: !12, line: 197, column: 17)
!290 = !DILocation(line: 197, column: 21, scope: !289)
!291 = !DILocation(line: 197, column: 28, scope: !292)
!292 = distinct !DILexicalBlock(scope: !289, file: !12, line: 197, column: 17)
!293 = !DILocation(line: 197, column: 30, scope: !292)
!294 = !DILocation(line: 197, column: 17, scope: !289)
!295 = !DILocation(line: 199, column: 41, scope: !296)
!296 = distinct !DILexicalBlock(scope: !292, file: !12, line: 198, column: 17)
!297 = !DILocation(line: 199, column: 34, scope: !296)
!298 = !DILocation(line: 199, column: 21, scope: !296)
!299 = !DILocation(line: 200, column: 17, scope: !296)
!300 = !DILocation(line: 197, column: 37, scope: !292)
!301 = !DILocation(line: 197, column: 17, scope: !292)
!302 = distinct !{!302, !294, !303, !65}
!303 = !DILocation(line: 200, column: 17, scope: !289)
!304 = !DILocation(line: 201, column: 13, scope: !285)
!305 = !DILocation(line: 204, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !281, file: !12, line: 203, column: 13)
!307 = !DILocation(line: 207, column: 5, scope: !276)
!308 = !DILocation(line: 208, column: 1, scope: !259)
