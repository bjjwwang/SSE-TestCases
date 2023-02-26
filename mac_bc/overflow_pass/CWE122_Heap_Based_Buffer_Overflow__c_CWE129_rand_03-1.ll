; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_03_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %call = call i32 @rand(), !dbg !22
  %and = and i32 %call, 1, !dbg !22
  %tobool = icmp ne i32 %and, 0, !dbg !22
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !22

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !22
  %shl = shl i32 %call1, 30, !dbg !22
  %call2 = call i32 @rand(), !dbg !22
  %shl3 = shl i32 %call2, 15, !dbg !22
  %xor = xor i32 %shl, %shl3, !dbg !22
  %call4 = call i32 @rand(), !dbg !22
  %xor5 = xor i32 %xor, %call4, !dbg !22
  br label %cond.end, !dbg !22

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !22
  %shl7 = shl i32 %call6, 30, !dbg !22
  %call8 = call i32 @rand(), !dbg !22
  %shl9 = shl i32 %call8, 15, !dbg !22
  %xor10 = xor i32 %shl7, %shl9, !dbg !22
  %call11 = call i32 @rand(), !dbg !22
  %xor12 = xor i32 %xor10, %call11, !dbg !22
  %sub = sub i32 0, %xor12, !dbg !22
  %sub13 = sub i32 %sub, 1, !dbg !22
  br label %cond.end, !dbg !22

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !22
  store i32 %cond, i32* %data, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %i, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !31, metadata !DIExpression()), !dbg !32
  %call14 = call i8* @malloc(i64 noundef 40) #5, !dbg !33
  %0 = bitcast i8* %call14 to i32*, !dbg !34
  store i32* %0, i32** %buffer, align 8, !dbg !32
  %1 = load i32*, i32** %buffer, align 8, !dbg !35
  %cmp = icmp eq i32* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %cond.end
  call void @exit(i32 noundef -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !44
  %cmp15 = icmp slt i32 %2, 10, !dbg !46
  br i1 %cmp15, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !48
  %4 = load i32, i32* %i, align 4, !dbg !50
  %idxprom = sext i32 %4 to i64, !dbg !48
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !48
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %5, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !58
  %cmp16 = icmp sge i32 %6, 0, !dbg !60
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !61

if.then17:                                        ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !62
  %8 = load i32, i32* %data, align 4, !dbg !64
  %idxprom18 = sext i32 %8 to i64, !dbg !62
  %arrayidx19 = getelementptr inbounds i32, i32* %7, i64 %idxprom18, !dbg !62
  store i32 1, i32* %arrayidx19, align 4, !dbg !65
  store i32 0, i32* %i, align 4, !dbg !66
  br label %for.cond20, !dbg !68

for.cond20:                                       ; preds = %for.inc25, %if.then17
  %9 = load i32, i32* %i, align 4, !dbg !69
  %cmp21 = icmp slt i32 %9, 10, !dbg !71
  br i1 %cmp21, label %for.body22, label %for.end27, !dbg !72

for.body22:                                       ; preds = %for.cond20
  %10 = load i32*, i32** %buffer, align 8, !dbg !73
  %11 = load i32, i32* %i, align 4, !dbg !75
  %idxprom23 = sext i32 %11 to i64, !dbg !73
  %arrayidx24 = getelementptr inbounds i32, i32* %10, i64 %idxprom23, !dbg !73
  %12 = load i32, i32* %arrayidx24, align 4, !dbg !73
  call void @printIntLine(i32 noundef %12), !dbg !76
  br label %for.inc25, !dbg !77

for.inc25:                                        ; preds = %for.body22
  %13 = load i32, i32* %i, align 4, !dbg !78
  %inc26 = add nsw i32 %13, 1, !dbg !78
  store i32 %inc26, i32* %i, align 4, !dbg !78
  br label %for.cond20, !dbg !79, !llvm.loop !80

for.end27:                                        ; preds = %for.cond20
  br label %if.end28, !dbg !82

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !83
  br label %if.end28

if.end28:                                         ; preds = %if.else, %for.end27
  %14 = load i32*, i32** %buffer, align 8, !dbg !85
  %15 = bitcast i32* %14 to i8*, !dbg !85
  call void @free(i8* noundef %15), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_03_good() #0 !dbg !88 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* noundef null), !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 noundef %conv), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_03_good(), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_03_bad(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !114 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 -1, i32* %data, align 4, !dbg !117
  %call = call i32 @rand(), !dbg !118
  %and = and i32 %call, 1, !dbg !118
  %tobool = icmp ne i32 %and, 0, !dbg !118
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !118

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !118
  %shl = shl i32 %call1, 30, !dbg !118
  %call2 = call i32 @rand(), !dbg !118
  %shl3 = shl i32 %call2, 15, !dbg !118
  %xor = xor i32 %shl, %shl3, !dbg !118
  %call4 = call i32 @rand(), !dbg !118
  %xor5 = xor i32 %xor, %call4, !dbg !118
  br label %cond.end, !dbg !118

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !118
  %shl7 = shl i32 %call6, 30, !dbg !118
  %call8 = call i32 @rand(), !dbg !118
  %shl9 = shl i32 %call8, 15, !dbg !118
  %xor10 = xor i32 %shl7, %shl9, !dbg !118
  %call11 = call i32 @rand(), !dbg !118
  %xor12 = xor i32 %xor10, %call11, !dbg !118
  %sub = sub i32 0, %xor12, !dbg !118
  %sub13 = sub i32 %sub, 1, !dbg !118
  br label %cond.end, !dbg !118

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !118
  store i32 %cond, i32* %data, align 4, !dbg !121
  call void @llvm.dbg.declare(metadata i32* %i, metadata !122, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !127, metadata !DIExpression()), !dbg !128
  %call14 = call i8* @malloc(i64 noundef 40) #5, !dbg !129
  %0 = bitcast i8* %call14 to i32*, !dbg !130
  store i32* %0, i32** %buffer, align 8, !dbg !128
  %1 = load i32*, i32** %buffer, align 8, !dbg !131
  %cmp = icmp eq i32* %1, null, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %cond.end
  call void @exit(i32 noundef -1) #6, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !140
  %cmp15 = icmp slt i32 %2, 10, !dbg !142
  br i1 %cmp15, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !144
  %4 = load i32, i32* %i, align 4, !dbg !146
  %idxprom = sext i32 %4 to i64, !dbg !144
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !144
  store i32 0, i32* %arrayidx, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !149
  %inc = add nsw i32 %5, 1, !dbg !149
  store i32 %inc, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !153
  %cmp16 = icmp sge i32 %6, 0, !dbg !155
  br i1 %cmp16, label %land.lhs.true, label %if.else, !dbg !156

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !157
  %cmp17 = icmp slt i32 %7, 10, !dbg !158
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !159

if.then18:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !160
  %9 = load i32, i32* %data, align 4, !dbg !162
  %idxprom19 = sext i32 %9 to i64, !dbg !160
  %arrayidx20 = getelementptr inbounds i32, i32* %8, i64 %idxprom19, !dbg !160
  store i32 1, i32* %arrayidx20, align 4, !dbg !163
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond21, !dbg !166

for.cond21:                                       ; preds = %for.inc26, %if.then18
  %10 = load i32, i32* %i, align 4, !dbg !167
  %cmp22 = icmp slt i32 %10, 10, !dbg !169
  br i1 %cmp22, label %for.body23, label %for.end28, !dbg !170

for.body23:                                       ; preds = %for.cond21
  %11 = load i32*, i32** %buffer, align 8, !dbg !171
  %12 = load i32, i32* %i, align 4, !dbg !173
  %idxprom24 = sext i32 %12 to i64, !dbg !171
  %arrayidx25 = getelementptr inbounds i32, i32* %11, i64 %idxprom24, !dbg !171
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !171
  call void @printIntLine(i32 noundef %13), !dbg !174
  br label %for.inc26, !dbg !175

for.inc26:                                        ; preds = %for.body23
  %14 = load i32, i32* %i, align 4, !dbg !176
  %inc27 = add nsw i32 %14, 1, !dbg !176
  store i32 %inc27, i32* %i, align 4, !dbg !176
  br label %for.cond21, !dbg !177, !llvm.loop !178

for.end28:                                        ; preds = %for.cond21
  br label %if.end29, !dbg !180

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !181
  br label %if.end29

if.end29:                                         ; preds = %if.else, %for.end28
  %15 = load i32*, i32** %buffer, align 8, !dbg !183
  %16 = bitcast i32* %15 to i8*, !dbg !183
  call void @free(i8* noundef %16), !dbg !184
  ret void, !dbg !185
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !186 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !187, metadata !DIExpression()), !dbg !188
  store i32 -1, i32* %data, align 4, !dbg !189
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
  store i32 %cond, i32* %data, align 4, !dbg !193
  call void @llvm.dbg.declare(metadata i32* %i, metadata !194, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !199, metadata !DIExpression()), !dbg !200
  %call14 = call i8* @malloc(i64 noundef 40) #5, !dbg !201
  %0 = bitcast i8* %call14 to i32*, !dbg !202
  store i32* %0, i32** %buffer, align 8, !dbg !200
  %1 = load i32*, i32** %buffer, align 8, !dbg !203
  %cmp = icmp eq i32* %1, null, !dbg !205
  br i1 %cmp, label %if.then, label %if.end, !dbg !206

