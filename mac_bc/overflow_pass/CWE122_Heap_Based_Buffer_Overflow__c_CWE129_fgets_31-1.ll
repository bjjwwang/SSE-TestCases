; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data3 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !42, metadata !DIExpression()), !dbg !44
  %2 = load i32, i32* %data, align 4, !dbg !45
  store i32 %2, i32* %dataCopy, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !46, metadata !DIExpression()), !dbg !47
  %3 = load i32, i32* %dataCopy, align 4, !dbg !48
  store i32 %3, i32* %data3, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %i, metadata !49, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !52, metadata !DIExpression()), !dbg !53
  %call4 = call i8* @malloc(i64 noundef 40) #6, !dbg !54
  %4 = bitcast i8* %call4 to i32*, !dbg !55
  store i32* %4, i32** %buffer, align 8, !dbg !53
  %5 = load i32*, i32** %buffer, align 8, !dbg !56
  %cmp5 = icmp eq i32* %5, null, !dbg !58
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !59

if.then6:                                         ; preds = %if.end
  call void @exit(i32 noundef -1) #7, !dbg !60
  unreachable, !dbg !60

if.end7:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end7
  %6 = load i32, i32* %i, align 4, !dbg !65
  %cmp8 = icmp slt i32 %6, 10, !dbg !67
  br i1 %cmp8, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !69
  %8 = load i32, i32* %i, align 4, !dbg !71
  %idxprom = sext i32 %8 to i64, !dbg !69
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !69
  store i32 0, i32* %arrayidx, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !74
  %inc = add nsw i32 %9, 1, !dbg !74
  store i32 %inc, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data3, align 4, !dbg !79
  %cmp9 = icmp sge i32 %10, 0, !dbg !81
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !82

if.then10:                                        ; preds = %for.end
  %11 = load i32*, i32** %buffer, align 8, !dbg !83
  %12 = load i32, i32* %data3, align 4, !dbg !85
  %idxprom11 = sext i32 %12 to i64, !dbg !83
  %arrayidx12 = getelementptr inbounds i32, i32* %11, i64 %idxprom11, !dbg !83
  store i32 1, i32* %arrayidx12, align 4, !dbg !86
  store i32 0, i32* %i, align 4, !dbg !87
  br label %for.cond13, !dbg !89

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %13 = load i32, i32* %i, align 4, !dbg !90
  %cmp14 = icmp slt i32 %13, 10, !dbg !92
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !93

for.body15:                                       ; preds = %for.cond13
  %14 = load i32*, i32** %buffer, align 8, !dbg !94
  %15 = load i32, i32* %i, align 4, !dbg !96
  %idxprom16 = sext i32 %15 to i64, !dbg !94
  %arrayidx17 = getelementptr inbounds i32, i32* %14, i64 %idxprom16, !dbg !94
  %16 = load i32, i32* %arrayidx17, align 4, !dbg !94
  call void @printIntLine(i32 noundef %16), !dbg !97
  br label %for.inc18, !dbg !98

for.inc18:                                        ; preds = %for.body15
  %17 = load i32, i32* %i, align 4, !dbg !99
  %inc19 = add nsw i32 %17, 1, !dbg !99
  store i32 %inc19, i32* %i, align 4, !dbg !99
  br label %for.cond13, !dbg !100, !llvm.loop !101

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !103

