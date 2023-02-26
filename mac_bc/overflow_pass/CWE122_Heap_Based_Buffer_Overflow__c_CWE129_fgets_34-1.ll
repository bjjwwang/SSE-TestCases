; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType = type { i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data3 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  store i32 -1, i32* %data, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !29, metadata !DIExpression()), !dbg !35
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !36
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !38
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !39
  %cmp = icmp ne i8* %call, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.else, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !42
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !44
  store i32 %call2, i32* %data, align 4, !dbg !45
  br label %if.end, !dbg !46

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !47
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !49
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !50
  store i32 %2, i32* %unionFirst, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !52, metadata !DIExpression()), !dbg !54
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !55
  %3 = load i32, i32* %unionSecond, align 4, !dbg !55
  store i32 %3, i32* %data3, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata i32* %i, metadata !56, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !59, metadata !DIExpression()), !dbg !60
  %call4 = call i8* @malloc(i64 noundef 40) #6, !dbg !61
  %4 = bitcast i8* %call4 to i32*, !dbg !62
  store i32* %4, i32** %buffer, align 8, !dbg !60
  %5 = load i32*, i32** %buffer, align 8, !dbg !63
  %cmp5 = icmp eq i32* %5, null, !dbg !65
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !66

if.then6:                                         ; preds = %if.end
  call void @exit(i32 noundef -1) #7, !dbg !67
  unreachable, !dbg !67

if.end7:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %if.end7
  %6 = load i32, i32* %i, align 4, !dbg !72
  %cmp8 = icmp slt i32 %6, 10, !dbg !74
  br i1 %cmp8, label %for.body, label %for.end, !dbg !75

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
  %10 = load i32, i32* %data3, align 4, !dbg !86
  %cmp9 = icmp sge i32 %10, 0, !dbg !88
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !89

if.then10:                                        ; preds = %for.end
  %11 = load i32*, i32** %buffer, align 8, !dbg !90
  %12 = load i32, i32* %data3, align 4, !dbg !92
  %idxprom11 = sext i32 %12 to i64, !dbg !90
  %arrayidx12 = getelementptr inbounds i32, i32* %11, i64 %idxprom11, !dbg !90
  store i32 1, i32* %arrayidx12, align 4, !dbg !93
  store i32 0, i32* %i, align 4, !dbg !94
  br label %for.cond13, !dbg !96

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %13 = load i32, i32* %i, align 4, !dbg !97
  %cmp14 = icmp slt i32 %13, 10, !dbg !99
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !100

for.body15:                                       ; preds = %for.cond13
  %14 = load i32*, i32** %buffer, align 8, !dbg !101
  %15 = load i32, i32* %i, align 4, !dbg !103
  %idxprom16 = sext i32 %15 to i64, !dbg !101
  %arrayidx17 = getelementptr inbounds i32, i32* %14, i64 %idxprom16, !dbg !101
  %16 = load i32, i32* %arrayidx17, align 4, !dbg !101
  call void @printIntLine(i32 noundef %16), !dbg !104
  br label %for.inc18, !dbg !105

for.inc18:                                        ; preds = %for.body15
  %17 = load i32, i32* %i, align 4, !dbg !106
  %inc19 = add nsw i32 %17, 1, !dbg !106
  store i32 %inc19, i32* %i, align 4, !dbg !106
  br label %for.cond13, !dbg !107, !llvm.loop !108

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !110