if.then:                                          ; preds = %cond.end
  call void @exit(i32 noundef -1) #6, !dbg !207
  unreachable, !dbg !207

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !212
  %cmp15 = icmp slt i32 %2, 10, !dbg !214
  br i1 %cmp15, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !216
  %4 = load i32, i32* %i, align 4, !dbg !218
  %idxprom = sext i32 %4 to i64, !dbg !216
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !216
  store i32 0, i32* %arrayidx, align 4, !dbg !219
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !221
  %inc = add nsw i32 %5, 1, !dbg !221
  store i32 %inc, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !222, !llvm.loop !223

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !225
  %cmp16 = icmp sge i32 %6, 0, !dbg !227
  br i1 %cmp16, label %land.lhs.true, label %if.else, !dbg !228

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !229
  %cmp17 = icmp slt i32 %7, 10, !dbg !230
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !231

if.then18:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !232
  %9 = load i32, i32* %data, align 4, !dbg !234
  %idxprom19 = sext i32 %9 to i64, !dbg !232
  %arrayidx20 = getelementptr inbounds i32, i32* %8, i64 %idxprom19, !dbg !232
  store i32 1, i32* %arrayidx20, align 4, !dbg !235
  store i32 0, i32* %i, align 4, !dbg !236
  br label %for.cond21, !dbg !238

