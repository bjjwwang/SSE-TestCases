; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_41_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !22
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !23
  %1 = load i32, i32* %data, align 4, !dbg !24
  call void @badSink(i32 noundef %1), !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !27 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !35, metadata !DIExpression()), !dbg !36
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !37
  %0 = bitcast i8* %call to i32*, !dbg !38
  store i32* %0, i32** %buffer, align 8, !dbg !36
  %1 = load i32*, i32** %buffer, align 8, !dbg !39
  %cmp = icmp eq i32* %1, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !48
  %cmp1 = icmp slt i32 %2, 10, !dbg !50
  br i1 %cmp1, label %for.body, label %for.end, !dbg !51

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
  %6 = load i32, i32* %data.addr, align 4, !dbg !62
  %cmp2 = icmp sge i32 %6, 0, !dbg !64
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !65

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !66
  %8 = load i32, i32* %data.addr, align 4, !dbg !68
  %idxprom4 = sext i32 %8 to i64, !dbg !66
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !66
  store i32 1, i32* %arrayidx5, align 4, !dbg !69
  store i32 0, i32* %i, align 4, !dbg !70
  br label %for.cond6, !dbg !72

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !73
  %cmp7 = icmp slt i32 %9, 10, !dbg !75
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !76

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !77
  %11 = load i32, i32* %i, align 4, !dbg !79
  %idxprom9 = sext i32 %11 to i64, !dbg !77
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !77
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !77
  call void @printIntLine(i32 noundef %12), !dbg !80
  br label %for.inc11, !dbg !81

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !82
  %inc12 = add nsw i32 %13, 1, !dbg !82
  store i32 %inc12, i32* %i, align 4, !dbg !82
  br label %for.cond6, !dbg !83, !llvm.loop !84

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !86

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !87
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !89
  %15 = bitcast i32* %14 to i8*, !dbg !89
  call void @free(i8* noundef %15), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_41_good() #0 !dbg !92 {
