; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !25
  store i32 -1, i32* %data, align 4, !dbg !26
  %call = call i32 @rand(), !dbg !27
  %and = and i32 %call, 1, !dbg !27
  %tobool = icmp ne i32 %and, 0, !dbg !27
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !27

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !27
  %shl = shl i32 %call1, 30, !dbg !27
  %call2 = call i32 @rand(), !dbg !27
  %shl3 = shl i32 %call2, 15, !dbg !27
  %xor = xor i32 %shl, %shl3, !dbg !27
  %call4 = call i32 @rand(), !dbg !27
  %xor5 = xor i32 %xor, %call4, !dbg !27
  br label %cond.end, !dbg !27

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !27
  %shl7 = shl i32 %call6, 30, !dbg !27
  %call8 = call i32 @rand(), !dbg !27
  %shl9 = shl i32 %call8, 15, !dbg !27
  %xor10 = xor i32 %shl7, %shl9, !dbg !27
  %call11 = call i32 @rand(), !dbg !27
  %xor12 = xor i32 %xor10, %call11, !dbg !27
  %sub = sub i32 0, %xor12, !dbg !27
  %sub13 = sub i32 %sub, 1, !dbg !27
  br label %cond.end, !dbg !27

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !27
  store i32 %cond, i32* %data, align 4, !dbg !28
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !29
  %1 = load i32, i32* %data, align 4, !dbg !30
  call void %0(i32 noundef %1), !dbg !29
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !32 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !38, metadata !DIExpression()), !dbg !39
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !40
  %0 = bitcast i8* %call to i32*, !dbg !41
  store i32* %0, i32** %buffer, align 8, !dbg !39
  %1 = load i32*, i32** %buffer, align 8, !dbg !42
  %cmp = icmp eq i32* %1, null, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !46
  unreachable, !dbg !46

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !51
  %cmp1 = icmp slt i32 %2, 10, !dbg !53
  br i1 %cmp1, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !55
  %4 = load i32, i32* %i, align 4, !dbg !57
  %idxprom = sext i32 %4 to i64, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !60
  %inc = add nsw i32 %5, 1, !dbg !60
  store i32 %inc, i32* %i, align 4, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !65
  %cmp2 = icmp sge i32 %6, 0, !dbg !67
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !68

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !69
  %8 = load i32, i32* %data.addr, align 4, !dbg !71
  %idxprom4 = sext i32 %8 to i64, !dbg !69
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !69
  store i32 1, i32* %arrayidx5, align 4, !dbg !72
  store i32 0, i32* %i, align 4, !dbg !73
  br label %for.cond6, !dbg !75

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !76
  %cmp7 = icmp slt i32 %9, 10, !dbg !78
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !79

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !80
  %11 = load i32, i32* %i, align 4, !dbg !82
  %idxprom9 = sext i32 %11 to i64, !dbg !80
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !80
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !80
  call void @printIntLine(i32 noundef %12), !dbg !83
  br label %for.inc11, !dbg !84

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !85
  %inc12 = add nsw i32 %13, 1, !dbg !85
  store i32 %inc12, i32* %i, align 4, !dbg !85
  br label %for.cond6, !dbg !86, !llvm.loop !87

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !89

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !92
  %15 = bitcast i32* %14 to i8*, !dbg !92
  call void @free(i8* noundef %15), !dbg !93
  ret void, !dbg !94
}