for.cond21:                                       ; preds = %for.inc26, %if.then18
  %10 = load i32, i32* %i, align 4, !dbg !239
  %cmp22 = icmp slt i32 %10, 10, !dbg !241
  br i1 %cmp22, label %for.body23, label %for.end28, !dbg !242

for.body23:                                       ; preds = %for.cond21
  %11 = load i32*, i32** %buffer, align 8, !dbg !243
  %12 = load i32, i32* %i, align 4, !dbg !245
  %idxprom24 = sext i32 %12 to i64, !dbg !243
  %arrayidx25 = getelementptr inbounds i32, i32* %11, i64 %idxprom24, !dbg !243
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !243
  call void @printIntLine(i32 noundef %13), !dbg !246
  br label %for.inc26, !dbg !247

for.inc26:                                        ; preds = %for.body23
  %14 = load i32, i32* %i, align 4, !dbg !248
  %inc27 = add nsw i32 %14, 1, !dbg !248
  store i32 %inc27, i32* %i, align 4, !dbg !248
  br label %for.cond21, !dbg !249, !llvm.loop !250

for.end28:                                        ; preds = %for.cond21
  br label %if.end29, !dbg !252

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !253
  br label %if.end29

if.end29:                                         ; preds = %if.else, %for.end28
  %15 = load i32*, i32** %buffer, align 8, !dbg !255
  %16 = bitcast i32* %15 to i8*, !dbg !255
  call void @free(i8* noundef %16), !dbg !256
  ret void, !dbg !257
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !258 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !259, metadata !DIExpression()), !dbg !260
  store i32 -1, i32* %data, align 4, !dbg !261
  store i32 7, i32* %data, align 4, !dbg !262
  call void @llvm.dbg.declare(metadata i32* %i, metadata !265, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !270, metadata !DIExpression()), !dbg !271
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !272
  %0 = bitcast i8* %call to i32*, !dbg !273
  store i32* %0, i32** %buffer, align 8, !dbg !271
  %1 = load i32*, i32** %buffer, align 8, !dbg !274
  %cmp = icmp eq i32* %1, null, !dbg !276
  br i1 %cmp, label %if.then, label %if.end, !dbg !277

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !278
  unreachable, !dbg !278

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !280
  br label %for.cond, !dbg !282

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !283
  %cmp1 = icmp slt i32 %2, 10, !dbg !285
  br i1 %cmp1, label %for.body, label %for.end, !dbg !286

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !287
  %4 = load i32, i32* %i, align 4, !dbg !289
  %idxprom = sext i32 %4 to i64, !dbg !287
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !287
  store i32 0, i32* %arrayidx, align 4, !dbg !290
  br label %for.inc, !dbg !291

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !292
  %inc = add nsw i32 %5, 1, !dbg !292
  store i32 %inc, i32* %i, align 4, !dbg !292
  br label %for.cond, !dbg !293, !llvm.loop !294

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !296
  %cmp2 = icmp sge i32 %6, 0, !dbg !298
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !299

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !300
  %8 = load i32, i32* %data, align 4, !dbg !302
  %idxprom4 = sext i32 %8 to i64, !dbg !300
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !300
  store i32 1, i32* %arrayidx5, align 4, !dbg !303
  store i32 0, i32* %i, align 4, !dbg !304
  br label %for.cond6, !dbg !306

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !307
  %cmp7 = icmp slt i32 %9, 10, !dbg !309
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !310

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !311
  %11 = load i32, i32* %i, align 4, !dbg !313
  %idxprom9 = sext i32 %11 to i64, !dbg !311
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !311
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !311
  call void @printIntLine(i32 noundef %12), !dbg !314
  br label %for.inc11, !dbg !315

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !316
  %inc12 = add nsw i32 %13, 1, !dbg !316
  store i32 %inc12, i32* %i, align 4, !dbg !316
  br label %for.cond6, !dbg !317, !llvm.loop !318

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !320

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !321
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !323
  %15 = bitcast i32* %14 to i8*, !dbg !323
  call void @free(i8* noundef %15), !dbg !324
  ret void, !dbg !325
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !326 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !327, metadata !DIExpression()), !dbg !328
  store i32 -1, i32* %data, align 4, !dbg !329
  store i32 7, i32* %data, align 4, !dbg !330
  call void @llvm.dbg.declare(metadata i32* %i, metadata !333, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !338, metadata !DIExpression()), !dbg !339
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !340
  %0 = bitcast i8* %call to i32*, !dbg !341
  store i32* %0, i32** %buffer, align 8, !dbg !339
  %1 = load i32*, i32** %buffer, align 8, !dbg !342
  %cmp = icmp eq i32* %1, null, !dbg !344
  br i1 %cmp, label %if.then, label %if.end, !dbg !345

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !346
  unreachable, !dbg !346

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !348
  br label %for.cond, !dbg !350

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !351
  %cmp1 = icmp slt i32 %2, 10, !dbg !353
  br i1 %cmp1, label %for.body, label %for.end, !dbg !354

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !355
  %4 = load i32, i32* %i, align 4, !dbg !357
  %idxprom = sext i32 %4 to i64, !dbg !355
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !355
  store i32 0, i32* %arrayidx, align 4, !dbg !358
  br label %for.inc, !dbg !359

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !360
  %inc = add nsw i32 %5, 1, !dbg !360
  store i32 %inc, i32* %i, align 4, !dbg !360
  br label %for.cond, !dbg !361, !llvm.loop !362

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !364
  %cmp2 = icmp sge i32 %6, 0, !dbg !366
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !367

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !368
  %8 = load i32, i32* %data, align 4, !dbg !370
  %idxprom4 = sext i32 %8 to i64, !dbg !368
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !368
  store i32 1, i32* %arrayidx5, align 4, !dbg !371
  store i32 0, i32* %i, align 4, !dbg !372
  br label %for.cond6, !dbg !374

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !375
  %cmp7 = icmp slt i32 %9, 10, !dbg !377
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !378

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !379
  %11 = load i32, i32* %i, align 4, !dbg !381
  %idxprom9 = sext i32 %11 to i64, !dbg !379
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !379
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !379
  call void @printIntLine(i32 noundef %12), !dbg !382
  br label %for.inc11, !dbg !383

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !384
  %inc12 = add nsw i32 %13, 1, !dbg !384
  store i32 %inc12, i32* %i, align 4, !dbg !384
  br label %for.cond6, !dbg !385, !llvm.loop !386

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !388

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !389
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !391
  %15 = bitcast i32* %14 to i8*, !dbg !391
  call void @free(i8* noundef %15), !dbg !392
  ret void, !dbg !393
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_03_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !3)
!20 = !DILocation(line: 24, column: 9, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 30, column: 16, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 28, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!25 = !DILocation(line: 30, column: 14, scope: !23)
!26 = !DILocalVariable(name: "i", scope: !27, file: !15, line: 35, type: !3)
!27 = distinct !DILexicalBlock(scope: !28, file: !15, line: 34, column: 9)
!28 = distinct !DILexicalBlock(scope: !29, file: !15, line: 33, column: 5)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!30 = !DILocation(line: 35, column: 17, scope: !27)
!31 = !DILocalVariable(name: "buffer", scope: !27, file: !15, line: 36, type: !5)
!32 = !DILocation(line: 36, column: 19, scope: !27)
!33 = !DILocation(line: 36, column: 35, scope: !27)
!34 = !DILocation(line: 36, column: 28, scope: !27)
!35 = !DILocation(line: 37, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !27, file: !15, line: 37, column: 17)
!37 = !DILocation(line: 37, column: 24, scope: !36)
!38 = !DILocation(line: 37, column: 17, scope: !27)
!39 = !DILocation(line: 37, column: 34, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 37, column: 33)
!41 = !DILocation(line: 39, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !27, file: !15, line: 39, column: 13)
!43 = !DILocation(line: 39, column: 18, scope: !42)
!44 = !DILocation(line: 39, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !15, line: 39, column: 13)
!46 = !DILocation(line: 39, column: 27, scope: !45)
!47 = !DILocation(line: 39, column: 13, scope: !42)
!48 = !DILocation(line: 41, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !15, line: 40, column: 13)
!50 = !DILocation(line: 41, column: 24, scope: !49)
!51 = !DILocation(line: 41, column: 27, scope: !49)
!52 = !DILocation(line: 42, column: 13, scope: !49)
!53 = !DILocation(line: 39, column: 34, scope: !45)
!54 = !DILocation(line: 39, column: 13, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 42, column: 13, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 45, column: 17, scope: !59)
!59 = distinct !DILexicalBlock(scope: !27, file: !15, line: 45, column: 17)
!60 = !DILocation(line: 45, column: 22, scope: !59)
!61 = !DILocation(line: 45, column: 17, scope: !27)
!62 = !DILocation(line: 47, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !15, line: 46, column: 13)
!64 = !DILocation(line: 47, column: 24, scope: !63)
!65 = !DILocation(line: 47, column: 30, scope: !63)
!66 = !DILocation(line: 49, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 49, column: 17)
!68 = !DILocation(line: 49, column: 21, scope: !67)
!69 = !DILocation(line: 49, column: 28, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !15, line: 49, column: 17)
!71 = !DILocation(line: 49, column: 30, scope: !70)
!72 = !DILocation(line: 49, column: 17, scope: !67)
!73 = !DILocation(line: 51, column: 34, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !15, line: 50, column: 17)
!75 = !DILocation(line: 51, column: 41, scope: !74)
!76 = !DILocation(line: 51, column: 21, scope: !74)
!77 = !DILocation(line: 52, column: 17, scope: !74)
!78 = !DILocation(line: 49, column: 37, scope: !70)
!79 = !DILocation(line: 49, column: 17, scope: !70)
!80 = distinct !{!80, !72, !81, !57}
!81 = !DILocation(line: 52, column: 17, scope: !67)
!82 = !DILocation(line: 53, column: 13, scope: !63)
!83 = !DILocation(line: 56, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !59, file: !15, line: 55, column: 13)
!85 = !DILocation(line: 58, column: 18, scope: !27)
!86 = !DILocation(line: 58, column: 13, scope: !27)
!87 = !DILocation(line: 61, column: 1, scope: !14)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_03_good", scope: !15, file: !15, line: 245, type: !16, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!89 = !DILocation(line: 247, column: 5, scope: !88)
!90 = !DILocation(line: 248, column: 5, scope: !88)
!91 = !DILocation(line: 249, column: 5, scope: !88)
!92 = !DILocation(line: 250, column: 5, scope: !88)
!93 = !DILocation(line: 251, column: 1, scope: !88)
!94 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 262, type: !95, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!95 = !DISubroutineType(types: !96)
!96 = !{!3, !3, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !15, line: 262, type: !3)
!101 = !DILocation(line: 262, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !15, line: 262, type: !97)
!103 = !DILocation(line: 262, column: 27, scope: !94)
!104 = !DILocation(line: 265, column: 22, scope: !94)
!105 = !DILocation(line: 265, column: 12, scope: !94)
!106 = !DILocation(line: 265, column: 5, scope: !94)
!107 = !DILocation(line: 267, column: 5, scope: !94)
!108 = !DILocation(line: 268, column: 5, scope: !94)
!109 = !DILocation(line: 269, column: 5, scope: !94)
!110 = !DILocation(line: 272, column: 5, scope: !94)
!111 = !DILocation(line: 273, column: 5, scope: !94)
!112 = !DILocation(line: 274, column: 5, scope: !94)
!113 = !DILocation(line: 276, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!115 = !DILocalVariable(name: "data", scope: !114, file: !15, line: 70, type: !3)
!116 = !DILocation(line: 70, column: 9, scope: !114)
!117 = !DILocation(line: 72, column: 10, scope: !114)
!118 = !DILocation(line: 76, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !120, file: !15, line: 74, column: 5)
!120 = distinct !DILexicalBlock(scope: !114, file: !15, line: 73, column: 8)
!121 = !DILocation(line: 76, column: 14, scope: !119)
!122 = !DILocalVariable(name: "i", scope: !123, file: !15, line: 86, type: !3)
!123 = distinct !DILexicalBlock(scope: !124, file: !15, line: 85, column: 9)
!124 = distinct !DILexicalBlock(scope: !125, file: !15, line: 84, column: 5)
!125 = distinct !DILexicalBlock(scope: !114, file: !15, line: 78, column: 8)
!126 = !DILocation(line: 86, column: 17, scope: !123)
!127 = !DILocalVariable(name: "buffer", scope: !123, file: !15, line: 87, type: !5)
!128 = !DILocation(line: 87, column: 19, scope: !123)
!129 = !DILocation(line: 87, column: 35, scope: !123)
!130 = !DILocation(line: 87, column: 28, scope: !123)
!131 = !DILocation(line: 88, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !15, line: 88, column: 17)
!133 = !DILocation(line: 88, column: 24, scope: !132)
!134 = !DILocation(line: 88, column: 17, scope: !123)
!135 = !DILocation(line: 88, column: 34, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 88, column: 33)
!137 = !DILocation(line: 90, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !123, file: !15, line: 90, column: 13)
!139 = !DILocation(line: 90, column: 18, scope: !138)
!140 = !DILocation(line: 90, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !15, line: 90, column: 13)
!142 = !DILocation(line: 90, column: 27, scope: !141)
!143 = !DILocation(line: 90, column: 13, scope: !138)
!144 = !DILocation(line: 92, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !15, line: 91, column: 13)
!146 = !DILocation(line: 92, column: 24, scope: !145)
!147 = !DILocation(line: 92, column: 27, scope: !145)
!148 = !DILocation(line: 93, column: 13, scope: !145)
!149 = !DILocation(line: 90, column: 34, scope: !141)
!150 = !DILocation(line: 90, column: 13, scope: !141)
!151 = distinct !{!151, !143, !152, !57}
!152 = !DILocation(line: 93, column: 13, scope: !138)
!153 = !DILocation(line: 95, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !123, file: !15, line: 95, column: 17)
!155 = !DILocation(line: 95, column: 22, scope: !154)
!156 = !DILocation(line: 95, column: 27, scope: !154)
!157 = !DILocation(line: 95, column: 30, scope: !154)
!158 = !DILocation(line: 95, column: 35, scope: !154)
!159 = !DILocation(line: 95, column: 17, scope: !123)
!160 = !DILocation(line: 97, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !15, line: 96, column: 13)
!162 = !DILocation(line: 97, column: 24, scope: !161)
!163 = !DILocation(line: 97, column: 30, scope: !161)
!164 = !DILocation(line: 99, column: 23, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !15, line: 99, column: 17)
!166 = !DILocation(line: 99, column: 21, scope: !165)
!167 = !DILocation(line: 99, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !15, line: 99, column: 17)
!169 = !DILocation(line: 99, column: 30, scope: !168)
!170 = !DILocation(line: 99, column: 17, scope: !165)
!171 = !DILocation(line: 101, column: 34, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !15, line: 100, column: 17)
!173 = !DILocation(line: 101, column: 41, scope: !172)
!174 = !DILocation(line: 101, column: 21, scope: !172)
!175 = !DILocation(line: 102, column: 17, scope: !172)
!176 = !DILocation(line: 99, column: 37, scope: !168)
!177 = !DILocation(line: 99, column: 17, scope: !168)
!178 = distinct !{!178, !170, !179, !57}
!179 = !DILocation(line: 102, column: 17, scope: !165)
!180 = !DILocation(line: 103, column: 13, scope: !161)
!181 = !DILocation(line: 106, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !154, file: !15, line: 105, column: 13)
!183 = !DILocation(line: 108, column: 18, scope: !123)
!184 = !DILocation(line: 108, column: 13, scope: !123)
!185 = !DILocation(line: 111, column: 1, scope: !114)
!186 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!187 = !DILocalVariable(name: "data", scope: !186, file: !15, line: 116, type: !3)
!188 = !DILocation(line: 116, column: 9, scope: !186)
!189 = !DILocation(line: 118, column: 10, scope: !186)
!190 = !DILocation(line: 122, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !192, file: !15, line: 120, column: 5)
!192 = distinct !DILexicalBlock(scope: !186, file: !15, line: 119, column: 8)
!193 = !DILocation(line: 122, column: 14, scope: !191)
!194 = !DILocalVariable(name: "i", scope: !195, file: !15, line: 127, type: !3)
!195 = distinct !DILexicalBlock(scope: !196, file: !15, line: 126, column: 9)
!196 = distinct !DILexicalBlock(scope: !197, file: !15, line: 125, column: 5)
!197 = distinct !DILexicalBlock(scope: !186, file: !15, line: 124, column: 8)
!198 = !DILocation(line: 127, column: 17, scope: !195)
!199 = !DILocalVariable(name: "buffer", scope: !195, file: !15, line: 128, type: !5)
!200 = !DILocation(line: 128, column: 19, scope: !195)
!201 = !DILocation(line: 128, column: 35, scope: !195)
!202 = !DILocation(line: 128, column: 28, scope: !195)
!203 = !DILocation(line: 129, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !195, file: !15, line: 129, column: 17)
!205 = !DILocation(line: 129, column: 24, scope: !204)
!206 = !DILocation(line: 129, column: 17, scope: !195)
!207 = !DILocation(line: 129, column: 34, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !15, line: 129, column: 33)
!209 = !DILocation(line: 131, column: 20, scope: !210)
!210 = distinct !DILexicalBlock(scope: !195, file: !15, line: 131, column: 13)
!211 = !DILocation(line: 131, column: 18, scope: !210)
!212 = !DILocation(line: 131, column: 25, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !15, line: 131, column: 13)
!214 = !DILocation(line: 131, column: 27, scope: !213)
!215 = !DILocation(line: 131, column: 13, scope: !210)
!216 = !DILocation(line: 133, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !15, line: 132, column: 13)
!218 = !DILocation(line: 133, column: 24, scope: !217)
!219 = !DILocation(line: 133, column: 27, scope: !217)
!220 = !DILocation(line: 134, column: 13, scope: !217)
!221 = !DILocation(line: 131, column: 34, scope: !213)
!222 = !DILocation(line: 131, column: 13, scope: !213)
!223 = distinct !{!223, !215, !224, !57}
!224 = !DILocation(line: 134, column: 13, scope: !210)
!225 = !DILocation(line: 136, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !195, file: !15, line: 136, column: 17)
!227 = !DILocation(line: 136, column: 22, scope: !226)
!228 = !DILocation(line: 136, column: 27, scope: !226)
!229 = !DILocation(line: 136, column: 30, scope: !226)
!230 = !DILocation(line: 136, column: 35, scope: !226)
!231 = !DILocation(line: 136, column: 17, scope: !195)
!232 = !DILocation(line: 138, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !226, file: !15, line: 137, column: 13)
!234 = !DILocation(line: 138, column: 24, scope: !233)
!235 = !DILocation(line: 138, column: 30, scope: !233)
!236 = !DILocation(line: 140, column: 23, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !15, line: 140, column: 17)
!238 = !DILocation(line: 140, column: 21, scope: !237)
!239 = !DILocation(line: 140, column: 28, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !15, line: 140, column: 17)
!241 = !DILocation(line: 140, column: 30, scope: !240)
!242 = !DILocation(line: 140, column: 17, scope: !237)
!243 = !DILocation(line: 142, column: 34, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !15, line: 141, column: 17)
!245 = !DILocation(line: 142, column: 41, scope: !244)
!246 = !DILocation(line: 142, column: 21, scope: !244)
!247 = !DILocation(line: 143, column: 17, scope: !244)
!248 = !DILocation(line: 140, column: 37, scope: !240)
!249 = !DILocation(line: 140, column: 17, scope: !240)
!250 = distinct !{!250, !242, !251, !57}
!251 = !DILocation(line: 143, column: 17, scope: !237)
!252 = !DILocation(line: 144, column: 13, scope: !233)
!253 = !DILocation(line: 147, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !226, file: !15, line: 146, column: 13)
!255 = !DILocation(line: 149, column: 18, scope: !195)
!256 = !DILocation(line: 149, column: 13, scope: !195)
!257 = !DILocation(line: 152, column: 1, scope: !186)
!258 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 155, type: !16, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!259 = !DILocalVariable(name: "data", scope: !258, file: !15, line: 157, type: !3)
!260 = !DILocation(line: 157, column: 9, scope: !258)
!261 = !DILocation(line: 159, column: 10, scope: !258)
!262 = !DILocation(line: 169, column: 14, scope: !263)
!263 = distinct !DILexicalBlock(scope: !264, file: !15, line: 166, column: 5)
!264 = distinct !DILexicalBlock(scope: !258, file: !15, line: 160, column: 8)
!265 = !DILocalVariable(name: "i", scope: !266, file: !15, line: 174, type: !3)
!266 = distinct !DILexicalBlock(scope: !267, file: !15, line: 173, column: 9)
!267 = distinct !DILexicalBlock(scope: !268, file: !15, line: 172, column: 5)
!268 = distinct !DILexicalBlock(scope: !258, file: !15, line: 171, column: 8)
!269 = !DILocation(line: 174, column: 17, scope: !266)
!270 = !DILocalVariable(name: "buffer", scope: !266, file: !15, line: 175, type: !5)
!271 = !DILocation(line: 175, column: 19, scope: !266)
!272 = !DILocation(line: 175, column: 35, scope: !266)
!273 = !DILocation(line: 175, column: 28, scope: !266)
!274 = !DILocation(line: 176, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !266, file: !15, line: 176, column: 17)
!276 = !DILocation(line: 176, column: 24, scope: !275)
!277 = !DILocation(line: 176, column: 17, scope: !266)
!278 = !DILocation(line: 176, column: 34, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !15, line: 176, column: 33)
!280 = !DILocation(line: 178, column: 20, scope: !281)
!281 = distinct !DILexicalBlock(scope: !266, file: !15, line: 178, column: 13)
!282 = !DILocation(line: 178, column: 18, scope: !281)
!283 = !DILocation(line: 178, column: 25, scope: !284)
!284 = distinct !DILexicalBlock(scope: !281, file: !15, line: 178, column: 13)
!285 = !DILocation(line: 178, column: 27, scope: !284)
!286 = !DILocation(line: 178, column: 13, scope: !281)
!287 = !DILocation(line: 180, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !15, line: 179, column: 13)
!289 = !DILocation(line: 180, column: 24, scope: !288)
!290 = !DILocation(line: 180, column: 27, scope: !288)
!291 = !DILocation(line: 181, column: 13, scope: !288)
!292 = !DILocation(line: 178, column: 34, scope: !284)
!293 = !DILocation(line: 178, column: 13, scope: !284)
!294 = distinct !{!294, !286, !295, !57}
!295 = !DILocation(line: 181, column: 13, scope: !281)
!296 = !DILocation(line: 184, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !266, file: !15, line: 184, column: 17)
!298 = !DILocation(line: 184, column: 22, scope: !297)
!299 = !DILocation(line: 184, column: 17, scope: !266)
!300 = !DILocation(line: 186, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !297, file: !15, line: 185, column: 13)
!302 = !DILocation(line: 186, column: 24, scope: !301)
!303 = !DILocation(line: 186, column: 30, scope: !301)
!304 = !DILocation(line: 188, column: 23, scope: !305)
!305 = distinct !DILexicalBlock(scope: !301, file: !15, line: 188, column: 17)
!306 = !DILocation(line: 188, column: 21, scope: !305)
!307 = !DILocation(line: 188, column: 28, scope: !308)
!308 = distinct !DILexicalBlock(scope: !305, file: !15, line: 188, column: 17)
!309 = !DILocation(line: 188, column: 30, scope: !308)
!310 = !DILocation(line: 188, column: 17, scope: !305)
!311 = !DILocation(line: 190, column: 34, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !15, line: 189, column: 17)
!313 = !DILocation(line: 190, column: 41, scope: !312)
!314 = !DILocation(line: 190, column: 21, scope: !312)
!315 = !DILocation(line: 191, column: 17, scope: !312)
!316 = !DILocation(line: 188, column: 37, scope: !308)
!317 = !DILocation(line: 188, column: 17, scope: !308)
!318 = distinct !{!318, !310, !319, !57}
!319 = !DILocation(line: 191, column: 17, scope: !305)
!320 = !DILocation(line: 192, column: 13, scope: !301)
!321 = !DILocation(line: 195, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !297, file: !15, line: 194, column: 13)
!323 = !DILocation(line: 197, column: 18, scope: !266)
!324 = !DILocation(line: 197, column: 13, scope: !266)
!325 = !DILocation(line: 200, column: 1, scope: !258)
!326 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 203, type: !16, scopeLine: 204, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!327 = !DILocalVariable(name: "data", scope: !326, file: !15, line: 205, type: !3)
!328 = !DILocation(line: 205, column: 9, scope: !326)
!329 = !DILocation(line: 207, column: 10, scope: !326)
!330 = !DILocation(line: 212, column: 14, scope: !331)
!331 = distinct !DILexicalBlock(scope: !332, file: !15, line: 209, column: 5)
!332 = distinct !DILexicalBlock(scope: !326, file: !15, line: 208, column: 8)
!333 = !DILocalVariable(name: "i", scope: !334, file: !15, line: 217, type: !3)
!334 = distinct !DILexicalBlock(scope: !335, file: !15, line: 216, column: 9)
!335 = distinct !DILexicalBlock(scope: !336, file: !15, line: 215, column: 5)
!336 = distinct !DILexicalBlock(scope: !326, file: !15, line: 214, column: 8)
!337 = !DILocation(line: 217, column: 17, scope: !334)
!338 = !DILocalVariable(name: "buffer", scope: !334, file: !15, line: 218, type: !5)
!339 = !DILocation(line: 218, column: 19, scope: !334)
!340 = !DILocation(line: 218, column: 35, scope: !334)
!341 = !DILocation(line: 218, column: 28, scope: !334)
!342 = !DILocation(line: 219, column: 17, scope: !343)
!343 = distinct !DILexicalBlock(scope: !334, file: !15, line: 219, column: 17)
!344 = !DILocation(line: 219, column: 24, scope: !343)
!345 = !DILocation(line: 219, column: 17, scope: !334)
!346 = !DILocation(line: 219, column: 34, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !15, line: 219, column: 33)
!348 = !DILocation(line: 221, column: 20, scope: !349)
!349 = distinct !DILexicalBlock(scope: !334, file: !15, line: 221, column: 13)
!350 = !DILocation(line: 221, column: 18, scope: !349)
!351 = !DILocation(line: 221, column: 25, scope: !352)
!352 = distinct !DILexicalBlock(scope: !349, file: !15, line: 221, column: 13)
!353 = !DILocation(line: 221, column: 27, scope: !352)
!354 = !DILocation(line: 221, column: 13, scope: !349)
!355 = !DILocation(line: 223, column: 17, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !15, line: 222, column: 13)
!357 = !DILocation(line: 223, column: 24, scope: !356)
!358 = !DILocation(line: 223, column: 27, scope: !356)
!359 = !DILocation(line: 224, column: 13, scope: !356)
!360 = !DILocation(line: 221, column: 34, scope: !352)
!361 = !DILocation(line: 221, column: 13, scope: !352)
!362 = distinct !{!362, !354, !363, !57}
!363 = !DILocation(line: 224, column: 13, scope: !349)
!364 = !DILocation(line: 227, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !334, file: !15, line: 227, column: 17)
!366 = !DILocation(line: 227, column: 22, scope: !365)
!367 = !DILocation(line: 227, column: 17, scope: !334)
!368 = !DILocation(line: 229, column: 17, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !15, line: 228, column: 13)
!370 = !DILocation(line: 229, column: 24, scope: !369)
!371 = !DILocation(line: 229, column: 30, scope: !369)
!372 = !DILocation(line: 231, column: 23, scope: !373)
!373 = distinct !DILexicalBlock(scope: !369, file: !15, line: 231, column: 17)
!374 = !DILocation(line: 231, column: 21, scope: !373)
!375 = !DILocation(line: 231, column: 28, scope: !376)
!376 = distinct !DILexicalBlock(scope: !373, file: !15, line: 231, column: 17)
!377 = !DILocation(line: 231, column: 30, scope: !376)
!378 = !DILocation(line: 231, column: 17, scope: !373)
!379 = !DILocation(line: 233, column: 34, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !15, line: 232, column: 17)
!381 = !DILocation(line: 233, column: 41, scope: !380)
!382 = !DILocation(line: 233, column: 21, scope: !380)
!383 = !DILocation(line: 234, column: 17, scope: !380)
!384 = !DILocation(line: 231, column: 37, scope: !376)
!385 = !DILocation(line: 231, column: 17, scope: !376)
!386 = distinct !{!386, !378, !387, !57}
!387 = !DILocation(line: 234, column: 17, scope: !373)
!388 = !DILocation(line: 235, column: 13, scope: !369)
!389 = !DILocation(line: 238, column: 17, scope: !390)
!390 = distinct !DILexicalBlock(scope: !365, file: !15, line: 237, column: 13)
!391 = !DILocation(line: 240, column: 18, scope: !334)
!392 = !DILocation(line: 240, column: 13, scope: !334)
!393 = !DILocation(line: 243, column: 1, scope: !326)
