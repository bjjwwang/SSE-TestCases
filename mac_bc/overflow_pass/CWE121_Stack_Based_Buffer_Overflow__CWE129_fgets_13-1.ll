; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@GLOBAL_CONST_FIVE = external constant i32, align 4
@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_13_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end5, !dbg !24

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !25, metadata !DIExpression()), !dbg !32
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !35
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !36
  %cmp1 = icmp ne i8* %call, null, !dbg !37
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !38

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !39
  %call4 = call i32 @atoi(i8* noundef %arraydecay3), !dbg !41
  store i32 %call4, i32* %data, align 4, !dbg !42
  br label %if.end, !dbg !43

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !46

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !47
  %cmp6 = icmp eq i32 %3, 5, !dbg !49
  br i1 %cmp6, label %if.then7, label %if.end15, !dbg !50

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !51, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !55, metadata !DIExpression()), !dbg !59
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !59
  %5 = load i32, i32* %data, align 4, !dbg !60
  %cmp8 = icmp sge i32 %5, 0, !dbg !62
  br i1 %cmp8, label %if.then9, label %if.else13, !dbg !63

if.then9:                                         ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !64
  %idxprom = sext i32 %6 to i64, !dbg !66
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !66
  store i32 1, i32* %arrayidx, align 4, !dbg !67
  store i32 0, i32* %i, align 4, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %if.then9
  %7 = load i32, i32* %i, align 4, !dbg !71
  %cmp10 = icmp slt i32 %7, 10, !dbg !73
  br i1 %cmp10, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !dbg !75
  %idxprom11 = sext i32 %8 to i64, !dbg !77
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom11, !dbg !77
  %9 = load i32, i32* %arrayidx12, align 4, !dbg !77
  call void @printIntLine(i32 noundef %9), !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !80
  %inc = add nsw i32 %10, 1, !dbg !80
  store i32 %inc, i32* %i, align 4, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  br label %if.end14, !dbg !85

if.else13:                                        ; preds = %if.then7
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %for.end
  br label %if.end15, !dbg !88

if.end15:                                         ; preds = %if.end14, %if.end5
  ret void, !dbg !89
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_13_good() #0 !dbg !90 {
entry:
  call void @goodB2G1(), !dbg !91
  call void @goodB2G2(), !dbg !92
  call void @goodG2B1(), !dbg !93
  call void @goodG2B2(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* noundef null), !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 noundef %conv), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_13_good(), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_13_bad(), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !115 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 -1, i32* %data, align 4, !dbg !118
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !119
  %cmp = icmp eq i32 %0, 5, !dbg !121
  br i1 %cmp, label %if.then, label %if.end5, !dbg !122

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !123, metadata !DIExpression()), !dbg !126
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !126
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !127
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !129
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !130
  %cmp1 = icmp ne i8* %call, null, !dbg !131
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !132

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !133
  %call4 = call i32 @atoi(i8* noundef %arraydecay3), !dbg !135
  store i32 %call4, i32* %data, align 4, !dbg !136
  br label %if.end, !dbg !137

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !138
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !140

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !141
  %cmp6 = icmp ne i32 %3, 5, !dbg !143
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !144

if.then7:                                         ; preds = %if.end5
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !145
  br label %if.end17, !dbg !147

if.else8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !152, metadata !DIExpression()), !dbg !153
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !153
  %5 = load i32, i32* %data, align 4, !dbg !154
  %cmp9 = icmp sge i32 %5, 0, !dbg !156
  br i1 %cmp9, label %land.lhs.true, label %if.else15, !dbg !157

land.lhs.true:                                    ; preds = %if.else8
  %6 = load i32, i32* %data, align 4, !dbg !158
  %cmp10 = icmp slt i32 %6, 10, !dbg !159
  br i1 %cmp10, label %if.then11, label %if.else15, !dbg !160