if.else21:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %18 = load i32*, i32** %buffer, align 8, !dbg !113
  %19 = bitcast i32* %18 to i8*, !dbg !113
  call void @free(i8* noundef %19), !dbg !114
  ret void, !dbg !115
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_good() #0 !dbg !116 {
entry:
  call void @goodG2B(), !dbg !117
  call void @goodB2G(), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !120 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !125, metadata !DIExpression()), !dbg !126
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !127, metadata !DIExpression()), !dbg !128
  %call = call i64 @time(i64* noundef null), !dbg !129
  %conv = trunc i64 %call to i32, !dbg !130
  call void @srand(i32 noundef %conv), !dbg !131
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !132
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_good(), !dbg !133
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !134
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !135
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_bad(), !dbg !136
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !137
  ret i32 0, !dbg !138
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !139 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion, metadata !142, metadata !DIExpression()), !dbg !143
  store i32 -1, i32* %data, align 4, !dbg !144
  store i32 7, i32* %data, align 4, !dbg !145
  %0 = load i32, i32* %data, align 4, !dbg !146
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !147
  store i32 %0, i32* %unionFirst, align 4, !dbg !148
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !149, metadata !DIExpression()), !dbg !151
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !152
  %1 = load i32, i32* %unionSecond, align 4, !dbg !152
  store i32 %1, i32* %data1, align 4, !dbg !151
  call void @llvm.dbg.declare(metadata i32* %i, metadata !153, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !156, metadata !DIExpression()), !dbg !157
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !158
  %2 = bitcast i8* %call to i32*, !dbg !159
  store i32* %2, i32** %buffer, align 8, !dbg !157
  %3 = load i32*, i32** %buffer, align 8, !dbg !160
  %cmp = icmp eq i32* %3, null, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !164
  unreachable, !dbg !164

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !169
  %cmp2 = icmp slt i32 %4, 10, !dbg !171
  br i1 %cmp2, label %for.body, label %for.end, !dbg !172

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !173
  %6 = load i32, i32* %i, align 4, !dbg !175
  %idxprom = sext i32 %6 to i64, !dbg !173
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !173
  store i32 0, i32* %arrayidx, align 4, !dbg !176
  br label %for.inc, !dbg !177

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !178
  %inc = add nsw i32 %7, 1, !dbg !178
  store i32 %inc, i32* %i, align 4, !dbg !178
  br label %for.cond, !dbg !179, !llvm.loop !180

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !182
  %cmp3 = icmp sge i32 %8, 0, !dbg !184
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !185

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !186
  %10 = load i32, i32* %data1, align 4, !dbg !188
  %idxprom5 = sext i32 %10 to i64, !dbg !186
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !186
  store i32 1, i32* %arrayidx6, align 4, !dbg !189
  store i32 0, i32* %i, align 4, !dbg !190
  br label %for.cond7, !dbg !192

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !193
  %cmp8 = icmp slt i32 %11, 10, !dbg !195
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !196

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !197
  %13 = load i32, i32* %i, align 4, !dbg !199
  %idxprom10 = sext i32 %13 to i64, !dbg !197
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !197
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !197
  call void @printIntLine(i32 noundef %14), !dbg !200
  br label %for.inc12, !dbg !201

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !202
  %inc13 = add nsw i32 %15, 1, !dbg !202
  store i32 %inc13, i32* %i, align 4, !dbg !202
  br label %for.cond7, !dbg !203, !llvm.loop !204

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !206

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !207
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !209
  %17 = bitcast i32* %16 to i8*, !dbg !209
  call void @free(i8* noundef %17), !dbg !210
  ret void, !dbg !211
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !212 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data3 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !213, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion, metadata !215, metadata !DIExpression()), !dbg !216
  store i32 -1, i32* %data, align 4, !dbg !217
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !218, metadata !DIExpression()), !dbg !220
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !220
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !220
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !221
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !223
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !224
  %cmp = icmp ne i8* %call, null, !dbg !225
  br i1 %cmp, label %if.then, label %if.else, !dbg !226

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !227
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !229
  store i32 %call2, i32* %data, align 4, !dbg !230
  br label %if.end, !dbg !231

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !232
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !234
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !235
  store i32 %2, i32* %unionFirst, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !237, metadata !DIExpression()), !dbg !239
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !240
  %3 = load i32, i32* %unionSecond, align 4, !dbg !240
  store i32 %3, i32* %data3, align 4, !dbg !239
  call void @llvm.dbg.declare(metadata i32* %i, metadata !241, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !244, metadata !DIExpression()), !dbg !245
  %call4 = call i8* @malloc(i64 noundef 40) #6, !dbg !246
  %4 = bitcast i8* %call4 to i32*, !dbg !247
  store i32* %4, i32** %buffer, align 8, !dbg !245
  %5 = load i32*, i32** %buffer, align 8, !dbg !248
  %cmp5 = icmp eq i32* %5, null, !dbg !250
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !251

if.then6:                                         ; preds = %if.end
  call void @exit(i32 noundef -1) #7, !dbg !252
  unreachable, !dbg !252

