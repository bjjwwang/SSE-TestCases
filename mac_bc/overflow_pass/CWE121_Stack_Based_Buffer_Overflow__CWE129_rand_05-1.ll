; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  %0 = load i32, i32* @staticTrue, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %call = call i32 @rand(), !dbg !28
  %and = and i32 %call, 1, !dbg !28
  %tobool1 = icmp ne i32 %and, 0, !dbg !28
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !28

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand(), !dbg !28
  %shl = shl i32 %call2, 30, !dbg !28
  %call3 = call i32 @rand(), !dbg !28
  %shl4 = shl i32 %call3, 15, !dbg !28
  %xor = xor i32 %shl, %shl4, !dbg !28
  %call5 = call i32 @rand(), !dbg !28
  %xor6 = xor i32 %xor, %call5, !dbg !28
  br label %cond.end, !dbg !28

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand(), !dbg !28
  %shl8 = shl i32 %call7, 30, !dbg !28
  %call9 = call i32 @rand(), !dbg !28
  %shl10 = shl i32 %call9, 15, !dbg !28
  %xor11 = xor i32 %shl8, %shl10, !dbg !28
  %call12 = call i32 @rand(), !dbg !28
  %xor13 = xor i32 %xor11, %call12, !dbg !28
  %sub = sub i32 0, %xor13, !dbg !28
  %sub14 = sub i32 %sub, 1, !dbg !28
  br label %cond.end, !dbg !28

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !28
  store i32 %cond, i32* %data, align 4, !dbg !30
  br label %if.end, !dbg !31

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool15 = icmp ne i32 %1, 0, !dbg !32
  br i1 %tobool15, label %if.then16, label %if.end22, !dbg !34

if.then16:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !39, metadata !DIExpression()), !dbg !43
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !43
  %3 = load i32, i32* %data, align 4, !dbg !44
  %cmp = icmp sge i32 %3, 0, !dbg !46
  br i1 %cmp, label %if.then17, label %if.else, !dbg !47

if.then17:                                        ; preds = %if.then16
  %4 = load i32, i32* %data, align 4, !dbg !48
  %idxprom = sext i32 %4 to i64, !dbg !50
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !50
  store i32 1, i32* %arrayidx, align 4, !dbg !51
  store i32 0, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.then17
  %5 = load i32, i32* %i, align 4, !dbg !55
  %cmp18 = icmp slt i32 %5, 10, !dbg !57
  br i1 %cmp18, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !59
  %idxprom19 = sext i32 %6 to i64, !dbg !61
  %arrayidx20 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom19, !dbg !61
  %7 = load i32, i32* %arrayidx20, align 4, !dbg !61
  call void @printIntLine(i32 noundef %7), !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !64
  %inc = add nsw i32 %8, 1, !dbg !64
  store i32 %inc, i32* %i, align 4, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  br label %if.end21, !dbg !69

if.else:                                          ; preds = %if.then16
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !70
  br label %if.end21

