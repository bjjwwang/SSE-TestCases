; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %0 = load i32, i32* %data, align 4, !dbg !22
  %call = call i32 @badSource(i32 noundef %0), !dbg !23
  store i32 %call, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %i, metadata !25, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !28, metadata !DIExpression()), !dbg !29
  %call1 = call i8* @malloc(i64 noundef 40) #5, !dbg !30
  %1 = bitcast i8* %call1 to i32*, !dbg !31
  store i32* %1, i32** %buffer, align 8, !dbg !29
  %2 = load i32*, i32** %buffer, align 8, !dbg !32
  %cmp = icmp eq i32* %2, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !41
  %cmp2 = icmp slt i32 %3, 10, !dbg !43
  br i1 %cmp2, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !45
  %5 = load i32, i32* %i, align 4, !dbg !47
  %idxprom = sext i32 %5 to i64, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %6, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !55
  %cmp3 = icmp sge i32 %7, 0, !dbg !57
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !58

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !59
  %9 = load i32, i32* %data, align 4, !dbg !61
  %idxprom5 = sext i32 %9 to i64, !dbg !59
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !59
  store i32 1, i32* %arrayidx6, align 4, !dbg !62
  store i32 0, i32* %i, align 4, !dbg !63
  br label %for.cond7, !dbg !65

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !66
  %cmp8 = icmp slt i32 %10, 10, !dbg !68
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !69

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !70
  %12 = load i32, i32* %i, align 4, !dbg !72
  %idxprom10 = sext i32 %12 to i64, !dbg !70
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !70
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !70
  call void @printIntLine(i32 noundef %13), !dbg !73
  br label %for.inc12, !dbg !74

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !75
  %inc13 = add nsw i32 %14, 1, !dbg !75
  store i32 %inc13, i32* %i, align 4, !dbg !75
  br label %for.cond7, !dbg !76, !llvm.loop !77

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !79

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !80
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !82
  %16 = bitcast i32* %15 to i8*, !dbg !82
  call void @free(i8* noundef %16), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @badSource(i32 noundef %data) #0 !dbg !85 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i32 @rand(), !dbg !90
  %and = and i32 %call, 1, !dbg !90
  %tobool = icmp ne i32 %and, 0, !dbg !90
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !90

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !90
  %shl = shl i32 %call1, 30, !dbg !90
  %call2 = call i32 @rand(), !dbg !90
  %shl3 = shl i32 %call2, 15, !dbg !90
  %xor = xor i32 %shl, %shl3, !dbg !90
  %call4 = call i32 @rand(), !dbg !90
  %xor5 = xor i32 %xor, %call4, !dbg !90
  br label %cond.end, !dbg !90

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !90
  %shl7 = shl i32 %call6, 30, !dbg !90
  %call8 = call i32 @rand(), !dbg !90
  %shl9 = shl i32 %call8, 15, !dbg !90
  %xor10 = xor i32 %shl7, %shl9, !dbg !90
  %call11 = call i32 @rand(), !dbg !90
  %xor12 = xor i32 %xor10, %call11, !dbg !90
  %sub = sub i32 0, %xor12, !dbg !90
  %sub13 = sub i32 %sub, 1, !dbg !90
  br label %cond.end, !dbg !90

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !90
  store i32 %cond, i32* %data.addr, align 4, !dbg !91
  %0 = load i32, i32* %data.addr, align 4, !dbg !92
  ret i32 %0, !dbg !93
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare void @printIntLine(i32 noundef) #4

