; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_badData = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodG2BData = internal global i32 0, align 4, !dbg !10
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodB2GData = internal global i32 0, align 4, !dbg !13
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 -1, i32* %data, align 4, !dbg !28
  %call = call i32 @rand(), !dbg !29
  %and = and i32 %call, 1, !dbg !29
  %tobool = icmp ne i32 %and, 0, !dbg !29
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !29

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !29
  %shl = shl i32 %call1, 30, !dbg !29
  %call2 = call i32 @rand(), !dbg !29
  %shl3 = shl i32 %call2, 15, !dbg !29
  %xor = xor i32 %shl, %shl3, !dbg !29
  %call4 = call i32 @rand(), !dbg !29
  %xor5 = xor i32 %xor, %call4, !dbg !29
  br label %cond.end, !dbg !29

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !29
  %shl7 = shl i32 %call6, 30, !dbg !29
  %call8 = call i32 @rand(), !dbg !29
  %shl9 = shl i32 %call8, 15, !dbg !29
  %xor10 = xor i32 %shl7, %shl9, !dbg !29
  %call11 = call i32 @rand(), !dbg !29
  %xor12 = xor i32 %xor10, %call11, !dbg !29
  %sub = sub i32 0, %xor12, !dbg !29
  %sub13 = sub i32 %sub, 1, !dbg !29
  br label %cond.end, !dbg !29

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !29
  store i32 %cond, i32* %data, align 4, !dbg !30
  %0 = load i32, i32* %data, align 4, !dbg !31
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_badData, align 4, !dbg !32
  call void @badSink(), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_good() #0 !dbg !35 {
