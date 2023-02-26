; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !22
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !24, metadata !DIExpression()), !dbg !26
  %1 = load i32, i32* %data, align 4, !dbg !27
  store i32 %1, i32* %dataCopy, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = load i32, i32* %dataCopy, align 4, !dbg !30
  store i32 %2, i32* %data1, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !34, metadata !DIExpression()), !dbg !35
  %call2 = call i8* @malloc(i64 noundef 40) #5, !dbg !36
  %3 = bitcast i8* %call2 to i32*, !dbg !37
  store i32* %3, i32** %buffer, align 8, !dbg !35
  %4 = load i32*, i32** %buffer, align 8, !dbg !38
  %cmp = icmp eq i32* %4, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !47
  %cmp3 = icmp slt i32 %5, 10, !dbg !49
  br i1 %cmp3, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !51
  %7 = load i32, i32* %i, align 4, !dbg !53
  %idxprom = sext i32 %7 to i64, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !51
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !56
  %inc = add nsw i32 %8, 1, !dbg !56
  store i32 %inc, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data1, align 4, !dbg !61
  %cmp4 = icmp sge i32 %9, 0, !dbg !63
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !64

if.then5:                                         ; preds = %for.end
  %10 = load i32*, i32** %buffer, align 8, !dbg !65
  %11 = load i32, i32* %data1, align 4, !dbg !67
  %idxprom6 = sext i32 %11 to i64, !dbg !65
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %idxprom6, !dbg !65
  store i32 1, i32* %arrayidx7, align 4, !dbg !68
  store i32 0, i32* %i, align 4, !dbg !69
  br label %for.cond8, !dbg !71

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %12 = load i32, i32* %i, align 4, !dbg !72
  %cmp9 = icmp slt i32 %12, 10, !dbg !74
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !75

for.body10:                                       ; preds = %for.cond8
  %13 = load i32*, i32** %buffer, align 8, !dbg !76
  %14 = load i32, i32* %i, align 4, !dbg !78
  %idxprom11 = sext i32 %14 to i64, !dbg !76
  %arrayidx12 = getelementptr inbounds i32, i32* %13, i64 %idxprom11, !dbg !76
  %15 = load i32, i32* %arrayidx12, align 4, !dbg !76
  call void @printIntLine(i32 noundef %15), !dbg !79
  br label %for.inc13, !dbg !80