if.end7:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4, !dbg !254
  br label %for.cond, !dbg !256

for.cond:                                         ; preds = %for.inc, %if.end7
  %6 = load i32, i32* %i, align 4, !dbg !257
  %cmp8 = icmp slt i32 %6, 10, !dbg !259
  br i1 %cmp8, label %for.body, label %for.end, !dbg !260

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !261
  %8 = load i32, i32* %i, align 4, !dbg !263
  %idxprom = sext i32 %8 to i64, !dbg !261
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !261
  store i32 0, i32* %arrayidx, align 4, !dbg !264
  br label %for.inc, !dbg !265

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !266
  %inc = add nsw i32 %9, 1, !dbg !266
  store i32 %inc, i32* %i, align 4, !dbg !266
  br label %for.cond, !dbg !267, !llvm.loop !268

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data3, align 4, !dbg !270
  %cmp9 = icmp sge i32 %10, 0, !dbg !272
  br i1 %cmp9, label %land.lhs.true, label %if.else22, !dbg !273

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data3, align 4, !dbg !274
  %cmp10 = icmp slt i32 %11, 10, !dbg !275
  br i1 %cmp10, label %if.then11, label %if.else22, !dbg !276

if.then11:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !277
  %13 = load i32, i32* %data3, align 4, !dbg !279
  %idxprom12 = sext i32 %13 to i64, !dbg !277
  %arrayidx13 = getelementptr inbounds i32, i32* %12, i64 %idxprom12, !dbg !277
  store i32 1, i32* %arrayidx13, align 4, !dbg !280
  store i32 0, i32* %i, align 4, !dbg !281
  br label %for.cond14, !dbg !283

for.cond14:                                       ; preds = %for.inc19, %if.then11
  %14 = load i32, i32* %i, align 4, !dbg !284
  %cmp15 = icmp slt i32 %14, 10, !dbg !286
  br i1 %cmp15, label %for.body16, label %for.end21, !dbg !287

for.body16:                                       ; preds = %for.cond14
  %15 = load i32*, i32** %buffer, align 8, !dbg !288
  %16 = load i32, i32* %i, align 4, !dbg !290
  %idxprom17 = sext i32 %16 to i64, !dbg !288
  %arrayidx18 = getelementptr inbounds i32, i32* %15, i64 %idxprom17, !dbg !288
  %17 = load i32, i32* %arrayidx18, align 4, !dbg !288
  call void @printIntLine(i32 noundef %17), !dbg !291
  br label %for.inc19, !dbg !292

for.inc19:                                        ; preds = %for.body16
  %18 = load i32, i32* %i, align 4, !dbg !293
  %inc20 = add nsw i32 %18, 1, !dbg !293
  store i32 %inc20, i32* %i, align 4, !dbg !293
  br label %for.cond14, !dbg !294, !llvm.loop !295

for.end21:                                        ; preds = %for.cond14
  br label %if.end23, !dbg !297

