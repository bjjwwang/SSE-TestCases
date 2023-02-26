; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %0 = load i32, i32* @globalFive, align 4, !dbg !22
  %cmp = icmp eq i32 %0, 5, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !26
  br label %if.end, !dbg !28

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !29
  %cmp1 = icmp eq i32 %1, 5, !dbg !31
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !32

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !37, metadata !DIExpression()), !dbg !38
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !39
  %2 = bitcast i8* %call to i32*, !dbg !40
  store i32* %2, i32** %buffer, align 8, !dbg !38
  %3 = load i32*, i32** %buffer, align 8, !dbg !41
  %cmp3 = icmp eq i32* %3, null, !dbg !43
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !44

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !45
  unreachable, !dbg !45

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !50
  %cmp6 = icmp slt i32 %4, 10, !dbg !52
  br i1 %cmp6, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !54
  %6 = load i32, i32* %i, align 4, !dbg !56
  %idxprom = sext i32 %6 to i64, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !59
  %inc = add nsw i32 %7, 1, !dbg !59
  store i32 %inc, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !64
  %cmp7 = icmp sge i32 %8, 0, !dbg !66
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !67

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !68
  %10 = load i32, i32* %data, align 4, !dbg !70
  %idxprom9 = sext i32 %10 to i64, !dbg !68
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !68
  store i32 1, i32* %arrayidx10, align 4, !dbg !71
  store i32 0, i32* %i, align 4, !dbg !72
  br label %for.cond11, !dbg !74

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !75
  %cmp12 = icmp slt i32 %11, 10, !dbg !77
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !78

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !79
  %13 = load i32, i32* %i, align 4, !dbg !81
  %idxprom14 = sext i32 %13 to i64, !dbg !79
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !79
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !79
  call void @printIntLine(i32 noundef %14), !dbg !82
  br label %for.inc16, !dbg !83

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !84
  %inc17 = add nsw i32 %15, 1, !dbg !84
  store i32 %inc17, i32* %i, align 4, !dbg !84
  br label %for.cond11, !dbg !85, !llvm.loop !86

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !88

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !89
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !91
  %17 = bitcast i32* %16 to i8*, !dbg !91
  call void @free(i8* noundef %17), !dbg !92
  br label %if.end20, !dbg !93

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !94
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_14_good() #0 !dbg !95 {
entry:
  call void @goodB2G1(), !dbg !96
  call void @goodB2G2(), !dbg !97
  call void @goodG2B1(), !dbg !98
  call void @goodG2B2(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* noundef null), !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 noundef %conv), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_14_good(), !dbg !115
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_14_bad(), !dbg !118
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !121 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !122, metadata !DIExpression()), !dbg !123
  store i32 -1, i32* %data, align 4, !dbg !124
  %0 = load i32, i32* @globalFive, align 4, !dbg !125
  %cmp = icmp eq i32 %0, 5, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !129
  br label %if.end, !dbg !131

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !132
  %cmp1 = icmp ne i32 %1, 5, !dbg !134
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !135

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !136
  br label %if.end22, !dbg !138

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !139, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !143, metadata !DIExpression()), !dbg !144
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !145
  %2 = bitcast i8* %call to i32*, !dbg !146
  store i32* %2, i32** %buffer, align 8, !dbg !144
  %3 = load i32*, i32** %buffer, align 8, !dbg !147
  %cmp3 = icmp eq i32* %3, null, !dbg !149
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !150

if.then4:                                         ; preds = %if.else
  call void @exit(i32 noundef -1) #6, !dbg !151
  unreachable, !dbg !151

if.end5:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !156
  %cmp6 = icmp slt i32 %4, 10, !dbg !158
  br i1 %cmp6, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !160
  %6 = load i32, i32* %i, align 4, !dbg !162
  %idxprom = sext i32 %6 to i64, !dbg !160
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !160
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !165
  %inc = add nsw i32 %7, 1, !dbg !165
  store i32 %inc, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !169
  %cmp7 = icmp sge i32 %8, 0, !dbg !171
  br i1 %cmp7, label %land.lhs.true, label %if.else20, !dbg !172

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !173
  %cmp8 = icmp slt i32 %9, 10, !dbg !174
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !175

if.then9:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !176
  %11 = load i32, i32* %data, align 4, !dbg !178
  %idxprom10 = sext i32 %11 to i64, !dbg !176
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !176
  store i32 1, i32* %arrayidx11, align 4, !dbg !179
  store i32 0, i32* %i, align 4, !dbg !180
  br label %for.cond12, !dbg !182

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %12 = load i32, i32* %i, align 4, !dbg !183
  %cmp13 = icmp slt i32 %12, 10, !dbg !185
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !186

for.body14:                                       ; preds = %for.cond12
  %13 = load i32*, i32** %buffer, align 8, !dbg !187
  %14 = load i32, i32* %i, align 4, !dbg !189
  %idxprom15 = sext i32 %14 to i64, !dbg !187
  %arrayidx16 = getelementptr inbounds i32, i32* %13, i64 %idxprom15, !dbg !187
  %15 = load i32, i32* %arrayidx16, align 4, !dbg !187
  call void @printIntLine(i32 noundef %15), !dbg !190
  br label %for.inc17, !dbg !191

