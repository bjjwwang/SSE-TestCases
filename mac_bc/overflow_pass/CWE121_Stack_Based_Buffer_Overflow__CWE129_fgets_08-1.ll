; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_08-1.c"
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
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_08_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end5, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !24, metadata !DIExpression()), !dbg !31
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !31
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !32
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !34
  %call1 = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !35
  %cmp = icmp ne i8* %call1, null, !dbg !36
  br i1 %cmp, label %if.then2, label %if.else, !dbg !37

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !38
  %call4 = call i32 @atoi(i8* noundef %arraydecay3), !dbg !40
  store i32 %call4, i32* %data, align 4, !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !45

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 @staticReturnsTrue(), !dbg !46
  %tobool7 = icmp ne i32 %call6, 0, !dbg !46
  br i1 %tobool7, label %if.then8, label %if.end16, !dbg !48

if.then8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !49, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !53, metadata !DIExpression()), !dbg !57
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !57
  %3 = load i32, i32* %data, align 4, !dbg !58
  %cmp9 = icmp sge i32 %3, 0, !dbg !60
  br i1 %cmp9, label %if.then10, label %if.else14, !dbg !61

if.then10:                                        ; preds = %if.then8
  %4 = load i32, i32* %data, align 4, !dbg !62
  %idxprom = sext i32 %4 to i64, !dbg !64
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !64
  store i32 1, i32* %arrayidx, align 4, !dbg !65
  store i32 0, i32* %i, align 4, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.then10
  %5 = load i32, i32* %i, align 4, !dbg !69
  %cmp11 = icmp slt i32 %5, 10, !dbg !71
  br i1 %cmp11, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !73
  %idxprom12 = sext i32 %6 to i64, !dbg !75
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom12, !dbg !75
  %7 = load i32, i32* %arrayidx13, align 4, !dbg !75
  call void @printIntLine(i32 noundef %7), !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !78
  %inc = add nsw i32 %8, 1, !dbg !78
  store i32 %inc, i32* %i, align 4, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  br label %if.end15, !dbg !83

if.else14:                                        ; preds = %if.then8
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %for.end
  br label %if.end16, !dbg !86

if.end16:                                         ; preds = %if.end15, %if.end5
  ret void, !dbg !87
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_08_good() #0 !dbg !88 {
entry:
  call void @goodB2G1(), !dbg !89
  call void @goodB2G2(), !dbg !90
  call void @goodG2B1(), !dbg !91
  call void @goodG2B2(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* noundef null), !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 noundef %conv), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_08_good(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_08_bad(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !113 {
entry:
  ret i32 1, !dbg !116
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !117 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 -1, i32* %data, align 4, !dbg !120
  %call = call i32 @staticReturnsTrue(), !dbg !121
  %tobool = icmp ne i32 %call, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end5, !dbg !123

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !124, metadata !DIExpression()), !dbg !127
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !127
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !128
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !130
  %call1 = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !131
  %cmp = icmp ne i8* %call1, null, !dbg !132
  br i1 %cmp, label %if.then2, label %if.else, !dbg !133

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !134
  %call4 = call i32 @atoi(i8* noundef %arraydecay3), !dbg !136
  store i32 %call4, i32* %data, align 4, !dbg !137
  br label %if.end, !dbg !138

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !139
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !141

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 @staticReturnsFalse(), !dbg !142
  %tobool7 = icmp ne i32 %call6, 0, !dbg !142
  br i1 %tobool7, label %if.then8, label %if.else9, !dbg !144

if.then8:                                         ; preds = %if.end5
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !145
  br label %if.end18, !dbg !147

if.else9:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !152, metadata !DIExpression()), !dbg !153
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !153
  %3 = load i32, i32* %data, align 4, !dbg !154
  %cmp10 = icmp sge i32 %3, 0, !dbg !156
  br i1 %cmp10, label %land.lhs.true, label %if.else16, !dbg !157

land.lhs.true:                                    ; preds = %if.else9
  %4 = load i32, i32* %data, align 4, !dbg !158
  %cmp11 = icmp slt i32 %4, 10, !dbg !159
  br i1 %cmp11, label %if.then12, label %if.else16, !dbg !160

if.then12:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !161
  %idxprom = sext i32 %5 to i64, !dbg !163
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !163
  store i32 1, i32* %arrayidx, align 4, !dbg !164
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.then12
  %6 = load i32, i32* %i, align 4, !dbg !168
  %cmp13 = icmp slt i32 %6, 10, !dbg !170
  br i1 %cmp13, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !172
  %idxprom14 = sext i32 %7 to i64, !dbg !174
  %arrayidx15 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom14, !dbg !174
  %8 = load i32, i32* %arrayidx15, align 4, !dbg !174
  call void @printIntLine(i32 noundef %8), !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !177
  %inc = add nsw i32 %9, 1, !dbg !177
  store i32 %inc, i32* %i, align 4, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  br label %if.end17, !dbg !181

if.else16:                                        ; preds = %land.lhs.true, %if.else9
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !182
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %for.end
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then8
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !185 {
entry:
  ret i32 0, !dbg !186
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !187 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !188, metadata !DIExpression()), !dbg !189
  store i32 -1, i32* %data, align 4, !dbg !190
  %call = call i32 @staticReturnsTrue(), !dbg !191
  %tobool = icmp ne i32 %call, 0, !dbg !191
  br i1 %tobool, label %if.then, label %if.end5, !dbg !193

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !194, metadata !DIExpression()), !dbg !197
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !197
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !197
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !198
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !200
  %call1 = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !201
  %cmp = icmp ne i8* %call1, null, !dbg !202
  br i1 %cmp, label %if.then2, label %if.else, !dbg !203

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !204
  %call4 = call i32 @atoi(i8* noundef %arraydecay3), !dbg !206
  store i32 %call4, i32* %data, align 4, !dbg !207
  br label %if.end, !dbg !208

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !209
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !211