if.end21:                                         ; preds = %if.else, %for.end
  br label %if.end22, !dbg !72

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_05_good() #0 !dbg !74 {
entry:
  call void @goodB2G1(), !dbg !75
  call void @goodB2G2(), !dbg !76
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* noundef null), !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 noundef %conv), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_05_good(), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_05_bad(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !100 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i32 -1, i32* %data, align 4, !dbg !103
  %0 = load i32, i32* @staticTrue, align 4, !dbg !104
  %tobool = icmp ne i32 %0, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  %call = call i32 @rand(), !dbg !107
  %and = and i32 %call, 1, !dbg !107
  %tobool1 = icmp ne i32 %and, 0, !dbg !107
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !107

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand(), !dbg !107
  %shl = shl i32 %call2, 30, !dbg !107
  %call3 = call i32 @rand(), !dbg !107
  %shl4 = shl i32 %call3, 15, !dbg !107
  %xor = xor i32 %shl, %shl4, !dbg !107
  %call5 = call i32 @rand(), !dbg !107
  %xor6 = xor i32 %xor, %call5, !dbg !107
  br label %cond.end, !dbg !107

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand(), !dbg !107
  %shl8 = shl i32 %call7, 30, !dbg !107
  %call9 = call i32 @rand(), !dbg !107
  %shl10 = shl i32 %call9, 15, !dbg !107
  %xor11 = xor i32 %shl8, %shl10, !dbg !107
  %call12 = call i32 @rand(), !dbg !107
  %xor13 = xor i32 %xor11, %call12, !dbg !107
  %sub = sub i32 0, %xor13, !dbg !107
  %sub14 = sub i32 %sub, 1, !dbg !107
  br label %cond.end, !dbg !107

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !107
  store i32 %cond, i32* %data, align 4, !dbg !109
  br label %if.end, !dbg !110

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !111
  %tobool15 = icmp ne i32 %1, 0, !dbg !111
  br i1 %tobool15, label %if.then16, label %if.else, !dbg !113

if.then16:                                        ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !114
  br label %if.end24, !dbg !116

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !117, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !121, metadata !DIExpression()), !dbg !122
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !122
  %3 = load i32, i32* %data, align 4, !dbg !123
  %cmp = icmp sge i32 %3, 0, !dbg !125
  br i1 %cmp, label %land.lhs.true, label %if.else22, !dbg !126

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !127
  %cmp17 = icmp slt i32 %4, 10, !dbg !128
  br i1 %cmp17, label %if.then18, label %if.else22, !dbg !129

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !130
  %idxprom = sext i32 %5 to i64, !dbg !132
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !132
  store i32 1, i32* %arrayidx, align 4, !dbg !133
  store i32 0, i32* %i, align 4, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.then18
  %6 = load i32, i32* %i, align 4, !dbg !137
  %cmp19 = icmp slt i32 %6, 10, !dbg !139
  br i1 %cmp19, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !141
  %idxprom20 = sext i32 %7 to i64, !dbg !143
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom20, !dbg !143
  %8 = load i32, i32* %arrayidx21, align 4, !dbg !143
  call void @printIntLine(i32 noundef %8), !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !146
  %inc = add nsw i32 %9, 1, !dbg !146
  store i32 %inc, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  br label %if.end23, !dbg !150

if.else22:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !151
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %for.end
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then16
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !154 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !155, metadata !DIExpression()), !dbg !156
  store i32 -1, i32* %data, align 4, !dbg !157
  %0 = load i32, i32* @staticTrue, align 4, !dbg !158
  %tobool = icmp ne i32 %0, 0, !dbg !158
  br i1 %tobool, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %call = call i32 @rand(), !dbg !161
  %and = and i32 %call, 1, !dbg !161
  %tobool1 = icmp ne i32 %and, 0, !dbg !161
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !161

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand(), !dbg !161
  %shl = shl i32 %call2, 30, !dbg !161
  %call3 = call i32 @rand(), !dbg !161
  %shl4 = shl i32 %call3, 15, !dbg !161
  %xor = xor i32 %shl, %shl4, !dbg !161
  %call5 = call i32 @rand(), !dbg !161
  %xor6 = xor i32 %xor, %call5, !dbg !161
  br label %cond.end, !dbg !161

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand(), !dbg !161
  %shl8 = shl i32 %call7, 30, !dbg !161
  %call9 = call i32 @rand(), !dbg !161
  %shl10 = shl i32 %call9, 15, !dbg !161
  %xor11 = xor i32 %shl8, %shl10, !dbg !161
  %call12 = call i32 @rand(), !dbg !161
  %xor13 = xor i32 %xor11, %call12, !dbg !161
  %sub = sub i32 0, %xor13, !dbg !161
  %sub14 = sub i32 %sub, 1, !dbg !161
  br label %cond.end, !dbg !161

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !161
  store i32 %cond, i32* %data, align 4, !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !165
  %tobool15 = icmp ne i32 %1, 0, !dbg !165
  br i1 %tobool15, label %if.then16, label %if.end23, !dbg !167

if.then16:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !172, metadata !DIExpression()), !dbg !173
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !173
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !173
  %3 = load i32, i32* %data, align 4, !dbg !174
  %cmp = icmp sge i32 %3, 0, !dbg !176
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !177