for.inc13:                                        ; preds = %for.body10
  %16 = load i32, i32* %i, align 4, !dbg !81
  %inc14 = add nsw i32 %16, 1, !dbg !81
  store i32 %inc14, i32* %i, align 4, !dbg !81
  br label %for.cond8, !dbg !82, !llvm.loop !83

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !85

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %17 = load i32*, i32** %buffer, align 8, !dbg !88
  %18 = bitcast i32* %17 to i8*, !dbg !88
  call void @free(i8* noundef %18), !dbg !89
  ret void, !dbg !90
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  call void @goodB2G(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* noundef null), !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 noundef %conv), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_good(), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_bad(), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 -1, i32* %data, align 4, !dbg !118
  store i32 7, i32* %data, align 4, !dbg !119
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !120, metadata !DIExpression()), !dbg !122
  %0 = load i32, i32* %data, align 4, !dbg !123
  store i32 %0, i32* %dataCopy, align 4, !dbg !122
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !124, metadata !DIExpression()), !dbg !125
  %1 = load i32, i32* %dataCopy, align 4, !dbg !126
  store i32 %1, i32* %data1, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata i32* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !130, metadata !DIExpression()), !dbg !131
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !132
  %2 = bitcast i8* %call to i32*, !dbg !133
  store i32* %2, i32** %buffer, align 8, !dbg !131
  %3 = load i32*, i32** %buffer, align 8, !dbg !134
  %cmp = icmp eq i32* %3, null, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !138
  unreachable, !dbg !138

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !143
  %cmp2 = icmp slt i32 %4, 10, !dbg !145
  br i1 %cmp2, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !147
  %6 = load i32, i32* %i, align 4, !dbg !149
  %idxprom = sext i32 %6 to i64, !dbg !147
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !147
  store i32 0, i32* %arrayidx, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !152
  %inc = add nsw i32 %7, 1, !dbg !152
  store i32 %inc, i32* %i, align 4, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !156
  %cmp3 = icmp sge i32 %8, 0, !dbg !158
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !159

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !160
  %10 = load i32, i32* %data1, align 4, !dbg !162
  %idxprom5 = sext i32 %10 to i64, !dbg !160
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !160
  store i32 1, i32* %arrayidx6, align 4, !dbg !163
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond7, !dbg !166

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !167
  %cmp8 = icmp slt i32 %11, 10, !dbg !169
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !170

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !171
  %13 = load i32, i32* %i, align 4, !dbg !173
  %idxprom10 = sext i32 %13 to i64, !dbg !171
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !171
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !171
  call void @printIntLine(i32 noundef %14), !dbg !174
  br label %for.inc12, !dbg !175

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !176
  %inc13 = add nsw i32 %15, 1, !dbg !176
  store i32 %inc13, i32* %i, align 4, !dbg !176
  br label %for.cond7, !dbg !177, !llvm.loop !178

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !180

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !181
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !183
  %17 = bitcast i32* %16 to i8*, !dbg !183
  call void @free(i8* noundef %17), !dbg !184
  ret void, !dbg !185
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !186 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !187, metadata !DIExpression()), !dbg !188
  store i32 -1, i32* %data, align 4, !dbg !189
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !190
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !191
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !192, metadata !DIExpression()), !dbg !194
  %1 = load i32, i32* %data, align 4, !dbg !195
  store i32 %1, i32* %dataCopy, align 4, !dbg !194
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !196, metadata !DIExpression()), !dbg !197
  %2 = load i32, i32* %dataCopy, align 4, !dbg !198
  store i32 %2, i32* %data1, align 4, !dbg !197
  call void @llvm.dbg.declare(metadata i32* %i, metadata !199, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !202, metadata !DIExpression()), !dbg !203
  %call2 = call i8* @malloc(i64 noundef 40) #5, !dbg !204
  %3 = bitcast i8* %call2 to i32*, !dbg !205
  store i32* %3, i32** %buffer, align 8, !dbg !203
  %4 = load i32*, i32** %buffer, align 8, !dbg !206
  %cmp = icmp eq i32* %4, null, !dbg !208
  br i1 %cmp, label %if.then, label %if.end, !dbg !209

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !210
  unreachable, !dbg !210

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !215
  %cmp3 = icmp slt i32 %5, 10, !dbg !217
  br i1 %cmp3, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %buffer, align 8, !dbg !219
  %7 = load i32, i32* %i, align 4, !dbg !221
  %idxprom = sext i32 %7 to i64, !dbg !219
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !219
  store i32 0, i32* %arrayidx, align 4, !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !224
  %inc = add nsw i32 %8, 1, !dbg !224
  store i32 %inc, i32* %i, align 4, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %data1, align 4, !dbg !228
  %cmp4 = icmp sge i32 %9, 0, !dbg !230
  br i1 %cmp4, label %land.lhs.true, label %if.else, !dbg !231

land.lhs.true:                                    ; preds = %for.end
  %10 = load i32, i32* %data1, align 4, !dbg !232
  %cmp5 = icmp slt i32 %10, 10, !dbg !233
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !234

if.then6:                                         ; preds = %land.lhs.true
  %11 = load i32*, i32** %buffer, align 8, !dbg !235
  %12 = load i32, i32* %data1, align 4, !dbg !237
  %idxprom7 = sext i32 %12 to i64, !dbg !235
  %arrayidx8 = getelementptr inbounds i32, i32* %11, i64 %idxprom7, !dbg !235
  store i32 1, i32* %arrayidx8, align 4, !dbg !238
  store i32 0, i32* %i, align 4, !dbg !239
  br label %for.cond9, !dbg !241