if.end5:                                          ; preds = %if.end, %entry
  %call6 = call i32 @staticReturnsTrue(), !dbg !212
  %tobool7 = icmp ne i32 %call6, 0, !dbg !212
  br i1 %tobool7, label %if.then8, label %if.end17, !dbg !214

if.then8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i32* %i, metadata !215, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !219, metadata !DIExpression()), !dbg !220
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !220
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !220
  %3 = load i32, i32* %data, align 4, !dbg !221
  %cmp9 = icmp sge i32 %3, 0, !dbg !223
  br i1 %cmp9, label %land.lhs.true, label %if.else15, !dbg !224

land.lhs.true:                                    ; preds = %if.then8
  %4 = load i32, i32* %data, align 4, !dbg !225
  %cmp10 = icmp slt i32 %4, 10, !dbg !226
  br i1 %cmp10, label %if.then11, label %if.else15, !dbg !227

if.then11:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !228
  %idxprom = sext i32 %5 to i64, !dbg !230
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !230
  store i32 1, i32* %arrayidx, align 4, !dbg !231
  store i32 0, i32* %i, align 4, !dbg !232
  br label %for.cond, !dbg !234

for.cond:                                         ; preds = %for.inc, %if.then11
  %6 = load i32, i32* %i, align 4, !dbg !235
  %cmp12 = icmp slt i32 %6, 10, !dbg !237
  br i1 %cmp12, label %for.body, label %for.end, !dbg !238

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !239
  %idxprom13 = sext i32 %7 to i64, !dbg !241
  %arrayidx14 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom13, !dbg !241
  %8 = load i32, i32* %arrayidx14, align 4, !dbg !241
  call void @printIntLine(i32 noundef %8), !dbg !242
  br label %for.inc, !dbg !243

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !244
  %inc = add nsw i32 %9, 1, !dbg !244
  store i32 %inc, i32* %i, align 4, !dbg !244
  br label %for.cond, !dbg !245, !llvm.loop !246

for.end:                                          ; preds = %for.cond
  br label %if.end16, !dbg !248

if.else15:                                        ; preds = %land.lhs.true, %if.then8
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !249
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %for.end
  br label %if.end17, !dbg !251

