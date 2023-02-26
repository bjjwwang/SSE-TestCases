; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 -1, i32* %data, align 4, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !30
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool1 = icmp ne i32 %2, 0, !dbg !34
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !36

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !37, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !41, metadata !DIExpression()), !dbg !42
  %call3 = call i8* @malloc(i64 noundef 40) #5, !dbg !43
  %3 = bitcast i8* %call3 to i32*, !dbg !44
  store i32* %3, i32** %buffer, align 8, !dbg !42
  %4 = load i32*, i32** %buffer, align 8, !dbg !45
  %cmp = icmp eq i32* %4, null, !dbg !47
  br i1 %cmp, label %if.then4, label %if.end5, !dbg !48

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !49
  unreachable, !dbg !49

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end5
  %5 = load i32, i32* %i, align 4, !dbg !54
  %cmp6 = icmp slt i32 %5, 10, !dbg !56
  br i1 %cmp6, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !58
  %7 = load i32, i32* %i, align 4, !dbg !60
  %idxprom = sext i32 %7 to i64, !dbg !58
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !58
  store i32 0, i32* %arrayidx, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !63
  %inc = add nsw i32 %8, 1, !dbg !63
  store i32 %inc, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data, align 4, !dbg !68
  %cmp7 = icmp sge i32 %9, 0, !dbg !70
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !71

if.then8:                                         ; preds = %for.end
  %10 = load i32*, i32** %buffer, align 8, !dbg !72
  %11 = load i32, i32* %data, align 4, !dbg !74
  %idxprom9 = sext i32 %11 to i64, !dbg !72
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !72
  store i32 1, i32* %arrayidx10, align 4, !dbg !75
  store i32 0, i32* %i, align 4, !dbg !76
  br label %for.cond11, !dbg !78

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %12 = load i32, i32* %i, align 4, !dbg !79
  %cmp12 = icmp slt i32 %12, 10, !dbg !81
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !82

for.body13:                                       ; preds = %for.cond11
  %13 = load i32*, i32** %buffer, align 8, !dbg !83
  %14 = load i32, i32* %i, align 4, !dbg !85
  %idxprom14 = sext i32 %14 to i64, !dbg !83
  %arrayidx15 = getelementptr inbounds i32, i32* %13, i64 %idxprom14, !dbg !83
  %15 = load i32, i32* %arrayidx15, align 4, !dbg !83
  call void @printIntLine(i32 noundef %15), !dbg !86
  br label %for.inc16, !dbg !87

for.inc16:                                        ; preds = %for.body13
  %16 = load i32, i32* %i, align 4, !dbg !88
  %inc17 = add nsw i32 %16, 1, !dbg !88
  store i32 %inc17, i32* %i, align 4, !dbg !88
  br label %for.cond11, !dbg !89, !llvm.loop !90

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !92

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %17 = load i32*, i32** %buffer, align 8, !dbg !95
  %18 = bitcast i32* %17 to i8*, !dbg !95
  call void @free(i8* noundef %18), !dbg !96
  br label %if.end20, !dbg !97

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !98
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_05_good() #0 !dbg !99 {
entry:
  call void @goodB2G1(), !dbg !100
  call void @goodB2G2(), !dbg !101
  call void @goodG2B1(), !dbg !102
  call void @goodG2B2(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !105 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call i64 @time(i64* noundef null), !dbg !115
  %conv = trunc i64 %call to i32, !dbg !116
  call void @srand(i32 noundef %conv), !dbg !117
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !118
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_05_good(), !dbg !119
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !120
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_05_bad(), !dbg !122
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !123
  ret i32 0, !dbg !124
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !125 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i32 -1, i32* %data, align 4, !dbg !128
  %0 = load i32, i32* @staticTrue, align 4, !dbg !129
  %tobool = icmp ne i32 %0, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !132
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !134
  br label %if.end, !dbg !135

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticFalse, align 4, !dbg !136
  %tobool1 = icmp ne i32 %2, 0, !dbg !136
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !138

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !139
  br label %if.end22, !dbg !141

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !142, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !146, metadata !DIExpression()), !dbg !147
  %call3 = call i8* @malloc(i64 noundef 40) #5, !dbg !148
  %3 = bitcast i8* %call3 to i32*, !dbg !149
  store i32* %3, i32** %buffer, align 8, !dbg !147
  %4 = load i32*, i32** %buffer, align 8, !dbg !150
  %cmp = icmp eq i32* %4, null, !dbg !152
  br i1 %cmp, label %if.then4, label %if.end5, !dbg !153

if.then4:                                         ; preds = %if.else
  call void @exit(i32 noundef -1) #6, !dbg !154
  unreachable, !dbg !154

if.end5:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %if.end5
  %5 = load i32, i32* %i, align 4, !dbg !159
  %cmp6 = icmp slt i32 %5, 10, !dbg !161
  br i1 %cmp6, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !163
  %7 = load i32, i32* %i, align 4, !dbg !165
  %idxprom = sext i32 %7 to i64, !dbg !163
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !163
  store i32 0, i32* %arrayidx, align 4, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !168
  %inc = add nsw i32 %8, 1, !dbg !168
  store i32 %inc, i32* %i, align 4, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data, align 4, !dbg !172
  %cmp7 = icmp sge i32 %9, 0, !dbg !174
  br i1 %cmp7, label %land.lhs.true, label %if.else20, !dbg !175