for.inc17:                                        ; preds = %for.body14
  %16 = load i32, i32* %i, align 4, !dbg !192
  %inc18 = add nsw i32 %16, 1, !dbg !192
  store i32 %inc18, i32* %i, align 4, !dbg !192
  br label %for.cond12, !dbg !193, !llvm.loop !194

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !196

if.else20:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !197
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %17 = load i32*, i32** %buffer, align 8, !dbg !199
  %18 = bitcast i32* %17 to i8*, !dbg !199
  call void @free(i8* noundef %18), !dbg !200
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.then2
  ret void, !dbg !201
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !202 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !203, metadata !DIExpression()), !dbg !204
  store i32 -1, i32* %data, align 4, !dbg !205
  %0 = load i32, i32* @globalFive, align 4, !dbg !206
  %cmp = icmp eq i32 %0, 5, !dbg !208
  br i1 %cmp, label %if.then, label %if.end, !dbg !209

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !210
  br label %if.end, !dbg !212

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !213
  %cmp1 = icmp eq i32 %1, 5, !dbg !215
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !216

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !217, metadata !DIExpression()), !dbg !220
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !221, metadata !DIExpression()), !dbg !222
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !223
  %2 = bitcast i8* %call to i32*, !dbg !224
  store i32* %2, i32** %buffer, align 8, !dbg !222
  %3 = load i32*, i32** %buffer, align 8, !dbg !225
  %cmp3 = icmp eq i32* %3, null, !dbg !227
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !228

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !229
  unreachable, !dbg !229

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !231
  br label %for.cond, !dbg !233

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !234
  %cmp6 = icmp slt i32 %4, 10, !dbg !236
  br i1 %cmp6, label %for.body, label %for.end, !dbg !237

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !238
  %6 = load i32, i32* %i, align 4, !dbg !240
  %idxprom = sext i32 %6 to i64, !dbg !238
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !238
  store i32 0, i32* %arrayidx, align 4, !dbg !241
  br label %for.inc, !dbg !242

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !243
  %inc = add nsw i32 %7, 1, !dbg !243
  store i32 %inc, i32* %i, align 4, !dbg !243
  br label %for.cond, !dbg !244, !llvm.loop !245

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !247
  %cmp7 = icmp sge i32 %8, 0, !dbg !249
  br i1 %cmp7, label %land.lhs.true, label %if.else, !dbg !250

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !251
  %cmp8 = icmp slt i32 %9, 10, !dbg !252
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !253

if.then9:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !254
  %11 = load i32, i32* %data, align 4, !dbg !256
  %idxprom10 = sext i32 %11 to i64, !dbg !254
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !254
  store i32 1, i32* %arrayidx11, align 4, !dbg !257
  store i32 0, i32* %i, align 4, !dbg !258
  br label %for.cond12, !dbg !260

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %12 = load i32, i32* %i, align 4, !dbg !261
  %cmp13 = icmp slt i32 %12, 10, !dbg !263
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !264

for.body14:                                       ; preds = %for.cond12
  %13 = load i32*, i32** %buffer, align 8, !dbg !265
  %14 = load i32, i32* %i, align 4, !dbg !267
  %idxprom15 = sext i32 %14 to i64, !dbg !265
  %arrayidx16 = getelementptr inbounds i32, i32* %13, i64 %idxprom15, !dbg !265
  %15 = load i32, i32* %arrayidx16, align 4, !dbg !265
  call void @printIntLine(i32 noundef %15), !dbg !268
  br label %for.inc17, !dbg !269

for.inc17:                                        ; preds = %for.body14
  %16 = load i32, i32* %i, align 4, !dbg !270
  %inc18 = add nsw i32 %16, 1, !dbg !270
  store i32 %inc18, i32* %i, align 4, !dbg !270
  br label %for.cond12, !dbg !271, !llvm.loop !272

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !274

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !275
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %17 = load i32*, i32** %buffer, align 8, !dbg !277
  %18 = bitcast i32* %17 to i8*, !dbg !277
  call void @free(i8* noundef %18), !dbg !278
  br label %if.end21, !dbg !279