if.end17:                                         ; preds = %if.end16, %if.end5
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
  %call = call i32 @staticReturnsFalse(), !dbg !257
  %tobool = icmp ne i32 %call, 0, !dbg !257
  br i1 %tobool, label %if.then, label %if.else, !dbg !259

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !260
  br label %if.end, !dbg !262

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !263
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !265
  %tobool2 = icmp ne i32 %call1, 0, !dbg !265
  br i1 %tobool2, label %if.then3, label %if.end10, !dbg !267

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !268, metadata !DIExpression()), !dbg !271
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !272, metadata !DIExpression()), !dbg !273
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !273
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !273
  %1 = load i32, i32* %data, align 4, !dbg !274
  %cmp = icmp sge i32 %1, 0, !dbg !276
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !277

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !278
  %idxprom = sext i32 %2 to i64, !dbg !280
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !280
  store i32 1, i32* %arrayidx, align 4, !dbg !281
  store i32 0, i32* %i, align 4, !dbg !282
  br label %for.cond, !dbg !284

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !285
  %cmp5 = icmp slt i32 %3, 10, !dbg !287
  br i1 %cmp5, label %for.body, label %for.end, !dbg !288

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !289
  %idxprom6 = sext i32 %4 to i64, !dbg !291
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !291
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !291
  call void @printIntLine(i32 noundef %5), !dbg !292
  br label %for.inc, !dbg !293

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !294
  %inc = add nsw i32 %6, 1, !dbg !294
  store i32 %inc, i32* %i, align 4, !dbg !294
  br label %for.cond, !dbg !295, !llvm.loop !296

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !298

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !299
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !301

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !302
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !303 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !304, metadata !DIExpression()), !dbg !305
  store i32 -1, i32* %data, align 4, !dbg !306
  %call = call i32 @staticReturnsTrue(), !dbg !307
  %tobool = icmp ne i32 %call, 0, !dbg !307
  br i1 %tobool, label %if.then, label %if.end, !dbg !309

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !310
  br label %if.end, !dbg !312

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !313
  %tobool2 = icmp ne i32 %call1, 0, !dbg !313
  br i1 %tobool2, label %if.then3, label %if.end9, !dbg !315

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !316, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !320, metadata !DIExpression()), !dbg !321
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !321
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !321
  %1 = load i32, i32* %data, align 4, !dbg !322
  %cmp = icmp sge i32 %1, 0, !dbg !324
  br i1 %cmp, label %if.then4, label %if.else, !dbg !325

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !326
  %idxprom = sext i32 %2 to i64, !dbg !328
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !328
  store i32 1, i32* %arrayidx, align 4, !dbg !329
  store i32 0, i32* %i, align 4, !dbg !330
  br label %for.cond, !dbg !332

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !333
  %cmp5 = icmp slt i32 %3, 10, !dbg !335
  br i1 %cmp5, label %for.body, label %for.end, !dbg !336

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !337
  %idxprom6 = sext i32 %4 to i64, !dbg !339
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !339
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !339
  call void @printIntLine(i32 noundef %5), !dbg !340
  br label %for.inc, !dbg !341

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !342
  %inc = add nsw i32 %6, 1, !dbg !342
  store i32 %inc, i32* %i, align 4, !dbg !342
  br label %for.cond, !dbg !343, !llvm.loop !344

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !346

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !347
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !349

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !350
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_08_bad", scope: !13, file: !13, line: 37, type: !14, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 39, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 39, column: 9, scope: !12)
!20 = !DILocation(line: 41, column: 10, scope: !12)
!21 = !DILocation(line: 42, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !12, file: !13, line: 42, column: 8)
!23 = !DILocation(line: 42, column: 8, scope: !12)
!24 = !DILocalVariable(name: "inputBuffer", scope: !25, file: !13, line: 45, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !13, line: 44, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !13, line: 43, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 112, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 14)
!31 = !DILocation(line: 45, column: 18, scope: !25)
!32 = !DILocation(line: 47, column: 23, scope: !33)
!33 = distinct !DILexicalBlock(scope: !25, file: !13, line: 47, column: 17)
!34 = !DILocation(line: 47, column: 53, scope: !33)
!35 = !DILocation(line: 47, column: 17, scope: !33)
!36 = !DILocation(line: 47, column: 60, scope: !33)
!37 = !DILocation(line: 47, column: 17, scope: !25)
!38 = !DILocation(line: 50, column: 29, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !13, line: 48, column: 13)
!40 = !DILocation(line: 50, column: 24, scope: !39)
!41 = !DILocation(line: 50, column: 22, scope: !39)
!42 = !DILocation(line: 51, column: 13, scope: !39)
!43 = !DILocation(line: 54, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !13, line: 53, column: 13)
!45 = !DILocation(line: 57, column: 5, scope: !26)
!46 = !DILocation(line: 58, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !12, file: !13, line: 58, column: 8)
!48 = !DILocation(line: 58, column: 8, scope: !12)
!49 = !DILocalVariable(name: "i", scope: !50, file: !13, line: 61, type: !18)
!50 = distinct !DILexicalBlock(scope: !51, file: !13, line: 60, column: 9)
!51 = distinct !DILexicalBlock(scope: !47, file: !13, line: 59, column: 5)
!52 = !DILocation(line: 61, column: 17, scope: !50)
!53 = !DILocalVariable(name: "buffer", scope: !50, file: !13, line: 62, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 10)
!57 = !DILocation(line: 62, column: 17, scope: !50)
!58 = !DILocation(line: 65, column: 17, scope: !59)
!59 = distinct !DILexicalBlock(scope: !50, file: !13, line: 65, column: 17)
!60 = !DILocation(line: 65, column: 22, scope: !59)
!61 = !DILocation(line: 65, column: 17, scope: !50)
!62 = !DILocation(line: 67, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !13, line: 66, column: 13)
!64 = !DILocation(line: 67, column: 17, scope: !63)
!65 = !DILocation(line: 67, column: 30, scope: !63)
!66 = !DILocation(line: 69, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !13, line: 69, column: 17)
!68 = !DILocation(line: 69, column: 21, scope: !67)
!69 = !DILocation(line: 69, column: 28, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !13, line: 69, column: 17)
!71 = !DILocation(line: 69, column: 30, scope: !70)
!72 = !DILocation(line: 69, column: 17, scope: !67)
!73 = !DILocation(line: 71, column: 41, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !13, line: 70, column: 17)
!75 = !DILocation(line: 71, column: 34, scope: !74)
!76 = !DILocation(line: 71, column: 21, scope: !74)
!77 = !DILocation(line: 72, column: 17, scope: !74)
!78 = !DILocation(line: 69, column: 37, scope: !70)
!79 = !DILocation(line: 69, column: 17, scope: !70)
!80 = distinct !{!80, !72, !81, !82}
!81 = !DILocation(line: 72, column: 17, scope: !67)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 73, column: 13, scope: !63)
!84 = !DILocation(line: 76, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !59, file: !13, line: 75, column: 13)
!86 = !DILocation(line: 79, column: 5, scope: !51)
!87 = !DILocation(line: 80, column: 1, scope: !12)
!88 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_08_good", scope: !13, file: !13, line: 258, type: !14, scopeLine: 259, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!89 = !DILocation(line: 260, column: 5, scope: !88)
!90 = !DILocation(line: 261, column: 5, scope: !88)
!91 = !DILocation(line: 262, column: 5, scope: !88)
!92 = !DILocation(line: 263, column: 5, scope: !88)
!93 = !DILocation(line: 264, column: 1, scope: !88)
!94 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 275, type: !95, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!95 = !DISubroutineType(types: !96)
!96 = !{!18, !18, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !13, line: 275, type: !18)
!100 = !DILocation(line: 275, column: 14, scope: !94)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !13, line: 275, type: !97)
!102 = !DILocation(line: 275, column: 27, scope: !94)
!103 = !DILocation(line: 278, column: 22, scope: !94)
!104 = !DILocation(line: 278, column: 12, scope: !94)
!105 = !DILocation(line: 278, column: 5, scope: !94)
!106 = !DILocation(line: 280, column: 5, scope: !94)
!107 = !DILocation(line: 281, column: 5, scope: !94)
!108 = !DILocation(line: 282, column: 5, scope: !94)
!109 = !DILocation(line: 285, column: 5, scope: !94)
!110 = !DILocation(line: 286, column: 5, scope: !94)
!111 = !DILocation(line: 287, column: 5, scope: !94)
!112 = !DILocation(line: 289, column: 5, scope: !94)
!113 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !13, file: !13, line: 25, type: !114, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!114 = !DISubroutineType(types: !115)
!115 = !{!18}
!116 = !DILocation(line: 27, column: 5, scope: !113)
!117 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 87, type: !14, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!118 = !DILocalVariable(name: "data", scope: !117, file: !13, line: 89, type: !18)
!119 = !DILocation(line: 89, column: 9, scope: !117)
!120 = !DILocation(line: 91, column: 10, scope: !117)
!121 = !DILocation(line: 92, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !13, line: 92, column: 8)
!123 = !DILocation(line: 92, column: 8, scope: !117)
!124 = !DILocalVariable(name: "inputBuffer", scope: !125, file: !13, line: 95, type: !27)
!125 = distinct !DILexicalBlock(scope: !126, file: !13, line: 94, column: 9)
!126 = distinct !DILexicalBlock(scope: !122, file: !13, line: 93, column: 5)
!127 = !DILocation(line: 95, column: 18, scope: !125)
!128 = !DILocation(line: 97, column: 23, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !13, line: 97, column: 17)
!130 = !DILocation(line: 97, column: 53, scope: !129)
!131 = !DILocation(line: 97, column: 17, scope: !129)
!132 = !DILocation(line: 97, column: 60, scope: !129)
!133 = !DILocation(line: 97, column: 17, scope: !125)
!134 = !DILocation(line: 100, column: 29, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !13, line: 98, column: 13)
!136 = !DILocation(line: 100, column: 24, scope: !135)
!137 = !DILocation(line: 100, column: 22, scope: !135)
!138 = !DILocation(line: 101, column: 13, scope: !135)
!139 = !DILocation(line: 104, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !129, file: !13, line: 103, column: 13)
!141 = !DILocation(line: 107, column: 5, scope: !126)
!142 = !DILocation(line: 108, column: 8, scope: !143)
!143 = distinct !DILexicalBlock(scope: !117, file: !13, line: 108, column: 8)
!144 = !DILocation(line: 108, column: 8, scope: !117)
!145 = !DILocation(line: 111, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !13, line: 109, column: 5)
!147 = !DILocation(line: 112, column: 5, scope: !146)
!148 = !DILocalVariable(name: "i", scope: !149, file: !13, line: 116, type: !18)
!149 = distinct !DILexicalBlock(scope: !150, file: !13, line: 115, column: 9)
!150 = distinct !DILexicalBlock(scope: !143, file: !13, line: 114, column: 5)
!151 = !DILocation(line: 116, column: 17, scope: !149)
!152 = !DILocalVariable(name: "buffer", scope: !149, file: !13, line: 117, type: !54)
!153 = !DILocation(line: 117, column: 17, scope: !149)
!154 = !DILocation(line: 119, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !13, line: 119, column: 17)
!156 = !DILocation(line: 119, column: 22, scope: !155)
!157 = !DILocation(line: 119, column: 27, scope: !155)
!158 = !DILocation(line: 119, column: 30, scope: !155)
!159 = !DILocation(line: 119, column: 35, scope: !155)
!160 = !DILocation(line: 119, column: 17, scope: !149)
!161 = !DILocation(line: 121, column: 24, scope: !162)
!162 = distinct !DILexicalBlock(scope: !155, file: !13, line: 120, column: 13)
!163 = !DILocation(line: 121, column: 17, scope: !162)
!164 = !DILocation(line: 121, column: 30, scope: !162)
!165 = !DILocation(line: 123, column: 23, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !13, line: 123, column: 17)
!167 = !DILocation(line: 123, column: 21, scope: !166)
!168 = !DILocation(line: 123, column: 28, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !13, line: 123, column: 17)
!170 = !DILocation(line: 123, column: 30, scope: !169)
!171 = !DILocation(line: 123, column: 17, scope: !166)
!172 = !DILocation(line: 125, column: 41, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !13, line: 124, column: 17)
!174 = !DILocation(line: 125, column: 34, scope: !173)
!175 = !DILocation(line: 125, column: 21, scope: !173)
!176 = !DILocation(line: 126, column: 17, scope: !173)
!177 = !DILocation(line: 123, column: 37, scope: !169)
!178 = !DILocation(line: 123, column: 17, scope: !169)
!179 = distinct !{!179, !171, !180, !82}
!180 = !DILocation(line: 126, column: 17, scope: !166)
!181 = !DILocation(line: 127, column: 13, scope: !162)
!182 = !DILocation(line: 130, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !155, file: !13, line: 129, column: 13)
!184 = !DILocation(line: 134, column: 1, scope: !117)
!185 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !13, file: !13, line: 30, type: !114, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!186 = !DILocation(line: 32, column: 5, scope: !185)
!187 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 137, type: !14, scopeLine: 138, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!188 = !DILocalVariable(name: "data", scope: !187, file: !13, line: 139, type: !18)
!189 = !DILocation(line: 139, column: 9, scope: !187)
!190 = !DILocation(line: 141, column: 10, scope: !187)
!191 = !DILocation(line: 142, column: 8, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !13, line: 142, column: 8)
!193 = !DILocation(line: 142, column: 8, scope: !187)
!194 = !DILocalVariable(name: "inputBuffer", scope: !195, file: !13, line: 145, type: !27)
!195 = distinct !DILexicalBlock(scope: !196, file: !13, line: 144, column: 9)
!196 = distinct !DILexicalBlock(scope: !192, file: !13, line: 143, column: 5)
!197 = !DILocation(line: 145, column: 18, scope: !195)
!198 = !DILocation(line: 147, column: 23, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !13, line: 147, column: 17)
!200 = !DILocation(line: 147, column: 53, scope: !199)
!201 = !DILocation(line: 147, column: 17, scope: !199)
!202 = !DILocation(line: 147, column: 60, scope: !199)
!203 = !DILocation(line: 147, column: 17, scope: !195)
!204 = !DILocation(line: 150, column: 29, scope: !205)
!205 = distinct !DILexicalBlock(scope: !199, file: !13, line: 148, column: 13)
!206 = !DILocation(line: 150, column: 24, scope: !205)
!207 = !DILocation(line: 150, column: 22, scope: !205)
!208 = !DILocation(line: 151, column: 13, scope: !205)
!209 = !DILocation(line: 154, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !199, file: !13, line: 153, column: 13)
!211 = !DILocation(line: 157, column: 5, scope: !196)
!212 = !DILocation(line: 158, column: 8, scope: !213)
!213 = distinct !DILexicalBlock(scope: !187, file: !13, line: 158, column: 8)
!214 = !DILocation(line: 158, column: 8, scope: !187)
!215 = !DILocalVariable(name: "i", scope: !216, file: !13, line: 161, type: !18)
!216 = distinct !DILexicalBlock(scope: !217, file: !13, line: 160, column: 9)
!217 = distinct !DILexicalBlock(scope: !213, file: !13, line: 159, column: 5)
!218 = !DILocation(line: 161, column: 17, scope: !216)
!219 = !DILocalVariable(name: "buffer", scope: !216, file: !13, line: 162, type: !54)
!220 = !DILocation(line: 162, column: 17, scope: !216)
!221 = !DILocation(line: 164, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !216, file: !13, line: 164, column: 17)
!223 = !DILocation(line: 164, column: 22, scope: !222)
!224 = !DILocation(line: 164, column: 27, scope: !222)
!225 = !DILocation(line: 164, column: 30, scope: !222)
!226 = !DILocation(line: 164, column: 35, scope: !222)
!227 = !DILocation(line: 164, column: 17, scope: !216)
!228 = !DILocation(line: 166, column: 24, scope: !229)
!229 = distinct !DILexicalBlock(scope: !222, file: !13, line: 165, column: 13)
!230 = !DILocation(line: 166, column: 17, scope: !229)
!231 = !DILocation(line: 166, column: 30, scope: !229)
!232 = !DILocation(line: 168, column: 23, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !13, line: 168, column: 17)
!234 = !DILocation(line: 168, column: 21, scope: !233)
!235 = !DILocation(line: 168, column: 28, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !13, line: 168, column: 17)
!237 = !DILocation(line: 168, column: 30, scope: !236)
!238 = !DILocation(line: 168, column: 17, scope: !233)
!239 = !DILocation(line: 170, column: 41, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !13, line: 169, column: 17)
!241 = !DILocation(line: 170, column: 34, scope: !240)
!242 = !DILocation(line: 170, column: 21, scope: !240)
!243 = !DILocation(line: 171, column: 17, scope: !240)
!244 = !DILocation(line: 168, column: 37, scope: !236)
!245 = !DILocation(line: 168, column: 17, scope: !236)
!246 = distinct !{!246, !238, !247, !82}
!247 = !DILocation(line: 171, column: 17, scope: !233)
!248 = !DILocation(line: 172, column: 13, scope: !229)
!249 = !DILocation(line: 175, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !222, file: !13, line: 174, column: 13)
!251 = !DILocation(line: 178, column: 5, scope: !217)
!252 = !DILocation(line: 179, column: 1, scope: !187)
!253 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 182, type: !14, scopeLine: 183, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!254 = !DILocalVariable(name: "data", scope: !253, file: !13, line: 184, type: !18)
!255 = !DILocation(line: 184, column: 9, scope: !253)
!256 = !DILocation(line: 186, column: 10, scope: !253)
!257 = !DILocation(line: 187, column: 8, scope: !258)
!258 = distinct !DILexicalBlock(scope: !253, file: !13, line: 187, column: 8)
!259 = !DILocation(line: 187, column: 8, scope: !253)
!260 = !DILocation(line: 190, column: 9, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !13, line: 188, column: 5)
!262 = !DILocation(line: 191, column: 5, scope: !261)
!263 = !DILocation(line: 196, column: 14, scope: !264)
!264 = distinct !DILexicalBlock(scope: !258, file: !13, line: 193, column: 5)
!265 = !DILocation(line: 198, column: 8, scope: !266)
!266 = distinct !DILexicalBlock(scope: !253, file: !13, line: 198, column: 8)
!267 = !DILocation(line: 198, column: 8, scope: !253)
!268 = !DILocalVariable(name: "i", scope: !269, file: !13, line: 201, type: !18)
!269 = distinct !DILexicalBlock(scope: !270, file: !13, line: 200, column: 9)
!270 = distinct !DILexicalBlock(scope: !266, file: !13, line: 199, column: 5)
!271 = !DILocation(line: 201, column: 17, scope: !269)
!272 = !DILocalVariable(name: "buffer", scope: !269, file: !13, line: 202, type: !54)
!273 = !DILocation(line: 202, column: 17, scope: !269)
!274 = !DILocation(line: 205, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !269, file: !13, line: 205, column: 17)
!276 = !DILocation(line: 205, column: 22, scope: !275)
!277 = !DILocation(line: 205, column: 17, scope: !269)
!278 = !DILocation(line: 207, column: 24, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !13, line: 206, column: 13)
!280 = !DILocation(line: 207, column: 17, scope: !279)
!281 = !DILocation(line: 207, column: 30, scope: !279)
!282 = !DILocation(line: 209, column: 23, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !13, line: 209, column: 17)
!284 = !DILocation(line: 209, column: 21, scope: !283)
!285 = !DILocation(line: 209, column: 28, scope: !286)
!286 = distinct !DILexicalBlock(scope: !283, file: !13, line: 209, column: 17)
!287 = !DILocation(line: 209, column: 30, scope: !286)
!288 = !DILocation(line: 209, column: 17, scope: !283)
!289 = !DILocation(line: 211, column: 41, scope: !290)
!290 = distinct !DILexicalBlock(scope: !286, file: !13, line: 210, column: 17)
!291 = !DILocation(line: 211, column: 34, scope: !290)
!292 = !DILocation(line: 211, column: 21, scope: !290)
!293 = !DILocation(line: 212, column: 17, scope: !290)
!294 = !DILocation(line: 209, column: 37, scope: !286)
!295 = !DILocation(line: 209, column: 17, scope: !286)
!296 = distinct !{!296, !288, !297, !82}
!297 = !DILocation(line: 212, column: 17, scope: !283)
!298 = !DILocation(line: 213, column: 13, scope: !279)
!299 = !DILocation(line: 216, column: 17, scope: !300)
!300 = distinct !DILexicalBlock(scope: !275, file: !13, line: 215, column: 13)
!301 = !DILocation(line: 219, column: 5, scope: !270)
!302 = !DILocation(line: 220, column: 1, scope: !253)
!303 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 223, type: !14, scopeLine: 224, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!304 = !DILocalVariable(name: "data", scope: !303, file: !13, line: 225, type: !18)
!305 = !DILocation(line: 225, column: 9, scope: !303)
!306 = !DILocation(line: 227, column: 10, scope: !303)
!307 = !DILocation(line: 228, column: 8, scope: !308)
!308 = distinct !DILexicalBlock(scope: !303, file: !13, line: 228, column: 8)
!309 = !DILocation(line: 228, column: 8, scope: !303)
!310 = !DILocation(line: 232, column: 14, scope: !311)
!311 = distinct !DILexicalBlock(scope: !308, file: !13, line: 229, column: 5)
!312 = !DILocation(line: 233, column: 5, scope: !311)
!313 = !DILocation(line: 234, column: 8, scope: !314)
!314 = distinct !DILexicalBlock(scope: !303, file: !13, line: 234, column: 8)
!315 = !DILocation(line: 234, column: 8, scope: !303)
!316 = !DILocalVariable(name: "i", scope: !317, file: !13, line: 237, type: !18)
!317 = distinct !DILexicalBlock(scope: !318, file: !13, line: 236, column: 9)
!318 = distinct !DILexicalBlock(scope: !314, file: !13, line: 235, column: 5)
!319 = !DILocation(line: 237, column: 17, scope: !317)
!320 = !DILocalVariable(name: "buffer", scope: !317, file: !13, line: 238, type: !54)
!321 = !DILocation(line: 238, column: 17, scope: !317)
!322 = !DILocation(line: 241, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !317, file: !13, line: 241, column: 17)
!324 = !DILocation(line: 241, column: 22, scope: !323)
!325 = !DILocation(line: 241, column: 17, scope: !317)
!326 = !DILocation(line: 243, column: 24, scope: !327)
!327 = distinct !DILexicalBlock(scope: !323, file: !13, line: 242, column: 13)
!328 = !DILocation(line: 243, column: 17, scope: !327)
!329 = !DILocation(line: 243, column: 30, scope: !327)
!330 = !DILocation(line: 245, column: 23, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !13, line: 245, column: 17)
!332 = !DILocation(line: 245, column: 21, scope: !331)
!333 = !DILocation(line: 245, column: 28, scope: !334)
!334 = distinct !DILexicalBlock(scope: !331, file: !13, line: 245, column: 17)
!335 = !DILocation(line: 245, column: 30, scope: !334)
!336 = !DILocation(line: 245, column: 17, scope: !331)
!337 = !DILocation(line: 247, column: 41, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !13, line: 246, column: 17)
!339 = !DILocation(line: 247, column: 34, scope: !338)
!340 = !DILocation(line: 247, column: 21, scope: !338)
!341 = !DILocation(line: 248, column: 17, scope: !338)
!342 = !DILocation(line: 245, column: 37, scope: !334)
!343 = !DILocation(line: 245, column: 17, scope: !334)
!344 = distinct !{!344, !336, !345, !82}
!345 = !DILocation(line: 248, column: 17, scope: !331)
!346 = !DILocation(line: 249, column: 13, scope: !327)
!347 = !DILocation(line: 252, column: 17, scope: !348)
!348 = distinct !DILexicalBlock(scope: !323, file: !13, line: 251, column: 13)
!349 = !DILocation(line: 255, column: 5, scope: !318)
!350 = !DILocation(line: 256, column: 1, scope: !303)
