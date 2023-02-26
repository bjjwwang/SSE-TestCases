; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !29
  br label %if.end, !dbg !31

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp1 = icmp eq i32 %1, 5, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !35

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !36, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !40, metadata !DIExpression()), !dbg !41
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !42
  %2 = bitcast i8* %call to i32*, !dbg !43
  store i32* %2, i32** %buffer, align 8, !dbg !41
  %3 = load i32*, i32** %buffer, align 8, !dbg !44
  %cmp3 = icmp eq i32* %3, null, !dbg !46
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !47

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !48
  unreachable, !dbg !48

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !53
  %cmp6 = icmp slt i32 %4, 10, !dbg !55
  br i1 %cmp6, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !57
  %6 = load i32, i32* %i, align 4, !dbg !59
  %idxprom = sext i32 %6 to i64, !dbg !57
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !57
  store i32 0, i32* %arrayidx, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !62
  %inc = add nsw i32 %7, 1, !dbg !62
  store i32 %inc, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !67
  %cmp7 = icmp sge i32 %8, 0, !dbg !69
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !70

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !71
  %10 = load i32, i32* %data, align 4, !dbg !73
  %idxprom9 = sext i32 %10 to i64, !dbg !71
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !71
  store i32 1, i32* %arrayidx10, align 4, !dbg !74
  store i32 0, i32* %i, align 4, !dbg !75
  br label %for.cond11, !dbg !77

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !78
  %cmp12 = icmp slt i32 %11, 10, !dbg !80
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !81

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !82
  %13 = load i32, i32* %i, align 4, !dbg !84
  %idxprom14 = sext i32 %13 to i64, !dbg !82
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !82
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !82
  call void @printIntLine(i32 noundef %14), !dbg !85
  br label %for.inc16, !dbg !86

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !87
  %inc17 = add nsw i32 %15, 1, !dbg !87
  store i32 %inc17, i32* %i, align 4, !dbg !87
  br label %for.cond11, !dbg !88, !llvm.loop !89

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !91

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !92
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !94
  %17 = bitcast i32* %16 to i8*, !dbg !94
  call void @free(i8* noundef %17), !dbg !95
  br label %if.end20, !dbg !96

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !97
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_good() #0 !dbg !98 {
entry:
  call void @goodB2G1(), !dbg !99
  call void @goodB2G2(), !dbg !100
  call void @goodG2B1(), !dbg !101
  call void @goodG2B2(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @time(i64* noundef null), !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 noundef %conv), !dbg !116
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_good(), !dbg !118
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_bad(), !dbg !121
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !124 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 -1, i32* %data, align 4, !dbg !127
  %0 = load i32, i32* @staticFive, align 4, !dbg !128
  %cmp = icmp eq i32 %0, 5, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !132
  br label %if.end, !dbg !134

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !135
  %cmp1 = icmp ne i32 %1, 5, !dbg !137
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !138

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !139
  br label %if.end22, !dbg !141

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !142, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !146, metadata !DIExpression()), !dbg !147
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !148
  %2 = bitcast i8* %call to i32*, !dbg !149
  store i32* %2, i32** %buffer, align 8, !dbg !147
  %3 = load i32*, i32** %buffer, align 8, !dbg !150
  %cmp3 = icmp eq i32* %3, null, !dbg !152
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !153

if.then4:                                         ; preds = %if.else
  call void @exit(i32 noundef -1) #6, !dbg !154
  unreachable, !dbg !154

if.end5:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !159
  %cmp6 = icmp slt i32 %4, 10, !dbg !161
  br i1 %cmp6, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !163
  %6 = load i32, i32* %i, align 4, !dbg !165
  %idxprom = sext i32 %6 to i64, !dbg !163
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !163
  store i32 0, i32* %arrayidx, align 4, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !168
  %inc = add nsw i32 %7, 1, !dbg !168
  store i32 %inc, i32* %i, align 4, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !172
  %cmp7 = icmp sge i32 %8, 0, !dbg !174
  br i1 %cmp7, label %land.lhs.true, label %if.else20, !dbg !175

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !176
  %cmp8 = icmp slt i32 %9, 10, !dbg !177
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !178

if.then9:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !179
  %11 = load i32, i32* %data, align 4, !dbg !181
  %idxprom10 = sext i32 %11 to i64, !dbg !179
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !179
  store i32 1, i32* %arrayidx11, align 4, !dbg !182
  store i32 0, i32* %i, align 4, !dbg !183
  br label %for.cond12, !dbg !185

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %12 = load i32, i32* %i, align 4, !dbg !186
  %cmp13 = icmp slt i32 %12, 10, !dbg !188
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !189

for.body14:                                       ; preds = %for.cond12
  %13 = load i32*, i32** %buffer, align 8, !dbg !190
  %14 = load i32, i32* %i, align 4, !dbg !192
  %idxprom15 = sext i32 %14 to i64, !dbg !190
  %arrayidx16 = getelementptr inbounds i32, i32* %13, i64 %idxprom15, !dbg !190
  %15 = load i32, i32* %arrayidx16, align 4, !dbg !190
  call void @printIntLine(i32 noundef %15), !dbg !193
  br label %for.inc17, !dbg !194

