; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_06_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %call = call i32 @rand(), !dbg !20
  %and = and i32 %call, 1, !dbg !20
  %tobool = icmp ne i32 %and, 0, !dbg !20
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !20

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !20
  %shl = shl i32 %call1, 30, !dbg !20
  %call2 = call i32 @rand(), !dbg !20
  %shl3 = shl i32 %call2, 15, !dbg !20
  %xor = xor i32 %shl, %shl3, !dbg !20
  %call4 = call i32 @rand(), !dbg !20
  %xor5 = xor i32 %xor, %call4, !dbg !20
  br label %cond.end, !dbg !20

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !20
  %shl7 = shl i32 %call6, 30, !dbg !20
  %call8 = call i32 @rand(), !dbg !20
  %shl9 = shl i32 %call8, 15, !dbg !20
  %xor10 = xor i32 %shl7, %shl9, !dbg !20
  %call11 = call i32 @rand(), !dbg !20
  %xor12 = xor i32 %xor10, %call11, !dbg !20
  %sub = sub i32 0, %xor12, !dbg !20
  %sub13 = sub i32 %sub, 1, !dbg !20
  br label %cond.end, !dbg !20

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !20
  store i32 %cond, i32* %data, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !33
  %1 = load i32, i32* %data, align 4, !dbg !34
  %cmp = icmp sge i32 %1, 0, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !38
  %idxprom = sext i32 %2 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !40
  store i32 1, i32* %arrayidx, align 4, !dbg !41
  store i32 0, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !45
  %cmp14 = icmp slt i32 %3, 10, !dbg !47
  br i1 %cmp14, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !49
  %idxprom15 = sext i32 %4 to i64, !dbg !51
  %arrayidx16 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom15, !dbg !51
  %5 = load i32, i32* %arrayidx16, align 4, !dbg !51
  call void @printIntLine(i32 noundef %5), !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !54
  %inc = add nsw i32 %6, 1, !dbg !54
  store i32 %inc, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !59

