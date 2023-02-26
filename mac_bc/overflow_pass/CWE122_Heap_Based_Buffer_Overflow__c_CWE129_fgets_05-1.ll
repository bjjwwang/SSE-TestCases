; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 -1, i32* %data, align 4, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end4, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !30, metadata !DIExpression()), !dbg !37
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !37
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !38
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !40
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !41
  %cmp = icmp ne i8* %call, null, !dbg !42
  br i1 %cmp, label %if.then1, label %if.else, !dbg !43

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !44
  %call3 = call i32 @atoi(i8* noundef %arraydecay2), !dbg !46
  store i32 %call3, i32* %data, align 4, !dbg !47
  br label %if.end, !dbg !48

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !49
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !51

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticTrue, align 4, !dbg !52
  %tobool5 = icmp ne i32 %3, 0, !dbg !52
  br i1 %tobool5, label %if.then6, label %if.end26, !dbg !54

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !55, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !59, metadata !DIExpression()), !dbg !60
  %call7 = call i8* @malloc(i64 noundef 40) #6, !dbg !61
  %4 = bitcast i8* %call7 to i32*, !dbg !62
  store i32* %4, i32** %buffer, align 8, !dbg !60
  %5 = load i32*, i32** %buffer, align 8, !dbg !63
  %cmp8 = icmp eq i32* %5, null, !dbg !65
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !66

if.then9:                                         ; preds = %if.then6
  call void @exit(i32 noundef -1) #7, !dbg !67
  unreachable, !dbg !67

if.end10:                                         ; preds = %if.then6
  store i32 0, i32* %i, align 4, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %if.end10
  %6 = load i32, i32* %i, align 4, !dbg !72
  %cmp11 = icmp slt i32 %6, 10, !dbg !74
  br i1 %cmp11, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !76
  %8 = load i32, i32* %i, align 4, !dbg !78
  %idxprom = sext i32 %8 to i64, !dbg !76
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !76
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !81
  %inc = add nsw i32 %9, 1, !dbg !81
  store i32 %inc, i32* %i, align 4, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !86
  %cmp12 = icmp sge i32 %10, 0, !dbg !88
  br i1 %cmp12, label %if.then13, label %if.else24, !dbg !89

if.then13:                                        ; preds = %for.end
  %11 = load i32*, i32** %buffer, align 8, !dbg !90
  %12 = load i32, i32* %data, align 4, !dbg !92
  %idxprom14 = sext i32 %12 to i64, !dbg !90
  %arrayidx15 = getelementptr inbounds i32, i32* %11, i64 %idxprom14, !dbg !90
  store i32 1, i32* %arrayidx15, align 4, !dbg !93
  store i32 0, i32* %i, align 4, !dbg !94
  br label %for.cond16, !dbg !96

for.cond16:                                       ; preds = %for.inc21, %if.then13
  %13 = load i32, i32* %i, align 4, !dbg !97
  %cmp17 = icmp slt i32 %13, 10, !dbg !99
  br i1 %cmp17, label %for.body18, label %for.end23, !dbg !100

for.body18:                                       ; preds = %for.cond16
  %14 = load i32*, i32** %buffer, align 8, !dbg !101
  %15 = load i32, i32* %i, align 4, !dbg !103
  %idxprom19 = sext i32 %15 to i64, !dbg !101
  %arrayidx20 = getelementptr inbounds i32, i32* %14, i64 %idxprom19, !dbg !101
  %16 = load i32, i32* %arrayidx20, align 4, !dbg !101
  call void @printIntLine(i32 noundef %16), !dbg !104
  br label %for.inc21, !dbg !105

for.inc21:                                        ; preds = %for.body18
  %17 = load i32, i32* %i, align 4, !dbg !106
  %inc22 = add nsw i32 %17, 1, !dbg !106
  store i32 %inc22, i32* %i, align 4, !dbg !106
  br label %for.cond16, !dbg !107, !llvm.loop !108

for.end23:                                        ; preds = %for.cond16
  br label %if.end25, !dbg !110

if.else24:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  br label %if.end25

if.end25:                                         ; preds = %if.else24, %for.end23
  %18 = load i32*, i32** %buffer, align 8, !dbg !113
  %19 = bitcast i32* %18 to i8*, !dbg !113
  call void @free(i8* noundef %19), !dbg !114
  br label %if.end26, !dbg !115

if.end26:                                         ; preds = %if.end25, %if.end4
  ret void, !dbg !116
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_good() #0 !dbg !117 {
entry:
  call void @goodB2G1(), !dbg !118
  call void @goodB2G2(), !dbg !119
  call void @goodG2B1(), !dbg !120
  call void @goodG2B2(), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !123 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !128, metadata !DIExpression()), !dbg !129
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !130, metadata !DIExpression()), !dbg !131
  %call = call i64 @time(i64* noundef null), !dbg !132
  %conv = trunc i64 %call to i32, !dbg !133
  call void @srand(i32 noundef %conv), !dbg !134
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !135
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_good(), !dbg !136
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !137
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !138
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_bad(), !dbg !139
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !140
  ret i32 0, !dbg !141
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !142 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !143, metadata !DIExpression()), !dbg !144
  store i32 -1, i32* %data, align 4, !dbg !145
  %0 = load i32, i32* @staticTrue, align 4, !dbg !146
  %tobool = icmp ne i32 %0, 0, !dbg !146
  br i1 %tobool, label %if.then, label %if.end4, !dbg !148

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !149, metadata !DIExpression()), !dbg !152
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !152
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !153
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !155
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !156
  %cmp = icmp ne i8* %call, null, !dbg !157
  br i1 %cmp, label %if.then1, label %if.else, !dbg !158

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %call3 = call i32 @atoi(i8* noundef %arraydecay2), !dbg !161
  store i32 %call3, i32* %data, align 4, !dbg !162
  br label %if.end, !dbg !163

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !164
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !166

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFalse, align 4, !dbg !167
  %tobool5 = icmp ne i32 %3, 0, !dbg !167
  br i1 %tobool5, label %if.then6, label %if.else7, !dbg !169

if.then6:                                         ; preds = %if.end4
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !170
  br label %if.end28, !dbg !172