for.cond9:                                        ; preds = %for.inc14, %if.then6
  %13 = load i32, i32* %i, align 4, !dbg !242
  %cmp10 = icmp slt i32 %13, 10, !dbg !244
  br i1 %cmp10, label %for.body11, label %for.end16, !dbg !245

for.body11:                                       ; preds = %for.cond9
  %14 = load i32*, i32** %buffer, align 8, !dbg !246
  %15 = load i32, i32* %i, align 4, !dbg !248
  %idxprom12 = sext i32 %15 to i64, !dbg !246
  %arrayidx13 = getelementptr inbounds i32, i32* %14, i64 %idxprom12, !dbg !246
  %16 = load i32, i32* %arrayidx13, align 4, !dbg !246
  call void @printIntLine(i32 noundef %16), !dbg !249
  br label %for.inc14, !dbg !250

for.inc14:                                        ; preds = %for.body11
  %17 = load i32, i32* %i, align 4, !dbg !251
  %inc15 = add nsw i32 %17, 1, !dbg !251
  store i32 %inc15, i32* %i, align 4, !dbg !251
  br label %for.cond9, !dbg !252, !llvm.loop !253

for.end16:                                        ; preds = %for.cond9
  br label %if.end17, !dbg !255

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !256
  br label %if.end17