declare void @printLine(i8* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_42_good() #0 !dbg !94 {
entry:
  call void @goodB2G(), !dbg !95
  call void @goodG2B(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !98 {
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
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_42_good(), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_42_bad(), !dbg !115
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare i32 @rand() #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !118 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i32 -1, i32* %data, align 4, !dbg !121
  %0 = load i32, i32* %data, align 4, !dbg !122
  %call = call i32 @goodB2GSource(i32 noundef %0), !dbg !123
  store i32 %call, i32* %data, align 4, !dbg !124
  call void @llvm.dbg.declare(metadata i32* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !128, metadata !DIExpression()), !dbg !129
  %call1 = call i8* @malloc(i64 noundef 40) #5, !dbg !130
  %1 = bitcast i8* %call1 to i32*, !dbg !131
  store i32* %1, i32** %buffer, align 8, !dbg !129
  %2 = load i32*, i32** %buffer, align 8, !dbg !132
  %cmp = icmp eq i32* %2, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !141
  %cmp2 = icmp slt i32 %3, 10, !dbg !143
  br i1 %cmp2, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !145
  %5 = load i32, i32* %i, align 4, !dbg !147
  %idxprom = sext i32 %5 to i64, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !150
  %inc = add nsw i32 %6, 1, !dbg !150
  store i32 %inc, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !154
  %cmp3 = icmp sge i32 %7, 0, !dbg !156
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !157

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !158
  %cmp4 = icmp slt i32 %8, 10, !dbg !159
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !160

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !161
  %10 = load i32, i32* %data, align 4, !dbg !163
  %idxprom6 = sext i32 %10 to i64, !dbg !161
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !161
  store i32 1, i32* %arrayidx7, align 4, !dbg !164
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond8, !dbg !167

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !168
  %cmp9 = icmp slt i32 %11, 10, !dbg !170
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !171

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !172
  %13 = load i32, i32* %i, align 4, !dbg !174
  %idxprom11 = sext i32 %13 to i64, !dbg !172
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !172
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !172
  call void @printIntLine(i32 noundef %14), !dbg !175
  br label %for.inc13, !dbg !176

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !177
  %inc14 = add nsw i32 %15, 1, !dbg !177
  store i32 %inc14, i32* %i, align 4, !dbg !177
  br label %for.cond8, !dbg !178, !llvm.loop !179

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !181

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !182
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !184
  %17 = bitcast i32* %16 to i8*, !dbg !184
  call void @free(i8* noundef %17), !dbg !185
  ret void, !dbg !186
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodB2GSource(i32 noundef %data) #0 !dbg !187 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !188, metadata !DIExpression()), !dbg !189
  %call = call i32 @rand(), !dbg !190
  %and = and i32 %call, 1, !dbg !190
  %tobool = icmp ne i32 %and, 0, !dbg !190
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !190

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !190
  %shl = shl i32 %call1, 30, !dbg !190
  %call2 = call i32 @rand(), !dbg !190
  %shl3 = shl i32 %call2, 15, !dbg !190
  %xor = xor i32 %shl, %shl3, !dbg !190
  %call4 = call i32 @rand(), !dbg !190
  %xor5 = xor i32 %xor, %call4, !dbg !190
  br label %cond.end, !dbg !190

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !190
  %shl7 = shl i32 %call6, 30, !dbg !190
  %call8 = call i32 @rand(), !dbg !190
  %shl9 = shl i32 %call8, 15, !dbg !190
  %xor10 = xor i32 %shl7, %shl9, !dbg !190
  %call11 = call i32 @rand(), !dbg !190
  %xor12 = xor i32 %xor10, %call11, !dbg !190
  %sub = sub i32 0, %xor12, !dbg !190
  %sub13 = sub i32 %sub, 1, !dbg !190
  br label %cond.end, !dbg !190

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !190
  store i32 %cond, i32* %data.addr, align 4, !dbg !191
  %0 = load i32, i32* %data.addr, align 4, !dbg !192
  ret i32 %0, !dbg !193
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !194 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !195, metadata !DIExpression()), !dbg !196
  store i32 -1, i32* %data, align 4, !dbg !197
  %0 = load i32, i32* %data, align 4, !dbg !198
  %call = call i32 @goodG2BSource(i32 noundef %0), !dbg !199
  store i32 %call, i32* %data, align 4, !dbg !200
  call void @llvm.dbg.declare(metadata i32* %i, metadata !201, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !204, metadata !DIExpression()), !dbg !205
  %call1 = call i8* @malloc(i64 noundef 40) #5, !dbg !206
  %1 = bitcast i8* %call1 to i32*, !dbg !207
  store i32* %1, i32** %buffer, align 8, !dbg !205
  %2 = load i32*, i32** %buffer, align 8, !dbg !208
  %cmp = icmp eq i32* %2, null, !dbg !210
  br i1 %cmp, label %if.then, label %if.end, !dbg !211

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !212
  unreachable, !dbg !212

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond, !dbg !216

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !217
  %cmp2 = icmp slt i32 %3, 10, !dbg !219
  br i1 %cmp2, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !221
  %5 = load i32, i32* %i, align 4, !dbg !223
  %idxprom = sext i32 %5 to i64, !dbg !221
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !221
  store i32 0, i32* %arrayidx, align 4, !dbg !224
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !226
  %inc = add nsw i32 %6, 1, !dbg !226
  store i32 %inc, i32* %i, align 4, !dbg !226
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !230
  %cmp3 = icmp sge i32 %7, 0, !dbg !232
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !233

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !234
  %9 = load i32, i32* %data, align 4, !dbg !236
  %idxprom5 = sext i32 %9 to i64, !dbg !234
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !234
  store i32 1, i32* %arrayidx6, align 4, !dbg !237
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond7, !dbg !240

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !241
  %cmp8 = icmp slt i32 %10, 10, !dbg !243
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !244

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !245
  %12 = load i32, i32* %i, align 4, !dbg !247
  %idxprom10 = sext i32 %12 to i64, !dbg !245
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !245
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !245
  call void @printIntLine(i32 noundef %13), !dbg !248
  br label %for.inc12, !dbg !249

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !250
  %inc13 = add nsw i32 %14, 1, !dbg !250
  store i32 %inc13, i32* %i, align 4, !dbg !250
  br label %for.cond7, !dbg !251, !llvm.loop !252

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !254

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !255
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !257
  %16 = bitcast i32* %15 to i8*, !dbg !257
  call void @free(i8* noundef %16), !dbg !258
  ret void, !dbg !259
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodG2BSource(i32 noundef %data) #0 !dbg !260 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !261, metadata !DIExpression()), !dbg !262
  store i32 7, i32* %data.addr, align 4, !dbg !263
  %0 = load i32, i32* %data.addr, align 4, !dbg !264
  ret i32 %0, !dbg !265
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6, !4}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_42_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 9, scope: !14)
!21 = !DILocation(line: 33, column: 10, scope: !14)
!22 = !DILocation(line: 34, column: 22, scope: !14)
!23 = !DILocation(line: 34, column: 12, scope: !14)
!24 = !DILocation(line: 34, column: 10, scope: !14)
!25 = !DILocalVariable(name: "i", scope: !26, file: !15, line: 36, type: !4)
!26 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!27 = !DILocation(line: 36, column: 13, scope: !26)
!28 = !DILocalVariable(name: "buffer", scope: !26, file: !15, line: 37, type: !3)
!29 = !DILocation(line: 37, column: 15, scope: !26)
!30 = !DILocation(line: 37, column: 31, scope: !26)
!31 = !DILocation(line: 37, column: 24, scope: !26)
!32 = !DILocation(line: 38, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !15, line: 38, column: 13)
!34 = !DILocation(line: 38, column: 20, scope: !33)
!35 = !DILocation(line: 38, column: 13, scope: !26)
!36 = !DILocation(line: 38, column: 30, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !15, line: 38, column: 29)
!38 = !DILocation(line: 40, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !26, file: !15, line: 40, column: 9)
!40 = !DILocation(line: 40, column: 14, scope: !39)
!41 = !DILocation(line: 40, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !15, line: 40, column: 9)
!43 = !DILocation(line: 40, column: 23, scope: !42)
!44 = !DILocation(line: 40, column: 9, scope: !39)
!45 = !DILocation(line: 42, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 41, column: 9)
!47 = !DILocation(line: 42, column: 20, scope: !46)
!48 = !DILocation(line: 42, column: 23, scope: !46)
!49 = !DILocation(line: 43, column: 9, scope: !46)
!50 = !DILocation(line: 40, column: 30, scope: !42)
!51 = !DILocation(line: 40, column: 9, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 43, column: 9, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 46, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !26, file: !15, line: 46, column: 13)
!57 = !DILocation(line: 46, column: 18, scope: !56)
!58 = !DILocation(line: 46, column: 13, scope: !26)
!59 = !DILocation(line: 48, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !15, line: 47, column: 9)
!61 = !DILocation(line: 48, column: 20, scope: !60)
!62 = !DILocation(line: 48, column: 26, scope: !60)
!63 = !DILocation(line: 50, column: 19, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !15, line: 50, column: 13)
!65 = !DILocation(line: 50, column: 17, scope: !64)
!66 = !DILocation(line: 50, column: 24, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !15, line: 50, column: 13)
!68 = !DILocation(line: 50, column: 26, scope: !67)
!69 = !DILocation(line: 50, column: 13, scope: !64)
!70 = !DILocation(line: 52, column: 30, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 51, column: 13)
!72 = !DILocation(line: 52, column: 37, scope: !71)
!73 = !DILocation(line: 52, column: 17, scope: !71)
!74 = !DILocation(line: 53, column: 13, scope: !71)
!75 = !DILocation(line: 50, column: 33, scope: !67)
!76 = !DILocation(line: 50, column: 13, scope: !67)
!77 = distinct !{!77, !69, !78, !54}
!78 = !DILocation(line: 53, column: 13, scope: !64)
!79 = !DILocation(line: 54, column: 9, scope: !60)
!80 = !DILocation(line: 57, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !56, file: !15, line: 56, column: 9)
!82 = !DILocation(line: 59, column: 14, scope: !26)
!83 = !DILocation(line: 59, column: 9, scope: !26)
!84 = !DILocation(line: 61, column: 1, scope: !14)
!85 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 22, type: !86, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!86 = !DISubroutineType(types: !87)
!87 = !{!4, !4}
!88 = !DILocalVariable(name: "data", arg: 1, scope: !85, file: !15, line: 22, type: !4)
!89 = !DILocation(line: 22, column: 26, scope: !85)
!90 = !DILocation(line: 25, column: 12, scope: !85)
!91 = !DILocation(line: 25, column: 10, scope: !85)
!92 = !DILocation(line: 26, column: 12, scope: !85)
!93 = !DILocation(line: 26, column: 5, scope: !85)
!94 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_42_good", scope: !15, file: !15, line: 151, type: !16, scopeLine: 152, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!95 = !DILocation(line: 153, column: 5, scope: !94)
!96 = !DILocation(line: 154, column: 5, scope: !94)
!97 = !DILocation(line: 155, column: 1, scope: !94)
!98 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 166, type: !99, scopeLine: 167, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!99 = !DISubroutineType(types: !100)
!100 = !{!4, !4, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !15, line: 166, type: !4)
!105 = !DILocation(line: 166, column: 14, scope: !98)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !15, line: 166, type: !101)
!107 = !DILocation(line: 166, column: 27, scope: !98)
!108 = !DILocation(line: 169, column: 22, scope: !98)
!109 = !DILocation(line: 169, column: 12, scope: !98)
!110 = !DILocation(line: 169, column: 5, scope: !98)
!111 = !DILocation(line: 171, column: 5, scope: !98)
!112 = !DILocation(line: 172, column: 5, scope: !98)
!113 = !DILocation(line: 173, column: 5, scope: !98)
!114 = !DILocation(line: 176, column: 5, scope: !98)
!115 = !DILocation(line: 177, column: 5, scope: !98)
!116 = !DILocation(line: 178, column: 5, scope: !98)
!117 = !DILocation(line: 180, column: 5, scope: !98)
!118 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 118, type: !16, scopeLine: 119, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!119 = !DILocalVariable(name: "data", scope: !118, file: !15, line: 120, type: !4)
!120 = !DILocation(line: 120, column: 9, scope: !118)
!121 = !DILocation(line: 122, column: 10, scope: !118)
!122 = !DILocation(line: 123, column: 26, scope: !118)
!123 = !DILocation(line: 123, column: 12, scope: !118)
!124 = !DILocation(line: 123, column: 10, scope: !118)
!125 = !DILocalVariable(name: "i", scope: !126, file: !15, line: 125, type: !4)
!126 = distinct !DILexicalBlock(scope: !118, file: !15, line: 124, column: 5)
!127 = !DILocation(line: 125, column: 13, scope: !126)
!128 = !DILocalVariable(name: "buffer", scope: !126, file: !15, line: 126, type: !3)
!129 = !DILocation(line: 126, column: 15, scope: !126)
!130 = !DILocation(line: 126, column: 31, scope: !126)
!131 = !DILocation(line: 126, column: 24, scope: !126)
!132 = !DILocation(line: 127, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !126, file: !15, line: 127, column: 13)
!134 = !DILocation(line: 127, column: 20, scope: !133)
!135 = !DILocation(line: 127, column: 13, scope: !126)
!136 = !DILocation(line: 127, column: 30, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 127, column: 29)
!138 = !DILocation(line: 129, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !126, file: !15, line: 129, column: 9)
!140 = !DILocation(line: 129, column: 14, scope: !139)
!141 = !DILocation(line: 129, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !15, line: 129, column: 9)
!143 = !DILocation(line: 129, column: 23, scope: !142)
!144 = !DILocation(line: 129, column: 9, scope: !139)
!145 = !DILocation(line: 131, column: 13, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !15, line: 130, column: 9)
!147 = !DILocation(line: 131, column: 20, scope: !146)
!148 = !DILocation(line: 131, column: 23, scope: !146)
!149 = !DILocation(line: 132, column: 9, scope: !146)
!150 = !DILocation(line: 129, column: 30, scope: !142)
!151 = !DILocation(line: 129, column: 9, scope: !142)
!152 = distinct !{!152, !144, !153, !54}
!153 = !DILocation(line: 132, column: 9, scope: !139)
!154 = !DILocation(line: 134, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !126, file: !15, line: 134, column: 13)
!156 = !DILocation(line: 134, column: 18, scope: !155)
!157 = !DILocation(line: 134, column: 23, scope: !155)
!158 = !DILocation(line: 134, column: 26, scope: !155)
!159 = !DILocation(line: 134, column: 31, scope: !155)
!160 = !DILocation(line: 134, column: 13, scope: !126)
!161 = !DILocation(line: 136, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !155, file: !15, line: 135, column: 9)
!163 = !DILocation(line: 136, column: 20, scope: !162)
!164 = !DILocation(line: 136, column: 26, scope: !162)
!165 = !DILocation(line: 138, column: 19, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !15, line: 138, column: 13)
!167 = !DILocation(line: 138, column: 17, scope: !166)
!168 = !DILocation(line: 138, column: 24, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !15, line: 138, column: 13)
!170 = !DILocation(line: 138, column: 26, scope: !169)
!171 = !DILocation(line: 138, column: 13, scope: !166)
!172 = !DILocation(line: 140, column: 30, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !15, line: 139, column: 13)
!174 = !DILocation(line: 140, column: 37, scope: !173)
!175 = !DILocation(line: 140, column: 17, scope: !173)
!176 = !DILocation(line: 141, column: 13, scope: !173)
!177 = !DILocation(line: 138, column: 33, scope: !169)
!178 = !DILocation(line: 138, column: 13, scope: !169)
!179 = distinct !{!179, !171, !180, !54}
!180 = !DILocation(line: 141, column: 13, scope: !166)
!181 = !DILocation(line: 142, column: 9, scope: !162)
!182 = !DILocation(line: 145, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !155, file: !15, line: 144, column: 9)
!184 = !DILocation(line: 147, column: 14, scope: !126)
!185 = !DILocation(line: 147, column: 9, scope: !126)
!186 = !DILocation(line: 149, column: 1, scope: !118)
!187 = distinct !DISubprogram(name: "goodB2GSource", scope: !15, file: !15, line: 111, type: !86, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!188 = !DILocalVariable(name: "data", arg: 1, scope: !187, file: !15, line: 111, type: !4)
!189 = !DILocation(line: 111, column: 30, scope: !187)
!190 = !DILocation(line: 114, column: 12, scope: !187)
!191 = !DILocation(line: 114, column: 10, scope: !187)
!192 = !DILocation(line: 115, column: 12, scope: !187)
!193 = !DILocation(line: 115, column: 5, scope: !187)
!194 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!195 = !DILocalVariable(name: "data", scope: !194, file: !15, line: 78, type: !4)
!196 = !DILocation(line: 78, column: 9, scope: !194)
!197 = !DILocation(line: 80, column: 10, scope: !194)
!198 = !DILocation(line: 81, column: 26, scope: !194)
!199 = !DILocation(line: 81, column: 12, scope: !194)
!200 = !DILocation(line: 81, column: 10, scope: !194)
!201 = !DILocalVariable(name: "i", scope: !202, file: !15, line: 83, type: !4)
!202 = distinct !DILexicalBlock(scope: !194, file: !15, line: 82, column: 5)
!203 = !DILocation(line: 83, column: 13, scope: !202)
!204 = !DILocalVariable(name: "buffer", scope: !202, file: !15, line: 84, type: !3)
!205 = !DILocation(line: 84, column: 15, scope: !202)
!206 = !DILocation(line: 84, column: 31, scope: !202)
!207 = !DILocation(line: 84, column: 24, scope: !202)
!208 = !DILocation(line: 85, column: 13, scope: !209)
!209 = distinct !DILexicalBlock(scope: !202, file: !15, line: 85, column: 13)
!210 = !DILocation(line: 85, column: 20, scope: !209)
!211 = !DILocation(line: 85, column: 13, scope: !202)
!212 = !DILocation(line: 85, column: 30, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !15, line: 85, column: 29)
!214 = !DILocation(line: 87, column: 16, scope: !215)
!215 = distinct !DILexicalBlock(scope: !202, file: !15, line: 87, column: 9)
!216 = !DILocation(line: 87, column: 14, scope: !215)
!217 = !DILocation(line: 87, column: 21, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !15, line: 87, column: 9)
!219 = !DILocation(line: 87, column: 23, scope: !218)
!220 = !DILocation(line: 87, column: 9, scope: !215)
!221 = !DILocation(line: 89, column: 13, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !15, line: 88, column: 9)
!223 = !DILocation(line: 89, column: 20, scope: !222)
!224 = !DILocation(line: 89, column: 23, scope: !222)
!225 = !DILocation(line: 90, column: 9, scope: !222)
!226 = !DILocation(line: 87, column: 30, scope: !218)
!227 = !DILocation(line: 87, column: 9, scope: !218)
!228 = distinct !{!228, !220, !229, !54}
!229 = !DILocation(line: 90, column: 9, scope: !215)
!230 = !DILocation(line: 93, column: 13, scope: !231)
!231 = distinct !DILexicalBlock(scope: !202, file: !15, line: 93, column: 13)
!232 = !DILocation(line: 93, column: 18, scope: !231)
!233 = !DILocation(line: 93, column: 13, scope: !202)
!234 = !DILocation(line: 95, column: 13, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !15, line: 94, column: 9)
!236 = !DILocation(line: 95, column: 20, scope: !235)
!237 = !DILocation(line: 95, column: 26, scope: !235)
!238 = !DILocation(line: 97, column: 19, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !15, line: 97, column: 13)
!240 = !DILocation(line: 97, column: 17, scope: !239)
!241 = !DILocation(line: 97, column: 24, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !15, line: 97, column: 13)
!243 = !DILocation(line: 97, column: 26, scope: !242)
!244 = !DILocation(line: 97, column: 13, scope: !239)
!245 = !DILocation(line: 99, column: 30, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !15, line: 98, column: 13)
!247 = !DILocation(line: 99, column: 37, scope: !246)
!248 = !DILocation(line: 99, column: 17, scope: !246)
!249 = !DILocation(line: 100, column: 13, scope: !246)
!250 = !DILocation(line: 97, column: 33, scope: !242)
!251 = !DILocation(line: 97, column: 13, scope: !242)
!252 = distinct !{!252, !244, !253, !54}
!253 = !DILocation(line: 100, column: 13, scope: !239)
!254 = !DILocation(line: 101, column: 9, scope: !235)
!255 = !DILocation(line: 104, column: 13, scope: !256)
!256 = distinct !DILexicalBlock(scope: !231, file: !15, line: 103, column: 9)
!257 = !DILocation(line: 106, column: 14, scope: !202)
!258 = !DILocation(line: 106, column: 9, scope: !202)
!259 = !DILocation(line: 108, column: 1, scope: !194)
!260 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 68, type: !86, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!261 = !DILocalVariable(name: "data", arg: 1, scope: !260, file: !15, line: 68, type: !4)
!262 = !DILocation(line: 68, column: 30, scope: !260)
!263 = !DILocation(line: 72, column: 10, scope: !260)
!264 = !DILocation(line: 73, column: 12, scope: !260)
!265 = !DILocation(line: 73, column: 5, scope: !260)