if.else21:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %18 = load i32*, i32** %buffer, align 8, !dbg !106
  %19 = bitcast i32* %18 to i8*, !dbg !106
  call void @free(i8* noundef %19), !dbg !107
  ret void, !dbg !108
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_good() #0 !dbg !109 {
entry:
  call void @goodG2B(), !dbg !110
  call void @goodB2G(), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !120, metadata !DIExpression()), !dbg !121
  %call = call i64 @time(i64* noundef null), !dbg !122
  %conv = trunc i64 %call to i32, !dbg !123
  call void @srand(i32 noundef %conv), !dbg !124
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !125
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_good(), !dbg !126
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !127
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !128
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_bad(), !dbg !129
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !130
  ret i32 0, !dbg !131
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !132 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !133, metadata !DIExpression()), !dbg !134
  store i32 -1, i32* %data, align 4, !dbg !135
  store i32 7, i32* %data, align 4, !dbg !136
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !137, metadata !DIExpression()), !dbg !139
  %0 = load i32, i32* %data, align 4, !dbg !140
  store i32 %0, i32* %dataCopy, align 4, !dbg !139
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !141, metadata !DIExpression()), !dbg !142
  %1 = load i32, i32* %dataCopy, align 4, !dbg !143
  store i32 %1, i32* %data1, align 4, !dbg !142
  call void @llvm.dbg.declare(metadata i32* %i, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !147, metadata !DIExpression()), !dbg !148
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !149
  %2 = bitcast i8* %call to i32*, !dbg !150
  store i32* %2, i32** %buffer, align 8, !dbg !148
  %3 = load i32*, i32** %buffer, align 8, !dbg !151
  %cmp = icmp eq i32* %3, null, !dbg !153
  br i1 %cmp, label %if.then, label %if.end, !dbg !154

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !155
  unreachable, !dbg !155

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !160
  %cmp2 = icmp slt i32 %4, 10, !dbg !162
  br i1 %cmp2, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !164
  %6 = load i32, i32* %i, align 4, !dbg !166
  %idxprom = sext i32 %6 to i64, !dbg !164
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !164
  store i32 0, i32* %arrayidx, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !169
  %inc = add nsw i32 %7, 1, !dbg !169
  store i32 %inc, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !173
  %cmp3 = icmp sge i32 %8, 0, !dbg !175
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !176

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !177
  %10 = load i32, i32* %data1, align 4, !dbg !179
  %idxprom5 = sext i32 %10 to i64, !dbg !177
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !177
  store i32 1, i32* %arrayidx6, align 4, !dbg !180
  store i32 0, i32* %i, align 4, !dbg !181
  br label %for.cond7, !dbg !183

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !184
  %cmp8 = icmp slt i32 %11, 10, !dbg !186
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !187

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !188
  %13 = load i32, i32* %i, align 4, !dbg !190
  %idxprom10 = sext i32 %13 to i64, !dbg !188
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !188
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !188
  call void @printIntLine(i32 noundef %14), !dbg !191
  br label %for.inc12, !dbg !192

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !193
  %inc13 = add nsw i32 %15, 1, !dbg !193
  store i32 %inc13, i32* %i, align 4, !dbg !193
  br label %for.cond7, !dbg !194, !llvm.loop !195

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !197

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !198
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !200
  %17 = bitcast i32* %16 to i8*, !dbg !200
  call void @free(i8* noundef %17), !dbg !201
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !203 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data3 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !204, metadata !DIExpression()), !dbg !205
  store i32 -1, i32* %data, align 4, !dbg !206
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !207, metadata !DIExpression()), !dbg !209
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !209
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !209
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !210
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !212
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !213
  %cmp = icmp ne i8* %call, null, !dbg !214
  br i1 %cmp, label %if.then, label %if.else, !dbg !215

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !216
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !218
  store i32 %call2, i32* %data, align 4, !dbg !219
  br label %if.end, !dbg !220

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !221
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !223, metadata !DIExpression()), !dbg !225
  %2 = load i32, i32* %data, align 4, !dbg !226
  store i32 %2, i32* %dataCopy, align 4, !dbg !225
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !227, metadata !DIExpression()), !dbg !228
  %3 = load i32, i32* %dataCopy, align 4, !dbg !229
  store i32 %3, i32* %data3, align 4, !dbg !228
  call void @llvm.dbg.declare(metadata i32* %i, metadata !230, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !233, metadata !DIExpression()), !dbg !234
  %call4 = call i8* @malloc(i64 noundef 40) #6, !dbg !235
  %4 = bitcast i8* %call4 to i32*, !dbg !236
  store i32* %4, i32** %buffer, align 8, !dbg !234
  %5 = load i32*, i32** %buffer, align 8, !dbg !237
  %cmp5 = icmp eq i32* %5, null, !dbg !239
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !240

