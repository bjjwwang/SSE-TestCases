; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_16-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  br label %while.body, !dbg !22

while.body:                                       ; preds = %entry
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !23
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !25
  br label %while.end, !dbg !26

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !27

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !32, metadata !DIExpression()), !dbg !33
  %call2 = call i8* @malloc(i64 noundef 40) #5, !dbg !34
  %1 = bitcast i8* %call2 to i32*, !dbg !35
  store i32* %1, i32** %buffer, align 8, !dbg !33
  %2 = load i32*, i32** %buffer, align 8, !dbg !36
  %cmp = icmp eq i32* %2, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %while.body1
  call void @exit(i32 noundef -1) #6, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %while.body1
  store i32 0, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !45
  %cmp3 = icmp slt i32 %3, 10, !dbg !47
  br i1 %cmp3, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !49
  %5 = load i32, i32* %i, align 4, !dbg !51
  %idxprom = sext i32 %5 to i64, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !54
  %inc = add nsw i32 %6, 1, !dbg !54
  store i32 %inc, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !59
  %cmp4 = icmp sge i32 %7, 0, !dbg !61
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !62

if.then5:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !63
  %9 = load i32, i32* %data, align 4, !dbg !65
  %idxprom6 = sext i32 %9 to i64, !dbg !63
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %idxprom6, !dbg !63
  store i32 1, i32* %arrayidx7, align 4, !dbg !66
  store i32 0, i32* %i, align 4, !dbg !67
  br label %for.cond8, !dbg !69

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %10 = load i32, i32* %i, align 4, !dbg !70
  %cmp9 = icmp slt i32 %10, 10, !dbg !72
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !73

for.body10:                                       ; preds = %for.cond8
  %11 = load i32*, i32** %buffer, align 8, !dbg !74
  %12 = load i32, i32* %i, align 4, !dbg !76
  %idxprom11 = sext i32 %12 to i64, !dbg !74
  %arrayidx12 = getelementptr inbounds i32, i32* %11, i64 %idxprom11, !dbg !74
  %13 = load i32, i32* %arrayidx12, align 4, !dbg !74
  call void @printIntLine(i32 noundef %13), !dbg !77
  br label %for.inc13, !dbg !78

for.inc13:                                        ; preds = %for.body10
  %14 = load i32, i32* %i, align 4, !dbg !79
  %inc14 = add nsw i32 %14, 1, !dbg !79
  store i32 %inc14, i32* %i, align 4, !dbg !79
  br label %for.cond8, !dbg !80, !llvm.loop !81

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !83

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %15 = load i32*, i32** %buffer, align 8, !dbg !86
  %16 = bitcast i32* %15 to i8*, !dbg !86
  call void @free(i8* noundef %16), !dbg !87
  br label %while.end17, !dbg !88

while.end17:                                      ; preds = %if.end16
  ret void, !dbg !89
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_16_good() #0 !dbg !90 {
entry:
  call void @goodB2G(), !dbg !91
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* noundef null), !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 noundef %conv), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_16_good(), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_16_bad(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !114 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 -1, i32* %data, align 4, !dbg !117
  br label %while.body, !dbg !118

while.body:                                       ; preds = %entry
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !119
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !121
  br label %while.end, !dbg !122

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !123

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !124, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !128, metadata !DIExpression()), !dbg !129
  %call2 = call i8* @malloc(i64 noundef 40) #5, !dbg !130
  %1 = bitcast i8* %call2 to i32*, !dbg !131
  store i32* %1, i32** %buffer, align 8, !dbg !129
  %2 = load i32*, i32** %buffer, align 8, !dbg !132
  %cmp = icmp eq i32* %2, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %while.body1
  call void @exit(i32 noundef -1) #6, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %while.body1
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !141
  %cmp3 = icmp slt i32 %3, 10, !dbg !143
  br i1 %cmp3, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !145
  %5 = load i32, i32* %i, align 4, !dbg !147
  %idxprom = sext i32 %5 to i64, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !150
  %inc = add nsw i32 %6, 1, !dbg !150
  store i32 %inc, i32* %i, align 4, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !154
  %cmp4 = icmp sge i32 %7, 0, !dbg !156
  br i1 %cmp4, label %land.lhs.true, label %if.else, !dbg !157

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !158
  %cmp5 = icmp slt i32 %8, 10, !dbg !159
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !160

if.then6:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !161
  %10 = load i32, i32* %data, align 4, !dbg !163
  %idxprom7 = sext i32 %10 to i64, !dbg !161
  %arrayidx8 = getelementptr inbounds i32, i32* %9, i64 %idxprom7, !dbg !161
  store i32 1, i32* %arrayidx8, align 4, !dbg !164
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond9, !dbg !167

