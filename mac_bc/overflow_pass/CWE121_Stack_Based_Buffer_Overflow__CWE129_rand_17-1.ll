; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_17_bad() #0 !dbg !12 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i17 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %j, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand(), !dbg !31
  %and = and i32 %call, 1, !dbg !31
  %tobool = icmp ne i32 %and, 0, !dbg !31
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !31

cond.true:                                        ; preds = %for.body
  %call1 = call i32 @rand(), !dbg !31
  %shl = shl i32 %call1, 30, !dbg !31
  %call2 = call i32 @rand(), !dbg !31
  %shl3 = shl i32 %call2, 15, !dbg !31
  %xor = xor i32 %shl, %shl3, !dbg !31
  %call4 = call i32 @rand(), !dbg !31
  %xor5 = xor i32 %xor, %call4, !dbg !31
  br label %cond.end, !dbg !31

cond.false:                                       ; preds = %for.body
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
  store i32 %cond, i32* %data, align 4, !dbg !33
  br label %for.inc, !dbg !34

for.inc:                                          ; preds = %cond.end
  %1 = load i32, i32* %i, align 4, !dbg !35
  %inc = add nsw i32 %1, 1, !dbg !35
  store i32 %inc, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !36, !llvm.loop !37

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !40
  br label %for.cond14, !dbg !42

for.cond14:                                       ; preds = %for.inc27, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !43
  %cmp15 = icmp slt i32 %2, 1, !dbg !45
  br i1 %cmp15, label %for.body16, label %for.end29, !dbg !46

for.body16:                                       ; preds = %for.cond14
  call void @llvm.dbg.declare(metadata i32* %i17, metadata !47, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !51, metadata !DIExpression()), !dbg !55
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !55
  %4 = load i32, i32* %data, align 4, !dbg !56
  %cmp18 = icmp sge i32 %4, 0, !dbg !58
  br i1 %cmp18, label %if.then, label %if.else, !dbg !59

if.then:                                          ; preds = %for.body16
  %5 = load i32, i32* %data, align 4, !dbg !60
  %idxprom = sext i32 %5 to i64, !dbg !62
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !62
  store i32 1, i32* %arrayidx, align 4, !dbg !63
  store i32 0, i32* %i17, align 4, !dbg !64
  br label %for.cond19, !dbg !66

for.cond19:                                       ; preds = %for.inc24, %if.then
  %6 = load i32, i32* %i17, align 4, !dbg !67
  %cmp20 = icmp slt i32 %6, 10, !dbg !69
  br i1 %cmp20, label %for.body21, label %for.end26, !dbg !70

for.body21:                                       ; preds = %for.cond19
  %7 = load i32, i32* %i17, align 4, !dbg !71
  %idxprom22 = sext i32 %7 to i64, !dbg !73
  %arrayidx23 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom22, !dbg !73
  %8 = load i32, i32* %arrayidx23, align 4, !dbg !73
  call void @printIntLine(i32 noundef %8), !dbg !74
  br label %for.inc24, !dbg !75

for.inc24:                                        ; preds = %for.body21
  %9 = load i32, i32* %i17, align 4, !dbg !76
  %inc25 = add nsw i32 %9, 1, !dbg !76
  store i32 %inc25, i32* %i17, align 4, !dbg !76
  br label %for.cond19, !dbg !77, !llvm.loop !78

for.end26:                                        ; preds = %for.cond19
  br label %if.end, !dbg !80

if.else:                                          ; preds = %for.body16
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !81
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end26
  br label %for.inc27, !dbg !83

for.inc27:                                        ; preds = %if.end
  %10 = load i32, i32* %j, align 4, !dbg !84
  %inc28 = add nsw i32 %10, 1, !dbg !84
  store i32 %inc28, i32* %j, align 4, !dbg !84
  br label %for.cond14, !dbg !85, !llvm.loop !86