if.then6:                                         ; preds = %if.end
  call void @exit(i32 noundef -1) #7, !dbg !241
  unreachable, !dbg !241

if.end7:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !243
  br label %for.cond, !dbg !245

for.cond:                                         ; preds = %for.inc, %if.end7
  %6 = load i32, i32* %i, align 4, !dbg !246
  %cmp8 = icmp slt i32 %6, 10, !dbg !248
  br i1 %cmp8, label %for.body, label %for.end, !dbg !249

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !250
  %8 = load i32, i32* %i, align 4, !dbg !252
  %idxprom = sext i32 %8 to i64, !dbg !250
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !250
  store i32 0, i32* %arrayidx, align 4, !dbg !253
  br label %for.inc, !dbg !254

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !255
  %inc = add nsw i32 %9, 1, !dbg !255
  store i32 %inc, i32* %i, align 4, !dbg !255
  br label %for.cond, !dbg !256, !llvm.loop !257

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data3, align 4, !dbg !259
  %cmp9 = icmp sge i32 %10, 0, !dbg !261
  br i1 %cmp9, label %land.lhs.true, label %if.else22, !dbg !262

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data3, align 4, !dbg !263
  %cmp10 = icmp slt i32 %11, 10, !dbg !264
  br i1 %cmp10, label %if.then11, label %if.else22, !dbg !265

if.then11:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !266
  %13 = load i32, i32* %data3, align 4, !dbg !268
  %idxprom12 = sext i32 %13 to i64, !dbg !266
  %arrayidx13 = getelementptr inbounds i32, i32* %12, i64 %idxprom12, !dbg !266
  store i32 1, i32* %arrayidx13, align 4, !dbg !269
  store i32 0, i32* %i, align 4, !dbg !270
  br label %for.cond14, !dbg !272

for.cond14:                                       ; preds = %for.inc19, %if.then11
  %14 = load i32, i32* %i, align 4, !dbg !273
  %cmp15 = icmp slt i32 %14, 10, !dbg !275
  br i1 %cmp15, label %for.body16, label %for.end21, !dbg !276

for.body16:                                       ; preds = %for.cond14
  %15 = load i32*, i32** %buffer, align 8, !dbg !277
  %16 = load i32, i32* %i, align 4, !dbg !279
  %idxprom17 = sext i32 %16 to i64, !dbg !277
  %arrayidx18 = getelementptr inbounds i32, i32* %15, i64 %idxprom17, !dbg !277
  %17 = load i32, i32* %arrayidx18, align 4, !dbg !277
  call void @printIntLine(i32 noundef %17), !dbg !280
  br label %for.inc19, !dbg !281

for.inc19:                                        ; preds = %for.body16
  %18 = load i32, i32* %i, align 4, !dbg !282
  %inc20 = add nsw i32 %18, 1, !dbg !282
  store i32 %inc20, i32* %i, align 4, !dbg !282
  br label %for.cond14, !dbg !283, !llvm.loop !284

for.end21:                                        ; preds = %for.cond14
  br label %if.end23, !dbg !286