land.lhs.true:                                    ; preds = %for.end
  %10 = load i32, i32* %data, align 4, !dbg !176
  %cmp8 = icmp slt i32 %10, 10, !dbg !177
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !178

if.then9:                                         ; preds = %land.lhs.true
  %11 = load i32*, i32** %buffer, align 8, !dbg !179
  %12 = load i32, i32* %data, align 4, !dbg !181
  %idxprom10 = sext i32 %12 to i64, !dbg !179
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !179
  store i32 1, i32* %arrayidx11, align 4, !dbg !182
  store i32 0, i32* %i, align 4, !dbg !183
  br label %for.cond12, !dbg !185

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %13 = load i32, i32* %i, align 4, !dbg !186
  %cmp13 = icmp slt i32 %13, 10, !dbg !188
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !189

for.body14:                                       ; preds = %for.cond12
  %14 = load i32*, i32** %buffer, align 8, !dbg !190
  %15 = load i32, i32* %i, align 4, !dbg !192
  %idxprom15 = sext i32 %15 to i64, !dbg !190
  %arrayidx16 = getelementptr inbounds i32, i32* %14, i64 %idxprom15, !dbg !190
  %16 = load i32, i32* %arrayidx16, align 4, !dbg !190
  call void @printIntLine(i32 noundef %16), !dbg !193
  br label %for.inc17, !dbg !194

for.inc17:                                        ; preds = %for.body14
  %17 = load i32, i32* %i, align 4, !dbg !195
  %inc18 = add nsw i32 %17, 1, !dbg !195
  store i32 %inc18, i32* %i, align 4, !dbg !195
  br label %for.cond12, !dbg !196, !llvm.loop !197

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !199

if.else20:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !200
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %18 = load i32*, i32** %buffer, align 8, !dbg !202
  %19 = bitcast i32* %18 to i8*, !dbg !202
  call void @free(i8* noundef %19), !dbg !203
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !209
  %tobool = icmp ne i32 %0, 0, !dbg !209
  br i1 %tobool, label %if.then, label %if.end, !dbg !211

if.then:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !212
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !214
  br label %if.end, !dbg !215

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !216
  %tobool1 = icmp ne i32 %2, 0, !dbg !216
  br i1 %tobool1, label %if.then2, label %if.end21, !dbg !218

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !219, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !223, metadata !DIExpression()), !dbg !224
  %call3 = call i8* @malloc(i64 noundef 40) #5, !dbg !225
  %3 = bitcast i8* %call3 to i32*, !dbg !226
  store i32* %3, i32** %buffer, align 8, !dbg !224
  %4 = load i32*, i32** %buffer, align 8, !dbg !227
  %cmp = icmp eq i32* %4, null, !dbg !229
  br i1 %cmp, label %if.then4, label %if.end5, !dbg !230

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !231
  unreachable, !dbg !231

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !233
  br label %for.cond, !dbg !235

for.cond:                                         ; preds = %for.inc, %if.end5
  %5 = load i32, i32* %i, align 4, !dbg !236
  %cmp6 = icmp slt i32 %5, 10, !dbg !238
  br i1 %cmp6, label %for.body, label %for.end, !dbg !239

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !240
  %7 = load i32, i32* %i, align 4, !dbg !242
  %idxprom = sext i32 %7 to i64, !dbg !240
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !240
  store i32 0, i32* %arrayidx, align 4, !dbg !243
  br label %for.inc, !dbg !244

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !245
  %inc = add nsw i32 %8, 1, !dbg !245
  store i32 %inc, i32* %i, align 4, !dbg !245
  br label %for.cond, !dbg !246, !llvm.loop !247

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data, align 4, !dbg !249
  %cmp7 = icmp sge i32 %9, 0, !dbg !251
  br i1 %cmp7, label %land.lhs.true, label %if.else, !dbg !252

land.lhs.true:                                    ; preds = %for.end
  %10 = load i32, i32* %data, align 4, !dbg !253
  %cmp8 = icmp slt i32 %10, 10, !dbg !254
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !255

if.then9:                                         ; preds = %land.lhs.true
  %11 = load i32*, i32** %buffer, align 8, !dbg !256
  %12 = load i32, i32* %data, align 4, !dbg !258
  %idxprom10 = sext i32 %12 to i64, !dbg !256
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !256
  store i32 1, i32* %arrayidx11, align 4, !dbg !259
  store i32 0, i32* %i, align 4, !dbg !260
  br label %for.cond12, !dbg !262

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %13 = load i32, i32* %i, align 4, !dbg !263
  %cmp13 = icmp slt i32 %13, 10, !dbg !265
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !266

for.body14:                                       ; preds = %for.cond12
  %14 = load i32*, i32** %buffer, align 8, !dbg !267
  %15 = load i32, i32* %i, align 4, !dbg !269
  %idxprom15 = sext i32 %15 to i64, !dbg !267
  %arrayidx16 = getelementptr inbounds i32, i32* %14, i64 %idxprom15, !dbg !267
  %16 = load i32, i32* %arrayidx16, align 4, !dbg !267
  call void @printIntLine(i32 noundef %16), !dbg !270
  br label %for.inc17, !dbg !271

