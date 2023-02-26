; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !10
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !13
@goodG2BStatic = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 -1, i32* %data, align 4, !dbg !30
  store i32 10, i32* %data, align 4, !dbg !31
  store i32 1, i32* @badStatic, align 4, !dbg !32
  %0 = load i32, i32* %data, align 4, !dbg !33
  call void @badSink(i32 noundef %0), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !36 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i32, i32* @badStatic, align 4, !dbg !41
  %tobool = icmp ne i32 %0, 0, !dbg !41
  br i1 %tobool, label %if.then, label %if.end16, !dbg !43

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !50
  %1 = bitcast i8* %call to i32*, !dbg !51
  store i32* %1, i32** %buffer, align 8, !dbg !49
  %2 = load i32*, i32** %buffer, align 8, !dbg !52
  %cmp = icmp eq i32* %2, null, !dbg !54
  br i1 %cmp, label %if.then1, label %if.end, !dbg !55

if.then1:                                         ; preds = %if.then
  call void @exit(i32 noundef -1) #6, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !61
  %cmp2 = icmp slt i32 %3, 10, !dbg !63
  br i1 %cmp2, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !65
  %5 = load i32, i32* %i, align 4, !dbg !67
  %idxprom = sext i32 %5 to i64, !dbg !65
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !70
  %inc = add nsw i32 %6, 1, !dbg !70
  store i32 %inc, i32* %i, align 4, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !75
  %cmp3 = icmp sge i32 %7, 0, !dbg !77
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !78

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !79
  %9 = load i32, i32* %data.addr, align 4, !dbg !81
  %idxprom5 = sext i32 %9 to i64, !dbg !79
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !79
  store i32 1, i32* %arrayidx6, align 4, !dbg !82
  store i32 0, i32* %i, align 4, !dbg !83
  br label %for.cond7, !dbg !85

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !86
  %cmp8 = icmp slt i32 %10, 10, !dbg !88
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !89

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !90
  %12 = load i32, i32* %i, align 4, !dbg !92
  %idxprom10 = sext i32 %12 to i64, !dbg !90
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !90
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !90
  call void @printIntLine(i32 noundef %13), !dbg !93
  br label %for.inc12, !dbg !94

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !95
  %inc13 = add nsw i32 %14, 1, !dbg !95
  store i32 %inc13, i32* %i, align 4, !dbg !95
  br label %for.cond7, !dbg !96, !llvm.loop !97

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !99

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !100
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !102
  %16 = bitcast i32* %15 to i8*, !dbg !102
  call void @free(i8* noundef %16), !dbg !103
  br label %if.end16, !dbg !104

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_good() #0 !dbg !106 {
entry:
  call void @goodB2G1(), !dbg !107
  call void @goodB2G2(), !dbg !108
  call void @goodG2B(), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !111 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !117, metadata !DIExpression()), !dbg !118
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !119, metadata !DIExpression()), !dbg !120
  %call = call i64 @time(i64* noundef null), !dbg !121
  %conv = trunc i64 %call to i32, !dbg !122
  call void @srand(i32 noundef %conv), !dbg !123
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !124
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_good(), !dbg !125
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !126
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !127
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_bad(), !dbg !128
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !129
  ret i32 0, !dbg !130
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
define internal void @goodB2G1() #0 !dbg !131 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !132, metadata !DIExpression()), !dbg !133
  store i32 -1, i32* %data, align 4, !dbg !134
  store i32 10, i32* %data, align 4, !dbg !135
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !136
  %0 = load i32, i32* %data, align 4, !dbg !137
  call void @goodB2G1Sink(i32 noundef %0), !dbg !138
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1Sink(i32 noundef %data) #0 !dbg !140 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !141, metadata !DIExpression()), !dbg !142
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !143
  %tobool = icmp ne i32 %0, 0, !dbg !143
  br i1 %tobool, label %if.then, label %if.else, !dbg !145

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !146
  br label %if.end18, !dbg !148

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !149, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !153, metadata !DIExpression()), !dbg !154
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !155
  %1 = bitcast i8* %call to i32*, !dbg !156
  store i32* %1, i32** %buffer, align 8, !dbg !154
  %2 = load i32*, i32** %buffer, align 8, !dbg !157
  %cmp = icmp eq i32* %2, null, !dbg !159
  br i1 %cmp, label %if.then1, label %if.end, !dbg !160

