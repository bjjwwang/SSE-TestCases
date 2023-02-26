; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05-1.c"
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
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_bad() #0 !dbg !19 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  %0 = load i32, i32* @staticTrue, align 4, !dbg !26
  %tobool = icmp ne i32 %0, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end4, !dbg !28

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !29, metadata !DIExpression()), !dbg !36
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !39
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !40
  %cmp = icmp ne i8* %call, null, !dbg !41
  br i1 %cmp, label %if.then1, label %if.else, !dbg !42

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !43
  %call3 = call i32 @atoi(i8* noundef %arraydecay2), !dbg !45
  store i32 %call3, i32* %data, align 4, !dbg !46
  br label %if.end, !dbg !47

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !48
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !50

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticTrue, align 4, !dbg !51
  %tobool5 = icmp ne i32 %3, 0, !dbg !51
  br i1 %tobool5, label %if.then6, label %if.end14, !dbg !53

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !54, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !58, metadata !DIExpression()), !dbg !62
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !62
  %5 = load i32, i32* %data, align 4, !dbg !63
  %cmp7 = icmp sge i32 %5, 0, !dbg !65
  br i1 %cmp7, label %if.then8, label %if.else12, !dbg !66

if.then8:                                         ; preds = %if.then6
  %6 = load i32, i32* %data, align 4, !dbg !67
  %idxprom = sext i32 %6 to i64, !dbg !69
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !69
  store i32 1, i32* %arrayidx, align 4, !dbg !70
  store i32 0, i32* %i, align 4, !dbg !71
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %if.then8
  %7 = load i32, i32* %i, align 4, !dbg !74
  %cmp9 = icmp slt i32 %7, 10, !dbg !76
  br i1 %cmp9, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !78
  %idxprom10 = sext i32 %8 to i64, !dbg !80
  %arrayidx11 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom10, !dbg !80
  %9 = load i32, i32* %arrayidx11, align 4, !dbg !80
  call void @printIntLine(i32 noundef %9), !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !83
  %inc = add nsw i32 %10, 1, !dbg !83
  store i32 %inc, i32* %i, align 4, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  br label %if.end13, !dbg !88

if.else12:                                        ; preds = %if.then6
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %for.end
  br label %if.end14, !dbg !91

if.end14:                                         ; preds = %if.end13, %if.end4
  ret void, !dbg !92
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_good() #0 !dbg !93 {
entry:
  call void @goodB2G1(), !dbg !94
  call void @goodB2G2(), !dbg !95
  call void @goodG2B1(), !dbg !96
  call void @goodG2B2(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i64 @time(i64* noundef null), !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 noundef %conv), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_good(), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_bad(), !dbg !115
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !118 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i32 -1, i32* %data, align 4, !dbg !121
  %0 = load i32, i32* @staticTrue, align 4, !dbg !122
  %tobool = icmp ne i32 %0, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.end4, !dbg !124

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !125, metadata !DIExpression()), !dbg !128
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !128
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !129
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !131
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !132
  %cmp = icmp ne i8* %call, null, !dbg !133
  br i1 %cmp, label %if.then1, label %if.else, !dbg !134

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !135
  %call3 = call i32 @atoi(i8* noundef %arraydecay2), !dbg !137
  store i32 %call3, i32* %data, align 4, !dbg !138
  br label %if.end, !dbg !139

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !140
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !142

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticFalse, align 4, !dbg !143
  %tobool5 = icmp ne i32 %3, 0, !dbg !143
  br i1 %tobool5, label %if.then6, label %if.else7, !dbg !145

if.then6:                                         ; preds = %if.end4
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !146
  br label %if.end16, !dbg !148

if.else7:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !149, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !153, metadata !DIExpression()), !dbg !154
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !154
  %5 = load i32, i32* %data, align 4, !dbg !155
  %cmp8 = icmp sge i32 %5, 0, !dbg !157
  br i1 %cmp8, label %land.lhs.true, label %if.else14, !dbg !158

land.lhs.true:                                    ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !159
  %cmp9 = icmp slt i32 %6, 10, !dbg !160
  br i1 %cmp9, label %if.then10, label %if.else14, !dbg !161