if.end21:                                         ; preds = %if.end20, %if.end
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
  %0 = load i32, i32* @globalFive, align 4, !dbg !285
  %cmp = icmp ne i32 %0, 5, !dbg !287
  br i1 %cmp, label %if.then, label %if.else, !dbg !288

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !289
  br label %if.end, !dbg !291

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !292
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !294
  %cmp1 = icmp eq i32 %1, 5, !dbg !296
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !297

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !298, metadata !DIExpression()), !dbg !301
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !302, metadata !DIExpression()), !dbg !303
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !304
  %2 = bitcast i8* %call to i32*, !dbg !305
  store i32* %2, i32** %buffer, align 8, !dbg !303
  %3 = load i32*, i32** %buffer, align 8, !dbg !306
  %cmp3 = icmp eq i32* %3, null, !dbg !308
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !309

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !310
  unreachable, !dbg !310

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !312
  br label %for.cond, !dbg !314

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !315
  %cmp6 = icmp slt i32 %4, 10, !dbg !317
  br i1 %cmp6, label %for.body, label %for.end, !dbg !318

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !319
  %6 = load i32, i32* %i, align 4, !dbg !321
  %idxprom = sext i32 %6 to i64, !dbg !319
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !319
  store i32 0, i32* %arrayidx, align 4, !dbg !322
  br label %for.inc, !dbg !323

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !324
  %inc = add nsw i32 %7, 1, !dbg !324
  store i32 %inc, i32* %i, align 4, !dbg !324
  br label %for.cond, !dbg !325, !llvm.loop !326

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !328
  %cmp7 = icmp sge i32 %8, 0, !dbg !330
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !331

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !332
  %10 = load i32, i32* %data, align 4, !dbg !334
  %idxprom9 = sext i32 %10 to i64, !dbg !332
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !332
  store i32 1, i32* %arrayidx10, align 4, !dbg !335
  store i32 0, i32* %i, align 4, !dbg !336
  br label %for.cond11, !dbg !338

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !339
  %cmp12 = icmp slt i32 %11, 10, !dbg !341
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !342

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !343
  %13 = load i32, i32* %i, align 4, !dbg !345
  %idxprom14 = sext i32 %13 to i64, !dbg !343
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !343
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !343
  call void @printIntLine(i32 noundef %14), !dbg !346
  br label %for.inc16, !dbg !347

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !348
  %inc17 = add nsw i32 %15, 1, !dbg !348
  store i32 %inc17, i32* %i, align 4, !dbg !348
  br label %for.cond11, !dbg !349, !llvm.loop !350

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !352

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !353
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !355
  %17 = bitcast i32* %16 to i8*, !dbg !355
  call void @free(i8* noundef %17), !dbg !356
  br label %if.end21, !dbg !357

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !358
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !359 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !360, metadata !DIExpression()), !dbg !361
  store i32 -1, i32* %data, align 4, !dbg !362
  %0 = load i32, i32* @globalFive, align 4, !dbg !363
  %cmp = icmp eq i32 %0, 5, !dbg !365
  br i1 %cmp, label %if.then, label %if.end, !dbg !366

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !367
  br label %if.end, !dbg !369

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !370
  %cmp1 = icmp eq i32 %1, 5, !dbg !372
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !373

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !374, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !378, metadata !DIExpression()), !dbg !379
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !380
  %2 = bitcast i8* %call to i32*, !dbg !381
  store i32* %2, i32** %buffer, align 8, !dbg !379
  %3 = load i32*, i32** %buffer, align 8, !dbg !382
  %cmp3 = icmp eq i32* %3, null, !dbg !384
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !385

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !386
  unreachable, !dbg !386

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !388
  br label %for.cond, !dbg !390

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !391
  %cmp6 = icmp slt i32 %4, 10, !dbg !393
  br i1 %cmp6, label %for.body, label %for.end, !dbg !394

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !395
  %6 = load i32, i32* %i, align 4, !dbg !397
  %idxprom = sext i32 %6 to i64, !dbg !395
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !395
  store i32 0, i32* %arrayidx, align 4, !dbg !398
  br label %for.inc, !dbg !399

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !400
  %inc = add nsw i32 %7, 1, !dbg !400
  store i32 %inc, i32* %i, align 4, !dbg !400
  br label %for.cond, !dbg !401, !llvm.loop !402

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !404
  %cmp7 = icmp sge i32 %8, 0, !dbg !406
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !407

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !408
  %10 = load i32, i32* %data, align 4, !dbg !410
  %idxprom9 = sext i32 %10 to i64, !dbg !408
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !408
  store i32 1, i32* %arrayidx10, align 4, !dbg !411
  store i32 0, i32* %i, align 4, !dbg !412
  br label %for.cond11, !dbg !414

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !415
  %cmp12 = icmp slt i32 %11, 10, !dbg !417
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !418

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !419
  %13 = load i32, i32* %i, align 4, !dbg !421
  %idxprom14 = sext i32 %13 to i64, !dbg !419
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !419
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !419
  call void @printIntLine(i32 noundef %14), !dbg !422
  br label %for.inc16, !dbg !423

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !424
  %inc17 = add nsw i32 %15, 1, !dbg !424
  store i32 %inc17, i32* %i, align 4, !dbg !424
  br label %for.cond11, !dbg !425, !llvm.loop !426

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !428

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !429
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !431
  %17 = bitcast i32* %16 to i8*, !dbg !431
  call void @free(i8* noundef %17), !dbg !432
  br label %if.end20, !dbg !433

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !434
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_14_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 9, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!24 = !DILocation(line: 27, column: 18, scope: !23)
!25 = !DILocation(line: 27, column: 8, scope: !14)
!26 = !DILocation(line: 30, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 28, column: 5)
!28 = !DILocation(line: 31, column: 5, scope: !27)
!29 = !DILocation(line: 32, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!31 = !DILocation(line: 32, column: 18, scope: !30)
!32 = !DILocation(line: 32, column: 8, scope: !14)
!33 = !DILocalVariable(name: "i", scope: !34, file: !15, line: 35, type: !4)
!34 = distinct !DILexicalBlock(scope: !35, file: !15, line: 34, column: 9)
!35 = distinct !DILexicalBlock(scope: !30, file: !15, line: 33, column: 5)
!36 = !DILocation(line: 35, column: 17, scope: !34)
!37 = !DILocalVariable(name: "buffer", scope: !34, file: !15, line: 36, type: !3)
!38 = !DILocation(line: 36, column: 19, scope: !34)
!39 = !DILocation(line: 36, column: 35, scope: !34)
!40 = !DILocation(line: 36, column: 28, scope: !34)
!41 = !DILocation(line: 37, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !34, file: !15, line: 37, column: 17)
!43 = !DILocation(line: 37, column: 24, scope: !42)
!44 = !DILocation(line: 37, column: 17, scope: !34)
!45 = !DILocation(line: 37, column: 34, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 37, column: 33)
!47 = !DILocation(line: 39, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !15, line: 39, column: 13)
!49 = !DILocation(line: 39, column: 18, scope: !48)
!50 = !DILocation(line: 39, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !15, line: 39, column: 13)
!52 = !DILocation(line: 39, column: 27, scope: !51)
!53 = !DILocation(line: 39, column: 13, scope: !48)
!54 = !DILocation(line: 41, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 40, column: 13)
!56 = !DILocation(line: 41, column: 24, scope: !55)
!57 = !DILocation(line: 41, column: 27, scope: !55)
!58 = !DILocation(line: 42, column: 13, scope: !55)
!59 = !DILocation(line: 39, column: 34, scope: !51)
!60 = !DILocation(line: 39, column: 13, scope: !51)
!61 = distinct !{!61, !53, !62, !63}
!62 = !DILocation(line: 42, column: 13, scope: !48)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 45, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !34, file: !15, line: 45, column: 17)
!66 = !DILocation(line: 45, column: 22, scope: !65)
!67 = !DILocation(line: 45, column: 17, scope: !34)
!68 = !DILocation(line: 47, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 46, column: 13)
!70 = !DILocation(line: 47, column: 24, scope: !69)
!71 = !DILocation(line: 47, column: 30, scope: !69)
!72 = !DILocation(line: 49, column: 23, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 49, column: 17)
!74 = !DILocation(line: 49, column: 21, scope: !73)
!75 = !DILocation(line: 49, column: 28, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !15, line: 49, column: 17)
!77 = !DILocation(line: 49, column: 30, scope: !76)
!78 = !DILocation(line: 49, column: 17, scope: !73)
!79 = !DILocation(line: 51, column: 34, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 50, column: 17)
!81 = !DILocation(line: 51, column: 41, scope: !80)
!82 = !DILocation(line: 51, column: 21, scope: !80)
!83 = !DILocation(line: 52, column: 17, scope: !80)
!84 = !DILocation(line: 49, column: 37, scope: !76)
!85 = !DILocation(line: 49, column: 17, scope: !76)
!86 = distinct !{!86, !78, !87, !63}
!87 = !DILocation(line: 52, column: 17, scope: !73)
!88 = !DILocation(line: 53, column: 13, scope: !69)
!89 = !DILocation(line: 56, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !65, file: !15, line: 55, column: 13)
!91 = !DILocation(line: 58, column: 18, scope: !34)
!92 = !DILocation(line: 58, column: 13, scope: !34)
!93 = !DILocation(line: 60, column: 5, scope: !35)
!94 = !DILocation(line: 61, column: 1, scope: !14)
!95 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_14_good", scope: !15, file: !15, line: 245, type: !16, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!96 = !DILocation(line: 247, column: 5, scope: !95)
!97 = !DILocation(line: 248, column: 5, scope: !95)
!98 = !DILocation(line: 249, column: 5, scope: !95)
!99 = !DILocation(line: 250, column: 5, scope: !95)
!100 = !DILocation(line: 251, column: 1, scope: !95)
!101 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 262, type: !102, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!102 = !DISubroutineType(types: !103)
!103 = !{!4, !4, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !15, line: 262, type: !4)
!108 = !DILocation(line: 262, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !15, line: 262, type: !104)
!110 = !DILocation(line: 262, column: 27, scope: !101)
!111 = !DILocation(line: 265, column: 22, scope: !101)
!112 = !DILocation(line: 265, column: 12, scope: !101)
!113 = !DILocation(line: 265, column: 5, scope: !101)
!114 = !DILocation(line: 267, column: 5, scope: !101)
!115 = !DILocation(line: 268, column: 5, scope: !101)
!116 = !DILocation(line: 269, column: 5, scope: !101)
!117 = !DILocation(line: 272, column: 5, scope: !101)
!118 = !DILocation(line: 273, column: 5, scope: !101)
!119 = !DILocation(line: 274, column: 5, scope: !101)
!120 = !DILocation(line: 276, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!122 = !DILocalVariable(name: "data", scope: !121, file: !15, line: 70, type: !4)
!123 = !DILocation(line: 70, column: 9, scope: !121)
!124 = !DILocation(line: 72, column: 10, scope: !121)
!125 = !DILocation(line: 73, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !15, line: 73, column: 8)
!127 = !DILocation(line: 73, column: 18, scope: !126)
!128 = !DILocation(line: 73, column: 8, scope: !121)
!129 = !DILocation(line: 76, column: 14, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 74, column: 5)
!131 = !DILocation(line: 77, column: 5, scope: !130)
!132 = !DILocation(line: 78, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !121, file: !15, line: 78, column: 8)
!134 = !DILocation(line: 78, column: 18, scope: !133)
!135 = !DILocation(line: 78, column: 8, scope: !121)
!136 = !DILocation(line: 81, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 79, column: 5)
!138 = !DILocation(line: 82, column: 5, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !15, line: 86, type: !4)
!140 = distinct !DILexicalBlock(scope: !141, file: !15, line: 85, column: 9)
!141 = distinct !DILexicalBlock(scope: !133, file: !15, line: 84, column: 5)
!142 = !DILocation(line: 86, column: 17, scope: !140)
!143 = !DILocalVariable(name: "buffer", scope: !140, file: !15, line: 87, type: !3)
!144 = !DILocation(line: 87, column: 19, scope: !140)
!145 = !DILocation(line: 87, column: 35, scope: !140)
!146 = !DILocation(line: 87, column: 28, scope: !140)
!147 = !DILocation(line: 88, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !140, file: !15, line: 88, column: 17)
!149 = !DILocation(line: 88, column: 24, scope: !148)
!150 = !DILocation(line: 88, column: 17, scope: !140)
!151 = !DILocation(line: 88, column: 34, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !15, line: 88, column: 33)
!153 = !DILocation(line: 90, column: 20, scope: !154)
!154 = distinct !DILexicalBlock(scope: !140, file: !15, line: 90, column: 13)
!155 = !DILocation(line: 90, column: 18, scope: !154)
!156 = !DILocation(line: 90, column: 25, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !15, line: 90, column: 13)
!158 = !DILocation(line: 90, column: 27, scope: !157)
!159 = !DILocation(line: 90, column: 13, scope: !154)
!160 = !DILocation(line: 92, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !15, line: 91, column: 13)
!162 = !DILocation(line: 92, column: 24, scope: !161)
!163 = !DILocation(line: 92, column: 27, scope: !161)
!164 = !DILocation(line: 93, column: 13, scope: !161)
!165 = !DILocation(line: 90, column: 34, scope: !157)
!166 = !DILocation(line: 90, column: 13, scope: !157)
!167 = distinct !{!167, !159, !168, !63}
!168 = !DILocation(line: 93, column: 13, scope: !154)
!169 = !DILocation(line: 95, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !140, file: !15, line: 95, column: 17)
!171 = !DILocation(line: 95, column: 22, scope: !170)
!172 = !DILocation(line: 95, column: 27, scope: !170)
!173 = !DILocation(line: 95, column: 30, scope: !170)
!174 = !DILocation(line: 95, column: 35, scope: !170)
!175 = !DILocation(line: 95, column: 17, scope: !140)
!176 = !DILocation(line: 97, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !170, file: !15, line: 96, column: 13)
!178 = !DILocation(line: 97, column: 24, scope: !177)
!179 = !DILocation(line: 97, column: 30, scope: !177)
!180 = !DILocation(line: 99, column: 23, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !15, line: 99, column: 17)
!182 = !DILocation(line: 99, column: 21, scope: !181)
!183 = !DILocation(line: 99, column: 28, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !15, line: 99, column: 17)
!185 = !DILocation(line: 99, column: 30, scope: !184)
!186 = !DILocation(line: 99, column: 17, scope: !181)
!187 = !DILocation(line: 101, column: 34, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !15, line: 100, column: 17)
!189 = !DILocation(line: 101, column: 41, scope: !188)
!190 = !DILocation(line: 101, column: 21, scope: !188)
!191 = !DILocation(line: 102, column: 17, scope: !188)
!192 = !DILocation(line: 99, column: 37, scope: !184)
!193 = !DILocation(line: 99, column: 17, scope: !184)
!194 = distinct !{!194, !186, !195, !63}
!195 = !DILocation(line: 102, column: 17, scope: !181)
!196 = !DILocation(line: 103, column: 13, scope: !177)
!197 = !DILocation(line: 106, column: 17, scope: !198)
!198 = distinct !DILexicalBlock(scope: !170, file: !15, line: 105, column: 13)
!199 = !DILocation(line: 108, column: 18, scope: !140)
!200 = !DILocation(line: 108, column: 13, scope: !140)
!201 = !DILocation(line: 111, column: 1, scope: !121)
!202 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!203 = !DILocalVariable(name: "data", scope: !202, file: !15, line: 116, type: !4)
!204 = !DILocation(line: 116, column: 9, scope: !202)
!205 = !DILocation(line: 118, column: 10, scope: !202)
!206 = !DILocation(line: 119, column: 8, scope: !207)
!207 = distinct !DILexicalBlock(scope: !202, file: !15, line: 119, column: 8)
!208 = !DILocation(line: 119, column: 18, scope: !207)
!209 = !DILocation(line: 119, column: 8, scope: !202)
!210 = !DILocation(line: 122, column: 14, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !15, line: 120, column: 5)
!212 = !DILocation(line: 123, column: 5, scope: !211)
!213 = !DILocation(line: 124, column: 8, scope: !214)
!214 = distinct !DILexicalBlock(scope: !202, file: !15, line: 124, column: 8)
!215 = !DILocation(line: 124, column: 18, scope: !214)
!216 = !DILocation(line: 124, column: 8, scope: !202)
!217 = !DILocalVariable(name: "i", scope: !218, file: !15, line: 127, type: !4)
!218 = distinct !DILexicalBlock(scope: !219, file: !15, line: 126, column: 9)
!219 = distinct !DILexicalBlock(scope: !214, file: !15, line: 125, column: 5)
!220 = !DILocation(line: 127, column: 17, scope: !218)
!221 = !DILocalVariable(name: "buffer", scope: !218, file: !15, line: 128, type: !3)
!222 = !DILocation(line: 128, column: 19, scope: !218)
!223 = !DILocation(line: 128, column: 35, scope: !218)
!224 = !DILocation(line: 128, column: 28, scope: !218)
!225 = !DILocation(line: 129, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !218, file: !15, line: 129, column: 17)
!227 = !DILocation(line: 129, column: 24, scope: !226)
!228 = !DILocation(line: 129, column: 17, scope: !218)
!229 = !DILocation(line: 129, column: 34, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !15, line: 129, column: 33)
!231 = !DILocation(line: 131, column: 20, scope: !232)
!232 = distinct !DILexicalBlock(scope: !218, file: !15, line: 131, column: 13)
!233 = !DILocation(line: 131, column: 18, scope: !232)
!234 = !DILocation(line: 131, column: 25, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !15, line: 131, column: 13)
!236 = !DILocation(line: 131, column: 27, scope: !235)
!237 = !DILocation(line: 131, column: 13, scope: !232)
!238 = !DILocation(line: 133, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !15, line: 132, column: 13)
!240 = !DILocation(line: 133, column: 24, scope: !239)
!241 = !DILocation(line: 133, column: 27, scope: !239)
!242 = !DILocation(line: 134, column: 13, scope: !239)
!243 = !DILocation(line: 131, column: 34, scope: !235)
!244 = !DILocation(line: 131, column: 13, scope: !235)
!245 = distinct !{!245, !237, !246, !63}
!246 = !DILocation(line: 134, column: 13, scope: !232)
!247 = !DILocation(line: 136, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !218, file: !15, line: 136, column: 17)
!249 = !DILocation(line: 136, column: 22, scope: !248)
!250 = !DILocation(line: 136, column: 27, scope: !248)
!251 = !DILocation(line: 136, column: 30, scope: !248)
!252 = !DILocation(line: 136, column: 35, scope: !248)
!253 = !DILocation(line: 136, column: 17, scope: !218)
!254 = !DILocation(line: 138, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !248, file: !15, line: 137, column: 13)
!256 = !DILocation(line: 138, column: 24, scope: !255)
!257 = !DILocation(line: 138, column: 30, scope: !255)
!258 = !DILocation(line: 140, column: 23, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !15, line: 140, column: 17)
!260 = !DILocation(line: 140, column: 21, scope: !259)
!261 = !DILocation(line: 140, column: 28, scope: !262)
!262 = distinct !DILexicalBlock(scope: !259, file: !15, line: 140, column: 17)
!263 = !DILocation(line: 140, column: 30, scope: !262)
!264 = !DILocation(line: 140, column: 17, scope: !259)
!265 = !DILocation(line: 142, column: 34, scope: !266)
!266 = distinct !DILexicalBlock(scope: !262, file: !15, line: 141, column: 17)
!267 = !DILocation(line: 142, column: 41, scope: !266)
!268 = !DILocation(line: 142, column: 21, scope: !266)
!269 = !DILocation(line: 143, column: 17, scope: !266)
!270 = !DILocation(line: 140, column: 37, scope: !262)
!271 = !DILocation(line: 140, column: 17, scope: !262)
!272 = distinct !{!272, !264, !273, !63}
!273 = !DILocation(line: 143, column: 17, scope: !259)
!274 = !DILocation(line: 144, column: 13, scope: !255)
!275 = !DILocation(line: 147, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !248, file: !15, line: 146, column: 13)
!277 = !DILocation(line: 149, column: 18, scope: !218)
!278 = !DILocation(line: 149, column: 13, scope: !218)
!279 = !DILocation(line: 151, column: 5, scope: !219)
!280 = !DILocation(line: 152, column: 1, scope: !202)
!281 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 155, type: !16, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!282 = !DILocalVariable(name: "data", scope: !281, file: !15, line: 157, type: !4)
!283 = !DILocation(line: 157, column: 9, scope: !281)
!284 = !DILocation(line: 159, column: 10, scope: !281)
!285 = !DILocation(line: 160, column: 8, scope: !286)
!286 = distinct !DILexicalBlock(scope: !281, file: !15, line: 160, column: 8)
!287 = !DILocation(line: 160, column: 18, scope: !286)
!288 = !DILocation(line: 160, column: 8, scope: !281)
!289 = !DILocation(line: 163, column: 9, scope: !290)
!290 = distinct !DILexicalBlock(scope: !286, file: !15, line: 161, column: 5)
!291 = !DILocation(line: 164, column: 5, scope: !290)
!292 = !DILocation(line: 169, column: 14, scope: !293)
!293 = distinct !DILexicalBlock(scope: !286, file: !15, line: 166, column: 5)
!294 = !DILocation(line: 171, column: 8, scope: !295)
!295 = distinct !DILexicalBlock(scope: !281, file: !15, line: 171, column: 8)
!296 = !DILocation(line: 171, column: 18, scope: !295)
!297 = !DILocation(line: 171, column: 8, scope: !281)
!298 = !DILocalVariable(name: "i", scope: !299, file: !15, line: 174, type: !4)
!299 = distinct !DILexicalBlock(scope: !300, file: !15, line: 173, column: 9)
!300 = distinct !DILexicalBlock(scope: !295, file: !15, line: 172, column: 5)
!301 = !DILocation(line: 174, column: 17, scope: !299)
!302 = !DILocalVariable(name: "buffer", scope: !299, file: !15, line: 175, type: !3)
!303 = !DILocation(line: 175, column: 19, scope: !299)
!304 = !DILocation(line: 175, column: 35, scope: !299)
!305 = !DILocation(line: 175, column: 28, scope: !299)
!306 = !DILocation(line: 176, column: 17, scope: !307)
!307 = distinct !DILexicalBlock(scope: !299, file: !15, line: 176, column: 17)
!308 = !DILocation(line: 176, column: 24, scope: !307)
!309 = !DILocation(line: 176, column: 17, scope: !299)
!310 = !DILocation(line: 176, column: 34, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !15, line: 176, column: 33)
!312 = !DILocation(line: 178, column: 20, scope: !313)
!313 = distinct !DILexicalBlock(scope: !299, file: !15, line: 178, column: 13)
!314 = !DILocation(line: 178, column: 18, scope: !313)
!315 = !DILocation(line: 178, column: 25, scope: !316)
!316 = distinct !DILexicalBlock(scope: !313, file: !15, line: 178, column: 13)
!317 = !DILocation(line: 178, column: 27, scope: !316)
!318 = !DILocation(line: 178, column: 13, scope: !313)
!319 = !DILocation(line: 180, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !15, line: 179, column: 13)
!321 = !DILocation(line: 180, column: 24, scope: !320)
!322 = !DILocation(line: 180, column: 27, scope: !320)
!323 = !DILocation(line: 181, column: 13, scope: !320)
!324 = !DILocation(line: 178, column: 34, scope: !316)
!325 = !DILocation(line: 178, column: 13, scope: !316)
!326 = distinct !{!326, !318, !327, !63}
!327 = !DILocation(line: 181, column: 13, scope: !313)
!328 = !DILocation(line: 184, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !299, file: !15, line: 184, column: 17)
!330 = !DILocation(line: 184, column: 22, scope: !329)
!331 = !DILocation(line: 184, column: 17, scope: !299)
!332 = !DILocation(line: 186, column: 17, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !15, line: 185, column: 13)
!334 = !DILocation(line: 186, column: 24, scope: !333)
!335 = !DILocation(line: 186, column: 30, scope: !333)
!336 = !DILocation(line: 188, column: 23, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !15, line: 188, column: 17)
!338 = !DILocation(line: 188, column: 21, scope: !337)
!339 = !DILocation(line: 188, column: 28, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !15, line: 188, column: 17)
!341 = !DILocation(line: 188, column: 30, scope: !340)
!342 = !DILocation(line: 188, column: 17, scope: !337)
!343 = !DILocation(line: 190, column: 34, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !15, line: 189, column: 17)
!345 = !DILocation(line: 190, column: 41, scope: !344)
!346 = !DILocation(line: 190, column: 21, scope: !344)
!347 = !DILocation(line: 191, column: 17, scope: !344)
!348 = !DILocation(line: 188, column: 37, scope: !340)
!349 = !DILocation(line: 188, column: 17, scope: !340)
!350 = distinct !{!350, !342, !351, !63}
!351 = !DILocation(line: 191, column: 17, scope: !337)
!352 = !DILocation(line: 192, column: 13, scope: !333)
!353 = !DILocation(line: 195, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !329, file: !15, line: 194, column: 13)
!355 = !DILocation(line: 197, column: 18, scope: !299)
!356 = !DILocation(line: 197, column: 13, scope: !299)
!357 = !DILocation(line: 199, column: 5, scope: !300)
!358 = !DILocation(line: 200, column: 1, scope: !281)
!359 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 203, type: !16, scopeLine: 204, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!360 = !DILocalVariable(name: "data", scope: !359, file: !15, line: 205, type: !4)
!361 = !DILocation(line: 205, column: 9, scope: !359)
!362 = !DILocation(line: 207, column: 10, scope: !359)
!363 = !DILocation(line: 208, column: 8, scope: !364)
!364 = distinct !DILexicalBlock(scope: !359, file: !15, line: 208, column: 8)
!365 = !DILocation(line: 208, column: 18, scope: !364)
!366 = !DILocation(line: 208, column: 8, scope: !359)
!367 = !DILocation(line: 212, column: 14, scope: !368)
!368 = distinct !DILexicalBlock(scope: !364, file: !15, line: 209, column: 5)
!369 = !DILocation(line: 213, column: 5, scope: !368)
!370 = !DILocation(line: 214, column: 8, scope: !371)
!371 = distinct !DILexicalBlock(scope: !359, file: !15, line: 214, column: 8)
!372 = !DILocation(line: 214, column: 18, scope: !371)
!373 = !DILocation(line: 214, column: 8, scope: !359)
!374 = !DILocalVariable(name: "i", scope: !375, file: !15, line: 217, type: !4)
!375 = distinct !DILexicalBlock(scope: !376, file: !15, line: 216, column: 9)
!376 = distinct !DILexicalBlock(scope: !371, file: !15, line: 215, column: 5)
!377 = !DILocation(line: 217, column: 17, scope: !375)
!378 = !DILocalVariable(name: "buffer", scope: !375, file: !15, line: 218, type: !3)
!379 = !DILocation(line: 218, column: 19, scope: !375)
!380 = !DILocation(line: 218, column: 35, scope: !375)
!381 = !DILocation(line: 218, column: 28, scope: !375)
!382 = !DILocation(line: 219, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !375, file: !15, line: 219, column: 17)
!384 = !DILocation(line: 219, column: 24, scope: !383)
!385 = !DILocation(line: 219, column: 17, scope: !375)
!386 = !DILocation(line: 219, column: 34, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !15, line: 219, column: 33)
!388 = !DILocation(line: 221, column: 20, scope: !389)
!389 = distinct !DILexicalBlock(scope: !375, file: !15, line: 221, column: 13)
!390 = !DILocation(line: 221, column: 18, scope: !389)
!391 = !DILocation(line: 221, column: 25, scope: !392)
!392 = distinct !DILexicalBlock(scope: !389, file: !15, line: 221, column: 13)
!393 = !DILocation(line: 221, column: 27, scope: !392)
!394 = !DILocation(line: 221, column: 13, scope: !389)
!395 = !DILocation(line: 223, column: 17, scope: !396)
!396 = distinct !DILexicalBlock(scope: !392, file: !15, line: 222, column: 13)
!397 = !DILocation(line: 223, column: 24, scope: !396)
!398 = !DILocation(line: 223, column: 27, scope: !396)
!399 = !DILocation(line: 224, column: 13, scope: !396)
!400 = !DILocation(line: 221, column: 34, scope: !392)
!401 = !DILocation(line: 221, column: 13, scope: !392)
!402 = distinct !{!402, !394, !403, !63}
!403 = !DILocation(line: 224, column: 13, scope: !389)
!404 = !DILocation(line: 227, column: 17, scope: !405)
!405 = distinct !DILexicalBlock(scope: !375, file: !15, line: 227, column: 17)
!406 = !DILocation(line: 227, column: 22, scope: !405)
!407 = !DILocation(line: 227, column: 17, scope: !375)
!408 = !DILocation(line: 229, column: 17, scope: !409)
!409 = distinct !DILexicalBlock(scope: !405, file: !15, line: 228, column: 13)
!410 = !DILocation(line: 229, column: 24, scope: !409)
!411 = !DILocation(line: 229, column: 30, scope: !409)
!412 = !DILocation(line: 231, column: 23, scope: !413)
!413 = distinct !DILexicalBlock(scope: !409, file: !15, line: 231, column: 17)
!414 = !DILocation(line: 231, column: 21, scope: !413)
!415 = !DILocation(line: 231, column: 28, scope: !416)
!416 = distinct !DILexicalBlock(scope: !413, file: !15, line: 231, column: 17)
!417 = !DILocation(line: 231, column: 30, scope: !416)
!418 = !DILocation(line: 231, column: 17, scope: !413)
!419 = !DILocation(line: 233, column: 34, scope: !420)
!420 = distinct !DILexicalBlock(scope: !416, file: !15, line: 232, column: 17)
!421 = !DILocation(line: 233, column: 41, scope: !420)
!422 = !DILocation(line: 233, column: 21, scope: !420)
!423 = !DILocation(line: 234, column: 17, scope: !420)
!424 = !DILocation(line: 231, column: 37, scope: !416)
!425 = !DILocation(line: 231, column: 17, scope: !416)
!426 = distinct !{!426, !418, !427, !63}
!427 = !DILocation(line: 234, column: 17, scope: !413)
!428 = !DILocation(line: 235, column: 13, scope: !409)
!429 = !DILocation(line: 238, column: 17, scope: !430)
!430 = distinct !DILexicalBlock(scope: !405, file: !15, line: 237, column: 13)
!431 = !DILocation(line: 240, column: 18, scope: !375)
!432 = !DILocation(line: 240, column: 13, scope: !375)
!433 = !DILocation(line: 242, column: 5, scope: !376)
!434 = !DILocation(line: 243, column: 1, scope: !359)