for.inc17:                                        ; preds = %for.body14
  %16 = load i32, i32* %i, align 4, !dbg !195
  %inc18 = add nsw i32 %16, 1, !dbg !195
  store i32 %inc18, i32* %i, align 4, !dbg !195
  br label %for.cond12, !dbg !196, !llvm.loop !197

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !199

if.else20:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !200
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %17 = load i32*, i32** %buffer, align 8, !dbg !202
  %18 = bitcast i32* %17 to i8*, !dbg !202
  call void @free(i8* noundef %18), !dbg !203
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.then2
  ret void, !dbg !204
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !205 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !206, metadata !DIExpression()), !dbg !207
  store i32 -1, i32* %data, align 4, !dbg !208
  %0 = load i32, i32* @staticFive, align 4, !dbg !209
  %cmp = icmp eq i32 %0, 5, !dbg !211
  br i1 %cmp, label %if.then, label %if.end, !dbg !212

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !213
  br label %if.end, !dbg !215

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !216
  %cmp1 = icmp eq i32 %1, 5, !dbg !218
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !219

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !220, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !224, metadata !DIExpression()), !dbg !225
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !226
  %2 = bitcast i8* %call to i32*, !dbg !227
  store i32* %2, i32** %buffer, align 8, !dbg !225
  %3 = load i32*, i32** %buffer, align 8, !dbg !228
  %cmp3 = icmp eq i32* %3, null, !dbg !230
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !231

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !232
  unreachable, !dbg !232

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !234
  br label %for.cond, !dbg !236

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !237
  %cmp6 = icmp slt i32 %4, 10, !dbg !239
  br i1 %cmp6, label %for.body, label %for.end, !dbg !240

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !241
  %6 = load i32, i32* %i, align 4, !dbg !243
  %idxprom = sext i32 %6 to i64, !dbg !241
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !241
  store i32 0, i32* %arrayidx, align 4, !dbg !244
  br label %for.inc, !dbg !245

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !246
  %inc = add nsw i32 %7, 1, !dbg !246
  store i32 %inc, i32* %i, align 4, !dbg !246
  br label %for.cond, !dbg !247, !llvm.loop !248

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !250
  %cmp7 = icmp sge i32 %8, 0, !dbg !252
  br i1 %cmp7, label %land.lhs.true, label %if.else, !dbg !253

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !254
  %cmp8 = icmp slt i32 %9, 10, !dbg !255
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !256

if.then9:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !257
  %11 = load i32, i32* %data, align 4, !dbg !259
  %idxprom10 = sext i32 %11 to i64, !dbg !257
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !257
  store i32 1, i32* %arrayidx11, align 4, !dbg !260
  store i32 0, i32* %i, align 4, !dbg !261
  br label %for.cond12, !dbg !263

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %12 = load i32, i32* %i, align 4, !dbg !264
  %cmp13 = icmp slt i32 %12, 10, !dbg !266
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !267

for.body14:                                       ; preds = %for.cond12
  %13 = load i32*, i32** %buffer, align 8, !dbg !268
  %14 = load i32, i32* %i, align 4, !dbg !270
  %idxprom15 = sext i32 %14 to i64, !dbg !268
  %arrayidx16 = getelementptr inbounds i32, i32* %13, i64 %idxprom15, !dbg !268
  %15 = load i32, i32* %arrayidx16, align 4, !dbg !268
  call void @printIntLine(i32 noundef %15), !dbg !271
  br label %for.inc17, !dbg !272