if.end17:                                         ; preds = %if.else, %for.end16
  %18 = load i32*, i32** %buffer, align 8, !dbg !258
  %19 = bitcast i32* %18 to i8*, !dbg !258
  call void @free(i8* noundef %19), !dbg !259
  ret void, !dbg !260
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 9, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 28, column: 12, scope: !14)
!23 = !DILocation(line: 28, column: 5, scope: !14)
!24 = !DILocalVariable(name: "dataCopy", scope: !25, file: !15, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!26 = !DILocation(line: 30, column: 13, scope: !25)
!27 = !DILocation(line: 30, column: 24, scope: !25)
!28 = !DILocalVariable(name: "data", scope: !25, file: !15, line: 31, type: !4)
!29 = !DILocation(line: 31, column: 13, scope: !25)
!30 = !DILocation(line: 31, column: 20, scope: !25)
!31 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 33, type: !4)
!32 = distinct !DILexicalBlock(scope: !25, file: !15, line: 32, column: 9)
!33 = !DILocation(line: 33, column: 17, scope: !32)
!34 = !DILocalVariable(name: "buffer", scope: !32, file: !15, line: 34, type: !3)
!35 = !DILocation(line: 34, column: 19, scope: !32)
!36 = !DILocation(line: 34, column: 35, scope: !32)
!37 = !DILocation(line: 34, column: 28, scope: !32)
!38 = !DILocation(line: 35, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !15, line: 35, column: 17)
!40 = !DILocation(line: 35, column: 24, scope: !39)
!41 = !DILocation(line: 35, column: 17, scope: !32)
!42 = !DILocation(line: 35, column: 34, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 35, column: 33)
!44 = !DILocation(line: 37, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !32, file: !15, line: 37, column: 13)
!46 = !DILocation(line: 37, column: 18, scope: !45)
!47 = !DILocation(line: 37, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !15, line: 37, column: 13)
!49 = !DILocation(line: 37, column: 27, scope: !48)
!50 = !DILocation(line: 37, column: 13, scope: !45)
!51 = !DILocation(line: 39, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !15, line: 38, column: 13)
!53 = !DILocation(line: 39, column: 24, scope: !52)
!54 = !DILocation(line: 39, column: 27, scope: !52)
!55 = !DILocation(line: 40, column: 13, scope: !52)
!56 = !DILocation(line: 37, column: 34, scope: !48)
!57 = !DILocation(line: 37, column: 13, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 40, column: 13, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 43, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !32, file: !15, line: 43, column: 17)
!63 = !DILocation(line: 43, column: 22, scope: !62)
!64 = !DILocation(line: 43, column: 17, scope: !32)
!65 = !DILocation(line: 45, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 44, column: 13)
!67 = !DILocation(line: 45, column: 24, scope: !66)
!68 = !DILocation(line: 45, column: 30, scope: !66)
!69 = !DILocation(line: 47, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 47, column: 17)
!71 = !DILocation(line: 47, column: 21, scope: !70)
!72 = !DILocation(line: 47, column: 28, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !15, line: 47, column: 17)
!74 = !DILocation(line: 47, column: 30, scope: !73)
!75 = !DILocation(line: 47, column: 17, scope: !70)
!76 = !DILocation(line: 49, column: 34, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !15, line: 48, column: 17)
!78 = !DILocation(line: 49, column: 41, scope: !77)
!79 = !DILocation(line: 49, column: 21, scope: !77)
!80 = !DILocation(line: 50, column: 17, scope: !77)
!81 = !DILocation(line: 47, column: 37, scope: !73)
!82 = !DILocation(line: 47, column: 17, scope: !73)
!83 = distinct !{!83, !75, !84, !60}
!84 = !DILocation(line: 50, column: 17, scope: !70)
!85 = !DILocation(line: 51, column: 13, scope: !66)
!86 = !DILocation(line: 54, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !62, file: !15, line: 53, column: 13)
!88 = !DILocation(line: 56, column: 18, scope: !32)
!89 = !DILocation(line: 56, column: 13, scope: !32)
!90 = !DILocation(line: 59, column: 1, scope: !14)
!91 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_31_good", scope: !15, file: !15, line: 145, type: !16, scopeLine: 146, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!92 = !DILocation(line: 147, column: 5, scope: !91)
!93 = !DILocation(line: 148, column: 5, scope: !91)
!94 = !DILocation(line: 149, column: 1, scope: !91)
!95 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 159, type: !96, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!96 = !DISubroutineType(types: !97)
!97 = !{!4, !4, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !15, line: 159, type: !4)
!102 = !DILocation(line: 159, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !15, line: 159, type: !98)
!104 = !DILocation(line: 159, column: 27, scope: !95)
!105 = !DILocation(line: 162, column: 22, scope: !95)
!106 = !DILocation(line: 162, column: 12, scope: !95)
!107 = !DILocation(line: 162, column: 5, scope: !95)
!108 = !DILocation(line: 164, column: 5, scope: !95)
!109 = !DILocation(line: 165, column: 5, scope: !95)
!110 = !DILocation(line: 166, column: 5, scope: !95)
!111 = !DILocation(line: 169, column: 5, scope: !95)
!112 = !DILocation(line: 170, column: 5, scope: !95)
!113 = !DILocation(line: 171, column: 5, scope: !95)
!114 = !DILocation(line: 173, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!116 = !DILocalVariable(name: "data", scope: !115, file: !15, line: 68, type: !4)
!117 = !DILocation(line: 68, column: 9, scope: !115)
!118 = !DILocation(line: 70, column: 10, scope: !115)
!119 = !DILocation(line: 73, column: 10, scope: !115)
!120 = !DILocalVariable(name: "dataCopy", scope: !121, file: !15, line: 75, type: !4)
!121 = distinct !DILexicalBlock(scope: !115, file: !15, line: 74, column: 5)
!122 = !DILocation(line: 75, column: 13, scope: !121)
!123 = !DILocation(line: 75, column: 24, scope: !121)
!124 = !DILocalVariable(name: "data", scope: !121, file: !15, line: 76, type: !4)
!125 = !DILocation(line: 76, column: 13, scope: !121)
!126 = !DILocation(line: 76, column: 20, scope: !121)
!127 = !DILocalVariable(name: "i", scope: !128, file: !15, line: 78, type: !4)
!128 = distinct !DILexicalBlock(scope: !121, file: !15, line: 77, column: 9)
!129 = !DILocation(line: 78, column: 17, scope: !128)
!130 = !DILocalVariable(name: "buffer", scope: !128, file: !15, line: 79, type: !3)
!131 = !DILocation(line: 79, column: 19, scope: !128)
!132 = !DILocation(line: 79, column: 35, scope: !128)
!133 = !DILocation(line: 79, column: 28, scope: !128)
!134 = !DILocation(line: 80, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !128, file: !15, line: 80, column: 17)
!136 = !DILocation(line: 80, column: 24, scope: !135)
!137 = !DILocation(line: 80, column: 17, scope: !128)
!138 = !DILocation(line: 80, column: 34, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !15, line: 80, column: 33)
!140 = !DILocation(line: 82, column: 20, scope: !141)
!141 = distinct !DILexicalBlock(scope: !128, file: !15, line: 82, column: 13)
!142 = !DILocation(line: 82, column: 18, scope: !141)
!143 = !DILocation(line: 82, column: 25, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !15, line: 82, column: 13)
!145 = !DILocation(line: 82, column: 27, scope: !144)
!146 = !DILocation(line: 82, column: 13, scope: !141)
!147 = !DILocation(line: 84, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !15, line: 83, column: 13)
!149 = !DILocation(line: 84, column: 24, scope: !148)
!150 = !DILocation(line: 84, column: 27, scope: !148)
!151 = !DILocation(line: 85, column: 13, scope: !148)
!152 = !DILocation(line: 82, column: 34, scope: !144)
!153 = !DILocation(line: 82, column: 13, scope: !144)
!154 = distinct !{!154, !146, !155, !60}
!155 = !DILocation(line: 85, column: 13, scope: !141)
!156 = !DILocation(line: 88, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !128, file: !15, line: 88, column: 17)
!158 = !DILocation(line: 88, column: 22, scope: !157)
!159 = !DILocation(line: 88, column: 17, scope: !128)
!160 = !DILocation(line: 90, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !15, line: 89, column: 13)
!162 = !DILocation(line: 90, column: 24, scope: !161)
!163 = !DILocation(line: 90, column: 30, scope: !161)
!164 = !DILocation(line: 92, column: 23, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !15, line: 92, column: 17)
!166 = !DILocation(line: 92, column: 21, scope: !165)
!167 = !DILocation(line: 92, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !15, line: 92, column: 17)
!169 = !DILocation(line: 92, column: 30, scope: !168)
!170 = !DILocation(line: 92, column: 17, scope: !165)
!171 = !DILocation(line: 94, column: 34, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !15, line: 93, column: 17)
!173 = !DILocation(line: 94, column: 41, scope: !172)
!174 = !DILocation(line: 94, column: 21, scope: !172)
!175 = !DILocation(line: 95, column: 17, scope: !172)
!176 = !DILocation(line: 92, column: 37, scope: !168)
!177 = !DILocation(line: 92, column: 17, scope: !168)
!178 = distinct !{!178, !170, !179, !60}
!179 = !DILocation(line: 95, column: 17, scope: !165)
!180 = !DILocation(line: 96, column: 13, scope: !161)
!181 = !DILocation(line: 99, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !157, file: !15, line: 98, column: 13)
!183 = !DILocation(line: 101, column: 18, scope: !128)
!184 = !DILocation(line: 101, column: 13, scope: !128)
!185 = !DILocation(line: 104, column: 1, scope: !115)
!186 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 107, type: !16, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!187 = !DILocalVariable(name: "data", scope: !186, file: !15, line: 109, type: !4)
!188 = !DILocation(line: 109, column: 9, scope: !186)
!189 = !DILocation(line: 111, column: 10, scope: !186)
!190 = !DILocation(line: 113, column: 12, scope: !186)
!191 = !DILocation(line: 113, column: 5, scope: !186)
!192 = !DILocalVariable(name: "dataCopy", scope: !193, file: !15, line: 115, type: !4)
!193 = distinct !DILexicalBlock(scope: !186, file: !15, line: 114, column: 5)
!194 = !DILocation(line: 115, column: 13, scope: !193)
!195 = !DILocation(line: 115, column: 24, scope: !193)
!196 = !DILocalVariable(name: "data", scope: !193, file: !15, line: 116, type: !4)
!197 = !DILocation(line: 116, column: 13, scope: !193)
!198 = !DILocation(line: 116, column: 20, scope: !193)
!199 = !DILocalVariable(name: "i", scope: !200, file: !15, line: 118, type: !4)
!200 = distinct !DILexicalBlock(scope: !193, file: !15, line: 117, column: 9)
!201 = !DILocation(line: 118, column: 17, scope: !200)
!202 = !DILocalVariable(name: "buffer", scope: !200, file: !15, line: 119, type: !3)
!203 = !DILocation(line: 119, column: 19, scope: !200)
!204 = !DILocation(line: 119, column: 35, scope: !200)
!205 = !DILocation(line: 119, column: 28, scope: !200)
!206 = !DILocation(line: 120, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !200, file: !15, line: 120, column: 17)
!208 = !DILocation(line: 120, column: 24, scope: !207)
!209 = !DILocation(line: 120, column: 17, scope: !200)
!210 = !DILocation(line: 120, column: 34, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !15, line: 120, column: 33)
!212 = !DILocation(line: 122, column: 20, scope: !213)
!213 = distinct !DILexicalBlock(scope: !200, file: !15, line: 122, column: 13)
!214 = !DILocation(line: 122, column: 18, scope: !213)
!215 = !DILocation(line: 122, column: 25, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !15, line: 122, column: 13)
!217 = !DILocation(line: 122, column: 27, scope: !216)
!218 = !DILocation(line: 122, column: 13, scope: !213)
!219 = !DILocation(line: 124, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !15, line: 123, column: 13)
!221 = !DILocation(line: 124, column: 24, scope: !220)
!222 = !DILocation(line: 124, column: 27, scope: !220)
!223 = !DILocation(line: 125, column: 13, scope: !220)
!224 = !DILocation(line: 122, column: 34, scope: !216)
!225 = !DILocation(line: 122, column: 13, scope: !216)
!226 = distinct !{!226, !218, !227, !60}
!227 = !DILocation(line: 125, column: 13, scope: !213)
!228 = !DILocation(line: 127, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !200, file: !15, line: 127, column: 17)
!230 = !DILocation(line: 127, column: 22, scope: !229)
!231 = !DILocation(line: 127, column: 27, scope: !229)
!232 = !DILocation(line: 127, column: 30, scope: !229)
!233 = !DILocation(line: 127, column: 35, scope: !229)
!234 = !DILocation(line: 127, column: 17, scope: !200)
!235 = !DILocation(line: 129, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !229, file: !15, line: 128, column: 13)
!237 = !DILocation(line: 129, column: 24, scope: !236)
!238 = !DILocation(line: 129, column: 30, scope: !236)
!239 = !DILocation(line: 131, column: 23, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !15, line: 131, column: 17)
!241 = !DILocation(line: 131, column: 21, scope: !240)
!242 = !DILocation(line: 131, column: 28, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !15, line: 131, column: 17)
!244 = !DILocation(line: 131, column: 30, scope: !243)
!245 = !DILocation(line: 131, column: 17, scope: !240)
!246 = !DILocation(line: 133, column: 34, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !15, line: 132, column: 17)
!248 = !DILocation(line: 133, column: 41, scope: !247)
!249 = !DILocation(line: 133, column: 21, scope: !247)
!250 = !DILocation(line: 134, column: 17, scope: !247)
!251 = !DILocation(line: 131, column: 37, scope: !243)
!252 = !DILocation(line: 131, column: 17, scope: !243)
!253 = distinct !{!253, !245, !254, !60}
!254 = !DILocation(line: 134, column: 17, scope: !240)
!255 = !DILocation(line: 135, column: 13, scope: !236)
!256 = !DILocation(line: 138, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !229, file: !15, line: 137, column: 13)
!258 = !DILocation(line: 140, column: 18, scope: !200)
!259 = !DILocation(line: 140, column: 13, scope: !200)
!260 = !DILocation(line: 143, column: 1, scope: !186)