for.cond9:                                        ; preds = %for.inc14, %if.then6
  %11 = load i32, i32* %i, align 4, !dbg !168
  %cmp10 = icmp slt i32 %11, 10, !dbg !170
  br i1 %cmp10, label %for.body11, label %for.end16, !dbg !171

for.body11:                                       ; preds = %for.cond9
  %12 = load i32*, i32** %buffer, align 8, !dbg !172
  %13 = load i32, i32* %i, align 4, !dbg !174
  %idxprom12 = sext i32 %13 to i64, !dbg !172
  %arrayidx13 = getelementptr inbounds i32, i32* %12, i64 %idxprom12, !dbg !172
  %14 = load i32, i32* %arrayidx13, align 4, !dbg !172
  call void @printIntLine(i32 noundef %14), !dbg !175
  br label %for.inc14, !dbg !176

for.inc14:                                        ; preds = %for.body11
  %15 = load i32, i32* %i, align 4, !dbg !177
  %inc15 = add nsw i32 %15, 1, !dbg !177
  store i32 %inc15, i32* %i, align 4, !dbg !177
  br label %for.cond9, !dbg !178, !llvm.loop !179

for.end16:                                        ; preds = %for.cond9
  br label %if.end17, !dbg !181

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !182
  br label %if.end17

if.end17:                                         ; preds = %if.else, %for.end16
  %16 = load i32*, i32** %buffer, align 8, !dbg !184
  %17 = bitcast i32* %16 to i8*, !dbg !184
  call void @free(i8* noundef %17), !dbg !185
  br label %while.end18, !dbg !186

while.end18:                                      ; preds = %if.end17
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !188 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !189, metadata !DIExpression()), !dbg !190
  store i32 -1, i32* %data, align 4, !dbg !191
  br label %while.body, !dbg !192

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !193
  br label %while.end, !dbg !195

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !196

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !197, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !201, metadata !DIExpression()), !dbg !202
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !203
  %0 = bitcast i8* %call to i32*, !dbg !204
  store i32* %0, i32** %buffer, align 8, !dbg !202
  %1 = load i32*, i32** %buffer, align 8, !dbg !205
  %cmp = icmp eq i32* %1, null, !dbg !207
  br i1 %cmp, label %if.then, label %if.end, !dbg !208

if.then:                                          ; preds = %while.body1
  call void @exit(i32 noundef -1) #6, !dbg !209
  unreachable, !dbg !209

if.end:                                           ; preds = %while.body1
  store i32 0, i32* %i, align 4, !dbg !211
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !214
  %cmp2 = icmp slt i32 %2, 10, !dbg !216
  br i1 %cmp2, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !218
  %4 = load i32, i32* %i, align 4, !dbg !220
  %idxprom = sext i32 %4 to i64, !dbg !218
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !218
  store i32 0, i32* %arrayidx, align 4, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !223
  %inc = add nsw i32 %5, 1, !dbg !223
  store i32 %inc, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !227
  %cmp3 = icmp sge i32 %6, 0, !dbg !229
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !230

if.then4:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !231
  %8 = load i32, i32* %data, align 4, !dbg !233
  %idxprom5 = sext i32 %8 to i64, !dbg !231
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %idxprom5, !dbg !231
  store i32 1, i32* %arrayidx6, align 4, !dbg !234
  store i32 0, i32* %i, align 4, !dbg !235
  br label %for.cond7, !dbg !237

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %9 = load i32, i32* %i, align 4, !dbg !238
  %cmp8 = icmp slt i32 %9, 10, !dbg !240
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !241

for.body9:                                        ; preds = %for.cond7
  %10 = load i32*, i32** %buffer, align 8, !dbg !242
  %11 = load i32, i32* %i, align 4, !dbg !244
  %idxprom10 = sext i32 %11 to i64, !dbg !242
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !242
  %12 = load i32, i32* %arrayidx11, align 4, !dbg !242
  call void @printIntLine(i32 noundef %12), !dbg !245
  br label %for.inc12, !dbg !246

for.inc12:                                        ; preds = %for.body9
  %13 = load i32, i32* %i, align 4, !dbg !247
  %inc13 = add nsw i32 %13, 1, !dbg !247
  store i32 %inc13, i32* %i, align 4, !dbg !247
  br label %for.cond7, !dbg !248, !llvm.loop !249

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !251

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !252
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %14 = load i32*, i32** %buffer, align 8, !dbg !254
  %15 = bitcast i32* %14 to i8*, !dbg !254
  call void @free(i8* noundef %15), !dbg !255
  br label %while.end16, !dbg !256