for.inc17:                                        ; preds = %for.body14
  %16 = load i32, i32* %i, align 4, !dbg !273
  %inc18 = add nsw i32 %16, 1, !dbg !273
  store i32 %inc18, i32* %i, align 4, !dbg !273
  br label %for.cond12, !dbg !274, !llvm.loop !275

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !277

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !278
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %17 = load i32*, i32** %buffer, align 8, !dbg !280
  %18 = bitcast i32* %17 to i8*, !dbg !280
  call void @free(i8* noundef %18), !dbg !281
  br label %if.end21, !dbg !282

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !283
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !284 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !285, metadata !DIExpression()), !dbg !286
  store i32 -1, i32* %data, align 4, !dbg !287
  %0 = load i32, i32* @staticFive, align 4, !dbg !288
  %cmp = icmp ne i32 %0, 5, !dbg !290
  br i1 %cmp, label %if.then, label %if.else, !dbg !291

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !292
  br label %if.end, !dbg !294

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !295
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !297
  %cmp1 = icmp eq i32 %1, 5, !dbg !299
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !300

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !301, metadata !DIExpression()), !dbg !304
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !305, metadata !DIExpression()), !dbg !306
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !307
  %2 = bitcast i8* %call to i32*, !dbg !308
  store i32* %2, i32** %buffer, align 8, !dbg !306
  %3 = load i32*, i32** %buffer, align 8, !dbg !309
  %cmp3 = icmp eq i32* %3, null, !dbg !311
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !312

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !313
  unreachable, !dbg !313

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !315
  br label %for.cond, !dbg !317

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !318
  %cmp6 = icmp slt i32 %4, 10, !dbg !320
  br i1 %cmp6, label %for.body, label %for.end, !dbg !321

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !322
  %6 = load i32, i32* %i, align 4, !dbg !324
  %idxprom = sext i32 %6 to i64, !dbg !322
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !322
  store i32 0, i32* %arrayidx, align 4, !dbg !325
  br label %for.inc, !dbg !326

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !327
  %inc = add nsw i32 %7, 1, !dbg !327
  store i32 %inc, i32* %i, align 4, !dbg !327
  br label %for.cond, !dbg !328, !llvm.loop !329

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !331
  %cmp7 = icmp sge i32 %8, 0, !dbg !333
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !334

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !335
  %10 = load i32, i32* %data, align 4, !dbg !337
  %idxprom9 = sext i32 %10 to i64, !dbg !335
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !335
  store i32 1, i32* %arrayidx10, align 4, !dbg !338
  store i32 0, i32* %i, align 4, !dbg !339
  br label %for.cond11, !dbg !341

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !342
  %cmp12 = icmp slt i32 %11, 10, !dbg !344
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !345

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !346
  %13 = load i32, i32* %i, align 4, !dbg !348
  %idxprom14 = sext i32 %13 to i64, !dbg !346
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !346
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !346
  call void @printIntLine(i32 noundef %14), !dbg !349
  br label %for.inc16, !dbg !350

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !351
  %inc17 = add nsw i32 %15, 1, !dbg !351
  store i32 %inc17, i32* %i, align 4, !dbg !351
  br label %for.cond11, !dbg !352, !llvm.loop !353

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !355

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !356
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !358
  %17 = bitcast i32* %16 to i8*, !dbg !358
  call void @free(i8* noundef %17), !dbg !359
  br label %if.end21, !dbg !360

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !361
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !362 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !363, metadata !DIExpression()), !dbg !364
  store i32 -1, i32* %data, align 4, !dbg !365
  %0 = load i32, i32* @staticFive, align 4, !dbg !366
  %cmp = icmp eq i32 %0, 5, !dbg !368
  br i1 %cmp, label %if.then, label %if.end, !dbg !369

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !370
  br label %if.end, !dbg !372

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !373
  %cmp1 = icmp eq i32 %1, 5, !dbg !375
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !376

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !377, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !381, metadata !DIExpression()), !dbg !382
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !383
  %2 = bitcast i8* %call to i32*, !dbg !384
  store i32* %2, i32** %buffer, align 8, !dbg !382
  %3 = load i32*, i32** %buffer, align 8, !dbg !385
  %cmp3 = icmp eq i32* %3, null, !dbg !387
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !388

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !389
  unreachable, !dbg !389

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !391
  br label %for.cond, !dbg !393

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !394
  %cmp6 = icmp slt i32 %4, 10, !dbg !396
  br i1 %cmp6, label %for.body, label %for.end, !dbg !397

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !398
  %6 = load i32, i32* %i, align 4, !dbg !400
  %idxprom = sext i32 %6 to i64, !dbg !398
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !398
  store i32 0, i32* %arrayidx, align 4, !dbg !401
  br label %for.inc, !dbg !402

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !403
  %inc = add nsw i32 %7, 1, !dbg !403
  store i32 %inc, i32* %i, align 4, !dbg !403
  br label %for.cond, !dbg !404, !llvm.loop !405

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !407
  %cmp7 = icmp sge i32 %8, 0, !dbg !409
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !410

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !411
  %10 = load i32, i32* %data, align 4, !dbg !413
  %idxprom9 = sext i32 %10 to i64, !dbg !411
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !411
  store i32 1, i32* %arrayidx10, align 4, !dbg !414
  store i32 0, i32* %i, align 4, !dbg !415
  br label %for.cond11, !dbg !417

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !418
  %cmp12 = icmp slt i32 %11, 10, !dbg !420
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !421

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !422
  %13 = load i32, i32* %i, align 4, !dbg !424
  %idxprom14 = sext i32 %13 to i64, !dbg !422
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !422
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !422
  call void @printIntLine(i32 noundef %14), !dbg !425
  br label %for.inc16, !dbg !426

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !427
  %inc17 = add nsw i32 %15, 1, !dbg !427
  store i32 %inc17, i32* %i, align 4, !dbg !427
  br label %for.cond11, !dbg !428, !llvm.loop !429

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !431

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !432
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !434
  %17 = bitcast i32* %16 to i8*, !dbg !434
  call void @free(i8* noundef %17), !dbg !435
  br label %if.end20, !dbg !436

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !437
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 23, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_bad", scope: !10, file: !10, line: 27, type: !19, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 29, type: !6)
!23 = !DILocation(line: 29, column: 9, scope: !18)
!24 = !DILocation(line: 31, column: 10, scope: !18)
!25 = !DILocation(line: 32, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !10, line: 32, column: 8)
!27 = !DILocation(line: 32, column: 18, scope: !26)
!28 = !DILocation(line: 32, column: 8, scope: !18)
!29 = !DILocation(line: 35, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !10, line: 33, column: 5)
!31 = !DILocation(line: 36, column: 5, scope: !30)
!32 = !DILocation(line: 37, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !10, line: 37, column: 8)
!34 = !DILocation(line: 37, column: 18, scope: !33)
!35 = !DILocation(line: 37, column: 8, scope: !18)
!36 = !DILocalVariable(name: "i", scope: !37, file: !10, line: 40, type: !6)
!37 = distinct !DILexicalBlock(scope: !38, file: !10, line: 39, column: 9)
!38 = distinct !DILexicalBlock(scope: !33, file: !10, line: 38, column: 5)
!39 = !DILocation(line: 40, column: 17, scope: !37)
!40 = !DILocalVariable(name: "buffer", scope: !37, file: !10, line: 41, type: !5)
!41 = !DILocation(line: 41, column: 19, scope: !37)
!42 = !DILocation(line: 41, column: 35, scope: !37)
!43 = !DILocation(line: 41, column: 28, scope: !37)
!44 = !DILocation(line: 42, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !37, file: !10, line: 42, column: 17)
!46 = !DILocation(line: 42, column: 24, scope: !45)
!47 = !DILocation(line: 42, column: 17, scope: !37)
!48 = !DILocation(line: 42, column: 34, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !10, line: 42, column: 33)
!50 = !DILocation(line: 44, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !37, file: !10, line: 44, column: 13)
!52 = !DILocation(line: 44, column: 18, scope: !51)
!53 = !DILocation(line: 44, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !10, line: 44, column: 13)
!55 = !DILocation(line: 44, column: 27, scope: !54)
!56 = !DILocation(line: 44, column: 13, scope: !51)
!57 = !DILocation(line: 46, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !10, line: 45, column: 13)
!59 = !DILocation(line: 46, column: 24, scope: !58)
!60 = !DILocation(line: 46, column: 27, scope: !58)
!61 = !DILocation(line: 47, column: 13, scope: !58)
!62 = !DILocation(line: 44, column: 34, scope: !54)
!63 = !DILocation(line: 44, column: 13, scope: !54)
!64 = distinct !{!64, !56, !65, !66}
!65 = !DILocation(line: 47, column: 13, scope: !51)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 50, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !37, file: !10, line: 50, column: 17)
!69 = !DILocation(line: 50, column: 22, scope: !68)
!70 = !DILocation(line: 50, column: 17, scope: !37)
!71 = !DILocation(line: 52, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !10, line: 51, column: 13)
!73 = !DILocation(line: 52, column: 24, scope: !72)
!74 = !DILocation(line: 52, column: 30, scope: !72)
!75 = !DILocation(line: 54, column: 23, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !10, line: 54, column: 17)
!77 = !DILocation(line: 54, column: 21, scope: !76)
!78 = !DILocation(line: 54, column: 28, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !10, line: 54, column: 17)
!80 = !DILocation(line: 54, column: 30, scope: !79)
!81 = !DILocation(line: 54, column: 17, scope: !76)
!82 = !DILocation(line: 56, column: 34, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !10, line: 55, column: 17)
!84 = !DILocation(line: 56, column: 41, scope: !83)
!85 = !DILocation(line: 56, column: 21, scope: !83)
!86 = !DILocation(line: 57, column: 17, scope: !83)
!87 = !DILocation(line: 54, column: 37, scope: !79)
!88 = !DILocation(line: 54, column: 17, scope: !79)
!89 = distinct !{!89, !81, !90, !66}
!90 = !DILocation(line: 57, column: 17, scope: !76)
!91 = !DILocation(line: 58, column: 13, scope: !72)
!92 = !DILocation(line: 61, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !68, file: !10, line: 60, column: 13)
!94 = !DILocation(line: 63, column: 18, scope: !37)
!95 = !DILocation(line: 63, column: 13, scope: !37)
!96 = !DILocation(line: 65, column: 5, scope: !38)
!97 = !DILocation(line: 66, column: 1, scope: !18)
!98 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_07_good", scope: !10, file: !10, line: 250, type: !19, scopeLine: 251, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!99 = !DILocation(line: 252, column: 5, scope: !98)
!100 = !DILocation(line: 253, column: 5, scope: !98)
!101 = !DILocation(line: 254, column: 5, scope: !98)
!102 = !DILocation(line: 255, column: 5, scope: !98)
!103 = !DILocation(line: 256, column: 1, scope: !98)
!104 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 267, type: !105, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!105 = !DISubroutineType(types: !106)
!106 = !{!6, !6, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !10, line: 267, type: !6)
!111 = !DILocation(line: 267, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !10, line: 267, type: !107)
!113 = !DILocation(line: 267, column: 27, scope: !104)
!114 = !DILocation(line: 270, column: 22, scope: !104)
!115 = !DILocation(line: 270, column: 12, scope: !104)
!116 = !DILocation(line: 270, column: 5, scope: !104)
!117 = !DILocation(line: 272, column: 5, scope: !104)
!118 = !DILocation(line: 273, column: 5, scope: !104)
!119 = !DILocation(line: 274, column: 5, scope: !104)
!120 = !DILocation(line: 277, column: 5, scope: !104)
!121 = !DILocation(line: 278, column: 5, scope: !104)
!122 = !DILocation(line: 279, column: 5, scope: !104)
!123 = !DILocation(line: 281, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodB2G1", scope: !10, file: !10, line: 73, type: !19, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!125 = !DILocalVariable(name: "data", scope: !124, file: !10, line: 75, type: !6)
!126 = !DILocation(line: 75, column: 9, scope: !124)
!127 = !DILocation(line: 77, column: 10, scope: !124)
!128 = !DILocation(line: 78, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !10, line: 78, column: 8)
!130 = !DILocation(line: 78, column: 18, scope: !129)
!131 = !DILocation(line: 78, column: 8, scope: !124)
!132 = !DILocation(line: 81, column: 14, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !10, line: 79, column: 5)
!134 = !DILocation(line: 82, column: 5, scope: !133)
!135 = !DILocation(line: 83, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !124, file: !10, line: 83, column: 8)
!137 = !DILocation(line: 83, column: 18, scope: !136)
!138 = !DILocation(line: 83, column: 8, scope: !124)
!139 = !DILocation(line: 86, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !10, line: 84, column: 5)
!141 = !DILocation(line: 87, column: 5, scope: !140)
!142 = !DILocalVariable(name: "i", scope: !143, file: !10, line: 91, type: !6)
!143 = distinct !DILexicalBlock(scope: !144, file: !10, line: 90, column: 9)
!144 = distinct !DILexicalBlock(scope: !136, file: !10, line: 89, column: 5)
!145 = !DILocation(line: 91, column: 17, scope: !143)
!146 = !DILocalVariable(name: "buffer", scope: !143, file: !10, line: 92, type: !5)
!147 = !DILocation(line: 92, column: 19, scope: !143)
!148 = !DILocation(line: 92, column: 35, scope: !143)
!149 = !DILocation(line: 92, column: 28, scope: !143)
!150 = !DILocation(line: 93, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !143, file: !10, line: 93, column: 17)
!152 = !DILocation(line: 93, column: 24, scope: !151)
!153 = !DILocation(line: 93, column: 17, scope: !143)
!154 = !DILocation(line: 93, column: 34, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !10, line: 93, column: 33)
!156 = !DILocation(line: 95, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !143, file: !10, line: 95, column: 13)
!158 = !DILocation(line: 95, column: 18, scope: !157)
!159 = !DILocation(line: 95, column: 25, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !10, line: 95, column: 13)
!161 = !DILocation(line: 95, column: 27, scope: !160)
!162 = !DILocation(line: 95, column: 13, scope: !157)
!163 = !DILocation(line: 97, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !10, line: 96, column: 13)
!165 = !DILocation(line: 97, column: 24, scope: !164)
!166 = !DILocation(line: 97, column: 27, scope: !164)
!167 = !DILocation(line: 98, column: 13, scope: !164)
!168 = !DILocation(line: 95, column: 34, scope: !160)
!169 = !DILocation(line: 95, column: 13, scope: !160)
!170 = distinct !{!170, !162, !171, !66}
!171 = !DILocation(line: 98, column: 13, scope: !157)
!172 = !DILocation(line: 100, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !143, file: !10, line: 100, column: 17)
!174 = !DILocation(line: 100, column: 22, scope: !173)
!175 = !DILocation(line: 100, column: 27, scope: !173)
!176 = !DILocation(line: 100, column: 30, scope: !173)
!177 = !DILocation(line: 100, column: 35, scope: !173)
!178 = !DILocation(line: 100, column: 17, scope: !143)
!179 = !DILocation(line: 102, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !173, file: !10, line: 101, column: 13)
!181 = !DILocation(line: 102, column: 24, scope: !180)
!182 = !DILocation(line: 102, column: 30, scope: !180)
!183 = !DILocation(line: 104, column: 23, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !10, line: 104, column: 17)
!185 = !DILocation(line: 104, column: 21, scope: !184)
!186 = !DILocation(line: 104, column: 28, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !10, line: 104, column: 17)
!188 = !DILocation(line: 104, column: 30, scope: !187)
!189 = !DILocation(line: 104, column: 17, scope: !184)
!190 = !DILocation(line: 106, column: 34, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !10, line: 105, column: 17)
!192 = !DILocation(line: 106, column: 41, scope: !191)
!193 = !DILocation(line: 106, column: 21, scope: !191)
!194 = !DILocation(line: 107, column: 17, scope: !191)
!195 = !DILocation(line: 104, column: 37, scope: !187)
!196 = !DILocation(line: 104, column: 17, scope: !187)
!197 = distinct !{!197, !189, !198, !66}
!198 = !DILocation(line: 107, column: 17, scope: !184)
!199 = !DILocation(line: 108, column: 13, scope: !180)
!200 = !DILocation(line: 111, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !173, file: !10, line: 110, column: 13)
!202 = !DILocation(line: 113, column: 18, scope: !143)
!203 = !DILocation(line: 113, column: 13, scope: !143)
!204 = !DILocation(line: 116, column: 1, scope: !124)
!205 = distinct !DISubprogram(name: "goodB2G2", scope: !10, file: !10, line: 119, type: !19, scopeLine: 120, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!206 = !DILocalVariable(name: "data", scope: !205, file: !10, line: 121, type: !6)
!207 = !DILocation(line: 121, column: 9, scope: !205)
!208 = !DILocation(line: 123, column: 10, scope: !205)
!209 = !DILocation(line: 124, column: 8, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !10, line: 124, column: 8)
!211 = !DILocation(line: 124, column: 18, scope: !210)
!212 = !DILocation(line: 124, column: 8, scope: !205)
!213 = !DILocation(line: 127, column: 14, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !10, line: 125, column: 5)
!215 = !DILocation(line: 128, column: 5, scope: !214)
!216 = !DILocation(line: 129, column: 8, scope: !217)
!217 = distinct !DILexicalBlock(scope: !205, file: !10, line: 129, column: 8)
!218 = !DILocation(line: 129, column: 18, scope: !217)
!219 = !DILocation(line: 129, column: 8, scope: !205)
!220 = !DILocalVariable(name: "i", scope: !221, file: !10, line: 132, type: !6)
!221 = distinct !DILexicalBlock(scope: !222, file: !10, line: 131, column: 9)
!222 = distinct !DILexicalBlock(scope: !217, file: !10, line: 130, column: 5)
!223 = !DILocation(line: 132, column: 17, scope: !221)
!224 = !DILocalVariable(name: "buffer", scope: !221, file: !10, line: 133, type: !5)
!225 = !DILocation(line: 133, column: 19, scope: !221)
!226 = !DILocation(line: 133, column: 35, scope: !221)
!227 = !DILocation(line: 133, column: 28, scope: !221)
!228 = !DILocation(line: 134, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !221, file: !10, line: 134, column: 17)
!230 = !DILocation(line: 134, column: 24, scope: !229)
!231 = !DILocation(line: 134, column: 17, scope: !221)
!232 = !DILocation(line: 134, column: 34, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !10, line: 134, column: 33)
!234 = !DILocation(line: 136, column: 20, scope: !235)
!235 = distinct !DILexicalBlock(scope: !221, file: !10, line: 136, column: 13)
!236 = !DILocation(line: 136, column: 18, scope: !235)
!237 = !DILocation(line: 136, column: 25, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !10, line: 136, column: 13)
!239 = !DILocation(line: 136, column: 27, scope: !238)
!240 = !DILocation(line: 136, column: 13, scope: !235)
!241 = !DILocation(line: 138, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !10, line: 137, column: 13)
!243 = !DILocation(line: 138, column: 24, scope: !242)
!244 = !DILocation(line: 138, column: 27, scope: !242)
!245 = !DILocation(line: 139, column: 13, scope: !242)
!246 = !DILocation(line: 136, column: 34, scope: !238)
!247 = !DILocation(line: 136, column: 13, scope: !238)
!248 = distinct !{!248, !240, !249, !66}
!249 = !DILocation(line: 139, column: 13, scope: !235)
!250 = !DILocation(line: 141, column: 17, scope: !251)
!251 = distinct !DILexicalBlock(scope: !221, file: !10, line: 141, column: 17)
!252 = !DILocation(line: 141, column: 22, scope: !251)
!253 = !DILocation(line: 141, column: 27, scope: !251)
!254 = !DILocation(line: 141, column: 30, scope: !251)
!255 = !DILocation(line: 141, column: 35, scope: !251)
!256 = !DILocation(line: 141, column: 17, scope: !221)
!257 = !DILocation(line: 143, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !251, file: !10, line: 142, column: 13)
!259 = !DILocation(line: 143, column: 24, scope: !258)
!260 = !DILocation(line: 143, column: 30, scope: !258)
!261 = !DILocation(line: 145, column: 23, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !10, line: 145, column: 17)
!263 = !DILocation(line: 145, column: 21, scope: !262)
!264 = !DILocation(line: 145, column: 28, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !10, line: 145, column: 17)
!266 = !DILocation(line: 145, column: 30, scope: !265)
!267 = !DILocation(line: 145, column: 17, scope: !262)
!268 = !DILocation(line: 147, column: 34, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !10, line: 146, column: 17)
!270 = !DILocation(line: 147, column: 41, scope: !269)
!271 = !DILocation(line: 147, column: 21, scope: !269)
!272 = !DILocation(line: 148, column: 17, scope: !269)
!273 = !DILocation(line: 145, column: 37, scope: !265)
!274 = !DILocation(line: 145, column: 17, scope: !265)
!275 = distinct !{!275, !267, !276, !66}
!276 = !DILocation(line: 148, column: 17, scope: !262)
!277 = !DILocation(line: 149, column: 13, scope: !258)
!278 = !DILocation(line: 152, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !251, file: !10, line: 151, column: 13)
!280 = !DILocation(line: 154, column: 18, scope: !221)
!281 = !DILocation(line: 154, column: 13, scope: !221)
!282 = !DILocation(line: 156, column: 5, scope: !222)
!283 = !DILocation(line: 157, column: 1, scope: !205)
!284 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 160, type: !19, scopeLine: 161, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!285 = !DILocalVariable(name: "data", scope: !284, file: !10, line: 162, type: !6)
!286 = !DILocation(line: 162, column: 9, scope: !284)
!287 = !DILocation(line: 164, column: 10, scope: !284)
!288 = !DILocation(line: 165, column: 8, scope: !289)
!289 = distinct !DILexicalBlock(scope: !284, file: !10, line: 165, column: 8)
!290 = !DILocation(line: 165, column: 18, scope: !289)
!291 = !DILocation(line: 165, column: 8, scope: !284)
!292 = !DILocation(line: 168, column: 9, scope: !293)
!293 = distinct !DILexicalBlock(scope: !289, file: !10, line: 166, column: 5)
!294 = !DILocation(line: 169, column: 5, scope: !293)
!295 = !DILocation(line: 174, column: 14, scope: !296)
!296 = distinct !DILexicalBlock(scope: !289, file: !10, line: 171, column: 5)
!297 = !DILocation(line: 176, column: 8, scope: !298)
!298 = distinct !DILexicalBlock(scope: !284, file: !10, line: 176, column: 8)
!299 = !DILocation(line: 176, column: 18, scope: !298)
!300 = !DILocation(line: 176, column: 8, scope: !284)
!301 = !DILocalVariable(name: "i", scope: !302, file: !10, line: 179, type: !6)
!302 = distinct !DILexicalBlock(scope: !303, file: !10, line: 178, column: 9)
!303 = distinct !DILexicalBlock(scope: !298, file: !10, line: 177, column: 5)
!304 = !DILocation(line: 179, column: 17, scope: !302)
!305 = !DILocalVariable(name: "buffer", scope: !302, file: !10, line: 180, type: !5)
!306 = !DILocation(line: 180, column: 19, scope: !302)
!307 = !DILocation(line: 180, column: 35, scope: !302)
!308 = !DILocation(line: 180, column: 28, scope: !302)
!309 = !DILocation(line: 181, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !302, file: !10, line: 181, column: 17)
!311 = !DILocation(line: 181, column: 24, scope: !310)
!312 = !DILocation(line: 181, column: 17, scope: !302)
!313 = !DILocation(line: 181, column: 34, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !10, line: 181, column: 33)
!315 = !DILocation(line: 183, column: 20, scope: !316)
!316 = distinct !DILexicalBlock(scope: !302, file: !10, line: 183, column: 13)
!317 = !DILocation(line: 183, column: 18, scope: !316)
!318 = !DILocation(line: 183, column: 25, scope: !319)
!319 = distinct !DILexicalBlock(scope: !316, file: !10, line: 183, column: 13)
!320 = !DILocation(line: 183, column: 27, scope: !319)
!321 = !DILocation(line: 183, column: 13, scope: !316)
!322 = !DILocation(line: 185, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !10, line: 184, column: 13)
!324 = !DILocation(line: 185, column: 24, scope: !323)
!325 = !DILocation(line: 185, column: 27, scope: !323)
!326 = !DILocation(line: 186, column: 13, scope: !323)
!327 = !DILocation(line: 183, column: 34, scope: !319)
!328 = !DILocation(line: 183, column: 13, scope: !319)
!329 = distinct !{!329, !321, !330, !66}
!330 = !DILocation(line: 186, column: 13, scope: !316)
!331 = !DILocation(line: 189, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !302, file: !10, line: 189, column: 17)
!333 = !DILocation(line: 189, column: 22, scope: !332)
!334 = !DILocation(line: 189, column: 17, scope: !302)
!335 = !DILocation(line: 191, column: 17, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !10, line: 190, column: 13)
!337 = !DILocation(line: 191, column: 24, scope: !336)
!338 = !DILocation(line: 191, column: 30, scope: !336)
!339 = !DILocation(line: 193, column: 23, scope: !340)
!340 = distinct !DILexicalBlock(scope: !336, file: !10, line: 193, column: 17)
!341 = !DILocation(line: 193, column: 21, scope: !340)
!342 = !DILocation(line: 193, column: 28, scope: !343)
!343 = distinct !DILexicalBlock(scope: !340, file: !10, line: 193, column: 17)
!344 = !DILocation(line: 193, column: 30, scope: !343)
!345 = !DILocation(line: 193, column: 17, scope: !340)
!346 = !DILocation(line: 195, column: 34, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !10, line: 194, column: 17)
!348 = !DILocation(line: 195, column: 41, scope: !347)
!349 = !DILocation(line: 195, column: 21, scope: !347)
!350 = !DILocation(line: 196, column: 17, scope: !347)
!351 = !DILocation(line: 193, column: 37, scope: !343)
!352 = !DILocation(line: 193, column: 17, scope: !343)
!353 = distinct !{!353, !345, !354, !66}
!354 = !DILocation(line: 196, column: 17, scope: !340)
!355 = !DILocation(line: 197, column: 13, scope: !336)
!356 = !DILocation(line: 200, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !332, file: !10, line: 199, column: 13)
!358 = !DILocation(line: 202, column: 18, scope: !302)
!359 = !DILocation(line: 202, column: 13, scope: !302)
!360 = !DILocation(line: 204, column: 5, scope: !303)
!361 = !DILocation(line: 205, column: 1, scope: !284)
!362 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 208, type: !19, scopeLine: 209, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!363 = !DILocalVariable(name: "data", scope: !362, file: !10, line: 210, type: !6)
!364 = !DILocation(line: 210, column: 9, scope: !362)
!365 = !DILocation(line: 212, column: 10, scope: !362)
!366 = !DILocation(line: 213, column: 8, scope: !367)
!367 = distinct !DILexicalBlock(scope: !362, file: !10, line: 213, column: 8)
!368 = !DILocation(line: 213, column: 18, scope: !367)
!369 = !DILocation(line: 213, column: 8, scope: !362)
!370 = !DILocation(line: 217, column: 14, scope: !371)
!371 = distinct !DILexicalBlock(scope: !367, file: !10, line: 214, column: 5)
!372 = !DILocation(line: 218, column: 5, scope: !371)
!373 = !DILocation(line: 219, column: 8, scope: !374)
!374 = distinct !DILexicalBlock(scope: !362, file: !10, line: 219, column: 8)
!375 = !DILocation(line: 219, column: 18, scope: !374)
!376 = !DILocation(line: 219, column: 8, scope: !362)
!377 = !DILocalVariable(name: "i", scope: !378, file: !10, line: 222, type: !6)
!378 = distinct !DILexicalBlock(scope: !379, file: !10, line: 221, column: 9)
!379 = distinct !DILexicalBlock(scope: !374, file: !10, line: 220, column: 5)
!380 = !DILocation(line: 222, column: 17, scope: !378)
!381 = !DILocalVariable(name: "buffer", scope: !378, file: !10, line: 223, type: !5)
!382 = !DILocation(line: 223, column: 19, scope: !378)
!383 = !DILocation(line: 223, column: 35, scope: !378)
!384 = !DILocation(line: 223, column: 28, scope: !378)
!385 = !DILocation(line: 224, column: 17, scope: !386)
!386 = distinct !DILexicalBlock(scope: !378, file: !10, line: 224, column: 17)
!387 = !DILocation(line: 224, column: 24, scope: !386)
!388 = !DILocation(line: 224, column: 17, scope: !378)
!389 = !DILocation(line: 224, column: 34, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !10, line: 224, column: 33)
!391 = !DILocation(line: 226, column: 20, scope: !392)
!392 = distinct !DILexicalBlock(scope: !378, file: !10, line: 226, column: 13)
!393 = !DILocation(line: 226, column: 18, scope: !392)
!394 = !DILocation(line: 226, column: 25, scope: !395)
!395 = distinct !DILexicalBlock(scope: !392, file: !10, line: 226, column: 13)
!396 = !DILocation(line: 226, column: 27, scope: !395)
!397 = !DILocation(line: 226, column: 13, scope: !392)
!398 = !DILocation(line: 228, column: 17, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !10, line: 227, column: 13)
!400 = !DILocation(line: 228, column: 24, scope: !399)
!401 = !DILocation(line: 228, column: 27, scope: !399)
!402 = !DILocation(line: 229, column: 13, scope: !399)
!403 = !DILocation(line: 226, column: 34, scope: !395)
!404 = !DILocation(line: 226, column: 13, scope: !395)
!405 = distinct !{!405, !397, !406, !66}
!406 = !DILocation(line: 229, column: 13, scope: !392)
!407 = !DILocation(line: 232, column: 17, scope: !408)
!408 = distinct !DILexicalBlock(scope: !378, file: !10, line: 232, column: 17)
!409 = !DILocation(line: 232, column: 22, scope: !408)
!410 = !DILocation(line: 232, column: 17, scope: !378)
!411 = !DILocation(line: 234, column: 17, scope: !412)
!412 = distinct !DILexicalBlock(scope: !408, file: !10, line: 233, column: 13)
!413 = !DILocation(line: 234, column: 24, scope: !412)
!414 = !DILocation(line: 234, column: 30, scope: !412)
!415 = !DILocation(line: 236, column: 23, scope: !416)
!416 = distinct !DILexicalBlock(scope: !412, file: !10, line: 236, column: 17)
!417 = !DILocation(line: 236, column: 21, scope: !416)
!418 = !DILocation(line: 236, column: 28, scope: !419)
!419 = distinct !DILexicalBlock(scope: !416, file: !10, line: 236, column: 17)
!420 = !DILocation(line: 236, column: 30, scope: !419)
!421 = !DILocation(line: 236, column: 17, scope: !416)
!422 = !DILocation(line: 238, column: 34, scope: !423)
!423 = distinct !DILexicalBlock(scope: !419, file: !10, line: 237, column: 17)
!424 = !DILocation(line: 238, column: 41, scope: !423)
!425 = !DILocation(line: 238, column: 21, scope: !423)
!426 = !DILocation(line: 239, column: 17, scope: !423)
!427 = !DILocation(line: 236, column: 37, scope: !419)
!428 = !DILocation(line: 236, column: 17, scope: !419)
!429 = distinct !{!429, !421, !430, !66}
!430 = !DILocation(line: 239, column: 17, scope: !416)
!431 = !DILocation(line: 240, column: 13, scope: !412)
!432 = !DILocation(line: 243, column: 17, scope: !433)
!433 = distinct !DILexicalBlock(scope: !408, file: !10, line: 242, column: 13)
!434 = !DILocation(line: 245, column: 18, scope: !378)
!435 = !DILocation(line: 245, column: 13, scope: !378)
!436 = !DILocation(line: 247, column: 5, scope: !379)
!437 = !DILocation(line: 248, column: 1, scope: !362)