if.else7:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !173, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !177, metadata !DIExpression()), !dbg !178
  %call8 = call i8* @malloc(i64 noundef 40) #6, !dbg !179
  %4 = bitcast i8* %call8 to i32*, !dbg !180
  store i32* %4, i32** %buffer, align 8, !dbg !178
  %5 = load i32*, i32** %buffer, align 8, !dbg !181
  %cmp9 = icmp eq i32* %5, null, !dbg !183
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !184

if.then10:                                        ; preds = %if.else7
  call void @exit(i32 noundef -1) #7, !dbg !185
  unreachable, !dbg !185

if.end11:                                         ; preds = %if.else7
  store i32 0, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %if.end11
  %6 = load i32, i32* %i, align 4, !dbg !190
  %cmp12 = icmp slt i32 %6, 10, !dbg !192
  br i1 %cmp12, label %for.body, label %for.end, !dbg !193

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !194
  %8 = load i32, i32* %i, align 4, !dbg !196
  %idxprom = sext i32 %8 to i64, !dbg !194
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !194
  store i32 0, i32* %arrayidx, align 4, !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !199
  %inc = add nsw i32 %9, 1, !dbg !199
  store i32 %inc, i32* %i, align 4, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !203
  %cmp13 = icmp sge i32 %10, 0, !dbg !205
  br i1 %cmp13, label %land.lhs.true, label %if.else26, !dbg !206

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data, align 4, !dbg !207
  %cmp14 = icmp slt i32 %11, 10, !dbg !208
  br i1 %cmp14, label %if.then15, label %if.else26, !dbg !209

if.then15:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !210
  %13 = load i32, i32* %data, align 4, !dbg !212
  %idxprom16 = sext i32 %13 to i64, !dbg !210
  %arrayidx17 = getelementptr inbounds i32, i32* %12, i64 %idxprom16, !dbg !210
  store i32 1, i32* %arrayidx17, align 4, !dbg !213
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond18, !dbg !216

for.cond18:                                       ; preds = %for.inc23, %if.then15
  %14 = load i32, i32* %i, align 4, !dbg !217
  %cmp19 = icmp slt i32 %14, 10, !dbg !219
  br i1 %cmp19, label %for.body20, label %for.end25, !dbg !220

for.body20:                                       ; preds = %for.cond18
  %15 = load i32*, i32** %buffer, align 8, !dbg !221
  %16 = load i32, i32* %i, align 4, !dbg !223
  %idxprom21 = sext i32 %16 to i64, !dbg !221
  %arrayidx22 = getelementptr inbounds i32, i32* %15, i64 %idxprom21, !dbg !221
  %17 = load i32, i32* %arrayidx22, align 4, !dbg !221
  call void @printIntLine(i32 noundef %17), !dbg !224
  br label %for.inc23, !dbg !225

for.inc23:                                        ; preds = %for.body20
  %18 = load i32, i32* %i, align 4, !dbg !226
  %inc24 = add nsw i32 %18, 1, !dbg !226
  store i32 %inc24, i32* %i, align 4, !dbg !226
  br label %for.cond18, !dbg !227, !llvm.loop !228

for.end25:                                        ; preds = %for.cond18
  br label %if.end27, !dbg !230

if.else26:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !231
  br label %if.end27

if.end27:                                         ; preds = %if.else26, %for.end25
  %19 = load i32*, i32** %buffer, align 8, !dbg !233
  %20 = bitcast i32* %19 to i8*, !dbg !233
  call void @free(i8* noundef %20), !dbg !234
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.then6
  ret void, !dbg !235
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !236 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !237, metadata !DIExpression()), !dbg !238
  store i32 -1, i32* %data, align 4, !dbg !239
  %0 = load i32, i32* @staticTrue, align 4, !dbg !240
  %tobool = icmp ne i32 %0, 0, !dbg !240
  br i1 %tobool, label %if.then, label %if.end4, !dbg !242

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !243, metadata !DIExpression()), !dbg !246
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !246
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !246
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !247
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !249
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !250
  %cmp = icmp ne i8* %call, null, !dbg !251
  br i1 %cmp, label %if.then1, label %if.else, !dbg !252

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !253
  %call3 = call i32 @atoi(i8* noundef %arraydecay2), !dbg !255
  store i32 %call3, i32* %data, align 4, !dbg !256
  br label %if.end, !dbg !257

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !258
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !260

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticTrue, align 4, !dbg !261
  %tobool5 = icmp ne i32 %3, 0, !dbg !261
  br i1 %tobool5, label %if.then6, label %if.end27, !dbg !263

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !264, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !268, metadata !DIExpression()), !dbg !269
  %call7 = call i8* @malloc(i64 noundef 40) #6, !dbg !270
  %4 = bitcast i8* %call7 to i32*, !dbg !271
  store i32* %4, i32** %buffer, align 8, !dbg !269
  %5 = load i32*, i32** %buffer, align 8, !dbg !272
  %cmp8 = icmp eq i32* %5, null, !dbg !274
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !275

if.then9:                                         ; preds = %if.then6
  call void @exit(i32 noundef -1) #7, !dbg !276
  unreachable, !dbg !276

if.end10:                                         ; preds = %if.then6
  store i32 0, i32* %i, align 4, !dbg !278
  br label %for.cond, !dbg !280

for.cond:                                         ; preds = %for.inc, %if.end10
  %6 = load i32, i32* %i, align 4, !dbg !281
  %cmp11 = icmp slt i32 %6, 10, !dbg !283
  br i1 %cmp11, label %for.body, label %for.end, !dbg !284

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !285
  %8 = load i32, i32* %i, align 4, !dbg !287
  %idxprom = sext i32 %8 to i64, !dbg !285
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !285
  store i32 0, i32* %arrayidx, align 4, !dbg !288
  br label %for.inc, !dbg !289

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !290
  %inc = add nsw i32 %9, 1, !dbg !290
  store i32 %inc, i32* %i, align 4, !dbg !290
  br label %for.cond, !dbg !291, !llvm.loop !292

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !294
  %cmp12 = icmp sge i32 %10, 0, !dbg !296
  br i1 %cmp12, label %land.lhs.true, label %if.else25, !dbg !297

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data, align 4, !dbg !298
  %cmp13 = icmp slt i32 %11, 10, !dbg !299
  br i1 %cmp13, label %if.then14, label %if.else25, !dbg !300

