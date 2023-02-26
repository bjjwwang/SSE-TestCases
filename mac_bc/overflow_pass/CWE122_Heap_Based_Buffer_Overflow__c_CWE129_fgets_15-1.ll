; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !22, metadata !DIExpression()), !dbg !28
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !28
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !29
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !31
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !32
  %cmp = icmp ne i8* %call, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !37
  store i32 %call2, i32* %data, align 4, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !40
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !42, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !45, metadata !DIExpression()), !dbg !46
  %call3 = call i8* @malloc(i64 noundef 40) #6, !dbg !47
  %2 = bitcast i8* %call3 to i32*, !dbg !48
  store i32* %2, i32** %buffer, align 8, !dbg !46
  %3 = load i32*, i32** %buffer, align 8, !dbg !49
  %cmp4 = icmp eq i32* %3, null, !dbg !51
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !52

if.then5:                                         ; preds = %if.end
  call void @exit(i32 noundef -1) #7, !dbg !53
  unreachable, !dbg !53

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !58
  %cmp7 = icmp slt i32 %4, 10, !dbg !60
  br i1 %cmp7, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !62
  %6 = load i32, i32* %i, align 4, !dbg !64
  %idxprom = sext i32 %6 to i64, !dbg !62
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !62
  store i32 0, i32* %arrayidx, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !67
  %inc = add nsw i32 %7, 1, !dbg !67
  store i32 %inc, i32* %i, align 4, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !72
  %cmp8 = icmp sge i32 %8, 0, !dbg !74
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !75

if.then9:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !76
  %10 = load i32, i32* %data, align 4, !dbg !78
  %idxprom10 = sext i32 %10 to i64, !dbg !76
  %arrayidx11 = getelementptr inbounds i32, i32* %9, i64 %idxprom10, !dbg !76
  store i32 1, i32* %arrayidx11, align 4, !dbg !79
  store i32 0, i32* %i, align 4, !dbg !80
  br label %for.cond12, !dbg !82

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %11 = load i32, i32* %i, align 4, !dbg !83
  %cmp13 = icmp slt i32 %11, 10, !dbg !85
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !86

for.body14:                                       ; preds = %for.cond12
  %12 = load i32*, i32** %buffer, align 8, !dbg !87
  %13 = load i32, i32* %i, align 4, !dbg !89
  %idxprom15 = sext i32 %13 to i64, !dbg !87
  %arrayidx16 = getelementptr inbounds i32, i32* %12, i64 %idxprom15, !dbg !87
  %14 = load i32, i32* %arrayidx16, align 4, !dbg !87
  call void @printIntLine(i32 noundef %14), !dbg !90
  br label %for.inc17, !dbg !91

for.inc17:                                        ; preds = %for.body14
  %15 = load i32, i32* %i, align 4, !dbg !92
  %inc18 = add nsw i32 %15, 1, !dbg !92
  store i32 %inc18, i32* %i, align 4, !dbg !92
  br label %for.cond12, !dbg !93, !llvm.loop !94

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !96

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %16 = load i32*, i32** %buffer, align 8, !dbg !99
  %17 = bitcast i32* %16 to i8*, !dbg !99
  call void @free(i8* noundef %17), !dbg !100
  ret void, !dbg !101
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_good() #0 !dbg !102 {
entry:
  call void @goodB2G1(), !dbg !103
  call void @goodB2G2(), !dbg !104
  call void @goodG2B1(), !dbg !105
  call void @goodG2B2(), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !108 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !113, metadata !DIExpression()), !dbg !114
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !115, metadata !DIExpression()), !dbg !116
  %call = call i64 @time(i64* noundef null), !dbg !117
  %conv = trunc i64 %call to i32, !dbg !118
  call void @srand(i32 noundef %conv), !dbg !119
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_good(), !dbg !121
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !122
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !123
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_bad(), !dbg !124
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !125
  ret i32 0, !dbg !126
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !127 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !128, metadata !DIExpression()), !dbg !129
  store i32 -1, i32* %data, align 4, !dbg !130
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !131, metadata !DIExpression()), !dbg !133
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !133
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !134
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !136
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !137
  %cmp = icmp ne i8* %call, null, !dbg !138
  br i1 %cmp, label %if.then, label %if.else, !dbg !139

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !140
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !142
  store i32 %call2, i32* %data, align 4, !dbg !143
  br label %if.end, !dbg !144

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !145
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !150, metadata !DIExpression()), !dbg !151
  %call3 = call i8* @malloc(i64 noundef 40) #6, !dbg !152
  %2 = bitcast i8* %call3 to i32*, !dbg !153
  store i32* %2, i32** %buffer, align 8, !dbg !151
  %3 = load i32*, i32** %buffer, align 8, !dbg !154
  %cmp4 = icmp eq i32* %3, null, !dbg !156
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !157

