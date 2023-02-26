; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !10
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !13
@goodG2BStatic = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 -1, i32* %data, align 4, !dbg !30
  %call = call i32 @rand(), !dbg !31
  %and = and i32 %call, 1, !dbg !31
  %tobool = icmp ne i32 %and, 0, !dbg !31
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !31

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !31
  %shl = shl i32 %call1, 30, !dbg !31
  %call2 = call i32 @rand(), !dbg !31
  %shl3 = shl i32 %call2, 15, !dbg !31
  %xor = xor i32 %shl, %shl3, !dbg !31
  %call4 = call i32 @rand(), !dbg !31
  %xor5 = xor i32 %xor, %call4, !dbg !31
  br label %cond.end, !dbg !31

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !31
  %shl7 = shl i32 %call6, 30, !dbg !31
  %call8 = call i32 @rand(), !dbg !31
  %shl9 = shl i32 %call8, 15, !dbg !31
  %xor10 = xor i32 %shl7, %shl9, !dbg !31
  %call11 = call i32 @rand(), !dbg !31
  %xor12 = xor i32 %xor10, %call11, !dbg !31
  %sub = sub i32 0, %xor12, !dbg !31
  %sub13 = sub i32 %sub, 1, !dbg !31
  br label %cond.end, !dbg !31

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !31
  store i32 %cond, i32* %data, align 4, !dbg !32
  store i32 1, i32* @badStatic, align 4, !dbg !33
  %0 = load i32, i32* %data, align 4, !dbg !34
  call void @badSink(i32 noundef %0), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i32, i32* @badStatic, align 4, !dbg !42
  %tobool = icmp ne i32 %0, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.end16, !dbg !44

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !45, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !51
  %1 = bitcast i8* %call to i32*, !dbg !52
  store i32* %1, i32** %buffer, align 8, !dbg !50
  %2 = load i32*, i32** %buffer, align 8, !dbg !53
  %cmp = icmp eq i32* %2, null, !dbg !55
  br i1 %cmp, label %if.then1, label %if.end, !dbg !56

if.then1:                                         ; preds = %if.then
  call void @exit(i32 noundef -1) #6, !dbg !57
  unreachable, !dbg !57

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !62
  %cmp2 = icmp slt i32 %3, 10, !dbg !64
  br i1 %cmp2, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !66
  %5 = load i32, i32* %i, align 4, !dbg !68
  %idxprom = sext i32 %5 to i64, !dbg !66
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !66
  store i32 0, i32* %arrayidx, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !71
  %inc = add nsw i32 %6, 1, !dbg !71
  store i32 %inc, i32* %i, align 4, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !76
  %cmp3 = icmp sge i32 %7, 0, !dbg !78
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !79

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !80
  %9 = load i32, i32* %data.addr, align 4, !dbg !82
  %idxprom5 = sext i32 %9 to i64, !dbg !80
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !80
  store i32 1, i32* %arrayidx6, align 4, !dbg !83
  store i32 0, i32* %i, align 4, !dbg !84
  br label %for.cond7, !dbg !86

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !87
  %cmp8 = icmp slt i32 %10, 10, !dbg !89
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !90

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !91
  %12 = load i32, i32* %i, align 4, !dbg !93
  %idxprom10 = sext i32 %12 to i64, !dbg !91
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !91
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !91
  call void @printIntLine(i32 noundef %13), !dbg !94
  br label %for.inc12, !dbg !95

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !96
  %inc13 = add nsw i32 %14, 1, !dbg !96
  store i32 %inc13, i32* %i, align 4, !dbg !96
  br label %for.cond7, !dbg !97, !llvm.loop !98

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !100

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !101
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !103
  %16 = bitcast i32* %15 to i8*, !dbg !103
  call void @free(i8* noundef %16), !dbg !104
  br label %if.end16, !dbg !105

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_good() #0 !dbg !107 {
entry:
  call void @goodB2G1(), !dbg !108
  call void @goodB2G2(), !dbg !109
  call void @goodG2B(), !dbg !110
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !120, metadata !DIExpression()), !dbg !121
  %call = call i64 @time(i64* noundef null), !dbg !122
  %conv = trunc i64 %call to i32, !dbg !123
  call void @srand(i32 noundef %conv), !dbg !124
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !125
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_good(), !dbg !126
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !127
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !128
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_bad(), !dbg !129
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !130
  ret i32 0, !dbg !131
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