while.end16:                                      ; preds = %if.end15
  ret void, !dbg !257
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_16_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 9, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 5, scope: !14)
!23 = !DILocation(line: 30, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!25 = !DILocation(line: 30, column: 9, scope: !24)
!26 = !DILocation(line: 31, column: 9, scope: !24)
!27 = !DILocation(line: 33, column: 5, scope: !14)
!28 = !DILocalVariable(name: "i", scope: !29, file: !15, line: 36, type: !4)
!29 = distinct !DILexicalBlock(scope: !30, file: !15, line: 35, column: 9)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!31 = !DILocation(line: 36, column: 17, scope: !29)
!32 = !DILocalVariable(name: "buffer", scope: !29, file: !15, line: 37, type: !3)
!33 = !DILocation(line: 37, column: 19, scope: !29)
!34 = !DILocation(line: 37, column: 35, scope: !29)
!35 = !DILocation(line: 37, column: 28, scope: !29)
!36 = !DILocation(line: 38, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !15, line: 38, column: 17)
!38 = !DILocation(line: 38, column: 24, scope: !37)
!39 = !DILocation(line: 38, column: 17, scope: !29)
!40 = !DILocation(line: 38, column: 34, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !15, line: 38, column: 33)
!42 = !DILocation(line: 40, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !29, file: !15, line: 40, column: 13)
!44 = !DILocation(line: 40, column: 18, scope: !43)
!45 = !DILocation(line: 40, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !15, line: 40, column: 13)
!47 = !DILocation(line: 40, column: 27, scope: !46)
!48 = !DILocation(line: 40, column: 13, scope: !43)
!49 = !DILocation(line: 42, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 41, column: 13)
!51 = !DILocation(line: 42, column: 24, scope: !50)
!52 = !DILocation(line: 42, column: 27, scope: !50)
!53 = !DILocation(line: 43, column: 13, scope: !50)
!54 = !DILocation(line: 40, column: 34, scope: !46)
!55 = !DILocation(line: 40, column: 13, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 43, column: 13, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 46, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !29, file: !15, line: 46, column: 17)
!61 = !DILocation(line: 46, column: 22, scope: !60)
!62 = !DILocation(line: 46, column: 17, scope: !29)
!63 = !DILocation(line: 48, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !15, line: 47, column: 13)
!65 = !DILocation(line: 48, column: 24, scope: !64)
!66 = !DILocation(line: 48, column: 30, scope: !64)
!67 = !DILocation(line: 50, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 50, column: 17)
!69 = !DILocation(line: 50, column: 21, scope: !68)
!70 = !DILocation(line: 50, column: 28, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !15, line: 50, column: 17)
!72 = !DILocation(line: 50, column: 30, scope: !71)
!73 = !DILocation(line: 50, column: 17, scope: !68)
!74 = !DILocation(line: 52, column: 34, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !15, line: 51, column: 17)
!76 = !DILocation(line: 52, column: 41, scope: !75)
!77 = !DILocation(line: 52, column: 21, scope: !75)
!78 = !DILocation(line: 53, column: 17, scope: !75)
!79 = !DILocation(line: 50, column: 37, scope: !71)
!80 = !DILocation(line: 50, column: 17, scope: !71)
!81 = distinct !{!81, !73, !82, !58}
!82 = !DILocation(line: 53, column: 17, scope: !68)
!83 = !DILocation(line: 54, column: 13, scope: !64)
!84 = !DILocation(line: 57, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !60, file: !15, line: 56, column: 13)
!86 = !DILocation(line: 59, column: 18, scope: !29)
!87 = !DILocation(line: 59, column: 13, scope: !29)
!88 = !DILocation(line: 61, column: 9, scope: !30)
!89 = !DILocation(line: 63, column: 1, scope: !14)
!90 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_16_good", scope: !15, file: !15, line: 157, type: !16, scopeLine: 158, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!91 = !DILocation(line: 159, column: 5, scope: !90)
!92 = !DILocation(line: 160, column: 5, scope: !90)
!93 = !DILocation(line: 161, column: 1, scope: !90)
!94 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 172, type: !95, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!95 = !DISubroutineType(types: !96)
!96 = !{!4, !4, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !15, line: 172, type: !4)
!101 = !DILocation(line: 172, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !15, line: 172, type: !97)
!103 = !DILocation(line: 172, column: 27, scope: !94)
!104 = !DILocation(line: 175, column: 22, scope: !94)
!105 = !DILocation(line: 175, column: 12, scope: !94)
!106 = !DILocation(line: 175, column: 5, scope: !94)
!107 = !DILocation(line: 177, column: 5, scope: !94)
!108 = !DILocation(line: 178, column: 5, scope: !94)
!109 = !DILocation(line: 179, column: 5, scope: !94)
!110 = !DILocation(line: 182, column: 5, scope: !94)
!111 = !DILocation(line: 183, column: 5, scope: !94)
!112 = !DILocation(line: 184, column: 5, scope: !94)
!113 = !DILocation(line: 186, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!115 = !DILocalVariable(name: "data", scope: !114, file: !15, line: 72, type: !4)
!116 = !DILocation(line: 72, column: 9, scope: !114)
!117 = !DILocation(line: 74, column: 10, scope: !114)
!118 = !DILocation(line: 75, column: 5, scope: !114)
!119 = !DILocation(line: 78, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !114, file: !15, line: 76, column: 5)
!121 = !DILocation(line: 78, column: 9, scope: !120)
!122 = !DILocation(line: 79, column: 9, scope: !120)
!123 = !DILocation(line: 81, column: 5, scope: !114)
!124 = !DILocalVariable(name: "i", scope: !125, file: !15, line: 84, type: !4)
!125 = distinct !DILexicalBlock(scope: !126, file: !15, line: 83, column: 9)
!126 = distinct !DILexicalBlock(scope: !114, file: !15, line: 82, column: 5)
!127 = !DILocation(line: 84, column: 17, scope: !125)
!128 = !DILocalVariable(name: "buffer", scope: !125, file: !15, line: 85, type: !3)
!129 = !DILocation(line: 85, column: 19, scope: !125)
!130 = !DILocation(line: 85, column: 35, scope: !125)
!131 = !DILocation(line: 85, column: 28, scope: !125)
!132 = !DILocation(line: 86, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !125, file: !15, line: 86, column: 17)
!134 = !DILocation(line: 86, column: 24, scope: !133)
!135 = !DILocation(line: 86, column: 17, scope: !125)
!136 = !DILocation(line: 86, column: 34, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 86, column: 33)
!138 = !DILocation(line: 88, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !125, file: !15, line: 88, column: 13)
!140 = !DILocation(line: 88, column: 18, scope: !139)
!141 = !DILocation(line: 88, column: 25, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !15, line: 88, column: 13)
!143 = !DILocation(line: 88, column: 27, scope: !142)
!144 = !DILocation(line: 88, column: 13, scope: !139)
!145 = !DILocation(line: 90, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !15, line: 89, column: 13)
!147 = !DILocation(line: 90, column: 24, scope: !146)
!148 = !DILocation(line: 90, column: 27, scope: !146)
!149 = !DILocation(line: 91, column: 13, scope: !146)
!150 = !DILocation(line: 88, column: 34, scope: !142)
!151 = !DILocation(line: 88, column: 13, scope: !142)
!152 = distinct !{!152, !144, !153, !58}
!153 = !DILocation(line: 91, column: 13, scope: !139)
!154 = !DILocation(line: 93, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !125, file: !15, line: 93, column: 17)
!156 = !DILocation(line: 93, column: 22, scope: !155)
!157 = !DILocation(line: 93, column: 27, scope: !155)
!158 = !DILocation(line: 93, column: 30, scope: !155)
!159 = !DILocation(line: 93, column: 35, scope: !155)
!160 = !DILocation(line: 93, column: 17, scope: !125)
!161 = !DILocation(line: 95, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !155, file: !15, line: 94, column: 13)
!163 = !DILocation(line: 95, column: 24, scope: !162)
!164 = !DILocation(line: 95, column: 30, scope: !162)
!165 = !DILocation(line: 97, column: 23, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !15, line: 97, column: 17)
!167 = !DILocation(line: 97, column: 21, scope: !166)
!168 = !DILocation(line: 97, column: 28, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !15, line: 97, column: 17)
!170 = !DILocation(line: 97, column: 30, scope: !169)
!171 = !DILocation(line: 97, column: 17, scope: !166)
!172 = !DILocation(line: 99, column: 34, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !15, line: 98, column: 17)
!174 = !DILocation(line: 99, column: 41, scope: !173)
!175 = !DILocation(line: 99, column: 21, scope: !173)
!176 = !DILocation(line: 100, column: 17, scope: !173)
!177 = !DILocation(line: 97, column: 37, scope: !169)
!178 = !DILocation(line: 97, column: 17, scope: !169)
!179 = distinct !{!179, !171, !180, !58}
!180 = !DILocation(line: 100, column: 17, scope: !166)
!181 = !DILocation(line: 101, column: 13, scope: !162)
!182 = !DILocation(line: 104, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !155, file: !15, line: 103, column: 13)
!184 = !DILocation(line: 106, column: 18, scope: !125)
!185 = !DILocation(line: 106, column: 13, scope: !125)
!186 = !DILocation(line: 108, column: 9, scope: !126)
!187 = !DILocation(line: 110, column: 1, scope: !114)
!188 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 113, type: !16, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!189 = !DILocalVariable(name: "data", scope: !188, file: !15, line: 115, type: !4)
!190 = !DILocation(line: 115, column: 9, scope: !188)
!191 = !DILocation(line: 117, column: 10, scope: !188)
!192 = !DILocation(line: 118, column: 5, scope: !188)
!193 = !DILocation(line: 122, column: 14, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !15, line: 119, column: 5)
!195 = !DILocation(line: 123, column: 9, scope: !194)
!196 = !DILocation(line: 125, column: 5, scope: !188)
!197 = !DILocalVariable(name: "i", scope: !198, file: !15, line: 128, type: !4)
!198 = distinct !DILexicalBlock(scope: !199, file: !15, line: 127, column: 9)
!199 = distinct !DILexicalBlock(scope: !188, file: !15, line: 126, column: 5)
!200 = !DILocation(line: 128, column: 17, scope: !198)
!201 = !DILocalVariable(name: "buffer", scope: !198, file: !15, line: 129, type: !3)
!202 = !DILocation(line: 129, column: 19, scope: !198)
!203 = !DILocation(line: 129, column: 35, scope: !198)
!204 = !DILocation(line: 129, column: 28, scope: !198)
!205 = !DILocation(line: 130, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !198, file: !15, line: 130, column: 17)
!207 = !DILocation(line: 130, column: 24, scope: !206)
!208 = !DILocation(line: 130, column: 17, scope: !198)
!209 = !DILocation(line: 130, column: 34, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !15, line: 130, column: 33)
!211 = !DILocation(line: 132, column: 20, scope: !212)
!212 = distinct !DILexicalBlock(scope: !198, file: !15, line: 132, column: 13)
!213 = !DILocation(line: 132, column: 18, scope: !212)
!214 = !DILocation(line: 132, column: 25, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !15, line: 132, column: 13)
!216 = !DILocation(line: 132, column: 27, scope: !215)
!217 = !DILocation(line: 132, column: 13, scope: !212)
!218 = !DILocation(line: 134, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !15, line: 133, column: 13)
!220 = !DILocation(line: 134, column: 24, scope: !219)
!221 = !DILocation(line: 134, column: 27, scope: !219)
!222 = !DILocation(line: 135, column: 13, scope: !219)
!223 = !DILocation(line: 132, column: 34, scope: !215)
!224 = !DILocation(line: 132, column: 13, scope: !215)
!225 = distinct !{!225, !217, !226, !58}
!226 = !DILocation(line: 135, column: 13, scope: !212)
!227 = !DILocation(line: 138, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !198, file: !15, line: 138, column: 17)
!229 = !DILocation(line: 138, column: 22, scope: !228)
!230 = !DILocation(line: 138, column: 17, scope: !198)
!231 = !DILocation(line: 140, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !15, line: 139, column: 13)
!233 = !DILocation(line: 140, column: 24, scope: !232)
!234 = !DILocation(line: 140, column: 30, scope: !232)
!235 = !DILocation(line: 142, column: 23, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !15, line: 142, column: 17)
!237 = !DILocation(line: 142, column: 21, scope: !236)
!238 = !DILocation(line: 142, column: 28, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !15, line: 142, column: 17)
!240 = !DILocation(line: 142, column: 30, scope: !239)
!241 = !DILocation(line: 142, column: 17, scope: !236)
!242 = !DILocation(line: 144, column: 34, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !15, line: 143, column: 17)
!244 = !DILocation(line: 144, column: 41, scope: !243)
!245 = !DILocation(line: 144, column: 21, scope: !243)
!246 = !DILocation(line: 145, column: 17, scope: !243)
!247 = !DILocation(line: 142, column: 37, scope: !239)
!248 = !DILocation(line: 142, column: 17, scope: !239)
!249 = distinct !{!249, !241, !250, !58}
!250 = !DILocation(line: 145, column: 17, scope: !236)
!251 = !DILocation(line: 146, column: 13, scope: !232)
!252 = !DILocation(line: 149, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !228, file: !15, line: 148, column: 13)
!254 = !DILocation(line: 151, column: 18, scope: !198)
!255 = !DILocation(line: 151, column: 13, scope: !198)
!256 = !DILocation(line: 153, column: 9, scope: !199)
!257 = !DILocation(line: 155, column: 1, scope: !188)