if.else:                                          ; preds = %cond.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !60
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_06_good() #0 !dbg !63 {
entry:
  call void @goodB2G1(), !dbg !64
  call void @goodB2G2(), !dbg !65
  call void @goodG2B1(), !dbg !66
  call void @goodG2B2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* noundef null), !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 noundef %conv), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_06_good(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_06_bad(), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !89 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 -1, i32* %data, align 4, !dbg !92
  %call = call i32 @rand(), !dbg !93
  %and = and i32 %call, 1, !dbg !93
  %tobool = icmp ne i32 %and, 0, !dbg !93
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !93

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !93
  %shl = shl i32 %call1, 30, !dbg !93
  %call2 = call i32 @rand(), !dbg !93
  %shl3 = shl i32 %call2, 15, !dbg !93
  %xor = xor i32 %shl, %shl3, !dbg !93
  %call4 = call i32 @rand(), !dbg !93
  %xor5 = xor i32 %xor, %call4, !dbg !93
  br label %cond.end, !dbg !93

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !93
  %shl7 = shl i32 %call6, 30, !dbg !93
  %call8 = call i32 @rand(), !dbg !93
  %shl9 = shl i32 %call8, 15, !dbg !93
  %xor10 = xor i32 %shl7, %shl9, !dbg !93
  %call11 = call i32 @rand(), !dbg !93
  %xor12 = xor i32 %xor10, %call11, !dbg !93
  %sub = sub i32 0, %xor12, !dbg !93
  %sub13 = sub i32 %sub, 1, !dbg !93
  br label %cond.end, !dbg !93

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !93
  store i32 %cond, i32* %data, align 4, !dbg !96
  call void @llvm.dbg.declare(metadata i32* %i, metadata !97, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !103
  %1 = load i32, i32* %data, align 4, !dbg !104
  %cmp = icmp sge i32 %1, 0, !dbg !106
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !107

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !108
  %cmp14 = icmp slt i32 %2, 10, !dbg !109
  br i1 %cmp14, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !111
  %idxprom = sext i32 %3 to i64, !dbg !113
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !113
  store i32 1, i32* %arrayidx, align 4, !dbg !114
  store i32 0, i32* %i, align 4, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !118
  %cmp15 = icmp slt i32 %4, 10, !dbg !120
  br i1 %cmp15, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !122
  %idxprom16 = sext i32 %5 to i64, !dbg !124
  %arrayidx17 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom16, !dbg !124
  %6 = load i32, i32* %arrayidx17, align 4, !dbg !124
  call void @printIntLine(i32 noundef %6), !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !127
  %inc = add nsw i32 %7, 1, !dbg !127
  store i32 %inc, i32* %i, align 4, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !131

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !132
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !135 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !136, metadata !DIExpression()), !dbg !137
  store i32 -1, i32* %data, align 4, !dbg !138
  %call = call i32 @rand(), !dbg !139
  %and = and i32 %call, 1, !dbg !139
  %tobool = icmp ne i32 %and, 0, !dbg !139
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !139

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !139
  %shl = shl i32 %call1, 30, !dbg !139
  %call2 = call i32 @rand(), !dbg !139
  %shl3 = shl i32 %call2, 15, !dbg !139
  %xor = xor i32 %shl, %shl3, !dbg !139
  %call4 = call i32 @rand(), !dbg !139
  %xor5 = xor i32 %xor, %call4, !dbg !139
  br label %cond.end, !dbg !139

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !139
  %shl7 = shl i32 %call6, 30, !dbg !139
  %call8 = call i32 @rand(), !dbg !139
  %shl9 = shl i32 %call8, 15, !dbg !139
  %xor10 = xor i32 %shl7, %shl9, !dbg !139
  %call11 = call i32 @rand(), !dbg !139
  %xor12 = xor i32 %xor10, %call11, !dbg !139
  %sub = sub i32 0, %xor12, !dbg !139
  %sub13 = sub i32 %sub, 1, !dbg !139
  br label %cond.end, !dbg !139

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !139
  store i32 %cond, i32* %data, align 4, !dbg !142
  call void @llvm.dbg.declare(metadata i32* %i, metadata !143, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !149
  %1 = load i32, i32* %data, align 4, !dbg !150
  %cmp = icmp sge i32 %1, 0, !dbg !152
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !153

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !154
  %cmp14 = icmp slt i32 %2, 10, !dbg !155
  br i1 %cmp14, label %if.then, label %if.else, !dbg !156

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !157
  %idxprom = sext i32 %3 to i64, !dbg !159
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !159
  store i32 1, i32* %arrayidx, align 4, !dbg !160
  store i32 0, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !164
  %cmp15 = icmp slt i32 %4, 10, !dbg !166
  br i1 %cmp15, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !168
  %idxprom16 = sext i32 %5 to i64, !dbg !170
  %arrayidx17 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom16, !dbg !170
  %6 = load i32, i32* %arrayidx17, align 4, !dbg !170
  call void @printIntLine(i32 noundef %6), !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !173
  %inc = add nsw i32 %7, 1, !dbg !173
  store i32 %inc, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !177

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !178
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !180
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !181 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !182, metadata !DIExpression()), !dbg !183
  store i32 -1, i32* %data, align 4, !dbg !184
  store i32 7, i32* %data, align 4, !dbg !185
  call void @llvm.dbg.declare(metadata i32* %i, metadata !188, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !193, metadata !DIExpression()), !dbg !194
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !194
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !194
  %1 = load i32, i32* %data, align 4, !dbg !195
  %cmp = icmp sge i32 %1, 0, !dbg !197
  br i1 %cmp, label %if.then, label %if.else, !dbg !198

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !199
  %idxprom = sext i32 %2 to i64, !dbg !201
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !201
  store i32 1, i32* %arrayidx, align 4, !dbg !202
  store i32 0, i32* %i, align 4, !dbg !203
  br label %for.cond, !dbg !205

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !206
  %cmp1 = icmp slt i32 %3, 10, !dbg !208
  br i1 %cmp1, label %for.body, label %for.end, !dbg !209

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !210
  %idxprom2 = sext i32 %4 to i64, !dbg !212
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !212
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !212
  call void @printIntLine(i32 noundef %5), !dbg !213
  br label %for.inc, !dbg !214

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !215
  %inc = add nsw i32 %6, 1, !dbg !215
  store i32 %inc, i32* %i, align 4, !dbg !215
  br label %for.cond, !dbg !216, !llvm.loop !217

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !219

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !220
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !222
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !223 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !224, metadata !DIExpression()), !dbg !225
  store i32 -1, i32* %data, align 4, !dbg !226
  store i32 7, i32* %data, align 4, !dbg !227
  call void @llvm.dbg.declare(metadata i32* %i, metadata !230, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !235, metadata !DIExpression()), !dbg !236
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !236
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !236
  %1 = load i32, i32* %data, align 4, !dbg !237
  %cmp = icmp sge i32 %1, 0, !dbg !239
  br i1 %cmp, label %if.then, label %if.else, !dbg !240

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !241
  %idxprom = sext i32 %2 to i64, !dbg !243
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !243
  store i32 1, i32* %arrayidx, align 4, !dbg !244
  store i32 0, i32* %i, align 4, !dbg !245
  br label %for.cond, !dbg !247

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !248
  %cmp1 = icmp slt i32 %3, 10, !dbg !250
  br i1 %cmp1, label %for.body, label %for.end, !dbg !251

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !252
  %idxprom2 = sext i32 %4 to i64, !dbg !254
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !254
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !254
  call void @printIntLine(i32 noundef %5), !dbg !255
  br label %for.inc, !dbg !256

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !257
  %inc = add nsw i32 %6, 1, !dbg !257
  store i32 %inc, i32* %i, align 4, !dbg !257
  br label %for.cond, !dbg !258, !llvm.loop !259

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !261

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !262
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !264
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4}
!3 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_06_bad", scope: !13, file: !13, line: 27, type: !14, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 29, type: !3)
!18 = !DILocation(line: 29, column: 9, scope: !12)
!19 = !DILocation(line: 31, column: 10, scope: !12)
!20 = !DILocation(line: 35, column: 16, scope: !21)
!21 = distinct !DILexicalBlock(scope: !22, file: !13, line: 33, column: 5)
!22 = distinct !DILexicalBlock(scope: !12, file: !13, line: 32, column: 8)
!23 = !DILocation(line: 35, column: 14, scope: !21)
!24 = !DILocalVariable(name: "i", scope: !25, file: !13, line: 40, type: !3)
!25 = distinct !DILexicalBlock(scope: !26, file: !13, line: 39, column: 9)
!26 = distinct !DILexicalBlock(scope: !27, file: !13, line: 38, column: 5)
!27 = distinct !DILexicalBlock(scope: !12, file: !13, line: 37, column: 8)
!28 = !DILocation(line: 40, column: 17, scope: !25)
!29 = !DILocalVariable(name: "buffer", scope: !25, file: !13, line: 41, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 41, column: 17, scope: !25)
!34 = !DILocation(line: 44, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !25, file: !13, line: 44, column: 17)
!36 = !DILocation(line: 44, column: 22, scope: !35)
!37 = !DILocation(line: 44, column: 17, scope: !25)
!38 = !DILocation(line: 46, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 45, column: 13)
!40 = !DILocation(line: 46, column: 17, scope: !39)
!41 = !DILocation(line: 46, column: 30, scope: !39)
!42 = !DILocation(line: 48, column: 23, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !13, line: 48, column: 17)
!44 = !DILocation(line: 48, column: 21, scope: !43)
!45 = !DILocation(line: 48, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !13, line: 48, column: 17)
!47 = !DILocation(line: 48, column: 30, scope: !46)
!48 = !DILocation(line: 48, column: 17, scope: !43)
!49 = !DILocation(line: 50, column: 41, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !13, line: 49, column: 17)
!51 = !DILocation(line: 50, column: 34, scope: !50)
!52 = !DILocation(line: 50, column: 21, scope: !50)
!53 = !DILocation(line: 51, column: 17, scope: !50)
!54 = !DILocation(line: 48, column: 37, scope: !46)
!55 = !DILocation(line: 48, column: 17, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 51, column: 17, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 52, column: 13, scope: !39)
!60 = !DILocation(line: 55, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !35, file: !13, line: 54, column: 13)
!62 = !DILocation(line: 59, column: 1, scope: !12)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_06_good", scope: !13, file: !13, line: 215, type: !14, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!64 = !DILocation(line: 217, column: 5, scope: !63)
!65 = !DILocation(line: 218, column: 5, scope: !63)
!66 = !DILocation(line: 219, column: 5, scope: !63)
!67 = !DILocation(line: 220, column: 5, scope: !63)
!68 = !DILocation(line: 221, column: 1, scope: !63)
!69 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 232, type: !70, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!70 = !DISubroutineType(types: !71)
!71 = !{!3, !3, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !13, line: 232, type: !3)
!76 = !DILocation(line: 232, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !13, line: 232, type: !72)
!78 = !DILocation(line: 232, column: 27, scope: !69)
!79 = !DILocation(line: 235, column: 22, scope: !69)
!80 = !DILocation(line: 235, column: 12, scope: !69)
!81 = !DILocation(line: 235, column: 5, scope: !69)
!82 = !DILocation(line: 237, column: 5, scope: !69)
!83 = !DILocation(line: 238, column: 5, scope: !69)
!84 = !DILocation(line: 239, column: 5, scope: !69)
!85 = !DILocation(line: 242, column: 5, scope: !69)
!86 = !DILocation(line: 243, column: 5, scope: !69)
!87 = !DILocation(line: 244, column: 5, scope: !69)
!88 = !DILocation(line: 246, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 66, type: !14, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!90 = !DILocalVariable(name: "data", scope: !89, file: !13, line: 68, type: !3)
!91 = !DILocation(line: 68, column: 9, scope: !89)
!92 = !DILocation(line: 70, column: 10, scope: !89)
!93 = !DILocation(line: 74, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !95, file: !13, line: 72, column: 5)
!95 = distinct !DILexicalBlock(scope: !89, file: !13, line: 71, column: 8)
!96 = !DILocation(line: 74, column: 14, scope: !94)
!97 = !DILocalVariable(name: "i", scope: !98, file: !13, line: 84, type: !3)
!98 = distinct !DILexicalBlock(scope: !99, file: !13, line: 83, column: 9)
!99 = distinct !DILexicalBlock(scope: !100, file: !13, line: 82, column: 5)
!100 = distinct !DILexicalBlock(scope: !89, file: !13, line: 76, column: 8)
!101 = !DILocation(line: 84, column: 17, scope: !98)
!102 = !DILocalVariable(name: "buffer", scope: !98, file: !13, line: 85, type: !30)
!103 = !DILocation(line: 85, column: 17, scope: !98)
!104 = !DILocation(line: 87, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !98, file: !13, line: 87, column: 17)
!106 = !DILocation(line: 87, column: 22, scope: !105)
!107 = !DILocation(line: 87, column: 27, scope: !105)
!108 = !DILocation(line: 87, column: 30, scope: !105)
!109 = !DILocation(line: 87, column: 35, scope: !105)
!110 = !DILocation(line: 87, column: 17, scope: !98)
!111 = !DILocation(line: 89, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !13, line: 88, column: 13)
!113 = !DILocation(line: 89, column: 17, scope: !112)
!114 = !DILocation(line: 89, column: 30, scope: !112)
!115 = !DILocation(line: 91, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !13, line: 91, column: 17)
!117 = !DILocation(line: 91, column: 21, scope: !116)
!118 = !DILocation(line: 91, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !13, line: 91, column: 17)
!120 = !DILocation(line: 91, column: 30, scope: !119)
!121 = !DILocation(line: 91, column: 17, scope: !116)
!122 = !DILocation(line: 93, column: 41, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !13, line: 92, column: 17)
!124 = !DILocation(line: 93, column: 34, scope: !123)
!125 = !DILocation(line: 93, column: 21, scope: !123)
!126 = !DILocation(line: 94, column: 17, scope: !123)
!127 = !DILocation(line: 91, column: 37, scope: !119)
!128 = !DILocation(line: 91, column: 17, scope: !119)
!129 = distinct !{!129, !121, !130, !58}
!130 = !DILocation(line: 94, column: 17, scope: !116)
!131 = !DILocation(line: 95, column: 13, scope: !112)
!132 = !DILocation(line: 98, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !105, file: !13, line: 97, column: 13)
!134 = !DILocation(line: 102, column: 1, scope: !89)
!135 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 105, type: !14, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!136 = !DILocalVariable(name: "data", scope: !135, file: !13, line: 107, type: !3)
!137 = !DILocation(line: 107, column: 9, scope: !135)
!138 = !DILocation(line: 109, column: 10, scope: !135)
!139 = !DILocation(line: 113, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !141, file: !13, line: 111, column: 5)
!141 = distinct !DILexicalBlock(scope: !135, file: !13, line: 110, column: 8)
!142 = !DILocation(line: 113, column: 14, scope: !140)
!143 = !DILocalVariable(name: "i", scope: !144, file: !13, line: 118, type: !3)
!144 = distinct !DILexicalBlock(scope: !145, file: !13, line: 117, column: 9)
!145 = distinct !DILexicalBlock(scope: !146, file: !13, line: 116, column: 5)
!146 = distinct !DILexicalBlock(scope: !135, file: !13, line: 115, column: 8)
!147 = !DILocation(line: 118, column: 17, scope: !144)
!148 = !DILocalVariable(name: "buffer", scope: !144, file: !13, line: 119, type: !30)
!149 = !DILocation(line: 119, column: 17, scope: !144)
!150 = !DILocation(line: 121, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !144, file: !13, line: 121, column: 17)
!152 = !DILocation(line: 121, column: 22, scope: !151)
!153 = !DILocation(line: 121, column: 27, scope: !151)
!154 = !DILocation(line: 121, column: 30, scope: !151)
!155 = !DILocation(line: 121, column: 35, scope: !151)
!156 = !DILocation(line: 121, column: 17, scope: !144)
!157 = !DILocation(line: 123, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !151, file: !13, line: 122, column: 13)
!159 = !DILocation(line: 123, column: 17, scope: !158)
!160 = !DILocation(line: 123, column: 30, scope: !158)
!161 = !DILocation(line: 125, column: 23, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !13, line: 125, column: 17)
!163 = !DILocation(line: 125, column: 21, scope: !162)
!164 = !DILocation(line: 125, column: 28, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !13, line: 125, column: 17)
!166 = !DILocation(line: 125, column: 30, scope: !165)
!167 = !DILocation(line: 125, column: 17, scope: !162)
!168 = !DILocation(line: 127, column: 41, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !13, line: 126, column: 17)
!170 = !DILocation(line: 127, column: 34, scope: !169)
!171 = !DILocation(line: 127, column: 21, scope: !169)
!172 = !DILocation(line: 128, column: 17, scope: !169)
!173 = !DILocation(line: 125, column: 37, scope: !165)
!174 = !DILocation(line: 125, column: 17, scope: !165)
!175 = distinct !{!175, !167, !176, !58}
!176 = !DILocation(line: 128, column: 17, scope: !162)
!177 = !DILocation(line: 129, column: 13, scope: !158)
!178 = !DILocation(line: 132, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !151, file: !13, line: 131, column: 13)
!180 = !DILocation(line: 136, column: 1, scope: !135)
!181 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 139, type: !14, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!182 = !DILocalVariable(name: "data", scope: !181, file: !13, line: 141, type: !3)
!183 = !DILocation(line: 141, column: 9, scope: !181)
!184 = !DILocation(line: 143, column: 10, scope: !181)
!185 = !DILocation(line: 153, column: 14, scope: !186)
!186 = distinct !DILexicalBlock(scope: !187, file: !13, line: 150, column: 5)
!187 = distinct !DILexicalBlock(scope: !181, file: !13, line: 144, column: 8)
!188 = !DILocalVariable(name: "i", scope: !189, file: !13, line: 158, type: !3)
!189 = distinct !DILexicalBlock(scope: !190, file: !13, line: 157, column: 9)
!190 = distinct !DILexicalBlock(scope: !191, file: !13, line: 156, column: 5)
!191 = distinct !DILexicalBlock(scope: !181, file: !13, line: 155, column: 8)
!192 = !DILocation(line: 158, column: 17, scope: !189)
!193 = !DILocalVariable(name: "buffer", scope: !189, file: !13, line: 159, type: !30)
!194 = !DILocation(line: 159, column: 17, scope: !189)
!195 = !DILocation(line: 162, column: 17, scope: !196)
!196 = distinct !DILexicalBlock(scope: !189, file: !13, line: 162, column: 17)
!197 = !DILocation(line: 162, column: 22, scope: !196)
!198 = !DILocation(line: 162, column: 17, scope: !189)
!199 = !DILocation(line: 164, column: 24, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !13, line: 163, column: 13)
!201 = !DILocation(line: 164, column: 17, scope: !200)
!202 = !DILocation(line: 164, column: 30, scope: !200)
!203 = !DILocation(line: 166, column: 23, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !13, line: 166, column: 17)
!205 = !DILocation(line: 166, column: 21, scope: !204)
!206 = !DILocation(line: 166, column: 28, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !13, line: 166, column: 17)
!208 = !DILocation(line: 166, column: 30, scope: !207)
!209 = !DILocation(line: 166, column: 17, scope: !204)
!210 = !DILocation(line: 168, column: 41, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !13, line: 167, column: 17)
!212 = !DILocation(line: 168, column: 34, scope: !211)
!213 = !DILocation(line: 168, column: 21, scope: !211)
!214 = !DILocation(line: 169, column: 17, scope: !211)
!215 = !DILocation(line: 166, column: 37, scope: !207)
!216 = !DILocation(line: 166, column: 17, scope: !207)
!217 = distinct !{!217, !209, !218, !58}
!218 = !DILocation(line: 169, column: 17, scope: !204)
!219 = !DILocation(line: 170, column: 13, scope: !200)
!220 = !DILocation(line: 173, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !196, file: !13, line: 172, column: 13)
!222 = !DILocation(line: 177, column: 1, scope: !181)
!223 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 180, type: !14, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!224 = !DILocalVariable(name: "data", scope: !223, file: !13, line: 182, type: !3)
!225 = !DILocation(line: 182, column: 9, scope: !223)
!226 = !DILocation(line: 184, column: 10, scope: !223)
!227 = !DILocation(line: 189, column: 14, scope: !228)
!228 = distinct !DILexicalBlock(scope: !229, file: !13, line: 186, column: 5)
!229 = distinct !DILexicalBlock(scope: !223, file: !13, line: 185, column: 8)
!230 = !DILocalVariable(name: "i", scope: !231, file: !13, line: 194, type: !3)
!231 = distinct !DILexicalBlock(scope: !232, file: !13, line: 193, column: 9)
!232 = distinct !DILexicalBlock(scope: !233, file: !13, line: 192, column: 5)
!233 = distinct !DILexicalBlock(scope: !223, file: !13, line: 191, column: 8)
!234 = !DILocation(line: 194, column: 17, scope: !231)
!235 = !DILocalVariable(name: "buffer", scope: !231, file: !13, line: 195, type: !30)
!236 = !DILocation(line: 195, column: 17, scope: !231)
!237 = !DILocation(line: 198, column: 17, scope: !238)
!238 = distinct !DILexicalBlock(scope: !231, file: !13, line: 198, column: 17)
!239 = !DILocation(line: 198, column: 22, scope: !238)
!240 = !DILocation(line: 198, column: 17, scope: !231)
!241 = !DILocation(line: 200, column: 24, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !13, line: 199, column: 13)
!243 = !DILocation(line: 200, column: 17, scope: !242)
!244 = !DILocation(line: 200, column: 30, scope: !242)
!245 = !DILocation(line: 202, column: 23, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !13, line: 202, column: 17)
!247 = !DILocation(line: 202, column: 21, scope: !246)
!248 = !DILocation(line: 202, column: 28, scope: !249)
!249 = distinct !DILexicalBlock(scope: !246, file: !13, line: 202, column: 17)
!250 = !DILocation(line: 202, column: 30, scope: !249)
!251 = !DILocation(line: 202, column: 17, scope: !246)
!252 = !DILocation(line: 204, column: 41, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !13, line: 203, column: 17)
!254 = !DILocation(line: 204, column: 34, scope: !253)
!255 = !DILocation(line: 204, column: 21, scope: !253)
!256 = !DILocation(line: 205, column: 17, scope: !253)
!257 = !DILocation(line: 202, column: 37, scope: !249)
!258 = !DILocation(line: 202, column: 17, scope: !249)
!259 = distinct !{!259, !251, !260, !58}
!260 = !DILocation(line: 205, column: 17, scope: !246)
!261 = !DILocation(line: 206, column: 13, scope: !242)
!262 = !DILocation(line: 209, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !238, file: !13, line: 208, column: 13)
!264 = !DILocation(line: 213, column: 1, scope: !223)