declare void @printIntLine(i32 noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !132 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !133, metadata !DIExpression()), !dbg !134
  store i32 -1, i32* %data, align 4, !dbg !135
  %call = call i32 @rand(), !dbg !136
  %and = and i32 %call, 1, !dbg !136
  %tobool = icmp ne i32 %and, 0, !dbg !136
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !136

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !136
  %shl = shl i32 %call1, 30, !dbg !136
  %call2 = call i32 @rand(), !dbg !136
  %shl3 = shl i32 %call2, 15, !dbg !136
  %xor = xor i32 %shl, %shl3, !dbg !136
  %call4 = call i32 @rand(), !dbg !136
  %xor5 = xor i32 %xor, %call4, !dbg !136
  br label %cond.end, !dbg !136

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !136
  %shl7 = shl i32 %call6, 30, !dbg !136
  %call8 = call i32 @rand(), !dbg !136
  %shl9 = shl i32 %call8, 15, !dbg !136
  %xor10 = xor i32 %shl7, %shl9, !dbg !136
  %call11 = call i32 @rand(), !dbg !136
  %xor12 = xor i32 %xor10, %call11, !dbg !136
  %sub = sub i32 0, %xor12, !dbg !136
  %sub13 = sub i32 %sub, 1, !dbg !136
  br label %cond.end, !dbg !136

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !136
  store i32 %cond, i32* %data, align 4, !dbg !137
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !138
  %0 = load i32, i32* %data, align 4, !dbg !139
  call void @goodB2G1Sink(i32 noundef %0), !dbg !140
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1Sink(i32 noundef %data) #0 !dbg !142 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !143, metadata !DIExpression()), !dbg !144
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !145
  %tobool = icmp ne i32 %0, 0, !dbg !145
  br i1 %tobool, label %if.then, label %if.else, !dbg !147

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !148
  br label %if.end18, !dbg !150

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !151, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !155, metadata !DIExpression()), !dbg !156
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !157
  %1 = bitcast i8* %call to i32*, !dbg !158
  store i32* %1, i32** %buffer, align 8, !dbg !156
  %2 = load i32*, i32** %buffer, align 8, !dbg !159
  %cmp = icmp eq i32* %2, null, !dbg !161
  br i1 %cmp, label %if.then1, label %if.end, !dbg !162

if.then1:                                         ; preds = %if.else
  call void @exit(i32 noundef -1) #6, !dbg !163
  unreachable, !dbg !163

if.end:                                           ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !168
  %cmp2 = icmp slt i32 %3, 10, !dbg !170
  br i1 %cmp2, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !172
  %5 = load i32, i32* %i, align 4, !dbg !174
  %idxprom = sext i32 %5 to i64, !dbg !172
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !172
  store i32 0, i32* %arrayidx, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !177
  %inc = add nsw i32 %6, 1, !dbg !177
  store i32 %inc, i32* %i, align 4, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !181
  %cmp3 = icmp sge i32 %7, 0, !dbg !183
  br i1 %cmp3, label %land.lhs.true, label %if.else16, !dbg !184

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !185
  %cmp4 = icmp slt i32 %8, 10, !dbg !186
  br i1 %cmp4, label %if.then5, label %if.else16, !dbg !187

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !188
  %10 = load i32, i32* %data.addr, align 4, !dbg !190
  %idxprom6 = sext i32 %10 to i64, !dbg !188
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !188
  store i32 1, i32* %arrayidx7, align 4, !dbg !191
  store i32 0, i32* %i, align 4, !dbg !192
  br label %for.cond8, !dbg !194

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !195
  %cmp9 = icmp slt i32 %11, 10, !dbg !197
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !198

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !199
  %13 = load i32, i32* %i, align 4, !dbg !201
  %idxprom11 = sext i32 %13 to i64, !dbg !199
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !199
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !199
  call void @printIntLine(i32 noundef %14), !dbg !202
  br label %for.inc13, !dbg !203

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !204
  %inc14 = add nsw i32 %15, 1, !dbg !204
  store i32 %inc14, i32* %i, align 4, !dbg !204
  br label %for.cond8, !dbg !205, !llvm.loop !206

for.end15:                                        ; preds = %for.cond8
  br label %if.end17, !dbg !208