if.then14:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !301
  %13 = load i32, i32* %data, align 4, !dbg !303
  %idxprom15 = sext i32 %13 to i64, !dbg !301
  %arrayidx16 = getelementptr inbounds i32, i32* %12, i64 %idxprom15, !dbg !301
  store i32 1, i32* %arrayidx16, align 4, !dbg !304
  store i32 0, i32* %i, align 4, !dbg !305
  br label %for.cond17, !dbg !307

for.cond17:                                       ; preds = %for.inc22, %if.then14
  %14 = load i32, i32* %i, align 4, !dbg !308
  %cmp18 = icmp slt i32 %14, 10, !dbg !310
  br i1 %cmp18, label %for.body19, label %for.end24, !dbg !311

for.body19:                                       ; preds = %for.cond17
  %15 = load i32*, i32** %buffer, align 8, !dbg !312
  %16 = load i32, i32* %i, align 4, !dbg !314
  %idxprom20 = sext i32 %16 to i64, !dbg !312
  %arrayidx21 = getelementptr inbounds i32, i32* %15, i64 %idxprom20, !dbg !312
  %17 = load i32, i32* %arrayidx21, align 4, !dbg !312
  call void @printIntLine(i32 noundef %17), !dbg !315
  br label %for.inc22, !dbg !316

for.inc22:                                        ; preds = %for.body19
  %18 = load i32, i32* %i, align 4, !dbg !317
  %inc23 = add nsw i32 %18, 1, !dbg !317
  store i32 %inc23, i32* %i, align 4, !dbg !317
  br label %for.cond17, !dbg !318, !llvm.loop !319

for.end24:                                        ; preds = %for.cond17
  br label %if.end26, !dbg !321

if.else25:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !322
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %for.end24
  %19 = load i32*, i32** %buffer, align 8, !dbg !324
  %20 = bitcast i32* %19 to i8*, !dbg !324
  call void @free(i8* noundef %20), !dbg !325
  br label %if.end27, !dbg !326

if.end27:                                         ; preds = %if.end26, %if.end4
  ret void, !dbg !327
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !328 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !329, metadata !DIExpression()), !dbg !330
  store i32 -1, i32* %data, align 4, !dbg !331
  %0 = load i32, i32* @staticFalse, align 4, !dbg !332
  %tobool = icmp ne i32 %0, 0, !dbg !332
  br i1 %tobool, label %if.then, label %if.else, !dbg !334

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !335
  br label %if.end, !dbg !337

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !338
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !340
  %tobool1 = icmp ne i32 %1, 0, !dbg !340
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !342

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !343, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !347, metadata !DIExpression()), !dbg !348
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !349
  %2 = bitcast i8* %call to i32*, !dbg !350
  store i32* %2, i32** %buffer, align 8, !dbg !348
  %3 = load i32*, i32** %buffer, align 8, !dbg !351
  %cmp = icmp eq i32* %3, null, !dbg !353
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !354

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #7, !dbg !355
  unreachable, !dbg !355

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !357
  br label %for.cond, !dbg !359

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !360
  %cmp5 = icmp slt i32 %4, 10, !dbg !362
  br i1 %cmp5, label %for.body, label %for.end, !dbg !363

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !364
  %6 = load i32, i32* %i, align 4, !dbg !366
  %idxprom = sext i32 %6 to i64, !dbg !364
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !364
  store i32 0, i32* %arrayidx, align 4, !dbg !367
  br label %for.inc, !dbg !368

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !369
  %inc = add nsw i32 %7, 1, !dbg !369
  store i32 %inc, i32* %i, align 4, !dbg !369
  br label %for.cond, !dbg !370, !llvm.loop !371

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !373
  %cmp6 = icmp sge i32 %8, 0, !dbg !375
  br i1 %cmp6, label %if.then7, label %if.else18, !dbg !376

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !377
  %10 = load i32, i32* %data, align 4, !dbg !379
  %idxprom8 = sext i32 %10 to i64, !dbg !377
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !377
  store i32 1, i32* %arrayidx9, align 4, !dbg !380
  store i32 0, i32* %i, align 4, !dbg !381
  br label %for.cond10, !dbg !383

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !384
  %cmp11 = icmp slt i32 %11, 10, !dbg !386
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !387

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !388
  %13 = load i32, i32* %i, align 4, !dbg !390
  %idxprom13 = sext i32 %13 to i64, !dbg !388
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !388
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !388
  call void @printIntLine(i32 noundef %14), !dbg !391
  br label %for.inc15, !dbg !392

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !393
  %inc16 = add nsw i32 %15, 1, !dbg !393
  store i32 %inc16, i32* %i, align 4, !dbg !393
  br label %for.cond10, !dbg !394, !llvm.loop !395

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !397