if.then5:                                         ; preds = %if.end
  call void @exit(i32 noundef -1) #7, !dbg !158
  unreachable, !dbg !158

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !163
  %cmp7 = icmp slt i32 %4, 10, !dbg !165
  br i1 %cmp7, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !167
  %6 = load i32, i32* %i, align 4, !dbg !169
  %idxprom = sext i32 %6 to i64, !dbg !167
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !167
  store i32 0, i32* %arrayidx, align 4, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !172
  %inc = add nsw i32 %7, 1, !dbg !172
  store i32 %inc, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !176
  %cmp8 = icmp sge i32 %8, 0, !dbg !178
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !179

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !180
  %cmp9 = icmp slt i32 %9, 10, !dbg !181
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !182

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !183
  %11 = load i32, i32* %data, align 4, !dbg !185
  %idxprom11 = sext i32 %11 to i64, !dbg !183
  %arrayidx12 = getelementptr inbounds i32, i32* %10, i64 %idxprom11, !dbg !183
  store i32 1, i32* %arrayidx12, align 4, !dbg !186
  store i32 0, i32* %i, align 4, !dbg !187
  br label %for.cond13, !dbg !189

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %12 = load i32, i32* %i, align 4, !dbg !190
  %cmp14 = icmp slt i32 %12, 10, !dbg !192
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !193

for.body15:                                       ; preds = %for.cond13
  %13 = load i32*, i32** %buffer, align 8, !dbg !194
  %14 = load i32, i32* %i, align 4, !dbg !196
  %idxprom16 = sext i32 %14 to i64, !dbg !194
  %arrayidx17 = getelementptr inbounds i32, i32* %13, i64 %idxprom16, !dbg !194
  %15 = load i32, i32* %arrayidx17, align 4, !dbg !194
  call void @printIntLine(i32 noundef %15), !dbg !197
  br label %for.inc18, !dbg !198

for.inc18:                                        ; preds = %for.body15
  %16 = load i32, i32* %i, align 4, !dbg !199
  %inc19 = add nsw i32 %16, 1, !dbg !199
  store i32 %inc19, i32* %i, align 4, !dbg !199
  br label %for.cond13, !dbg !200, !llvm.loop !201

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !203

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !204
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %17 = load i32*, i32** %buffer, align 8, !dbg !206
  %18 = bitcast i32* %17 to i8*, !dbg !206
  call void @free(i8* noundef %18), !dbg !207
  ret void, !dbg !208
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !209 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !210, metadata !DIExpression()), !dbg !211
  store i32 -1, i32* %data, align 4, !dbg !212
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !213, metadata !DIExpression()), !dbg !215
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !215
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !215
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !216
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !218
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !219
  %cmp = icmp ne i8* %call, null, !dbg !220
  br i1 %cmp, label %if.then, label %if.else, !dbg !221

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !222
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !224
  store i32 %call2, i32* %data, align 4, !dbg !225
  br label %if.end, !dbg !226

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !227
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !229, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !232, metadata !DIExpression()), !dbg !233
  %call3 = call i8* @malloc(i64 noundef 40) #6, !dbg !234
  %2 = bitcast i8* %call3 to i32*, !dbg !235
  store i32* %2, i32** %buffer, align 8, !dbg !233
  %3 = load i32*, i32** %buffer, align 8, !dbg !236
  %cmp4 = icmp eq i32* %3, null, !dbg !238
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !239

if.then5:                                         ; preds = %if.end
  call void @exit(i32 noundef -1) #7, !dbg !240
  unreachable, !dbg !240

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !242
  br label %for.cond, !dbg !244

for.cond:                                         ; preds = %for.inc, %if.end6
  %4 = load i32, i32* %i, align 4, !dbg !245
  %cmp7 = icmp slt i32 %4, 10, !dbg !247
  br i1 %cmp7, label %for.body, label %for.end, !dbg !248

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !249
  %6 = load i32, i32* %i, align 4, !dbg !251
  %idxprom = sext i32 %6 to i64, !dbg !249
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !249
  store i32 0, i32* %arrayidx, align 4, !dbg !252
  br label %for.inc, !dbg !253

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !254
  %inc = add nsw i32 %7, 1, !dbg !254
  store i32 %inc, i32* %i, align 4, !dbg !254
  br label %for.cond, !dbg !255, !llvm.loop !256

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !258
  %cmp8 = icmp sge i32 %8, 0, !dbg !260
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !261

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !262
  %cmp9 = icmp slt i32 %9, 10, !dbg !263
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !264

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !265
  %11 = load i32, i32* %data, align 4, !dbg !267
  %idxprom11 = sext i32 %11 to i64, !dbg !265
  %arrayidx12 = getelementptr inbounds i32, i32* %10, i64 %idxprom11, !dbg !265
  store i32 1, i32* %arrayidx12, align 4, !dbg !268
  store i32 0, i32* %i, align 4, !dbg !269
  br label %for.cond13, !dbg !271

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %12 = load i32, i32* %i, align 4, !dbg !272
  %cmp14 = icmp slt i32 %12, 10, !dbg !274
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !275

for.body15:                                       ; preds = %for.cond13
  %13 = load i32*, i32** %buffer, align 8, !dbg !276
  %14 = load i32, i32* %i, align 4, !dbg !278
  %idxprom16 = sext i32 %14 to i64, !dbg !276
  %arrayidx17 = getelementptr inbounds i32, i32* %13, i64 %idxprom16, !dbg !276
  %15 = load i32, i32* %arrayidx17, align 4, !dbg !276
  call void @printIntLine(i32 noundef %15), !dbg !279
  br label %for.inc18, !dbg !280