if.then11:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !161
  %idxprom = sext i32 %7 to i64, !dbg !163
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !163
  store i32 1, i32* %arrayidx, align 4, !dbg !164
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.then11
  %8 = load i32, i32* %i, align 4, !dbg !168
  %cmp12 = icmp slt i32 %8, 10, !dbg !170
  br i1 %cmp12, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !172
  %idxprom13 = sext i32 %9 to i64, !dbg !174
  %arrayidx14 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom13, !dbg !174
  %10 = load i32, i32* %arrayidx14, align 4, !dbg !174
  call void @printIntLine(i32 noundef %10), !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !177
  %inc = add nsw i32 %11, 1, !dbg !177
  store i32 %inc, i32* %i, align 4, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  br label %if.end16, !dbg !181

if.else15:                                        ; preds = %land.lhs.true, %if.else8
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !182
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %for.end
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then7
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !185 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 -1, i32* %data, align 4, !dbg !188
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !189
  %cmp = icmp eq i32 %0, 5, !dbg !191
  br i1 %cmp, label %if.then, label %if.end5, !dbg !192

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !193, metadata !DIExpression()), !dbg !196
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !196
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !196
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !197
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !199
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !200
  %cmp1 = icmp ne i8* %call, null, !dbg !201
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !202

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !203
  %call4 = call i32 @atoi(i8* noundef %arraydecay3), !dbg !205
  store i32 %call4, i32* %data, align 4, !dbg !206
  br label %if.end, !dbg !207

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !208
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !210

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !211
  %cmp6 = icmp eq i32 %3, 5, !dbg !213
  br i1 %cmp6, label %if.then7, label %if.end16, !dbg !214

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !215, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !219, metadata !DIExpression()), !dbg !220
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !220
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !220
  %5 = load i32, i32* %data, align 4, !dbg !221
  %cmp8 = icmp sge i32 %5, 0, !dbg !223
  br i1 %cmp8, label %land.lhs.true, label %if.else14, !dbg !224

land.lhs.true:                                    ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !225
  %cmp9 = icmp slt i32 %6, 10, !dbg !226
  br i1 %cmp9, label %if.then10, label %if.else14, !dbg !227

if.then10:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !228
  %idxprom = sext i32 %7 to i64, !dbg !230
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !230
  store i32 1, i32* %arrayidx, align 4, !dbg !231
  store i32 0, i32* %i, align 4, !dbg !232
  br label %for.cond, !dbg !234

for.cond:                                         ; preds = %for.inc, %if.then10
  %8 = load i32, i32* %i, align 4, !dbg !235
  %cmp11 = icmp slt i32 %8, 10, !dbg !237
  br i1 %cmp11, label %for.body, label %for.end, !dbg !238

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4, !dbg !239
  %idxprom12 = sext i32 %9 to i64, !dbg !241
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom12, !dbg !241
  %10 = load i32, i32* %arrayidx13, align 4, !dbg !241
  call void @printIntLine(i32 noundef %10), !dbg !242
  br label %for.inc, !dbg !243

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !244
  %inc = add nsw i32 %11, 1, !dbg !244
  store i32 %inc, i32* %i, align 4, !dbg !244
  br label %for.cond, !dbg !245, !llvm.loop !246

for.end:                                          ; preds = %for.cond
  br label %if.end15, !dbg !248

if.else14:                                        ; preds = %land.lhs.true, %if.then7
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !249
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %for.end
  br label %if.end16, !dbg !251