if.else16:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !209
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !211
  %17 = bitcast i32* %16 to i8*, !dbg !211
  call void @free(i8* noundef %17), !dbg !212
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then
  ret void, !dbg !213
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !214 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !215, metadata !DIExpression()), !dbg !216
  store i32 -1, i32* %data, align 4, !dbg !217
  %call = call i32 @rand(), !dbg !218
  %and = and i32 %call, 1, !dbg !218
  %tobool = icmp ne i32 %and, 0, !dbg !218
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !218

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !218
  %shl = shl i32 %call1, 30, !dbg !218
  %call2 = call i32 @rand(), !dbg !218
  %shl3 = shl i32 %call2, 15, !dbg !218
  %xor = xor i32 %shl, %shl3, !dbg !218
  %call4 = call i32 @rand(), !dbg !218
  %xor5 = xor i32 %xor, %call4, !dbg !218
  br label %cond.end, !dbg !218

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !218
  %shl7 = shl i32 %call6, 30, !dbg !218
  %call8 = call i32 @rand(), !dbg !218
  %shl9 = shl i32 %call8, 15, !dbg !218
  %xor10 = xor i32 %shl7, %shl9, !dbg !218
  %call11 = call i32 @rand(), !dbg !218
  %xor12 = xor i32 %xor10, %call11, !dbg !218
  %sub = sub i32 0, %xor12, !dbg !218
  %sub13 = sub i32 %sub, 1, !dbg !218
  br label %cond.end, !dbg !218

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !218
  store i32 %cond, i32* %data, align 4, !dbg !219
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !220
  %0 = load i32, i32* %data, align 4, !dbg !221
  call void @goodB2G2Sink(i32 noundef %0), !dbg !222
  ret void, !dbg !223
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2Sink(i32 noundef %data) #0 !dbg !224 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !225, metadata !DIExpression()), !dbg !226
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !227
  %tobool = icmp ne i32 %0, 0, !dbg !227
  br i1 %tobool, label %if.then, label %if.end17, !dbg !229

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !230, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !234, metadata !DIExpression()), !dbg !235
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !236
  %1 = bitcast i8* %call to i32*, !dbg !237
  store i32* %1, i32** %buffer, align 8, !dbg !235
  %2 = load i32*, i32** %buffer, align 8, !dbg !238
  %cmp = icmp eq i32* %2, null, !dbg !240
  br i1 %cmp, label %if.then1, label %if.end, !dbg !241

if.then1:                                         ; preds = %if.then
  call void @exit(i32 noundef -1) #6, !dbg !242
  unreachable, !dbg !242

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !244
  br label %for.cond, !dbg !246

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !247
  %cmp2 = icmp slt i32 %3, 10, !dbg !249
  br i1 %cmp2, label %for.body, label %for.end, !dbg !250

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !251
  %5 = load i32, i32* %i, align 4, !dbg !253
  %idxprom = sext i32 %5 to i64, !dbg !251
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !251
  store i32 0, i32* %arrayidx, align 4, !dbg !254
  br label %for.inc, !dbg !255

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !256
  %inc = add nsw i32 %6, 1, !dbg !256
  store i32 %inc, i32* %i, align 4, !dbg !256
  br label %for.cond, !dbg !257, !llvm.loop !258

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !260
  %cmp3 = icmp sge i32 %7, 0, !dbg !262
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !263

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !264
  %cmp4 = icmp slt i32 %8, 10, !dbg !265
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !266

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !267
  %10 = load i32, i32* %data.addr, align 4, !dbg !269
  %idxprom6 = sext i32 %10 to i64, !dbg !267
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !267
  store i32 1, i32* %arrayidx7, align 4, !dbg !270
  store i32 0, i32* %i, align 4, !dbg !271
  br label %for.cond8, !dbg !273

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !274
  %cmp9 = icmp slt i32 %11, 10, !dbg !276
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !277

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !278
  %13 = load i32, i32* %i, align 4, !dbg !280
  %idxprom11 = sext i32 %13 to i64, !dbg !278
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !278
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !278
  call void @printIntLine(i32 noundef %14), !dbg !281
  br label %for.inc13, !dbg !282

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !283
  %inc14 = add nsw i32 %15, 1, !dbg !283
  store i32 %inc14, i32* %i, align 4, !dbg !283
  br label %for.cond8, !dbg !284, !llvm.loop !285

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !287

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !288
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !290
  %17 = bitcast i32* %16 to i8*, !dbg !290
  call void @free(i8* noundef %17), !dbg !291
  br label %if.end17, !dbg !292

if.end17:                                         ; preds = %if.end16, %entry
  ret void, !dbg !293
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !294 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !295, metadata !DIExpression()), !dbg !296
  store i32 -1, i32* %data, align 4, !dbg !297
  store i32 7, i32* %data, align 4, !dbg !298
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !299
  %0 = load i32, i32* %data, align 4, !dbg !300
  call void @goodG2BSink(i32 noundef %0), !dbg !301
  ret void, !dbg !302
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !303 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !304, metadata !DIExpression()), !dbg !305
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !306
  %tobool = icmp ne i32 %0, 0, !dbg !306
  br i1 %tobool, label %if.then, label %if.end16, !dbg !308

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !309, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !313, metadata !DIExpression()), !dbg !314
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !315
  %1 = bitcast i8* %call to i32*, !dbg !316
  store i32* %1, i32** %buffer, align 8, !dbg !314
  %2 = load i32*, i32** %buffer, align 8, !dbg !317
  %cmp = icmp eq i32* %2, null, !dbg !319
  br i1 %cmp, label %if.then1, label %if.end, !dbg !320