for.end29:                                        ; preds = %for.cond14
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_17_good() #0 !dbg !89 {
entry:
  call void @goodB2G(), !dbg !90
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !93 {
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
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_17_good(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_17_bad(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !113 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %i17 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %k, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32* %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 -1, i32* %data, align 4, !dbg !120
  store i32 0, i32* %i, align 4, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !124
  %cmp = icmp slt i32 %0, 1, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand(), !dbg !128
  %and = and i32 %call, 1, !dbg !128
  %tobool = icmp ne i32 %and, 0, !dbg !128
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !128

cond.true:                                        ; preds = %for.body
  %call1 = call i32 @rand(), !dbg !128
  %shl = shl i32 %call1, 30, !dbg !128
  %call2 = call i32 @rand(), !dbg !128
  %shl3 = shl i32 %call2, 15, !dbg !128
  %xor = xor i32 %shl, %shl3, !dbg !128
  %call4 = call i32 @rand(), !dbg !128
  %xor5 = xor i32 %xor, %call4, !dbg !128
  br label %cond.end, !dbg !128

cond.false:                                       ; preds = %for.body
  %call6 = call i32 @rand(), !dbg !128
  %shl7 = shl i32 %call6, 30, !dbg !128
  %call8 = call i32 @rand(), !dbg !128
  %shl9 = shl i32 %call8, 15, !dbg !128
  %xor10 = xor i32 %shl7, %shl9, !dbg !128
  %call11 = call i32 @rand(), !dbg !128
  %xor12 = xor i32 %xor10, %call11, !dbg !128
  %sub = sub i32 0, %xor12, !dbg !128
  %sub13 = sub i32 %sub, 1, !dbg !128
  br label %cond.end, !dbg !128

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !128
  store i32 %cond, i32* %data, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %cond.end
  %1 = load i32, i32* %i, align 4, !dbg !132
  %inc = add nsw i32 %1, 1, !dbg !132
  store i32 %inc, i32* %i, align 4, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !136
  br label %for.cond14, !dbg !138

for.cond14:                                       ; preds = %for.inc28, %for.end
  %2 = load i32, i32* %k, align 4, !dbg !139
  %cmp15 = icmp slt i32 %2, 1, !dbg !141
  br i1 %cmp15, label %for.body16, label %for.end30, !dbg !142

for.body16:                                       ; preds = %for.cond14
  call void @llvm.dbg.declare(metadata i32* %i17, metadata !143, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !147, metadata !DIExpression()), !dbg !148
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !148
  %4 = load i32, i32* %data, align 4, !dbg !149
  %cmp18 = icmp sge i32 %4, 0, !dbg !151
  br i1 %cmp18, label %land.lhs.true, label %if.else, !dbg !152

land.lhs.true:                                    ; preds = %for.body16
  %5 = load i32, i32* %data, align 4, !dbg !153
  %cmp19 = icmp slt i32 %5, 10, !dbg !154
  br i1 %cmp19, label %if.then, label %if.else, !dbg !155

if.then:                                          ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !156
  %idxprom = sext i32 %6 to i64, !dbg !158
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !158
  store i32 1, i32* %arrayidx, align 4, !dbg !159
  store i32 0, i32* %i17, align 4, !dbg !160
  br label %for.cond20, !dbg !162

for.cond20:                                       ; preds = %for.inc25, %if.then
  %7 = load i32, i32* %i17, align 4, !dbg !163
  %cmp21 = icmp slt i32 %7, 10, !dbg !165
  br i1 %cmp21, label %for.body22, label %for.end27, !dbg !166

for.body22:                                       ; preds = %for.cond20
  %8 = load i32, i32* %i17, align 4, !dbg !167
  %idxprom23 = sext i32 %8 to i64, !dbg !169
  %arrayidx24 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom23, !dbg !169
  %9 = load i32, i32* %arrayidx24, align 4, !dbg !169
  call void @printIntLine(i32 noundef %9), !dbg !170
  br label %for.inc25, !dbg !171

for.inc25:                                        ; preds = %for.body22
  %10 = load i32, i32* %i17, align 4, !dbg !172
  %inc26 = add nsw i32 %10, 1, !dbg !172
  store i32 %inc26, i32* %i17, align 4, !dbg !172
  br label %for.cond20, !dbg !173, !llvm.loop !174

for.end27:                                        ; preds = %for.cond20
  br label %if.end, !dbg !176

if.else:                                          ; preds = %land.lhs.true, %for.body16
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !177
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end27
  br label %for.inc28, !dbg !179

for.inc28:                                        ; preds = %if.end
  %11 = load i32, i32* %k, align 4, !dbg !180
  %inc29 = add nsw i32 %11, 1, !dbg !180
  store i32 %inc29, i32* %k, align 4, !dbg !180
  br label %for.cond14, !dbg !181, !llvm.loop !182

for.end30:                                        ; preds = %for.cond14
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !185 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !186, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata i32* %j, metadata !188, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata i32* %data, metadata !190, metadata !DIExpression()), !dbg !191
  store i32 -1, i32* %data, align 4, !dbg !192
  store i32 0, i32* %h, align 4, !dbg !193
  br label %for.cond, !dbg !195

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !196
  %cmp = icmp slt i32 %0, 1, !dbg !198
  br i1 %cmp, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !200
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !203
  %inc = add nsw i32 %1, 1, !dbg !203
  store i32 %inc, i32* %h, align 4, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !207
  br label %for.cond1, !dbg !209

for.cond1:                                        ; preds = %for.inc13, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !210
  %cmp2 = icmp slt i32 %2, 1, !dbg !212
  br i1 %cmp2, label %for.body3, label %for.end15, !dbg !213

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !214, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !218, metadata !DIExpression()), !dbg !219
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !219
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !219
  %4 = load i32, i32* %data, align 4, !dbg !220
  %cmp4 = icmp sge i32 %4, 0, !dbg !222
  br i1 %cmp4, label %if.then, label %if.else, !dbg !223

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !224
  %idxprom = sext i32 %5 to i64, !dbg !226
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !226
  store i32 1, i32* %arrayidx, align 4, !dbg !227
  store i32 0, i32* %i, align 4, !dbg !228
  br label %for.cond5, !dbg !230

for.cond5:                                        ; preds = %for.inc10, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !231
  %cmp6 = icmp slt i32 %6, 10, !dbg !233
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !234

for.body7:                                        ; preds = %for.cond5
  %7 = load i32, i32* %i, align 4, !dbg !235
  %idxprom8 = sext i32 %7 to i64, !dbg !237
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !237
  %8 = load i32, i32* %arrayidx9, align 4, !dbg !237
  call void @printIntLine(i32 noundef %8), !dbg !238
  br label %for.inc10, !dbg !239

for.inc10:                                        ; preds = %for.body7
  %9 = load i32, i32* %i, align 4, !dbg !240
  %inc11 = add nsw i32 %9, 1, !dbg !240
  store i32 %inc11, i32* %i, align 4, !dbg !240
  br label %for.cond5, !dbg !241, !llvm.loop !242

for.end12:                                        ; preds = %for.cond5
  br label %if.end, !dbg !244

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !245
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end12
  br label %for.inc13, !dbg !247

for.inc13:                                        ; preds = %if.end
  %10 = load i32, i32* %j, align 4, !dbg !248
  %inc14 = add nsw i32 %10, 1, !dbg !248
  store i32 %inc14, i32* %j, align 4, !dbg !248
  br label %for.cond1, !dbg !249, !llvm.loop !250

for.end15:                                        ; preds = %for.cond1
  ret void, !dbg !252
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_17_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "i", scope: !12, file: !13, line: 24, type: !3)
!18 = !DILocation(line: 24, column: 9, scope: !12)
!19 = !DILocalVariable(name: "j", scope: !12, file: !13, line: 24, type: !3)
!20 = !DILocation(line: 24, column: 11, scope: !12)
!21 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 25, type: !3)
!22 = !DILocation(line: 25, column: 9, scope: !12)
!23 = !DILocation(line: 27, column: 10, scope: !12)
!24 = !DILocation(line: 28, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !12, file: !13, line: 28, column: 5)
!26 = !DILocation(line: 28, column: 9, scope: !25)
!27 = !DILocation(line: 28, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !13, line: 28, column: 5)
!29 = !DILocation(line: 28, column: 18, scope: !28)
!30 = !DILocation(line: 28, column: 5, scope: !25)
!31 = !DILocation(line: 31, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !13, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 14, scope: !32)
!34 = !DILocation(line: 32, column: 5, scope: !32)
!35 = !DILocation(line: 28, column: 24, scope: !28)
!36 = !DILocation(line: 28, column: 5, scope: !28)
!37 = distinct !{!37, !30, !38, !39}
!38 = !DILocation(line: 32, column: 5, scope: !25)
!39 = !{!"llvm.loop.mustprogress"}
!40 = !DILocation(line: 33, column: 11, scope: !41)
!41 = distinct !DILexicalBlock(scope: !12, file: !13, line: 33, column: 5)
!42 = !DILocation(line: 33, column: 9, scope: !41)
!43 = !DILocation(line: 33, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !13, line: 33, column: 5)
!45 = !DILocation(line: 33, column: 18, scope: !44)
!46 = !DILocation(line: 33, column: 5, scope: !41)
!47 = !DILocalVariable(name: "i", scope: !48, file: !13, line: 36, type: !3)
!48 = distinct !DILexicalBlock(scope: !49, file: !13, line: 35, column: 9)
!49 = distinct !DILexicalBlock(scope: !44, file: !13, line: 34, column: 5)
!50 = !DILocation(line: 36, column: 17, scope: !48)
!51 = !DILocalVariable(name: "buffer", scope: !48, file: !13, line: 37, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3, size: 320, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 10)
!55 = !DILocation(line: 37, column: 17, scope: !48)
!56 = !DILocation(line: 40, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !48, file: !13, line: 40, column: 17)
!58 = !DILocation(line: 40, column: 22, scope: !57)
!59 = !DILocation(line: 40, column: 17, scope: !48)
!60 = !DILocation(line: 42, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !13, line: 41, column: 13)
!62 = !DILocation(line: 42, column: 17, scope: !61)
!63 = !DILocation(line: 42, column: 30, scope: !61)
!64 = !DILocation(line: 44, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !13, line: 44, column: 17)
!66 = !DILocation(line: 44, column: 21, scope: !65)
!67 = !DILocation(line: 44, column: 28, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !13, line: 44, column: 17)
!69 = !DILocation(line: 44, column: 30, scope: !68)
!70 = !DILocation(line: 44, column: 17, scope: !65)
!71 = !DILocation(line: 46, column: 41, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !13, line: 45, column: 17)
!73 = !DILocation(line: 46, column: 34, scope: !72)
!74 = !DILocation(line: 46, column: 21, scope: !72)
!75 = !DILocation(line: 47, column: 17, scope: !72)
!76 = !DILocation(line: 44, column: 37, scope: !68)
!77 = !DILocation(line: 44, column: 17, scope: !68)
!78 = distinct !{!78, !70, !79, !39}
!79 = !DILocation(line: 47, column: 17, scope: !65)
!80 = !DILocation(line: 48, column: 13, scope: !61)
!81 = !DILocation(line: 51, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !57, file: !13, line: 50, column: 13)
!83 = !DILocation(line: 54, column: 5, scope: !49)
!84 = !DILocation(line: 33, column: 24, scope: !44)
!85 = !DILocation(line: 33, column: 5, scope: !44)
!86 = distinct !{!86, !46, !87, !39}
!87 = !DILocation(line: 54, column: 5, scope: !41)
!88 = !DILocation(line: 55, column: 1, scope: !12)
!89 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_17_good", scope: !13, file: !13, line: 133, type: !14, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!90 = !DILocation(line: 135, column: 5, scope: !89)
!91 = !DILocation(line: 136, column: 5, scope: !89)
!92 = !DILocation(line: 137, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 148, type: !94, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!94 = !DISubroutineType(types: !95)
!95 = !{!3, !3, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !13, line: 148, type: !3)
!100 = !DILocation(line: 148, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !13, line: 148, type: !96)
!102 = !DILocation(line: 148, column: 27, scope: !93)
!103 = !DILocation(line: 151, column: 22, scope: !93)
!104 = !DILocation(line: 151, column: 12, scope: !93)
!105 = !DILocation(line: 151, column: 5, scope: !93)
!106 = !DILocation(line: 153, column: 5, scope: !93)
!107 = !DILocation(line: 154, column: 5, scope: !93)
!108 = !DILocation(line: 155, column: 5, scope: !93)
!109 = !DILocation(line: 158, column: 5, scope: !93)
!110 = !DILocation(line: 159, column: 5, scope: !93)
!111 = !DILocation(line: 160, column: 5, scope: !93)
!112 = !DILocation(line: 162, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 62, type: !14, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!114 = !DILocalVariable(name: "i", scope: !113, file: !13, line: 64, type: !3)
!115 = !DILocation(line: 64, column: 9, scope: !113)
!116 = !DILocalVariable(name: "k", scope: !113, file: !13, line: 64, type: !3)
!117 = !DILocation(line: 64, column: 11, scope: !113)
!118 = !DILocalVariable(name: "data", scope: !113, file: !13, line: 65, type: !3)
!119 = !DILocation(line: 65, column: 9, scope: !113)
!120 = !DILocation(line: 67, column: 10, scope: !113)
!121 = !DILocation(line: 68, column: 11, scope: !122)
!122 = distinct !DILexicalBlock(scope: !113, file: !13, line: 68, column: 5)
!123 = !DILocation(line: 68, column: 9, scope: !122)
!124 = !DILocation(line: 68, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !13, line: 68, column: 5)
!126 = !DILocation(line: 68, column: 18, scope: !125)
!127 = !DILocation(line: 68, column: 5, scope: !122)
!128 = !DILocation(line: 71, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !13, line: 69, column: 5)
!130 = !DILocation(line: 71, column: 14, scope: !129)
!131 = !DILocation(line: 72, column: 5, scope: !129)
!132 = !DILocation(line: 68, column: 24, scope: !125)
!133 = !DILocation(line: 68, column: 5, scope: !125)
!134 = distinct !{!134, !127, !135, !39}
!135 = !DILocation(line: 72, column: 5, scope: !122)
!136 = !DILocation(line: 73, column: 11, scope: !137)
!137 = distinct !DILexicalBlock(scope: !113, file: !13, line: 73, column: 5)
!138 = !DILocation(line: 73, column: 9, scope: !137)
!139 = !DILocation(line: 73, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !13, line: 73, column: 5)
!141 = !DILocation(line: 73, column: 18, scope: !140)
!142 = !DILocation(line: 73, column: 5, scope: !137)
!143 = !DILocalVariable(name: "i", scope: !144, file: !13, line: 76, type: !3)
!144 = distinct !DILexicalBlock(scope: !145, file: !13, line: 75, column: 9)
!145 = distinct !DILexicalBlock(scope: !140, file: !13, line: 74, column: 5)
!146 = !DILocation(line: 76, column: 17, scope: !144)
!147 = !DILocalVariable(name: "buffer", scope: !144, file: !13, line: 77, type: !52)
!148 = !DILocation(line: 77, column: 17, scope: !144)
!149 = !DILocation(line: 79, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !144, file: !13, line: 79, column: 17)
!151 = !DILocation(line: 79, column: 22, scope: !150)
!152 = !DILocation(line: 79, column: 27, scope: !150)
!153 = !DILocation(line: 79, column: 30, scope: !150)
!154 = !DILocation(line: 79, column: 35, scope: !150)
!155 = !DILocation(line: 79, column: 17, scope: !144)
!156 = !DILocation(line: 81, column: 24, scope: !157)
!157 = distinct !DILexicalBlock(scope: !150, file: !13, line: 80, column: 13)
!158 = !DILocation(line: 81, column: 17, scope: !157)
!159 = !DILocation(line: 81, column: 30, scope: !157)
!160 = !DILocation(line: 83, column: 23, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 83, column: 17)
!162 = !DILocation(line: 83, column: 21, scope: !161)
!163 = !DILocation(line: 83, column: 28, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !13, line: 83, column: 17)
!165 = !DILocation(line: 83, column: 30, scope: !164)
!166 = !DILocation(line: 83, column: 17, scope: !161)
!167 = !DILocation(line: 85, column: 41, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !13, line: 84, column: 17)
!169 = !DILocation(line: 85, column: 34, scope: !168)
!170 = !DILocation(line: 85, column: 21, scope: !168)
!171 = !DILocation(line: 86, column: 17, scope: !168)
!172 = !DILocation(line: 83, column: 37, scope: !164)
!173 = !DILocation(line: 83, column: 17, scope: !164)
!174 = distinct !{!174, !166, !175, !39}
!175 = !DILocation(line: 86, column: 17, scope: !161)
!176 = !DILocation(line: 87, column: 13, scope: !157)
!177 = !DILocation(line: 90, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !150, file: !13, line: 89, column: 13)
!179 = !DILocation(line: 93, column: 5, scope: !145)
!180 = !DILocation(line: 73, column: 24, scope: !140)
!181 = !DILocation(line: 73, column: 5, scope: !140)
!182 = distinct !{!182, !142, !183, !39}
!183 = !DILocation(line: 93, column: 5, scope: !137)
!184 = !DILocation(line: 94, column: 1, scope: !113)
!185 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 97, type: !14, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!186 = !DILocalVariable(name: "h", scope: !185, file: !13, line: 99, type: !3)
!187 = !DILocation(line: 99, column: 9, scope: !185)
!188 = !DILocalVariable(name: "j", scope: !185, file: !13, line: 99, type: !3)
!189 = !DILocation(line: 99, column: 11, scope: !185)
!190 = !DILocalVariable(name: "data", scope: !185, file: !13, line: 100, type: !3)
!191 = !DILocation(line: 100, column: 9, scope: !185)
!192 = !DILocation(line: 102, column: 10, scope: !185)
!193 = !DILocation(line: 103, column: 11, scope: !194)
!194 = distinct !DILexicalBlock(scope: !185, file: !13, line: 103, column: 5)
!195 = !DILocation(line: 103, column: 9, scope: !194)
!196 = !DILocation(line: 103, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !13, line: 103, column: 5)
!198 = !DILocation(line: 103, column: 18, scope: !197)
!199 = !DILocation(line: 103, column: 5, scope: !194)
!200 = !DILocation(line: 107, column: 14, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !13, line: 104, column: 5)
!202 = !DILocation(line: 108, column: 5, scope: !201)
!203 = !DILocation(line: 103, column: 24, scope: !197)
!204 = !DILocation(line: 103, column: 5, scope: !197)
!205 = distinct !{!205, !199, !206, !39}
!206 = !DILocation(line: 108, column: 5, scope: !194)
!207 = !DILocation(line: 109, column: 11, scope: !208)
!208 = distinct !DILexicalBlock(scope: !185, file: !13, line: 109, column: 5)
!209 = !DILocation(line: 109, column: 9, scope: !208)
!210 = !DILocation(line: 109, column: 16, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !13, line: 109, column: 5)
!212 = !DILocation(line: 109, column: 18, scope: !211)
!213 = !DILocation(line: 109, column: 5, scope: !208)
!214 = !DILocalVariable(name: "i", scope: !215, file: !13, line: 112, type: !3)
!215 = distinct !DILexicalBlock(scope: !216, file: !13, line: 111, column: 9)
!216 = distinct !DILexicalBlock(scope: !211, file: !13, line: 110, column: 5)
!217 = !DILocation(line: 112, column: 17, scope: !215)
!218 = !DILocalVariable(name: "buffer", scope: !215, file: !13, line: 113, type: !52)
!219 = !DILocation(line: 113, column: 17, scope: !215)
!220 = !DILocation(line: 116, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !215, file: !13, line: 116, column: 17)
!222 = !DILocation(line: 116, column: 22, scope: !221)
!223 = !DILocation(line: 116, column: 17, scope: !215)
!224 = !DILocation(line: 118, column: 24, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !13, line: 117, column: 13)
!226 = !DILocation(line: 118, column: 17, scope: !225)
!227 = !DILocation(line: 118, column: 30, scope: !225)
!228 = !DILocation(line: 120, column: 23, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !13, line: 120, column: 17)
!230 = !DILocation(line: 120, column: 21, scope: !229)
!231 = !DILocation(line: 120, column: 28, scope: !232)
!232 = distinct !DILexicalBlock(scope: !229, file: !13, line: 120, column: 17)
!233 = !DILocation(line: 120, column: 30, scope: !232)
!234 = !DILocation(line: 120, column: 17, scope: !229)
!235 = !DILocation(line: 122, column: 41, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !13, line: 121, column: 17)
!237 = !DILocation(line: 122, column: 34, scope: !236)
!238 = !DILocation(line: 122, column: 21, scope: !236)
!239 = !DILocation(line: 123, column: 17, scope: !236)
!240 = !DILocation(line: 120, column: 37, scope: !232)
!241 = !DILocation(line: 120, column: 17, scope: !232)
!242 = distinct !{!242, !234, !243, !39}
!243 = !DILocation(line: 123, column: 17, scope: !229)
!244 = !DILocation(line: 124, column: 13, scope: !225)
!245 = !DILocation(line: 127, column: 17, scope: !246)
!246 = distinct !DILexicalBlock(scope: !221, file: !13, line: 126, column: 13)
!247 = !DILocation(line: 130, column: 5, scope: !216)
!248 = !DILocation(line: 109, column: 24, scope: !211)
!249 = !DILocation(line: 109, column: 5, scope: !211)
!250 = distinct !{!250, !213, !251, !39}
!251 = !DILocation(line: 130, column: 5, scope: !208)
!252 = !DILocation(line: 131, column: 1, scope: !185)