land.lhs.true:                                    ; preds = %if.then16
  %4 = load i32, i32* %data, align 4, !dbg !178
  %cmp17 = icmp slt i32 %4, 10, !dbg !179
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !180

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !181
  %idxprom = sext i32 %5 to i64, !dbg !183
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !183
  store i32 1, i32* %arrayidx, align 4, !dbg !184
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.then18
  %6 = load i32, i32* %i, align 4, !dbg !188
  %cmp19 = icmp slt i32 %6, 10, !dbg !190
  br i1 %cmp19, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !192
  %idxprom20 = sext i32 %7 to i64, !dbg !194
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom20, !dbg !194
  %8 = load i32, i32* %arrayidx21, align 4, !dbg !194
  call void @printIntLine(i32 noundef %8), !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !197
  %inc = add nsw i32 %9, 1, !dbg !197
  store i32 %inc, i32* %i, align 4, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  br label %if.end22, !dbg !201

if.else:                                          ; preds = %land.lhs.true, %if.then16
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !202
  br label %if.end22

if.end22:                                         ; preds = %if.else, %for.end
  br label %if.end23, !dbg !204

if.end23:                                         ; preds = %if.end22, %if.end
  ret void, !dbg !205
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !206 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 -1, i32* %data, align 4, !dbg !209
  %0 = load i32, i32* @staticFalse, align 4, !dbg !210
  %tobool = icmp ne i32 %0, 0, !dbg !210
  br i1 %tobool, label %if.then, label %if.else, !dbg !212

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !213
  br label %if.end, !dbg !215

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !216
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !218
  %tobool1 = icmp ne i32 %1, 0, !dbg !218
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !220

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !221, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !225, metadata !DIExpression()), !dbg !226
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !226
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !226
  %3 = load i32, i32* %data, align 4, !dbg !227
  %cmp = icmp sge i32 %3, 0, !dbg !229
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !230

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !231
  %idxprom = sext i32 %4 to i64, !dbg !233
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !233
  store i32 1, i32* %arrayidx, align 4, !dbg !234
  store i32 0, i32* %i, align 4, !dbg !235
  br label %for.cond, !dbg !237

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !238
  %cmp4 = icmp slt i32 %5, 10, !dbg !240
  br i1 %cmp4, label %for.body, label %for.end, !dbg !241

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !242
  %idxprom5 = sext i32 %6 to i64, !dbg !244
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !244
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !244
  call void @printIntLine(i32 noundef %7), !dbg !245
  br label %for.inc, !dbg !246

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !247
  %inc = add nsw i32 %8, 1, !dbg !247
  store i32 %inc, i32* %i, align 4, !dbg !247
  br label %for.cond, !dbg !248, !llvm.loop !249

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !251

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !252
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !254

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !255
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !256 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !257, metadata !DIExpression()), !dbg !258
  store i32 -1, i32* %data, align 4, !dbg !259
  %0 = load i32, i32* @staticTrue, align 4, !dbg !260
  %tobool = icmp ne i32 %0, 0, !dbg !260
  br i1 %tobool, label %if.then, label %if.end, !dbg !262

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !263
  br label %if.end, !dbg !265

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !266
  %tobool1 = icmp ne i32 %1, 0, !dbg !266
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !268

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !269, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !273, metadata !DIExpression()), !dbg !274
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !274
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !274
  %3 = load i32, i32* %data, align 4, !dbg !275
  %cmp = icmp sge i32 %3, 0, !dbg !277
  br i1 %cmp, label %if.then3, label %if.else, !dbg !278

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !279
  %idxprom = sext i32 %4 to i64, !dbg !281
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !281
  store i32 1, i32* %arrayidx, align 4, !dbg !282
  store i32 0, i32* %i, align 4, !dbg !283
  br label %for.cond, !dbg !285

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !286
  %cmp4 = icmp slt i32 %5, 10, !dbg !288
  br i1 %cmp4, label %for.body, label %for.end, !dbg !289

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !290
  %idxprom5 = sext i32 %6 to i64, !dbg !292
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !292
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !292
  call void @printIntLine(i32 noundef %7), !dbg !293
  br label %for.inc, !dbg !294

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !295
  %inc = add nsw i32 %8, 1, !dbg !295
  store i32 %inc, i32* %i, align 4, !dbg !295
  br label %for.cond, !dbg !296, !llvm.loop !297

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !299

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !300
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !302

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !303
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !7, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !6}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !5, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 30, type: !5)
!23 = !DILocation(line: 30, column: 9, scope: !18)
!24 = !DILocation(line: 32, column: 10, scope: !18)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 8, scope: !18)
!28 = !DILocation(line: 36, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !10, line: 34, column: 5)
!30 = !DILocation(line: 36, column: 14, scope: !29)
!31 = !DILocation(line: 37, column: 5, scope: !29)
!32 = !DILocation(line: 38, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !10, line: 38, column: 8)
!34 = !DILocation(line: 38, column: 8, scope: !18)
!35 = !DILocalVariable(name: "i", scope: !36, file: !10, line: 41, type: !5)
!36 = distinct !DILexicalBlock(scope: !37, file: !10, line: 40, column: 9)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 39, column: 5)
!38 = !DILocation(line: 41, column: 17, scope: !36)
!39 = !DILocalVariable(name: "buffer", scope: !36, file: !10, line: 42, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 10)
!43 = !DILocation(line: 42, column: 17, scope: !36)
!44 = !DILocation(line: 45, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !36, file: !10, line: 45, column: 17)
!46 = !DILocation(line: 45, column: 22, scope: !45)
!47 = !DILocation(line: 45, column: 17, scope: !36)
!48 = !DILocation(line: 47, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !10, line: 46, column: 13)
!50 = !DILocation(line: 47, column: 17, scope: !49)
!51 = !DILocation(line: 47, column: 30, scope: !49)
!52 = !DILocation(line: 49, column: 23, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !10, line: 49, column: 17)
!54 = !DILocation(line: 49, column: 21, scope: !53)
!55 = !DILocation(line: 49, column: 28, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !10, line: 49, column: 17)
!57 = !DILocation(line: 49, column: 30, scope: !56)
!58 = !DILocation(line: 49, column: 17, scope: !53)
!59 = !DILocation(line: 51, column: 41, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !10, line: 50, column: 17)
!61 = !DILocation(line: 51, column: 34, scope: !60)
!62 = !DILocation(line: 51, column: 21, scope: !60)
!63 = !DILocation(line: 52, column: 17, scope: !60)
!64 = !DILocation(line: 49, column: 37, scope: !56)
!65 = !DILocation(line: 49, column: 17, scope: !56)
!66 = distinct !{!66, !58, !67, !68}
!67 = !DILocation(line: 52, column: 17, scope: !53)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 53, column: 13, scope: !49)
!70 = !DILocation(line: 56, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !45, file: !10, line: 55, column: 13)
!72 = !DILocation(line: 59, column: 5, scope: !37)
!73 = !DILocation(line: 60, column: 1, scope: !18)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_05_good", scope: !10, file: !10, line: 216, type: !19, scopeLine: 217, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!75 = !DILocation(line: 218, column: 5, scope: !74)
!76 = !DILocation(line: 219, column: 5, scope: !74)
!77 = !DILocation(line: 220, column: 5, scope: !74)
!78 = !DILocation(line: 221, column: 5, scope: !74)
!79 = !DILocation(line: 222, column: 1, scope: !74)
!80 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 233, type: !81, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!81 = !DISubroutineType(types: !82)
!82 = !{!5, !5, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !10, line: 233, type: !5)
!87 = !DILocation(line: 233, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !10, line: 233, type: !83)
!89 = !DILocation(line: 233, column: 27, scope: !80)
!90 = !DILocation(line: 236, column: 22, scope: !80)
!91 = !DILocation(line: 236, column: 12, scope: !80)
!92 = !DILocation(line: 236, column: 5, scope: !80)
!93 = !DILocation(line: 238, column: 5, scope: !80)
!94 = !DILocation(line: 239, column: 5, scope: !80)
!95 = !DILocation(line: 240, column: 5, scope: !80)
!96 = !DILocation(line: 243, column: 5, scope: !80)
!97 = !DILocation(line: 244, column: 5, scope: !80)
!98 = !DILocation(line: 245, column: 5, scope: !80)
!99 = !DILocation(line: 247, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodB2G1", scope: !10, file: !10, line: 67, type: !19, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!101 = !DILocalVariable(name: "data", scope: !100, file: !10, line: 69, type: !5)
!102 = !DILocation(line: 69, column: 9, scope: !100)
!103 = !DILocation(line: 71, column: 10, scope: !100)
!104 = !DILocation(line: 72, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !10, line: 72, column: 8)
!106 = !DILocation(line: 72, column: 8, scope: !100)
!107 = !DILocation(line: 75, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !10, line: 73, column: 5)
!109 = !DILocation(line: 75, column: 14, scope: !108)
!110 = !DILocation(line: 76, column: 5, scope: !108)
!111 = !DILocation(line: 77, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !100, file: !10, line: 77, column: 8)
!113 = !DILocation(line: 77, column: 8, scope: !100)
!114 = !DILocation(line: 80, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !10, line: 78, column: 5)
!116 = !DILocation(line: 81, column: 5, scope: !115)
!117 = !DILocalVariable(name: "i", scope: !118, file: !10, line: 85, type: !5)
!118 = distinct !DILexicalBlock(scope: !119, file: !10, line: 84, column: 9)
!119 = distinct !DILexicalBlock(scope: !112, file: !10, line: 83, column: 5)
!120 = !DILocation(line: 85, column: 17, scope: !118)
!121 = !DILocalVariable(name: "buffer", scope: !118, file: !10, line: 86, type: !40)
!122 = !DILocation(line: 86, column: 17, scope: !118)
!123 = !DILocation(line: 88, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !10, line: 88, column: 17)
!125 = !DILocation(line: 88, column: 22, scope: !124)
!126 = !DILocation(line: 88, column: 27, scope: !124)
!127 = !DILocation(line: 88, column: 30, scope: !124)
!128 = !DILocation(line: 88, column: 35, scope: !124)
!129 = !DILocation(line: 88, column: 17, scope: !118)
!130 = !DILocation(line: 90, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !10, line: 89, column: 13)
!132 = !DILocation(line: 90, column: 17, scope: !131)
!133 = !DILocation(line: 90, column: 30, scope: !131)
!134 = !DILocation(line: 92, column: 23, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !10, line: 92, column: 17)
!136 = !DILocation(line: 92, column: 21, scope: !135)
!137 = !DILocation(line: 92, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !10, line: 92, column: 17)
!139 = !DILocation(line: 92, column: 30, scope: !138)
!140 = !DILocation(line: 92, column: 17, scope: !135)
!141 = !DILocation(line: 94, column: 41, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !10, line: 93, column: 17)
!143 = !DILocation(line: 94, column: 34, scope: !142)
!144 = !DILocation(line: 94, column: 21, scope: !142)
!145 = !DILocation(line: 95, column: 17, scope: !142)
!146 = !DILocation(line: 92, column: 37, scope: !138)
!147 = !DILocation(line: 92, column: 17, scope: !138)
!148 = distinct !{!148, !140, !149, !68}
!149 = !DILocation(line: 95, column: 17, scope: !135)
!150 = !DILocation(line: 96, column: 13, scope: !131)
!151 = !DILocation(line: 99, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !124, file: !10, line: 98, column: 13)
!153 = !DILocation(line: 103, column: 1, scope: !100)
!154 = distinct !DISubprogram(name: "goodB2G2", scope: !10, file: !10, line: 106, type: !19, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!155 = !DILocalVariable(name: "data", scope: !154, file: !10, line: 108, type: !5)
!156 = !DILocation(line: 108, column: 9, scope: !154)
!157 = !DILocation(line: 110, column: 10, scope: !154)
!158 = !DILocation(line: 111, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !10, line: 111, column: 8)
!160 = !DILocation(line: 111, column: 8, scope: !154)
!161 = !DILocation(line: 114, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !10, line: 112, column: 5)
!163 = !DILocation(line: 114, column: 14, scope: !162)
!164 = !DILocation(line: 115, column: 5, scope: !162)
!165 = !DILocation(line: 116, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !154, file: !10, line: 116, column: 8)
!167 = !DILocation(line: 116, column: 8, scope: !154)
!168 = !DILocalVariable(name: "i", scope: !169, file: !10, line: 119, type: !5)
!169 = distinct !DILexicalBlock(scope: !170, file: !10, line: 118, column: 9)
!170 = distinct !DILexicalBlock(scope: !166, file: !10, line: 117, column: 5)
!171 = !DILocation(line: 119, column: 17, scope: !169)
!172 = !DILocalVariable(name: "buffer", scope: !169, file: !10, line: 120, type: !40)
!173 = !DILocation(line: 120, column: 17, scope: !169)
!174 = !DILocation(line: 122, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !169, file: !10, line: 122, column: 17)
!176 = !DILocation(line: 122, column: 22, scope: !175)
!177 = !DILocation(line: 122, column: 27, scope: !175)
!178 = !DILocation(line: 122, column: 30, scope: !175)
!179 = !DILocation(line: 122, column: 35, scope: !175)
!180 = !DILocation(line: 122, column: 17, scope: !169)
!181 = !DILocation(line: 124, column: 24, scope: !182)
!182 = distinct !DILexicalBlock(scope: !175, file: !10, line: 123, column: 13)
!183 = !DILocation(line: 124, column: 17, scope: !182)
!184 = !DILocation(line: 124, column: 30, scope: !182)
!185 = !DILocation(line: 126, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !10, line: 126, column: 17)
!187 = !DILocation(line: 126, column: 21, scope: !186)
!188 = !DILocation(line: 126, column: 28, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !10, line: 126, column: 17)
!190 = !DILocation(line: 126, column: 30, scope: !189)
!191 = !DILocation(line: 126, column: 17, scope: !186)
!192 = !DILocation(line: 128, column: 41, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !10, line: 127, column: 17)
!194 = !DILocation(line: 128, column: 34, scope: !193)
!195 = !DILocation(line: 128, column: 21, scope: !193)
!196 = !DILocation(line: 129, column: 17, scope: !193)
!197 = !DILocation(line: 126, column: 37, scope: !189)
!198 = !DILocation(line: 126, column: 17, scope: !189)
!199 = distinct !{!199, !191, !200, !68}
!200 = !DILocation(line: 129, column: 17, scope: !186)
!201 = !DILocation(line: 130, column: 13, scope: !182)
!202 = !DILocation(line: 133, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !175, file: !10, line: 132, column: 13)
!204 = !DILocation(line: 136, column: 5, scope: !170)
!205 = !DILocation(line: 137, column: 1, scope: !154)
!206 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 140, type: !19, scopeLine: 141, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!207 = !DILocalVariable(name: "data", scope: !206, file: !10, line: 142, type: !5)
!208 = !DILocation(line: 142, column: 9, scope: !206)
!209 = !DILocation(line: 144, column: 10, scope: !206)
!210 = !DILocation(line: 145, column: 8, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !10, line: 145, column: 8)
!212 = !DILocation(line: 145, column: 8, scope: !206)
!213 = !DILocation(line: 148, column: 9, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !10, line: 146, column: 5)
!215 = !DILocation(line: 149, column: 5, scope: !214)
!216 = !DILocation(line: 154, column: 14, scope: !217)
!217 = distinct !DILexicalBlock(scope: !211, file: !10, line: 151, column: 5)
!218 = !DILocation(line: 156, column: 8, scope: !219)
!219 = distinct !DILexicalBlock(scope: !206, file: !10, line: 156, column: 8)
!220 = !DILocation(line: 156, column: 8, scope: !206)
!221 = !DILocalVariable(name: "i", scope: !222, file: !10, line: 159, type: !5)
!222 = distinct !DILexicalBlock(scope: !223, file: !10, line: 158, column: 9)
!223 = distinct !DILexicalBlock(scope: !219, file: !10, line: 157, column: 5)
!224 = !DILocation(line: 159, column: 17, scope: !222)
!225 = !DILocalVariable(name: "buffer", scope: !222, file: !10, line: 160, type: !40)
!226 = !DILocation(line: 160, column: 17, scope: !222)
!227 = !DILocation(line: 163, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !222, file: !10, line: 163, column: 17)
!229 = !DILocation(line: 163, column: 22, scope: !228)
!230 = !DILocation(line: 163, column: 17, scope: !222)
!231 = !DILocation(line: 165, column: 24, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !10, line: 164, column: 13)
!233 = !DILocation(line: 165, column: 17, scope: !232)
!234 = !DILocation(line: 165, column: 30, scope: !232)
!235 = !DILocation(line: 167, column: 23, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !10, line: 167, column: 17)
!237 = !DILocation(line: 167, column: 21, scope: !236)
!238 = !DILocation(line: 167, column: 28, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !10, line: 167, column: 17)
!240 = !DILocation(line: 167, column: 30, scope: !239)
!241 = !DILocation(line: 167, column: 17, scope: !236)
!242 = !DILocation(line: 169, column: 41, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !10, line: 168, column: 17)
!244 = !DILocation(line: 169, column: 34, scope: !243)
!245 = !DILocation(line: 169, column: 21, scope: !243)
!246 = !DILocation(line: 170, column: 17, scope: !243)
!247 = !DILocation(line: 167, column: 37, scope: !239)
!248 = !DILocation(line: 167, column: 17, scope: !239)
!249 = distinct !{!249, !241, !250, !68}
!250 = !DILocation(line: 170, column: 17, scope: !236)
!251 = !DILocation(line: 171, column: 13, scope: !232)
!252 = !DILocation(line: 174, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !228, file: !10, line: 173, column: 13)
!254 = !DILocation(line: 177, column: 5, scope: !223)
!255 = !DILocation(line: 178, column: 1, scope: !206)
!256 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 181, type: !19, scopeLine: 182, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!257 = !DILocalVariable(name: "data", scope: !256, file: !10, line: 183, type: !5)
!258 = !DILocation(line: 183, column: 9, scope: !256)
!259 = !DILocation(line: 185, column: 10, scope: !256)
!260 = !DILocation(line: 186, column: 8, scope: !261)
!261 = distinct !DILexicalBlock(scope: !256, file: !10, line: 186, column: 8)
!262 = !DILocation(line: 186, column: 8, scope: !256)
!263 = !DILocation(line: 190, column: 14, scope: !264)
!264 = distinct !DILexicalBlock(scope: !261, file: !10, line: 187, column: 5)
!265 = !DILocation(line: 191, column: 5, scope: !264)
!266 = !DILocation(line: 192, column: 8, scope: !267)
!267 = distinct !DILexicalBlock(scope: !256, file: !10, line: 192, column: 8)
!268 = !DILocation(line: 192, column: 8, scope: !256)
!269 = !DILocalVariable(name: "i", scope: !270, file: !10, line: 195, type: !5)
!270 = distinct !DILexicalBlock(scope: !271, file: !10, line: 194, column: 9)
!271 = distinct !DILexicalBlock(scope: !267, file: !10, line: 193, column: 5)
!272 = !DILocation(line: 195, column: 17, scope: !270)
!273 = !DILocalVariable(name: "buffer", scope: !270, file: !10, line: 196, type: !40)
!274 = !DILocation(line: 196, column: 17, scope: !270)
!275 = !DILocation(line: 199, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !270, file: !10, line: 199, column: 17)
!277 = !DILocation(line: 199, column: 22, scope: !276)
!278 = !DILocation(line: 199, column: 17, scope: !270)
!279 = !DILocation(line: 201, column: 24, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !10, line: 200, column: 13)
!281 = !DILocation(line: 201, column: 17, scope: !280)
!282 = !DILocation(line: 201, column: 30, scope: !280)
!283 = !DILocation(line: 203, column: 23, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !10, line: 203, column: 17)
!285 = !DILocation(line: 203, column: 21, scope: !284)
!286 = !DILocation(line: 203, column: 28, scope: !287)
!287 = distinct !DILexicalBlock(scope: !284, file: !10, line: 203, column: 17)
!288 = !DILocation(line: 203, column: 30, scope: !287)
!289 = !DILocation(line: 203, column: 17, scope: !284)
!290 = !DILocation(line: 205, column: 41, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !10, line: 204, column: 17)
!292 = !DILocation(line: 205, column: 34, scope: !291)
!293 = !DILocation(line: 205, column: 21, scope: !291)
!294 = !DILocation(line: 206, column: 17, scope: !291)
!295 = !DILocation(line: 203, column: 37, scope: !287)
!296 = !DILocation(line: 203, column: 17, scope: !287)
!297 = distinct !{!297, !289, !298, !68}
!298 = !DILocation(line: 206, column: 17, scope: !284)
!299 = !DILocation(line: 207, column: 13, scope: !280)
!300 = !DILocation(line: 210, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !276, file: !10, line: 209, column: 13)
!302 = !DILocation(line: 213, column: 5, scope: !271)
!303 = !DILocation(line: 214, column: 1, scope: !256)