if.then10:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !162
  %idxprom = sext i32 %7 to i64, !dbg !164
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !164
  store i32 1, i32* %arrayidx, align 4, !dbg !165
  store i32 0, i32* %i, align 4, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %if.then10
  %8 = load i32, i32* %i, align 4, !dbg !169
  %cmp11 = icmp slt i32 %8, 10, !dbg !171
  br i1 %cmp11, label %for.body, label %for.end, !dbg !172

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !173
  %idxprom12 = sext i32 %9 to i64, !dbg !175
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom12, !dbg !175
  %10 = load i32, i32* %arrayidx13, align 4, !dbg !175
  call void @printIntLine(i32 noundef %10), !dbg !176
  br label %for.inc, !dbg !177

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !178
  %inc = add nsw i32 %11, 1, !dbg !178
  store i32 %inc, i32* %i, align 4, !dbg !178
  br label %for.cond, !dbg !179, !llvm.loop !180

for.end:                                          ; preds = %for.cond
  br label %if.end15, !dbg !182

if.else14:                                        ; preds = %land.lhs.true, %if.else7
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !183
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %for.end
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.then6
  ret void, !dbg !185
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !186 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !187, metadata !DIExpression()), !dbg !188
  store i32 -1, i32* %data, align 4, !dbg !189
  %0 = load i32, i32* @staticTrue, align 4, !dbg !190
  %tobool = icmp ne i32 %0, 0, !dbg !190
  br i1 %tobool, label %if.then, label %if.end4, !dbg !192

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !193, metadata !DIExpression()), !dbg !196
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !196
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !196
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !197
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !199
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !200
  %cmp = icmp ne i8* %call, null, !dbg !201
  br i1 %cmp, label %if.then1, label %if.else, !dbg !202

if.then1:                                         ; preds = %if.then
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !203
  %call3 = call i32 @atoi(i8* noundef %arraydecay2), !dbg !205
  store i32 %call3, i32* %data, align 4, !dbg !206
  br label %if.end, !dbg !207

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !208
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4, !dbg !210

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @staticTrue, align 4, !dbg !211
  %tobool5 = icmp ne i32 %3, 0, !dbg !211
  br i1 %tobool5, label %if.then6, label %if.end15, !dbg !213

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !214, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !218, metadata !DIExpression()), !dbg !219
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !219
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !219
  %5 = load i32, i32* %data, align 4, !dbg !220
  %cmp7 = icmp sge i32 %5, 0, !dbg !222
  br i1 %cmp7, label %land.lhs.true, label %if.else13, !dbg !223

land.lhs.true:                                    ; preds = %if.then6
  %6 = load i32, i32* %data, align 4, !dbg !224
  %cmp8 = icmp slt i32 %6, 10, !dbg !225
  br i1 %cmp8, label %if.then9, label %if.else13, !dbg !226

if.then9:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !227
  %idxprom = sext i32 %7 to i64, !dbg !229
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !229
  store i32 1, i32* %arrayidx, align 4, !dbg !230
  store i32 0, i32* %i, align 4, !dbg !231
  br label %for.cond, !dbg !233

for.cond:                                         ; preds = %for.inc, %if.then9
  %8 = load i32, i32* %i, align 4, !dbg !234
  %cmp10 = icmp slt i32 %8, 10, !dbg !236
  br i1 %cmp10, label %for.body, label %for.end, !dbg !237

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !238
  %idxprom11 = sext i32 %9 to i64, !dbg !240
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom11, !dbg !240
  %10 = load i32, i32* %arrayidx12, align 4, !dbg !240
  call void @printIntLine(i32 noundef %10), !dbg !241
  br label %for.inc, !dbg !242

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !243
  %inc = add nsw i32 %11, 1, !dbg !243
  store i32 %inc, i32* %i, align 4, !dbg !243
  br label %for.cond, !dbg !244, !llvm.loop !245

for.end:                                          ; preds = %for.cond
  br label %if.end14, !dbg !247