if.then1:                                         ; preds = %if.else
  call void @exit(i32 noundef -1) #6, !dbg !161
  unreachable, !dbg !161

if.end:                                           ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !166
  %cmp2 = icmp slt i32 %3, 10, !dbg !168
  br i1 %cmp2, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !170
  %5 = load i32, i32* %i, align 4, !dbg !172
  %idxprom = sext i32 %5 to i64, !dbg !170
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !170
  store i32 0, i32* %arrayidx, align 4, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !175
  %inc = add nsw i32 %6, 1, !dbg !175
  store i32 %inc, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !179
  %cmp3 = icmp sge i32 %7, 0, !dbg !181
  br i1 %cmp3, label %land.lhs.true, label %if.else16, !dbg !182

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !183
  %cmp4 = icmp slt i32 %8, 10, !dbg !184
  br i1 %cmp4, label %if.then5, label %if.else16, !dbg !185

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !186
  %10 = load i32, i32* %data.addr, align 4, !dbg !188
  %idxprom6 = sext i32 %10 to i64, !dbg !186
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !186
  store i32 1, i32* %arrayidx7, align 4, !dbg !189
  store i32 0, i32* %i, align 4, !dbg !190
  br label %for.cond8, !dbg !192

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !193
  %cmp9 = icmp slt i32 %11, 10, !dbg !195
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !196

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !197
  %13 = load i32, i32* %i, align 4, !dbg !199
  %idxprom11 = sext i32 %13 to i64, !dbg !197
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !197
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !197
  call void @printIntLine(i32 noundef %14), !dbg !200
  br label %for.inc13, !dbg !201

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !202
  %inc14 = add nsw i32 %15, 1, !dbg !202
  store i32 %inc14, i32* %i, align 4, !dbg !202
  br label %for.cond8, !dbg !203, !llvm.loop !204

for.end15:                                        ; preds = %for.cond8
  br label %if.end17, !dbg !206

if.else16:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !207
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !209
  %17 = bitcast i32* %16 to i8*, !dbg !209
  call void @free(i8* noundef %17), !dbg !210
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then
  ret void, !dbg !211
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !212 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !213, metadata !DIExpression()), !dbg !214
  store i32 -1, i32* %data, align 4, !dbg !215
  store i32 10, i32* %data, align 4, !dbg !216
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !217
  %0 = load i32, i32* %data, align 4, !dbg !218
  call void @goodB2G2Sink(i32 noundef %0), !dbg !219
  ret void, !dbg !220
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2Sink(i32 noundef %data) #0 !dbg !221 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !222, metadata !DIExpression()), !dbg !223
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !224
  %tobool = icmp ne i32 %0, 0, !dbg !224
  br i1 %tobool, label %if.then, label %if.end17, !dbg !226

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !227, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !231, metadata !DIExpression()), !dbg !232
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !233
  %1 = bitcast i8* %call to i32*, !dbg !234
  store i32* %1, i32** %buffer, align 8, !dbg !232
  %2 = load i32*, i32** %buffer, align 8, !dbg !235
  %cmp = icmp eq i32* %2, null, !dbg !237
  br i1 %cmp, label %if.then1, label %if.end, !dbg !238

if.then1:                                         ; preds = %if.then
  call void @exit(i32 noundef -1) #6, !dbg !239
  unreachable, !dbg !239

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !243

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !244
  %cmp2 = icmp slt i32 %3, 10, !dbg !246
  br i1 %cmp2, label %for.body, label %for.end, !dbg !247

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !248
  %5 = load i32, i32* %i, align 4, !dbg !250
  %idxprom = sext i32 %5 to i64, !dbg !248
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !248
  store i32 0, i32* %arrayidx, align 4, !dbg !251
  br label %for.inc, !dbg !252

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !253
  %inc = add nsw i32 %6, 1, !dbg !253
  store i32 %inc, i32* %i, align 4, !dbg !253
  br label %for.cond, !dbg !254, !llvm.loop !255

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !257
  %cmp3 = icmp sge i32 %7, 0, !dbg !259
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !260

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !261
  %cmp4 = icmp slt i32 %8, 10, !dbg !262
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !263

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !264
  %10 = load i32, i32* %data.addr, align 4, !dbg !266
  %idxprom6 = sext i32 %10 to i64, !dbg !264
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !264
  store i32 1, i32* %arrayidx7, align 4, !dbg !267
  store i32 0, i32* %i, align 4, !dbg !268
  br label %for.cond8, !dbg !270

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !271
  %cmp9 = icmp slt i32 %11, 10, !dbg !273
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !274

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !275
  %13 = load i32, i32* %i, align 4, !dbg !277
  %idxprom11 = sext i32 %13 to i64, !dbg !275
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !275
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !275
  call void @printIntLine(i32 noundef %14), !dbg !278
  br label %for.inc13, !dbg !279

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !280
  %inc14 = add nsw i32 %15, 1, !dbg !280
  store i32 %inc14, i32* %i, align 4, !dbg !280
  br label %for.cond8, !dbg !281, !llvm.loop !282

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !284

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !285
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !287
  %17 = bitcast i32* %16 to i8*, !dbg !287
  call void @free(i8* noundef %17), !dbg !288
  br label %if.end17, !dbg !289

