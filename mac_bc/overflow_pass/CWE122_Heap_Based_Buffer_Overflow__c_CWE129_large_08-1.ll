; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %call = call i32 @staticReturnsTrue(), !dbg !22
  %tobool = icmp ne i32 %call, 0, !dbg !22
  br i1 %tobool, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !25
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !28
  %tobool2 = icmp ne i32 %call1, 0, !dbg !28
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !30

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !35, metadata !DIExpression()), !dbg !36
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !37
  %0 = bitcast i8* %call4 to i32*, !dbg !38
  store i32* %0, i32** %buffer, align 8, !dbg !36
  %1 = load i32*, i32** %buffer, align 8, !dbg !39
  %cmp = icmp eq i32* %1, null, !dbg !41
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !42

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !43
  unreachable, !dbg !43

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !48
  %cmp7 = icmp slt i32 %2, 10, !dbg !50
  br i1 %cmp7, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !52
  %4 = load i32, i32* %i, align 4, !dbg !54
  %idxprom = sext i32 %4 to i64, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !52
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !57
  %inc = add nsw i32 %5, 1, !dbg !57
  store i32 %inc, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !62
  %cmp8 = icmp sge i32 %6, 0, !dbg !64
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !65

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !66
  %8 = load i32, i32* %data, align 4, !dbg !68
  %idxprom10 = sext i32 %8 to i64, !dbg !66
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !66
  store i32 1, i32* %arrayidx11, align 4, !dbg !69
  store i32 0, i32* %i, align 4, !dbg !70
  br label %for.cond12, !dbg !72

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !73
  %cmp13 = icmp slt i32 %9, 10, !dbg !75
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !76

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !77
  %11 = load i32, i32* %i, align 4, !dbg !79
  %idxprom15 = sext i32 %11 to i64, !dbg !77
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !77
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !77
  call void @printIntLine(i32 noundef %12), !dbg !80
  br label %for.inc17, !dbg !81

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !82
  %inc18 = add nsw i32 %13, 1, !dbg !82
  store i32 %inc18, i32* %i, align 4, !dbg !82
  br label %for.cond12, !dbg !83, !llvm.loop !84

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !86

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !87
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !89
  %15 = bitcast i32* %14 to i8*, !dbg !89
  call void @free(i8* noundef %15), !dbg !90
  br label %if.end21, !dbg !91

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !92
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare void @printIntLine(i32 noundef) #4

declare void @printLine(i8* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_good() #0 !dbg !93 {
entry:
  call void @goodB2G1(), !dbg !94
  call void @goodB2G2(), !dbg !95
  call void @goodG2B1(), !dbg !96
  call void @goodG2B2(), !dbg !97
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
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_good(), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_bad(), !dbg !116
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !119 {
entry:
  ret i32 1, !dbg !122
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !123 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 -1, i32* %data, align 4, !dbg !126
  %call = call i32 @staticReturnsTrue(), !dbg !127
  %tobool = icmp ne i32 %call, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !130
  br label %if.end, !dbg !132

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !133
  %tobool2 = icmp ne i32 %call1, 0, !dbg !133
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !135

if.then3:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !136
  br label %if.end23, !dbg !138

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !139, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !143, metadata !DIExpression()), !dbg !144
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !145
  %0 = bitcast i8* %call4 to i32*, !dbg !146
  store i32* %0, i32** %buffer, align 8, !dbg !144
  %1 = load i32*, i32** %buffer, align 8, !dbg !147
  %cmp = icmp eq i32* %1, null, !dbg !149
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !150

if.then5:                                         ; preds = %if.else
  call void @exit(i32 noundef -1) #6, !dbg !151
  unreachable, !dbg !151

if.end6:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !156
  %cmp7 = icmp slt i32 %2, 10, !dbg !158
  br i1 %cmp7, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !160
  %4 = load i32, i32* %i, align 4, !dbg !162
  %idxprom = sext i32 %4 to i64, !dbg !160
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !160
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !165
  %inc = add nsw i32 %5, 1, !dbg !165
  store i32 %inc, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !169
  %cmp8 = icmp sge i32 %6, 0, !dbg !171
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !172

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !173
  %cmp9 = icmp slt i32 %7, 10, !dbg !174
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !175

if.then10:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !176
  %9 = load i32, i32* %data, align 4, !dbg !178
  %idxprom11 = sext i32 %9 to i64, !dbg !176
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %idxprom11, !dbg !176
  store i32 1, i32* %arrayidx12, align 4, !dbg !179
  store i32 0, i32* %i, align 4, !dbg !180
  br label %for.cond13, !dbg !182

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %10 = load i32, i32* %i, align 4, !dbg !183
  %cmp14 = icmp slt i32 %10, 10, !dbg !185
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !186

for.body15:                                       ; preds = %for.cond13
  %11 = load i32*, i32** %buffer, align 8, !dbg !187
  %12 = load i32, i32* %i, align 4, !dbg !189
  %idxprom16 = sext i32 %12 to i64, !dbg !187
  %arrayidx17 = getelementptr inbounds i32, i32* %11, i64 %idxprom16, !dbg !187
  %13 = load i32, i32* %arrayidx17, align 4, !dbg !187
  call void @printIntLine(i32 noundef %13), !dbg !190
  br label %for.inc18, !dbg !191

for.inc18:                                        ; preds = %for.body15
  %14 = load i32, i32* %i, align 4, !dbg !192
  %inc19 = add nsw i32 %14, 1, !dbg !192
  store i32 %inc19, i32* %i, align 4, !dbg !192
  br label %for.cond13, !dbg !193, !llvm.loop !194

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !196

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !197
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %15 = load i32*, i32** %buffer, align 8, !dbg !199
  %16 = bitcast i32* %15 to i8*, !dbg !199
  call void @free(i8* noundef %16), !dbg !200
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then3
  ret void, !dbg !201
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !202 {
entry:
  ret i32 0, !dbg !203
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !204 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !205, metadata !DIExpression()), !dbg !206
  store i32 -1, i32* %data, align 4, !dbg !207
  %call = call i32 @staticReturnsTrue(), !dbg !208
  %tobool = icmp ne i32 %call, 0, !dbg !208
  br i1 %tobool, label %if.then, label %if.end, !dbg !210

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !211
  br label %if.end, !dbg !213

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !214
  %tobool2 = icmp ne i32 %call1, 0, !dbg !214
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !216

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !217, metadata !DIExpression()), !dbg !220
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !221, metadata !DIExpression()), !dbg !222
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !223
  %0 = bitcast i8* %call4 to i32*, !dbg !224
  store i32* %0, i32** %buffer, align 8, !dbg !222
  %1 = load i32*, i32** %buffer, align 8, !dbg !225
  %cmp = icmp eq i32* %1, null, !dbg !227
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !228

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !229
  unreachable, !dbg !229

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !231
  br label %for.cond, !dbg !233

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !234
  %cmp7 = icmp slt i32 %2, 10, !dbg !236
  br i1 %cmp7, label %for.body, label %for.end, !dbg !237

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !238
  %4 = load i32, i32* %i, align 4, !dbg !240
  %idxprom = sext i32 %4 to i64, !dbg !238
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !238
  store i32 0, i32* %arrayidx, align 4, !dbg !241
  br label %for.inc, !dbg !242

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !243
  %inc = add nsw i32 %5, 1, !dbg !243
  store i32 %inc, i32* %i, align 4, !dbg !243
  br label %for.cond, !dbg !244, !llvm.loop !245

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !247
  %cmp8 = icmp sge i32 %6, 0, !dbg !249
  br i1 %cmp8, label %land.lhs.true, label %if.else, !dbg !250

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !251
  %cmp9 = icmp slt i32 %7, 10, !dbg !252
  br i1 %cmp9, label %if.then10, label %if.else, !dbg !253