if.else13:                                        ; preds = %land.lhs.true, %if.then6
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !248
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %for.end
  br label %if.end15, !dbg !250

if.end15:                                         ; preds = %if.end14, %if.end4
  ret void, !dbg !251
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !252 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 -1, i32* %data, align 4, !dbg !255
  %0 = load i32, i32* @staticFalse, align 4, !dbg !256
  %tobool = icmp ne i32 %0, 0, !dbg !256
  br i1 %tobool, label %if.then, label %if.else, !dbg !258

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !259
  br label %if.end, !dbg !261

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !262
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !264
  %tobool1 = icmp ne i32 %1, 0, !dbg !264
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !266

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !267, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !271, metadata !DIExpression()), !dbg !272
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !272
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !272
  %3 = load i32, i32* %data, align 4, !dbg !273
  %cmp = icmp sge i32 %3, 0, !dbg !275
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !276

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !277
  %idxprom = sext i32 %4 to i64, !dbg !279
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !279
  store i32 1, i32* %arrayidx, align 4, !dbg !280
  store i32 0, i32* %i, align 4, !dbg !281
  br label %for.cond, !dbg !283

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !284
  %cmp4 = icmp slt i32 %5, 10, !dbg !286
  br i1 %cmp4, label %for.body, label %for.end, !dbg !287

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !288
  %idxprom5 = sext i32 %6 to i64, !dbg !290
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !290
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !290
  call void @printIntLine(i32 noundef %7), !dbg !291
  br label %for.inc, !dbg !292

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !293
  %inc = add nsw i32 %8, 1, !dbg !293
  store i32 %inc, i32* %i, align 4, !dbg !293
  br label %for.cond, !dbg !294, !llvm.loop !295

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !297

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !298
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !300

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !301
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !302 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !303, metadata !DIExpression()), !dbg !304
  store i32 -1, i32* %data, align 4, !dbg !305
  %0 = load i32, i32* @staticTrue, align 4, !dbg !306
  %tobool = icmp ne i32 %0, 0, !dbg !306
  br i1 %tobool, label %if.then, label %if.end, !dbg !308

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !309
  br label %if.end, !dbg !311

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !312
  %tobool1 = icmp ne i32 %1, 0, !dbg !312
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !314

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !315, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !319, metadata !DIExpression()), !dbg !320
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !320
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !320
  %3 = load i32, i32* %data, align 4, !dbg !321
  %cmp = icmp sge i32 %3, 0, !dbg !323
  br i1 %cmp, label %if.then3, label %if.else, !dbg !324

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !325
  %idxprom = sext i32 %4 to i64, !dbg !327
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !327
  store i32 1, i32* %arrayidx, align 4, !dbg !328
  store i32 0, i32* %i, align 4, !dbg !329
  br label %for.cond, !dbg !331

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !332
  %cmp4 = icmp slt i32 %5, 10, !dbg !334
  br i1 %cmp4, label %for.body, label %for.end, !dbg !335

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !336
  %idxprom5 = sext i32 %6 to i64, !dbg !338
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !338
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !338
  call void @printIntLine(i32 noundef %7), !dbg !339
  br label %for.inc, !dbg !340

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !341
  %inc = add nsw i32 %8, 1, !dbg !341
  store i32 %inc, i32* %i, align 4, !dbg !341
  br label %for.cond, !dbg !342, !llvm.loop !343

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !345

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !346
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !348

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !349
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !7, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !6}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_bad", scope: !10, file: !10, line: 30, type: !20, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 32, type: !11)
!24 = !DILocation(line: 32, column: 9, scope: !19)
!25 = !DILocation(line: 34, column: 10, scope: !19)
!26 = !DILocation(line: 35, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !19, file: !10, line: 35, column: 8)
!28 = !DILocation(line: 35, column: 8, scope: !19)
!29 = !DILocalVariable(name: "inputBuffer", scope: !30, file: !10, line: 38, type: !32)
!30 = distinct !DILexicalBlock(scope: !31, file: !10, line: 37, column: 9)
!31 = distinct !DILexicalBlock(scope: !27, file: !10, line: 36, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 112, elements: !34)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !{!35}
!35 = !DISubrange(count: 14)
!36 = !DILocation(line: 38, column: 18, scope: !30)
!37 = !DILocation(line: 40, column: 23, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !10, line: 40, column: 17)
!39 = !DILocation(line: 40, column: 53, scope: !38)
!40 = !DILocation(line: 40, column: 17, scope: !38)
!41 = !DILocation(line: 40, column: 60, scope: !38)
!42 = !DILocation(line: 40, column: 17, scope: !30)
!43 = !DILocation(line: 43, column: 29, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !10, line: 41, column: 13)
!45 = !DILocation(line: 43, column: 24, scope: !44)
!46 = !DILocation(line: 43, column: 22, scope: !44)
!47 = !DILocation(line: 44, column: 13, scope: !44)
!48 = !DILocation(line: 47, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !10, line: 46, column: 13)
!50 = !DILocation(line: 50, column: 5, scope: !31)
!51 = !DILocation(line: 51, column: 8, scope: !52)
!52 = distinct !DILexicalBlock(scope: !19, file: !10, line: 51, column: 8)
!53 = !DILocation(line: 51, column: 8, scope: !19)
!54 = !DILocalVariable(name: "i", scope: !55, file: !10, line: 54, type: !11)
!55 = distinct !DILexicalBlock(scope: !56, file: !10, line: 53, column: 9)
!56 = distinct !DILexicalBlock(scope: !52, file: !10, line: 52, column: 5)
!57 = !DILocation(line: 54, column: 17, scope: !55)
!58 = !DILocalVariable(name: "buffer", scope: !55, file: !10, line: 55, type: !59)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 10)
!62 = !DILocation(line: 55, column: 17, scope: !55)
!63 = !DILocation(line: 58, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !55, file: !10, line: 58, column: 17)
!65 = !DILocation(line: 58, column: 22, scope: !64)
!66 = !DILocation(line: 58, column: 17, scope: !55)
!67 = !DILocation(line: 60, column: 24, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !10, line: 59, column: 13)
!69 = !DILocation(line: 60, column: 17, scope: !68)
!70 = !DILocation(line: 60, column: 30, scope: !68)
!71 = !DILocation(line: 62, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !10, line: 62, column: 17)
!73 = !DILocation(line: 62, column: 21, scope: !72)
!74 = !DILocation(line: 62, column: 28, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !10, line: 62, column: 17)
!76 = !DILocation(line: 62, column: 30, scope: !75)
!77 = !DILocation(line: 62, column: 17, scope: !72)
!78 = !DILocation(line: 64, column: 41, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !10, line: 63, column: 17)
!80 = !DILocation(line: 64, column: 34, scope: !79)
!81 = !DILocation(line: 64, column: 21, scope: !79)
!82 = !DILocation(line: 65, column: 17, scope: !79)
!83 = !DILocation(line: 62, column: 37, scope: !75)
!84 = !DILocation(line: 62, column: 17, scope: !75)
!85 = distinct !{!85, !77, !86, !87}
!86 = !DILocation(line: 65, column: 17, scope: !72)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocation(line: 66, column: 13, scope: !68)
!89 = !DILocation(line: 69, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !64, file: !10, line: 68, column: 13)
!91 = !DILocation(line: 72, column: 5, scope: !56)
!92 = !DILocation(line: 73, column: 1, scope: !19)
!93 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_05_good", scope: !10, file: !10, line: 251, type: !20, scopeLine: 252, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!94 = !DILocation(line: 253, column: 5, scope: !93)
!95 = !DILocation(line: 254, column: 5, scope: !93)
!96 = !DILocation(line: 255, column: 5, scope: !93)
!97 = !DILocation(line: 256, column: 5, scope: !93)
!98 = !DILocation(line: 257, column: 1, scope: !93)
!99 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 268, type: !100, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!100 = !DISubroutineType(types: !101)
!101 = !{!11, !11, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !10, line: 268, type: !11)
!105 = !DILocation(line: 268, column: 14, scope: !99)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !10, line: 268, type: !102)
!107 = !DILocation(line: 268, column: 27, scope: !99)
!108 = !DILocation(line: 271, column: 22, scope: !99)
!109 = !DILocation(line: 271, column: 12, scope: !99)
!110 = !DILocation(line: 271, column: 5, scope: !99)
!111 = !DILocation(line: 273, column: 5, scope: !99)
!112 = !DILocation(line: 274, column: 5, scope: !99)
!113 = !DILocation(line: 275, column: 5, scope: !99)
!114 = !DILocation(line: 278, column: 5, scope: !99)
!115 = !DILocation(line: 279, column: 5, scope: !99)
!116 = !DILocation(line: 280, column: 5, scope: !99)
!117 = !DILocation(line: 282, column: 5, scope: !99)
!118 = distinct !DISubprogram(name: "goodB2G1", scope: !10, file: !10, line: 80, type: !20, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!119 = !DILocalVariable(name: "data", scope: !118, file: !10, line: 82, type: !11)
!120 = !DILocation(line: 82, column: 9, scope: !118)
!121 = !DILocation(line: 84, column: 10, scope: !118)
!122 = !DILocation(line: 85, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !10, line: 85, column: 8)
!124 = !DILocation(line: 85, column: 8, scope: !118)
!125 = !DILocalVariable(name: "inputBuffer", scope: !126, file: !10, line: 88, type: !32)
!126 = distinct !DILexicalBlock(scope: !127, file: !10, line: 87, column: 9)
!127 = distinct !DILexicalBlock(scope: !123, file: !10, line: 86, column: 5)
!128 = !DILocation(line: 88, column: 18, scope: !126)
!129 = !DILocation(line: 90, column: 23, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !10, line: 90, column: 17)
!131 = !DILocation(line: 90, column: 53, scope: !130)
!132 = !DILocation(line: 90, column: 17, scope: !130)
!133 = !DILocation(line: 90, column: 60, scope: !130)
!134 = !DILocation(line: 90, column: 17, scope: !126)
!135 = !DILocation(line: 93, column: 29, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !10, line: 91, column: 13)
!137 = !DILocation(line: 93, column: 24, scope: !136)
!138 = !DILocation(line: 93, column: 22, scope: !136)
!139 = !DILocation(line: 94, column: 13, scope: !136)
!140 = !DILocation(line: 97, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !130, file: !10, line: 96, column: 13)
!142 = !DILocation(line: 100, column: 5, scope: !127)
!143 = !DILocation(line: 101, column: 8, scope: !144)
!144 = distinct !DILexicalBlock(scope: !118, file: !10, line: 101, column: 8)
!145 = !DILocation(line: 101, column: 8, scope: !118)
!146 = !DILocation(line: 104, column: 9, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !10, line: 102, column: 5)
!148 = !DILocation(line: 105, column: 5, scope: !147)
!149 = !DILocalVariable(name: "i", scope: !150, file: !10, line: 109, type: !11)
!150 = distinct !DILexicalBlock(scope: !151, file: !10, line: 108, column: 9)
!151 = distinct !DILexicalBlock(scope: !144, file: !10, line: 107, column: 5)
!152 = !DILocation(line: 109, column: 17, scope: !150)
!153 = !DILocalVariable(name: "buffer", scope: !150, file: !10, line: 110, type: !59)
!154 = !DILocation(line: 110, column: 17, scope: !150)
!155 = !DILocation(line: 112, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !150, file: !10, line: 112, column: 17)
!157 = !DILocation(line: 112, column: 22, scope: !156)
!158 = !DILocation(line: 112, column: 27, scope: !156)
!159 = !DILocation(line: 112, column: 30, scope: !156)
!160 = !DILocation(line: 112, column: 35, scope: !156)
!161 = !DILocation(line: 112, column: 17, scope: !150)
!162 = !DILocation(line: 114, column: 24, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !10, line: 113, column: 13)
!164 = !DILocation(line: 114, column: 17, scope: !163)
!165 = !DILocation(line: 114, column: 30, scope: !163)
!166 = !DILocation(line: 116, column: 23, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !10, line: 116, column: 17)
!168 = !DILocation(line: 116, column: 21, scope: !167)
!169 = !DILocation(line: 116, column: 28, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !10, line: 116, column: 17)
!171 = !DILocation(line: 116, column: 30, scope: !170)
!172 = !DILocation(line: 116, column: 17, scope: !167)
!173 = !DILocation(line: 118, column: 41, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !10, line: 117, column: 17)
!175 = !DILocation(line: 118, column: 34, scope: !174)
!176 = !DILocation(line: 118, column: 21, scope: !174)
!177 = !DILocation(line: 119, column: 17, scope: !174)
!178 = !DILocation(line: 116, column: 37, scope: !170)
!179 = !DILocation(line: 116, column: 17, scope: !170)
!180 = distinct !{!180, !172, !181, !87}
!181 = !DILocation(line: 119, column: 17, scope: !167)
!182 = !DILocation(line: 120, column: 13, scope: !163)
!183 = !DILocation(line: 123, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !156, file: !10, line: 122, column: 13)
!185 = !DILocation(line: 127, column: 1, scope: !118)
!186 = distinct !DISubprogram(name: "goodB2G2", scope: !10, file: !10, line: 130, type: !20, scopeLine: 131, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!187 = !DILocalVariable(name: "data", scope: !186, file: !10, line: 132, type: !11)
!188 = !DILocation(line: 132, column: 9, scope: !186)
!189 = !DILocation(line: 134, column: 10, scope: !186)
!190 = !DILocation(line: 135, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !186, file: !10, line: 135, column: 8)
!192 = !DILocation(line: 135, column: 8, scope: !186)
!193 = !DILocalVariable(name: "inputBuffer", scope: !194, file: !10, line: 138, type: !32)
!194 = distinct !DILexicalBlock(scope: !195, file: !10, line: 137, column: 9)
!195 = distinct !DILexicalBlock(scope: !191, file: !10, line: 136, column: 5)
!196 = !DILocation(line: 138, column: 18, scope: !194)
!197 = !DILocation(line: 140, column: 23, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !10, line: 140, column: 17)
!199 = !DILocation(line: 140, column: 53, scope: !198)
!200 = !DILocation(line: 140, column: 17, scope: !198)
!201 = !DILocation(line: 140, column: 60, scope: !198)
!202 = !DILocation(line: 140, column: 17, scope: !194)
!203 = !DILocation(line: 143, column: 29, scope: !204)
!204 = distinct !DILexicalBlock(scope: !198, file: !10, line: 141, column: 13)
!205 = !DILocation(line: 143, column: 24, scope: !204)
!206 = !DILocation(line: 143, column: 22, scope: !204)
!207 = !DILocation(line: 144, column: 13, scope: !204)
!208 = !DILocation(line: 147, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !198, file: !10, line: 146, column: 13)
!210 = !DILocation(line: 150, column: 5, scope: !195)
!211 = !DILocation(line: 151, column: 8, scope: !212)
!212 = distinct !DILexicalBlock(scope: !186, file: !10, line: 151, column: 8)
!213 = !DILocation(line: 151, column: 8, scope: !186)
!214 = !DILocalVariable(name: "i", scope: !215, file: !10, line: 154, type: !11)
!215 = distinct !DILexicalBlock(scope: !216, file: !10, line: 153, column: 9)
!216 = distinct !DILexicalBlock(scope: !212, file: !10, line: 152, column: 5)
!217 = !DILocation(line: 154, column: 17, scope: !215)
!218 = !DILocalVariable(name: "buffer", scope: !215, file: !10, line: 155, type: !59)
!219 = !DILocation(line: 155, column: 17, scope: !215)
!220 = !DILocation(line: 157, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !215, file: !10, line: 157, column: 17)
!222 = !DILocation(line: 157, column: 22, scope: !221)
!223 = !DILocation(line: 157, column: 27, scope: !221)
!224 = !DILocation(line: 157, column: 30, scope: !221)
!225 = !DILocation(line: 157, column: 35, scope: !221)
!226 = !DILocation(line: 157, column: 17, scope: !215)
!227 = !DILocation(line: 159, column: 24, scope: !228)
!228 = distinct !DILexicalBlock(scope: !221, file: !10, line: 158, column: 13)
!229 = !DILocation(line: 159, column: 17, scope: !228)
!230 = !DILocation(line: 159, column: 30, scope: !228)
!231 = !DILocation(line: 161, column: 23, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !10, line: 161, column: 17)
!233 = !DILocation(line: 161, column: 21, scope: !232)
!234 = !DILocation(line: 161, column: 28, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !10, line: 161, column: 17)
!236 = !DILocation(line: 161, column: 30, scope: !235)
!237 = !DILocation(line: 161, column: 17, scope: !232)
!238 = !DILocation(line: 163, column: 41, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !10, line: 162, column: 17)
!240 = !DILocation(line: 163, column: 34, scope: !239)
!241 = !DILocation(line: 163, column: 21, scope: !239)
!242 = !DILocation(line: 164, column: 17, scope: !239)
!243 = !DILocation(line: 161, column: 37, scope: !235)
!244 = !DILocation(line: 161, column: 17, scope: !235)
!245 = distinct !{!245, !237, !246, !87}
!246 = !DILocation(line: 164, column: 17, scope: !232)
!247 = !DILocation(line: 165, column: 13, scope: !228)
!248 = !DILocation(line: 168, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !221, file: !10, line: 167, column: 13)
!250 = !DILocation(line: 171, column: 5, scope: !216)
!251 = !DILocation(line: 172, column: 1, scope: !186)
!252 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 175, type: !20, scopeLine: 176, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!253 = !DILocalVariable(name: "data", scope: !252, file: !10, line: 177, type: !11)
!254 = !DILocation(line: 177, column: 9, scope: !252)
!255 = !DILocation(line: 179, column: 10, scope: !252)
!256 = !DILocation(line: 180, column: 8, scope: !257)
!257 = distinct !DILexicalBlock(scope: !252, file: !10, line: 180, column: 8)
!258 = !DILocation(line: 180, column: 8, scope: !252)
!259 = !DILocation(line: 183, column: 9, scope: !260)
!260 = distinct !DILexicalBlock(scope: !257, file: !10, line: 181, column: 5)
!261 = !DILocation(line: 184, column: 5, scope: !260)
!262 = !DILocation(line: 189, column: 14, scope: !263)
!263 = distinct !DILexicalBlock(scope: !257, file: !10, line: 186, column: 5)
!264 = !DILocation(line: 191, column: 8, scope: !265)
!265 = distinct !DILexicalBlock(scope: !252, file: !10, line: 191, column: 8)
!266 = !DILocation(line: 191, column: 8, scope: !252)
!267 = !DILocalVariable(name: "i", scope: !268, file: !10, line: 194, type: !11)
!268 = distinct !DILexicalBlock(scope: !269, file: !10, line: 193, column: 9)
!269 = distinct !DILexicalBlock(scope: !265, file: !10, line: 192, column: 5)
!270 = !DILocation(line: 194, column: 17, scope: !268)
!271 = !DILocalVariable(name: "buffer", scope: !268, file: !10, line: 195, type: !59)
!272 = !DILocation(line: 195, column: 17, scope: !268)
!273 = !DILocation(line: 198, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !268, file: !10, line: 198, column: 17)
!275 = !DILocation(line: 198, column: 22, scope: !274)
!276 = !DILocation(line: 198, column: 17, scope: !268)
!277 = !DILocation(line: 200, column: 24, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !10, line: 199, column: 13)
!279 = !DILocation(line: 200, column: 17, scope: !278)
!280 = !DILocation(line: 200, column: 30, scope: !278)
!281 = !DILocation(line: 202, column: 23, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !10, line: 202, column: 17)
!283 = !DILocation(line: 202, column: 21, scope: !282)
!284 = !DILocation(line: 202, column: 28, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !10, line: 202, column: 17)
!286 = !DILocation(line: 202, column: 30, scope: !285)
!287 = !DILocation(line: 202, column: 17, scope: !282)
!288 = !DILocation(line: 204, column: 41, scope: !289)
!289 = distinct !DILexicalBlock(scope: !285, file: !10, line: 203, column: 17)
!290 = !DILocation(line: 204, column: 34, scope: !289)
!291 = !DILocation(line: 204, column: 21, scope: !289)
!292 = !DILocation(line: 205, column: 17, scope: !289)
!293 = !DILocation(line: 202, column: 37, scope: !285)
!294 = !DILocation(line: 202, column: 17, scope: !285)
!295 = distinct !{!295, !287, !296, !87}
!296 = !DILocation(line: 205, column: 17, scope: !282)
!297 = !DILocation(line: 206, column: 13, scope: !278)
!298 = !DILocation(line: 209, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !274, file: !10, line: 208, column: 13)
!300 = !DILocation(line: 212, column: 5, scope: !269)
!301 = !DILocation(line: 213, column: 1, scope: !252)
!302 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 216, type: !20, scopeLine: 217, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!303 = !DILocalVariable(name: "data", scope: !302, file: !10, line: 218, type: !11)
!304 = !DILocation(line: 218, column: 9, scope: !302)
!305 = !DILocation(line: 220, column: 10, scope: !302)
!306 = !DILocation(line: 221, column: 8, scope: !307)
!307 = distinct !DILexicalBlock(scope: !302, file: !10, line: 221, column: 8)
!308 = !DILocation(line: 221, column: 8, scope: !302)
!309 = !DILocation(line: 225, column: 14, scope: !310)
!310 = distinct !DILexicalBlock(scope: !307, file: !10, line: 222, column: 5)
!311 = !DILocation(line: 226, column: 5, scope: !310)
!312 = !DILocation(line: 227, column: 8, scope: !313)
!313 = distinct !DILexicalBlock(scope: !302, file: !10, line: 227, column: 8)
!314 = !DILocation(line: 227, column: 8, scope: !302)
!315 = !DILocalVariable(name: "i", scope: !316, file: !10, line: 230, type: !11)
!316 = distinct !DILexicalBlock(scope: !317, file: !10, line: 229, column: 9)
!317 = distinct !DILexicalBlock(scope: !313, file: !10, line: 228, column: 5)
!318 = !DILocation(line: 230, column: 17, scope: !316)
!319 = !DILocalVariable(name: "buffer", scope: !316, file: !10, line: 231, type: !59)
!320 = !DILocation(line: 231, column: 17, scope: !316)
!321 = !DILocation(line: 234, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !316, file: !10, line: 234, column: 17)
!323 = !DILocation(line: 234, column: 22, scope: !322)
!324 = !DILocation(line: 234, column: 17, scope: !316)
!325 = !DILocation(line: 236, column: 24, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !10, line: 235, column: 13)
!327 = !DILocation(line: 236, column: 17, scope: !326)
!328 = !DILocation(line: 236, column: 30, scope: !326)
!329 = !DILocation(line: 238, column: 23, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !10, line: 238, column: 17)
!331 = !DILocation(line: 238, column: 21, scope: !330)
!332 = !DILocation(line: 238, column: 28, scope: !333)
!333 = distinct !DILexicalBlock(scope: !330, file: !10, line: 238, column: 17)
!334 = !DILocation(line: 238, column: 30, scope: !333)
!335 = !DILocation(line: 238, column: 17, scope: !330)
!336 = !DILocation(line: 240, column: 41, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !10, line: 239, column: 17)
!338 = !DILocation(line: 240, column: 34, scope: !337)
!339 = !DILocation(line: 240, column: 21, scope: !337)
!340 = !DILocation(line: 241, column: 17, scope: !337)
!341 = !DILocation(line: 238, column: 37, scope: !333)
!342 = !DILocation(line: 238, column: 17, scope: !333)
!343 = distinct !{!343, !335, !344, !87}
!344 = !DILocation(line: 241, column: 17, scope: !330)
!345 = !DILocation(line: 242, column: 13, scope: !326)
!346 = !DILocation(line: 245, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !322, file: !10, line: 244, column: 13)
!348 = !DILocation(line: 248, column: 5, scope: !317)
!349 = !DILocation(line: 249, column: 1, scope: !302)