if.then1:                                         ; preds = %if.then
  call void @exit(i32 noundef -1) #6, !dbg !321
  unreachable, !dbg !321

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !323
  br label %for.cond, !dbg !325

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !326
  %cmp2 = icmp slt i32 %3, 10, !dbg !328
  br i1 %cmp2, label %for.body, label %for.end, !dbg !329

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !330
  %5 = load i32, i32* %i, align 4, !dbg !332
  %idxprom = sext i32 %5 to i64, !dbg !330
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !330
  store i32 0, i32* %arrayidx, align 4, !dbg !333
  br label %for.inc, !dbg !334

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !335
  %inc = add nsw i32 %6, 1, !dbg !335
  store i32 %inc, i32* %i, align 4, !dbg !335
  br label %for.cond, !dbg !336, !llvm.loop !337

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !339
  %cmp3 = icmp sge i32 %7, 0, !dbg !341
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !342

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !343
  %9 = load i32, i32* %data.addr, align 4, !dbg !345
  %idxprom5 = sext i32 %9 to i64, !dbg !343
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !343
  store i32 1, i32* %arrayidx6, align 4, !dbg !346
  store i32 0, i32* %i, align 4, !dbg !347
  br label %for.cond7, !dbg !349

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !350
  %cmp8 = icmp slt i32 %10, 10, !dbg !352
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !353

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !354
  %12 = load i32, i32* %i, align 4, !dbg !356
  %idxprom10 = sext i32 %12 to i64, !dbg !354
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !354
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !354
  call void @printIntLine(i32 noundef %13), !dbg !357
  br label %for.inc12, !dbg !358

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !359
  %inc13 = add nsw i32 %14, 1, !dbg !359
  store i32 %inc13, i32* %i, align 4, !dbg !359
  br label %for.cond7, !dbg !360, !llvm.loop !361

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !363

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !364
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !366
  %16 = bitcast i32* %15 to i8*, !dbg !366
  call void @free(i8* noundef %16), !dbg !367
  br label %if.end16, !dbg !368

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !369
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !12, line: 23, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !6, !7, !8}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !{!0, !10, !13, !15}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !12, line: 74, type: !5, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !12, line: 75, type: !5, isLocal: true, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !12, line: 76, type: !5, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Homebrew clang version 14.0.6"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_bad", scope: !12, file: !12, line: 58, type: !25, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !{}
!28 = !DILocalVariable(name: "data", scope: !24, file: !12, line: 60, type: !5)
!29 = !DILocation(line: 60, column: 9, scope: !24)
!30 = !DILocation(line: 62, column: 10, scope: !24)
!31 = !DILocation(line: 64, column: 12, scope: !24)
!32 = !DILocation(line: 64, column: 10, scope: !24)
!33 = !DILocation(line: 65, column: 15, scope: !24)
!34 = !DILocation(line: 66, column: 13, scope: !24)
!35 = !DILocation(line: 66, column: 5, scope: !24)
!36 = !DILocation(line: 67, column: 1, scope: !24)
!37 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 25, type: !38, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !5}
!40 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !12, line: 25, type: !5)
!41 = !DILocation(line: 25, column: 25, scope: !37)
!42 = !DILocation(line: 27, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !12, line: 27, column: 8)
!44 = !DILocation(line: 27, column: 8, scope: !37)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 30, type: !5)
!46 = distinct !DILexicalBlock(scope: !47, file: !12, line: 29, column: 9)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 28, column: 5)
!48 = !DILocation(line: 30, column: 17, scope: !46)
!49 = !DILocalVariable(name: "buffer", scope: !46, file: !12, line: 31, type: !7)
!50 = !DILocation(line: 31, column: 19, scope: !46)
!51 = !DILocation(line: 31, column: 35, scope: !46)
!52 = !DILocation(line: 31, column: 28, scope: !46)
!53 = !DILocation(line: 32, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !46, file: !12, line: 32, column: 17)
!55 = !DILocation(line: 32, column: 24, scope: !54)
!56 = !DILocation(line: 32, column: 17, scope: !46)
!57 = !DILocation(line: 32, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !12, line: 32, column: 33)
!59 = !DILocation(line: 34, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !46, file: !12, line: 34, column: 13)
!61 = !DILocation(line: 34, column: 18, scope: !60)
!62 = !DILocation(line: 34, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !12, line: 34, column: 13)
!64 = !DILocation(line: 34, column: 27, scope: !63)
!65 = !DILocation(line: 34, column: 13, scope: !60)
!66 = !DILocation(line: 36, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !12, line: 35, column: 13)
!68 = !DILocation(line: 36, column: 24, scope: !67)
!69 = !DILocation(line: 36, column: 27, scope: !67)
!70 = !DILocation(line: 37, column: 13, scope: !67)
!71 = !DILocation(line: 34, column: 34, scope: !63)
!72 = !DILocation(line: 34, column: 13, scope: !63)
!73 = distinct !{!73, !65, !74, !75}
!74 = !DILocation(line: 37, column: 13, scope: !60)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 40, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !46, file: !12, line: 40, column: 17)
!78 = !DILocation(line: 40, column: 22, scope: !77)
!79 = !DILocation(line: 40, column: 17, scope: !46)
!80 = !DILocation(line: 42, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !12, line: 41, column: 13)
!82 = !DILocation(line: 42, column: 24, scope: !81)
!83 = !DILocation(line: 42, column: 30, scope: !81)
!84 = !DILocation(line: 44, column: 23, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !12, line: 44, column: 17)
!86 = !DILocation(line: 44, column: 21, scope: !85)
!87 = !DILocation(line: 44, column: 28, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !12, line: 44, column: 17)
!89 = !DILocation(line: 44, column: 30, scope: !88)
!90 = !DILocation(line: 44, column: 17, scope: !85)
!91 = !DILocation(line: 46, column: 34, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !12, line: 45, column: 17)
!93 = !DILocation(line: 46, column: 41, scope: !92)
!94 = !DILocation(line: 46, column: 21, scope: !92)
!95 = !DILocation(line: 47, column: 17, scope: !92)
!96 = !DILocation(line: 44, column: 37, scope: !88)
!97 = !DILocation(line: 44, column: 17, scope: !88)
!98 = distinct !{!98, !90, !99, !75}
!99 = !DILocation(line: 47, column: 17, scope: !85)
!100 = !DILocation(line: 48, column: 13, scope: !81)
!101 = !DILocation(line: 51, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !77, file: !12, line: 50, column: 13)
!103 = !DILocation(line: 53, column: 18, scope: !46)
!104 = !DILocation(line: 53, column: 13, scope: !46)
!105 = !DILocation(line: 55, column: 5, scope: !47)
!106 = !DILocation(line: 56, column: 1, scope: !37)
!107 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_21_good", scope: !12, file: !12, line: 217, type: !25, scopeLine: 218, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!108 = !DILocation(line: 219, column: 5, scope: !107)
!109 = !DILocation(line: 220, column: 5, scope: !107)
!110 = !DILocation(line: 221, column: 5, scope: !107)
!111 = !DILocation(line: 222, column: 1, scope: !107)
!112 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 233, type: !113, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!113 = !DISubroutineType(types: !114)
!114 = !{!5, !5, !115}
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!118 = !DILocalVariable(name: "argc", arg: 1, scope: !112, file: !12, line: 233, type: !5)
!119 = !DILocation(line: 233, column: 14, scope: !112)
!120 = !DILocalVariable(name: "argv", arg: 2, scope: !112, file: !12, line: 233, type: !115)
!121 = !DILocation(line: 233, column: 27, scope: !112)
!122 = !DILocation(line: 236, column: 22, scope: !112)
!123 = !DILocation(line: 236, column: 12, scope: !112)
!124 = !DILocation(line: 236, column: 5, scope: !112)
!125 = !DILocation(line: 238, column: 5, scope: !112)
!126 = !DILocation(line: 239, column: 5, scope: !112)
!127 = !DILocation(line: 240, column: 5, scope: !112)
!128 = !DILocation(line: 243, column: 5, scope: !112)
!129 = !DILocation(line: 244, column: 5, scope: !112)
!130 = !DILocation(line: 245, column: 5, scope: !112)
!131 = !DILocation(line: 247, column: 5, scope: !112)
!132 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 116, type: !25, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!133 = !DILocalVariable(name: "data", scope: !132, file: !12, line: 118, type: !5)
!134 = !DILocation(line: 118, column: 9, scope: !132)
!135 = !DILocation(line: 120, column: 10, scope: !132)
!136 = !DILocation(line: 122, column: 12, scope: !132)
!137 = !DILocation(line: 122, column: 10, scope: !132)
!138 = !DILocation(line: 123, column: 20, scope: !132)
!139 = !DILocation(line: 124, column: 18, scope: !132)
!140 = !DILocation(line: 124, column: 5, scope: !132)
!141 = !DILocation(line: 125, column: 1, scope: !132)
!142 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !12, file: !12, line: 79, type: !38, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!143 = !DILocalVariable(name: "data", arg: 1, scope: !142, file: !12, line: 79, type: !5)
!144 = !DILocation(line: 79, column: 30, scope: !142)
!145 = !DILocation(line: 81, column: 8, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !12, line: 81, column: 8)
!147 = !DILocation(line: 81, column: 8, scope: !142)
!148 = !DILocation(line: 84, column: 9, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !12, line: 82, column: 5)
!150 = !DILocation(line: 85, column: 5, scope: !149)
!151 = !DILocalVariable(name: "i", scope: !152, file: !12, line: 89, type: !5)
!152 = distinct !DILexicalBlock(scope: !153, file: !12, line: 88, column: 9)
!153 = distinct !DILexicalBlock(scope: !146, file: !12, line: 87, column: 5)
!154 = !DILocation(line: 89, column: 17, scope: !152)
!155 = !DILocalVariable(name: "buffer", scope: !152, file: !12, line: 90, type: !7)
!156 = !DILocation(line: 90, column: 19, scope: !152)
!157 = !DILocation(line: 90, column: 35, scope: !152)
!158 = !DILocation(line: 90, column: 28, scope: !152)
!159 = !DILocation(line: 91, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !152, file: !12, line: 91, column: 17)
!161 = !DILocation(line: 91, column: 24, scope: !160)
!162 = !DILocation(line: 91, column: 17, scope: !152)
!163 = !DILocation(line: 91, column: 34, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !12, line: 91, column: 33)
!165 = !DILocation(line: 93, column: 20, scope: !166)
!166 = distinct !DILexicalBlock(scope: !152, file: !12, line: 93, column: 13)
!167 = !DILocation(line: 93, column: 18, scope: !166)
!168 = !DILocation(line: 93, column: 25, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !12, line: 93, column: 13)
!170 = !DILocation(line: 93, column: 27, scope: !169)
!171 = !DILocation(line: 93, column: 13, scope: !166)
!172 = !DILocation(line: 95, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !12, line: 94, column: 13)
!174 = !DILocation(line: 95, column: 24, scope: !173)
!175 = !DILocation(line: 95, column: 27, scope: !173)
!176 = !DILocation(line: 96, column: 13, scope: !173)
!177 = !DILocation(line: 93, column: 34, scope: !169)
!178 = !DILocation(line: 93, column: 13, scope: !169)
!179 = distinct !{!179, !171, !180, !75}
!180 = !DILocation(line: 96, column: 13, scope: !166)
!181 = !DILocation(line: 98, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !152, file: !12, line: 98, column: 17)
!183 = !DILocation(line: 98, column: 22, scope: !182)
!184 = !DILocation(line: 98, column: 27, scope: !182)
!185 = !DILocation(line: 98, column: 30, scope: !182)
!186 = !DILocation(line: 98, column: 35, scope: !182)
!187 = !DILocation(line: 98, column: 17, scope: !152)
!188 = !DILocation(line: 100, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !182, file: !12, line: 99, column: 13)
!190 = !DILocation(line: 100, column: 24, scope: !189)
!191 = !DILocation(line: 100, column: 30, scope: !189)
!192 = !DILocation(line: 102, column: 23, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !12, line: 102, column: 17)
!194 = !DILocation(line: 102, column: 21, scope: !193)
!195 = !DILocation(line: 102, column: 28, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !12, line: 102, column: 17)
!197 = !DILocation(line: 102, column: 30, scope: !196)
!198 = !DILocation(line: 102, column: 17, scope: !193)
!199 = !DILocation(line: 104, column: 34, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !12, line: 103, column: 17)
!201 = !DILocation(line: 104, column: 41, scope: !200)
!202 = !DILocation(line: 104, column: 21, scope: !200)
!203 = !DILocation(line: 105, column: 17, scope: !200)
!204 = !DILocation(line: 102, column: 37, scope: !196)
!205 = !DILocation(line: 102, column: 17, scope: !196)
!206 = distinct !{!206, !198, !207, !75}
!207 = !DILocation(line: 105, column: 17, scope: !193)
!208 = !DILocation(line: 106, column: 13, scope: !189)
!209 = !DILocation(line: 109, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !182, file: !12, line: 108, column: 13)
!211 = !DILocation(line: 111, column: 18, scope: !152)
!212 = !DILocation(line: 111, column: 13, scope: !152)
!213 = !DILocation(line: 114, column: 1, scope: !142)
!214 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 160, type: !25, scopeLine: 161, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!215 = !DILocalVariable(name: "data", scope: !214, file: !12, line: 162, type: !5)
!216 = !DILocation(line: 162, column: 9, scope: !214)
!217 = !DILocation(line: 164, column: 10, scope: !214)
!218 = !DILocation(line: 166, column: 12, scope: !214)
!219 = !DILocation(line: 166, column: 10, scope: !214)
!220 = !DILocation(line: 167, column: 20, scope: !214)
!221 = !DILocation(line: 168, column: 18, scope: !214)
!222 = !DILocation(line: 168, column: 5, scope: !214)
!223 = !DILocation(line: 169, column: 1, scope: !214)
!224 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !12, file: !12, line: 128, type: !38, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!225 = !DILocalVariable(name: "data", arg: 1, scope: !224, file: !12, line: 128, type: !5)
!226 = !DILocation(line: 128, column: 30, scope: !224)
!227 = !DILocation(line: 130, column: 8, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !12, line: 130, column: 8)
!229 = !DILocation(line: 130, column: 8, scope: !224)
!230 = !DILocalVariable(name: "i", scope: !231, file: !12, line: 133, type: !5)
!231 = distinct !DILexicalBlock(scope: !232, file: !12, line: 132, column: 9)
!232 = distinct !DILexicalBlock(scope: !228, file: !12, line: 131, column: 5)
!233 = !DILocation(line: 133, column: 17, scope: !231)
!234 = !DILocalVariable(name: "buffer", scope: !231, file: !12, line: 134, type: !7)
!235 = !DILocation(line: 134, column: 19, scope: !231)
!236 = !DILocation(line: 134, column: 35, scope: !231)
!237 = !DILocation(line: 134, column: 28, scope: !231)
!238 = !DILocation(line: 135, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !231, file: !12, line: 135, column: 17)
!240 = !DILocation(line: 135, column: 24, scope: !239)
!241 = !DILocation(line: 135, column: 17, scope: !231)
!242 = !DILocation(line: 135, column: 34, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !12, line: 135, column: 33)
!244 = !DILocation(line: 137, column: 20, scope: !245)
!245 = distinct !DILexicalBlock(scope: !231, file: !12, line: 137, column: 13)
!246 = !DILocation(line: 137, column: 18, scope: !245)
!247 = !DILocation(line: 137, column: 25, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !12, line: 137, column: 13)
!249 = !DILocation(line: 137, column: 27, scope: !248)
!250 = !DILocation(line: 137, column: 13, scope: !245)
!251 = !DILocation(line: 139, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !12, line: 138, column: 13)
!253 = !DILocation(line: 139, column: 24, scope: !252)
!254 = !DILocation(line: 139, column: 27, scope: !252)
!255 = !DILocation(line: 140, column: 13, scope: !252)
!256 = !DILocation(line: 137, column: 34, scope: !248)
!257 = !DILocation(line: 137, column: 13, scope: !248)
!258 = distinct !{!258, !250, !259, !75}
!259 = !DILocation(line: 140, column: 13, scope: !245)
!260 = !DILocation(line: 142, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !231, file: !12, line: 142, column: 17)
!262 = !DILocation(line: 142, column: 22, scope: !261)
!263 = !DILocation(line: 142, column: 27, scope: !261)
!264 = !DILocation(line: 142, column: 30, scope: !261)
!265 = !DILocation(line: 142, column: 35, scope: !261)
!266 = !DILocation(line: 142, column: 17, scope: !231)
!267 = !DILocation(line: 144, column: 17, scope: !268)
!268 = distinct !DILexicalBlock(scope: !261, file: !12, line: 143, column: 13)
!269 = !DILocation(line: 144, column: 24, scope: !268)
!270 = !DILocation(line: 144, column: 30, scope: !268)
!271 = !DILocation(line: 146, column: 23, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !12, line: 146, column: 17)
!273 = !DILocation(line: 146, column: 21, scope: !272)
!274 = !DILocation(line: 146, column: 28, scope: !275)
!275 = distinct !DILexicalBlock(scope: !272, file: !12, line: 146, column: 17)
!276 = !DILocation(line: 146, column: 30, scope: !275)
!277 = !DILocation(line: 146, column: 17, scope: !272)
!278 = !DILocation(line: 148, column: 34, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !12, line: 147, column: 17)
!280 = !DILocation(line: 148, column: 41, scope: !279)
!281 = !DILocation(line: 148, column: 21, scope: !279)
!282 = !DILocation(line: 149, column: 17, scope: !279)
!283 = !DILocation(line: 146, column: 37, scope: !275)
!284 = !DILocation(line: 146, column: 17, scope: !275)
!285 = distinct !{!285, !277, !286, !75}
!286 = !DILocation(line: 149, column: 17, scope: !272)
!287 = !DILocation(line: 150, column: 13, scope: !268)
!288 = !DILocation(line: 153, column: 17, scope: !289)
!289 = distinct !DILexicalBlock(scope: !261, file: !12, line: 152, column: 13)
!290 = !DILocation(line: 155, column: 18, scope: !231)
!291 = !DILocation(line: 155, column: 13, scope: !231)
!292 = !DILocation(line: 157, column: 5, scope: !232)
!293 = !DILocation(line: 158, column: 1, scope: !224)
!294 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 205, type: !25, scopeLine: 206, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!295 = !DILocalVariable(name: "data", scope: !294, file: !12, line: 207, type: !5)
!296 = !DILocation(line: 207, column: 9, scope: !294)
!297 = !DILocation(line: 209, column: 10, scope: !294)
!298 = !DILocation(line: 212, column: 10, scope: !294)
!299 = !DILocation(line: 213, column: 19, scope: !294)
!300 = !DILocation(line: 214, column: 17, scope: !294)
!301 = !DILocation(line: 214, column: 5, scope: !294)
!302 = !DILocation(line: 215, column: 1, scope: !294)
!303 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 172, type: !38, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!304 = !DILocalVariable(name: "data", arg: 1, scope: !303, file: !12, line: 172, type: !5)
!305 = !DILocation(line: 172, column: 29, scope: !303)
!306 = !DILocation(line: 174, column: 8, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !12, line: 174, column: 8)
!308 = !DILocation(line: 174, column: 8, scope: !303)
!309 = !DILocalVariable(name: "i", scope: !310, file: !12, line: 177, type: !5)
!310 = distinct !DILexicalBlock(scope: !311, file: !12, line: 176, column: 9)
!311 = distinct !DILexicalBlock(scope: !307, file: !12, line: 175, column: 5)
!312 = !DILocation(line: 177, column: 17, scope: !310)
!313 = !DILocalVariable(name: "buffer", scope: !310, file: !12, line: 178, type: !7)
!314 = !DILocation(line: 178, column: 19, scope: !310)
!315 = !DILocation(line: 178, column: 35, scope: !310)
!316 = !DILocation(line: 178, column: 28, scope: !310)
!317 = !DILocation(line: 179, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !310, file: !12, line: 179, column: 17)
!319 = !DILocation(line: 179, column: 24, scope: !318)
!320 = !DILocation(line: 179, column: 17, scope: !310)
!321 = !DILocation(line: 179, column: 34, scope: !322)
!322 = distinct !DILexicalBlock(scope: !318, file: !12, line: 179, column: 33)
!323 = !DILocation(line: 181, column: 20, scope: !324)
!324 = distinct !DILexicalBlock(scope: !310, file: !12, line: 181, column: 13)
!325 = !DILocation(line: 181, column: 18, scope: !324)
!326 = !DILocation(line: 181, column: 25, scope: !327)
!327 = distinct !DILexicalBlock(scope: !324, file: !12, line: 181, column: 13)
!328 = !DILocation(line: 181, column: 27, scope: !327)
!329 = !DILocation(line: 181, column: 13, scope: !324)
!330 = !DILocation(line: 183, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !12, line: 182, column: 13)
!332 = !DILocation(line: 183, column: 24, scope: !331)
!333 = !DILocation(line: 183, column: 27, scope: !331)
!334 = !DILocation(line: 184, column: 13, scope: !331)
!335 = !DILocation(line: 181, column: 34, scope: !327)
!336 = !DILocation(line: 181, column: 13, scope: !327)
!337 = distinct !{!337, !329, !338, !75}
!338 = !DILocation(line: 184, column: 13, scope: !324)
!339 = !DILocation(line: 187, column: 17, scope: !340)
!340 = distinct !DILexicalBlock(scope: !310, file: !12, line: 187, column: 17)
!341 = !DILocation(line: 187, column: 22, scope: !340)
!342 = !DILocation(line: 187, column: 17, scope: !310)
!343 = !DILocation(line: 189, column: 17, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !12, line: 188, column: 13)
!345 = !DILocation(line: 189, column: 24, scope: !344)
!346 = !DILocation(line: 189, column: 30, scope: !344)
!347 = !DILocation(line: 191, column: 23, scope: !348)
!348 = distinct !DILexicalBlock(scope: !344, file: !12, line: 191, column: 17)
!349 = !DILocation(line: 191, column: 21, scope: !348)
!350 = !DILocation(line: 191, column: 28, scope: !351)
!351 = distinct !DILexicalBlock(scope: !348, file: !12, line: 191, column: 17)
!352 = !DILocation(line: 191, column: 30, scope: !351)
!353 = !DILocation(line: 191, column: 17, scope: !348)
!354 = !DILocation(line: 193, column: 34, scope: !355)
!355 = distinct !DILexicalBlock(scope: !351, file: !12, line: 192, column: 17)
!356 = !DILocation(line: 193, column: 41, scope: !355)
!357 = !DILocation(line: 193, column: 21, scope: !355)
!358 = !DILocation(line: 194, column: 17, scope: !355)
!359 = !DILocation(line: 191, column: 37, scope: !351)
!360 = !DILocation(line: 191, column: 17, scope: !351)
!361 = distinct !{!361, !353, !362, !75}
!362 = !DILocation(line: 194, column: 17, scope: !348)
!363 = !DILocation(line: 195, column: 13, scope: !344)
!364 = !DILocation(line: 198, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !340, file: !12, line: 197, column: 13)
!366 = !DILocation(line: 200, column: 18, scope: !310)
!367 = !DILocation(line: 200, column: 13, scope: !310)
!368 = !DILocation(line: 202, column: 5, scope: !311)
!369 = !DILocation(line: 203, column: 1, scope: !303)