if.then10:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !254
  %9 = load i32, i32* %data, align 4, !dbg !256
  %idxprom11 = sext i32 %9 to i64, !dbg !254
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %idxprom11, !dbg !254
  store i32 1, i32* %arrayidx12, align 4, !dbg !257
  store i32 0, i32* %i, align 4, !dbg !258
  br label %for.cond13, !dbg !260

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %10 = load i32, i32* %i, align 4, !dbg !261
  %cmp14 = icmp slt i32 %10, 10, !dbg !263
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !264

for.body15:                                       ; preds = %for.cond13
  %11 = load i32*, i32** %buffer, align 8, !dbg !265
  %12 = load i32, i32* %i, align 4, !dbg !267
  %idxprom16 = sext i32 %12 to i64, !dbg !265
  %arrayidx17 = getelementptr inbounds i32, i32* %11, i64 %idxprom16, !dbg !265
  %13 = load i32, i32* %arrayidx17, align 4, !dbg !265
  call void @printIntLine(i32 noundef %13), !dbg !268
  br label %for.inc18, !dbg !269

for.inc18:                                        ; preds = %for.body15
  %14 = load i32, i32* %i, align 4, !dbg !270
  %inc19 = add nsw i32 %14, 1, !dbg !270
  store i32 %inc19, i32* %i, align 4, !dbg !270
  br label %for.cond13, !dbg !271, !llvm.loop !272

for.end20:                                        ; preds = %for.cond13
  br label %if.end21, !dbg !274

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !275
  br label %if.end21

