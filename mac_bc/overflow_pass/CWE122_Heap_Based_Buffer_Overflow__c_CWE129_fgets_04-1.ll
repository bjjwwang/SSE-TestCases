; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_04-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_04_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !22, metadata !DIExpression()), !dbg !30
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !30
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !31
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !33
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !34
  %cmp = icmp ne i8* %call, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.else, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !39
  store i32 %call2, i32* %data, align 4, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !49, metadata !DIExpression()), !dbg !50
  %call3 = call i8* @malloc(i64 noundef 40) #6, !dbg !51
  %2 = bitcast i8* %call3 to i32*, !dbg !52
  store i32* %2, i32** %buffer, align 8, !dbg !50
  %3 = load i32*, i32** %buffer, align 8, !dbg !53
  %cmp4 = icmp eq i32* %3, null, !dbg !55
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !56

if.then5:                                         ; preds = %if.end
  call void @exit(i32 noundef -1) #7, !dbg !57
  unreachable, !dbg !57

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !62
  %cmp7 = icmp slt i32 %4, 10, !dbg !64
  br i1 %cmp7, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !66
  %6 = load i32, i32* %i, align 4, !dbg !68
  %idxprom = sext i32 %6 to i64, !dbg !66
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !66
  store i32 0, i32* %arrayidx, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !71
  %inc = add nsw i32 %7, 1, !dbg !71
  store i32 %inc, i32* %i, align 4, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !76
  %cmp8 = icmp sge i32 %8, 0, !dbg !78
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !79

if.then9:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !80
  %10 = load i32, i32* %data, align 4, !dbg !82
  %idxprom10 = sext i32 %10 to i64, !dbg !80
  %arrayidx11 = getelementptr inbounds i32, i32* %9, i64 %idxprom10, !dbg !80
  store i32 1, i32* %arrayidx11, align 4, !dbg !83
  store i32 0, i32* %i, align 4, !dbg !84
  br label %for.cond12, !dbg !86

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %11 = load i32, i32* %i, align 4, !dbg !87
  %cmp13 = icmp slt i32 %11, 10, !dbg !89
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !90

for.body14:                                       ; preds = %for.cond12
  %12 = load i32*, i32** %buffer, align 8, !dbg !91
  %13 = load i32, i32* %i, align 4, !dbg !93
  %idxprom15 = sext i32 %13 to i64, !dbg !91
  %arrayidx16 = getelementptr inbounds i32, i32* %12, i64 %idxprom15, !dbg !91
  %14 = load i32, i32* %arrayidx16, align 4, !dbg !91
  call void @printIntLine(i32 noundef %14), !dbg !94
  br label %for.inc17, !dbg !95

for.inc17:                                        ; preds = %for.body14
  %15 = load i32, i32* %i, align 4, !dbg !96
  %inc18 = add nsw i32 %15, 1, !dbg !96
  store i32 %inc18, i32* %i, align 4, !dbg !96
  br label %for.cond12, !dbg !97, !llvm.loop !98

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !100

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %16 = load i32*, i32** %buffer, align 8, !dbg !103
  %17 = bitcast i32* %16 to i8*, !dbg !103
  call void @free(i8* noundef %17), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i8* @fgets(i8* noundef, i32 noundef, %struct.__sFILE* noundef) #3

declare i32 @atoi(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

declare void @printIntLine(i32 noundef) #3

declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_04_good() #0 !dbg !106 {
entry:
  call void @goodB2G1(), !dbg !107
  call void @goodB2G2(), !dbg !108
  call void @goodG2B1(), !dbg !109
  call void @goodG2B2(), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !112 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !117, metadata !DIExpression()), !dbg !118
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !119, metadata !DIExpression()), !dbg !120
  %call = call i64 @time(i64* noundef null), !dbg !121
  %conv = trunc i64 %call to i32, !dbg !122
  call void @srand(i32 noundef %conv), !dbg !123
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !124
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_04_good(), !dbg !125
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !126
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !127
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_04_bad(), !dbg !128
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !129
  ret i32 0, !dbg !130
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !131 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !132, metadata !DIExpression()), !dbg !133
  store i32 -1, i32* %data, align 4, !dbg !134
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !135, metadata !DIExpression()), !dbg !139
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !139
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !140
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !142
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !143
  %cmp = icmp ne i8* %call, null, !dbg !144
  br i1 %cmp, label %if.then, label %if.else, !dbg !145

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !146
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !148
  store i32 %call2, i32* %data, align 4, !dbg !149
  br label %if.end, !dbg !150

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !151
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !153, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !158, metadata !DIExpression()), !dbg !159
  %call3 = call i8* @malloc(i64 noundef 40) #6, !dbg !160
  %2 = bitcast i8* %call3 to i32*, !dbg !161
  store i32* %2, i32** %buffer, align 8, !dbg !159
  %3 = load i32*, i32** %buffer, align 8, !dbg !162
  %cmp4 = icmp eq i32* %3, null, !dbg !164
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !165