entry:
  call void @goodB2G(), !dbg !93
  call void @goodG2B(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* noundef null), !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 noundef %conv), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_41_good(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_41_bad(), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
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
define internal void @goodB2G() #0 !dbg !116 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 -1, i32* %data, align 4, !dbg !119
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !120
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !121
  %1 = load i32, i32* %data, align 4, !dbg !122
  call void @goodB2GSink(i32 noundef %1), !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2GSink(i32 noundef %data) #0 !dbg !125 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i32* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !131, metadata !DIExpression()), !dbg !132
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !133
  %0 = bitcast i8* %call to i32*, !dbg !134
  store i32* %0, i32** %buffer, align 8, !dbg !132
  %1 = load i32*, i32** %buffer, align 8, !dbg !135
  %cmp = icmp eq i32* %1, null, !dbg !137
  br i1 %cmp, label %if.then, label %if.end, !dbg !138

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !139
  unreachable, !dbg !139

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !144
  %cmp1 = icmp slt i32 %2, 10, !dbg !146
  br i1 %cmp1, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !148
  %4 = load i32, i32* %i, align 4, !dbg !150
  %idxprom = sext i32 %4 to i64, !dbg !148
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !148
  store i32 0, i32* %arrayidx, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !153
  %inc = add nsw i32 %5, 1, !dbg !153
  store i32 %inc, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !157
  %cmp2 = icmp sge i32 %6, 0, !dbg !159
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !160

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !161
  %cmp3 = icmp slt i32 %7, 10, !dbg !162
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !163

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !164
  %9 = load i32, i32* %data.addr, align 4, !dbg !166
  %idxprom5 = sext i32 %9 to i64, !dbg !164
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !164
  store i32 1, i32* %arrayidx6, align 4, !dbg !167
  store i32 0, i32* %i, align 4, !dbg !168
  br label %for.cond7, !dbg !170

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !171
  %cmp8 = icmp slt i32 %10, 10, !dbg !173
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !174

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !175
  %12 = load i32, i32* %i, align 4, !dbg !177
  %idxprom10 = sext i32 %12 to i64, !dbg !175
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !175
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !175
  call void @printIntLine(i32 noundef %13), !dbg !178
  br label %for.inc12, !dbg !179

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !180
  %inc13 = add nsw i32 %14, 1, !dbg !180
  store i32 %inc13, i32* %i, align 4, !dbg !180
  br label %for.cond7, !dbg !181, !llvm.loop !182

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !184

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !185
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !187
  %16 = bitcast i32* %15 to i8*, !dbg !187
  call void @free(i8* noundef %16), !dbg !188
  ret void, !dbg !189
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !190 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !191, metadata !DIExpression()), !dbg !192
  store i32 -1, i32* %data, align 4, !dbg !193
  store i32 7, i32* %data, align 4, !dbg !194
  %0 = load i32, i32* %data, align 4, !dbg !195
  call void @goodG2BSink(i32 noundef %0), !dbg !196
  ret void, !dbg !197
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !198 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32* %i, metadata !201, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !204, metadata !DIExpression()), !dbg !205
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !206
  %0 = bitcast i8* %call to i32*, !dbg !207
  store i32* %0, i32** %buffer, align 8, !dbg !205
  %1 = load i32*, i32** %buffer, align 8, !dbg !208
  %cmp = icmp eq i32* %1, null, !dbg !210
  br i1 %cmp, label %if.then, label %if.end, !dbg !211

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !212
  unreachable, !dbg !212

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond, !dbg !216

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !217
  %cmp1 = icmp slt i32 %2, 10, !dbg !219
  br i1 %cmp1, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !221
  %4 = load i32, i32* %i, align 4, !dbg !223
  %idxprom = sext i32 %4 to i64, !dbg !221
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !221
  store i32 0, i32* %arrayidx, align 4, !dbg !224
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !226
  %inc = add nsw i32 %5, 1, !dbg !226
  store i32 %inc, i32* %i, align 4, !dbg !226
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !230
  %cmp2 = icmp sge i32 %6, 0, !dbg !232
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !233

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !234
  %8 = load i32, i32* %data.addr, align 4, !dbg !236
  %idxprom4 = sext i32 %8 to i64, !dbg !234
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !234
  store i32 1, i32* %arrayidx5, align 4, !dbg !237
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond6, !dbg !240

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !241
  %cmp7 = icmp slt i32 %9, 10, !dbg !243
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !244

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !245
  %11 = load i32, i32* %i, align 4, !dbg !247
  %idxprom9 = sext i32 %11 to i64, !dbg !245
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !245
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !245
  call void @printIntLine(i32 noundef %12), !dbg !248
  br label %for.inc11, !dbg !249

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !250
  %inc12 = add nsw i32 %13, 1, !dbg !250
  store i32 %inc12, i32* %i, align 4, !dbg !250
  br label %for.cond6, !dbg !251, !llvm.loop !252

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !254

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !255
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !257
  %15 = bitcast i32* %14 to i8*, !dbg !257
  call void @free(i8* noundef %15), !dbg !258
  ret void, !dbg !259
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4, !6}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_41_bad", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 54, type: !5)
!20 = !DILocation(line: 54, column: 9, scope: !14)
!21 = !DILocation(line: 56, column: 10, scope: !14)
!22 = !DILocation(line: 58, column: 12, scope: !14)
!23 = !DILocation(line: 58, column: 5, scope: !14)
!24 = !DILocation(line: 59, column: 13, scope: !14)
!25 = !DILocation(line: 59, column: 5, scope: !14)
!26 = !DILocation(line: 60, column: 1, scope: !14)
!27 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 22, type: !28, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !5}
!30 = !DILocalVariable(name: "data", arg: 1, scope: !27, file: !15, line: 22, type: !5)
!31 = !DILocation(line: 22, column: 25, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !15, line: 25, type: !5)
!33 = distinct !DILexicalBlock(scope: !27, file: !15, line: 24, column: 5)
!34 = !DILocation(line: 25, column: 13, scope: !33)
!35 = !DILocalVariable(name: "buffer", scope: !33, file: !15, line: 26, type: !4)
!36 = !DILocation(line: 26, column: 15, scope: !33)
!37 = !DILocation(line: 26, column: 31, scope: !33)
!38 = !DILocation(line: 26, column: 24, scope: !33)
!39 = !DILocation(line: 27, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !33, file: !15, line: 27, column: 13)
!41 = !DILocation(line: 27, column: 20, scope: !40)
!42 = !DILocation(line: 27, column: 13, scope: !33)
!43 = !DILocation(line: 27, column: 30, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 27, column: 29)
!45 = !DILocation(line: 29, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !33, file: !15, line: 29, column: 9)
!47 = !DILocation(line: 29, column: 14, scope: !46)
!48 = !DILocation(line: 29, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !15, line: 29, column: 9)
!50 = !DILocation(line: 29, column: 23, scope: !49)
!51 = !DILocation(line: 29, column: 9, scope: !46)
!52 = !DILocation(line: 31, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 30, column: 9)
!54 = !DILocation(line: 31, column: 20, scope: !53)
!55 = !DILocation(line: 31, column: 23, scope: !53)
!56 = !DILocation(line: 32, column: 9, scope: !53)
!57 = !DILocation(line: 29, column: 30, scope: !49)
!58 = !DILocation(line: 29, column: 9, scope: !49)
!59 = distinct !{!59, !51, !60, !61}
!60 = !DILocation(line: 32, column: 9, scope: !46)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 35, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !33, file: !15, line: 35, column: 13)
!64 = !DILocation(line: 35, column: 18, scope: !63)
!65 = !DILocation(line: 35, column: 13, scope: !33)
!66 = !DILocation(line: 37, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 36, column: 9)
!68 = !DILocation(line: 37, column: 20, scope: !67)
!69 = !DILocation(line: 37, column: 26, scope: !67)
!70 = !DILocation(line: 39, column: 19, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 39, column: 13)
!72 = !DILocation(line: 39, column: 17, scope: !71)
!73 = !DILocation(line: 39, column: 24, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !15, line: 39, column: 13)
!75 = !DILocation(line: 39, column: 26, scope: !74)
!76 = !DILocation(line: 39, column: 13, scope: !71)
!77 = !DILocation(line: 41, column: 30, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 40, column: 13)
!79 = !DILocation(line: 41, column: 37, scope: !78)
!80 = !DILocation(line: 41, column: 17, scope: !78)
!81 = !DILocation(line: 42, column: 13, scope: !78)
!82 = !DILocation(line: 39, column: 33, scope: !74)
!83 = !DILocation(line: 39, column: 13, scope: !74)
!84 = distinct !{!84, !76, !85, !61}
!85 = !DILocation(line: 42, column: 13, scope: !71)
!86 = !DILocation(line: 43, column: 9, scope: !67)
!87 = !DILocation(line: 46, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !63, file: !15, line: 45, column: 9)
!89 = !DILocation(line: 48, column: 14, scope: !33)
!90 = !DILocation(line: 48, column: 9, scope: !33)
!91 = !DILocation(line: 50, column: 1, scope: !27)
!92 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_41_good", scope: !15, file: !15, line: 148, type: !16, scopeLine: 149, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!93 = !DILocation(line: 150, column: 5, scope: !92)
!94 = !DILocation(line: 151, column: 5, scope: !92)
!95 = !DILocation(line: 152, column: 1, scope: !92)
!96 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 163, type: !97, scopeLine: 164, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!97 = !DISubroutineType(types: !98)
!98 = !{!5, !5, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !15, line: 163, type: !5)
!103 = !DILocation(line: 163, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !15, line: 163, type: !99)
!105 = !DILocation(line: 163, column: 27, scope: !96)
!106 = !DILocation(line: 166, column: 22, scope: !96)
!107 = !DILocation(line: 166, column: 12, scope: !96)
!108 = !DILocation(line: 166, column: 5, scope: !96)
!109 = !DILocation(line: 168, column: 5, scope: !96)
!110 = !DILocation(line: 169, column: 5, scope: !96)
!111 = !DILocation(line: 170, column: 5, scope: !96)
!112 = !DILocation(line: 173, column: 5, scope: !96)
!113 = !DILocation(line: 174, column: 5, scope: !96)
!114 = !DILocation(line: 175, column: 5, scope: !96)
!115 = !DILocation(line: 177, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 138, type: !16, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!117 = !DILocalVariable(name: "data", scope: !116, file: !15, line: 140, type: !5)
!118 = !DILocation(line: 140, column: 9, scope: !116)
!119 = !DILocation(line: 142, column: 10, scope: !116)
!120 = !DILocation(line: 144, column: 12, scope: !116)
!121 = !DILocation(line: 144, column: 5, scope: !116)
!122 = !DILocation(line: 145, column: 17, scope: !116)
!123 = !DILocation(line: 145, column: 5, scope: !116)
!124 = !DILocation(line: 146, column: 1, scope: !116)
!125 = distinct !DISubprogram(name: "goodB2GSink", scope: !15, file: !15, line: 109, type: !28, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!126 = !DILocalVariable(name: "data", arg: 1, scope: !125, file: !15, line: 109, type: !5)
!127 = !DILocation(line: 109, column: 29, scope: !125)
!128 = !DILocalVariable(name: "i", scope: !129, file: !15, line: 112, type: !5)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 111, column: 5)
!130 = !DILocation(line: 112, column: 13, scope: !129)
!131 = !DILocalVariable(name: "buffer", scope: !129, file: !15, line: 113, type: !4)
!132 = !DILocation(line: 113, column: 15, scope: !129)
!133 = !DILocation(line: 113, column: 31, scope: !129)
!134 = !DILocation(line: 113, column: 24, scope: !129)
!135 = !DILocation(line: 114, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !129, file: !15, line: 114, column: 13)
!137 = !DILocation(line: 114, column: 20, scope: !136)
!138 = !DILocation(line: 114, column: 13, scope: !129)
!139 = !DILocation(line: 114, column: 30, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !15, line: 114, column: 29)
!141 = !DILocation(line: 116, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !129, file: !15, line: 116, column: 9)
!143 = !DILocation(line: 116, column: 14, scope: !142)
!144 = !DILocation(line: 116, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !15, line: 116, column: 9)
!146 = !DILocation(line: 116, column: 23, scope: !145)
!147 = !DILocation(line: 116, column: 9, scope: !142)
!148 = !DILocation(line: 118, column: 13, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !15, line: 117, column: 9)
!150 = !DILocation(line: 118, column: 20, scope: !149)
!151 = !DILocation(line: 118, column: 23, scope: !149)
!152 = !DILocation(line: 119, column: 9, scope: !149)
!153 = !DILocation(line: 116, column: 30, scope: !145)
!154 = !DILocation(line: 116, column: 9, scope: !145)
!155 = distinct !{!155, !147, !156, !61}
!156 = !DILocation(line: 119, column: 9, scope: !142)
!157 = !DILocation(line: 121, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !129, file: !15, line: 121, column: 13)
!159 = !DILocation(line: 121, column: 18, scope: !158)
!160 = !DILocation(line: 121, column: 23, scope: !158)
!161 = !DILocation(line: 121, column: 26, scope: !158)
!162 = !DILocation(line: 121, column: 31, scope: !158)
!163 = !DILocation(line: 121, column: 13, scope: !129)
!164 = !DILocation(line: 123, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !15, line: 122, column: 9)
!166 = !DILocation(line: 123, column: 20, scope: !165)
!167 = !DILocation(line: 123, column: 26, scope: !165)
!168 = !DILocation(line: 125, column: 19, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !15, line: 125, column: 13)
!170 = !DILocation(line: 125, column: 17, scope: !169)
!171 = !DILocation(line: 125, column: 24, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !15, line: 125, column: 13)
!173 = !DILocation(line: 125, column: 26, scope: !172)
!174 = !DILocation(line: 125, column: 13, scope: !169)
!175 = !DILocation(line: 127, column: 30, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !15, line: 126, column: 13)
!177 = !DILocation(line: 127, column: 37, scope: !176)
!178 = !DILocation(line: 127, column: 17, scope: !176)
!179 = !DILocation(line: 128, column: 13, scope: !176)
!180 = !DILocation(line: 125, column: 33, scope: !172)
!181 = !DILocation(line: 125, column: 13, scope: !172)
!182 = distinct !{!182, !174, !183, !61}
!183 = !DILocation(line: 128, column: 13, scope: !169)
!184 = !DILocation(line: 129, column: 9, scope: !165)
!185 = !DILocation(line: 132, column: 13, scope: !186)
!186 = distinct !DILexicalBlock(scope: !158, file: !15, line: 131, column: 9)
!187 = !DILocation(line: 134, column: 14, scope: !129)
!188 = !DILocation(line: 134, column: 9, scope: !129)
!189 = !DILocation(line: 136, column: 1, scope: !125)
!190 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 97, type: !16, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!191 = !DILocalVariable(name: "data", scope: !190, file: !15, line: 99, type: !5)
!192 = !DILocation(line: 99, column: 9, scope: !190)
!193 = !DILocation(line: 101, column: 10, scope: !190)
!194 = !DILocation(line: 104, column: 10, scope: !190)
!195 = !DILocation(line: 105, column: 17, scope: !190)
!196 = !DILocation(line: 105, column: 5, scope: !190)
!197 = !DILocation(line: 106, column: 1, scope: !190)
!198 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 67, type: !28, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!199 = !DILocalVariable(name: "data", arg: 1, scope: !198, file: !15, line: 67, type: !5)
!200 = !DILocation(line: 67, column: 29, scope: !198)
!201 = !DILocalVariable(name: "i", scope: !202, file: !15, line: 70, type: !5)
!202 = distinct !DILexicalBlock(scope: !198, file: !15, line: 69, column: 5)
!203 = !DILocation(line: 70, column: 13, scope: !202)
!204 = !DILocalVariable(name: "buffer", scope: !202, file: !15, line: 71, type: !4)
!205 = !DILocation(line: 71, column: 15, scope: !202)
!206 = !DILocation(line: 71, column: 31, scope: !202)
!207 = !DILocation(line: 71, column: 24, scope: !202)
!208 = !DILocation(line: 72, column: 13, scope: !209)
!209 = distinct !DILexicalBlock(scope: !202, file: !15, line: 72, column: 13)
!210 = !DILocation(line: 72, column: 20, scope: !209)
!211 = !DILocation(line: 72, column: 13, scope: !202)
!212 = !DILocation(line: 72, column: 30, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !15, line: 72, column: 29)
!214 = !DILocation(line: 74, column: 16, scope: !215)
!215 = distinct !DILexicalBlock(scope: !202, file: !15, line: 74, column: 9)
!216 = !DILocation(line: 74, column: 14, scope: !215)
!217 = !DILocation(line: 74, column: 21, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !15, line: 74, column: 9)
!219 = !DILocation(line: 74, column: 23, scope: !218)
!220 = !DILocation(line: 74, column: 9, scope: !215)
!221 = !DILocation(line: 76, column: 13, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !15, line: 75, column: 9)
!223 = !DILocation(line: 76, column: 20, scope: !222)
!224 = !DILocation(line: 76, column: 23, scope: !222)
!225 = !DILocation(line: 77, column: 9, scope: !222)
!226 = !DILocation(line: 74, column: 30, scope: !218)
!227 = !DILocation(line: 74, column: 9, scope: !218)
!228 = distinct !{!228, !220, !229, !61}
!229 = !DILocation(line: 77, column: 9, scope: !215)
!230 = !DILocation(line: 80, column: 13, scope: !231)
!231 = distinct !DILexicalBlock(scope: !202, file: !15, line: 80, column: 13)
!232 = !DILocation(line: 80, column: 18, scope: !231)
!233 = !DILocation(line: 80, column: 13, scope: !202)
!234 = !DILocation(line: 82, column: 13, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !15, line: 81, column: 9)
!236 = !DILocation(line: 82, column: 20, scope: !235)
!237 = !DILocation(line: 82, column: 26, scope: !235)
!238 = !DILocation(line: 84, column: 19, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !15, line: 84, column: 13)
!240 = !DILocation(line: 84, column: 17, scope: !239)
!241 = !DILocation(line: 84, column: 24, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !15, line: 84, column: 13)
!243 = !DILocation(line: 84, column: 26, scope: !242)
!244 = !DILocation(line: 84, column: 13, scope: !239)
!245 = !DILocation(line: 86, column: 30, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !15, line: 85, column: 13)
!247 = !DILocation(line: 86, column: 37, scope: !246)
!248 = !DILocation(line: 86, column: 17, scope: !246)
!249 = !DILocation(line: 87, column: 13, scope: !246)
!250 = !DILocation(line: 84, column: 33, scope: !242)
!251 = !DILocation(line: 84, column: 13, scope: !242)
!252 = distinct !{!252, !244, !253, !61}
!253 = !DILocation(line: 87, column: 13, scope: !239)
!254 = !DILocation(line: 88, column: 9, scope: !235)
!255 = !DILocation(line: 91, column: 13, scope: !256)
!256 = distinct !DILexicalBlock(scope: !231, file: !15, line: 90, column: 9)
!257 = !DILocation(line: 93, column: 14, scope: !202)
!258 = !DILocation(line: 93, column: 9, scope: !202)
!259 = !DILocation(line: 95, column: 1, scope: !198)