entry:
  call void @goodG2B(), !dbg !36
  call void @goodB2G(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* noundef null), !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 noundef %conv), !dbg !51
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_good(), !dbg !53
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_bad(), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !59 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_badData, align 4, !dbg !62
  store i32 %0, i32* %data, align 4, !dbg !61
  call void @llvm.dbg.declare(metadata i32* %i, metadata !63, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !68
  %1 = bitcast i8* %call to i32*, !dbg !69
  store i32* %1, i32** %buffer, align 8, !dbg !67
  %2 = load i32*, i32** %buffer, align 8, !dbg !70
  %cmp = icmp eq i32* %2, null, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !79
  %cmp1 = icmp slt i32 %3, 10, !dbg !81
  br i1 %cmp1, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !83
  %5 = load i32, i32* %i, align 4, !dbg !85
  %idxprom = sext i32 %5 to i64, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !88
  %inc = add nsw i32 %6, 1, !dbg !88
  store i32 %inc, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !93
  %cmp2 = icmp sge i32 %7, 0, !dbg !95
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !96

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !97
  %9 = load i32, i32* %data, align 4, !dbg !99
  %idxprom4 = sext i32 %9 to i64, !dbg !97
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !97
  store i32 1, i32* %arrayidx5, align 4, !dbg !100
  store i32 0, i32* %i, align 4, !dbg !101
  br label %for.cond6, !dbg !103

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !104
  %cmp7 = icmp slt i32 %10, 10, !dbg !106
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !107

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !108
  %12 = load i32, i32* %i, align 4, !dbg !110
  %idxprom9 = sext i32 %12 to i64, !dbg !108
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !108
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !108
  call void @printIntLine(i32 noundef %13), !dbg !111
  br label %for.inc11, !dbg !112

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !113
  %inc12 = add nsw i32 %14, 1, !dbg !113
  store i32 %inc12, i32* %i, align 4, !dbg !113
  br label %for.cond6, !dbg !114, !llvm.loop !115

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !117

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !120
  %16 = bitcast i32* %15 to i8*, !dbg !120
  call void @free(i8* noundef %16), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

declare void @printIntLine(i32 noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !123 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 -1, i32* %data, align 4, !dbg !126
  store i32 7, i32* %data, align 4, !dbg !127
  %0 = load i32, i32* %data, align 4, !dbg !128
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodG2BData, align 4, !dbg !129
  call void @goodG2BSink(), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !132 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !133, metadata !DIExpression()), !dbg !134
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodG2BData, align 4, !dbg !135
  store i32 %0, i32* %data, align 4, !dbg !134
  call void @llvm.dbg.declare(metadata i32* %i, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !139, metadata !DIExpression()), !dbg !140
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !141
  %1 = bitcast i8* %call to i32*, !dbg !142
  store i32* %1, i32** %buffer, align 8, !dbg !140
  %2 = load i32*, i32** %buffer, align 8, !dbg !143
  %cmp = icmp eq i32* %2, null, !dbg !145
  br i1 %cmp, label %if.then, label %if.end, !dbg !146

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !147
  unreachable, !dbg !147

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !152
  %cmp1 = icmp slt i32 %3, 10, !dbg !154
  br i1 %cmp1, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !156
  %5 = load i32, i32* %i, align 4, !dbg !158
  %idxprom = sext i32 %5 to i64, !dbg !156
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !156
  store i32 0, i32* %arrayidx, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !161
  %inc = add nsw i32 %6, 1, !dbg !161
  store i32 %inc, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !165
  %cmp2 = icmp sge i32 %7, 0, !dbg !167
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !168

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !169
  %9 = load i32, i32* %data, align 4, !dbg !171
  %idxprom4 = sext i32 %9 to i64, !dbg !169
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !169
  store i32 1, i32* %arrayidx5, align 4, !dbg !172
  store i32 0, i32* %i, align 4, !dbg !173
  br label %for.cond6, !dbg !175

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !176
  %cmp7 = icmp slt i32 %10, 10, !dbg !178
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !179

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !180
  %12 = load i32, i32* %i, align 4, !dbg !182
  %idxprom9 = sext i32 %12 to i64, !dbg !180
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !180
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !180
  call void @printIntLine(i32 noundef %13), !dbg !183
  br label %for.inc11, !dbg !184

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !185
  %inc12 = add nsw i32 %14, 1, !dbg !185
  store i32 %inc12, i32* %i, align 4, !dbg !185
  br label %for.cond6, !dbg !186, !llvm.loop !187

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !189

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !190
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !192
  %16 = bitcast i32* %15 to i8*, !dbg !192
  call void @free(i8* noundef %16), !dbg !193
  ret void, !dbg !194
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !195 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !196, metadata !DIExpression()), !dbg !197
  store i32 -1, i32* %data, align 4, !dbg !198
  %call = call i32 @rand(), !dbg !199
  %and = and i32 %call, 1, !dbg !199
  %tobool = icmp ne i32 %and, 0, !dbg !199
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !199

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !199
  %shl = shl i32 %call1, 30, !dbg !199
  %call2 = call i32 @rand(), !dbg !199
  %shl3 = shl i32 %call2, 15, !dbg !199
  %xor = xor i32 %shl, %shl3, !dbg !199
  %call4 = call i32 @rand(), !dbg !199
  %xor5 = xor i32 %xor, %call4, !dbg !199
  br label %cond.end, !dbg !199

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !199
  %shl7 = shl i32 %call6, 30, !dbg !199
  %call8 = call i32 @rand(), !dbg !199
  %shl9 = shl i32 %call8, 15, !dbg !199
  %xor10 = xor i32 %shl7, %shl9, !dbg !199
  %call11 = call i32 @rand(), !dbg !199
  %xor12 = xor i32 %xor10, %call11, !dbg !199
  %sub = sub i32 0, %xor12, !dbg !199
  %sub13 = sub i32 %sub, 1, !dbg !199
  br label %cond.end, !dbg !199

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !199
  store i32 %cond, i32* %data, align 4, !dbg !200
  %0 = load i32, i32* %data, align 4, !dbg !201
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodB2GData, align 4, !dbg !202
  call void @goodB2GSink(), !dbg !203
  ret void, !dbg !204
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2GSink() #0 !dbg !205 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !206, metadata !DIExpression()), !dbg !207
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodB2GData, align 4, !dbg !208
  store i32 %0, i32* %data, align 4, !dbg !207
  call void @llvm.dbg.declare(metadata i32* %i, metadata !209, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !212, metadata !DIExpression()), !dbg !213
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !214
  %1 = bitcast i8* %call to i32*, !dbg !215
  store i32* %1, i32** %buffer, align 8, !dbg !213
  %2 = load i32*, i32** %buffer, align 8, !dbg !216
  %cmp = icmp eq i32* %2, null, !dbg !218
  br i1 %cmp, label %if.then, label %if.end, !dbg !219

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !220
  unreachable, !dbg !220

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !222
  br label %for.cond, !dbg !224

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !225
  %cmp1 = icmp slt i32 %3, 10, !dbg !227
  br i1 %cmp1, label %for.body, label %for.end, !dbg !228

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !229
  %5 = load i32, i32* %i, align 4, !dbg !231
  %idxprom = sext i32 %5 to i64, !dbg !229
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !229
  store i32 0, i32* %arrayidx, align 4, !dbg !232
  br label %for.inc, !dbg !233

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !234
  %inc = add nsw i32 %6, 1, !dbg !234
  store i32 %inc, i32* %i, align 4, !dbg !234
  br label %for.cond, !dbg !235, !llvm.loop !236

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !238
  %cmp2 = icmp sge i32 %7, 0, !dbg !240
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !241

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !242
  %cmp3 = icmp slt i32 %8, 10, !dbg !243
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !244