for.inc18:                                        ; preds = %for.body15
  %16 = load i32, i32* %i, align 4, !dbg !281
  %inc19 = add nsw i32 %16, 1, !dbg !281
  store i32 %inc19, i32* %i, align 4, !dbg !281
  br label %for.cond13, !dbg !282, !llvm.loop !283

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !285

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !286
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %17 = load i32*, i32** %buffer, align 8, !dbg !288
  %18 = bitcast i32* %17 to i8*, !dbg !288
  call void @free(i8* noundef %18), !dbg !289
  ret void, !dbg !290
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !291 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !292, metadata !DIExpression()), !dbg !293
  store i32 -1, i32* %data, align 4, !dbg !294
  store i32 7, i32* %data, align 4, !dbg !295
  call void @llvm.dbg.declare(metadata i32* %i, metadata !296, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !299, metadata !DIExpression()), !dbg !300
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !301
  %0 = bitcast i8* %call to i32*, !dbg !302
  store i32* %0, i32** %buffer, align 8, !dbg !300
  %1 = load i32*, i32** %buffer, align 8, !dbg !303
  %cmp = icmp eq i32* %1, null, !dbg !305
  br i1 %cmp, label %if.then, label %if.end, !dbg !306

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !307
  unreachable, !dbg !307

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !309
  br label %for.cond, !dbg !311

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !312
  %cmp1 = icmp slt i32 %2, 10, !dbg !314
  br i1 %cmp1, label %for.body, label %for.end, !dbg !315

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !316
  %4 = load i32, i32* %i, align 4, !dbg !318
  %idxprom = sext i32 %4 to i64, !dbg !316
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !316
  store i32 0, i32* %arrayidx, align 4, !dbg !319
  br label %for.inc, !dbg !320

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !321
  %inc = add nsw i32 %5, 1, !dbg !321
  store i32 %inc, i32* %i, align 4, !dbg !321
  br label %for.cond, !dbg !322, !llvm.loop !323

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !325
  %cmp2 = icmp sge i32 %6, 0, !dbg !327
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !328

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !329
  %8 = load i32, i32* %data, align 4, !dbg !331
  %idxprom4 = sext i32 %8 to i64, !dbg !329
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !329
  store i32 1, i32* %arrayidx5, align 4, !dbg !332
  store i32 0, i32* %i, align 4, !dbg !333
  br label %for.cond6, !dbg !335

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !336
  %cmp7 = icmp slt i32 %9, 10, !dbg !338
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !339

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !340
  %11 = load i32, i32* %i, align 4, !dbg !342
  %idxprom9 = sext i32 %11 to i64, !dbg !340
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !340
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !340
  call void @printIntLine(i32 noundef %12), !dbg !343
  br label %for.inc11, !dbg !344

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !345
  %inc12 = add nsw i32 %13, 1, !dbg !345
  store i32 %inc12, i32* %i, align 4, !dbg !345
  br label %for.cond6, !dbg !346, !llvm.loop !347

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !349

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !350
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !352
  %15 = bitcast i32* %14 to i8*, !dbg !352
  call void @free(i8* noundef %15), !dbg !353
  ret void, !dbg !354
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !355 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !356, metadata !DIExpression()), !dbg !357
  store i32 -1, i32* %data, align 4, !dbg !358
  store i32 7, i32* %data, align 4, !dbg !359
  call void @llvm.dbg.declare(metadata i32* %i, metadata !360, metadata !DIExpression()), !dbg !362
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !363, metadata !DIExpression()), !dbg !364
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !365
  %0 = bitcast i8* %call to i32*, !dbg !366
  store i32* %0, i32** %buffer, align 8, !dbg !364
  %1 = load i32*, i32** %buffer, align 8, !dbg !367
  %cmp = icmp eq i32* %1, null, !dbg !369
  br i1 %cmp, label %if.then, label %if.end, !dbg !370

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !371
  unreachable, !dbg !371

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !373
  br label %for.cond, !dbg !375

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !376
  %cmp1 = icmp slt i32 %2, 10, !dbg !378
  br i1 %cmp1, label %for.body, label %for.end, !dbg !379

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !380
  %4 = load i32, i32* %i, align 4, !dbg !382
  %idxprom = sext i32 %4 to i64, !dbg !380
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !380
  store i32 0, i32* %arrayidx, align 4, !dbg !383
  br label %for.inc, !dbg !384

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !385
  %inc = add nsw i32 %5, 1, !dbg !385
  store i32 %inc, i32* %i, align 4, !dbg !385
  br label %for.cond, !dbg !386, !llvm.loop !387

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !389
  %cmp2 = icmp sge i32 %6, 0, !dbg !391
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !392

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !393
  %8 = load i32, i32* %data, align 4, !dbg !395
  %idxprom4 = sext i32 %8 to i64, !dbg !393
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !393
  store i32 1, i32* %arrayidx5, align 4, !dbg !396
  store i32 0, i32* %i, align 4, !dbg !397
  br label %for.cond6, !dbg !399

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !400
  %cmp7 = icmp slt i32 %9, 10, !dbg !402
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !403

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !404
  %11 = load i32, i32* %i, align 4, !dbg !406
  %idxprom9 = sext i32 %11 to i64, !dbg !404
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !404
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !404
  call void @printIntLine(i32 noundef %12), !dbg !407
  br label %for.inc11, !dbg !408

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !409
  %inc12 = add nsw i32 %13, 1, !dbg !409
  store i32 %inc12, i32* %i, align 4, !dbg !409
  br label %for.cond6, !dbg !410, !llvm.loop !411

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !413

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !414
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !416
  %15 = bitcast i32* %14 to i8*, !dbg !416
  call void @free(i8* noundef %15), !dbg !417
  ret void, !dbg !418
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !5)
!20 = !DILocation(line: 26, column: 9, scope: !14)
!21 = !DILocation(line: 28, column: 10, scope: !14)
!22 = !DILocalVariable(name: "inputBuffer", scope: !23, file: !15, line: 33, type: !24)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 112, elements: !26)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !{!27}
!27 = !DISubrange(count: 14)
!28 = !DILocation(line: 33, column: 14, scope: !23)
!29 = !DILocation(line: 35, column: 19, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !15, line: 35, column: 13)
!31 = !DILocation(line: 35, column: 49, scope: !30)
!32 = !DILocation(line: 35, column: 13, scope: !30)
!33 = !DILocation(line: 35, column: 56, scope: !30)
!34 = !DILocation(line: 35, column: 13, scope: !23)
!35 = !DILocation(line: 38, column: 25, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !15, line: 36, column: 9)
!37 = !DILocation(line: 38, column: 20, scope: !36)
!38 = !DILocation(line: 38, column: 18, scope: !36)
!39 = !DILocation(line: 39, column: 9, scope: !36)
!40 = !DILocation(line: 42, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !30, file: !15, line: 41, column: 9)
!42 = !DILocalVariable(name: "i", scope: !43, file: !15, line: 55, type: !5)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 54, column: 5)
!44 = !DILocation(line: 55, column: 13, scope: !43)
!45 = !DILocalVariable(name: "buffer", scope: !43, file: !15, line: 56, type: !4)
!46 = !DILocation(line: 56, column: 15, scope: !43)
!47 = !DILocation(line: 56, column: 31, scope: !43)
!48 = !DILocation(line: 56, column: 24, scope: !43)
!49 = !DILocation(line: 57, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !43, file: !15, line: 57, column: 13)
!51 = !DILocation(line: 57, column: 20, scope: !50)
!52 = !DILocation(line: 57, column: 13, scope: !43)
!53 = !DILocation(line: 57, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 57, column: 29)
!55 = !DILocation(line: 59, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !43, file: !15, line: 59, column: 9)
!57 = !DILocation(line: 59, column: 14, scope: !56)
!58 = !DILocation(line: 59, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !15, line: 59, column: 9)
!60 = !DILocation(line: 59, column: 23, scope: !59)
!61 = !DILocation(line: 59, column: 9, scope: !56)
!62 = !DILocation(line: 61, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !15, line: 60, column: 9)
!64 = !DILocation(line: 61, column: 20, scope: !63)
!65 = !DILocation(line: 61, column: 23, scope: !63)
!66 = !DILocation(line: 62, column: 9, scope: !63)
!67 = !DILocation(line: 59, column: 30, scope: !59)
!68 = !DILocation(line: 59, column: 9, scope: !59)
!69 = distinct !{!69, !61, !70, !71}
!70 = !DILocation(line: 62, column: 9, scope: !56)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 65, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !43, file: !15, line: 65, column: 13)
!74 = !DILocation(line: 65, column: 18, scope: !73)
!75 = !DILocation(line: 65, column: 13, scope: !43)
!76 = !DILocation(line: 67, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !15, line: 66, column: 9)
!78 = !DILocation(line: 67, column: 20, scope: !77)
!79 = !DILocation(line: 67, column: 26, scope: !77)
!80 = !DILocation(line: 69, column: 19, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 69, column: 13)
!82 = !DILocation(line: 69, column: 17, scope: !81)
!83 = !DILocation(line: 69, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !15, line: 69, column: 13)
!85 = !DILocation(line: 69, column: 26, scope: !84)
!86 = !DILocation(line: 69, column: 13, scope: !81)
!87 = !DILocation(line: 71, column: 30, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 70, column: 13)
!89 = !DILocation(line: 71, column: 37, scope: !88)
!90 = !DILocation(line: 71, column: 17, scope: !88)
!91 = !DILocation(line: 72, column: 13, scope: !88)
!92 = !DILocation(line: 69, column: 33, scope: !84)
!93 = !DILocation(line: 69, column: 13, scope: !84)
!94 = distinct !{!94, !86, !95, !71}
!95 = !DILocation(line: 72, column: 13, scope: !81)
!96 = !DILocation(line: 73, column: 9, scope: !77)
!97 = !DILocation(line: 76, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !73, file: !15, line: 75, column: 9)
!99 = !DILocation(line: 78, column: 14, scope: !43)
!100 = !DILocation(line: 78, column: 9, scope: !43)
!101 = !DILocation(line: 86, column: 1, scope: !14)
!102 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_15_good", scope: !15, file: !15, line: 330, type: !16, scopeLine: 331, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!103 = !DILocation(line: 332, column: 5, scope: !102)
!104 = !DILocation(line: 333, column: 5, scope: !102)
!105 = !DILocation(line: 334, column: 5, scope: !102)
!106 = !DILocation(line: 335, column: 5, scope: !102)
!107 = !DILocation(line: 336, column: 1, scope: !102)
!108 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 347, type: !109, scopeLine: 348, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!109 = !DISubroutineType(types: !110)
!110 = !{!5, !5, !111}
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!113 = !DILocalVariable(name: "argc", arg: 1, scope: !108, file: !15, line: 347, type: !5)
!114 = !DILocation(line: 347, column: 14, scope: !108)
!115 = !DILocalVariable(name: "argv", arg: 2, scope: !108, file: !15, line: 347, type: !111)
!116 = !DILocation(line: 347, column: 27, scope: !108)
!117 = !DILocation(line: 350, column: 22, scope: !108)
!118 = !DILocation(line: 350, column: 12, scope: !108)
!119 = !DILocation(line: 350, column: 5, scope: !108)
!120 = !DILocation(line: 352, column: 5, scope: !108)
!121 = !DILocation(line: 353, column: 5, scope: !108)
!122 = !DILocation(line: 354, column: 5, scope: !108)
!123 = !DILocation(line: 357, column: 5, scope: !108)
!124 = !DILocation(line: 358, column: 5, scope: !108)
!125 = !DILocation(line: 359, column: 5, scope: !108)
!126 = !DILocation(line: 361, column: 5, scope: !108)
!127 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 93, type: !16, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!128 = !DILocalVariable(name: "data", scope: !127, file: !15, line: 95, type: !5)
!129 = !DILocation(line: 95, column: 9, scope: !127)
!130 = !DILocation(line: 97, column: 10, scope: !127)
!131 = !DILocalVariable(name: "inputBuffer", scope: !132, file: !15, line: 102, type: !24)
!132 = distinct !DILexicalBlock(scope: !127, file: !15, line: 101, column: 5)
!133 = !DILocation(line: 102, column: 14, scope: !132)
!134 = !DILocation(line: 104, column: 19, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !15, line: 104, column: 13)
!136 = !DILocation(line: 104, column: 49, scope: !135)
!137 = !DILocation(line: 104, column: 13, scope: !135)
!138 = !DILocation(line: 104, column: 56, scope: !135)
!139 = !DILocation(line: 104, column: 13, scope: !132)
!140 = !DILocation(line: 107, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !15, line: 105, column: 9)
!142 = !DILocation(line: 107, column: 20, scope: !141)
!143 = !DILocation(line: 107, column: 18, scope: !141)
!144 = !DILocation(line: 108, column: 9, scope: !141)
!145 = !DILocation(line: 111, column: 13, scope: !146)
!146 = distinct !DILexicalBlock(scope: !135, file: !15, line: 110, column: 9)
!147 = !DILocalVariable(name: "i", scope: !148, file: !15, line: 128, type: !5)
!148 = distinct !DILexicalBlock(scope: !127, file: !15, line: 127, column: 5)
!149 = !DILocation(line: 128, column: 13, scope: !148)
!150 = !DILocalVariable(name: "buffer", scope: !148, file: !15, line: 129, type: !4)
!151 = !DILocation(line: 129, column: 15, scope: !148)
!152 = !DILocation(line: 129, column: 31, scope: !148)
!153 = !DILocation(line: 129, column: 24, scope: !148)
!154 = !DILocation(line: 130, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !148, file: !15, line: 130, column: 13)
!156 = !DILocation(line: 130, column: 20, scope: !155)
!157 = !DILocation(line: 130, column: 13, scope: !148)
!158 = !DILocation(line: 130, column: 30, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !15, line: 130, column: 29)
!160 = !DILocation(line: 132, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !148, file: !15, line: 132, column: 9)
!162 = !DILocation(line: 132, column: 14, scope: !161)
!163 = !DILocation(line: 132, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !15, line: 132, column: 9)
!165 = !DILocation(line: 132, column: 23, scope: !164)
!166 = !DILocation(line: 132, column: 9, scope: !161)
!167 = !DILocation(line: 134, column: 13, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !15, line: 133, column: 9)
!169 = !DILocation(line: 134, column: 20, scope: !168)
!170 = !DILocation(line: 134, column: 23, scope: !168)
!171 = !DILocation(line: 135, column: 9, scope: !168)
!172 = !DILocation(line: 132, column: 30, scope: !164)
!173 = !DILocation(line: 132, column: 9, scope: !164)
!174 = distinct !{!174, !166, !175, !71}
!175 = !DILocation(line: 135, column: 9, scope: !161)
!176 = !DILocation(line: 137, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !148, file: !15, line: 137, column: 13)
!178 = !DILocation(line: 137, column: 18, scope: !177)
!179 = !DILocation(line: 137, column: 23, scope: !177)
!180 = !DILocation(line: 137, column: 26, scope: !177)
!181 = !DILocation(line: 137, column: 31, scope: !177)
!182 = !DILocation(line: 137, column: 13, scope: !148)
!183 = !DILocation(line: 139, column: 13, scope: !184)
!184 = distinct !DILexicalBlock(scope: !177, file: !15, line: 138, column: 9)
!185 = !DILocation(line: 139, column: 20, scope: !184)
!186 = !DILocation(line: 139, column: 26, scope: !184)
!187 = !DILocation(line: 141, column: 19, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !15, line: 141, column: 13)
!189 = !DILocation(line: 141, column: 17, scope: !188)
!190 = !DILocation(line: 141, column: 24, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !15, line: 141, column: 13)
!192 = !DILocation(line: 141, column: 26, scope: !191)
!193 = !DILocation(line: 141, column: 13, scope: !188)
!194 = !DILocation(line: 143, column: 30, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !15, line: 142, column: 13)
!196 = !DILocation(line: 143, column: 37, scope: !195)
!197 = !DILocation(line: 143, column: 17, scope: !195)
!198 = !DILocation(line: 144, column: 13, scope: !195)
!199 = !DILocation(line: 141, column: 33, scope: !191)
!200 = !DILocation(line: 141, column: 13, scope: !191)
!201 = distinct !{!201, !193, !202, !71}
!202 = !DILocation(line: 144, column: 13, scope: !188)
!203 = !DILocation(line: 145, column: 9, scope: !184)
!204 = !DILocation(line: 148, column: 13, scope: !205)
!205 = distinct !DILexicalBlock(scope: !177, file: !15, line: 147, column: 9)
!206 = !DILocation(line: 150, column: 14, scope: !148)
!207 = !DILocation(line: 150, column: 9, scope: !148)
!208 = !DILocation(line: 154, column: 1, scope: !127)
!209 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 157, type: !16, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!210 = !DILocalVariable(name: "data", scope: !209, file: !15, line: 159, type: !5)
!211 = !DILocation(line: 159, column: 9, scope: !209)
!212 = !DILocation(line: 161, column: 10, scope: !209)
!213 = !DILocalVariable(name: "inputBuffer", scope: !214, file: !15, line: 166, type: !24)
!214 = distinct !DILexicalBlock(scope: !209, file: !15, line: 165, column: 5)
!215 = !DILocation(line: 166, column: 14, scope: !214)
!216 = !DILocation(line: 168, column: 19, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !15, line: 168, column: 13)
!218 = !DILocation(line: 168, column: 49, scope: !217)
!219 = !DILocation(line: 168, column: 13, scope: !217)
!220 = !DILocation(line: 168, column: 56, scope: !217)
!221 = !DILocation(line: 168, column: 13, scope: !214)
!222 = !DILocation(line: 171, column: 25, scope: !223)
!223 = distinct !DILexicalBlock(scope: !217, file: !15, line: 169, column: 9)
!224 = !DILocation(line: 171, column: 20, scope: !223)
!225 = !DILocation(line: 171, column: 18, scope: !223)
!226 = !DILocation(line: 172, column: 9, scope: !223)
!227 = !DILocation(line: 175, column: 13, scope: !228)
!228 = distinct !DILexicalBlock(scope: !217, file: !15, line: 174, column: 9)
!229 = !DILocalVariable(name: "i", scope: !230, file: !15, line: 188, type: !5)
!230 = distinct !DILexicalBlock(scope: !209, file: !15, line: 187, column: 5)
!231 = !DILocation(line: 188, column: 13, scope: !230)
!232 = !DILocalVariable(name: "buffer", scope: !230, file: !15, line: 189, type: !4)
!233 = !DILocation(line: 189, column: 15, scope: !230)
!234 = !DILocation(line: 189, column: 31, scope: !230)
!235 = !DILocation(line: 189, column: 24, scope: !230)
!236 = !DILocation(line: 190, column: 13, scope: !237)
!237 = distinct !DILexicalBlock(scope: !230, file: !15, line: 190, column: 13)
!238 = !DILocation(line: 190, column: 20, scope: !237)
!239 = !DILocation(line: 190, column: 13, scope: !230)
!240 = !DILocation(line: 190, column: 30, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !15, line: 190, column: 29)
!242 = !DILocation(line: 192, column: 16, scope: !243)
!243 = distinct !DILexicalBlock(scope: !230, file: !15, line: 192, column: 9)
!244 = !DILocation(line: 192, column: 14, scope: !243)
!245 = !DILocation(line: 192, column: 21, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !15, line: 192, column: 9)
!247 = !DILocation(line: 192, column: 23, scope: !246)
!248 = !DILocation(line: 192, column: 9, scope: !243)
!249 = !DILocation(line: 194, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !15, line: 193, column: 9)
!251 = !DILocation(line: 194, column: 20, scope: !250)
!252 = !DILocation(line: 194, column: 23, scope: !250)
!253 = !DILocation(line: 195, column: 9, scope: !250)
!254 = !DILocation(line: 192, column: 30, scope: !246)
!255 = !DILocation(line: 192, column: 9, scope: !246)
!256 = distinct !{!256, !248, !257, !71}
!257 = !DILocation(line: 195, column: 9, scope: !243)
!258 = !DILocation(line: 197, column: 13, scope: !259)
!259 = distinct !DILexicalBlock(scope: !230, file: !15, line: 197, column: 13)
!260 = !DILocation(line: 197, column: 18, scope: !259)
!261 = !DILocation(line: 197, column: 23, scope: !259)
!262 = !DILocation(line: 197, column: 26, scope: !259)
!263 = !DILocation(line: 197, column: 31, scope: !259)
!264 = !DILocation(line: 197, column: 13, scope: !230)
!265 = !DILocation(line: 199, column: 13, scope: !266)
!266 = distinct !DILexicalBlock(scope: !259, file: !15, line: 198, column: 9)
!267 = !DILocation(line: 199, column: 20, scope: !266)
!268 = !DILocation(line: 199, column: 26, scope: !266)
!269 = !DILocation(line: 201, column: 19, scope: !270)
!270 = distinct !DILexicalBlock(scope: !266, file: !15, line: 201, column: 13)
!271 = !DILocation(line: 201, column: 17, scope: !270)
!272 = !DILocation(line: 201, column: 24, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !15, line: 201, column: 13)
!274 = !DILocation(line: 201, column: 26, scope: !273)
!275 = !DILocation(line: 201, column: 13, scope: !270)
!276 = !DILocation(line: 203, column: 30, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !15, line: 202, column: 13)
!278 = !DILocation(line: 203, column: 37, scope: !277)
!279 = !DILocation(line: 203, column: 17, scope: !277)
!280 = !DILocation(line: 204, column: 13, scope: !277)
!281 = !DILocation(line: 201, column: 33, scope: !273)
!282 = !DILocation(line: 201, column: 13, scope: !273)
!283 = distinct !{!283, !275, !284, !71}
!284 = !DILocation(line: 204, column: 13, scope: !270)
!285 = !DILocation(line: 205, column: 9, scope: !266)
!286 = !DILocation(line: 208, column: 13, scope: !287)
!287 = distinct !DILexicalBlock(scope: !259, file: !15, line: 207, column: 9)
!288 = !DILocation(line: 210, column: 14, scope: !230)
!289 = !DILocation(line: 210, column: 9, scope: !230)
!290 = !DILocation(line: 218, column: 1, scope: !209)
!291 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 221, type: !16, scopeLine: 222, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!292 = !DILocalVariable(name: "data", scope: !291, file: !15, line: 223, type: !5)
!293 = !DILocation(line: 223, column: 9, scope: !291)
!294 = !DILocation(line: 225, column: 10, scope: !291)
!295 = !DILocation(line: 235, column: 14, scope: !291)
!296 = !DILocalVariable(name: "i", scope: !297, file: !15, line: 242, type: !5)
!297 = distinct !DILexicalBlock(scope: !291, file: !15, line: 241, column: 5)
!298 = !DILocation(line: 242, column: 13, scope: !297)
!299 = !DILocalVariable(name: "buffer", scope: !297, file: !15, line: 243, type: !4)
!300 = !DILocation(line: 243, column: 15, scope: !297)
!301 = !DILocation(line: 243, column: 31, scope: !297)
!302 = !DILocation(line: 243, column: 24, scope: !297)
!303 = !DILocation(line: 244, column: 13, scope: !304)
!304 = distinct !DILexicalBlock(scope: !297, file: !15, line: 244, column: 13)
!305 = !DILocation(line: 244, column: 20, scope: !304)
!306 = !DILocation(line: 244, column: 13, scope: !297)
!307 = !DILocation(line: 244, column: 30, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !15, line: 244, column: 29)
!309 = !DILocation(line: 246, column: 16, scope: !310)
!310 = distinct !DILexicalBlock(scope: !297, file: !15, line: 246, column: 9)
!311 = !DILocation(line: 246, column: 14, scope: !310)
!312 = !DILocation(line: 246, column: 21, scope: !313)
!313 = distinct !DILexicalBlock(scope: !310, file: !15, line: 246, column: 9)
!314 = !DILocation(line: 246, column: 23, scope: !313)
!315 = !DILocation(line: 246, column: 9, scope: !310)
!316 = !DILocation(line: 248, column: 13, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !15, line: 247, column: 9)
!318 = !DILocation(line: 248, column: 20, scope: !317)
!319 = !DILocation(line: 248, column: 23, scope: !317)
!320 = !DILocation(line: 249, column: 9, scope: !317)
!321 = !DILocation(line: 246, column: 30, scope: !313)
!322 = !DILocation(line: 246, column: 9, scope: !313)
!323 = distinct !{!323, !315, !324, !71}
!324 = !DILocation(line: 249, column: 9, scope: !310)
!325 = !DILocation(line: 252, column: 13, scope: !326)
!326 = distinct !DILexicalBlock(scope: !297, file: !15, line: 252, column: 13)
!327 = !DILocation(line: 252, column: 18, scope: !326)
!328 = !DILocation(line: 252, column: 13, scope: !297)
!329 = !DILocation(line: 254, column: 13, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !15, line: 253, column: 9)
!331 = !DILocation(line: 254, column: 20, scope: !330)
!332 = !DILocation(line: 254, column: 26, scope: !330)
!333 = !DILocation(line: 256, column: 19, scope: !334)
!334 = distinct !DILexicalBlock(scope: !330, file: !15, line: 256, column: 13)
!335 = !DILocation(line: 256, column: 17, scope: !334)
!336 = !DILocation(line: 256, column: 24, scope: !337)
!337 = distinct !DILexicalBlock(scope: !334, file: !15, line: 256, column: 13)
!338 = !DILocation(line: 256, column: 26, scope: !337)
!339 = !DILocation(line: 256, column: 13, scope: !334)
!340 = !DILocation(line: 258, column: 30, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !15, line: 257, column: 13)
!342 = !DILocation(line: 258, column: 37, scope: !341)
!343 = !DILocation(line: 258, column: 17, scope: !341)
!344 = !DILocation(line: 259, column: 13, scope: !341)
!345 = !DILocation(line: 256, column: 33, scope: !337)
!346 = !DILocation(line: 256, column: 13, scope: !337)
!347 = distinct !{!347, !339, !348, !71}
!348 = !DILocation(line: 259, column: 13, scope: !334)
!349 = !DILocation(line: 260, column: 9, scope: !330)
!350 = !DILocation(line: 263, column: 13, scope: !351)
!351 = distinct !DILexicalBlock(scope: !326, file: !15, line: 262, column: 9)
!352 = !DILocation(line: 265, column: 14, scope: !297)
!353 = !DILocation(line: 265, column: 9, scope: !297)
!354 = !DILocation(line: 273, column: 1, scope: !291)
!355 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 276, type: !16, scopeLine: 277, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!356 = !DILocalVariable(name: "data", scope: !355, file: !15, line: 278, type: !5)
!357 = !DILocation(line: 278, column: 9, scope: !355)
!358 = !DILocation(line: 280, column: 10, scope: !355)
!359 = !DILocation(line: 286, column: 14, scope: !355)
!360 = !DILocalVariable(name: "i", scope: !361, file: !15, line: 297, type: !5)
!361 = distinct !DILexicalBlock(scope: !355, file: !15, line: 296, column: 5)
!362 = !DILocation(line: 297, column: 13, scope: !361)
!363 = !DILocalVariable(name: "buffer", scope: !361, file: !15, line: 298, type: !4)
!364 = !DILocation(line: 298, column: 15, scope: !361)
!365 = !DILocation(line: 298, column: 31, scope: !361)
!366 = !DILocation(line: 298, column: 24, scope: !361)
!367 = !DILocation(line: 299, column: 13, scope: !368)
!368 = distinct !DILexicalBlock(scope: !361, file: !15, line: 299, column: 13)
!369 = !DILocation(line: 299, column: 20, scope: !368)
!370 = !DILocation(line: 299, column: 13, scope: !361)
!371 = !DILocation(line: 299, column: 30, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !15, line: 299, column: 29)
!373 = !DILocation(line: 301, column: 16, scope: !374)
!374 = distinct !DILexicalBlock(scope: !361, file: !15, line: 301, column: 9)
!375 = !DILocation(line: 301, column: 14, scope: !374)
!376 = !DILocation(line: 301, column: 21, scope: !377)
!377 = distinct !DILexicalBlock(scope: !374, file: !15, line: 301, column: 9)
!378 = !DILocation(line: 301, column: 23, scope: !377)
!379 = !DILocation(line: 301, column: 9, scope: !374)
!380 = !DILocation(line: 303, column: 13, scope: !381)
!381 = distinct !DILexicalBlock(scope: !377, file: !15, line: 302, column: 9)
!382 = !DILocation(line: 303, column: 20, scope: !381)
!383 = !DILocation(line: 303, column: 23, scope: !381)
!384 = !DILocation(line: 304, column: 9, scope: !381)
!385 = !DILocation(line: 301, column: 30, scope: !377)
!386 = !DILocation(line: 301, column: 9, scope: !377)
!387 = distinct !{!387, !379, !388, !71}
!388 = !DILocation(line: 304, column: 9, scope: !374)
!389 = !DILocation(line: 307, column: 13, scope: !390)
!390 = distinct !DILexicalBlock(scope: !361, file: !15, line: 307, column: 13)
!391 = !DILocation(line: 307, column: 18, scope: !390)
!392 = !DILocation(line: 307, column: 13, scope: !361)
!393 = !DILocation(line: 309, column: 13, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !15, line: 308, column: 9)
!395 = !DILocation(line: 309, column: 20, scope: !394)
!396 = !DILocation(line: 309, column: 26, scope: !394)
!397 = !DILocation(line: 311, column: 19, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !15, line: 311, column: 13)
!399 = !DILocation(line: 311, column: 17, scope: !398)
!400 = !DILocation(line: 311, column: 24, scope: !401)
!401 = distinct !DILexicalBlock(scope: !398, file: !15, line: 311, column: 13)
!402 = !DILocation(line: 311, column: 26, scope: !401)
!403 = !DILocation(line: 311, column: 13, scope: !398)
!404 = !DILocation(line: 313, column: 30, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !15, line: 312, column: 13)
!406 = !DILocation(line: 313, column: 37, scope: !405)
!407 = !DILocation(line: 313, column: 17, scope: !405)
!408 = !DILocation(line: 314, column: 13, scope: !405)
!409 = !DILocation(line: 311, column: 33, scope: !401)
!410 = !DILocation(line: 311, column: 13, scope: !401)
!411 = distinct !{!411, !403, !412, !71}
!412 = !DILocation(line: 314, column: 13, scope: !398)
!413 = !DILocation(line: 315, column: 9, scope: !394)
!414 = !DILocation(line: 318, column: 13, scope: !415)
!415 = distinct !DILexicalBlock(scope: !390, file: !15, line: 317, column: 9)
!416 = !DILocation(line: 320, column: 14, scope: !361)
!417 = !DILocation(line: 320, column: 9, scope: !361)
!418 = !DILocation(line: 328, column: 1, scope: !355)