if.end16:                                         ; preds = %if.end15, %if.end5
  ret void, !dbg !252
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !253 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !254, metadata !DIExpression()), !dbg !255
  store i32 -1, i32* %data, align 4, !dbg !256
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !257
  %cmp = icmp ne i32 %0, 5, !dbg !259
  br i1 %cmp, label %if.then, label %if.else, !dbg !260

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !261
  br label %if.end, !dbg !263

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !264
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !266
  %cmp1 = icmp eq i32 %1, 5, !dbg !268
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !269

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !270, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !274, metadata !DIExpression()), !dbg !275
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !275
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !275
  %3 = load i32, i32* %data, align 4, !dbg !276
  %cmp3 = icmp sge i32 %3, 0, !dbg !278
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !279

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !280
  %idxprom = sext i32 %4 to i64, !dbg !282
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !282
  store i32 1, i32* %arrayidx, align 4, !dbg !283
  store i32 0, i32* %i, align 4, !dbg !284
  br label %for.cond, !dbg !286

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !287
  %cmp5 = icmp slt i32 %5, 10, !dbg !289
  br i1 %cmp5, label %for.body, label %for.end, !dbg !290

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !291
  %idxprom6 = sext i32 %6 to i64, !dbg !293
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !293
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !293
  call void @printIntLine(i32 noundef %7), !dbg !294
  br label %for.inc, !dbg !295

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !296
  %inc = add nsw i32 %8, 1, !dbg !296
  store i32 %inc, i32* %i, align 4, !dbg !296
  br label %for.cond, !dbg !297, !llvm.loop !298

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !300

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !301
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !303

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !304
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !305 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !306, metadata !DIExpression()), !dbg !307
  store i32 -1, i32* %data, align 4, !dbg !308
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !309
  %cmp = icmp eq i32 %0, 5, !dbg !311
  br i1 %cmp, label %if.then, label %if.end, !dbg !312

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !313
  br label %if.end, !dbg !315

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !316
  %cmp1 = icmp eq i32 %1, 5, !dbg !318
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !319

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !320, metadata !DIExpression()), !dbg !323
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !324, metadata !DIExpression()), !dbg !325
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !325
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !325
  %3 = load i32, i32* %data, align 4, !dbg !326
  %cmp3 = icmp sge i32 %3, 0, !dbg !328
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !329

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !330
  %idxprom = sext i32 %4 to i64, !dbg !332
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !332
  store i32 1, i32* %arrayidx, align 4, !dbg !333
  store i32 0, i32* %i, align 4, !dbg !334
  br label %for.cond, !dbg !336

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !337
  %cmp5 = icmp slt i32 %5, 10, !dbg !339
  br i1 %cmp5, label %for.body, label %for.end, !dbg !340

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !341
  %idxprom6 = sext i32 %6 to i64, !dbg !343
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !343
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !343
  call void @printIntLine(i32 noundef %7), !dbg !344
  br label %for.inc, !dbg !345

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !346
  %inc = add nsw i32 %8, 1, !dbg !346
  store i32 %inc, i32* %i, align 4, !dbg !346
  br label %for.cond, !dbg !347, !llvm.loop !348

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !350

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !351
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !353

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !354
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_13_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 26, column: 9, scope: !12)
!20 = !DILocation(line: 28, column: 10, scope: !12)
!21 = !DILocation(line: 29, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 8)
!23 = !DILocation(line: 29, column: 25, scope: !22)
!24 = !DILocation(line: 29, column: 8, scope: !12)
!25 = !DILocalVariable(name: "inputBuffer", scope: !26, file: !13, line: 32, type: !28)
!26 = distinct !DILexicalBlock(scope: !27, file: !13, line: 31, column: 9)
!27 = distinct !DILexicalBlock(scope: !22, file: !13, line: 30, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 112, elements: !30)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!31}
!31 = !DISubrange(count: 14)
!32 = !DILocation(line: 32, column: 18, scope: !26)
!33 = !DILocation(line: 34, column: 23, scope: !34)
!34 = distinct !DILexicalBlock(scope: !26, file: !13, line: 34, column: 17)
!35 = !DILocation(line: 34, column: 53, scope: !34)
!36 = !DILocation(line: 34, column: 17, scope: !34)
!37 = !DILocation(line: 34, column: 60, scope: !34)
!38 = !DILocation(line: 34, column: 17, scope: !26)
!39 = !DILocation(line: 37, column: 29, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !13, line: 35, column: 13)
!41 = !DILocation(line: 37, column: 24, scope: !40)
!42 = !DILocation(line: 37, column: 22, scope: !40)
!43 = !DILocation(line: 38, column: 13, scope: !40)
!44 = !DILocation(line: 41, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !13, line: 40, column: 13)
!46 = !DILocation(line: 44, column: 5, scope: !27)
!47 = !DILocation(line: 45, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !12, file: !13, line: 45, column: 8)
!49 = !DILocation(line: 45, column: 25, scope: !48)
!50 = !DILocation(line: 45, column: 8, scope: !12)
!51 = !DILocalVariable(name: "i", scope: !52, file: !13, line: 48, type: !18)
!52 = distinct !DILexicalBlock(scope: !53, file: !13, line: 47, column: 9)
!53 = distinct !DILexicalBlock(scope: !48, file: !13, line: 46, column: 5)
!54 = !DILocation(line: 48, column: 17, scope: !52)
!55 = !DILocalVariable(name: "buffer", scope: !52, file: !13, line: 49, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 10)
!59 = !DILocation(line: 49, column: 17, scope: !52)
!60 = !DILocation(line: 52, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !52, file: !13, line: 52, column: 17)
!62 = !DILocation(line: 52, column: 22, scope: !61)
!63 = !DILocation(line: 52, column: 17, scope: !52)
!64 = !DILocation(line: 54, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !13, line: 53, column: 13)
!66 = !DILocation(line: 54, column: 17, scope: !65)
!67 = !DILocation(line: 54, column: 30, scope: !65)
!68 = !DILocation(line: 56, column: 23, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !13, line: 56, column: 17)
!70 = !DILocation(line: 56, column: 21, scope: !69)
!71 = !DILocation(line: 56, column: 28, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !13, line: 56, column: 17)
!73 = !DILocation(line: 56, column: 30, scope: !72)
!74 = !DILocation(line: 56, column: 17, scope: !69)
!75 = !DILocation(line: 58, column: 41, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !13, line: 57, column: 17)
!77 = !DILocation(line: 58, column: 34, scope: !76)
!78 = !DILocation(line: 58, column: 21, scope: !76)
!79 = !DILocation(line: 59, column: 17, scope: !76)
!80 = !DILocation(line: 56, column: 37, scope: !72)
!81 = !DILocation(line: 56, column: 17, scope: !72)
!82 = distinct !{!82, !74, !83, !84}
!83 = !DILocation(line: 59, column: 17, scope: !69)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 60, column: 13, scope: !65)
!86 = !DILocation(line: 63, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !61, file: !13, line: 62, column: 13)
!88 = !DILocation(line: 66, column: 5, scope: !53)
!89 = !DILocation(line: 67, column: 1, scope: !12)
!90 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_13_good", scope: !13, file: !13, line: 245, type: !14, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!91 = !DILocation(line: 247, column: 5, scope: !90)
!92 = !DILocation(line: 248, column: 5, scope: !90)
!93 = !DILocation(line: 249, column: 5, scope: !90)
!94 = !DILocation(line: 250, column: 5, scope: !90)
!95 = !DILocation(line: 251, column: 1, scope: !90)
!96 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 262, type: !97, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!97 = !DISubroutineType(types: !98)
!98 = !{!18, !18, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !13, line: 262, type: !18)
!102 = !DILocation(line: 262, column: 14, scope: !96)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !13, line: 262, type: !99)
!104 = !DILocation(line: 262, column: 27, scope: !96)
!105 = !DILocation(line: 265, column: 22, scope: !96)
!106 = !DILocation(line: 265, column: 12, scope: !96)
!107 = !DILocation(line: 265, column: 5, scope: !96)
!108 = !DILocation(line: 267, column: 5, scope: !96)
!109 = !DILocation(line: 268, column: 5, scope: !96)
!110 = !DILocation(line: 269, column: 5, scope: !96)
!111 = !DILocation(line: 272, column: 5, scope: !96)
!112 = !DILocation(line: 273, column: 5, scope: !96)
!113 = !DILocation(line: 274, column: 5, scope: !96)
!114 = !DILocation(line: 276, column: 5, scope: !96)
!115 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 74, type: !14, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!116 = !DILocalVariable(name: "data", scope: !115, file: !13, line: 76, type: !18)
!117 = !DILocation(line: 76, column: 9, scope: !115)
!118 = !DILocation(line: 78, column: 10, scope: !115)
!119 = !DILocation(line: 79, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !13, line: 79, column: 8)
!121 = !DILocation(line: 79, column: 25, scope: !120)
!122 = !DILocation(line: 79, column: 8, scope: !115)
!123 = !DILocalVariable(name: "inputBuffer", scope: !124, file: !13, line: 82, type: !28)
!124 = distinct !DILexicalBlock(scope: !125, file: !13, line: 81, column: 9)
!125 = distinct !DILexicalBlock(scope: !120, file: !13, line: 80, column: 5)
!126 = !DILocation(line: 82, column: 18, scope: !124)
!127 = !DILocation(line: 84, column: 23, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !13, line: 84, column: 17)
!129 = !DILocation(line: 84, column: 53, scope: !128)
!130 = !DILocation(line: 84, column: 17, scope: !128)
!131 = !DILocation(line: 84, column: 60, scope: !128)
!132 = !DILocation(line: 84, column: 17, scope: !124)
!133 = !DILocation(line: 87, column: 29, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !13, line: 85, column: 13)
!135 = !DILocation(line: 87, column: 24, scope: !134)
!136 = !DILocation(line: 87, column: 22, scope: !134)
!137 = !DILocation(line: 88, column: 13, scope: !134)
!138 = !DILocation(line: 91, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !128, file: !13, line: 90, column: 13)
!140 = !DILocation(line: 94, column: 5, scope: !125)
!141 = !DILocation(line: 95, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !115, file: !13, line: 95, column: 8)
!143 = !DILocation(line: 95, column: 25, scope: !142)
!144 = !DILocation(line: 95, column: 8, scope: !115)
!145 = !DILocation(line: 98, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !13, line: 96, column: 5)
!147 = !DILocation(line: 99, column: 5, scope: !146)
!148 = !DILocalVariable(name: "i", scope: !149, file: !13, line: 103, type: !18)
!149 = distinct !DILexicalBlock(scope: !150, file: !13, line: 102, column: 9)
!150 = distinct !DILexicalBlock(scope: !142, file: !13, line: 101, column: 5)
!151 = !DILocation(line: 103, column: 17, scope: !149)
!152 = !DILocalVariable(name: "buffer", scope: !149, file: !13, line: 104, type: !56)
!153 = !DILocation(line: 104, column: 17, scope: !149)
!154 = !DILocation(line: 106, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !13, line: 106, column: 17)
!156 = !DILocation(line: 106, column: 22, scope: !155)
!157 = !DILocation(line: 106, column: 27, scope: !155)
!158 = !DILocation(line: 106, column: 30, scope: !155)
!159 = !DILocation(line: 106, column: 35, scope: !155)
!160 = !DILocation(line: 106, column: 17, scope: !149)
!161 = !DILocation(line: 108, column: 24, scope: !162)
!162 = distinct !DILexicalBlock(scope: !155, file: !13, line: 107, column: 13)
!163 = !DILocation(line: 108, column: 17, scope: !162)
!164 = !DILocation(line: 108, column: 30, scope: !162)
!165 = !DILocation(line: 110, column: 23, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !13, line: 110, column: 17)
!167 = !DILocation(line: 110, column: 21, scope: !166)
!168 = !DILocation(line: 110, column: 28, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !13, line: 110, column: 17)
!170 = !DILocation(line: 110, column: 30, scope: !169)
!171 = !DILocation(line: 110, column: 17, scope: !166)
!172 = !DILocation(line: 112, column: 41, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !13, line: 111, column: 17)
!174 = !DILocation(line: 112, column: 34, scope: !173)
!175 = !DILocation(line: 112, column: 21, scope: !173)
!176 = !DILocation(line: 113, column: 17, scope: !173)
!177 = !DILocation(line: 110, column: 37, scope: !169)
!178 = !DILocation(line: 110, column: 17, scope: !169)
!179 = distinct !{!179, !171, !180, !84}
!180 = !DILocation(line: 113, column: 17, scope: !166)
!181 = !DILocation(line: 114, column: 13, scope: !162)
!182 = !DILocation(line: 117, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !155, file: !13, line: 116, column: 13)
!184 = !DILocation(line: 121, column: 1, scope: !115)
!185 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 124, type: !14, scopeLine: 125, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!186 = !DILocalVariable(name: "data", scope: !185, file: !13, line: 126, type: !18)
!187 = !DILocation(line: 126, column: 9, scope: !185)
!188 = !DILocation(line: 128, column: 10, scope: !185)
!189 = !DILocation(line: 129, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !185, file: !13, line: 129, column: 8)
!191 = !DILocation(line: 129, column: 25, scope: !190)
!192 = !DILocation(line: 129, column: 8, scope: !185)
!193 = !DILocalVariable(name: "inputBuffer", scope: !194, file: !13, line: 132, type: !28)
!194 = distinct !DILexicalBlock(scope: !195, file: !13, line: 131, column: 9)
!195 = distinct !DILexicalBlock(scope: !190, file: !13, line: 130, column: 5)
!196 = !DILocation(line: 132, column: 18, scope: !194)
!197 = !DILocation(line: 134, column: 23, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !13, line: 134, column: 17)
!199 = !DILocation(line: 134, column: 53, scope: !198)
!200 = !DILocation(line: 134, column: 17, scope: !198)
!201 = !DILocation(line: 134, column: 60, scope: !198)
!202 = !DILocation(line: 134, column: 17, scope: !194)
!203 = !DILocation(line: 137, column: 29, scope: !204)
!204 = distinct !DILexicalBlock(scope: !198, file: !13, line: 135, column: 13)
!205 = !DILocation(line: 137, column: 24, scope: !204)
!206 = !DILocation(line: 137, column: 22, scope: !204)
!207 = !DILocation(line: 138, column: 13, scope: !204)
!208 = !DILocation(line: 141, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !198, file: !13, line: 140, column: 13)
!210 = !DILocation(line: 144, column: 5, scope: !195)
!211 = !DILocation(line: 145, column: 8, scope: !212)
!212 = distinct !DILexicalBlock(scope: !185, file: !13, line: 145, column: 8)
!213 = !DILocation(line: 145, column: 25, scope: !212)
!214 = !DILocation(line: 145, column: 8, scope: !185)
!215 = !DILocalVariable(name: "i", scope: !216, file: !13, line: 148, type: !18)
!216 = distinct !DILexicalBlock(scope: !217, file: !13, line: 147, column: 9)
!217 = distinct !DILexicalBlock(scope: !212, file: !13, line: 146, column: 5)
!218 = !DILocation(line: 148, column: 17, scope: !216)
!219 = !DILocalVariable(name: "buffer", scope: !216, file: !13, line: 149, type: !56)
!220 = !DILocation(line: 149, column: 17, scope: !216)
!221 = !DILocation(line: 151, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !216, file: !13, line: 151, column: 17)
!223 = !DILocation(line: 151, column: 22, scope: !222)
!224 = !DILocation(line: 151, column: 27, scope: !222)
!225 = !DILocation(line: 151, column: 30, scope: !222)
!226 = !DILocation(line: 151, column: 35, scope: !222)
!227 = !DILocation(line: 151, column: 17, scope: !216)
!228 = !DILocation(line: 153, column: 24, scope: !229)
!229 = distinct !DILexicalBlock(scope: !222, file: !13, line: 152, column: 13)
!230 = !DILocation(line: 153, column: 17, scope: !229)
!231 = !DILocation(line: 153, column: 30, scope: !229)
!232 = !DILocation(line: 155, column: 23, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !13, line: 155, column: 17)
!234 = !DILocation(line: 155, column: 21, scope: !233)
!235 = !DILocation(line: 155, column: 28, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !13, line: 155, column: 17)
!237 = !DILocation(line: 155, column: 30, scope: !236)
!238 = !DILocation(line: 155, column: 17, scope: !233)
!239 = !DILocation(line: 157, column: 41, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !13, line: 156, column: 17)
!241 = !DILocation(line: 157, column: 34, scope: !240)
!242 = !DILocation(line: 157, column: 21, scope: !240)
!243 = !DILocation(line: 158, column: 17, scope: !240)
!244 = !DILocation(line: 155, column: 37, scope: !236)
!245 = !DILocation(line: 155, column: 17, scope: !236)
!246 = distinct !{!246, !238, !247, !84}
!247 = !DILocation(line: 158, column: 17, scope: !233)
!248 = !DILocation(line: 159, column: 13, scope: !229)
!249 = !DILocation(line: 162, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !222, file: !13, line: 161, column: 13)
!251 = !DILocation(line: 165, column: 5, scope: !217)
!252 = !DILocation(line: 166, column: 1, scope: !185)
!253 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 169, type: !14, scopeLine: 170, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!254 = !DILocalVariable(name: "data", scope: !253, file: !13, line: 171, type: !18)
!255 = !DILocation(line: 171, column: 9, scope: !253)
!256 = !DILocation(line: 173, column: 10, scope: !253)
!257 = !DILocation(line: 174, column: 8, scope: !258)
!258 = distinct !DILexicalBlock(scope: !253, file: !13, line: 174, column: 8)
!259 = !DILocation(line: 174, column: 25, scope: !258)
!260 = !DILocation(line: 174, column: 8, scope: !253)
!261 = !DILocation(line: 177, column: 9, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !13, line: 175, column: 5)
!263 = !DILocation(line: 178, column: 5, scope: !262)
!264 = !DILocation(line: 183, column: 14, scope: !265)
!265 = distinct !DILexicalBlock(scope: !258, file: !13, line: 180, column: 5)
!266 = !DILocation(line: 185, column: 8, scope: !267)
!267 = distinct !DILexicalBlock(scope: !253, file: !13, line: 185, column: 8)
!268 = !DILocation(line: 185, column: 25, scope: !267)
!269 = !DILocation(line: 185, column: 8, scope: !253)
!270 = !DILocalVariable(name: "i", scope: !271, file: !13, line: 188, type: !18)
!271 = distinct !DILexicalBlock(scope: !272, file: !13, line: 187, column: 9)
!272 = distinct !DILexicalBlock(scope: !267, file: !13, line: 186, column: 5)
!273 = !DILocation(line: 188, column: 17, scope: !271)
!274 = !DILocalVariable(name: "buffer", scope: !271, file: !13, line: 189, type: !56)
!275 = !DILocation(line: 189, column: 17, scope: !271)
!276 = !DILocation(line: 192, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !271, file: !13, line: 192, column: 17)
!278 = !DILocation(line: 192, column: 22, scope: !277)
!279 = !DILocation(line: 192, column: 17, scope: !271)
!280 = !DILocation(line: 194, column: 24, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !13, line: 193, column: 13)
!282 = !DILocation(line: 194, column: 17, scope: !281)
!283 = !DILocation(line: 194, column: 30, scope: !281)
!284 = !DILocation(line: 196, column: 23, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !13, line: 196, column: 17)
!286 = !DILocation(line: 196, column: 21, scope: !285)
!287 = !DILocation(line: 196, column: 28, scope: !288)
!288 = distinct !DILexicalBlock(scope: !285, file: !13, line: 196, column: 17)
!289 = !DILocation(line: 196, column: 30, scope: !288)
!290 = !DILocation(line: 196, column: 17, scope: !285)
!291 = !DILocation(line: 198, column: 41, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !13, line: 197, column: 17)
!293 = !DILocation(line: 198, column: 34, scope: !292)
!294 = !DILocation(line: 198, column: 21, scope: !292)
!295 = !DILocation(line: 199, column: 17, scope: !292)
!296 = !DILocation(line: 196, column: 37, scope: !288)
!297 = !DILocation(line: 196, column: 17, scope: !288)
!298 = distinct !{!298, !290, !299, !84}
!299 = !DILocation(line: 199, column: 17, scope: !285)
!300 = !DILocation(line: 200, column: 13, scope: !281)
!301 = !DILocation(line: 203, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !277, file: !13, line: 202, column: 13)
!303 = !DILocation(line: 206, column: 5, scope: !272)
!304 = !DILocation(line: 207, column: 1, scope: !253)
!305 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 210, type: !14, scopeLine: 211, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!306 = !DILocalVariable(name: "data", scope: !305, file: !13, line: 212, type: !18)
!307 = !DILocation(line: 212, column: 9, scope: !305)
!308 = !DILocation(line: 214, column: 10, scope: !305)
!309 = !DILocation(line: 215, column: 8, scope: !310)
!310 = distinct !DILexicalBlock(scope: !305, file: !13, line: 215, column: 8)
!311 = !DILocation(line: 215, column: 25, scope: !310)
!312 = !DILocation(line: 215, column: 8, scope: !305)
!313 = !DILocation(line: 219, column: 14, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !13, line: 216, column: 5)
!315 = !DILocation(line: 220, column: 5, scope: !314)
!316 = !DILocation(line: 221, column: 8, scope: !317)
!317 = distinct !DILexicalBlock(scope: !305, file: !13, line: 221, column: 8)
!318 = !DILocation(line: 221, column: 25, scope: !317)
!319 = !DILocation(line: 221, column: 8, scope: !305)
!320 = !DILocalVariable(name: "i", scope: !321, file: !13, line: 224, type: !18)
!321 = distinct !DILexicalBlock(scope: !322, file: !13, line: 223, column: 9)
!322 = distinct !DILexicalBlock(scope: !317, file: !13, line: 222, column: 5)
!323 = !DILocation(line: 224, column: 17, scope: !321)
!324 = !DILocalVariable(name: "buffer", scope: !321, file: !13, line: 225, type: !56)
!325 = !DILocation(line: 225, column: 17, scope: !321)
!326 = !DILocation(line: 228, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !321, file: !13, line: 228, column: 17)
!328 = !DILocation(line: 228, column: 22, scope: !327)
!329 = !DILocation(line: 228, column: 17, scope: !321)
!330 = !DILocation(line: 230, column: 24, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !13, line: 229, column: 13)
!332 = !DILocation(line: 230, column: 17, scope: !331)
!333 = !DILocation(line: 230, column: 30, scope: !331)
!334 = !DILocation(line: 232, column: 23, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !13, line: 232, column: 17)
!336 = !DILocation(line: 232, column: 21, scope: !335)
!337 = !DILocation(line: 232, column: 28, scope: !338)
!338 = distinct !DILexicalBlock(scope: !335, file: !13, line: 232, column: 17)
!339 = !DILocation(line: 232, column: 30, scope: !338)
!340 = !DILocation(line: 232, column: 17, scope: !335)
!341 = !DILocation(line: 234, column: 41, scope: !342)
!342 = distinct !DILexicalBlock(scope: !338, file: !13, line: 233, column: 17)
!343 = !DILocation(line: 234, column: 34, scope: !342)
!344 = !DILocation(line: 234, column: 21, scope: !342)
!345 = !DILocation(line: 235, column: 17, scope: !342)
!346 = !DILocation(line: 232, column: 37, scope: !338)
!347 = !DILocation(line: 232, column: 17, scope: !338)
!348 = distinct !{!348, !340, !349, !84}
!349 = !DILocation(line: 235, column: 17, scope: !335)
!350 = !DILocation(line: 236, column: 13, scope: !331)
!351 = !DILocation(line: 239, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !327, file: !13, line: 238, column: 13)
!353 = !DILocation(line: 242, column: 5, scope: !322)
!354 = !DILocation(line: 243, column: 1, scope: !305)