if.then4:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !245
  %10 = load i32, i32* %data, align 4, !dbg !247
  %idxprom5 = sext i32 %10 to i64, !dbg !245
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !245
  store i32 1, i32* %arrayidx6, align 4, !dbg !248
  store i32 0, i32* %i, align 4, !dbg !249
  br label %for.cond7, !dbg !251

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !252
  %cmp8 = icmp slt i32 %11, 10, !dbg !254
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !255

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !256
  %13 = load i32, i32* %i, align 4, !dbg !258
  %idxprom10 = sext i32 %13 to i64, !dbg !256
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !256
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !256
  call void @printIntLine(i32 noundef %14), !dbg !259
  br label %for.inc12, !dbg !260

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !261
  %inc13 = add nsw i32 %15, 1, !dbg !261
  store i32 %inc13, i32* %i, align 4, !dbg !261
  br label %for.cond7, !dbg !262, !llvm.loop !263

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !265

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !266
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !268
  %17 = bitcast i32* %16 to i8*, !dbg !268
  call void @free(i8* noundef %17), !dbg !269
  ret void, !dbg !270
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_badData", scope: !2, file: !12, line: 20, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !6, !7, !8}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !{!0, !10, !13}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodG2BData", scope: !2, file: !12, line: 21, type: !5, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_goodB2GData", scope: !2, file: !12, line: 22, type: !5, isLocal: true, isDefinition: true)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Homebrew clang version 14.0.6"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_bad", scope: !12, file: !12, line: 57, type: !23, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !{}
!26 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 59, type: !5)
!27 = !DILocation(line: 59, column: 9, scope: !22)
!28 = !DILocation(line: 61, column: 10, scope: !22)
!29 = !DILocation(line: 63, column: 12, scope: !22)
!30 = !DILocation(line: 63, column: 10, scope: !22)
!31 = !DILocation(line: 64, column: 67, scope: !22)
!32 = !DILocation(line: 64, column: 65, scope: !22)
!33 = !DILocation(line: 65, column: 5, scope: !22)
!34 = !DILocation(line: 66, column: 1, scope: !22)
!35 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_45_good", scope: !12, file: !12, line: 158, type: !23, scopeLine: 159, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!36 = !DILocation(line: 160, column: 5, scope: !35)
!37 = !DILocation(line: 161, column: 5, scope: !35)
!38 = !DILocation(line: 162, column: 1, scope: !35)
!39 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 172, type: !40, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!40 = !DISubroutineType(types: !41)
!41 = !{!5, !5, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !12, line: 172, type: !5)
!46 = !DILocation(line: 172, column: 14, scope: !39)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !12, line: 172, type: !42)
!48 = !DILocation(line: 172, column: 27, scope: !39)
!49 = !DILocation(line: 175, column: 22, scope: !39)
!50 = !DILocation(line: 175, column: 12, scope: !39)
!51 = !DILocation(line: 175, column: 5, scope: !39)
!52 = !DILocation(line: 177, column: 5, scope: !39)
!53 = !DILocation(line: 178, column: 5, scope: !39)
!54 = !DILocation(line: 179, column: 5, scope: !39)
!55 = !DILocation(line: 182, column: 5, scope: !39)
!56 = !DILocation(line: 183, column: 5, scope: !39)
!57 = !DILocation(line: 184, column: 5, scope: !39)
!58 = !DILocation(line: 186, column: 5, scope: !39)
!59 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!60 = !DILocalVariable(name: "data", scope: !59, file: !12, line: 28, type: !5)
!61 = !DILocation(line: 28, column: 9, scope: !59)
!62 = !DILocation(line: 28, column: 16, scope: !59)
!63 = !DILocalVariable(name: "i", scope: !64, file: !12, line: 30, type: !5)
!64 = distinct !DILexicalBlock(scope: !59, file: !12, line: 29, column: 5)
!65 = !DILocation(line: 30, column: 13, scope: !64)
!66 = !DILocalVariable(name: "buffer", scope: !64, file: !12, line: 31, type: !7)
!67 = !DILocation(line: 31, column: 15, scope: !64)
!68 = !DILocation(line: 31, column: 31, scope: !64)
!69 = !DILocation(line: 31, column: 24, scope: !64)
!70 = !DILocation(line: 32, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !64, file: !12, line: 32, column: 13)
!72 = !DILocation(line: 32, column: 20, scope: !71)
!73 = !DILocation(line: 32, column: 13, scope: !64)
!74 = !DILocation(line: 32, column: 30, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !12, line: 32, column: 29)
!76 = !DILocation(line: 34, column: 16, scope: !77)
!77 = distinct !DILexicalBlock(scope: !64, file: !12, line: 34, column: 9)
!78 = !DILocation(line: 34, column: 14, scope: !77)
!79 = !DILocation(line: 34, column: 21, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !12, line: 34, column: 9)
!81 = !DILocation(line: 34, column: 23, scope: !80)
!82 = !DILocation(line: 34, column: 9, scope: !77)
!83 = !DILocation(line: 36, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !12, line: 35, column: 9)
!85 = !DILocation(line: 36, column: 20, scope: !84)
!86 = !DILocation(line: 36, column: 23, scope: !84)
!87 = !DILocation(line: 37, column: 9, scope: !84)
!88 = !DILocation(line: 34, column: 30, scope: !80)
!89 = !DILocation(line: 34, column: 9, scope: !80)
!90 = distinct !{!90, !82, !91, !92}
!91 = !DILocation(line: 37, column: 9, scope: !77)
!92 = !{!"llvm.loop.mustprogress"}
!93 = !DILocation(line: 40, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !64, file: !12, line: 40, column: 13)
!95 = !DILocation(line: 40, column: 18, scope: !94)
!96 = !DILocation(line: 40, column: 13, scope: !64)
!97 = !DILocation(line: 42, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !12, line: 41, column: 9)
!99 = !DILocation(line: 42, column: 20, scope: !98)
!100 = !DILocation(line: 42, column: 26, scope: !98)
!101 = !DILocation(line: 44, column: 19, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 44, column: 13)
!103 = !DILocation(line: 44, column: 17, scope: !102)
!104 = !DILocation(line: 44, column: 24, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !12, line: 44, column: 13)
!106 = !DILocation(line: 44, column: 26, scope: !105)
!107 = !DILocation(line: 44, column: 13, scope: !102)
!108 = !DILocation(line: 46, column: 30, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !12, line: 45, column: 13)
!110 = !DILocation(line: 46, column: 37, scope: !109)
!111 = !DILocation(line: 46, column: 17, scope: !109)
!112 = !DILocation(line: 47, column: 13, scope: !109)
!113 = !DILocation(line: 44, column: 33, scope: !105)
!114 = !DILocation(line: 44, column: 13, scope: !105)
!115 = distinct !{!115, !107, !116, !92}
!116 = !DILocation(line: 47, column: 13, scope: !102)
!117 = !DILocation(line: 48, column: 9, scope: !98)
!118 = !DILocation(line: 51, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !94, file: !12, line: 50, column: 9)
!120 = !DILocation(line: 53, column: 14, scope: !64)
!121 = !DILocation(line: 53, column: 9, scope: !64)
!122 = !DILocation(line: 55, column: 1, scope: !59)
!123 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 104, type: !23, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!124 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 106, type: !5)
!125 = !DILocation(line: 106, column: 9, scope: !123)
!126 = !DILocation(line: 108, column: 10, scope: !123)
!127 = !DILocation(line: 111, column: 10, scope: !123)
!128 = !DILocation(line: 112, column: 71, scope: !123)
!129 = !DILocation(line: 112, column: 69, scope: !123)
!130 = !DILocation(line: 113, column: 5, scope: !123)
!131 = !DILocation(line: 114, column: 1, scope: !123)
!132 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 73, type: !23, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!133 = !DILocalVariable(name: "data", scope: !132, file: !12, line: 75, type: !5)
!134 = !DILocation(line: 75, column: 9, scope: !132)
!135 = !DILocation(line: 75, column: 16, scope: !132)
!136 = !DILocalVariable(name: "i", scope: !137, file: !12, line: 77, type: !5)
!137 = distinct !DILexicalBlock(scope: !132, file: !12, line: 76, column: 5)
!138 = !DILocation(line: 77, column: 13, scope: !137)
!139 = !DILocalVariable(name: "buffer", scope: !137, file: !12, line: 78, type: !7)
!140 = !DILocation(line: 78, column: 15, scope: !137)
!141 = !DILocation(line: 78, column: 31, scope: !137)
!142 = !DILocation(line: 78, column: 24, scope: !137)
!143 = !DILocation(line: 79, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !12, line: 79, column: 13)
!145 = !DILocation(line: 79, column: 20, scope: !144)
!146 = !DILocation(line: 79, column: 13, scope: !137)
!147 = !DILocation(line: 79, column: 30, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !12, line: 79, column: 29)
!149 = !DILocation(line: 81, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !137, file: !12, line: 81, column: 9)
!151 = !DILocation(line: 81, column: 14, scope: !150)
!152 = !DILocation(line: 81, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !12, line: 81, column: 9)
!154 = !DILocation(line: 81, column: 23, scope: !153)
!155 = !DILocation(line: 81, column: 9, scope: !150)
!156 = !DILocation(line: 83, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !12, line: 82, column: 9)
!158 = !DILocation(line: 83, column: 20, scope: !157)
!159 = !DILocation(line: 83, column: 23, scope: !157)
!160 = !DILocation(line: 84, column: 9, scope: !157)
!161 = !DILocation(line: 81, column: 30, scope: !153)
!162 = !DILocation(line: 81, column: 9, scope: !153)
!163 = distinct !{!163, !155, !164, !92}
!164 = !DILocation(line: 84, column: 9, scope: !150)
!165 = !DILocation(line: 87, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !137, file: !12, line: 87, column: 13)
!167 = !DILocation(line: 87, column: 18, scope: !166)
!168 = !DILocation(line: 87, column: 13, scope: !137)
!169 = !DILocation(line: 89, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !12, line: 88, column: 9)
!171 = !DILocation(line: 89, column: 20, scope: !170)
!172 = !DILocation(line: 89, column: 26, scope: !170)
!173 = !DILocation(line: 91, column: 19, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !12, line: 91, column: 13)
!175 = !DILocation(line: 91, column: 17, scope: !174)
!176 = !DILocation(line: 91, column: 24, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !12, line: 91, column: 13)
!178 = !DILocation(line: 91, column: 26, scope: !177)
!179 = !DILocation(line: 91, column: 13, scope: !174)
!180 = !DILocation(line: 93, column: 30, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !12, line: 92, column: 13)
!182 = !DILocation(line: 93, column: 37, scope: !181)
!183 = !DILocation(line: 93, column: 17, scope: !181)
!184 = !DILocation(line: 94, column: 13, scope: !181)
!185 = !DILocation(line: 91, column: 33, scope: !177)
!186 = !DILocation(line: 91, column: 13, scope: !177)
!187 = distinct !{!187, !179, !188, !92}
!188 = !DILocation(line: 94, column: 13, scope: !174)
!189 = !DILocation(line: 95, column: 9, scope: !170)
!190 = !DILocation(line: 98, column: 13, scope: !191)
!191 = distinct !DILexicalBlock(scope: !166, file: !12, line: 97, column: 9)
!192 = !DILocation(line: 100, column: 14, scope: !137)
!193 = !DILocation(line: 100, column: 9, scope: !137)
!194 = !DILocation(line: 102, column: 1, scope: !132)
!195 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 147, type: !23, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!196 = !DILocalVariable(name: "data", scope: !195, file: !12, line: 149, type: !5)
!197 = !DILocation(line: 149, column: 9, scope: !195)
!198 = !DILocation(line: 151, column: 10, scope: !195)
!199 = !DILocation(line: 153, column: 12, scope: !195)
!200 = !DILocation(line: 153, column: 10, scope: !195)
!201 = !DILocation(line: 154, column: 71, scope: !195)
!202 = !DILocation(line: 154, column: 69, scope: !195)
!203 = !DILocation(line: 155, column: 5, scope: !195)
!204 = !DILocation(line: 156, column: 1, scope: !195)
!205 = distinct !DISubprogram(name: "goodB2GSink", scope: !12, file: !12, line: 117, type: !23, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!206 = !DILocalVariable(name: "data", scope: !205, file: !12, line: 119, type: !5)
!207 = !DILocation(line: 119, column: 9, scope: !205)
!208 = !DILocation(line: 119, column: 16, scope: !205)
!209 = !DILocalVariable(name: "i", scope: !210, file: !12, line: 121, type: !5)
!210 = distinct !DILexicalBlock(scope: !205, file: !12, line: 120, column: 5)
!211 = !DILocation(line: 121, column: 13, scope: !210)
!212 = !DILocalVariable(name: "buffer", scope: !210, file: !12, line: 122, type: !7)
!213 = !DILocation(line: 122, column: 15, scope: !210)
!214 = !DILocation(line: 122, column: 31, scope: !210)
!215 = !DILocation(line: 122, column: 24, scope: !210)
!216 = !DILocation(line: 123, column: 13, scope: !217)
!217 = distinct !DILexicalBlock(scope: !210, file: !12, line: 123, column: 13)
!218 = !DILocation(line: 123, column: 20, scope: !217)
!219 = !DILocation(line: 123, column: 13, scope: !210)
!220 = !DILocation(line: 123, column: 30, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !12, line: 123, column: 29)
!222 = !DILocation(line: 125, column: 16, scope: !223)
!223 = distinct !DILexicalBlock(scope: !210, file: !12, line: 125, column: 9)
!224 = !DILocation(line: 125, column: 14, scope: !223)
!225 = !DILocation(line: 125, column: 21, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !12, line: 125, column: 9)
!227 = !DILocation(line: 125, column: 23, scope: !226)
!228 = !DILocation(line: 125, column: 9, scope: !223)
!229 = !DILocation(line: 127, column: 13, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !12, line: 126, column: 9)
!231 = !DILocation(line: 127, column: 20, scope: !230)
!232 = !DILocation(line: 127, column: 23, scope: !230)
!233 = !DILocation(line: 128, column: 9, scope: !230)
!234 = !DILocation(line: 125, column: 30, scope: !226)
!235 = !DILocation(line: 125, column: 9, scope: !226)
!236 = distinct !{!236, !228, !237, !92}
!237 = !DILocation(line: 128, column: 9, scope: !223)
!238 = !DILocation(line: 130, column: 13, scope: !239)
!239 = distinct !DILexicalBlock(scope: !210, file: !12, line: 130, column: 13)
!240 = !DILocation(line: 130, column: 18, scope: !239)
!241 = !DILocation(line: 130, column: 23, scope: !239)
!242 = !DILocation(line: 130, column: 26, scope: !239)
!243 = !DILocation(line: 130, column: 31, scope: !239)
!244 = !DILocation(line: 130, column: 13, scope: !210)
!245 = !DILocation(line: 132, column: 13, scope: !246)
!246 = distinct !DILexicalBlock(scope: !239, file: !12, line: 131, column: 9)
!247 = !DILocation(line: 132, column: 20, scope: !246)
!248 = !DILocation(line: 132, column: 26, scope: !246)
!249 = !DILocation(line: 134, column: 19, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !12, line: 134, column: 13)
!251 = !DILocation(line: 134, column: 17, scope: !250)
!252 = !DILocation(line: 134, column: 24, scope: !253)
!253 = distinct !DILexicalBlock(scope: !250, file: !12, line: 134, column: 13)
!254 = !DILocation(line: 134, column: 26, scope: !253)
!255 = !DILocation(line: 134, column: 13, scope: !250)
!256 = !DILocation(line: 136, column: 30, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !12, line: 135, column: 13)
!258 = !DILocation(line: 136, column: 37, scope: !257)
!259 = !DILocation(line: 136, column: 17, scope: !257)
!260 = !DILocation(line: 137, column: 13, scope: !257)
!261 = !DILocation(line: 134, column: 33, scope: !253)
!262 = !DILocation(line: 134, column: 13, scope: !253)
!263 = distinct !{!263, !255, !264, !92}
!264 = !DILocation(line: 137, column: 13, scope: !250)
!265 = !DILocation(line: 138, column: 9, scope: !246)
!266 = !DILocation(line: 141, column: 13, scope: !267)
!267 = distinct !DILexicalBlock(scope: !239, file: !12, line: 140, column: 9)
!268 = !DILocation(line: 143, column: 14, scope: !210)
!269 = !DILocation(line: 143, column: 9, scope: !210)
!270 = !DILocation(line: 145, column: 1, scope: !205)