declare i32 @rand() #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_44_good() #0 !dbg !95 {
entry:
  call void @goodG2B(), !dbg !96
  call void @goodB2G(), !dbg !97
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i64 @time(i64* noundef null), !dbg !109
  %conv = trunc i64 %call to i32, !dbg !110
  call void @srand(i32 noundef %conv), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !112
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_44_good(), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !115
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_44_bad(), !dbg !116
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
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
define internal void @goodG2B() #0 !dbg !119 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !122, metadata !DIExpression()), !dbg !123
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !123
  store i32 -1, i32* %data, align 4, !dbg !124
  store i32 7, i32* %data, align 4, !dbg !125
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !126
  %1 = load i32, i32* %data, align 4, !dbg !127
  call void %0(i32 noundef %1), !dbg !126
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !129 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i32* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !135, metadata !DIExpression()), !dbg !136
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !137
  %0 = bitcast i8* %call to i32*, !dbg !138
  store i32* %0, i32** %buffer, align 8, !dbg !136
  %1 = load i32*, i32** %buffer, align 8, !dbg !139
  %cmp = icmp eq i32* %1, null, !dbg !141
  br i1 %cmp, label %if.then, label %if.end, !dbg !142

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !148
  %cmp1 = icmp slt i32 %2, 10, !dbg !150
  br i1 %cmp1, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !152
  %4 = load i32, i32* %i, align 4, !dbg !154
  %idxprom = sext i32 %4 to i64, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !152
  store i32 0, i32* %arrayidx, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !157
  %inc = add nsw i32 %5, 1, !dbg !157
  store i32 %inc, i32* %i, align 4, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !161
  %cmp2 = icmp sge i32 %6, 0, !dbg !163
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !164

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !165
  %8 = load i32, i32* %data.addr, align 4, !dbg !167
  %idxprom4 = sext i32 %8 to i64, !dbg !165
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !165
  store i32 1, i32* %arrayidx5, align 4, !dbg !168
  store i32 0, i32* %i, align 4, !dbg !169
  br label %for.cond6, !dbg !171

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !172
  %cmp7 = icmp slt i32 %9, 10, !dbg !174
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !175

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !176
  %11 = load i32, i32* %i, align 4, !dbg !178
  %idxprom9 = sext i32 %11 to i64, !dbg !176
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !176
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !176
  call void @printIntLine(i32 noundef %12), !dbg !179
  br label %for.inc11, !dbg !180

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !181
  %inc12 = add nsw i32 %13, 1, !dbg !181
  store i32 %inc12, i32* %i, align 4, !dbg !181
  br label %for.cond6, !dbg !182, !llvm.loop !183

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !185

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !186
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !188
  %15 = bitcast i32* %14 to i8*, !dbg !188
  call void @free(i8* noundef %15), !dbg !189
  ret void, !dbg !190
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !191 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !192, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !194, metadata !DIExpression()), !dbg !195
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !195
  store i32 -1, i32* %data, align 4, !dbg !196
  %call = call i32 @rand(), !dbg !197
  %and = and i32 %call, 1, !dbg !197
  %tobool = icmp ne i32 %and, 0, !dbg !197
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !197

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !197
  %shl = shl i32 %call1, 30, !dbg !197
  %call2 = call i32 @rand(), !dbg !197
  %shl3 = shl i32 %call2, 15, !dbg !197
  %xor = xor i32 %shl, %shl3, !dbg !197
  %call4 = call i32 @rand(), !dbg !197
  %xor5 = xor i32 %xor, %call4, !dbg !197
  br label %cond.end, !dbg !197

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !197
  %shl7 = shl i32 %call6, 30, !dbg !197
  %call8 = call i32 @rand(), !dbg !197
  %shl9 = shl i32 %call8, 15, !dbg !197
  %xor10 = xor i32 %shl7, %shl9, !dbg !197
  %call11 = call i32 @rand(), !dbg !197
  %xor12 = xor i32 %xor10, %call11, !dbg !197
  %sub = sub i32 0, %xor12, !dbg !197
  %sub13 = sub i32 %sub, 1, !dbg !197
  br label %cond.end, !dbg !197

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !197
  store i32 %cond, i32* %data, align 4, !dbg !198
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !199
  %1 = load i32, i32* %data, align 4, !dbg !200
  call void %0(i32 noundef %1), !dbg !199
  ret void, !dbg !201
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2GSink(i32 noundef %data) #0 !dbg !202 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata i32* %i, metadata !205, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !208, metadata !DIExpression()), !dbg !209
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !210
  %0 = bitcast i8* %call to i32*, !dbg !211
  store i32* %0, i32** %buffer, align 8, !dbg !209
  %1 = load i32*, i32** %buffer, align 8, !dbg !212
  %cmp = icmp eq i32* %1, null, !dbg !214
  br i1 %cmp, label %if.then, label %if.end, !dbg !215

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !216
  unreachable, !dbg !216

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !218
  br label %for.cond, !dbg !220

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !221
  %cmp1 = icmp slt i32 %2, 10, !dbg !223
  br i1 %cmp1, label %for.body, label %for.end, !dbg !224

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !225
  %4 = load i32, i32* %i, align 4, !dbg !227
  %idxprom = sext i32 %4 to i64, !dbg !225
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !225
  store i32 0, i32* %arrayidx, align 4, !dbg !228
  br label %for.inc, !dbg !229

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !230
  %inc = add nsw i32 %5, 1, !dbg !230
  store i32 %inc, i32* %i, align 4, !dbg !230
  br label %for.cond, !dbg !231, !llvm.loop !232

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !234
  %cmp2 = icmp sge i32 %6, 0, !dbg !236
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !237

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !238
  %cmp3 = icmp slt i32 %7, 10, !dbg !239
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !240

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !241
  %9 = load i32, i32* %data.addr, align 4, !dbg !243
  %idxprom5 = sext i32 %9 to i64, !dbg !241
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !241
  store i32 1, i32* %arrayidx6, align 4, !dbg !244
  store i32 0, i32* %i, align 4, !dbg !245
  br label %for.cond7, !dbg !247

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !248
  %cmp8 = icmp slt i32 %10, 10, !dbg !250
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !251

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !252
  %12 = load i32, i32* %i, align 4, !dbg !254
  %idxprom10 = sext i32 %12 to i64, !dbg !252
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !252
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !252
  call void @printIntLine(i32 noundef %13), !dbg !255
  br label %for.inc12, !dbg !256

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !257
  %inc13 = add nsw i32 %14, 1, !dbg !257
  store i32 %inc13, i32* %i, align 4, !dbg !257
  br label %for.cond7, !dbg !258, !llvm.loop !259

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !261

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !262
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !264
  %16 = bitcast i32* %15 to i8*, !dbg !264
  call void @free(i8* noundef %16), !dbg !265
  ret void, !dbg !266
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4, !5, !6}
!3 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_44_bad", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 54, type: !3)
!20 = !DILocation(line: 54, column: 9, scope: !14)
!21 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 56, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !3}
!25 = !DILocation(line: 56, column: 12, scope: !14)
!26 = !DILocation(line: 58, column: 10, scope: !14)
!27 = !DILocation(line: 60, column: 12, scope: !14)
!28 = !DILocation(line: 60, column: 10, scope: !14)
!29 = !DILocation(line: 62, column: 5, scope: !14)
!30 = !DILocation(line: 62, column: 13, scope: !14)
!31 = !DILocation(line: 63, column: 1, scope: !14)
!32 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 22, type: !23, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!33 = !DILocalVariable(name: "data", arg: 1, scope: !32, file: !15, line: 22, type: !3)
!34 = !DILocation(line: 22, column: 25, scope: !32)
!35 = !DILocalVariable(name: "i", scope: !36, file: !15, line: 25, type: !3)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 24, column: 5)
!37 = !DILocation(line: 25, column: 13, scope: !36)
!38 = !DILocalVariable(name: "buffer", scope: !36, file: !15, line: 26, type: !5)
!39 = !DILocation(line: 26, column: 15, scope: !36)
!40 = !DILocation(line: 26, column: 31, scope: !36)
!41 = !DILocation(line: 26, column: 24, scope: !36)
!42 = !DILocation(line: 27, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !15, line: 27, column: 13)
!44 = !DILocation(line: 27, column: 20, scope: !43)
!45 = !DILocation(line: 27, column: 13, scope: !36)
!46 = !DILocation(line: 27, column: 30, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 27, column: 29)
!48 = !DILocation(line: 29, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !36, file: !15, line: 29, column: 9)
!50 = !DILocation(line: 29, column: 14, scope: !49)
!51 = !DILocation(line: 29, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !15, line: 29, column: 9)
!53 = !DILocation(line: 29, column: 23, scope: !52)
!54 = !DILocation(line: 29, column: 9, scope: !49)
!55 = !DILocation(line: 31, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !15, line: 30, column: 9)
!57 = !DILocation(line: 31, column: 20, scope: !56)
!58 = !DILocation(line: 31, column: 23, scope: !56)
!59 = !DILocation(line: 32, column: 9, scope: !56)
!60 = !DILocation(line: 29, column: 30, scope: !52)
!61 = !DILocation(line: 29, column: 9, scope: !52)
!62 = distinct !{!62, !54, !63, !64}
!63 = !DILocation(line: 32, column: 9, scope: !49)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 35, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !36, file: !15, line: 35, column: 13)
!67 = !DILocation(line: 35, column: 18, scope: !66)
!68 = !DILocation(line: 35, column: 13, scope: !36)
!69 = !DILocation(line: 37, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 36, column: 9)
!71 = !DILocation(line: 37, column: 20, scope: !70)
!72 = !DILocation(line: 37, column: 26, scope: !70)
!73 = !DILocation(line: 39, column: 19, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !15, line: 39, column: 13)
!75 = !DILocation(line: 39, column: 17, scope: !74)
!76 = !DILocation(line: 39, column: 24, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !15, line: 39, column: 13)
!78 = !DILocation(line: 39, column: 26, scope: !77)
!79 = !DILocation(line: 39, column: 13, scope: !74)
!80 = !DILocation(line: 41, column: 30, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 40, column: 13)
!82 = !DILocation(line: 41, column: 37, scope: !81)
!83 = !DILocation(line: 41, column: 17, scope: !81)
!84 = !DILocation(line: 42, column: 13, scope: !81)
!85 = !DILocation(line: 39, column: 33, scope: !77)
!86 = !DILocation(line: 39, column: 13, scope: !77)
!87 = distinct !{!87, !79, !88, !64}
!88 = !DILocation(line: 42, column: 13, scope: !74)
!89 = !DILocation(line: 43, column: 9, scope: !70)
!90 = !DILocation(line: 46, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !66, file: !15, line: 45, column: 9)
!92 = !DILocation(line: 48, column: 14, scope: !36)
!93 = !DILocation(line: 48, column: 9, scope: !36)
!94 = !DILocation(line: 50, column: 1, scope: !32)
!95 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_44_good", scope: !15, file: !15, line: 153, type: !16, scopeLine: 154, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!96 = !DILocation(line: 155, column: 5, scope: !95)
!97 = !DILocation(line: 156, column: 5, scope: !95)
!98 = !DILocation(line: 157, column: 1, scope: !95)
!99 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 167, type: !100, scopeLine: 168, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!100 = !DISubroutineType(types: !101)
!101 = !{!3, !3, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !15, line: 167, type: !3)
!106 = !DILocation(line: 167, column: 14, scope: !99)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !15, line: 167, type: !102)
!108 = !DILocation(line: 167, column: 27, scope: !99)
!109 = !DILocation(line: 170, column: 22, scope: !99)
!110 = !DILocation(line: 170, column: 12, scope: !99)
!111 = !DILocation(line: 170, column: 5, scope: !99)
!112 = !DILocation(line: 172, column: 5, scope: !99)
!113 = !DILocation(line: 173, column: 5, scope: !99)
!114 = !DILocation(line: 174, column: 5, scope: !99)
!115 = !DILocation(line: 177, column: 5, scope: !99)
!116 = !DILocation(line: 178, column: 5, scope: !99)
!117 = !DILocation(line: 179, column: 5, scope: !99)
!118 = !DILocation(line: 181, column: 5, scope: !99)
!119 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!120 = !DILocalVariable(name: "data", scope: !119, file: !15, line: 102, type: !3)
!121 = !DILocation(line: 102, column: 9, scope: !119)
!122 = !DILocalVariable(name: "funcPtr", scope: !119, file: !15, line: 103, type: !22)
!123 = !DILocation(line: 103, column: 12, scope: !119)
!124 = !DILocation(line: 105, column: 10, scope: !119)
!125 = !DILocation(line: 108, column: 10, scope: !119)
!126 = !DILocation(line: 109, column: 5, scope: !119)
!127 = !DILocation(line: 109, column: 13, scope: !119)
!128 = !DILocation(line: 110, column: 1, scope: !119)
!129 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 70, type: !23, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!130 = !DILocalVariable(name: "data", arg: 1, scope: !129, file: !15, line: 70, type: !3)
!131 = !DILocation(line: 70, column: 29, scope: !129)
!132 = !DILocalVariable(name: "i", scope: !133, file: !15, line: 73, type: !3)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 72, column: 5)
!134 = !DILocation(line: 73, column: 13, scope: !133)
!135 = !DILocalVariable(name: "buffer", scope: !133, file: !15, line: 74, type: !5)
!136 = !DILocation(line: 74, column: 15, scope: !133)
!137 = !DILocation(line: 74, column: 31, scope: !133)
!138 = !DILocation(line: 74, column: 24, scope: !133)
!139 = !DILocation(line: 75, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !15, line: 75, column: 13)
!141 = !DILocation(line: 75, column: 20, scope: !140)
!142 = !DILocation(line: 75, column: 13, scope: !133)
!143 = !DILocation(line: 75, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !15, line: 75, column: 29)
!145 = !DILocation(line: 77, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !133, file: !15, line: 77, column: 9)
!147 = !DILocation(line: 77, column: 14, scope: !146)
!148 = !DILocation(line: 77, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !15, line: 77, column: 9)
!150 = !DILocation(line: 77, column: 23, scope: !149)
!151 = !DILocation(line: 77, column: 9, scope: !146)
!152 = !DILocation(line: 79, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !15, line: 78, column: 9)
!154 = !DILocation(line: 79, column: 20, scope: !153)
!155 = !DILocation(line: 79, column: 23, scope: !153)
!156 = !DILocation(line: 80, column: 9, scope: !153)
!157 = !DILocation(line: 77, column: 30, scope: !149)
!158 = !DILocation(line: 77, column: 9, scope: !149)
!159 = distinct !{!159, !151, !160, !64}
!160 = !DILocation(line: 80, column: 9, scope: !146)
!161 = !DILocation(line: 83, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !133, file: !15, line: 83, column: 13)
!163 = !DILocation(line: 83, column: 18, scope: !162)
!164 = !DILocation(line: 83, column: 13, scope: !133)
!165 = !DILocation(line: 85, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !15, line: 84, column: 9)
!167 = !DILocation(line: 85, column: 20, scope: !166)
!168 = !DILocation(line: 85, column: 26, scope: !166)
!169 = !DILocation(line: 87, column: 19, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !15, line: 87, column: 13)
!171 = !DILocation(line: 87, column: 17, scope: !170)
!172 = !DILocation(line: 87, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !15, line: 87, column: 13)
!174 = !DILocation(line: 87, column: 26, scope: !173)
!175 = !DILocation(line: 87, column: 13, scope: !170)
!176 = !DILocation(line: 89, column: 30, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !15, line: 88, column: 13)
!178 = !DILocation(line: 89, column: 37, scope: !177)
!179 = !DILocation(line: 89, column: 17, scope: !177)
!180 = !DILocation(line: 90, column: 13, scope: !177)
!181 = !DILocation(line: 87, column: 33, scope: !173)
!182 = !DILocation(line: 87, column: 13, scope: !173)
!183 = distinct !{!183, !175, !184, !64}
!184 = !DILocation(line: 90, column: 13, scope: !170)
!185 = !DILocation(line: 91, column: 9, scope: !166)
!186 = !DILocation(line: 94, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !162, file: !15, line: 93, column: 9)
!188 = !DILocation(line: 96, column: 14, scope: !133)
!189 = !DILocation(line: 96, column: 9, scope: !133)
!190 = !DILocation(line: 98, column: 1, scope: !129)
!191 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 142, type: !16, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!192 = !DILocalVariable(name: "data", scope: !191, file: !15, line: 144, type: !3)
!193 = !DILocation(line: 144, column: 9, scope: !191)
!194 = !DILocalVariable(name: "funcPtr", scope: !191, file: !15, line: 145, type: !22)
!195 = !DILocation(line: 145, column: 12, scope: !191)
!196 = !DILocation(line: 147, column: 10, scope: !191)
!197 = !DILocation(line: 149, column: 12, scope: !191)
!198 = !DILocation(line: 149, column: 10, scope: !191)
!199 = !DILocation(line: 150, column: 5, scope: !191)
!200 = !DILocation(line: 150, column: 13, scope: !191)
!201 = !DILocation(line: 151, column: 1, scope: !191)
!202 = distinct !DISubprogram(name: "goodB2GSink", scope: !15, file: !15, line: 113, type: !23, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!203 = !DILocalVariable(name: "data", arg: 1, scope: !202, file: !15, line: 113, type: !3)
!204 = !DILocation(line: 113, column: 29, scope: !202)
!205 = !DILocalVariable(name: "i", scope: !206, file: !15, line: 116, type: !3)
!206 = distinct !DILexicalBlock(scope: !202, file: !15, line: 115, column: 5)
!207 = !DILocation(line: 116, column: 13, scope: !206)
!208 = !DILocalVariable(name: "buffer", scope: !206, file: !15, line: 117, type: !5)
!209 = !DILocation(line: 117, column: 15, scope: !206)
!210 = !DILocation(line: 117, column: 31, scope: !206)
!211 = !DILocation(line: 117, column: 24, scope: !206)
!212 = !DILocation(line: 118, column: 13, scope: !213)
!213 = distinct !DILexicalBlock(scope: !206, file: !15, line: 118, column: 13)
!214 = !DILocation(line: 118, column: 20, scope: !213)
!215 = !DILocation(line: 118, column: 13, scope: !206)
!216 = !DILocation(line: 118, column: 30, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !15, line: 118, column: 29)
!218 = !DILocation(line: 120, column: 16, scope: !219)
!219 = distinct !DILexicalBlock(scope: !206, file: !15, line: 120, column: 9)
!220 = !DILocation(line: 120, column: 14, scope: !219)
!221 = !DILocation(line: 120, column: 21, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !15, line: 120, column: 9)
!223 = !DILocation(line: 120, column: 23, scope: !222)
!224 = !DILocation(line: 120, column: 9, scope: !219)
!225 = !DILocation(line: 122, column: 13, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !15, line: 121, column: 9)
!227 = !DILocation(line: 122, column: 20, scope: !226)
!228 = !DILocation(line: 122, column: 23, scope: !226)
!229 = !DILocation(line: 123, column: 9, scope: !226)
!230 = !DILocation(line: 120, column: 30, scope: !222)
!231 = !DILocation(line: 120, column: 9, scope: !222)
!232 = distinct !{!232, !224, !233, !64}
!233 = !DILocation(line: 123, column: 9, scope: !219)
!234 = !DILocation(line: 125, column: 13, scope: !235)
!235 = distinct !DILexicalBlock(scope: !206, file: !15, line: 125, column: 13)
!236 = !DILocation(line: 125, column: 18, scope: !235)
!237 = !DILocation(line: 125, column: 23, scope: !235)
!238 = !DILocation(line: 125, column: 26, scope: !235)
!239 = !DILocation(line: 125, column: 31, scope: !235)
!240 = !DILocation(line: 125, column: 13, scope: !206)
!241 = !DILocation(line: 127, column: 13, scope: !242)
!242 = distinct !DILexicalBlock(scope: !235, file: !15, line: 126, column: 9)
!243 = !DILocation(line: 127, column: 20, scope: !242)
!244 = !DILocation(line: 127, column: 26, scope: !242)
!245 = !DILocation(line: 129, column: 19, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !15, line: 129, column: 13)
!247 = !DILocation(line: 129, column: 17, scope: !246)
!248 = !DILocation(line: 129, column: 24, scope: !249)
!249 = distinct !DILexicalBlock(scope: !246, file: !15, line: 129, column: 13)
!250 = !DILocation(line: 129, column: 26, scope: !249)
!251 = !DILocation(line: 129, column: 13, scope: !246)
!252 = !DILocation(line: 131, column: 30, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !15, line: 130, column: 13)
!254 = !DILocation(line: 131, column: 37, scope: !253)
!255 = !DILocation(line: 131, column: 17, scope: !253)
!256 = !DILocation(line: 132, column: 13, scope: !253)
!257 = !DILocation(line: 129, column: 33, scope: !249)
!258 = !DILocation(line: 129, column: 13, scope: !249)
!259 = distinct !{!259, !251, !260, !64}
!260 = !DILocation(line: 132, column: 13, scope: !246)
!261 = !DILocation(line: 133, column: 9, scope: !242)
!262 = !DILocation(line: 136, column: 13, scope: !263)
!263 = distinct !DILexicalBlock(scope: !235, file: !15, line: 135, column: 9)
!264 = !DILocation(line: 138, column: 14, scope: !206)
!265 = !DILocation(line: 138, column: 9, scope: !206)
!266 = !DILocation(line: 140, column: 1, scope: !202)