if.else18:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !398
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !400
  %17 = bitcast i32* %16 to i8*, !dbg !400
  call void @free(i8* noundef %17), !dbg !401
  br label %if.end20, !dbg !402

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !403
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !404 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !405, metadata !DIExpression()), !dbg !406
  store i32 -1, i32* %data, align 4, !dbg !407
  %0 = load i32, i32* @staticTrue, align 4, !dbg !408
  %tobool = icmp ne i32 %0, 0, !dbg !408
  br i1 %tobool, label %if.then, label %if.end, !dbg !410

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !411
  br label %if.end, !dbg !413

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !414
  %tobool1 = icmp ne i32 %1, 0, !dbg !414
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !416

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !417, metadata !DIExpression()), !dbg !420
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !421, metadata !DIExpression()), !dbg !422
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !423
  %2 = bitcast i8* %call to i32*, !dbg !424
  store i32* %2, i32** %buffer, align 8, !dbg !422
  %3 = load i32*, i32** %buffer, align 8, !dbg !425
  %cmp = icmp eq i32* %3, null, !dbg !427
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !428

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #7, !dbg !429
  unreachable, !dbg !429

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !431
  br label %for.cond, !dbg !433

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !434
  %cmp5 = icmp slt i32 %4, 10, !dbg !436
  br i1 %cmp5, label %for.body, label %for.end, !dbg !437

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !438
  %6 = load i32, i32* %i, align 4, !dbg !440
  %idxprom = sext i32 %6 to i64, !dbg !438
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !438
  store i32 0, i32* %arrayidx, align 4, !dbg !441
  br label %for.inc, !dbg !442

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !443
  %inc = add nsw i32 %7, 1, !dbg !443
  store i32 %inc, i32* %i, align 4, !dbg !443
  br label %for.cond, !dbg !444, !llvm.loop !445

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !447
  %cmp6 = icmp sge i32 %8, 0, !dbg !449
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !450

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !451
  %10 = load i32, i32* %data, align 4, !dbg !453
  %idxprom8 = sext i32 %10 to i64, !dbg !451
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !451
  store i32 1, i32* %arrayidx9, align 4, !dbg !454
  store i32 0, i32* %i, align 4, !dbg !455
  br label %for.cond10, !dbg !457

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !458
  %cmp11 = icmp slt i32 %11, 10, !dbg !460
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !461

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !462
  %13 = load i32, i32* %i, align 4, !dbg !464
  %idxprom13 = sext i32 %13 to i64, !dbg !462
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !462
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !462
  call void @printIntLine(i32 noundef %14), !dbg !465
  br label %for.inc15, !dbg !466

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !467
  %inc16 = add nsw i32 %15, 1, !dbg !467
  store i32 %inc16, i32* %i, align 4, !dbg !467
  br label %for.cond10, !dbg !468, !llvm.loop !469

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !471

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !472
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !474
  %17 = bitcast i32* %16 to i8*, !dbg !474
  call void @free(i8* noundef %17), !dbg !475
  br label %if.end19, !dbg !476

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !477
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !6, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !7, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !7)
!25 = !DILocation(line: 32, column: 9, scope: !20)
!26 = !DILocation(line: 34, column: 10, scope: !20)
!27 = !DILocation(line: 35, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !12, line: 35, column: 8)
!29 = !DILocation(line: 35, column: 8, scope: !20)
!30 = !DILocalVariable(name: "inputBuffer", scope: !31, file: !12, line: 38, type: !33)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 37, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 36, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 112, elements: !35)
!34 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!35 = !{!36}
!36 = !DISubrange(count: 14)
!37 = !DILocation(line: 38, column: 18, scope: !31)
!38 = !DILocation(line: 40, column: 23, scope: !39)
!39 = distinct !DILexicalBlock(scope: !31, file: !12, line: 40, column: 17)
!40 = !DILocation(line: 40, column: 53, scope: !39)
!41 = !DILocation(line: 40, column: 17, scope: !39)
!42 = !DILocation(line: 40, column: 60, scope: !39)
!43 = !DILocation(line: 40, column: 17, scope: !31)
!44 = !DILocation(line: 43, column: 29, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !12, line: 41, column: 13)
!46 = !DILocation(line: 43, column: 24, scope: !45)
!47 = !DILocation(line: 43, column: 22, scope: !45)
!48 = !DILocation(line: 44, column: 13, scope: !45)
!49 = !DILocation(line: 47, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !39, file: !12, line: 46, column: 13)
!51 = !DILocation(line: 50, column: 5, scope: !32)
!52 = !DILocation(line: 51, column: 8, scope: !53)
!53 = distinct !DILexicalBlock(scope: !20, file: !12, line: 51, column: 8)
!54 = !DILocation(line: 51, column: 8, scope: !20)
!55 = !DILocalVariable(name: "i", scope: !56, file: !12, line: 54, type: !7)
!56 = distinct !DILexicalBlock(scope: !57, file: !12, line: 53, column: 9)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 52, column: 5)
!58 = !DILocation(line: 54, column: 17, scope: !56)
!59 = !DILocalVariable(name: "buffer", scope: !56, file: !12, line: 55, type: !6)
!60 = !DILocation(line: 55, column: 19, scope: !56)
!61 = !DILocation(line: 55, column: 35, scope: !56)
!62 = !DILocation(line: 55, column: 28, scope: !56)
!63 = !DILocation(line: 56, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !56, file: !12, line: 56, column: 17)
!65 = !DILocation(line: 56, column: 24, scope: !64)
!66 = !DILocation(line: 56, column: 17, scope: !56)
!67 = !DILocation(line: 56, column: 34, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !12, line: 56, column: 33)
!69 = !DILocation(line: 58, column: 20, scope: !70)
!70 = distinct !DILexicalBlock(scope: !56, file: !12, line: 58, column: 13)
!71 = !DILocation(line: 58, column: 18, scope: !70)
!72 = !DILocation(line: 58, column: 25, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !12, line: 58, column: 13)
!74 = !DILocation(line: 58, column: 27, scope: !73)
!75 = !DILocation(line: 58, column: 13, scope: !70)
!76 = !DILocation(line: 60, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !12, line: 59, column: 13)
!78 = !DILocation(line: 60, column: 24, scope: !77)
!79 = !DILocation(line: 60, column: 27, scope: !77)
!80 = !DILocation(line: 61, column: 13, scope: !77)
!81 = !DILocation(line: 58, column: 34, scope: !73)
!82 = !DILocation(line: 58, column: 13, scope: !73)
!83 = distinct !{!83, !75, !84, !85}
!84 = !DILocation(line: 61, column: 13, scope: !70)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 64, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !56, file: !12, line: 64, column: 17)
!88 = !DILocation(line: 64, column: 22, scope: !87)
!89 = !DILocation(line: 64, column: 17, scope: !56)
!90 = !DILocation(line: 66, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !12, line: 65, column: 13)
!92 = !DILocation(line: 66, column: 24, scope: !91)
!93 = !DILocation(line: 66, column: 30, scope: !91)
!94 = !DILocation(line: 68, column: 23, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !12, line: 68, column: 17)
!96 = !DILocation(line: 68, column: 21, scope: !95)
!97 = !DILocation(line: 68, column: 28, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !12, line: 68, column: 17)
!99 = !DILocation(line: 68, column: 30, scope: !98)
!100 = !DILocation(line: 68, column: 17, scope: !95)
!101 = !DILocation(line: 70, column: 34, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 69, column: 17)
!103 = !DILocation(line: 70, column: 41, scope: !102)
!104 = !DILocation(line: 70, column: 21, scope: !102)
!105 = !DILocation(line: 71, column: 17, scope: !102)
!106 = !DILocation(line: 68, column: 37, scope: !98)
!107 = !DILocation(line: 68, column: 17, scope: !98)
!108 = distinct !{!108, !100, !109, !85}
!109 = !DILocation(line: 71, column: 17, scope: !95)
!110 = !DILocation(line: 72, column: 13, scope: !91)
!111 = !DILocation(line: 75, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !87, file: !12, line: 74, column: 13)
!113 = !DILocation(line: 77, column: 18, scope: !56)
!114 = !DILocation(line: 77, column: 13, scope: !56)
!115 = !DILocation(line: 79, column: 5, scope: !57)
!116 = !DILocation(line: 80, column: 1, scope: !20)
!117 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_05_good", scope: !12, file: !12, line: 286, type: !21, scopeLine: 287, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!118 = !DILocation(line: 288, column: 5, scope: !117)
!119 = !DILocation(line: 289, column: 5, scope: !117)
!120 = !DILocation(line: 290, column: 5, scope: !117)
!121 = !DILocation(line: 291, column: 5, scope: !117)
!122 = !DILocation(line: 292, column: 1, scope: !117)
!123 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 303, type: !124, scopeLine: 304, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!124 = !DISubroutineType(types: !125)
!125 = !{!7, !7, !126}
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!128 = !DILocalVariable(name: "argc", arg: 1, scope: !123, file: !12, line: 303, type: !7)
!129 = !DILocation(line: 303, column: 14, scope: !123)
!130 = !DILocalVariable(name: "argv", arg: 2, scope: !123, file: !12, line: 303, type: !126)
!131 = !DILocation(line: 303, column: 27, scope: !123)
!132 = !DILocation(line: 306, column: 22, scope: !123)
!133 = !DILocation(line: 306, column: 12, scope: !123)
!134 = !DILocation(line: 306, column: 5, scope: !123)
!135 = !DILocation(line: 308, column: 5, scope: !123)
!136 = !DILocation(line: 309, column: 5, scope: !123)
!137 = !DILocation(line: 310, column: 5, scope: !123)
!138 = !DILocation(line: 313, column: 5, scope: !123)
!139 = !DILocation(line: 314, column: 5, scope: !123)
!140 = !DILocation(line: 315, column: 5, scope: !123)
!141 = !DILocation(line: 317, column: 5, scope: !123)
!142 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!143 = !DILocalVariable(name: "data", scope: !142, file: !12, line: 89, type: !7)
!144 = !DILocation(line: 89, column: 9, scope: !142)
!145 = !DILocation(line: 91, column: 10, scope: !142)
!146 = !DILocation(line: 92, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !12, line: 92, column: 8)
!148 = !DILocation(line: 92, column: 8, scope: !142)
!149 = !DILocalVariable(name: "inputBuffer", scope: !150, file: !12, line: 95, type: !33)
!150 = distinct !DILexicalBlock(scope: !151, file: !12, line: 94, column: 9)
!151 = distinct !DILexicalBlock(scope: !147, file: !12, line: 93, column: 5)
!152 = !DILocation(line: 95, column: 18, scope: !150)
!153 = !DILocation(line: 97, column: 23, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !12, line: 97, column: 17)
!155 = !DILocation(line: 97, column: 53, scope: !154)
!156 = !DILocation(line: 97, column: 17, scope: !154)
!157 = !DILocation(line: 97, column: 60, scope: !154)
!158 = !DILocation(line: 97, column: 17, scope: !150)
!159 = !DILocation(line: 100, column: 29, scope: !160)
!160 = distinct !DILexicalBlock(scope: !154, file: !12, line: 98, column: 13)
!161 = !DILocation(line: 100, column: 24, scope: !160)
!162 = !DILocation(line: 100, column: 22, scope: !160)
!163 = !DILocation(line: 101, column: 13, scope: !160)
!164 = !DILocation(line: 104, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !154, file: !12, line: 103, column: 13)
!166 = !DILocation(line: 107, column: 5, scope: !151)
!167 = !DILocation(line: 108, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !142, file: !12, line: 108, column: 8)
!169 = !DILocation(line: 108, column: 8, scope: !142)
!170 = !DILocation(line: 111, column: 9, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !12, line: 109, column: 5)
!172 = !DILocation(line: 112, column: 5, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !174, file: !12, line: 116, type: !7)
!174 = distinct !DILexicalBlock(scope: !175, file: !12, line: 115, column: 9)
!175 = distinct !DILexicalBlock(scope: !168, file: !12, line: 114, column: 5)
!176 = !DILocation(line: 116, column: 17, scope: !174)
!177 = !DILocalVariable(name: "buffer", scope: !174, file: !12, line: 117, type: !6)
!178 = !DILocation(line: 117, column: 19, scope: !174)
!179 = !DILocation(line: 117, column: 35, scope: !174)
!180 = !DILocation(line: 117, column: 28, scope: !174)
!181 = !DILocation(line: 118, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !174, file: !12, line: 118, column: 17)
!183 = !DILocation(line: 118, column: 24, scope: !182)
!184 = !DILocation(line: 118, column: 17, scope: !174)
!185 = !DILocation(line: 118, column: 34, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !12, line: 118, column: 33)
!187 = !DILocation(line: 120, column: 20, scope: !188)
!188 = distinct !DILexicalBlock(scope: !174, file: !12, line: 120, column: 13)
!189 = !DILocation(line: 120, column: 18, scope: !188)
!190 = !DILocation(line: 120, column: 25, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !12, line: 120, column: 13)
!192 = !DILocation(line: 120, column: 27, scope: !191)
!193 = !DILocation(line: 120, column: 13, scope: !188)
!194 = !DILocation(line: 122, column: 17, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !12, line: 121, column: 13)
!196 = !DILocation(line: 122, column: 24, scope: !195)
!197 = !DILocation(line: 122, column: 27, scope: !195)
!198 = !DILocation(line: 123, column: 13, scope: !195)
!199 = !DILocation(line: 120, column: 34, scope: !191)
!200 = !DILocation(line: 120, column: 13, scope: !191)
!201 = distinct !{!201, !193, !202, !85}
!202 = !DILocation(line: 123, column: 13, scope: !188)
!203 = !DILocation(line: 125, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !174, file: !12, line: 125, column: 17)
!205 = !DILocation(line: 125, column: 22, scope: !204)
!206 = !DILocation(line: 125, column: 27, scope: !204)
!207 = !DILocation(line: 125, column: 30, scope: !204)
!208 = !DILocation(line: 125, column: 35, scope: !204)
!209 = !DILocation(line: 125, column: 17, scope: !174)
!210 = !DILocation(line: 127, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !204, file: !12, line: 126, column: 13)
!212 = !DILocation(line: 127, column: 24, scope: !211)
!213 = !DILocation(line: 127, column: 30, scope: !211)
!214 = !DILocation(line: 129, column: 23, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !12, line: 129, column: 17)
!216 = !DILocation(line: 129, column: 21, scope: !215)
!217 = !DILocation(line: 129, column: 28, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !12, line: 129, column: 17)
!219 = !DILocation(line: 129, column: 30, scope: !218)
!220 = !DILocation(line: 129, column: 17, scope: !215)
!221 = !DILocation(line: 131, column: 34, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !12, line: 130, column: 17)
!223 = !DILocation(line: 131, column: 41, scope: !222)
!224 = !DILocation(line: 131, column: 21, scope: !222)
!225 = !DILocation(line: 132, column: 17, scope: !222)
!226 = !DILocation(line: 129, column: 37, scope: !218)
!227 = !DILocation(line: 129, column: 17, scope: !218)
!228 = distinct !{!228, !220, !229, !85}
!229 = !DILocation(line: 132, column: 17, scope: !215)
!230 = !DILocation(line: 133, column: 13, scope: !211)
!231 = !DILocation(line: 136, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !204, file: !12, line: 135, column: 13)
!233 = !DILocation(line: 138, column: 18, scope: !174)
!234 = !DILocation(line: 138, column: 13, scope: !174)
!235 = !DILocation(line: 141, column: 1, scope: !142)
!236 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 144, type: !21, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!237 = !DILocalVariable(name: "data", scope: !236, file: !12, line: 146, type: !7)
!238 = !DILocation(line: 146, column: 9, scope: !236)
!239 = !DILocation(line: 148, column: 10, scope: !236)
!240 = !DILocation(line: 149, column: 8, scope: !241)
!241 = distinct !DILexicalBlock(scope: !236, file: !12, line: 149, column: 8)
!242 = !DILocation(line: 149, column: 8, scope: !236)
!243 = !DILocalVariable(name: "inputBuffer", scope: !244, file: !12, line: 152, type: !33)
!244 = distinct !DILexicalBlock(scope: !245, file: !12, line: 151, column: 9)
!245 = distinct !DILexicalBlock(scope: !241, file: !12, line: 150, column: 5)
!246 = !DILocation(line: 152, column: 18, scope: !244)
!247 = !DILocation(line: 154, column: 23, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !12, line: 154, column: 17)
!249 = !DILocation(line: 154, column: 53, scope: !248)
!250 = !DILocation(line: 154, column: 17, scope: !248)
!251 = !DILocation(line: 154, column: 60, scope: !248)
!252 = !DILocation(line: 154, column: 17, scope: !244)
!253 = !DILocation(line: 157, column: 29, scope: !254)
!254 = distinct !DILexicalBlock(scope: !248, file: !12, line: 155, column: 13)
!255 = !DILocation(line: 157, column: 24, scope: !254)
!256 = !DILocation(line: 157, column: 22, scope: !254)
!257 = !DILocation(line: 158, column: 13, scope: !254)
!258 = !DILocation(line: 161, column: 17, scope: !259)
!259 = distinct !DILexicalBlock(scope: !248, file: !12, line: 160, column: 13)
!260 = !DILocation(line: 164, column: 5, scope: !245)
!261 = !DILocation(line: 165, column: 8, scope: !262)
!262 = distinct !DILexicalBlock(scope: !236, file: !12, line: 165, column: 8)
!263 = !DILocation(line: 165, column: 8, scope: !236)
!264 = !DILocalVariable(name: "i", scope: !265, file: !12, line: 168, type: !7)
!265 = distinct !DILexicalBlock(scope: !266, file: !12, line: 167, column: 9)
!266 = distinct !DILexicalBlock(scope: !262, file: !12, line: 166, column: 5)
!267 = !DILocation(line: 168, column: 17, scope: !265)
!268 = !DILocalVariable(name: "buffer", scope: !265, file: !12, line: 169, type: !6)
!269 = !DILocation(line: 169, column: 19, scope: !265)
!270 = !DILocation(line: 169, column: 35, scope: !265)
!271 = !DILocation(line: 169, column: 28, scope: !265)
!272 = !DILocation(line: 170, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !265, file: !12, line: 170, column: 17)
!274 = !DILocation(line: 170, column: 24, scope: !273)
!275 = !DILocation(line: 170, column: 17, scope: !265)
!276 = !DILocation(line: 170, column: 34, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !12, line: 170, column: 33)
!278 = !DILocation(line: 172, column: 20, scope: !279)
!279 = distinct !DILexicalBlock(scope: !265, file: !12, line: 172, column: 13)
!280 = !DILocation(line: 172, column: 18, scope: !279)
!281 = !DILocation(line: 172, column: 25, scope: !282)
!282 = distinct !DILexicalBlock(scope: !279, file: !12, line: 172, column: 13)
!283 = !DILocation(line: 172, column: 27, scope: !282)
!284 = !DILocation(line: 172, column: 13, scope: !279)
!285 = !DILocation(line: 174, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !12, line: 173, column: 13)
!287 = !DILocation(line: 174, column: 24, scope: !286)
!288 = !DILocation(line: 174, column: 27, scope: !286)
!289 = !DILocation(line: 175, column: 13, scope: !286)
!290 = !DILocation(line: 172, column: 34, scope: !282)
!291 = !DILocation(line: 172, column: 13, scope: !282)
!292 = distinct !{!292, !284, !293, !85}
!293 = !DILocation(line: 175, column: 13, scope: !279)
!294 = !DILocation(line: 177, column: 17, scope: !295)
!295 = distinct !DILexicalBlock(scope: !265, file: !12, line: 177, column: 17)
!296 = !DILocation(line: 177, column: 22, scope: !295)
!297 = !DILocation(line: 177, column: 27, scope: !295)
!298 = !DILocation(line: 177, column: 30, scope: !295)
!299 = !DILocation(line: 177, column: 35, scope: !295)
!300 = !DILocation(line: 177, column: 17, scope: !265)
!301 = !DILocation(line: 179, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !295, file: !12, line: 178, column: 13)
!303 = !DILocation(line: 179, column: 24, scope: !302)
!304 = !DILocation(line: 179, column: 30, scope: !302)
!305 = !DILocation(line: 181, column: 23, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !12, line: 181, column: 17)
!307 = !DILocation(line: 181, column: 21, scope: !306)
!308 = !DILocation(line: 181, column: 28, scope: !309)
!309 = distinct !DILexicalBlock(scope: !306, file: !12, line: 181, column: 17)
!310 = !DILocation(line: 181, column: 30, scope: !309)
!311 = !DILocation(line: 181, column: 17, scope: !306)
!312 = !DILocation(line: 183, column: 34, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !12, line: 182, column: 17)
!314 = !DILocation(line: 183, column: 41, scope: !313)
!315 = !DILocation(line: 183, column: 21, scope: !313)
!316 = !DILocation(line: 184, column: 17, scope: !313)
!317 = !DILocation(line: 181, column: 37, scope: !309)
!318 = !DILocation(line: 181, column: 17, scope: !309)
!319 = distinct !{!319, !311, !320, !85}
!320 = !DILocation(line: 184, column: 17, scope: !306)
!321 = !DILocation(line: 185, column: 13, scope: !302)
!322 = !DILocation(line: 188, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !295, file: !12, line: 187, column: 13)
!324 = !DILocation(line: 190, column: 18, scope: !265)
!325 = !DILocation(line: 190, column: 13, scope: !265)
!326 = !DILocation(line: 192, column: 5, scope: !266)
!327 = !DILocation(line: 193, column: 1, scope: !236)
!328 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 196, type: !21, scopeLine: 197, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!329 = !DILocalVariable(name: "data", scope: !328, file: !12, line: 198, type: !7)
!330 = !DILocation(line: 198, column: 9, scope: !328)
!331 = !DILocation(line: 200, column: 10, scope: !328)
!332 = !DILocation(line: 201, column: 8, scope: !333)
!333 = distinct !DILexicalBlock(scope: !328, file: !12, line: 201, column: 8)
!334 = !DILocation(line: 201, column: 8, scope: !328)
!335 = !DILocation(line: 204, column: 9, scope: !336)
!336 = distinct !DILexicalBlock(scope: !333, file: !12, line: 202, column: 5)
!337 = !DILocation(line: 205, column: 5, scope: !336)
!338 = !DILocation(line: 210, column: 14, scope: !339)
!339 = distinct !DILexicalBlock(scope: !333, file: !12, line: 207, column: 5)
!340 = !DILocation(line: 212, column: 8, scope: !341)
!341 = distinct !DILexicalBlock(scope: !328, file: !12, line: 212, column: 8)
!342 = !DILocation(line: 212, column: 8, scope: !328)
!343 = !DILocalVariable(name: "i", scope: !344, file: !12, line: 215, type: !7)
!344 = distinct !DILexicalBlock(scope: !345, file: !12, line: 214, column: 9)
!345 = distinct !DILexicalBlock(scope: !341, file: !12, line: 213, column: 5)
!346 = !DILocation(line: 215, column: 17, scope: !344)
!347 = !DILocalVariable(name: "buffer", scope: !344, file: !12, line: 216, type: !6)
!348 = !DILocation(line: 216, column: 19, scope: !344)
!349 = !DILocation(line: 216, column: 35, scope: !344)
!350 = !DILocation(line: 216, column: 28, scope: !344)
!351 = !DILocation(line: 217, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !344, file: !12, line: 217, column: 17)
!353 = !DILocation(line: 217, column: 24, scope: !352)
!354 = !DILocation(line: 217, column: 17, scope: !344)
!355 = !DILocation(line: 217, column: 34, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !12, line: 217, column: 33)
!357 = !DILocation(line: 219, column: 20, scope: !358)
!358 = distinct !DILexicalBlock(scope: !344, file: !12, line: 219, column: 13)
!359 = !DILocation(line: 219, column: 18, scope: !358)
!360 = !DILocation(line: 219, column: 25, scope: !361)
!361 = distinct !DILexicalBlock(scope: !358, file: !12, line: 219, column: 13)
!362 = !DILocation(line: 219, column: 27, scope: !361)
!363 = !DILocation(line: 219, column: 13, scope: !358)
!364 = !DILocation(line: 221, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !361, file: !12, line: 220, column: 13)
!366 = !DILocation(line: 221, column: 24, scope: !365)
!367 = !DILocation(line: 221, column: 27, scope: !365)
!368 = !DILocation(line: 222, column: 13, scope: !365)
!369 = !DILocation(line: 219, column: 34, scope: !361)
!370 = !DILocation(line: 219, column: 13, scope: !361)
!371 = distinct !{!371, !363, !372, !85}
!372 = !DILocation(line: 222, column: 13, scope: !358)
!373 = !DILocation(line: 225, column: 17, scope: !374)
!374 = distinct !DILexicalBlock(scope: !344, file: !12, line: 225, column: 17)
!375 = !DILocation(line: 225, column: 22, scope: !374)
!376 = !DILocation(line: 225, column: 17, scope: !344)
!377 = !DILocation(line: 227, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !374, file: !12, line: 226, column: 13)
!379 = !DILocation(line: 227, column: 24, scope: !378)
!380 = !DILocation(line: 227, column: 30, scope: !378)
!381 = !DILocation(line: 229, column: 23, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !12, line: 229, column: 17)
!383 = !DILocation(line: 229, column: 21, scope: !382)
!384 = !DILocation(line: 229, column: 28, scope: !385)
!385 = distinct !DILexicalBlock(scope: !382, file: !12, line: 229, column: 17)
!386 = !DILocation(line: 229, column: 30, scope: !385)
!387 = !DILocation(line: 229, column: 17, scope: !382)
!388 = !DILocation(line: 231, column: 34, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !12, line: 230, column: 17)
!390 = !DILocation(line: 231, column: 41, scope: !389)
!391 = !DILocation(line: 231, column: 21, scope: !389)
!392 = !DILocation(line: 232, column: 17, scope: !389)
!393 = !DILocation(line: 229, column: 37, scope: !385)
!394 = !DILocation(line: 229, column: 17, scope: !385)
!395 = distinct !{!395, !387, !396, !85}
!396 = !DILocation(line: 232, column: 17, scope: !382)
!397 = !DILocation(line: 233, column: 13, scope: !378)
!398 = !DILocation(line: 236, column: 17, scope: !399)
!399 = distinct !DILexicalBlock(scope: !374, file: !12, line: 235, column: 13)
!400 = !DILocation(line: 238, column: 18, scope: !344)
!401 = !DILocation(line: 238, column: 13, scope: !344)
!402 = !DILocation(line: 240, column: 5, scope: !345)
!403 = !DILocation(line: 241, column: 1, scope: !328)
!404 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 244, type: !21, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!405 = !DILocalVariable(name: "data", scope: !404, file: !12, line: 246, type: !7)
!406 = !DILocation(line: 246, column: 9, scope: !404)
!407 = !DILocation(line: 248, column: 10, scope: !404)
!408 = !DILocation(line: 249, column: 8, scope: !409)
!409 = distinct !DILexicalBlock(scope: !404, file: !12, line: 249, column: 8)
!410 = !DILocation(line: 249, column: 8, scope: !404)
!411 = !DILocation(line: 253, column: 14, scope: !412)
!412 = distinct !DILexicalBlock(scope: !409, file: !12, line: 250, column: 5)
!413 = !DILocation(line: 254, column: 5, scope: !412)
!414 = !DILocation(line: 255, column: 8, scope: !415)
!415 = distinct !DILexicalBlock(scope: !404, file: !12, line: 255, column: 8)
!416 = !DILocation(line: 255, column: 8, scope: !404)
!417 = !DILocalVariable(name: "i", scope: !418, file: !12, line: 258, type: !7)
!418 = distinct !DILexicalBlock(scope: !419, file: !12, line: 257, column: 9)
!419 = distinct !DILexicalBlock(scope: !415, file: !12, line: 256, column: 5)
!420 = !DILocation(line: 258, column: 17, scope: !418)
!421 = !DILocalVariable(name: "buffer", scope: !418, file: !12, line: 259, type: !6)
!422 = !DILocation(line: 259, column: 19, scope: !418)
!423 = !DILocation(line: 259, column: 35, scope: !418)
!424 = !DILocation(line: 259, column: 28, scope: !418)
!425 = !DILocation(line: 260, column: 17, scope: !426)
!426 = distinct !DILexicalBlock(scope: !418, file: !12, line: 260, column: 17)
!427 = !DILocation(line: 260, column: 24, scope: !426)
!428 = !DILocation(line: 260, column: 17, scope: !418)
!429 = !DILocation(line: 260, column: 34, scope: !430)
!430 = distinct !DILexicalBlock(scope: !426, file: !12, line: 260, column: 33)
!431 = !DILocation(line: 262, column: 20, scope: !432)
!432 = distinct !DILexicalBlock(scope: !418, file: !12, line: 262, column: 13)
!433 = !DILocation(line: 262, column: 18, scope: !432)
!434 = !DILocation(line: 262, column: 25, scope: !435)
!435 = distinct !DILexicalBlock(scope: !432, file: !12, line: 262, column: 13)
!436 = !DILocation(line: 262, column: 27, scope: !435)
!437 = !DILocation(line: 262, column: 13, scope: !432)
!438 = !DILocation(line: 264, column: 17, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !12, line: 263, column: 13)
!440 = !DILocation(line: 264, column: 24, scope: !439)
!441 = !DILocation(line: 264, column: 27, scope: !439)
!442 = !DILocation(line: 265, column: 13, scope: !439)
!443 = !DILocation(line: 262, column: 34, scope: !435)
!444 = !DILocation(line: 262, column: 13, scope: !435)
!445 = distinct !{!445, !437, !446, !85}
!446 = !DILocation(line: 265, column: 13, scope: !432)
!447 = !DILocation(line: 268, column: 17, scope: !448)
!448 = distinct !DILexicalBlock(scope: !418, file: !12, line: 268, column: 17)
!449 = !DILocation(line: 268, column: 22, scope: !448)
!450 = !DILocation(line: 268, column: 17, scope: !418)
!451 = !DILocation(line: 270, column: 17, scope: !452)
!452 = distinct !DILexicalBlock(scope: !448, file: !12, line: 269, column: 13)
!453 = !DILocation(line: 270, column: 24, scope: !452)
!454 = !DILocation(line: 270, column: 30, scope: !452)
!455 = !DILocation(line: 272, column: 23, scope: !456)
!456 = distinct !DILexicalBlock(scope: !452, file: !12, line: 272, column: 17)
!457 = !DILocation(line: 272, column: 21, scope: !456)
!458 = !DILocation(line: 272, column: 28, scope: !459)
!459 = distinct !DILexicalBlock(scope: !456, file: !12, line: 272, column: 17)
!460 = !DILocation(line: 272, column: 30, scope: !459)
!461 = !DILocation(line: 272, column: 17, scope: !456)
!462 = !DILocation(line: 274, column: 34, scope: !463)
!463 = distinct !DILexicalBlock(scope: !459, file: !12, line: 273, column: 17)
!464 = !DILocation(line: 274, column: 41, scope: !463)
!465 = !DILocation(line: 274, column: 21, scope: !463)
!466 = !DILocation(line: 275, column: 17, scope: !463)
!467 = !DILocation(line: 272, column: 37, scope: !459)
!468 = !DILocation(line: 272, column: 17, scope: !459)
!469 = distinct !{!469, !461, !470, !85}
!470 = !DILocation(line: 275, column: 17, scope: !456)
!471 = !DILocation(line: 276, column: 13, scope: !452)
!472 = !DILocation(line: 279, column: 17, scope: !473)
!473 = distinct !DILexicalBlock(scope: !448, file: !12, line: 278, column: 13)
!474 = !DILocation(line: 281, column: 18, scope: !418)
!475 = !DILocation(line: 281, column: 13, scope: !418)
!476 = !DILocation(line: 283, column: 5, scope: !419)
!477 = !DILocation(line: 284, column: 1, scope: !404)