if.else22:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !287
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %for.end21
  %19 = load i32*, i32** %buffer, align 8, !dbg !289
  %20 = bitcast i32* %19 to i8*, !dbg !289
  call void @free(i8* noundef %20), !dbg !290
  ret void, !dbg !291
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !5)
!20 = !DILocation(line: 26, column: 9, scope: !14)
!21 = !DILocation(line: 28, column: 10, scope: !14)
!22 = !DILocalVariable(name: "inputBuffer", scope: !23, file: !15, line: 30, type: !24)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 112, elements: !26)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !{!27}
!27 = !DISubrange(count: 14)
!28 = !DILocation(line: 30, column: 14, scope: !23)
!29 = !DILocation(line: 32, column: 19, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !15, line: 32, column: 13)
!31 = !DILocation(line: 32, column: 49, scope: !30)
!32 = !DILocation(line: 32, column: 13, scope: !30)
!33 = !DILocation(line: 32, column: 56, scope: !30)
!34 = !DILocation(line: 32, column: 13, scope: !23)
!35 = !DILocation(line: 35, column: 25, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !15, line: 33, column: 9)
!37 = !DILocation(line: 35, column: 20, scope: !36)
!38 = !DILocation(line: 35, column: 18, scope: !36)
!39 = !DILocation(line: 36, column: 9, scope: !36)
!40 = !DILocation(line: 39, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !30, file: !15, line: 38, column: 9)
!42 = !DILocalVariable(name: "dataCopy", scope: !43, file: !15, line: 43, type: !5)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 5)
!44 = !DILocation(line: 43, column: 13, scope: !43)
!45 = !DILocation(line: 43, column: 24, scope: !43)
!46 = !DILocalVariable(name: "data", scope: !43, file: !15, line: 44, type: !5)
!47 = !DILocation(line: 44, column: 13, scope: !43)
!48 = !DILocation(line: 44, column: 20, scope: !43)
!49 = !DILocalVariable(name: "i", scope: !50, file: !15, line: 46, type: !5)
!50 = distinct !DILexicalBlock(scope: !43, file: !15, line: 45, column: 9)
!51 = !DILocation(line: 46, column: 17, scope: !50)
!52 = !DILocalVariable(name: "buffer", scope: !50, file: !15, line: 47, type: !4)
!53 = !DILocation(line: 47, column: 19, scope: !50)
!54 = !DILocation(line: 47, column: 35, scope: !50)
!55 = !DILocation(line: 47, column: 28, scope: !50)
!56 = !DILocation(line: 48, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !50, file: !15, line: 48, column: 17)
!58 = !DILocation(line: 48, column: 24, scope: !57)
!59 = !DILocation(line: 48, column: 17, scope: !50)
!60 = !DILocation(line: 48, column: 34, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !15, line: 48, column: 33)
!62 = !DILocation(line: 50, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !50, file: !15, line: 50, column: 13)
!64 = !DILocation(line: 50, column: 18, scope: !63)
!65 = !DILocation(line: 50, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !15, line: 50, column: 13)
!67 = !DILocation(line: 50, column: 27, scope: !66)
!68 = !DILocation(line: 50, column: 13, scope: !63)
!69 = !DILocation(line: 52, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 51, column: 13)
!71 = !DILocation(line: 52, column: 24, scope: !70)
!72 = !DILocation(line: 52, column: 27, scope: !70)
!73 = !DILocation(line: 53, column: 13, scope: !70)
!74 = !DILocation(line: 50, column: 34, scope: !66)
!75 = !DILocation(line: 50, column: 13, scope: !66)
!76 = distinct !{!76, !68, !77, !78}
!77 = !DILocation(line: 53, column: 13, scope: !63)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 56, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !50, file: !15, line: 56, column: 17)
!81 = !DILocation(line: 56, column: 22, scope: !80)
!82 = !DILocation(line: 56, column: 17, scope: !50)
!83 = !DILocation(line: 58, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !15, line: 57, column: 13)
!85 = !DILocation(line: 58, column: 24, scope: !84)
!86 = !DILocation(line: 58, column: 30, scope: !84)
!87 = !DILocation(line: 60, column: 23, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 60, column: 17)
!89 = !DILocation(line: 60, column: 21, scope: !88)
!90 = !DILocation(line: 60, column: 28, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !15, line: 60, column: 17)
!92 = !DILocation(line: 60, column: 30, scope: !91)
!93 = !DILocation(line: 60, column: 17, scope: !88)
!94 = !DILocation(line: 62, column: 34, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 61, column: 17)
!96 = !DILocation(line: 62, column: 41, scope: !95)
!97 = !DILocation(line: 62, column: 21, scope: !95)
!98 = !DILocation(line: 63, column: 17, scope: !95)
!99 = !DILocation(line: 60, column: 37, scope: !91)
!100 = !DILocation(line: 60, column: 17, scope: !91)
!101 = distinct !{!101, !93, !102, !78}
!102 = !DILocation(line: 63, column: 17, scope: !88)
!103 = !DILocation(line: 64, column: 13, scope: !84)
!104 = !DILocation(line: 67, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !80, file: !15, line: 66, column: 13)
!106 = !DILocation(line: 69, column: 18, scope: !50)
!107 = !DILocation(line: 69, column: 13, scope: !50)
!108 = !DILocation(line: 72, column: 1, scope: !14)
!109 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_31_good", scope: !15, file: !15, line: 169, type: !16, scopeLine: 170, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!110 = !DILocation(line: 171, column: 5, scope: !109)
!111 = !DILocation(line: 172, column: 5, scope: !109)
!112 = !DILocation(line: 173, column: 1, scope: !109)
!113 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 183, type: !114, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!114 = !DISubroutineType(types: !115)
!115 = !{!5, !5, !116}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!118 = !DILocalVariable(name: "argc", arg: 1, scope: !113, file: !15, line: 183, type: !5)
!119 = !DILocation(line: 183, column: 14, scope: !113)
!120 = !DILocalVariable(name: "argv", arg: 2, scope: !113, file: !15, line: 183, type: !116)
!121 = !DILocation(line: 183, column: 27, scope: !113)
!122 = !DILocation(line: 186, column: 22, scope: !113)
!123 = !DILocation(line: 186, column: 12, scope: !113)
!124 = !DILocation(line: 186, column: 5, scope: !113)
!125 = !DILocation(line: 188, column: 5, scope: !113)
!126 = !DILocation(line: 189, column: 5, scope: !113)
!127 = !DILocation(line: 190, column: 5, scope: !113)
!128 = !DILocation(line: 193, column: 5, scope: !113)
!129 = !DILocation(line: 194, column: 5, scope: !113)
!130 = !DILocation(line: 195, column: 5, scope: !113)
!131 = !DILocation(line: 197, column: 5, scope: !113)
!132 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 79, type: !16, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!133 = !DILocalVariable(name: "data", scope: !132, file: !15, line: 81, type: !5)
!134 = !DILocation(line: 81, column: 9, scope: !132)
!135 = !DILocation(line: 83, column: 10, scope: !132)
!136 = !DILocation(line: 86, column: 10, scope: !132)
!137 = !DILocalVariable(name: "dataCopy", scope: !138, file: !15, line: 88, type: !5)
!138 = distinct !DILexicalBlock(scope: !132, file: !15, line: 87, column: 5)
!139 = !DILocation(line: 88, column: 13, scope: !138)
!140 = !DILocation(line: 88, column: 24, scope: !138)
!141 = !DILocalVariable(name: "data", scope: !138, file: !15, line: 89, type: !5)
!142 = !DILocation(line: 89, column: 13, scope: !138)
!143 = !DILocation(line: 89, column: 20, scope: !138)
!144 = !DILocalVariable(name: "i", scope: !145, file: !15, line: 91, type: !5)
!145 = distinct !DILexicalBlock(scope: !138, file: !15, line: 90, column: 9)
!146 = !DILocation(line: 91, column: 17, scope: !145)
!147 = !DILocalVariable(name: "buffer", scope: !145, file: !15, line: 92, type: !4)
!148 = !DILocation(line: 92, column: 19, scope: !145)
!149 = !DILocation(line: 92, column: 35, scope: !145)
!150 = !DILocation(line: 92, column: 28, scope: !145)
!151 = !DILocation(line: 93, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !145, file: !15, line: 93, column: 17)
!153 = !DILocation(line: 93, column: 24, scope: !152)
!154 = !DILocation(line: 93, column: 17, scope: !145)
!155 = !DILocation(line: 93, column: 34, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !15, line: 93, column: 33)
!157 = !DILocation(line: 95, column: 20, scope: !158)
!158 = distinct !DILexicalBlock(scope: !145, file: !15, line: 95, column: 13)
!159 = !DILocation(line: 95, column: 18, scope: !158)
!160 = !DILocation(line: 95, column: 25, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !15, line: 95, column: 13)
!162 = !DILocation(line: 95, column: 27, scope: !161)
!163 = !DILocation(line: 95, column: 13, scope: !158)
!164 = !DILocation(line: 97, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !15, line: 96, column: 13)
!166 = !DILocation(line: 97, column: 24, scope: !165)
!167 = !DILocation(line: 97, column: 27, scope: !165)
!168 = !DILocation(line: 98, column: 13, scope: !165)
!169 = !DILocation(line: 95, column: 34, scope: !161)
!170 = !DILocation(line: 95, column: 13, scope: !161)
!171 = distinct !{!171, !163, !172, !78}
!172 = !DILocation(line: 98, column: 13, scope: !158)
!173 = !DILocation(line: 101, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !145, file: !15, line: 101, column: 17)
!175 = !DILocation(line: 101, column: 22, scope: !174)
!176 = !DILocation(line: 101, column: 17, scope: !145)
!177 = !DILocation(line: 103, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !15, line: 102, column: 13)
!179 = !DILocation(line: 103, column: 24, scope: !178)
!180 = !DILocation(line: 103, column: 30, scope: !178)
!181 = !DILocation(line: 105, column: 23, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 105, column: 17)
!183 = !DILocation(line: 105, column: 21, scope: !182)
!184 = !DILocation(line: 105, column: 28, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !15, line: 105, column: 17)
!186 = !DILocation(line: 105, column: 30, scope: !185)
!187 = !DILocation(line: 105, column: 17, scope: !182)
!188 = !DILocation(line: 107, column: 34, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !15, line: 106, column: 17)
!190 = !DILocation(line: 107, column: 41, scope: !189)
!191 = !DILocation(line: 107, column: 21, scope: !189)
!192 = !DILocation(line: 108, column: 17, scope: !189)
!193 = !DILocation(line: 105, column: 37, scope: !185)
!194 = !DILocation(line: 105, column: 17, scope: !185)
!195 = distinct !{!195, !187, !196, !78}
!196 = !DILocation(line: 108, column: 17, scope: !182)
!197 = !DILocation(line: 109, column: 13, scope: !178)
!198 = !DILocation(line: 112, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !174, file: !15, line: 111, column: 13)
!200 = !DILocation(line: 114, column: 18, scope: !145)
!201 = !DILocation(line: 114, column: 13, scope: !145)
!202 = !DILocation(line: 117, column: 1, scope: !132)
!203 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 120, type: !16, scopeLine: 121, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!204 = !DILocalVariable(name: "data", scope: !203, file: !15, line: 122, type: !5)
!205 = !DILocation(line: 122, column: 9, scope: !203)
!206 = !DILocation(line: 124, column: 10, scope: !203)
!207 = !DILocalVariable(name: "inputBuffer", scope: !208, file: !15, line: 126, type: !24)
!208 = distinct !DILexicalBlock(scope: !203, file: !15, line: 125, column: 5)
!209 = !DILocation(line: 126, column: 14, scope: !208)
!210 = !DILocation(line: 128, column: 19, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !15, line: 128, column: 13)
!212 = !DILocation(line: 128, column: 49, scope: !211)
!213 = !DILocation(line: 128, column: 13, scope: !211)
!214 = !DILocation(line: 128, column: 56, scope: !211)
!215 = !DILocation(line: 128, column: 13, scope: !208)
!216 = !DILocation(line: 131, column: 25, scope: !217)
!217 = distinct !DILexicalBlock(scope: !211, file: !15, line: 129, column: 9)
!218 = !DILocation(line: 131, column: 20, scope: !217)
!219 = !DILocation(line: 131, column: 18, scope: !217)
!220 = !DILocation(line: 132, column: 9, scope: !217)
!221 = !DILocation(line: 135, column: 13, scope: !222)
!222 = distinct !DILexicalBlock(scope: !211, file: !15, line: 134, column: 9)
!223 = !DILocalVariable(name: "dataCopy", scope: !224, file: !15, line: 139, type: !5)
!224 = distinct !DILexicalBlock(scope: !203, file: !15, line: 138, column: 5)
!225 = !DILocation(line: 139, column: 13, scope: !224)
!226 = !DILocation(line: 139, column: 24, scope: !224)
!227 = !DILocalVariable(name: "data", scope: !224, file: !15, line: 140, type: !5)
!228 = !DILocation(line: 140, column: 13, scope: !224)
!229 = !DILocation(line: 140, column: 20, scope: !224)
!230 = !DILocalVariable(name: "i", scope: !231, file: !15, line: 142, type: !5)
!231 = distinct !DILexicalBlock(scope: !224, file: !15, line: 141, column: 9)
!232 = !DILocation(line: 142, column: 17, scope: !231)
!233 = !DILocalVariable(name: "buffer", scope: !231, file: !15, line: 143, type: !4)
!234 = !DILocation(line: 143, column: 19, scope: !231)
!235 = !DILocation(line: 143, column: 35, scope: !231)
!236 = !DILocation(line: 143, column: 28, scope: !231)
!237 = !DILocation(line: 144, column: 17, scope: !238)
!238 = distinct !DILexicalBlock(scope: !231, file: !15, line: 144, column: 17)
!239 = !DILocation(line: 144, column: 24, scope: !238)
!240 = !DILocation(line: 144, column: 17, scope: !231)
!241 = !DILocation(line: 144, column: 34, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !15, line: 144, column: 33)
!243 = !DILocation(line: 146, column: 20, scope: !244)
!244 = distinct !DILexicalBlock(scope: !231, file: !15, line: 146, column: 13)
!245 = !DILocation(line: 146, column: 18, scope: !244)
!246 = !DILocation(line: 146, column: 25, scope: !247)
!247 = distinct !DILexicalBlock(scope: !244, file: !15, line: 146, column: 13)
!248 = !DILocation(line: 146, column: 27, scope: !247)
!249 = !DILocation(line: 146, column: 13, scope: !244)
!250 = !DILocation(line: 148, column: 17, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !15, line: 147, column: 13)
!252 = !DILocation(line: 148, column: 24, scope: !251)
!253 = !DILocation(line: 148, column: 27, scope: !251)
!254 = !DILocation(line: 149, column: 13, scope: !251)
!255 = !DILocation(line: 146, column: 34, scope: !247)
!256 = !DILocation(line: 146, column: 13, scope: !247)
!257 = distinct !{!257, !249, !258, !78}
!258 = !DILocation(line: 149, column: 13, scope: !244)
!259 = !DILocation(line: 151, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !231, file: !15, line: 151, column: 17)
!261 = !DILocation(line: 151, column: 22, scope: !260)
!262 = !DILocation(line: 151, column: 27, scope: !260)
!263 = !DILocation(line: 151, column: 30, scope: !260)
!264 = !DILocation(line: 151, column: 35, scope: !260)
!265 = !DILocation(line: 151, column: 17, scope: !231)
!266 = !DILocation(line: 153, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !260, file: !15, line: 152, column: 13)
!268 = !DILocation(line: 153, column: 24, scope: !267)
!269 = !DILocation(line: 153, column: 30, scope: !267)
!270 = !DILocation(line: 155, column: 23, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !15, line: 155, column: 17)
!272 = !DILocation(line: 155, column: 21, scope: !271)
!273 = !DILocation(line: 155, column: 28, scope: !274)
!274 = distinct !DILexicalBlock(scope: !271, file: !15, line: 155, column: 17)
!275 = !DILocation(line: 155, column: 30, scope: !274)
!276 = !DILocation(line: 155, column: 17, scope: !271)
!277 = !DILocation(line: 157, column: 34, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !15, line: 156, column: 17)
!279 = !DILocation(line: 157, column: 41, scope: !278)
!280 = !DILocation(line: 157, column: 21, scope: !278)
!281 = !DILocation(line: 158, column: 17, scope: !278)
!282 = !DILocation(line: 155, column: 37, scope: !274)
!283 = !DILocation(line: 155, column: 17, scope: !274)
!284 = distinct !{!284, !276, !285, !78}
!285 = !DILocation(line: 158, column: 17, scope: !271)
!286 = !DILocation(line: 159, column: 13, scope: !267)
!287 = !DILocation(line: 162, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !260, file: !15, line: 161, column: 13)
!289 = !DILocation(line: 164, column: 18, scope: !231)
!290 = !DILocation(line: 164, column: 13, scope: !231)
!291 = !DILocation(line: 167, column: 1, scope: !203)