if.end21:                                         ; preds = %if.else, %for.end20
  %15 = load i32*, i32** %buffer, align 8, !dbg !277
  %16 = bitcast i32* %15 to i8*, !dbg !277
  call void @free(i8* noundef %16), !dbg !278
  br label %if.end22, !dbg !279

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !280
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !281 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !282, metadata !DIExpression()), !dbg !283
  store i32 -1, i32* %data, align 4, !dbg !284
  %call = call i32 @staticReturnsFalse(), !dbg !285
  %tobool = icmp ne i32 %call, 0, !dbg !285
  br i1 %tobool, label %if.then, label %if.else, !dbg !287

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !288
  br label %if.end, !dbg !290

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !291
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !293
  %tobool2 = icmp ne i32 %call1, 0, !dbg !293
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !295

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !296, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !300, metadata !DIExpression()), !dbg !301
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !302
  %0 = bitcast i8* %call4 to i32*, !dbg !303
  store i32* %0, i32** %buffer, align 8, !dbg !301
  %1 = load i32*, i32** %buffer, align 8, !dbg !304
  %cmp = icmp eq i32* %1, null, !dbg !306
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !307

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !308
  unreachable, !dbg !308

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !310
  br label %for.cond, !dbg !312

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !313
  %cmp7 = icmp slt i32 %2, 10, !dbg !315
  br i1 %cmp7, label %for.body, label %for.end, !dbg !316

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !317
  %4 = load i32, i32* %i, align 4, !dbg !319
  %idxprom = sext i32 %4 to i64, !dbg !317
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !317
  store i32 0, i32* %arrayidx, align 4, !dbg !320
  br label %for.inc, !dbg !321

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !322
  %inc = add nsw i32 %5, 1, !dbg !322
  store i32 %inc, i32* %i, align 4, !dbg !322
  br label %for.cond, !dbg !323, !llvm.loop !324

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !326
  %cmp8 = icmp sge i32 %6, 0, !dbg !328
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !329

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !330
  %8 = load i32, i32* %data, align 4, !dbg !332
  %idxprom10 = sext i32 %8 to i64, !dbg !330
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !330
  store i32 1, i32* %arrayidx11, align 4, !dbg !333
  store i32 0, i32* %i, align 4, !dbg !334
  br label %for.cond12, !dbg !336

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !337
  %cmp13 = icmp slt i32 %9, 10, !dbg !339
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !340

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !341
  %11 = load i32, i32* %i, align 4, !dbg !343
  %idxprom15 = sext i32 %11 to i64, !dbg !341
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !341
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !341
  call void @printIntLine(i32 noundef %12), !dbg !344
  br label %for.inc17, !dbg !345

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !346
  %inc18 = add nsw i32 %13, 1, !dbg !346
  store i32 %inc18, i32* %i, align 4, !dbg !346
  br label %for.cond12, !dbg !347, !llvm.loop !348

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !350

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !351
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !353
  %15 = bitcast i32* %14 to i8*, !dbg !353
  call void @free(i8* noundef %15), !dbg !354
  br label %if.end22, !dbg !355

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !356
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !357 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !358, metadata !DIExpression()), !dbg !359
  store i32 -1, i32* %data, align 4, !dbg !360
  %call = call i32 @staticReturnsTrue(), !dbg !361
  %tobool = icmp ne i32 %call, 0, !dbg !361
  br i1 %tobool, label %if.then, label %if.end, !dbg !363

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !364
  br label %if.end, !dbg !366

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !367
  %tobool2 = icmp ne i32 %call1, 0, !dbg !367
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !369

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !370, metadata !DIExpression()), !dbg !373
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !374, metadata !DIExpression()), !dbg !375
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !376
  %0 = bitcast i8* %call4 to i32*, !dbg !377
  store i32* %0, i32** %buffer, align 8, !dbg !375
  %1 = load i32*, i32** %buffer, align 8, !dbg !378
  %cmp = icmp eq i32* %1, null, !dbg !380
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !381

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !382
  unreachable, !dbg !382

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !384
  br label %for.cond, !dbg !386

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !387
  %cmp7 = icmp slt i32 %2, 10, !dbg !389
  br i1 %cmp7, label %for.body, label %for.end, !dbg !390

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !391
  %4 = load i32, i32* %i, align 4, !dbg !393
  %idxprom = sext i32 %4 to i64, !dbg !391
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !391
  store i32 0, i32* %arrayidx, align 4, !dbg !394
  br label %for.inc, !dbg !395

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !396
  %inc = add nsw i32 %5, 1, !dbg !396
  store i32 %inc, i32* %i, align 4, !dbg !396
  br label %for.cond, !dbg !397, !llvm.loop !398

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !400
  %cmp8 = icmp sge i32 %6, 0, !dbg !402
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !403

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !404
  %8 = load i32, i32* %data, align 4, !dbg !406
  %idxprom10 = sext i32 %8 to i64, !dbg !404
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !404
  store i32 1, i32* %arrayidx11, align 4, !dbg !407
  store i32 0, i32* %i, align 4, !dbg !408
  br label %for.cond12, !dbg !410

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !411
  %cmp13 = icmp slt i32 %9, 10, !dbg !413
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !414

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !415
  %11 = load i32, i32* %i, align 4, !dbg !417
  %idxprom15 = sext i32 %11 to i64, !dbg !415
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !415
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !415
  call void @printIntLine(i32 noundef %12), !dbg !418
  br label %for.inc17, !dbg !419

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !420
  %inc18 = add nsw i32 %13, 1, !dbg !420
  store i32 %inc18, i32* %i, align 4, !dbg !420
  br label %for.cond12, !dbg !421, !llvm.loop !422

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !424

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !425
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !427
  %15 = bitcast i32* %14 to i8*, !dbg !427
  call void @free(i8* noundef %15), !dbg !428
  br label %if.end21, !dbg !429

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !430
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !4)
!20 = !DILocation(line: 37, column: 9, scope: !14)
!21 = !DILocation(line: 39, column: 10, scope: !14)
!22 = !DILocation(line: 40, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 8)
!24 = !DILocation(line: 40, column: 8, scope: !14)
!25 = !DILocation(line: 43, column: 14, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !15, line: 41, column: 5)
!27 = !DILocation(line: 44, column: 5, scope: !26)
!28 = !DILocation(line: 45, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 8)
!30 = !DILocation(line: 45, column: 8, scope: !14)
!31 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 48, type: !4)
!32 = distinct !DILexicalBlock(scope: !33, file: !15, line: 47, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 46, column: 5)
!34 = !DILocation(line: 48, column: 17, scope: !32)
!35 = !DILocalVariable(name: "buffer", scope: !32, file: !15, line: 49, type: !3)
!36 = !DILocation(line: 49, column: 19, scope: !32)
!37 = !DILocation(line: 49, column: 35, scope: !32)
!38 = !DILocation(line: 49, column: 28, scope: !32)
!39 = !DILocation(line: 50, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !15, line: 50, column: 17)
!41 = !DILocation(line: 50, column: 24, scope: !40)
!42 = !DILocation(line: 50, column: 17, scope: !32)
!43 = !DILocation(line: 50, column: 34, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 50, column: 33)
!45 = !DILocation(line: 52, column: 20, scope: !46)
!46 = distinct !DILexicalBlock(scope: !32, file: !15, line: 52, column: 13)
!47 = !DILocation(line: 52, column: 18, scope: !46)
!48 = !DILocation(line: 52, column: 25, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !15, line: 52, column: 13)
!50 = !DILocation(line: 52, column: 27, scope: !49)
!51 = !DILocation(line: 52, column: 13, scope: !46)
!52 = !DILocation(line: 54, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 53, column: 13)
!54 = !DILocation(line: 54, column: 24, scope: !53)
!55 = !DILocation(line: 54, column: 27, scope: !53)
!56 = !DILocation(line: 55, column: 13, scope: !53)
!57 = !DILocation(line: 52, column: 34, scope: !49)
!58 = !DILocation(line: 52, column: 13, scope: !49)
!59 = distinct !{!59, !51, !60, !61}
!60 = !DILocation(line: 55, column: 13, scope: !46)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 58, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !32, file: !15, line: 58, column: 17)
!64 = !DILocation(line: 58, column: 22, scope: !63)
!65 = !DILocation(line: 58, column: 17, scope: !32)
!66 = !DILocation(line: 60, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 59, column: 13)
!68 = !DILocation(line: 60, column: 24, scope: !67)
!69 = !DILocation(line: 60, column: 30, scope: !67)
!70 = !DILocation(line: 62, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 62, column: 17)
!72 = !DILocation(line: 62, column: 21, scope: !71)
!73 = !DILocation(line: 62, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !15, line: 62, column: 17)
!75 = !DILocation(line: 62, column: 30, scope: !74)
!76 = !DILocation(line: 62, column: 17, scope: !71)
!77 = !DILocation(line: 64, column: 34, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 63, column: 17)
!79 = !DILocation(line: 64, column: 41, scope: !78)
!80 = !DILocation(line: 64, column: 21, scope: !78)
!81 = !DILocation(line: 65, column: 17, scope: !78)
!82 = !DILocation(line: 62, column: 37, scope: !74)
!83 = !DILocation(line: 62, column: 17, scope: !74)
!84 = distinct !{!84, !76, !85, !61}
!85 = !DILocation(line: 65, column: 17, scope: !71)
!86 = !DILocation(line: 66, column: 13, scope: !67)
!87 = !DILocation(line: 69, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !63, file: !15, line: 68, column: 13)
!89 = !DILocation(line: 71, column: 18, scope: !32)
!90 = !DILocation(line: 71, column: 13, scope: !32)
!91 = !DILocation(line: 73, column: 5, scope: !33)
!92 = !DILocation(line: 74, column: 1, scope: !14)
!93 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_08_good", scope: !15, file: !15, line: 258, type: !16, scopeLine: 259, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!94 = !DILocation(line: 260, column: 5, scope: !93)
!95 = !DILocation(line: 261, column: 5, scope: !93)
!96 = !DILocation(line: 262, column: 5, scope: !93)
!97 = !DILocation(line: 263, column: 5, scope: !93)
!98 = !DILocation(line: 264, column: 1, scope: !93)
!99 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 275, type: !100, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!100 = !DISubroutineType(types: !101)
!101 = !{!4, !4, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !15, line: 275, type: !4)
!106 = !DILocation(line: 275, column: 14, scope: !99)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !15, line: 275, type: !102)
!108 = !DILocation(line: 275, column: 27, scope: !99)
!109 = !DILocation(line: 278, column: 22, scope: !99)
!110 = !DILocation(line: 278, column: 12, scope: !99)
!111 = !DILocation(line: 278, column: 5, scope: !99)
!112 = !DILocation(line: 280, column: 5, scope: !99)
!113 = !DILocation(line: 281, column: 5, scope: !99)
!114 = !DILocation(line: 282, column: 5, scope: !99)
!115 = !DILocation(line: 285, column: 5, scope: !99)
!116 = !DILocation(line: 286, column: 5, scope: !99)
!117 = !DILocation(line: 287, column: 5, scope: !99)
!118 = !DILocation(line: 289, column: 5, scope: !99)
!119 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 23, type: !120, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!120 = !DISubroutineType(types: !121)
!121 = !{!4}
!122 = !DILocation(line: 25, column: 5, scope: !119)
!123 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!124 = !DILocalVariable(name: "data", scope: !123, file: !15, line: 83, type: !4)
!125 = !DILocation(line: 83, column: 9, scope: !123)
!126 = !DILocation(line: 85, column: 10, scope: !123)
!127 = !DILocation(line: 86, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !15, line: 86, column: 8)
!129 = !DILocation(line: 86, column: 8, scope: !123)
!130 = !DILocation(line: 89, column: 14, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !15, line: 87, column: 5)
!132 = !DILocation(line: 90, column: 5, scope: !131)
!133 = !DILocation(line: 91, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !123, file: !15, line: 91, column: 8)
!135 = !DILocation(line: 91, column: 8, scope: !123)
!136 = !DILocation(line: 94, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !15, line: 92, column: 5)
!138 = !DILocation(line: 95, column: 5, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !15, line: 99, type: !4)
!140 = distinct !DILexicalBlock(scope: !141, file: !15, line: 98, column: 9)
!141 = distinct !DILexicalBlock(scope: !134, file: !15, line: 97, column: 5)
!142 = !DILocation(line: 99, column: 17, scope: !140)
!143 = !DILocalVariable(name: "buffer", scope: !140, file: !15, line: 100, type: !3)
!144 = !DILocation(line: 100, column: 19, scope: !140)
!145 = !DILocation(line: 100, column: 35, scope: !140)
!146 = !DILocation(line: 100, column: 28, scope: !140)
!147 = !DILocation(line: 101, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !140, file: !15, line: 101, column: 17)
!149 = !DILocation(line: 101, column: 24, scope: !148)
!150 = !DILocation(line: 101, column: 17, scope: !140)
!151 = !DILocation(line: 101, column: 34, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !15, line: 101, column: 33)
!153 = !DILocation(line: 103, column: 20, scope: !154)
!154 = distinct !DILexicalBlock(scope: !140, file: !15, line: 103, column: 13)
!155 = !DILocation(line: 103, column: 18, scope: !154)
!156 = !DILocation(line: 103, column: 25, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !15, line: 103, column: 13)
!158 = !DILocation(line: 103, column: 27, scope: !157)
!159 = !DILocation(line: 103, column: 13, scope: !154)
!160 = !DILocation(line: 105, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !15, line: 104, column: 13)
!162 = !DILocation(line: 105, column: 24, scope: !161)
!163 = !DILocation(line: 105, column: 27, scope: !161)
!164 = !DILocation(line: 106, column: 13, scope: !161)
!165 = !DILocation(line: 103, column: 34, scope: !157)
!166 = !DILocation(line: 103, column: 13, scope: !157)
!167 = distinct !{!167, !159, !168, !61}
!168 = !DILocation(line: 106, column: 13, scope: !154)
!169 = !DILocation(line: 108, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !140, file: !15, line: 108, column: 17)
!171 = !DILocation(line: 108, column: 22, scope: !170)
!172 = !DILocation(line: 108, column: 27, scope: !170)
!173 = !DILocation(line: 108, column: 30, scope: !170)
!174 = !DILocation(line: 108, column: 35, scope: !170)
!175 = !DILocation(line: 108, column: 17, scope: !140)
!176 = !DILocation(line: 110, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !170, file: !15, line: 109, column: 13)
!178 = !DILocation(line: 110, column: 24, scope: !177)
!179 = !DILocation(line: 110, column: 30, scope: !177)
!180 = !DILocation(line: 112, column: 23, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !15, line: 112, column: 17)
!182 = !DILocation(line: 112, column: 21, scope: !181)
!183 = !DILocation(line: 112, column: 28, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !15, line: 112, column: 17)
!185 = !DILocation(line: 112, column: 30, scope: !184)
!186 = !DILocation(line: 112, column: 17, scope: !181)
!187 = !DILocation(line: 114, column: 34, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !15, line: 113, column: 17)
!189 = !DILocation(line: 114, column: 41, scope: !188)
!190 = !DILocation(line: 114, column: 21, scope: !188)
!191 = !DILocation(line: 115, column: 17, scope: !188)
!192 = !DILocation(line: 112, column: 37, scope: !184)
!193 = !DILocation(line: 112, column: 17, scope: !184)
!194 = distinct !{!194, !186, !195, !61}
!195 = !DILocation(line: 115, column: 17, scope: !181)
!196 = !DILocation(line: 116, column: 13, scope: !177)
!197 = !DILocation(line: 119, column: 17, scope: !198)
!198 = distinct !DILexicalBlock(scope: !170, file: !15, line: 118, column: 13)
!199 = !DILocation(line: 121, column: 18, scope: !140)
!200 = !DILocation(line: 121, column: 13, scope: !140)
!201 = !DILocation(line: 124, column: 1, scope: !123)
!202 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 28, type: !120, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!203 = !DILocation(line: 30, column: 5, scope: !202)
!204 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 127, type: !16, scopeLine: 128, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!205 = !DILocalVariable(name: "data", scope: !204, file: !15, line: 129, type: !4)
!206 = !DILocation(line: 129, column: 9, scope: !204)
!207 = !DILocation(line: 131, column: 10, scope: !204)
!208 = !DILocation(line: 132, column: 8, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !15, line: 132, column: 8)
!210 = !DILocation(line: 132, column: 8, scope: !204)
!211 = !DILocation(line: 135, column: 14, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !15, line: 133, column: 5)
!213 = !DILocation(line: 136, column: 5, scope: !212)
!214 = !DILocation(line: 137, column: 8, scope: !215)
!215 = distinct !DILexicalBlock(scope: !204, file: !15, line: 137, column: 8)
!216 = !DILocation(line: 137, column: 8, scope: !204)
!217 = !DILocalVariable(name: "i", scope: !218, file: !15, line: 140, type: !4)
!218 = distinct !DILexicalBlock(scope: !219, file: !15, line: 139, column: 9)
!219 = distinct !DILexicalBlock(scope: !215, file: !15, line: 138, column: 5)
!220 = !DILocation(line: 140, column: 17, scope: !218)
!221 = !DILocalVariable(name: "buffer", scope: !218, file: !15, line: 141, type: !3)
!222 = !DILocation(line: 141, column: 19, scope: !218)
!223 = !DILocation(line: 141, column: 35, scope: !218)
!224 = !DILocation(line: 141, column: 28, scope: !218)
!225 = !DILocation(line: 142, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !218, file: !15, line: 142, column: 17)
!227 = !DILocation(line: 142, column: 24, scope: !226)
!228 = !DILocation(line: 142, column: 17, scope: !218)
!229 = !DILocation(line: 142, column: 34, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !15, line: 142, column: 33)
!231 = !DILocation(line: 144, column: 20, scope: !232)
!232 = distinct !DILexicalBlock(scope: !218, file: !15, line: 144, column: 13)
!233 = !DILocation(line: 144, column: 18, scope: !232)
!234 = !DILocation(line: 144, column: 25, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !15, line: 144, column: 13)
!236 = !DILocation(line: 144, column: 27, scope: !235)
!237 = !DILocation(line: 144, column: 13, scope: !232)
!238 = !DILocation(line: 146, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !15, line: 145, column: 13)
!240 = !DILocation(line: 146, column: 24, scope: !239)
!241 = !DILocation(line: 146, column: 27, scope: !239)
!242 = !DILocation(line: 147, column: 13, scope: !239)
!243 = !DILocation(line: 144, column: 34, scope: !235)
!244 = !DILocation(line: 144, column: 13, scope: !235)
!245 = distinct !{!245, !237, !246, !61}
!246 = !DILocation(line: 147, column: 13, scope: !232)
!247 = !DILocation(line: 149, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !218, file: !15, line: 149, column: 17)
!249 = !DILocation(line: 149, column: 22, scope: !248)
!250 = !DILocation(line: 149, column: 27, scope: !248)
!251 = !DILocation(line: 149, column: 30, scope: !248)
!252 = !DILocation(line: 149, column: 35, scope: !248)
!253 = !DILocation(line: 149, column: 17, scope: !218)
!254 = !DILocation(line: 151, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !248, file: !15, line: 150, column: 13)
!256 = !DILocation(line: 151, column: 24, scope: !255)
!257 = !DILocation(line: 151, column: 30, scope: !255)
!258 = !DILocation(line: 153, column: 23, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !15, line: 153, column: 17)
!260 = !DILocation(line: 153, column: 21, scope: !259)
!261 = !DILocation(line: 153, column: 28, scope: !262)
!262 = distinct !DILexicalBlock(scope: !259, file: !15, line: 153, column: 17)
!263 = !DILocation(line: 153, column: 30, scope: !262)
!264 = !DILocation(line: 153, column: 17, scope: !259)
!265 = !DILocation(line: 155, column: 34, scope: !266)
!266 = distinct !DILexicalBlock(scope: !262, file: !15, line: 154, column: 17)
!267 = !DILocation(line: 155, column: 41, scope: !266)
!268 = !DILocation(line: 155, column: 21, scope: !266)
!269 = !DILocation(line: 156, column: 17, scope: !266)
!270 = !DILocation(line: 153, column: 37, scope: !262)
!271 = !DILocation(line: 153, column: 17, scope: !262)
!272 = distinct !{!272, !264, !273, !61}
!273 = !DILocation(line: 156, column: 17, scope: !259)
!274 = !DILocation(line: 157, column: 13, scope: !255)
!275 = !DILocation(line: 160, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !248, file: !15, line: 159, column: 13)
!277 = !DILocation(line: 162, column: 18, scope: !218)
!278 = !DILocation(line: 162, column: 13, scope: !218)
!279 = !DILocation(line: 164, column: 5, scope: !219)
!280 = !DILocation(line: 165, column: 1, scope: !204)
!281 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 168, type: !16, scopeLine: 169, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!282 = !DILocalVariable(name: "data", scope: !281, file: !15, line: 170, type: !4)
!283 = !DILocation(line: 170, column: 9, scope: !281)
!284 = !DILocation(line: 172, column: 10, scope: !281)
!285 = !DILocation(line: 173, column: 8, scope: !286)
!286 = distinct !DILexicalBlock(scope: !281, file: !15, line: 173, column: 8)
!287 = !DILocation(line: 173, column: 8, scope: !281)
!288 = !DILocation(line: 176, column: 9, scope: !289)
!289 = distinct !DILexicalBlock(scope: !286, file: !15, line: 174, column: 5)
!290 = !DILocation(line: 177, column: 5, scope: !289)
!291 = !DILocation(line: 182, column: 14, scope: !292)
!292 = distinct !DILexicalBlock(scope: !286, file: !15, line: 179, column: 5)
!293 = !DILocation(line: 184, column: 8, scope: !294)
!294 = distinct !DILexicalBlock(scope: !281, file: !15, line: 184, column: 8)
!295 = !DILocation(line: 184, column: 8, scope: !281)
!296 = !DILocalVariable(name: "i", scope: !297, file: !15, line: 187, type: !4)
!297 = distinct !DILexicalBlock(scope: !298, file: !15, line: 186, column: 9)
!298 = distinct !DILexicalBlock(scope: !294, file: !15, line: 185, column: 5)
!299 = !DILocation(line: 187, column: 17, scope: !297)
!300 = !DILocalVariable(name: "buffer", scope: !297, file: !15, line: 188, type: !3)
!301 = !DILocation(line: 188, column: 19, scope: !297)
!302 = !DILocation(line: 188, column: 35, scope: !297)
!303 = !DILocation(line: 188, column: 28, scope: !297)
!304 = !DILocation(line: 189, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !297, file: !15, line: 189, column: 17)
!306 = !DILocation(line: 189, column: 24, scope: !305)
!307 = !DILocation(line: 189, column: 17, scope: !297)
!308 = !DILocation(line: 189, column: 34, scope: !309)
!309 = distinct !DILexicalBlock(scope: !305, file: !15, line: 189, column: 33)
!310 = !DILocation(line: 191, column: 20, scope: !311)
!311 = distinct !DILexicalBlock(scope: !297, file: !15, line: 191, column: 13)
!312 = !DILocation(line: 191, column: 18, scope: !311)
!313 = !DILocation(line: 191, column: 25, scope: !314)
!314 = distinct !DILexicalBlock(scope: !311, file: !15, line: 191, column: 13)
!315 = !DILocation(line: 191, column: 27, scope: !314)
!316 = !DILocation(line: 191, column: 13, scope: !311)
!317 = !DILocation(line: 193, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !15, line: 192, column: 13)
!319 = !DILocation(line: 193, column: 24, scope: !318)
!320 = !DILocation(line: 193, column: 27, scope: !318)
!321 = !DILocation(line: 194, column: 13, scope: !318)
!322 = !DILocation(line: 191, column: 34, scope: !314)
!323 = !DILocation(line: 191, column: 13, scope: !314)
!324 = distinct !{!324, !316, !325, !61}
!325 = !DILocation(line: 194, column: 13, scope: !311)
!326 = !DILocation(line: 197, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !297, file: !15, line: 197, column: 17)
!328 = !DILocation(line: 197, column: 22, scope: !327)
!329 = !DILocation(line: 197, column: 17, scope: !297)
!330 = !DILocation(line: 199, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !15, line: 198, column: 13)
!332 = !DILocation(line: 199, column: 24, scope: !331)
!333 = !DILocation(line: 199, column: 30, scope: !331)
!334 = !DILocation(line: 201, column: 23, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !15, line: 201, column: 17)
!336 = !DILocation(line: 201, column: 21, scope: !335)
!337 = !DILocation(line: 201, column: 28, scope: !338)
!338 = distinct !DILexicalBlock(scope: !335, file: !15, line: 201, column: 17)
!339 = !DILocation(line: 201, column: 30, scope: !338)
!340 = !DILocation(line: 201, column: 17, scope: !335)
!341 = !DILocation(line: 203, column: 34, scope: !342)
!342 = distinct !DILexicalBlock(scope: !338, file: !15, line: 202, column: 17)
!343 = !DILocation(line: 203, column: 41, scope: !342)
!344 = !DILocation(line: 203, column: 21, scope: !342)
!345 = !DILocation(line: 204, column: 17, scope: !342)
!346 = !DILocation(line: 201, column: 37, scope: !338)
!347 = !DILocation(line: 201, column: 17, scope: !338)
!348 = distinct !{!348, !340, !349, !61}
!349 = !DILocation(line: 204, column: 17, scope: !335)
!350 = !DILocation(line: 205, column: 13, scope: !331)
!351 = !DILocation(line: 208, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !327, file: !15, line: 207, column: 13)
!353 = !DILocation(line: 210, column: 18, scope: !297)
!354 = !DILocation(line: 210, column: 13, scope: !297)
!355 = !DILocation(line: 212, column: 5, scope: !298)
!356 = !DILocation(line: 213, column: 1, scope: !281)
!357 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 216, type: !16, scopeLine: 217, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!358 = !DILocalVariable(name: "data", scope: !357, file: !15, line: 218, type: !4)
!359 = !DILocation(line: 218, column: 9, scope: !357)
!360 = !DILocation(line: 220, column: 10, scope: !357)
!361 = !DILocation(line: 221, column: 8, scope: !362)
!362 = distinct !DILexicalBlock(scope: !357, file: !15, line: 221, column: 8)
!363 = !DILocation(line: 221, column: 8, scope: !357)
!364 = !DILocation(line: 225, column: 14, scope: !365)
!365 = distinct !DILexicalBlock(scope: !362, file: !15, line: 222, column: 5)
!366 = !DILocation(line: 226, column: 5, scope: !365)
!367 = !DILocation(line: 227, column: 8, scope: !368)
!368 = distinct !DILexicalBlock(scope: !357, file: !15, line: 227, column: 8)
!369 = !DILocation(line: 227, column: 8, scope: !357)
!370 = !DILocalVariable(name: "i", scope: !371, file: !15, line: 230, type: !4)
!371 = distinct !DILexicalBlock(scope: !372, file: !15, line: 229, column: 9)
!372 = distinct !DILexicalBlock(scope: !368, file: !15, line: 228, column: 5)
!373 = !DILocation(line: 230, column: 17, scope: !371)
!374 = !DILocalVariable(name: "buffer", scope: !371, file: !15, line: 231, type: !3)
!375 = !DILocation(line: 231, column: 19, scope: !371)
!376 = !DILocation(line: 231, column: 35, scope: !371)
!377 = !DILocation(line: 231, column: 28, scope: !371)
!378 = !DILocation(line: 232, column: 17, scope: !379)
!379 = distinct !DILexicalBlock(scope: !371, file: !15, line: 232, column: 17)
!380 = !DILocation(line: 232, column: 24, scope: !379)
!381 = !DILocation(line: 232, column: 17, scope: !371)
!382 = !DILocation(line: 232, column: 34, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !15, line: 232, column: 33)
!384 = !DILocation(line: 234, column: 20, scope: !385)
!385 = distinct !DILexicalBlock(scope: !371, file: !15, line: 234, column: 13)
!386 = !DILocation(line: 234, column: 18, scope: !385)
!387 = !DILocation(line: 234, column: 25, scope: !388)
!388 = distinct !DILexicalBlock(scope: !385, file: !15, line: 234, column: 13)
!389 = !DILocation(line: 234, column: 27, scope: !388)
!390 = !DILocation(line: 234, column: 13, scope: !385)
!391 = !DILocation(line: 236, column: 17, scope: !392)
!392 = distinct !DILexicalBlock(scope: !388, file: !15, line: 235, column: 13)
!393 = !DILocation(line: 236, column: 24, scope: !392)
!394 = !DILocation(line: 236, column: 27, scope: !392)
!395 = !DILocation(line: 237, column: 13, scope: !392)
!396 = !DILocation(line: 234, column: 34, scope: !388)
!397 = !DILocation(line: 234, column: 13, scope: !388)
!398 = distinct !{!398, !390, !399, !61}
!399 = !DILocation(line: 237, column: 13, scope: !385)
!400 = !DILocation(line: 240, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !371, file: !15, line: 240, column: 17)
!402 = !DILocation(line: 240, column: 22, scope: !401)
!403 = !DILocation(line: 240, column: 17, scope: !371)
!404 = !DILocation(line: 242, column: 17, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !15, line: 241, column: 13)
!406 = !DILocation(line: 242, column: 24, scope: !405)
!407 = !DILocation(line: 242, column: 30, scope: !405)
!408 = !DILocation(line: 244, column: 23, scope: !409)
!409 = distinct !DILexicalBlock(scope: !405, file: !15, line: 244, column: 17)
!410 = !DILocation(line: 244, column: 21, scope: !409)
!411 = !DILocation(line: 244, column: 28, scope: !412)
!412 = distinct !DILexicalBlock(scope: !409, file: !15, line: 244, column: 17)
!413 = !DILocation(line: 244, column: 30, scope: !412)
!414 = !DILocation(line: 244, column: 17, scope: !409)
!415 = !DILocation(line: 246, column: 34, scope: !416)
!416 = distinct !DILexicalBlock(scope: !412, file: !15, line: 245, column: 17)
!417 = !DILocation(line: 246, column: 41, scope: !416)
!418 = !DILocation(line: 246, column: 21, scope: !416)
!419 = !DILocation(line: 247, column: 17, scope: !416)
!420 = !DILocation(line: 244, column: 37, scope: !412)
!421 = !DILocation(line: 244, column: 17, scope: !412)
!422 = distinct !{!422, !414, !423, !61}
!423 = !DILocation(line: 247, column: 17, scope: !409)
!424 = !DILocation(line: 248, column: 13, scope: !405)
!425 = !DILocation(line: 251, column: 17, scope: !426)
!426 = distinct !DILexicalBlock(scope: !401, file: !15, line: 250, column: 13)
!427 = !DILocation(line: 253, column: 18, scope: !371)
!428 = !DILocation(line: 253, column: 13, scope: !371)
!429 = !DILocation(line: 255, column: 5, scope: !372)
!430 = !DILocation(line: 256, column: 1, scope: !357)