if.then5:                                         ; preds = %if.end
  call void @exit(i32 noundef -1) #7, !dbg !166
  unreachable, !dbg !166

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !171
  %cmp7 = icmp slt i32 %4, 10, !dbg !173
  br i1 %cmp7, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !175
  %6 = load i32, i32* %i, align 4, !dbg !177
  %idxprom = sext i32 %6 to i64, !dbg !175
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !175
  store i32 0, i32* %arrayidx, align 4, !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !180
  %inc = add nsw i32 %7, 1, !dbg !180
  store i32 %inc, i32* %i, align 4, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !184
  %cmp8 = icmp sge i32 %8, 0, !dbg !186
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !187

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !188
  %cmp9 = icmp slt i32 %9, 10, !dbg !189
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !190

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !191
  %11 = load i32, i32* %data, align 4, !dbg !193
  %idxprom11 = sext i32 %11 to i64, !dbg !191
  %arrayidx12 = getelementptr inbounds i32, i32* %10, i64 %idxprom11, !dbg !191
  store i32 1, i32* %arrayidx12, align 4, !dbg !194
  store i32 0, i32* %i, align 4, !dbg !195
  br label %for.cond13, !dbg !197

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %12 = load i32, i32* %i, align 4, !dbg !198
  %cmp14 = icmp slt i32 %12, 10, !dbg !200
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !201

for.body15:                                       ; preds = %for.cond13
  %13 = load i32*, i32** %buffer, align 8, !dbg !202
  %14 = load i32, i32* %i, align 4, !dbg !204
  %idxprom16 = sext i32 %14 to i64, !dbg !202
  %arrayidx17 = getelementptr inbounds i32, i32* %13, i64 %idxprom16, !dbg !202
  %15 = load i32, i32* %arrayidx17, align 4, !dbg !202
  call void @printIntLine(i32 noundef %15), !dbg !205
  br label %for.inc18, !dbg !206

for.inc18:                                        ; preds = %for.body15
  %16 = load i32, i32* %i, align 4, !dbg !207
  %inc19 = add nsw i32 %16, 1, !dbg !207
  store i32 %inc19, i32* %i, align 4, !dbg !207
  br label %for.cond13, !dbg !208, !llvm.loop !209

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !211

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !212
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %17 = load i32*, i32** %buffer, align 8, !dbg !214
  %18 = bitcast i32* %17 to i8*, !dbg !214
  call void @free(i8* noundef %18), !dbg !215
  ret void, !dbg !216
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !217 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 -1, i32* %data, align 4, !dbg !220
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !221, metadata !DIExpression()), !dbg !225
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !225
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !225
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !226
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !228
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !229
  %cmp = icmp ne i8* %call, null, !dbg !230
  br i1 %cmp, label %if.then, label %if.else, !dbg !231

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !232
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !234
  store i32 %call2, i32* %data, align 4, !dbg !235
  br label %if.end, !dbg !236

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !237
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !239, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !244, metadata !DIExpression()), !dbg !245
  %call3 = call i8* @malloc(i64 noundef 40) #6, !dbg !246
  %2 = bitcast i8* %call3 to i32*, !dbg !247
  store i32* %2, i32** %buffer, align 8, !dbg !245
  %3 = load i32*, i32** %buffer, align 8, !dbg !248
  %cmp4 = icmp eq i32* %3, null, !dbg !250
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !251

if.then5:                                         ; preds = %if.end
  call void @exit(i32 noundef -1) #7, !dbg !252
  unreachable, !dbg !252

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !254
  br label %for.cond, !dbg !256

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !257
  %cmp7 = icmp slt i32 %4, 10, !dbg !259
  br i1 %cmp7, label %for.body, label %for.end, !dbg !260

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !261
  %6 = load i32, i32* %i, align 4, !dbg !263
  %idxprom = sext i32 %6 to i64, !dbg !261
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !261
  store i32 0, i32* %arrayidx, align 4, !dbg !264
  br label %for.inc, !dbg !265

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !266
  %inc = add nsw i32 %7, 1, !dbg !266
  store i32 %inc, i32* %i, align 4, !dbg !266
  br label %for.cond, !dbg !267, !llvm.loop !268

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !270
  %cmp8 = icmp sge i32 %8, 0, !dbg !272
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !273

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !274
  %cmp9 = icmp slt i32 %9, 10, !dbg !275
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !276

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !277
  %11 = load i32, i32* %data, align 4, !dbg !279
  %idxprom11 = sext i32 %11 to i64, !dbg !277
  %arrayidx12 = getelementptr inbounds i32, i32* %10, i64 %idxprom11, !dbg !277
  store i32 1, i32* %arrayidx12, align 4, !dbg !280
  store i32 0, i32* %i, align 4, !dbg !281
  br label %for.cond13, !dbg !283

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %12 = load i32, i32* %i, align 4, !dbg !284
  %cmp14 = icmp slt i32 %12, 10, !dbg !286
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !287

for.body15:                                       ; preds = %for.cond13
  %13 = load i32*, i32** %buffer, align 8, !dbg !288
  %14 = load i32, i32* %i, align 4, !dbg !290
  %idxprom16 = sext i32 %14 to i64, !dbg !288
  %arrayidx17 = getelementptr inbounds i32, i32* %13, i64 %idxprom16, !dbg !288
  %15 = load i32, i32* %arrayidx17, align 4, !dbg !288
  call void @printIntLine(i32 noundef %15), !dbg !291
  br label %for.inc18, !dbg !292