for.inc17:                                        ; preds = %for.body14
  %17 = load i32, i32* %i, align 4, !dbg !272
  %inc18 = add nsw i32 %17, 1, !dbg !272
  store i32 %inc18, i32* %i, align 4, !dbg !272
  br label %for.cond12, !dbg !273, !llvm.loop !274

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !276

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !277
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %18 = load i32*, i32** %buffer, align 8, !dbg !279
  %19 = bitcast i32* %18 to i8*, !dbg !279
  call void @free(i8* noundef %19), !dbg !280
  br label %if.end21, !dbg !281

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !282
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !283 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !284, metadata !DIExpression()), !dbg !285
  store i32 -1, i32* %data, align 4, !dbg !286
  %0 = load i32, i32* @staticFalse, align 4, !dbg !287
  %tobool = icmp ne i32 %0, 0, !dbg !287
  br i1 %tobool, label %if.then, label %if.else, !dbg !289

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !290
  br label %if.end, !dbg !292

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !293
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !295
  %tobool1 = icmp ne i32 %1, 0, !dbg !295
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !297

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !298, metadata !DIExpression()), !dbg !301
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !302, metadata !DIExpression()), !dbg !303
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !304
  %2 = bitcast i8* %call to i32*, !dbg !305
  store i32* %2, i32** %buffer, align 8, !dbg !303
  %3 = load i32*, i32** %buffer, align 8, !dbg !306
  %cmp = icmp eq i32* %3, null, !dbg !308
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !309

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !310
  unreachable, !dbg !310

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !312
  br label %for.cond, !dbg !314

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !315
  %cmp5 = icmp slt i32 %4, 10, !dbg !317
  br i1 %cmp5, label %for.body, label %for.end, !dbg !318

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
  %cmp6 = icmp sge i32 %8, 0, !dbg !330
  br i1 %cmp6, label %if.then7, label %if.else18, !dbg !331

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !332
  %10 = load i32, i32* %data, align 4, !dbg !334
  %idxprom8 = sext i32 %10 to i64, !dbg !332
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !332
  store i32 1, i32* %arrayidx9, align 4, !dbg !335
  store i32 0, i32* %i, align 4, !dbg !336
  br label %for.cond10, !dbg !338

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !339
  %cmp11 = icmp slt i32 %11, 10, !dbg !341
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !342

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !343
  %13 = load i32, i32* %i, align 4, !dbg !345
  %idxprom13 = sext i32 %13 to i64, !dbg !343
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !343
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !343
  call void @printIntLine(i32 noundef %14), !dbg !346
  br label %for.inc15, !dbg !347

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !348
  %inc16 = add nsw i32 %15, 1, !dbg !348
  store i32 %inc16, i32* %i, align 4, !dbg !348
  br label %for.cond10, !dbg !349, !llvm.loop !350

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !352

if.else18:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !353
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !355
  %17 = bitcast i32* %16 to i8*, !dbg !355
  call void @free(i8* noundef %17), !dbg !356
  br label %if.end20, !dbg !357