if.else22:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !298
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %for.end21
  %19 = load i32*, i32** %buffer, align 8, !dbg !300
  %20 = bitcast i32* %19 to i8*, !dbg !300
  call void @free(i8* noundef %20), !dbg !301
  ret void, !dbg !302
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_bad", scope: !15, file: !15, line: 30, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 32, type: !5)
!20 = !DILocation(line: 32, column: 9, scope: !14)
!21 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 33, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_unionType", file: !15, line: 26, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 22, size: 32, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !15, line: 24, baseType: !5, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !15, line: 25, baseType: !5, size: 32)
!27 = !DILocation(line: 33, column: 68, scope: !14)
!28 = !DILocation(line: 35, column: 10, scope: !14)
!29 = !DILocalVariable(name: "inputBuffer", scope: !30, file: !15, line: 37, type: !31)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 112, elements: !33)
!32 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!33 = !{!34}
!34 = !DISubrange(count: 14)
!35 = !DILocation(line: 37, column: 14, scope: !30)
!36 = !DILocation(line: 39, column: 19, scope: !37)
!37 = distinct !DILexicalBlock(scope: !30, file: !15, line: 39, column: 13)
!38 = !DILocation(line: 39, column: 49, scope: !37)
!39 = !DILocation(line: 39, column: 13, scope: !37)
!40 = !DILocation(line: 39, column: 56, scope: !37)
!41 = !DILocation(line: 39, column: 13, scope: !30)
!42 = !DILocation(line: 42, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !15, line: 40, column: 9)
!44 = !DILocation(line: 42, column: 20, scope: !43)
!45 = !DILocation(line: 42, column: 18, scope: !43)
!46 = !DILocation(line: 43, column: 9, scope: !43)
!47 = !DILocation(line: 46, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !37, file: !15, line: 45, column: 9)
!49 = !DILocation(line: 49, column: 26, scope: !14)
!50 = !DILocation(line: 49, column: 13, scope: !14)
!51 = !DILocation(line: 49, column: 24, scope: !14)
!52 = !DILocalVariable(name: "data", scope: !53, file: !15, line: 51, type: !5)
!53 = distinct !DILexicalBlock(scope: !14, file: !15, line: 50, column: 5)
!54 = !DILocation(line: 51, column: 13, scope: !53)
!55 = !DILocation(line: 51, column: 28, scope: !53)
!56 = !DILocalVariable(name: "i", scope: !57, file: !15, line: 53, type: !5)
!57 = distinct !DILexicalBlock(scope: !53, file: !15, line: 52, column: 9)
!58 = !DILocation(line: 53, column: 17, scope: !57)
!59 = !DILocalVariable(name: "buffer", scope: !57, file: !15, line: 54, type: !4)
!60 = !DILocation(line: 54, column: 19, scope: !57)
!61 = !DILocation(line: 54, column: 35, scope: !57)
!62 = !DILocation(line: 54, column: 28, scope: !57)
!63 = !DILocation(line: 55, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !57, file: !15, line: 55, column: 17)
!65 = !DILocation(line: 55, column: 24, scope: !64)
!66 = !DILocation(line: 55, column: 17, scope: !57)
!67 = !DILocation(line: 55, column: 34, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 55, column: 33)
!69 = !DILocation(line: 57, column: 20, scope: !70)
!70 = distinct !DILexicalBlock(scope: !57, file: !15, line: 57, column: 13)
!71 = !DILocation(line: 57, column: 18, scope: !70)
!72 = !DILocation(line: 57, column: 25, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !15, line: 57, column: 13)
!74 = !DILocation(line: 57, column: 27, scope: !73)
!75 = !DILocation(line: 57, column: 13, scope: !70)
!76 = !DILocation(line: 59, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !15, line: 58, column: 13)
!78 = !DILocation(line: 59, column: 24, scope: !77)
!79 = !DILocation(line: 59, column: 27, scope: !77)
!80 = !DILocation(line: 60, column: 13, scope: !77)
!81 = !DILocation(line: 57, column: 34, scope: !73)
!82 = !DILocation(line: 57, column: 13, scope: !73)
!83 = distinct !{!83, !75, !84, !85}
!84 = !DILocation(line: 60, column: 13, scope: !70)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 63, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !57, file: !15, line: 63, column: 17)
!88 = !DILocation(line: 63, column: 22, scope: !87)
!89 = !DILocation(line: 63, column: 17, scope: !57)
!90 = !DILocation(line: 65, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 64, column: 13)
!92 = !DILocation(line: 65, column: 24, scope: !91)
!93 = !DILocation(line: 65, column: 30, scope: !91)
!94 = !DILocation(line: 67, column: 23, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 67, column: 17)
!96 = !DILocation(line: 67, column: 21, scope: !95)
!97 = !DILocation(line: 67, column: 28, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !15, line: 67, column: 17)
!99 = !DILocation(line: 67, column: 30, scope: !98)
!100 = !DILocation(line: 67, column: 17, scope: !95)
!101 = !DILocation(line: 69, column: 34, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 68, column: 17)
!103 = !DILocation(line: 69, column: 41, scope: !102)
!104 = !DILocation(line: 69, column: 21, scope: !102)
!105 = !DILocation(line: 70, column: 17, scope: !102)
!106 = !DILocation(line: 67, column: 37, scope: !98)
!107 = !DILocation(line: 67, column: 17, scope: !98)
!108 = distinct !{!108, !100, !109, !85}
!109 = !DILocation(line: 70, column: 17, scope: !95)
!110 = !DILocation(line: 71, column: 13, scope: !91)
!111 = !DILocation(line: 74, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !87, file: !15, line: 73, column: 13)
!113 = !DILocation(line: 76, column: 18, scope: !57)
!114 = !DILocation(line: 76, column: 13, scope: !57)
!115 = !DILocation(line: 79, column: 1, scope: !14)
!116 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_34_good", scope: !15, file: !15, line: 178, type: !16, scopeLine: 179, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!117 = !DILocation(line: 180, column: 5, scope: !116)
!118 = !DILocation(line: 181, column: 5, scope: !116)
!119 = !DILocation(line: 182, column: 1, scope: !116)
!120 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 192, type: !121, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!121 = !DISubroutineType(types: !122)
!122 = !{!5, !5, !123}
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!125 = !DILocalVariable(name: "argc", arg: 1, scope: !120, file: !15, line: 192, type: !5)
!126 = !DILocation(line: 192, column: 14, scope: !120)
!127 = !DILocalVariable(name: "argv", arg: 2, scope: !120, file: !15, line: 192, type: !123)
!128 = !DILocation(line: 192, column: 27, scope: !120)
!129 = !DILocation(line: 195, column: 22, scope: !120)
!130 = !DILocation(line: 195, column: 12, scope: !120)
!131 = !DILocation(line: 195, column: 5, scope: !120)
!132 = !DILocation(line: 197, column: 5, scope: !120)
!133 = !DILocation(line: 198, column: 5, scope: !120)
!134 = !DILocation(line: 199, column: 5, scope: !120)
!135 = !DILocation(line: 202, column: 5, scope: !120)
!136 = !DILocation(line: 203, column: 5, scope: !120)
!137 = !DILocation(line: 204, column: 5, scope: !120)
!138 = !DILocation(line: 206, column: 5, scope: !120)
!139 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!140 = !DILocalVariable(name: "data", scope: !139, file: !15, line: 88, type: !5)
!141 = !DILocation(line: 88, column: 9, scope: !139)
!142 = !DILocalVariable(name: "myUnion", scope: !139, file: !15, line: 89, type: !22)
!143 = !DILocation(line: 89, column: 68, scope: !139)
!144 = !DILocation(line: 91, column: 10, scope: !139)
!145 = !DILocation(line: 94, column: 10, scope: !139)
!146 = !DILocation(line: 95, column: 26, scope: !139)
!147 = !DILocation(line: 95, column: 13, scope: !139)
!148 = !DILocation(line: 95, column: 24, scope: !139)
!149 = !DILocalVariable(name: "data", scope: !150, file: !15, line: 97, type: !5)
!150 = distinct !DILexicalBlock(scope: !139, file: !15, line: 96, column: 5)
!151 = !DILocation(line: 97, column: 13, scope: !150)
!152 = !DILocation(line: 97, column: 28, scope: !150)
!153 = !DILocalVariable(name: "i", scope: !154, file: !15, line: 99, type: !5)
!154 = distinct !DILexicalBlock(scope: !150, file: !15, line: 98, column: 9)
!155 = !DILocation(line: 99, column: 17, scope: !154)
!156 = !DILocalVariable(name: "buffer", scope: !154, file: !15, line: 100, type: !4)
!157 = !DILocation(line: 100, column: 19, scope: !154)
!158 = !DILocation(line: 100, column: 35, scope: !154)
!159 = !DILocation(line: 100, column: 28, scope: !154)
!160 = !DILocation(line: 101, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !15, line: 101, column: 17)
!162 = !DILocation(line: 101, column: 24, scope: !161)
!163 = !DILocation(line: 101, column: 17, scope: !154)
!164 = !DILocation(line: 101, column: 34, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !15, line: 101, column: 33)
!166 = !DILocation(line: 103, column: 20, scope: !167)
!167 = distinct !DILexicalBlock(scope: !154, file: !15, line: 103, column: 13)
!168 = !DILocation(line: 103, column: 18, scope: !167)
!169 = !DILocation(line: 103, column: 25, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !15, line: 103, column: 13)
!171 = !DILocation(line: 103, column: 27, scope: !170)
!172 = !DILocation(line: 103, column: 13, scope: !167)
!173 = !DILocation(line: 105, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !15, line: 104, column: 13)
!175 = !DILocation(line: 105, column: 24, scope: !174)
!176 = !DILocation(line: 105, column: 27, scope: !174)
!177 = !DILocation(line: 106, column: 13, scope: !174)
!178 = !DILocation(line: 103, column: 34, scope: !170)
!179 = !DILocation(line: 103, column: 13, scope: !170)
!180 = distinct !{!180, !172, !181, !85}
!181 = !DILocation(line: 106, column: 13, scope: !167)
!182 = !DILocation(line: 109, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !154, file: !15, line: 109, column: 17)
!184 = !DILocation(line: 109, column: 22, scope: !183)
!185 = !DILocation(line: 109, column: 17, scope: !154)
!186 = !DILocation(line: 111, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !15, line: 110, column: 13)
!188 = !DILocation(line: 111, column: 24, scope: !187)
!189 = !DILocation(line: 111, column: 30, scope: !187)
!190 = !DILocation(line: 113, column: 23, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !15, line: 113, column: 17)
!192 = !DILocation(line: 113, column: 21, scope: !191)
!193 = !DILocation(line: 113, column: 28, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !15, line: 113, column: 17)
!195 = !DILocation(line: 113, column: 30, scope: !194)
!196 = !DILocation(line: 113, column: 17, scope: !191)
!197 = !DILocation(line: 115, column: 34, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !15, line: 114, column: 17)
!199 = !DILocation(line: 115, column: 41, scope: !198)
!200 = !DILocation(line: 115, column: 21, scope: !198)
!201 = !DILocation(line: 116, column: 17, scope: !198)
!202 = !DILocation(line: 113, column: 37, scope: !194)
!203 = !DILocation(line: 113, column: 17, scope: !194)
!204 = distinct !{!204, !196, !205, !85}
!205 = !DILocation(line: 116, column: 17, scope: !191)
!206 = !DILocation(line: 117, column: 13, scope: !187)
!207 = !DILocation(line: 120, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !183, file: !15, line: 119, column: 13)
!209 = !DILocation(line: 122, column: 18, scope: !154)
!210 = !DILocation(line: 122, column: 13, scope: !154)
!211 = !DILocation(line: 125, column: 1, scope: !139)
!212 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 128, type: !16, scopeLine: 129, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!213 = !DILocalVariable(name: "data", scope: !212, file: !15, line: 130, type: !5)
!214 = !DILocation(line: 130, column: 9, scope: !212)
!215 = !DILocalVariable(name: "myUnion", scope: !212, file: !15, line: 131, type: !22)
!216 = !DILocation(line: 131, column: 68, scope: !212)
!217 = !DILocation(line: 133, column: 10, scope: !212)
!218 = !DILocalVariable(name: "inputBuffer", scope: !219, file: !15, line: 135, type: !31)
!219 = distinct !DILexicalBlock(scope: !212, file: !15, line: 134, column: 5)
!220 = !DILocation(line: 135, column: 14, scope: !219)
!221 = !DILocation(line: 137, column: 19, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !15, line: 137, column: 13)
!223 = !DILocation(line: 137, column: 49, scope: !222)
!224 = !DILocation(line: 137, column: 13, scope: !222)
!225 = !DILocation(line: 137, column: 56, scope: !222)
!226 = !DILocation(line: 137, column: 13, scope: !219)
!227 = !DILocation(line: 140, column: 25, scope: !228)
!228 = distinct !DILexicalBlock(scope: !222, file: !15, line: 138, column: 9)
!229 = !DILocation(line: 140, column: 20, scope: !228)
!230 = !DILocation(line: 140, column: 18, scope: !228)
!231 = !DILocation(line: 141, column: 9, scope: !228)
!232 = !DILocation(line: 144, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !222, file: !15, line: 143, column: 9)
!234 = !DILocation(line: 147, column: 26, scope: !212)
!235 = !DILocation(line: 147, column: 13, scope: !212)
!236 = !DILocation(line: 147, column: 24, scope: !212)
!237 = !DILocalVariable(name: "data", scope: !238, file: !15, line: 149, type: !5)
!238 = distinct !DILexicalBlock(scope: !212, file: !15, line: 148, column: 5)
!239 = !DILocation(line: 149, column: 13, scope: !238)
!240 = !DILocation(line: 149, column: 28, scope: !238)
!241 = !DILocalVariable(name: "i", scope: !242, file: !15, line: 151, type: !5)
!242 = distinct !DILexicalBlock(scope: !238, file: !15, line: 150, column: 9)
!243 = !DILocation(line: 151, column: 17, scope: !242)
!244 = !DILocalVariable(name: "buffer", scope: !242, file: !15, line: 152, type: !4)
!245 = !DILocation(line: 152, column: 19, scope: !242)
!246 = !DILocation(line: 152, column: 35, scope: !242)
!247 = !DILocation(line: 152, column: 28, scope: !242)
!248 = !DILocation(line: 153, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !242, file: !15, line: 153, column: 17)
!250 = !DILocation(line: 153, column: 24, scope: !249)
!251 = !DILocation(line: 153, column: 17, scope: !242)
!252 = !DILocation(line: 153, column: 34, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !15, line: 153, column: 33)
!254 = !DILocation(line: 155, column: 20, scope: !255)
!255 = distinct !DILexicalBlock(scope: !242, file: !15, line: 155, column: 13)
!256 = !DILocation(line: 155, column: 18, scope: !255)
!257 = !DILocation(line: 155, column: 25, scope: !258)
!258 = distinct !DILexicalBlock(scope: !255, file: !15, line: 155, column: 13)
!259 = !DILocation(line: 155, column: 27, scope: !258)
!260 = !DILocation(line: 155, column: 13, scope: !255)
!261 = !DILocation(line: 157, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !15, line: 156, column: 13)
!263 = !DILocation(line: 157, column: 24, scope: !262)
!264 = !DILocation(line: 157, column: 27, scope: !262)
!265 = !DILocation(line: 158, column: 13, scope: !262)
!266 = !DILocation(line: 155, column: 34, scope: !258)
!267 = !DILocation(line: 155, column: 13, scope: !258)
!268 = distinct !{!268, !260, !269, !85}
!269 = !DILocation(line: 158, column: 13, scope: !255)
!270 = !DILocation(line: 160, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !242, file: !15, line: 160, column: 17)
!272 = !DILocation(line: 160, column: 22, scope: !271)
!273 = !DILocation(line: 160, column: 27, scope: !271)
!274 = !DILocation(line: 160, column: 30, scope: !271)
!275 = !DILocation(line: 160, column: 35, scope: !271)
!276 = !DILocation(line: 160, column: 17, scope: !242)
!277 = !DILocation(line: 162, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !271, file: !15, line: 161, column: 13)
!279 = !DILocation(line: 162, column: 24, scope: !278)
!280 = !DILocation(line: 162, column: 30, scope: !278)
!281 = !DILocation(line: 164, column: 23, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !15, line: 164, column: 17)
!283 = !DILocation(line: 164, column: 21, scope: !282)
!284 = !DILocation(line: 164, column: 28, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !15, line: 164, column: 17)
!286 = !DILocation(line: 164, column: 30, scope: !285)
!287 = !DILocation(line: 164, column: 17, scope: !282)
!288 = !DILocation(line: 166, column: 34, scope: !289)
!289 = distinct !DILexicalBlock(scope: !285, file: !15, line: 165, column: 17)
!290 = !DILocation(line: 166, column: 41, scope: !289)
!291 = !DILocation(line: 166, column: 21, scope: !289)
!292 = !DILocation(line: 167, column: 17, scope: !289)
!293 = !DILocation(line: 164, column: 37, scope: !285)
!294 = !DILocation(line: 164, column: 17, scope: !285)
!295 = distinct !{!295, !287, !296, !85}
!296 = !DILocation(line: 167, column: 17, scope: !282)
!297 = !DILocation(line: 168, column: 13, scope: !278)
!298 = !DILocation(line: 171, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !271, file: !15, line: 170, column: 13)
!300 = !DILocation(line: 173, column: 18, scope: !242)
!301 = !DILocation(line: 173, column: 13, scope: !242)
!302 = !DILocation(line: 176, column: 1, scope: !212)