if.end17:                                         ; preds = %if.end16, %entry
  ret void, !dbg !290
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !291 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !292, metadata !DIExpression()), !dbg !293
  store i32 -1, i32* %data, align 4, !dbg !294
  store i32 7, i32* %data, align 4, !dbg !295
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !296
  %0 = load i32, i32* %data, align 4, !dbg !297
  call void @goodG2BSink(i32 noundef %0), !dbg !298
  ret void, !dbg !299
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !300 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !301, metadata !DIExpression()), !dbg !302
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !303
  %tobool = icmp ne i32 %0, 0, !dbg !303
  br i1 %tobool, label %if.then, label %if.end16, !dbg !305

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !306, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !310, metadata !DIExpression()), !dbg !311
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !312
  %1 = bitcast i8* %call to i32*, !dbg !313
  store i32* %1, i32** %buffer, align 8, !dbg !311
  %2 = load i32*, i32** %buffer, align 8, !dbg !314
  %cmp = icmp eq i32* %2, null, !dbg !316
  br i1 %cmp, label %if.then1, label %if.end, !dbg !317

if.then1:                                         ; preds = %if.then
  call void @exit(i32 noundef -1) #6, !dbg !318
  unreachable, !dbg !318

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !320
  br label %for.cond, !dbg !322

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !323
  %cmp2 = icmp slt i32 %3, 10, !dbg !325
  br i1 %cmp2, label %for.body, label %for.end, !dbg !326

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !327
  %5 = load i32, i32* %i, align 4, !dbg !329
  %idxprom = sext i32 %5 to i64, !dbg !327
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !327
  store i32 0, i32* %arrayidx, align 4, !dbg !330
  br label %for.inc, !dbg !331

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !332
  %inc = add nsw i32 %6, 1, !dbg !332
  store i32 %inc, i32* %i, align 4, !dbg !332
  br label %for.cond, !dbg !333, !llvm.loop !334

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !336
  %cmp3 = icmp sge i32 %7, 0, !dbg !338
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !339

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !340
  %9 = load i32, i32* %data.addr, align 4, !dbg !342
  %idxprom5 = sext i32 %9 to i64, !dbg !340
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !340
  store i32 1, i32* %arrayidx6, align 4, !dbg !343
  store i32 0, i32* %i, align 4, !dbg !344
  br label %for.cond7, !dbg !346

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !347
  %cmp8 = icmp slt i32 %10, 10, !dbg !349
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !350

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !351
  %12 = load i32, i32* %i, align 4, !dbg !353
  %idxprom10 = sext i32 %12 to i64, !dbg !351
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !351
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !351
  call void @printIntLine(i32 noundef %13), !dbg !354
  br label %for.inc12, !dbg !355

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !356
  %inc13 = add nsw i32 %14, 1, !dbg !356
  store i32 %inc13, i32* %i, align 4, !dbg !356
  br label %for.cond7, !dbg !357, !llvm.loop !358

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !360

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !361
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !363
  %16 = bitcast i32* %15 to i8*, !dbg !363
  call void @free(i8* noundef %16), !dbg !364
  br label %if.end16, !dbg !365

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !366
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !12, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !6, !8}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !{!0, !10, !13, !15}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !12, line: 74, type: !7, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !12, line: 75, type: !7, isLocal: true, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !12, line: 76, type: !7, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Homebrew clang version 14.0.6"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_bad", scope: !12, file: !12, line: 58, type: !25, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !{}
!28 = !DILocalVariable(name: "data", scope: !24, file: !12, line: 60, type: !7)
!29 = !DILocation(line: 60, column: 9, scope: !24)
!30 = !DILocation(line: 62, column: 10, scope: !24)
!31 = !DILocation(line: 64, column: 10, scope: !24)
!32 = !DILocation(line: 65, column: 15, scope: !24)
!33 = !DILocation(line: 66, column: 13, scope: !24)
!34 = !DILocation(line: 66, column: 5, scope: !24)
!35 = !DILocation(line: 67, column: 1, scope: !24)
!36 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 25, type: !37, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !7}
!39 = !DILocalVariable(name: "data", arg: 1, scope: !36, file: !12, line: 25, type: !7)
!40 = !DILocation(line: 25, column: 25, scope: !36)
!41 = !DILocation(line: 27, column: 8, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !12, line: 27, column: 8)
!43 = !DILocation(line: 27, column: 8, scope: !36)
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 30, type: !7)
!45 = distinct !DILexicalBlock(scope: !46, file: !12, line: 29, column: 9)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 28, column: 5)
!47 = !DILocation(line: 30, column: 17, scope: !45)
!48 = !DILocalVariable(name: "buffer", scope: !45, file: !12, line: 31, type: !6)
!49 = !DILocation(line: 31, column: 19, scope: !45)
!50 = !DILocation(line: 31, column: 35, scope: !45)
!51 = !DILocation(line: 31, column: 28, scope: !45)
!52 = !DILocation(line: 32, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !45, file: !12, line: 32, column: 17)
!54 = !DILocation(line: 32, column: 24, scope: !53)
!55 = !DILocation(line: 32, column: 17, scope: !45)
!56 = !DILocation(line: 32, column: 34, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 32, column: 33)
!58 = !DILocation(line: 34, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !45, file: !12, line: 34, column: 13)
!60 = !DILocation(line: 34, column: 18, scope: !59)
!61 = !DILocation(line: 34, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !12, line: 34, column: 13)
!63 = !DILocation(line: 34, column: 27, scope: !62)
!64 = !DILocation(line: 34, column: 13, scope: !59)
!65 = !DILocation(line: 36, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !12, line: 35, column: 13)
!67 = !DILocation(line: 36, column: 24, scope: !66)
!68 = !DILocation(line: 36, column: 27, scope: !66)
!69 = !DILocation(line: 37, column: 13, scope: !66)
!70 = !DILocation(line: 34, column: 34, scope: !62)
!71 = !DILocation(line: 34, column: 13, scope: !62)
!72 = distinct !{!72, !64, !73, !74}
!73 = !DILocation(line: 37, column: 13, scope: !59)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 40, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !45, file: !12, line: 40, column: 17)
!77 = !DILocation(line: 40, column: 22, scope: !76)
!78 = !DILocation(line: 40, column: 17, scope: !45)
!79 = !DILocation(line: 42, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !12, line: 41, column: 13)
!81 = !DILocation(line: 42, column: 24, scope: !80)
!82 = !DILocation(line: 42, column: 30, scope: !80)
!83 = !DILocation(line: 44, column: 23, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !12, line: 44, column: 17)
!85 = !DILocation(line: 44, column: 21, scope: !84)
!86 = !DILocation(line: 44, column: 28, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !12, line: 44, column: 17)
!88 = !DILocation(line: 44, column: 30, scope: !87)
!89 = !DILocation(line: 44, column: 17, scope: !84)
!90 = !DILocation(line: 46, column: 34, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !12, line: 45, column: 17)
!92 = !DILocation(line: 46, column: 41, scope: !91)
!93 = !DILocation(line: 46, column: 21, scope: !91)
!94 = !DILocation(line: 47, column: 17, scope: !91)
!95 = !DILocation(line: 44, column: 37, scope: !87)
!96 = !DILocation(line: 44, column: 17, scope: !87)
!97 = distinct !{!97, !89, !98, !74}
!98 = !DILocation(line: 47, column: 17, scope: !84)
!99 = !DILocation(line: 48, column: 13, scope: !80)
!100 = !DILocation(line: 51, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !76, file: !12, line: 50, column: 13)
!102 = !DILocation(line: 53, column: 18, scope: !45)
!103 = !DILocation(line: 53, column: 13, scope: !45)
!104 = !DILocation(line: 55, column: 5, scope: !46)
!105 = !DILocation(line: 56, column: 1, scope: !36)
!106 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_21_good", scope: !12, file: !12, line: 217, type: !25, scopeLine: 218, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!107 = !DILocation(line: 219, column: 5, scope: !106)
!108 = !DILocation(line: 220, column: 5, scope: !106)
!109 = !DILocation(line: 221, column: 5, scope: !106)
!110 = !DILocation(line: 222, column: 1, scope: !106)
!111 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 233, type: !112, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!112 = !DISubroutineType(types: !113)
!113 = !{!7, !7, !114}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!117 = !DILocalVariable(name: "argc", arg: 1, scope: !111, file: !12, line: 233, type: !7)
!118 = !DILocation(line: 233, column: 14, scope: !111)
!119 = !DILocalVariable(name: "argv", arg: 2, scope: !111, file: !12, line: 233, type: !114)
!120 = !DILocation(line: 233, column: 27, scope: !111)
!121 = !DILocation(line: 236, column: 22, scope: !111)
!122 = !DILocation(line: 236, column: 12, scope: !111)
!123 = !DILocation(line: 236, column: 5, scope: !111)
!124 = !DILocation(line: 238, column: 5, scope: !111)
!125 = !DILocation(line: 239, column: 5, scope: !111)
!126 = !DILocation(line: 240, column: 5, scope: !111)
!127 = !DILocation(line: 243, column: 5, scope: !111)
!128 = !DILocation(line: 244, column: 5, scope: !111)
!129 = !DILocation(line: 245, column: 5, scope: !111)
!130 = !DILocation(line: 247, column: 5, scope: !111)
!131 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 116, type: !25, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!132 = !DILocalVariable(name: "data", scope: !131, file: !12, line: 118, type: !7)
!133 = !DILocation(line: 118, column: 9, scope: !131)
!134 = !DILocation(line: 120, column: 10, scope: !131)
!135 = !DILocation(line: 122, column: 10, scope: !131)
!136 = !DILocation(line: 123, column: 20, scope: !131)
!137 = !DILocation(line: 124, column: 18, scope: !131)
!138 = !DILocation(line: 124, column: 5, scope: !131)
!139 = !DILocation(line: 125, column: 1, scope: !131)
!140 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !12, file: !12, line: 79, type: !37, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!141 = !DILocalVariable(name: "data", arg: 1, scope: !140, file: !12, line: 79, type: !7)
!142 = !DILocation(line: 79, column: 30, scope: !140)
!143 = !DILocation(line: 81, column: 8, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !12, line: 81, column: 8)
!145 = !DILocation(line: 81, column: 8, scope: !140)
!146 = !DILocation(line: 84, column: 9, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 82, column: 5)
!148 = !DILocation(line: 85, column: 5, scope: !147)
!149 = !DILocalVariable(name: "i", scope: !150, file: !12, line: 89, type: !7)
!150 = distinct !DILexicalBlock(scope: !151, file: !12, line: 88, column: 9)
!151 = distinct !DILexicalBlock(scope: !144, file: !12, line: 87, column: 5)
!152 = !DILocation(line: 89, column: 17, scope: !150)
!153 = !DILocalVariable(name: "buffer", scope: !150, file: !12, line: 90, type: !6)
!154 = !DILocation(line: 90, column: 19, scope: !150)
!155 = !DILocation(line: 90, column: 35, scope: !150)
!156 = !DILocation(line: 90, column: 28, scope: !150)
!157 = !DILocation(line: 91, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !150, file: !12, line: 91, column: 17)
!159 = !DILocation(line: 91, column: 24, scope: !158)
!160 = !DILocation(line: 91, column: 17, scope: !150)
!161 = !DILocation(line: 91, column: 34, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 91, column: 33)
!163 = !DILocation(line: 93, column: 20, scope: !164)
!164 = distinct !DILexicalBlock(scope: !150, file: !12, line: 93, column: 13)
!165 = !DILocation(line: 93, column: 18, scope: !164)
!166 = !DILocation(line: 93, column: 25, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !12, line: 93, column: 13)
!168 = !DILocation(line: 93, column: 27, scope: !167)
!169 = !DILocation(line: 93, column: 13, scope: !164)
!170 = !DILocation(line: 95, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !12, line: 94, column: 13)
!172 = !DILocation(line: 95, column: 24, scope: !171)
!173 = !DILocation(line: 95, column: 27, scope: !171)
!174 = !DILocation(line: 96, column: 13, scope: !171)
!175 = !DILocation(line: 93, column: 34, scope: !167)
!176 = !DILocation(line: 93, column: 13, scope: !167)
!177 = distinct !{!177, !169, !178, !74}
!178 = !DILocation(line: 96, column: 13, scope: !164)
!179 = !DILocation(line: 98, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !150, file: !12, line: 98, column: 17)
!181 = !DILocation(line: 98, column: 22, scope: !180)
!182 = !DILocation(line: 98, column: 27, scope: !180)
!183 = !DILocation(line: 98, column: 30, scope: !180)
!184 = !DILocation(line: 98, column: 35, scope: !180)
!185 = !DILocation(line: 98, column: 17, scope: !150)
!186 = !DILocation(line: 100, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !180, file: !12, line: 99, column: 13)
!188 = !DILocation(line: 100, column: 24, scope: !187)
!189 = !DILocation(line: 100, column: 30, scope: !187)
!190 = !DILocation(line: 102, column: 23, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !12, line: 102, column: 17)
!192 = !DILocation(line: 102, column: 21, scope: !191)
!193 = !DILocation(line: 102, column: 28, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !12, line: 102, column: 17)
!195 = !DILocation(line: 102, column: 30, scope: !194)
!196 = !DILocation(line: 102, column: 17, scope: !191)
!197 = !DILocation(line: 104, column: 34, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !12, line: 103, column: 17)
!199 = !DILocation(line: 104, column: 41, scope: !198)
!200 = !DILocation(line: 104, column: 21, scope: !198)
!201 = !DILocation(line: 105, column: 17, scope: !198)
!202 = !DILocation(line: 102, column: 37, scope: !194)
!203 = !DILocation(line: 102, column: 17, scope: !194)
!204 = distinct !{!204, !196, !205, !74}
!205 = !DILocation(line: 105, column: 17, scope: !191)
!206 = !DILocation(line: 106, column: 13, scope: !187)
!207 = !DILocation(line: 109, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !180, file: !12, line: 108, column: 13)
!209 = !DILocation(line: 111, column: 18, scope: !150)
!210 = !DILocation(line: 111, column: 13, scope: !150)
!211 = !DILocation(line: 114, column: 1, scope: !140)
!212 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 160, type: !25, scopeLine: 161, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!213 = !DILocalVariable(name: "data", scope: !212, file: !12, line: 162, type: !7)
!214 = !DILocation(line: 162, column: 9, scope: !212)
!215 = !DILocation(line: 164, column: 10, scope: !212)
!216 = !DILocation(line: 166, column: 10, scope: !212)
!217 = !DILocation(line: 167, column: 20, scope: !212)
!218 = !DILocation(line: 168, column: 18, scope: !212)
!219 = !DILocation(line: 168, column: 5, scope: !212)
!220 = !DILocation(line: 169, column: 1, scope: !212)
!221 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !12, file: !12, line: 128, type: !37, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!222 = !DILocalVariable(name: "data", arg: 1, scope: !221, file: !12, line: 128, type: !7)
!223 = !DILocation(line: 128, column: 30, scope: !221)
!224 = !DILocation(line: 130, column: 8, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !12, line: 130, column: 8)
!226 = !DILocation(line: 130, column: 8, scope: !221)
!227 = !DILocalVariable(name: "i", scope: !228, file: !12, line: 133, type: !7)
!228 = distinct !DILexicalBlock(scope: !229, file: !12, line: 132, column: 9)
!229 = distinct !DILexicalBlock(scope: !225, file: !12, line: 131, column: 5)
!230 = !DILocation(line: 133, column: 17, scope: !228)
!231 = !DILocalVariable(name: "buffer", scope: !228, file: !12, line: 134, type: !6)
!232 = !DILocation(line: 134, column: 19, scope: !228)
!233 = !DILocation(line: 134, column: 35, scope: !228)
!234 = !DILocation(line: 134, column: 28, scope: !228)
!235 = !DILocation(line: 135, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !228, file: !12, line: 135, column: 17)
!237 = !DILocation(line: 135, column: 24, scope: !236)
!238 = !DILocation(line: 135, column: 17, scope: !228)
!239 = !DILocation(line: 135, column: 34, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !12, line: 135, column: 33)
!241 = !DILocation(line: 137, column: 20, scope: !242)
!242 = distinct !DILexicalBlock(scope: !228, file: !12, line: 137, column: 13)
!243 = !DILocation(line: 137, column: 18, scope: !242)
!244 = !DILocation(line: 137, column: 25, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !12, line: 137, column: 13)
!246 = !DILocation(line: 137, column: 27, scope: !245)
!247 = !DILocation(line: 137, column: 13, scope: !242)
!248 = !DILocation(line: 139, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !12, line: 138, column: 13)
!250 = !DILocation(line: 139, column: 24, scope: !249)
!251 = !DILocation(line: 139, column: 27, scope: !249)
!252 = !DILocation(line: 140, column: 13, scope: !249)
!253 = !DILocation(line: 137, column: 34, scope: !245)
!254 = !DILocation(line: 137, column: 13, scope: !245)
!255 = distinct !{!255, !247, !256, !74}
!256 = !DILocation(line: 140, column: 13, scope: !242)
!257 = !DILocation(line: 142, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !228, file: !12, line: 142, column: 17)
!259 = !DILocation(line: 142, column: 22, scope: !258)
!260 = !DILocation(line: 142, column: 27, scope: !258)
!261 = !DILocation(line: 142, column: 30, scope: !258)
!262 = !DILocation(line: 142, column: 35, scope: !258)
!263 = !DILocation(line: 142, column: 17, scope: !228)
!264 = !DILocation(line: 144, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !258, file: !12, line: 143, column: 13)
!266 = !DILocation(line: 144, column: 24, scope: !265)
!267 = !DILocation(line: 144, column: 30, scope: !265)
!268 = !DILocation(line: 146, column: 23, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !12, line: 146, column: 17)
!270 = !DILocation(line: 146, column: 21, scope: !269)
!271 = !DILocation(line: 146, column: 28, scope: !272)
!272 = distinct !DILexicalBlock(scope: !269, file: !12, line: 146, column: 17)
!273 = !DILocation(line: 146, column: 30, scope: !272)
!274 = !DILocation(line: 146, column: 17, scope: !269)
!275 = !DILocation(line: 148, column: 34, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !12, line: 147, column: 17)
!277 = !DILocation(line: 148, column: 41, scope: !276)
!278 = !DILocation(line: 148, column: 21, scope: !276)
!279 = !DILocation(line: 149, column: 17, scope: !276)
!280 = !DILocation(line: 146, column: 37, scope: !272)
!281 = !DILocation(line: 146, column: 17, scope: !272)
!282 = distinct !{!282, !274, !283, !74}
!283 = !DILocation(line: 149, column: 17, scope: !269)
!284 = !DILocation(line: 150, column: 13, scope: !265)
!285 = !DILocation(line: 153, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !258, file: !12, line: 152, column: 13)
!287 = !DILocation(line: 155, column: 18, scope: !228)
!288 = !DILocation(line: 155, column: 13, scope: !228)
!289 = !DILocation(line: 157, column: 5, scope: !229)
!290 = !DILocation(line: 158, column: 1, scope: !221)
!291 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 205, type: !25, scopeLine: 206, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!292 = !DILocalVariable(name: "data", scope: !291, file: !12, line: 207, type: !7)
!293 = !DILocation(line: 207, column: 9, scope: !291)
!294 = !DILocation(line: 209, column: 10, scope: !291)
!295 = !DILocation(line: 212, column: 10, scope: !291)
!296 = !DILocation(line: 213, column: 19, scope: !291)
!297 = !DILocation(line: 214, column: 17, scope: !291)
!298 = !DILocation(line: 214, column: 5, scope: !291)
!299 = !DILocation(line: 215, column: 1, scope: !291)
!300 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 172, type: !37, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!301 = !DILocalVariable(name: "data", arg: 1, scope: !300, file: !12, line: 172, type: !7)
!302 = !DILocation(line: 172, column: 29, scope: !300)
!303 = !DILocation(line: 174, column: 8, scope: !304)
!304 = distinct !DILexicalBlock(scope: !300, file: !12, line: 174, column: 8)
!305 = !DILocation(line: 174, column: 8, scope: !300)
!306 = !DILocalVariable(name: "i", scope: !307, file: !12, line: 177, type: !7)
!307 = distinct !DILexicalBlock(scope: !308, file: !12, line: 176, column: 9)
!308 = distinct !DILexicalBlock(scope: !304, file: !12, line: 175, column: 5)
!309 = !DILocation(line: 177, column: 17, scope: !307)
!310 = !DILocalVariable(name: "buffer", scope: !307, file: !12, line: 178, type: !6)
!311 = !DILocation(line: 178, column: 19, scope: !307)
!312 = !DILocation(line: 178, column: 35, scope: !307)
!313 = !DILocation(line: 178, column: 28, scope: !307)
!314 = !DILocation(line: 179, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !307, file: !12, line: 179, column: 17)
!316 = !DILocation(line: 179, column: 24, scope: !315)
!317 = !DILocation(line: 179, column: 17, scope: !307)
!318 = !DILocation(line: 179, column: 34, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !12, line: 179, column: 33)
!320 = !DILocation(line: 181, column: 20, scope: !321)
!321 = distinct !DILexicalBlock(scope: !307, file: !12, line: 181, column: 13)
!322 = !DILocation(line: 181, column: 18, scope: !321)
!323 = !DILocation(line: 181, column: 25, scope: !324)
!324 = distinct !DILexicalBlock(scope: !321, file: !12, line: 181, column: 13)
!325 = !DILocation(line: 181, column: 27, scope: !324)
!326 = !DILocation(line: 181, column: 13, scope: !321)
!327 = !DILocation(line: 183, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !12, line: 182, column: 13)
!329 = !DILocation(line: 183, column: 24, scope: !328)
!330 = !DILocation(line: 183, column: 27, scope: !328)
!331 = !DILocation(line: 184, column: 13, scope: !328)
!332 = !DILocation(line: 181, column: 34, scope: !324)
!333 = !DILocation(line: 181, column: 13, scope: !324)
!334 = distinct !{!334, !326, !335, !74}
!335 = !DILocation(line: 184, column: 13, scope: !321)
!336 = !DILocation(line: 187, column: 17, scope: !337)
!337 = distinct !DILexicalBlock(scope: !307, file: !12, line: 187, column: 17)
!338 = !DILocation(line: 187, column: 22, scope: !337)
!339 = !DILocation(line: 187, column: 17, scope: !307)
!340 = !DILocation(line: 189, column: 17, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !12, line: 188, column: 13)
!342 = !DILocation(line: 189, column: 24, scope: !341)
!343 = !DILocation(line: 189, column: 30, scope: !341)
!344 = !DILocation(line: 191, column: 23, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !12, line: 191, column: 17)
!346 = !DILocation(line: 191, column: 21, scope: !345)
!347 = !DILocation(line: 191, column: 28, scope: !348)
!348 = distinct !DILexicalBlock(scope: !345, file: !12, line: 191, column: 17)
!349 = !DILocation(line: 191, column: 30, scope: !348)
!350 = !DILocation(line: 191, column: 17, scope: !345)
!351 = !DILocation(line: 193, column: 34, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !12, line: 192, column: 17)
!353 = !DILocation(line: 193, column: 41, scope: !352)
!354 = !DILocation(line: 193, column: 21, scope: !352)
!355 = !DILocation(line: 194, column: 17, scope: !352)
!356 = !DILocation(line: 191, column: 37, scope: !348)
!357 = !DILocation(line: 191, column: 17, scope: !348)
!358 = distinct !{!358, !350, !359, !74}
!359 = !DILocation(line: 194, column: 17, scope: !345)
!360 = !DILocation(line: 195, column: 13, scope: !341)
!361 = !DILocation(line: 198, column: 17, scope: !362)
!362 = distinct !DILexicalBlock(scope: !337, file: !12, line: 197, column: 13)
!363 = !DILocation(line: 200, column: 18, scope: !307)
!364 = !DILocation(line: 200, column: 13, scope: !307)
!365 = !DILocation(line: 202, column: 5, scope: !308)
!366 = !DILocation(line: 203, column: 1, scope: !300)