if.end20:                                         ; preds = %if.end19, %if.end
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !363
  %tobool = icmp ne i32 %0, 0, !dbg !363
  br i1 %tobool, label %if.then, label %if.end, !dbg !365

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !366
  br label %if.end, !dbg !368

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !369
  %tobool1 = icmp ne i32 %1, 0, !dbg !369
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !371

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !372, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !376, metadata !DIExpression()), !dbg !377
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !378
  %2 = bitcast i8* %call to i32*, !dbg !379
  store i32* %2, i32** %buffer, align 8, !dbg !377
  %3 = load i32*, i32** %buffer, align 8, !dbg !380
  %cmp = icmp eq i32* %3, null, !dbg !382
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !383

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #6, !dbg !384
  unreachable, !dbg !384

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !386
  br label %for.cond, !dbg !388

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !389
  %cmp5 = icmp slt i32 %4, 10, !dbg !391
  br i1 %cmp5, label %for.body, label %for.end, !dbg !392

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !393
  %6 = load i32, i32* %i, align 4, !dbg !395
  %idxprom = sext i32 %6 to i64, !dbg !393
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !393
  store i32 0, i32* %arrayidx, align 4, !dbg !396
  br label %for.inc, !dbg !397

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !398
  %inc = add nsw i32 %7, 1, !dbg !398
  store i32 %inc, i32* %i, align 4, !dbg !398
  br label %for.cond, !dbg !399, !llvm.loop !400

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !402
  %cmp6 = icmp sge i32 %8, 0, !dbg !404
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !405

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !406
  %10 = load i32, i32* %data, align 4, !dbg !408
  %idxprom8 = sext i32 %10 to i64, !dbg !406
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !406
  store i32 1, i32* %arrayidx9, align 4, !dbg !409
  store i32 0, i32* %i, align 4, !dbg !410
  br label %for.cond10, !dbg !412

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !413
  %cmp11 = icmp slt i32 %11, 10, !dbg !415
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !416

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !417
  %13 = load i32, i32* %i, align 4, !dbg !419
  %idxprom13 = sext i32 %13 to i64, !dbg !417
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !417
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !417
  call void @printIntLine(i32 noundef %14), !dbg !420
  br label %for.inc15, !dbg !421

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !422
  %inc16 = add nsw i32 %15, 1, !dbg !422
  store i32 %inc16, i32* %i, align 4, !dbg !422
  br label %for.cond10, !dbg !423, !llvm.loop !424

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !426

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !427
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !429
  %17 = bitcast i32* %16 to i8*, !dbg !429
  call void @free(i8* noundef %17), !dbg !430
  br label %if.end19, !dbg !431

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !432
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 23, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 24, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_05_bad", scope: !12, file: !12, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 30, type: !6)
!25 = !DILocation(line: 30, column: 9, scope: !20)
!26 = !DILocation(line: 32, column: 10, scope: !20)
!27 = !DILocation(line: 33, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !12, line: 33, column: 8)
!29 = !DILocation(line: 33, column: 8, scope: !20)
!30 = !DILocation(line: 36, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 34, column: 5)
!32 = !DILocation(line: 36, column: 9, scope: !31)
!33 = !DILocation(line: 37, column: 5, scope: !31)
!34 = !DILocation(line: 38, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !20, file: !12, line: 38, column: 8)
!36 = !DILocation(line: 38, column: 8, scope: !20)
!37 = !DILocalVariable(name: "i", scope: !38, file: !12, line: 41, type: !6)
!38 = distinct !DILexicalBlock(scope: !39, file: !12, line: 40, column: 9)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 39, column: 5)
!40 = !DILocation(line: 41, column: 17, scope: !38)
!41 = !DILocalVariable(name: "buffer", scope: !38, file: !12, line: 42, type: !5)
!42 = !DILocation(line: 42, column: 19, scope: !38)
!43 = !DILocation(line: 42, column: 35, scope: !38)
!44 = !DILocation(line: 42, column: 28, scope: !38)
!45 = !DILocation(line: 43, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !38, file: !12, line: 43, column: 17)
!47 = !DILocation(line: 43, column: 24, scope: !46)
!48 = !DILocation(line: 43, column: 17, scope: !38)
!49 = !DILocation(line: 43, column: 34, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 43, column: 33)
!51 = !DILocation(line: 45, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !38, file: !12, line: 45, column: 13)
!53 = !DILocation(line: 45, column: 18, scope: !52)
!54 = !DILocation(line: 45, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 45, column: 13)
!56 = !DILocation(line: 45, column: 27, scope: !55)
!57 = !DILocation(line: 45, column: 13, scope: !52)
!58 = !DILocation(line: 47, column: 17, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 46, column: 13)
!60 = !DILocation(line: 47, column: 24, scope: !59)
!61 = !DILocation(line: 47, column: 27, scope: !59)
!62 = !DILocation(line: 48, column: 13, scope: !59)
!63 = !DILocation(line: 45, column: 34, scope: !55)
!64 = !DILocation(line: 45, column: 13, scope: !55)
!65 = distinct !{!65, !57, !66, !67}
!66 = !DILocation(line: 48, column: 13, scope: !52)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 51, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !38, file: !12, line: 51, column: 17)
!70 = !DILocation(line: 51, column: 22, scope: !69)
!71 = !DILocation(line: 51, column: 17, scope: !38)
!72 = !DILocation(line: 53, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !12, line: 52, column: 13)
!74 = !DILocation(line: 53, column: 24, scope: !73)
!75 = !DILocation(line: 53, column: 30, scope: !73)
!76 = !DILocation(line: 55, column: 23, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !12, line: 55, column: 17)
!78 = !DILocation(line: 55, column: 21, scope: !77)
!79 = !DILocation(line: 55, column: 28, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !12, line: 55, column: 17)
!81 = !DILocation(line: 55, column: 30, scope: !80)
!82 = !DILocation(line: 55, column: 17, scope: !77)
!83 = !DILocation(line: 57, column: 34, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !12, line: 56, column: 17)
!85 = !DILocation(line: 57, column: 41, scope: !84)
!86 = !DILocation(line: 57, column: 21, scope: !84)
!87 = !DILocation(line: 58, column: 17, scope: !84)
!88 = !DILocation(line: 55, column: 37, scope: !80)
!89 = !DILocation(line: 55, column: 17, scope: !80)
!90 = distinct !{!90, !82, !91, !67}
!91 = !DILocation(line: 58, column: 17, scope: !77)
!92 = !DILocation(line: 59, column: 13, scope: !73)
!93 = !DILocation(line: 62, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !69, file: !12, line: 61, column: 13)
!95 = !DILocation(line: 64, column: 18, scope: !38)
!96 = !DILocation(line: 64, column: 13, scope: !38)
!97 = !DILocation(line: 66, column: 5, scope: !39)
!98 = !DILocation(line: 67, column: 1, scope: !20)
!99 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_05_good", scope: !12, file: !12, line: 251, type: !21, scopeLine: 252, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!100 = !DILocation(line: 253, column: 5, scope: !99)
!101 = !DILocation(line: 254, column: 5, scope: !99)
!102 = !DILocation(line: 255, column: 5, scope: !99)
!103 = !DILocation(line: 256, column: 5, scope: !99)
!104 = !DILocation(line: 257, column: 1, scope: !99)
!105 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 268, type: !106, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!106 = !DISubroutineType(types: !107)
!107 = !{!6, !6, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!111 = !DILocalVariable(name: "argc", arg: 1, scope: !105, file: !12, line: 268, type: !6)
!112 = !DILocation(line: 268, column: 14, scope: !105)
!113 = !DILocalVariable(name: "argv", arg: 2, scope: !105, file: !12, line: 268, type: !108)
!114 = !DILocation(line: 268, column: 27, scope: !105)
!115 = !DILocation(line: 271, column: 22, scope: !105)
!116 = !DILocation(line: 271, column: 12, scope: !105)
!117 = !DILocation(line: 271, column: 5, scope: !105)
!118 = !DILocation(line: 273, column: 5, scope: !105)
!119 = !DILocation(line: 274, column: 5, scope: !105)
!120 = !DILocation(line: 275, column: 5, scope: !105)
!121 = !DILocation(line: 278, column: 5, scope: !105)
!122 = !DILocation(line: 279, column: 5, scope: !105)
!123 = !DILocation(line: 280, column: 5, scope: !105)
!124 = !DILocation(line: 282, column: 5, scope: !105)
!125 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 74, type: !21, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!126 = !DILocalVariable(name: "data", scope: !125, file: !12, line: 76, type: !6)
!127 = !DILocation(line: 76, column: 9, scope: !125)
!128 = !DILocation(line: 78, column: 10, scope: !125)
!129 = !DILocation(line: 79, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !12, line: 79, column: 8)
!131 = !DILocation(line: 79, column: 8, scope: !125)
!132 = !DILocation(line: 82, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 80, column: 5)
!134 = !DILocation(line: 82, column: 9, scope: !133)
!135 = !DILocation(line: 83, column: 5, scope: !133)
!136 = !DILocation(line: 84, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !125, file: !12, line: 84, column: 8)
!138 = !DILocation(line: 84, column: 8, scope: !125)
!139 = !DILocation(line: 87, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 85, column: 5)
!141 = !DILocation(line: 88, column: 5, scope: !140)
!142 = !DILocalVariable(name: "i", scope: !143, file: !12, line: 92, type: !6)
!143 = distinct !DILexicalBlock(scope: !144, file: !12, line: 91, column: 9)
!144 = distinct !DILexicalBlock(scope: !137, file: !12, line: 90, column: 5)
!145 = !DILocation(line: 92, column: 17, scope: !143)
!146 = !DILocalVariable(name: "buffer", scope: !143, file: !12, line: 93, type: !5)
!147 = !DILocation(line: 93, column: 19, scope: !143)
!148 = !DILocation(line: 93, column: 35, scope: !143)
!149 = !DILocation(line: 93, column: 28, scope: !143)
!150 = !DILocation(line: 94, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !143, file: !12, line: 94, column: 17)
!152 = !DILocation(line: 94, column: 24, scope: !151)
!153 = !DILocation(line: 94, column: 17, scope: !143)
!154 = !DILocation(line: 94, column: 34, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !12, line: 94, column: 33)
!156 = !DILocation(line: 96, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !143, file: !12, line: 96, column: 13)
!158 = !DILocation(line: 96, column: 18, scope: !157)
!159 = !DILocation(line: 96, column: 25, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !12, line: 96, column: 13)
!161 = !DILocation(line: 96, column: 27, scope: !160)
!162 = !DILocation(line: 96, column: 13, scope: !157)
!163 = !DILocation(line: 98, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !12, line: 97, column: 13)
!165 = !DILocation(line: 98, column: 24, scope: !164)
!166 = !DILocation(line: 98, column: 27, scope: !164)
!167 = !DILocation(line: 99, column: 13, scope: !164)
!168 = !DILocation(line: 96, column: 34, scope: !160)
!169 = !DILocation(line: 96, column: 13, scope: !160)
!170 = distinct !{!170, !162, !171, !67}
!171 = !DILocation(line: 99, column: 13, scope: !157)
!172 = !DILocation(line: 101, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !143, file: !12, line: 101, column: 17)
!174 = !DILocation(line: 101, column: 22, scope: !173)
!175 = !DILocation(line: 101, column: 27, scope: !173)
!176 = !DILocation(line: 101, column: 30, scope: !173)
!177 = !DILocation(line: 101, column: 35, scope: !173)
!178 = !DILocation(line: 101, column: 17, scope: !143)
!179 = !DILocation(line: 103, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !173, file: !12, line: 102, column: 13)
!181 = !DILocation(line: 103, column: 24, scope: !180)
!182 = !DILocation(line: 103, column: 30, scope: !180)
!183 = !DILocation(line: 105, column: 23, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !12, line: 105, column: 17)
!185 = !DILocation(line: 105, column: 21, scope: !184)
!186 = !DILocation(line: 105, column: 28, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !12, line: 105, column: 17)
!188 = !DILocation(line: 105, column: 30, scope: !187)
!189 = !DILocation(line: 105, column: 17, scope: !184)
!190 = !DILocation(line: 107, column: 34, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !12, line: 106, column: 17)
!192 = !DILocation(line: 107, column: 41, scope: !191)
!193 = !DILocation(line: 107, column: 21, scope: !191)
!194 = !DILocation(line: 108, column: 17, scope: !191)
!195 = !DILocation(line: 105, column: 37, scope: !187)
!196 = !DILocation(line: 105, column: 17, scope: !187)
!197 = distinct !{!197, !189, !198, !67}
!198 = !DILocation(line: 108, column: 17, scope: !184)
!199 = !DILocation(line: 109, column: 13, scope: !180)
!200 = !DILocation(line: 112, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !173, file: !12, line: 111, column: 13)
!202 = !DILocation(line: 114, column: 18, scope: !143)
!203 = !DILocation(line: 114, column: 13, scope: !143)
!204 = !DILocation(line: 117, column: 1, scope: !125)
!205 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 120, type: !21, scopeLine: 121, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!206 = !DILocalVariable(name: "data", scope: !205, file: !12, line: 122, type: !6)
!207 = !DILocation(line: 122, column: 9, scope: !205)
!208 = !DILocation(line: 124, column: 10, scope: !205)
!209 = !DILocation(line: 125, column: 8, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !12, line: 125, column: 8)
!211 = !DILocation(line: 125, column: 8, scope: !205)
!212 = !DILocation(line: 128, column: 16, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !12, line: 126, column: 5)
!214 = !DILocation(line: 128, column: 9, scope: !213)
!215 = !DILocation(line: 129, column: 5, scope: !213)
!216 = !DILocation(line: 130, column: 8, scope: !217)
!217 = distinct !DILexicalBlock(scope: !205, file: !12, line: 130, column: 8)
!218 = !DILocation(line: 130, column: 8, scope: !205)
!219 = !DILocalVariable(name: "i", scope: !220, file: !12, line: 133, type: !6)
!220 = distinct !DILexicalBlock(scope: !221, file: !12, line: 132, column: 9)
!221 = distinct !DILexicalBlock(scope: !217, file: !12, line: 131, column: 5)
!222 = !DILocation(line: 133, column: 17, scope: !220)
!223 = !DILocalVariable(name: "buffer", scope: !220, file: !12, line: 134, type: !5)
!224 = !DILocation(line: 134, column: 19, scope: !220)
!225 = !DILocation(line: 134, column: 35, scope: !220)
!226 = !DILocation(line: 134, column: 28, scope: !220)
!227 = !DILocation(line: 135, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !220, file: !12, line: 135, column: 17)
!229 = !DILocation(line: 135, column: 24, scope: !228)
!230 = !DILocation(line: 135, column: 17, scope: !220)
!231 = !DILocation(line: 135, column: 34, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !12, line: 135, column: 33)
!233 = !DILocation(line: 137, column: 20, scope: !234)
!234 = distinct !DILexicalBlock(scope: !220, file: !12, line: 137, column: 13)
!235 = !DILocation(line: 137, column: 18, scope: !234)
!236 = !DILocation(line: 137, column: 25, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !12, line: 137, column: 13)
!238 = !DILocation(line: 137, column: 27, scope: !237)
!239 = !DILocation(line: 137, column: 13, scope: !234)
!240 = !DILocation(line: 139, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !12, line: 138, column: 13)
!242 = !DILocation(line: 139, column: 24, scope: !241)
!243 = !DILocation(line: 139, column: 27, scope: !241)
!244 = !DILocation(line: 140, column: 13, scope: !241)
!245 = !DILocation(line: 137, column: 34, scope: !237)
!246 = !DILocation(line: 137, column: 13, scope: !237)
!247 = distinct !{!247, !239, !248, !67}
!248 = !DILocation(line: 140, column: 13, scope: !234)
!249 = !DILocation(line: 142, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !220, file: !12, line: 142, column: 17)
!251 = !DILocation(line: 142, column: 22, scope: !250)
!252 = !DILocation(line: 142, column: 27, scope: !250)
!253 = !DILocation(line: 142, column: 30, scope: !250)
!254 = !DILocation(line: 142, column: 35, scope: !250)
!255 = !DILocation(line: 142, column: 17, scope: !220)
!256 = !DILocation(line: 144, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !250, file: !12, line: 143, column: 13)
!258 = !DILocation(line: 144, column: 24, scope: !257)
!259 = !DILocation(line: 144, column: 30, scope: !257)
!260 = !DILocation(line: 146, column: 23, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !12, line: 146, column: 17)
!262 = !DILocation(line: 146, column: 21, scope: !261)
!263 = !DILocation(line: 146, column: 28, scope: !264)
!264 = distinct !DILexicalBlock(scope: !261, file: !12, line: 146, column: 17)
!265 = !DILocation(line: 146, column: 30, scope: !264)
!266 = !DILocation(line: 146, column: 17, scope: !261)
!267 = !DILocation(line: 148, column: 34, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !12, line: 147, column: 17)
!269 = !DILocation(line: 148, column: 41, scope: !268)
!270 = !DILocation(line: 148, column: 21, scope: !268)
!271 = !DILocation(line: 149, column: 17, scope: !268)
!272 = !DILocation(line: 146, column: 37, scope: !264)
!273 = !DILocation(line: 146, column: 17, scope: !264)
!274 = distinct !{!274, !266, !275, !67}
!275 = !DILocation(line: 149, column: 17, scope: !261)
!276 = !DILocation(line: 150, column: 13, scope: !257)
!277 = !DILocation(line: 153, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !250, file: !12, line: 152, column: 13)
!279 = !DILocation(line: 155, column: 18, scope: !220)
!280 = !DILocation(line: 155, column: 13, scope: !220)
!281 = !DILocation(line: 157, column: 5, scope: !221)
!282 = !DILocation(line: 158, column: 1, scope: !205)
!283 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 161, type: !21, scopeLine: 162, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!284 = !DILocalVariable(name: "data", scope: !283, file: !12, line: 163, type: !6)
!285 = !DILocation(line: 163, column: 9, scope: !283)
!286 = !DILocation(line: 165, column: 10, scope: !283)
!287 = !DILocation(line: 166, column: 8, scope: !288)
!288 = distinct !DILexicalBlock(scope: !283, file: !12, line: 166, column: 8)
!289 = !DILocation(line: 166, column: 8, scope: !283)
!290 = !DILocation(line: 169, column: 9, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !12, line: 167, column: 5)
!292 = !DILocation(line: 170, column: 5, scope: !291)
!293 = !DILocation(line: 175, column: 14, scope: !294)
!294 = distinct !DILexicalBlock(scope: !288, file: !12, line: 172, column: 5)
!295 = !DILocation(line: 177, column: 8, scope: !296)
!296 = distinct !DILexicalBlock(scope: !283, file: !12, line: 177, column: 8)
!297 = !DILocation(line: 177, column: 8, scope: !283)
!298 = !DILocalVariable(name: "i", scope: !299, file: !12, line: 180, type: !6)
!299 = distinct !DILexicalBlock(scope: !300, file: !12, line: 179, column: 9)
!300 = distinct !DILexicalBlock(scope: !296, file: !12, line: 178, column: 5)
!301 = !DILocation(line: 180, column: 17, scope: !299)
!302 = !DILocalVariable(name: "buffer", scope: !299, file: !12, line: 181, type: !5)
!303 = !DILocation(line: 181, column: 19, scope: !299)
!304 = !DILocation(line: 181, column: 35, scope: !299)
!305 = !DILocation(line: 181, column: 28, scope: !299)
!306 = !DILocation(line: 182, column: 17, scope: !307)
!307 = distinct !DILexicalBlock(scope: !299, file: !12, line: 182, column: 17)
!308 = !DILocation(line: 182, column: 24, scope: !307)
!309 = !DILocation(line: 182, column: 17, scope: !299)
!310 = !DILocation(line: 182, column: 34, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !12, line: 182, column: 33)
!312 = !DILocation(line: 184, column: 20, scope: !313)
!313 = distinct !DILexicalBlock(scope: !299, file: !12, line: 184, column: 13)
!314 = !DILocation(line: 184, column: 18, scope: !313)
!315 = !DILocation(line: 184, column: 25, scope: !316)
!316 = distinct !DILexicalBlock(scope: !313, file: !12, line: 184, column: 13)
!317 = !DILocation(line: 184, column: 27, scope: !316)
!318 = !DILocation(line: 184, column: 13, scope: !313)
!319 = !DILocation(line: 186, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !12, line: 185, column: 13)
!321 = !DILocation(line: 186, column: 24, scope: !320)
!322 = !DILocation(line: 186, column: 27, scope: !320)
!323 = !DILocation(line: 187, column: 13, scope: !320)
!324 = !DILocation(line: 184, column: 34, scope: !316)
!325 = !DILocation(line: 184, column: 13, scope: !316)
!326 = distinct !{!326, !318, !327, !67}
!327 = !DILocation(line: 187, column: 13, scope: !313)
!328 = !DILocation(line: 190, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !299, file: !12, line: 190, column: 17)
!330 = !DILocation(line: 190, column: 22, scope: !329)
!331 = !DILocation(line: 190, column: 17, scope: !299)
!332 = !DILocation(line: 192, column: 17, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !12, line: 191, column: 13)
!334 = !DILocation(line: 192, column: 24, scope: !333)
!335 = !DILocation(line: 192, column: 30, scope: !333)
!336 = !DILocation(line: 194, column: 23, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !12, line: 194, column: 17)
!338 = !DILocation(line: 194, column: 21, scope: !337)
!339 = !DILocation(line: 194, column: 28, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !12, line: 194, column: 17)
!341 = !DILocation(line: 194, column: 30, scope: !340)
!342 = !DILocation(line: 194, column: 17, scope: !337)
!343 = !DILocation(line: 196, column: 34, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !12, line: 195, column: 17)
!345 = !DILocation(line: 196, column: 41, scope: !344)
!346 = !DILocation(line: 196, column: 21, scope: !344)
!347 = !DILocation(line: 197, column: 17, scope: !344)
!348 = !DILocation(line: 194, column: 37, scope: !340)
!349 = !DILocation(line: 194, column: 17, scope: !340)
!350 = distinct !{!350, !342, !351, !67}
!351 = !DILocation(line: 197, column: 17, scope: !337)
!352 = !DILocation(line: 198, column: 13, scope: !333)
!353 = !DILocation(line: 201, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !329, file: !12, line: 200, column: 13)
!355 = !DILocation(line: 203, column: 18, scope: !299)
!356 = !DILocation(line: 203, column: 13, scope: !299)
!357 = !DILocation(line: 205, column: 5, scope: !300)
!358 = !DILocation(line: 206, column: 1, scope: !283)
!359 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 209, type: !21, scopeLine: 210, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!360 = !DILocalVariable(name: "data", scope: !359, file: !12, line: 211, type: !6)
!361 = !DILocation(line: 211, column: 9, scope: !359)
!362 = !DILocation(line: 213, column: 10, scope: !359)
!363 = !DILocation(line: 214, column: 8, scope: !364)
!364 = distinct !DILexicalBlock(scope: !359, file: !12, line: 214, column: 8)
!365 = !DILocation(line: 214, column: 8, scope: !359)
!366 = !DILocation(line: 218, column: 14, scope: !367)
!367 = distinct !DILexicalBlock(scope: !364, file: !12, line: 215, column: 5)
!368 = !DILocation(line: 219, column: 5, scope: !367)
!369 = !DILocation(line: 220, column: 8, scope: !370)
!370 = distinct !DILexicalBlock(scope: !359, file: !12, line: 220, column: 8)
!371 = !DILocation(line: 220, column: 8, scope: !359)
!372 = !DILocalVariable(name: "i", scope: !373, file: !12, line: 223, type: !6)
!373 = distinct !DILexicalBlock(scope: !374, file: !12, line: 222, column: 9)
!374 = distinct !DILexicalBlock(scope: !370, file: !12, line: 221, column: 5)
!375 = !DILocation(line: 223, column: 17, scope: !373)
!376 = !DILocalVariable(name: "buffer", scope: !373, file: !12, line: 224, type: !5)
!377 = !DILocation(line: 224, column: 19, scope: !373)
!378 = !DILocation(line: 224, column: 35, scope: !373)
!379 = !DILocation(line: 224, column: 28, scope: !373)
!380 = !DILocation(line: 225, column: 17, scope: !381)
!381 = distinct !DILexicalBlock(scope: !373, file: !12, line: 225, column: 17)
!382 = !DILocation(line: 225, column: 24, scope: !381)
!383 = !DILocation(line: 225, column: 17, scope: !373)
!384 = !DILocation(line: 225, column: 34, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !12, line: 225, column: 33)
!386 = !DILocation(line: 227, column: 20, scope: !387)
!387 = distinct !DILexicalBlock(scope: !373, file: !12, line: 227, column: 13)
!388 = !DILocation(line: 227, column: 18, scope: !387)
!389 = !DILocation(line: 227, column: 25, scope: !390)
!390 = distinct !DILexicalBlock(scope: !387, file: !12, line: 227, column: 13)
!391 = !DILocation(line: 227, column: 27, scope: !390)
!392 = !DILocation(line: 227, column: 13, scope: !387)
!393 = !DILocation(line: 229, column: 17, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !12, line: 228, column: 13)
!395 = !DILocation(line: 229, column: 24, scope: !394)
!396 = !DILocation(line: 229, column: 27, scope: !394)
!397 = !DILocation(line: 230, column: 13, scope: !394)
!398 = !DILocation(line: 227, column: 34, scope: !390)
!399 = !DILocation(line: 227, column: 13, scope: !390)
!400 = distinct !{!400, !392, !401, !67}
!401 = !DILocation(line: 230, column: 13, scope: !387)
!402 = !DILocation(line: 233, column: 17, scope: !403)
!403 = distinct !DILexicalBlock(scope: !373, file: !12, line: 233, column: 17)
!404 = !DILocation(line: 233, column: 22, scope: !403)
!405 = !DILocation(line: 233, column: 17, scope: !373)
!406 = !DILocation(line: 235, column: 17, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !12, line: 234, column: 13)
!408 = !DILocation(line: 235, column: 24, scope: !407)
!409 = !DILocation(line: 235, column: 30, scope: !407)
!410 = !DILocation(line: 237, column: 23, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !12, line: 237, column: 17)
!412 = !DILocation(line: 237, column: 21, scope: !411)
!413 = !DILocation(line: 237, column: 28, scope: !414)
!414 = distinct !DILexicalBlock(scope: !411, file: !12, line: 237, column: 17)
!415 = !DILocation(line: 237, column: 30, scope: !414)
!416 = !DILocation(line: 237, column: 17, scope: !411)
!417 = !DILocation(line: 239, column: 34, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !12, line: 238, column: 17)
!419 = !DILocation(line: 239, column: 41, scope: !418)
!420 = !DILocation(line: 239, column: 21, scope: !418)
!421 = !DILocation(line: 240, column: 17, scope: !418)
!422 = !DILocation(line: 237, column: 37, scope: !414)
!423 = !DILocation(line: 237, column: 17, scope: !414)
!424 = distinct !{!424, !416, !425, !67}
!425 = !DILocation(line: 240, column: 17, scope: !411)
!426 = !DILocation(line: 241, column: 13, scope: !407)
!427 = !DILocation(line: 244, column: 17, scope: !428)
!428 = distinct !DILexicalBlock(scope: !403, file: !12, line: 243, column: 13)
!429 = !DILocation(line: 246, column: 18, scope: !373)
!430 = !DILocation(line: 246, column: 13, scope: !373)
!431 = !DILocation(line: 248, column: 5, scope: !374)
!432 = !DILocation(line: 249, column: 1, scope: !359)