for.inc18:                                        ; preds = %for.body15
  %16 = load i32, i32* %i, align 4, !dbg !293
  %inc19 = add nsw i32 %16, 1, !dbg !293
  store i32 %inc19, i32* %i, align 4, !dbg !293
  br label %for.cond13, !dbg !294, !llvm.loop !295

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !297

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !298
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %17 = load i32*, i32** %buffer, align 8, !dbg !300
  %18 = bitcast i32* %17 to i8*, !dbg !300
  call void @free(i8* noundef %18), !dbg !301
  ret void, !dbg !302
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !303 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !304, metadata !DIExpression()), !dbg !305
  store i32 -1, i32* %data, align 4, !dbg !306
  store i32 7, i32* %data, align 4, !dbg !307
  call void @llvm.dbg.declare(metadata i32* %i, metadata !310, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !315, metadata !DIExpression()), !dbg !316
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !317
  %0 = bitcast i8* %call to i32*, !dbg !318
  store i32* %0, i32** %buffer, align 8, !dbg !316
  %1 = load i32*, i32** %buffer, align 8, !dbg !319
  %cmp = icmp eq i32* %1, null, !dbg !321
  br i1 %cmp, label %if.then, label %if.end, !dbg !322

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !323
  unreachable, !dbg !323

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !325
  br label %for.cond, !dbg !327

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !328
  %cmp1 = icmp slt i32 %2, 10, !dbg !330
  br i1 %cmp1, label %for.body, label %for.end, !dbg !331

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !332
  %4 = load i32, i32* %i, align 4, !dbg !334
  %idxprom = sext i32 %4 to i64, !dbg !332
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !332
  store i32 0, i32* %arrayidx, align 4, !dbg !335
  br label %for.inc, !dbg !336

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !337
  %inc = add nsw i32 %5, 1, !dbg !337
  store i32 %inc, i32* %i, align 4, !dbg !337
  br label %for.cond, !dbg !338, !llvm.loop !339

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !341
  %cmp2 = icmp sge i32 %6, 0, !dbg !343
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !344

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !345
  %8 = load i32, i32* %data, align 4, !dbg !347
  %idxprom4 = sext i32 %8 to i64, !dbg !345
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !345
  store i32 1, i32* %arrayidx5, align 4, !dbg !348
  store i32 0, i32* %i, align 4, !dbg !349
  br label %for.cond6, !dbg !351

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !352
  %cmp7 = icmp slt i32 %9, 10, !dbg !354
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !355

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !356
  %11 = load i32, i32* %i, align 4, !dbg !358
  %idxprom9 = sext i32 %11 to i64, !dbg !356
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !356
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !356
  call void @printIntLine(i32 noundef %12), !dbg !359
  br label %for.inc11, !dbg !360

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !361
  %inc12 = add nsw i32 %13, 1, !dbg !361
  store i32 %inc12, i32* %i, align 4, !dbg !361
  br label %for.cond6, !dbg !362, !llvm.loop !363

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !365

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !366
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !368
  %15 = bitcast i32* %14 to i8*, !dbg !368
  call void @free(i8* noundef %15), !dbg !369
  ret void, !dbg !370
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !371 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !372, metadata !DIExpression()), !dbg !373
  store i32 -1, i32* %data, align 4, !dbg !374
  store i32 7, i32* %data, align 4, !dbg !375
  call void @llvm.dbg.declare(metadata i32* %i, metadata !378, metadata !DIExpression()), !dbg !382
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !383, metadata !DIExpression()), !dbg !384
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !385
  %0 = bitcast i8* %call to i32*, !dbg !386
  store i32* %0, i32** %buffer, align 8, !dbg !384
  %1 = load i32*, i32** %buffer, align 8, !dbg !387
  %cmp = icmp eq i32* %1, null, !dbg !389
  br i1 %cmp, label %if.then, label %if.end, !dbg !390

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !391
  unreachable, !dbg !391

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !393
  br label %for.cond, !dbg !395

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !396
  %cmp1 = icmp slt i32 %2, 10, !dbg !398
  br i1 %cmp1, label %for.body, label %for.end, !dbg !399

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !400
  %4 = load i32, i32* %i, align 4, !dbg !402
  %idxprom = sext i32 %4 to i64, !dbg !400
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !400
  store i32 0, i32* %arrayidx, align 4, !dbg !403
  br label %for.inc, !dbg !404

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !405
  %inc = add nsw i32 %5, 1, !dbg !405
  store i32 %inc, i32* %i, align 4, !dbg !405
  br label %for.cond, !dbg !406, !llvm.loop !407

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !409
  %cmp2 = icmp sge i32 %6, 0, !dbg !411
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !412

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !413
  %8 = load i32, i32* %data, align 4, !dbg !415
  %idxprom4 = sext i32 %8 to i64, !dbg !413
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !413
  store i32 1, i32* %arrayidx5, align 4, !dbg !416
  store i32 0, i32* %i, align 4, !dbg !417
  br label %for.cond6, !dbg !419

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !420
  %cmp7 = icmp slt i32 %9, 10, !dbg !422
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !423

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !424
  %11 = load i32, i32* %i, align 4, !dbg !426
  %idxprom9 = sext i32 %11 to i64, !dbg !424
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !424
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !424
  call void @printIntLine(i32 noundef %12), !dbg !427
  br label %for.inc11, !dbg !428

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !429
  %inc12 = add nsw i32 %13, 1, !dbg !429
  store i32 %inc12, i32* %i, align 4, !dbg !429
  br label %for.cond6, !dbg !430, !llvm.loop !431

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !433

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !434
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !436
  %15 = bitcast i32* %14 to i8*, !dbg !436
  call void @free(i8* noundef %15), !dbg !437
  ret void, !dbg !438
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_04_bad", scope: !15, file: !15, line: 30, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 32, type: !5)
!20 = !DILocation(line: 32, column: 9, scope: !14)
!21 = !DILocation(line: 34, column: 10, scope: !14)
!22 = !DILocalVariable(name: "inputBuffer", scope: !23, file: !15, line: 38, type: !26)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 37, column: 9)
!24 = distinct !DILexicalBlock(scope: !25, file: !15, line: 36, column: 5)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 8)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 112, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 14)
!30 = !DILocation(line: 38, column: 18, scope: !23)
!31 = !DILocation(line: 40, column: 23, scope: !32)
!32 = distinct !DILexicalBlock(scope: !23, file: !15, line: 40, column: 17)
!33 = !DILocation(line: 40, column: 53, scope: !32)
!34 = !DILocation(line: 40, column: 17, scope: !32)
!35 = !DILocation(line: 40, column: 60, scope: !32)
!36 = !DILocation(line: 40, column: 17, scope: !23)
!37 = !DILocation(line: 43, column: 29, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !15, line: 41, column: 13)
!39 = !DILocation(line: 43, column: 24, scope: !38)
!40 = !DILocation(line: 43, column: 22, scope: !38)
!41 = !DILocation(line: 44, column: 13, scope: !38)
!42 = !DILocation(line: 47, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !32, file: !15, line: 46, column: 13)
!44 = !DILocalVariable(name: "i", scope: !45, file: !15, line: 54, type: !5)
!45 = distinct !DILexicalBlock(scope: !46, file: !15, line: 53, column: 9)
!46 = distinct !DILexicalBlock(scope: !47, file: !15, line: 52, column: 5)
!47 = distinct !DILexicalBlock(scope: !14, file: !15, line: 51, column: 8)
!48 = !DILocation(line: 54, column: 17, scope: !45)
!49 = !DILocalVariable(name: "buffer", scope: !45, file: !15, line: 55, type: !4)
!50 = !DILocation(line: 55, column: 19, scope: !45)
!51 = !DILocation(line: 55, column: 35, scope: !45)
!52 = !DILocation(line: 55, column: 28, scope: !45)
!53 = !DILocation(line: 56, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !45, file: !15, line: 56, column: 17)
!55 = !DILocation(line: 56, column: 24, scope: !54)
!56 = !DILocation(line: 56, column: 17, scope: !45)
!57 = !DILocation(line: 56, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 56, column: 33)
!59 = !DILocation(line: 58, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !45, file: !15, line: 58, column: 13)
!61 = !DILocation(line: 58, column: 18, scope: !60)
!62 = !DILocation(line: 58, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !15, line: 58, column: 13)
!64 = !DILocation(line: 58, column: 27, scope: !63)
!65 = !DILocation(line: 58, column: 13, scope: !60)
!66 = !DILocation(line: 60, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 59, column: 13)
!68 = !DILocation(line: 60, column: 24, scope: !67)
!69 = !DILocation(line: 60, column: 27, scope: !67)
!70 = !DILocation(line: 61, column: 13, scope: !67)
!71 = !DILocation(line: 58, column: 34, scope: !63)
!72 = !DILocation(line: 58, column: 13, scope: !63)
!73 = distinct !{!73, !65, !74, !75}
!74 = !DILocation(line: 61, column: 13, scope: !60)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 64, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !45, file: !15, line: 64, column: 17)
!78 = !DILocation(line: 64, column: 22, scope: !77)
!79 = !DILocation(line: 64, column: 17, scope: !45)
!80 = !DILocation(line: 66, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 65, column: 13)
!82 = !DILocation(line: 66, column: 24, scope: !81)
!83 = !DILocation(line: 66, column: 30, scope: !81)
!84 = !DILocation(line: 68, column: 23, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 68, column: 17)
!86 = !DILocation(line: 68, column: 21, scope: !85)
!87 = !DILocation(line: 68, column: 28, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !15, line: 68, column: 17)
!89 = !DILocation(line: 68, column: 30, scope: !88)
!90 = !DILocation(line: 68, column: 17, scope: !85)
!91 = !DILocation(line: 70, column: 34, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 69, column: 17)
!93 = !DILocation(line: 70, column: 41, scope: !92)
!94 = !DILocation(line: 70, column: 21, scope: !92)
!95 = !DILocation(line: 71, column: 17, scope: !92)
!96 = !DILocation(line: 68, column: 37, scope: !88)
!97 = !DILocation(line: 68, column: 17, scope: !88)
!98 = distinct !{!98, !90, !99, !75}
!99 = !DILocation(line: 71, column: 17, scope: !85)
!100 = !DILocation(line: 72, column: 13, scope: !81)
!101 = !DILocation(line: 75, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !77, file: !15, line: 74, column: 13)
!103 = !DILocation(line: 77, column: 18, scope: !45)
!104 = !DILocation(line: 77, column: 13, scope: !45)
!105 = !DILocation(line: 80, column: 1, scope: !14)
!106 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_04_good", scope: !15, file: !15, line: 286, type: !16, scopeLine: 287, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!107 = !DILocation(line: 288, column: 5, scope: !106)
!108 = !DILocation(line: 289, column: 5, scope: !106)
!109 = !DILocation(line: 290, column: 5, scope: !106)
!110 = !DILocation(line: 291, column: 5, scope: !106)
!111 = !DILocation(line: 292, column: 1, scope: !106)
!112 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 303, type: !113, scopeLine: 304, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!113 = !DISubroutineType(types: !114)
!114 = !{!5, !5, !115}
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!117 = !DILocalVariable(name: "argc", arg: 1, scope: !112, file: !15, line: 303, type: !5)
!118 = !DILocation(line: 303, column: 14, scope: !112)
!119 = !DILocalVariable(name: "argv", arg: 2, scope: !112, file: !15, line: 303, type: !115)
!120 = !DILocation(line: 303, column: 27, scope: !112)
!121 = !DILocation(line: 306, column: 22, scope: !112)
!122 = !DILocation(line: 306, column: 12, scope: !112)
!123 = !DILocation(line: 306, column: 5, scope: !112)
!124 = !DILocation(line: 308, column: 5, scope: !112)
!125 = !DILocation(line: 309, column: 5, scope: !112)
!126 = !DILocation(line: 310, column: 5, scope: !112)
!127 = !DILocation(line: 313, column: 5, scope: !112)
!128 = !DILocation(line: 314, column: 5, scope: !112)
!129 = !DILocation(line: 315, column: 5, scope: !112)
!130 = !DILocation(line: 317, column: 5, scope: !112)
!131 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 87, type: !16, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!132 = !DILocalVariable(name: "data", scope: !131, file: !15, line: 89, type: !5)
!133 = !DILocation(line: 89, column: 9, scope: !131)
!134 = !DILocation(line: 91, column: 10, scope: !131)
!135 = !DILocalVariable(name: "inputBuffer", scope: !136, file: !15, line: 95, type: !26)
!136 = distinct !DILexicalBlock(scope: !137, file: !15, line: 94, column: 9)
!137 = distinct !DILexicalBlock(scope: !138, file: !15, line: 93, column: 5)
!138 = distinct !DILexicalBlock(scope: !131, file: !15, line: 92, column: 8)
!139 = !DILocation(line: 95, column: 18, scope: !136)
!140 = !DILocation(line: 97, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !15, line: 97, column: 17)
!142 = !DILocation(line: 97, column: 53, scope: !141)
!143 = !DILocation(line: 97, column: 17, scope: !141)
!144 = !DILocation(line: 97, column: 60, scope: !141)
!145 = !DILocation(line: 97, column: 17, scope: !136)
!146 = !DILocation(line: 100, column: 29, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !15, line: 98, column: 13)
!148 = !DILocation(line: 100, column: 24, scope: !147)
!149 = !DILocation(line: 100, column: 22, scope: !147)
!150 = !DILocation(line: 101, column: 13, scope: !147)
!151 = !DILocation(line: 104, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !141, file: !15, line: 103, column: 13)
!153 = !DILocalVariable(name: "i", scope: !154, file: !15, line: 116, type: !5)
!154 = distinct !DILexicalBlock(scope: !155, file: !15, line: 115, column: 9)
!155 = distinct !DILexicalBlock(scope: !156, file: !15, line: 114, column: 5)
!156 = distinct !DILexicalBlock(scope: !131, file: !15, line: 108, column: 8)
!157 = !DILocation(line: 116, column: 17, scope: !154)
!158 = !DILocalVariable(name: "buffer", scope: !154, file: !15, line: 117, type: !4)
!159 = !DILocation(line: 117, column: 19, scope: !154)
!160 = !DILocation(line: 117, column: 35, scope: !154)
!161 = !DILocation(line: 117, column: 28, scope: !154)
!162 = !DILocation(line: 118, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !154, file: !15, line: 118, column: 17)
!164 = !DILocation(line: 118, column: 24, scope: !163)
!165 = !DILocation(line: 118, column: 17, scope: !154)
!166 = !DILocation(line: 118, column: 34, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !15, line: 118, column: 33)
!168 = !DILocation(line: 120, column: 20, scope: !169)
!169 = distinct !DILexicalBlock(scope: !154, file: !15, line: 120, column: 13)
!170 = !DILocation(line: 120, column: 18, scope: !169)
!171 = !DILocation(line: 120, column: 25, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !15, line: 120, column: 13)
!173 = !DILocation(line: 120, column: 27, scope: !172)
!174 = !DILocation(line: 120, column: 13, scope: !169)
!175 = !DILocation(line: 122, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !15, line: 121, column: 13)
!177 = !DILocation(line: 122, column: 24, scope: !176)
!178 = !DILocation(line: 122, column: 27, scope: !176)
!179 = !DILocation(line: 123, column: 13, scope: !176)
!180 = !DILocation(line: 120, column: 34, scope: !172)
!181 = !DILocation(line: 120, column: 13, scope: !172)
!182 = distinct !{!182, !174, !183, !75}
!183 = !DILocation(line: 123, column: 13, scope: !169)
!184 = !DILocation(line: 125, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !154, file: !15, line: 125, column: 17)
!186 = !DILocation(line: 125, column: 22, scope: !185)
!187 = !DILocation(line: 125, column: 27, scope: !185)
!188 = !DILocation(line: 125, column: 30, scope: !185)
!189 = !DILocation(line: 125, column: 35, scope: !185)
!190 = !DILocation(line: 125, column: 17, scope: !154)
!191 = !DILocation(line: 127, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !185, file: !15, line: 126, column: 13)
!193 = !DILocation(line: 127, column: 24, scope: !192)
!194 = !DILocation(line: 127, column: 30, scope: !192)
!195 = !DILocation(line: 129, column: 23, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !15, line: 129, column: 17)
!197 = !DILocation(line: 129, column: 21, scope: !196)
!198 = !DILocation(line: 129, column: 28, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !15, line: 129, column: 17)
!200 = !DILocation(line: 129, column: 30, scope: !199)
!201 = !DILocation(line: 129, column: 17, scope: !196)
!202 = !DILocation(line: 131, column: 34, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !15, line: 130, column: 17)
!204 = !DILocation(line: 131, column: 41, scope: !203)
!205 = !DILocation(line: 131, column: 21, scope: !203)
!206 = !DILocation(line: 132, column: 17, scope: !203)
!207 = !DILocation(line: 129, column: 37, scope: !199)
!208 = !DILocation(line: 129, column: 17, scope: !199)
!209 = distinct !{!209, !201, !210, !75}
!210 = !DILocation(line: 132, column: 17, scope: !196)
!211 = !DILocation(line: 133, column: 13, scope: !192)
!212 = !DILocation(line: 136, column: 17, scope: !213)
!213 = distinct !DILexicalBlock(scope: !185, file: !15, line: 135, column: 13)
!214 = !DILocation(line: 138, column: 18, scope: !154)
!215 = !DILocation(line: 138, column: 13, scope: !154)
!216 = !DILocation(line: 141, column: 1, scope: !131)
!217 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 144, type: !16, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!218 = !DILocalVariable(name: "data", scope: !217, file: !15, line: 146, type: !5)
!219 = !DILocation(line: 146, column: 9, scope: !217)
!220 = !DILocation(line: 148, column: 10, scope: !217)
!221 = !DILocalVariable(name: "inputBuffer", scope: !222, file: !15, line: 152, type: !26)
!222 = distinct !DILexicalBlock(scope: !223, file: !15, line: 151, column: 9)
!223 = distinct !DILexicalBlock(scope: !224, file: !15, line: 150, column: 5)
!224 = distinct !DILexicalBlock(scope: !217, file: !15, line: 149, column: 8)
!225 = !DILocation(line: 152, column: 18, scope: !222)
!226 = !DILocation(line: 154, column: 23, scope: !227)
!227 = distinct !DILexicalBlock(scope: !222, file: !15, line: 154, column: 17)
!228 = !DILocation(line: 154, column: 53, scope: !227)
!229 = !DILocation(line: 154, column: 17, scope: !227)
!230 = !DILocation(line: 154, column: 60, scope: !227)
!231 = !DILocation(line: 154, column: 17, scope: !222)
!232 = !DILocation(line: 157, column: 29, scope: !233)
!233 = distinct !DILexicalBlock(scope: !227, file: !15, line: 155, column: 13)
!234 = !DILocation(line: 157, column: 24, scope: !233)
!235 = !DILocation(line: 157, column: 22, scope: !233)
!236 = !DILocation(line: 158, column: 13, scope: !233)
!237 = !DILocation(line: 161, column: 17, scope: !238)
!238 = distinct !DILexicalBlock(scope: !227, file: !15, line: 160, column: 13)
!239 = !DILocalVariable(name: "i", scope: !240, file: !15, line: 168, type: !5)
!240 = distinct !DILexicalBlock(scope: !241, file: !15, line: 167, column: 9)
!241 = distinct !DILexicalBlock(scope: !242, file: !15, line: 166, column: 5)
!242 = distinct !DILexicalBlock(scope: !217, file: !15, line: 165, column: 8)
!243 = !DILocation(line: 168, column: 17, scope: !240)
!244 = !DILocalVariable(name: "buffer", scope: !240, file: !15, line: 169, type: !4)
!245 = !DILocation(line: 169, column: 19, scope: !240)
!246 = !DILocation(line: 169, column: 35, scope: !240)
!247 = !DILocation(line: 169, column: 28, scope: !240)
!248 = !DILocation(line: 170, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !240, file: !15, line: 170, column: 17)
!250 = !DILocation(line: 170, column: 24, scope: !249)
!251 = !DILocation(line: 170, column: 17, scope: !240)
!252 = !DILocation(line: 170, column: 34, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !15, line: 170, column: 33)
!254 = !DILocation(line: 172, column: 20, scope: !255)
!255 = distinct !DILexicalBlock(scope: !240, file: !15, line: 172, column: 13)
!256 = !DILocation(line: 172, column: 18, scope: !255)
!257 = !DILocation(line: 172, column: 25, scope: !258)
!258 = distinct !DILexicalBlock(scope: !255, file: !15, line: 172, column: 13)
!259 = !DILocation(line: 172, column: 27, scope: !258)
!260 = !DILocation(line: 172, column: 13, scope: !255)
!261 = !DILocation(line: 174, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !15, line: 173, column: 13)
!263 = !DILocation(line: 174, column: 24, scope: !262)
!264 = !DILocation(line: 174, column: 27, scope: !262)
!265 = !DILocation(line: 175, column: 13, scope: !262)
!266 = !DILocation(line: 172, column: 34, scope: !258)
!267 = !DILocation(line: 172, column: 13, scope: !258)
!268 = distinct !{!268, !260, !269, !75}
!269 = !DILocation(line: 175, column: 13, scope: !255)
!270 = !DILocation(line: 177, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !240, file: !15, line: 177, column: 17)
!272 = !DILocation(line: 177, column: 22, scope: !271)
!273 = !DILocation(line: 177, column: 27, scope: !271)
!274 = !DILocation(line: 177, column: 30, scope: !271)
!275 = !DILocation(line: 177, column: 35, scope: !271)
!276 = !DILocation(line: 177, column: 17, scope: !240)
!277 = !DILocation(line: 179, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !271, file: !15, line: 178, column: 13)
!279 = !DILocation(line: 179, column: 24, scope: !278)
!280 = !DILocation(line: 179, column: 30, scope: !278)
!281 = !DILocation(line: 181, column: 23, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !15, line: 181, column: 17)
!283 = !DILocation(line: 181, column: 21, scope: !282)
!284 = !DILocation(line: 181, column: 28, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !15, line: 181, column: 17)
!286 = !DILocation(line: 181, column: 30, scope: !285)
!287 = !DILocation(line: 181, column: 17, scope: !282)
!288 = !DILocation(line: 183, column: 34, scope: !289)
!289 = distinct !DILexicalBlock(scope: !285, file: !15, line: 182, column: 17)
!290 = !DILocation(line: 183, column: 41, scope: !289)
!291 = !DILocation(line: 183, column: 21, scope: !289)
!292 = !DILocation(line: 184, column: 17, scope: !289)
!293 = !DILocation(line: 181, column: 37, scope: !285)
!294 = !DILocation(line: 181, column: 17, scope: !285)
!295 = distinct !{!295, !287, !296, !75}
!296 = !DILocation(line: 184, column: 17, scope: !282)
!297 = !DILocation(line: 185, column: 13, scope: !278)
!298 = !DILocation(line: 188, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !271, file: !15, line: 187, column: 13)
!300 = !DILocation(line: 190, column: 18, scope: !240)
!301 = !DILocation(line: 190, column: 13, scope: !240)
!302 = !DILocation(line: 193, column: 1, scope: !217)
!303 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 196, type: !16, scopeLine: 197, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!304 = !DILocalVariable(name: "data", scope: !303, file: !15, line: 198, type: !5)
!305 = !DILocation(line: 198, column: 9, scope: !303)
!306 = !DILocation(line: 200, column: 10, scope: !303)
!307 = !DILocation(line: 210, column: 14, scope: !308)
!308 = distinct !DILexicalBlock(scope: !309, file: !15, line: 207, column: 5)
!309 = distinct !DILexicalBlock(scope: !303, file: !15, line: 201, column: 8)
!310 = !DILocalVariable(name: "i", scope: !311, file: !15, line: 215, type: !5)
!311 = distinct !DILexicalBlock(scope: !312, file: !15, line: 214, column: 9)
!312 = distinct !DILexicalBlock(scope: !313, file: !15, line: 213, column: 5)
!313 = distinct !DILexicalBlock(scope: !303, file: !15, line: 212, column: 8)
!314 = !DILocation(line: 215, column: 17, scope: !311)
!315 = !DILocalVariable(name: "buffer", scope: !311, file: !15, line: 216, type: !4)
!316 = !DILocation(line: 216, column: 19, scope: !311)
!317 = !DILocation(line: 216, column: 35, scope: !311)
!318 = !DILocation(line: 216, column: 28, scope: !311)
!319 = !DILocation(line: 217, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !311, file: !15, line: 217, column: 17)
!321 = !DILocation(line: 217, column: 24, scope: !320)
!322 = !DILocation(line: 217, column: 17, scope: !311)
!323 = !DILocation(line: 217, column: 34, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !15, line: 217, column: 33)
!325 = !DILocation(line: 219, column: 20, scope: !326)
!326 = distinct !DILexicalBlock(scope: !311, file: !15, line: 219, column: 13)
!327 = !DILocation(line: 219, column: 18, scope: !326)
!328 = !DILocation(line: 219, column: 25, scope: !329)
!329 = distinct !DILexicalBlock(scope: !326, file: !15, line: 219, column: 13)
!330 = !DILocation(line: 219, column: 27, scope: !329)
!331 = !DILocation(line: 219, column: 13, scope: !326)
!332 = !DILocation(line: 221, column: 17, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !15, line: 220, column: 13)
!334 = !DILocation(line: 221, column: 24, scope: !333)
!335 = !DILocation(line: 221, column: 27, scope: !333)
!336 = !DILocation(line: 222, column: 13, scope: !333)
!337 = !DILocation(line: 219, column: 34, scope: !329)
!338 = !DILocation(line: 219, column: 13, scope: !329)
!339 = distinct !{!339, !331, !340, !75}
!340 = !DILocation(line: 222, column: 13, scope: !326)
!341 = !DILocation(line: 225, column: 17, scope: !342)
!342 = distinct !DILexicalBlock(scope: !311, file: !15, line: 225, column: 17)
!343 = !DILocation(line: 225, column: 22, scope: !342)
!344 = !DILocation(line: 225, column: 17, scope: !311)
!345 = !DILocation(line: 227, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !15, line: 226, column: 13)
!347 = !DILocation(line: 227, column: 24, scope: !346)
!348 = !DILocation(line: 227, column: 30, scope: !346)
!349 = !DILocation(line: 229, column: 23, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !15, line: 229, column: 17)
!351 = !DILocation(line: 229, column: 21, scope: !350)
!352 = !DILocation(line: 229, column: 28, scope: !353)
!353 = distinct !DILexicalBlock(scope: !350, file: !15, line: 229, column: 17)
!354 = !DILocation(line: 229, column: 30, scope: !353)
!355 = !DILocation(line: 229, column: 17, scope: !350)
!356 = !DILocation(line: 231, column: 34, scope: !357)
!357 = distinct !DILexicalBlock(scope: !353, file: !15, line: 230, column: 17)
!358 = !DILocation(line: 231, column: 41, scope: !357)
!359 = !DILocation(line: 231, column: 21, scope: !357)
!360 = !DILocation(line: 232, column: 17, scope: !357)
!361 = !DILocation(line: 229, column: 37, scope: !353)
!362 = !DILocation(line: 229, column: 17, scope: !353)
!363 = distinct !{!363, !355, !364, !75}
!364 = !DILocation(line: 232, column: 17, scope: !350)
!365 = !DILocation(line: 233, column: 13, scope: !346)
!366 = !DILocation(line: 236, column: 17, scope: !367)
!367 = distinct !DILexicalBlock(scope: !342, file: !15, line: 235, column: 13)
!368 = !DILocation(line: 238, column: 18, scope: !311)
!369 = !DILocation(line: 238, column: 13, scope: !311)
!370 = !DILocation(line: 241, column: 1, scope: !303)
!371 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 244, type: !16, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!372 = !DILocalVariable(name: "data", scope: !371, file: !15, line: 246, type: !5)
!373 = !DILocation(line: 246, column: 9, scope: !371)
!374 = !DILocation(line: 248, column: 10, scope: !371)
!375 = !DILocation(line: 253, column: 14, scope: !376)
!376 = distinct !DILexicalBlock(scope: !377, file: !15, line: 250, column: 5)
!377 = distinct !DILexicalBlock(scope: !371, file: !15, line: 249, column: 8)
!378 = !DILocalVariable(name: "i", scope: !379, file: !15, line: 258, type: !5)
!379 = distinct !DILexicalBlock(scope: !380, file: !15, line: 257, column: 9)
!380 = distinct !DILexicalBlock(scope: !381, file: !15, line: 256, column: 5)
!381 = distinct !DILexicalBlock(scope: !371, file: !15, line: 255, column: 8)
!382 = !DILocation(line: 258, column: 17, scope: !379)
!383 = !DILocalVariable(name: "buffer", scope: !379, file: !15, line: 259, type: !4)
!384 = !DILocation(line: 259, column: 19, scope: !379)
!385 = !DILocation(line: 259, column: 35, scope: !379)
!386 = !DILocation(line: 259, column: 28, scope: !379)
!387 = !DILocation(line: 260, column: 17, scope: !388)
!388 = distinct !DILexicalBlock(scope: !379, file: !15, line: 260, column: 17)
!389 = !DILocation(line: 260, column: 24, scope: !388)
!390 = !DILocation(line: 260, column: 17, scope: !379)
!391 = !DILocation(line: 260, column: 34, scope: !392)
!392 = distinct !DILexicalBlock(scope: !388, file: !15, line: 260, column: 33)
!393 = !DILocation(line: 262, column: 20, scope: !394)
!394 = distinct !DILexicalBlock(scope: !379, file: !15, line: 262, column: 13)
!395 = !DILocation(line: 262, column: 18, scope: !394)
!396 = !DILocation(line: 262, column: 25, scope: !397)
!397 = distinct !DILexicalBlock(scope: !394, file: !15, line: 262, column: 13)
!398 = !DILocation(line: 262, column: 27, scope: !397)
!399 = !DILocation(line: 262, column: 13, scope: !394)
!400 = !DILocation(line: 264, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !397, file: !15, line: 263, column: 13)
!402 = !DILocation(line: 264, column: 24, scope: !401)
!403 = !DILocation(line: 264, column: 27, scope: !401)
!404 = !DILocation(line: 265, column: 13, scope: !401)
!405 = !DILocation(line: 262, column: 34, scope: !397)
!406 = !DILocation(line: 262, column: 13, scope: !397)
!407 = distinct !{!407, !399, !408, !75}
!408 = !DILocation(line: 265, column: 13, scope: !394)
!409 = !DILocation(line: 268, column: 17, scope: !410)
!410 = distinct !DILexicalBlock(scope: !379, file: !15, line: 268, column: 17)
!411 = !DILocation(line: 268, column: 22, scope: !410)
!412 = !DILocation(line: 268, column: 17, scope: !379)
!413 = !DILocation(line: 270, column: 17, scope: !414)
!414 = distinct !DILexicalBlock(scope: !410, file: !15, line: 269, column: 13)
!415 = !DILocation(line: 270, column: 24, scope: !414)
!416 = !DILocation(line: 270, column: 30, scope: !414)
!417 = !DILocation(line: 272, column: 23, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !15, line: 272, column: 17)
!419 = !DILocation(line: 272, column: 21, scope: !418)
!420 = !DILocation(line: 272, column: 28, scope: !421)
!421 = distinct !DILexicalBlock(scope: !418, file: !15, line: 272, column: 17)
!422 = !DILocation(line: 272, column: 30, scope: !421)
!423 = !DILocation(line: 272, column: 17, scope: !418)
!424 = !DILocation(line: 274, column: 34, scope: !425)
!425 = distinct !DILexicalBlock(scope: !421, file: !15, line: 273, column: 17)
!426 = !DILocation(line: 274, column: 41, scope: !425)
!427 = !DILocation(line: 274, column: 21, scope: !425)
!428 = !DILocation(line: 275, column: 17, scope: !425)
!429 = !DILocation(line: 272, column: 37, scope: !421)
!430 = !DILocation(line: 272, column: 17, scope: !421)
!431 = distinct !{!431, !423, !432, !75}
!432 = !DILocation(line: 275, column: 17, scope: !418)
!433 = !DILocation(line: 276, column: 13, scope: !414)
!434 = !DILocation(line: 279, column: 17, scope: !435)
!435 = distinct !DILexicalBlock(scope: !410, file: !15, line: 278, column: 13)
!436 = !DILocation(line: 281, column: 18, scope: !379)
!437 = !DILocation(line: 281, column: 13, scope: !379)
!438 = !DILocation(line: 284, column: 1, scope: !371)
