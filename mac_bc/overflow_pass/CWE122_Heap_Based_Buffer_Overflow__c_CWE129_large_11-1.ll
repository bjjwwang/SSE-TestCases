; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_11-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_11_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %call = call i32 (...) @globalReturnsTrue(), !dbg !22
  %tobool = icmp ne i32 %call, 0, !dbg !22
  br i1 %tobool, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !25
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !28
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

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_11_good() #0 !dbg !93 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_11_good(), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_11_bad(), !dbg !116
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !119 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !120, metadata !DIExpression()), !dbg !121
  store i32 -1, i32* %data, align 4, !dbg !122
  %call = call i32 (...) @globalReturnsTrue(), !dbg !123
  %tobool = icmp ne i32 %call, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !126
  br label %if.end, !dbg !128

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsFalse(), !dbg !129
  %tobool2 = icmp ne i32 %call1, 0, !dbg !129
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !131

if.then3:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !132
  br label %if.end23, !dbg !134

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !135, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !139, metadata !DIExpression()), !dbg !140
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !141
  %0 = bitcast i8* %call4 to i32*, !dbg !142
  store i32* %0, i32** %buffer, align 8, !dbg !140
  %1 = load i32*, i32** %buffer, align 8, !dbg !143
  %cmp = icmp eq i32* %1, null, !dbg !145
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !146

if.then5:                                         ; preds = %if.else
  call void @exit(i32 noundef -1) #6, !dbg !147
  unreachable, !dbg !147

if.end6:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !152
  %cmp7 = icmp slt i32 %2, 10, !dbg !154
  br i1 %cmp7, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !156
  %4 = load i32, i32* %i, align 4, !dbg !158
  %idxprom = sext i32 %4 to i64, !dbg !156
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !156
  store i32 0, i32* %arrayidx, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !161
  %inc = add nsw i32 %5, 1, !dbg !161
  store i32 %inc, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !165
  %cmp8 = icmp sge i32 %6, 0, !dbg !167
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !168

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !169
  %cmp9 = icmp slt i32 %7, 10, !dbg !170
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !171

if.then10:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !172
  %9 = load i32, i32* %data, align 4, !dbg !174
  %idxprom11 = sext i32 %9 to i64, !dbg !172
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %idxprom11, !dbg !172
  store i32 1, i32* %arrayidx12, align 4, !dbg !175
  store i32 0, i32* %i, align 4, !dbg !176
  br label %for.cond13, !dbg !178

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %10 = load i32, i32* %i, align 4, !dbg !179
  %cmp14 = icmp slt i32 %10, 10, !dbg !181
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !182

for.body15:                                       ; preds = %for.cond13
  %11 = load i32*, i32** %buffer, align 8, !dbg !183
  %12 = load i32, i32* %i, align 4, !dbg !185
  %idxprom16 = sext i32 %12 to i64, !dbg !183
  %arrayidx17 = getelementptr inbounds i32, i32* %11, i64 %idxprom16, !dbg !183
  %13 = load i32, i32* %arrayidx17, align 4, !dbg !183
  call void @printIntLine(i32 noundef %13), !dbg !186
  br label %for.inc18, !dbg !187

for.inc18:                                        ; preds = %for.body15
  %14 = load i32, i32* %i, align 4, !dbg !188
  %inc19 = add nsw i32 %14, 1, !dbg !188
  store i32 %inc19, i32* %i, align 4, !dbg !188
  br label %for.cond13, !dbg !189, !llvm.loop !190

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !192

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !193
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %15 = load i32*, i32** %buffer, align 8, !dbg !195
  %16 = bitcast i32* %15 to i8*, !dbg !195
  call void @free(i8* noundef %16), !dbg !196
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then3
  ret void, !dbg !197
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !198 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !199, metadata !DIExpression()), !dbg !200
  store i32 -1, i32* %data, align 4, !dbg !201
  %call = call i32 (...) @globalReturnsTrue(), !dbg !202
  %tobool = icmp ne i32 %call, 0, !dbg !202
  br i1 %tobool, label %if.then, label %if.end, !dbg !204

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !205
  br label %if.end, !dbg !207

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !208
  %tobool2 = icmp ne i32 %call1, 0, !dbg !208
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !210

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !211, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !215, metadata !DIExpression()), !dbg !216
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !217
  %0 = bitcast i8* %call4 to i32*, !dbg !218
  store i32* %0, i32** %buffer, align 8, !dbg !216
  %1 = load i32*, i32** %buffer, align 8, !dbg !219
  %cmp = icmp eq i32* %1, null, !dbg !221
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !222

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !223
  unreachable, !dbg !223

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !225
  br label %for.cond, !dbg !227

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !228
  %cmp7 = icmp slt i32 %2, 10, !dbg !230
  br i1 %cmp7, label %for.body, label %for.end, !dbg !231

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !232
  %4 = load i32, i32* %i, align 4, !dbg !234
  %idxprom = sext i32 %4 to i64, !dbg !232
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !232
  store i32 0, i32* %arrayidx, align 4, !dbg !235
  br label %for.inc, !dbg !236

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !237
  %inc = add nsw i32 %5, 1, !dbg !237
  store i32 %inc, i32* %i, align 4, !dbg !237
  br label %for.cond, !dbg !238, !llvm.loop !239

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !241
  %cmp8 = icmp sge i32 %6, 0, !dbg !243
  br i1 %cmp8, label %land.lhs.true, label %if.else, !dbg !244

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !245
  %cmp9 = icmp slt i32 %7, 10, !dbg !246
  br i1 %cmp9, label %if.then10, label %if.else, !dbg !247

if.then10:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !248
  %9 = load i32, i32* %data, align 4, !dbg !250
  %idxprom11 = sext i32 %9 to i64, !dbg !248
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %idxprom11, !dbg !248
  store i32 1, i32* %arrayidx12, align 4, !dbg !251
  store i32 0, i32* %i, align 4, !dbg !252
  br label %for.cond13, !dbg !254

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %10 = load i32, i32* %i, align 4, !dbg !255
  %cmp14 = icmp slt i32 %10, 10, !dbg !257
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !258

for.body15:                                       ; preds = %for.cond13
  %11 = load i32*, i32** %buffer, align 8, !dbg !259
  %12 = load i32, i32* %i, align 4, !dbg !261
  %idxprom16 = sext i32 %12 to i64, !dbg !259
  %arrayidx17 = getelementptr inbounds i32, i32* %11, i64 %idxprom16, !dbg !259
  %13 = load i32, i32* %arrayidx17, align 4, !dbg !259
  call void @printIntLine(i32 noundef %13), !dbg !262
  br label %for.inc18, !dbg !263

for.inc18:                                        ; preds = %for.body15
  %14 = load i32, i32* %i, align 4, !dbg !264
  %inc19 = add nsw i32 %14, 1, !dbg !264
  store i32 %inc19, i32* %i, align 4, !dbg !264
  br label %for.cond13, !dbg !265, !llvm.loop !266

for.end20:                                        ; preds = %for.cond13
  br label %if.end21, !dbg !268

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !269
  br label %if.end21

if.end21:                                         ; preds = %if.else, %for.end20
  %15 = load i32*, i32** %buffer, align 8, !dbg !271
  %16 = bitcast i32* %15 to i8*, !dbg !271
  call void @free(i8* noundef %16), !dbg !272
  br label %if.end22, !dbg !273

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !274
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !275 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !276, metadata !DIExpression()), !dbg !277
  store i32 -1, i32* %data, align 4, !dbg !278
  %call = call i32 (...) @globalReturnsFalse(), !dbg !279
  %tobool = icmp ne i32 %call, 0, !dbg !279
  br i1 %tobool, label %if.then, label %if.else, !dbg !281

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !282
  br label %if.end, !dbg !284

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !285
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !287
  %tobool2 = icmp ne i32 %call1, 0, !dbg !287
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !289

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !290, metadata !DIExpression()), !dbg !293
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !294, metadata !DIExpression()), !dbg !295
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !296
  %0 = bitcast i8* %call4 to i32*, !dbg !297
  store i32* %0, i32** %buffer, align 8, !dbg !295
  %1 = load i32*, i32** %buffer, align 8, !dbg !298
  %cmp = icmp eq i32* %1, null, !dbg !300
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !301

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !302
  unreachable, !dbg !302

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !304
  br label %for.cond, !dbg !306

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !307
  %cmp7 = icmp slt i32 %2, 10, !dbg !309
  br i1 %cmp7, label %for.body, label %for.end, !dbg !310

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !311
  %4 = load i32, i32* %i, align 4, !dbg !313
  %idxprom = sext i32 %4 to i64, !dbg !311
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !311
  store i32 0, i32* %arrayidx, align 4, !dbg !314
  br label %for.inc, !dbg !315

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !316
  %inc = add nsw i32 %5, 1, !dbg !316
  store i32 %inc, i32* %i, align 4, !dbg !316
  br label %for.cond, !dbg !317, !llvm.loop !318

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !320
  %cmp8 = icmp sge i32 %6, 0, !dbg !322
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !323

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !324
  %8 = load i32, i32* %data, align 4, !dbg !326
  %idxprom10 = sext i32 %8 to i64, !dbg !324
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !324
  store i32 1, i32* %arrayidx11, align 4, !dbg !327
  store i32 0, i32* %i, align 4, !dbg !328
  br label %for.cond12, !dbg !330

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !331
  %cmp13 = icmp slt i32 %9, 10, !dbg !333
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !334

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !335
  %11 = load i32, i32* %i, align 4, !dbg !337
  %idxprom15 = sext i32 %11 to i64, !dbg !335
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !335
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !335
  call void @printIntLine(i32 noundef %12), !dbg !338
  br label %for.inc17, !dbg !339

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !340
  %inc18 = add nsw i32 %13, 1, !dbg !340
  store i32 %inc18, i32* %i, align 4, !dbg !340
  br label %for.cond12, !dbg !341, !llvm.loop !342

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !344

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !345
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !347
  %15 = bitcast i32* %14 to i8*, !dbg !347
  call void @free(i8* noundef %15), !dbg !348
  br label %if.end22, !dbg !349

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !350
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !351 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !352, metadata !DIExpression()), !dbg !353
  store i32 -1, i32* %data, align 4, !dbg !354
  %call = call i32 (...) @globalReturnsTrue(), !dbg !355
  %tobool = icmp ne i32 %call, 0, !dbg !355
  br i1 %tobool, label %if.then, label %if.end, !dbg !357

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !358
  br label %if.end, !dbg !360

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !361
  %tobool2 = icmp ne i32 %call1, 0, !dbg !361
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !363

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !364, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !368, metadata !DIExpression()), !dbg !369
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !370
  %0 = bitcast i8* %call4 to i32*, !dbg !371
  store i32* %0, i32** %buffer, align 8, !dbg !369
  %1 = load i32*, i32** %buffer, align 8, !dbg !372
  %cmp = icmp eq i32* %1, null, !dbg !374
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !375

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !376
  unreachable, !dbg !376

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !378
  br label %for.cond, !dbg !380

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !381
  %cmp7 = icmp slt i32 %2, 10, !dbg !383
  br i1 %cmp7, label %for.body, label %for.end, !dbg !384

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !385
  %4 = load i32, i32* %i, align 4, !dbg !387
  %idxprom = sext i32 %4 to i64, !dbg !385
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !385
  store i32 0, i32* %arrayidx, align 4, !dbg !388
  br label %for.inc, !dbg !389

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !390
  %inc = add nsw i32 %5, 1, !dbg !390
  store i32 %inc, i32* %i, align 4, !dbg !390
  br label %for.cond, !dbg !391, !llvm.loop !392

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !394
  %cmp8 = icmp sge i32 %6, 0, !dbg !396
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !397

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !398
  %8 = load i32, i32* %data, align 4, !dbg !400
  %idxprom10 = sext i32 %8 to i64, !dbg !398
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !398
  store i32 1, i32* %arrayidx11, align 4, !dbg !401
  store i32 0, i32* %i, align 4, !dbg !402
  br label %for.cond12, !dbg !404

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !405
  %cmp13 = icmp slt i32 %9, 10, !dbg !407
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !408

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !409
  %11 = load i32, i32* %i, align 4, !dbg !411
  %idxprom15 = sext i32 %11 to i64, !dbg !409
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !409
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !409
  call void @printIntLine(i32 noundef %12), !dbg !412
  br label %for.inc17, !dbg !413

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !414
  %inc18 = add nsw i32 %13, 1, !dbg !414
  store i32 %inc18, i32* %i, align 4, !dbg !414
  br label %for.cond12, !dbg !415, !llvm.loop !416

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !418

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !419
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !421
  %15 = bitcast i32* %14 to i8*, !dbg !421
  call void @free(i8* noundef %15), !dbg !422
  br label %if.end21, !dbg !423

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !424
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_11_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 9, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocation(line: 30, column: 14, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 31, column: 5, scope: !26)
!28 = !DILocation(line: 32, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!30 = !DILocation(line: 32, column: 8, scope: !14)
!31 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 35, type: !4)
!32 = distinct !DILexicalBlock(scope: !33, file: !15, line: 34, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 33, column: 5)
!34 = !DILocation(line: 35, column: 17, scope: !32)
!35 = !DILocalVariable(name: "buffer", scope: !32, file: !15, line: 36, type: !3)
!36 = !DILocation(line: 36, column: 19, scope: !32)
!37 = !DILocation(line: 36, column: 35, scope: !32)
!38 = !DILocation(line: 36, column: 28, scope: !32)
!39 = !DILocation(line: 37, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !15, line: 37, column: 17)
!41 = !DILocation(line: 37, column: 24, scope: !40)
!42 = !DILocation(line: 37, column: 17, scope: !32)
!43 = !DILocation(line: 37, column: 34, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 37, column: 33)
!45 = !DILocation(line: 39, column: 20, scope: !46)
!46 = distinct !DILexicalBlock(scope: !32, file: !15, line: 39, column: 13)
!47 = !DILocation(line: 39, column: 18, scope: !46)
!48 = !DILocation(line: 39, column: 25, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !15, line: 39, column: 13)
!50 = !DILocation(line: 39, column: 27, scope: !49)
!51 = !DILocation(line: 39, column: 13, scope: !46)
!52 = !DILocation(line: 41, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 40, column: 13)
!54 = !DILocation(line: 41, column: 24, scope: !53)
!55 = !DILocation(line: 41, column: 27, scope: !53)
!56 = !DILocation(line: 42, column: 13, scope: !53)
!57 = !DILocation(line: 39, column: 34, scope: !49)
!58 = !DILocation(line: 39, column: 13, scope: !49)
!59 = distinct !{!59, !51, !60, !61}
!60 = !DILocation(line: 42, column: 13, scope: !46)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 45, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !32, file: !15, line: 45, column: 17)
!64 = !DILocation(line: 45, column: 22, scope: !63)
!65 = !DILocation(line: 45, column: 17, scope: !32)
!66 = !DILocation(line: 47, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 46, column: 13)
!68 = !DILocation(line: 47, column: 24, scope: !67)
!69 = !DILocation(line: 47, column: 30, scope: !67)
!70 = !DILocation(line: 49, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 49, column: 17)
!72 = !DILocation(line: 49, column: 21, scope: !71)
!73 = !DILocation(line: 49, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !15, line: 49, column: 17)
!75 = !DILocation(line: 49, column: 30, scope: !74)
!76 = !DILocation(line: 49, column: 17, scope: !71)
!77 = !DILocation(line: 51, column: 34, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 50, column: 17)
!79 = !DILocation(line: 51, column: 41, scope: !78)
!80 = !DILocation(line: 51, column: 21, scope: !78)
!81 = !DILocation(line: 52, column: 17, scope: !78)
!82 = !DILocation(line: 49, column: 37, scope: !74)
!83 = !DILocation(line: 49, column: 17, scope: !74)
!84 = distinct !{!84, !76, !85, !61}
!85 = !DILocation(line: 52, column: 17, scope: !71)
!86 = !DILocation(line: 53, column: 13, scope: !67)
!87 = !DILocation(line: 56, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !63, file: !15, line: 55, column: 13)
!89 = !DILocation(line: 58, column: 18, scope: !32)
!90 = !DILocation(line: 58, column: 13, scope: !32)
!91 = !DILocation(line: 60, column: 5, scope: !33)
!92 = !DILocation(line: 61, column: 1, scope: !14)
!93 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_11_good", scope: !15, file: !15, line: 245, type: !16, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!94 = !DILocation(line: 247, column: 5, scope: !93)
!95 = !DILocation(line: 248, column: 5, scope: !93)
!96 = !DILocation(line: 249, column: 5, scope: !93)
!97 = !DILocation(line: 250, column: 5, scope: !93)
!98 = !DILocation(line: 251, column: 1, scope: !93)
!99 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 262, type: !100, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!100 = !DISubroutineType(types: !101)
!101 = !{!4, !4, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !15, line: 262, type: !4)
!106 = !DILocation(line: 262, column: 14, scope: !99)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !15, line: 262, type: !102)
!108 = !DILocation(line: 262, column: 27, scope: !99)
!109 = !DILocation(line: 265, column: 22, scope: !99)
!110 = !DILocation(line: 265, column: 12, scope: !99)
!111 = !DILocation(line: 265, column: 5, scope: !99)
!112 = !DILocation(line: 267, column: 5, scope: !99)
!113 = !DILocation(line: 268, column: 5, scope: !99)
!114 = !DILocation(line: 269, column: 5, scope: !99)
!115 = !DILocation(line: 272, column: 5, scope: !99)
!116 = !DILocation(line: 273, column: 5, scope: !99)
!117 = !DILocation(line: 274, column: 5, scope: !99)
!118 = !DILocation(line: 276, column: 5, scope: !99)
!119 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!120 = !DILocalVariable(name: "data", scope: !119, file: !15, line: 70, type: !4)
!121 = !DILocation(line: 70, column: 9, scope: !119)
!122 = !DILocation(line: 72, column: 10, scope: !119)
!123 = !DILocation(line: 73, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !15, line: 73, column: 8)
!125 = !DILocation(line: 73, column: 8, scope: !119)
!126 = !DILocation(line: 76, column: 14, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !15, line: 74, column: 5)
!128 = !DILocation(line: 77, column: 5, scope: !127)
!129 = !DILocation(line: 78, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !119, file: !15, line: 78, column: 8)
!131 = !DILocation(line: 78, column: 8, scope: !119)
!132 = !DILocation(line: 81, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !15, line: 79, column: 5)
!134 = !DILocation(line: 82, column: 5, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !136, file: !15, line: 86, type: !4)
!136 = distinct !DILexicalBlock(scope: !137, file: !15, line: 85, column: 9)
!137 = distinct !DILexicalBlock(scope: !130, file: !15, line: 84, column: 5)
!138 = !DILocation(line: 86, column: 17, scope: !136)
!139 = !DILocalVariable(name: "buffer", scope: !136, file: !15, line: 87, type: !3)
!140 = !DILocation(line: 87, column: 19, scope: !136)
!141 = !DILocation(line: 87, column: 35, scope: !136)
!142 = !DILocation(line: 87, column: 28, scope: !136)
!143 = !DILocation(line: 88, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !136, file: !15, line: 88, column: 17)
!145 = !DILocation(line: 88, column: 24, scope: !144)
!146 = !DILocation(line: 88, column: 17, scope: !136)
!147 = !DILocation(line: 88, column: 34, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !15, line: 88, column: 33)
!149 = !DILocation(line: 90, column: 20, scope: !150)
!150 = distinct !DILexicalBlock(scope: !136, file: !15, line: 90, column: 13)
!151 = !DILocation(line: 90, column: 18, scope: !150)
!152 = !DILocation(line: 90, column: 25, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !15, line: 90, column: 13)
!154 = !DILocation(line: 90, column: 27, scope: !153)
!155 = !DILocation(line: 90, column: 13, scope: !150)
!156 = !DILocation(line: 92, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !15, line: 91, column: 13)
!158 = !DILocation(line: 92, column: 24, scope: !157)
!159 = !DILocation(line: 92, column: 27, scope: !157)
!160 = !DILocation(line: 93, column: 13, scope: !157)
!161 = !DILocation(line: 90, column: 34, scope: !153)
!162 = !DILocation(line: 90, column: 13, scope: !153)
!163 = distinct !{!163, !155, !164, !61}
!164 = !DILocation(line: 93, column: 13, scope: !150)
!165 = !DILocation(line: 95, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !136, file: !15, line: 95, column: 17)
!167 = !DILocation(line: 95, column: 22, scope: !166)
!168 = !DILocation(line: 95, column: 27, scope: !166)
!169 = !DILocation(line: 95, column: 30, scope: !166)
!170 = !DILocation(line: 95, column: 35, scope: !166)
!171 = !DILocation(line: 95, column: 17, scope: !136)
!172 = !DILocation(line: 97, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !166, file: !15, line: 96, column: 13)
!174 = !DILocation(line: 97, column: 24, scope: !173)
!175 = !DILocation(line: 97, column: 30, scope: !173)
!176 = !DILocation(line: 99, column: 23, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !15, line: 99, column: 17)
!178 = !DILocation(line: 99, column: 21, scope: !177)
!179 = !DILocation(line: 99, column: 28, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !15, line: 99, column: 17)
!181 = !DILocation(line: 99, column: 30, scope: !180)
!182 = !DILocation(line: 99, column: 17, scope: !177)
!183 = !DILocation(line: 101, column: 34, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !15, line: 100, column: 17)
!185 = !DILocation(line: 101, column: 41, scope: !184)
!186 = !DILocation(line: 101, column: 21, scope: !184)
!187 = !DILocation(line: 102, column: 17, scope: !184)
!188 = !DILocation(line: 99, column: 37, scope: !180)
!189 = !DILocation(line: 99, column: 17, scope: !180)
!190 = distinct !{!190, !182, !191, !61}
!191 = !DILocation(line: 102, column: 17, scope: !177)
!192 = !DILocation(line: 103, column: 13, scope: !173)
!193 = !DILocation(line: 106, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !166, file: !15, line: 105, column: 13)
!195 = !DILocation(line: 108, column: 18, scope: !136)
!196 = !DILocation(line: 108, column: 13, scope: !136)
!197 = !DILocation(line: 111, column: 1, scope: !119)
!198 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!199 = !DILocalVariable(name: "data", scope: !198, file: !15, line: 116, type: !4)
!200 = !DILocation(line: 116, column: 9, scope: !198)
!201 = !DILocation(line: 118, column: 10, scope: !198)
!202 = !DILocation(line: 119, column: 8, scope: !203)
!203 = distinct !DILexicalBlock(scope: !198, file: !15, line: 119, column: 8)
!204 = !DILocation(line: 119, column: 8, scope: !198)
!205 = !DILocation(line: 122, column: 14, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !15, line: 120, column: 5)
!207 = !DILocation(line: 123, column: 5, scope: !206)
!208 = !DILocation(line: 124, column: 8, scope: !209)
!209 = distinct !DILexicalBlock(scope: !198, file: !15, line: 124, column: 8)
!210 = !DILocation(line: 124, column: 8, scope: !198)
!211 = !DILocalVariable(name: "i", scope: !212, file: !15, line: 127, type: !4)
!212 = distinct !DILexicalBlock(scope: !213, file: !15, line: 126, column: 9)
!213 = distinct !DILexicalBlock(scope: !209, file: !15, line: 125, column: 5)
!214 = !DILocation(line: 127, column: 17, scope: !212)
!215 = !DILocalVariable(name: "buffer", scope: !212, file: !15, line: 128, type: !3)
!216 = !DILocation(line: 128, column: 19, scope: !212)
!217 = !DILocation(line: 128, column: 35, scope: !212)
!218 = !DILocation(line: 128, column: 28, scope: !212)
!219 = !DILocation(line: 129, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !212, file: !15, line: 129, column: 17)
!221 = !DILocation(line: 129, column: 24, scope: !220)
!222 = !DILocation(line: 129, column: 17, scope: !212)
!223 = !DILocation(line: 129, column: 34, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !15, line: 129, column: 33)
!225 = !DILocation(line: 131, column: 20, scope: !226)
!226 = distinct !DILexicalBlock(scope: !212, file: !15, line: 131, column: 13)
!227 = !DILocation(line: 131, column: 18, scope: !226)
!228 = !DILocation(line: 131, column: 25, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !15, line: 131, column: 13)
!230 = !DILocation(line: 131, column: 27, scope: !229)
!231 = !DILocation(line: 131, column: 13, scope: !226)
!232 = !DILocation(line: 133, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !15, line: 132, column: 13)
!234 = !DILocation(line: 133, column: 24, scope: !233)
!235 = !DILocation(line: 133, column: 27, scope: !233)
!236 = !DILocation(line: 134, column: 13, scope: !233)
!237 = !DILocation(line: 131, column: 34, scope: !229)
!238 = !DILocation(line: 131, column: 13, scope: !229)
!239 = distinct !{!239, !231, !240, !61}
!240 = !DILocation(line: 134, column: 13, scope: !226)
!241 = !DILocation(line: 136, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !212, file: !15, line: 136, column: 17)
!243 = !DILocation(line: 136, column: 22, scope: !242)
!244 = !DILocation(line: 136, column: 27, scope: !242)
!245 = !DILocation(line: 136, column: 30, scope: !242)
!246 = !DILocation(line: 136, column: 35, scope: !242)
!247 = !DILocation(line: 136, column: 17, scope: !212)
!248 = !DILocation(line: 138, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !242, file: !15, line: 137, column: 13)
!250 = !DILocation(line: 138, column: 24, scope: !249)
!251 = !DILocation(line: 138, column: 30, scope: !249)
!252 = !DILocation(line: 140, column: 23, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !15, line: 140, column: 17)
!254 = !DILocation(line: 140, column: 21, scope: !253)
!255 = !DILocation(line: 140, column: 28, scope: !256)
!256 = distinct !DILexicalBlock(scope: !253, file: !15, line: 140, column: 17)
!257 = !DILocation(line: 140, column: 30, scope: !256)
!258 = !DILocation(line: 140, column: 17, scope: !253)
!259 = !DILocation(line: 142, column: 34, scope: !260)
!260 = distinct !DILexicalBlock(scope: !256, file: !15, line: 141, column: 17)
!261 = !DILocation(line: 142, column: 41, scope: !260)
!262 = !DILocation(line: 142, column: 21, scope: !260)
!263 = !DILocation(line: 143, column: 17, scope: !260)
!264 = !DILocation(line: 140, column: 37, scope: !256)
!265 = !DILocation(line: 140, column: 17, scope: !256)
!266 = distinct !{!266, !258, !267, !61}
!267 = !DILocation(line: 143, column: 17, scope: !253)
!268 = !DILocation(line: 144, column: 13, scope: !249)
!269 = !DILocation(line: 147, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !242, file: !15, line: 146, column: 13)
!271 = !DILocation(line: 149, column: 18, scope: !212)
!272 = !DILocation(line: 149, column: 13, scope: !212)
!273 = !DILocation(line: 151, column: 5, scope: !213)
!274 = !DILocation(line: 152, column: 1, scope: !198)
!275 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 155, type: !16, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!276 = !DILocalVariable(name: "data", scope: !275, file: !15, line: 157, type: !4)
!277 = !DILocation(line: 157, column: 9, scope: !275)
!278 = !DILocation(line: 159, column: 10, scope: !275)
!279 = !DILocation(line: 160, column: 8, scope: !280)
!280 = distinct !DILexicalBlock(scope: !275, file: !15, line: 160, column: 8)
!281 = !DILocation(line: 160, column: 8, scope: !275)
!282 = !DILocation(line: 163, column: 9, scope: !283)
!283 = distinct !DILexicalBlock(scope: !280, file: !15, line: 161, column: 5)
!284 = !DILocation(line: 164, column: 5, scope: !283)
!285 = !DILocation(line: 169, column: 14, scope: !286)
!286 = distinct !DILexicalBlock(scope: !280, file: !15, line: 166, column: 5)
!287 = !DILocation(line: 171, column: 8, scope: !288)
!288 = distinct !DILexicalBlock(scope: !275, file: !15, line: 171, column: 8)
!289 = !DILocation(line: 171, column: 8, scope: !275)
!290 = !DILocalVariable(name: "i", scope: !291, file: !15, line: 174, type: !4)
!291 = distinct !DILexicalBlock(scope: !292, file: !15, line: 173, column: 9)
!292 = distinct !DILexicalBlock(scope: !288, file: !15, line: 172, column: 5)
!293 = !DILocation(line: 174, column: 17, scope: !291)
!294 = !DILocalVariable(name: "buffer", scope: !291, file: !15, line: 175, type: !3)
!295 = !DILocation(line: 175, column: 19, scope: !291)
!296 = !DILocation(line: 175, column: 35, scope: !291)
!297 = !DILocation(line: 175, column: 28, scope: !291)
!298 = !DILocation(line: 176, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !291, file: !15, line: 176, column: 17)
!300 = !DILocation(line: 176, column: 24, scope: !299)
!301 = !DILocation(line: 176, column: 17, scope: !291)
!302 = !DILocation(line: 176, column: 34, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !15, line: 176, column: 33)
!304 = !DILocation(line: 178, column: 20, scope: !305)
!305 = distinct !DILexicalBlock(scope: !291, file: !15, line: 178, column: 13)
!306 = !DILocation(line: 178, column: 18, scope: !305)
!307 = !DILocation(line: 178, column: 25, scope: !308)
!308 = distinct !DILexicalBlock(scope: !305, file: !15, line: 178, column: 13)
!309 = !DILocation(line: 178, column: 27, scope: !308)
!310 = !DILocation(line: 178, column: 13, scope: !305)
!311 = !DILocation(line: 180, column: 17, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !15, line: 179, column: 13)
!313 = !DILocation(line: 180, column: 24, scope: !312)
!314 = !DILocation(line: 180, column: 27, scope: !312)
!315 = !DILocation(line: 181, column: 13, scope: !312)
!316 = !DILocation(line: 178, column: 34, scope: !308)
!317 = !DILocation(line: 178, column: 13, scope: !308)
!318 = distinct !{!318, !310, !319, !61}
!319 = !DILocation(line: 181, column: 13, scope: !305)
!320 = !DILocation(line: 184, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !291, file: !15, line: 184, column: 17)
!322 = !DILocation(line: 184, column: 22, scope: !321)
!323 = !DILocation(line: 184, column: 17, scope: !291)
!324 = !DILocation(line: 186, column: 17, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !15, line: 185, column: 13)
!326 = !DILocation(line: 186, column: 24, scope: !325)
!327 = !DILocation(line: 186, column: 30, scope: !325)
!328 = !DILocation(line: 188, column: 23, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !15, line: 188, column: 17)
!330 = !DILocation(line: 188, column: 21, scope: !329)
!331 = !DILocation(line: 188, column: 28, scope: !332)
!332 = distinct !DILexicalBlock(scope: !329, file: !15, line: 188, column: 17)
!333 = !DILocation(line: 188, column: 30, scope: !332)
!334 = !DILocation(line: 188, column: 17, scope: !329)
!335 = !DILocation(line: 190, column: 34, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !15, line: 189, column: 17)
!337 = !DILocation(line: 190, column: 41, scope: !336)
!338 = !DILocation(line: 190, column: 21, scope: !336)
!339 = !DILocation(line: 191, column: 17, scope: !336)
!340 = !DILocation(line: 188, column: 37, scope: !332)
!341 = !DILocation(line: 188, column: 17, scope: !332)
!342 = distinct !{!342, !334, !343, !61}
!343 = !DILocation(line: 191, column: 17, scope: !329)
!344 = !DILocation(line: 192, column: 13, scope: !325)
!345 = !DILocation(line: 195, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !321, file: !15, line: 194, column: 13)
!347 = !DILocation(line: 197, column: 18, scope: !291)
!348 = !DILocation(line: 197, column: 13, scope: !291)
!349 = !DILocation(line: 199, column: 5, scope: !292)
!350 = !DILocation(line: 200, column: 1, scope: !275)
!351 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 203, type: !16, scopeLine: 204, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!352 = !DILocalVariable(name: "data", scope: !351, file: !15, line: 205, type: !4)
!353 = !DILocation(line: 205, column: 9, scope: !351)
!354 = !DILocation(line: 207, column: 10, scope: !351)
!355 = !DILocation(line: 208, column: 8, scope: !356)
!356 = distinct !DILexicalBlock(scope: !351, file: !15, line: 208, column: 8)
!357 = !DILocation(line: 208, column: 8, scope: !351)
!358 = !DILocation(line: 212, column: 14, scope: !359)
!359 = distinct !DILexicalBlock(scope: !356, file: !15, line: 209, column: 5)
!360 = !DILocation(line: 213, column: 5, scope: !359)
!361 = !DILocation(line: 214, column: 8, scope: !362)
!362 = distinct !DILexicalBlock(scope: !351, file: !15, line: 214, column: 8)
!363 = !DILocation(line: 214, column: 8, scope: !351)
!364 = !DILocalVariable(name: "i", scope: !365, file: !15, line: 217, type: !4)
!365 = distinct !DILexicalBlock(scope: !366, file: !15, line: 216, column: 9)
!366 = distinct !DILexicalBlock(scope: !362, file: !15, line: 215, column: 5)
!367 = !DILocation(line: 217, column: 17, scope: !365)
!368 = !DILocalVariable(name: "buffer", scope: !365, file: !15, line: 218, type: !3)
!369 = !DILocation(line: 218, column: 19, scope: !365)
!370 = !DILocation(line: 218, column: 35, scope: !365)
!371 = !DILocation(line: 218, column: 28, scope: !365)
!372 = !DILocation(line: 219, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !365, file: !15, line: 219, column: 17)
!374 = !DILocation(line: 219, column: 24, scope: !373)
!375 = !DILocation(line: 219, column: 17, scope: !365)
!376 = !DILocation(line: 219, column: 34, scope: !377)
!377 = distinct !DILexicalBlock(scope: !373, file: !15, line: 219, column: 33)
!378 = !DILocation(line: 221, column: 20, scope: !379)
!379 = distinct !DILexicalBlock(scope: !365, file: !15, line: 221, column: 13)
!380 = !DILocation(line: 221, column: 18, scope: !379)
!381 = !DILocation(line: 221, column: 25, scope: !382)
!382 = distinct !DILexicalBlock(scope: !379, file: !15, line: 221, column: 13)
!383 = !DILocation(line: 221, column: 27, scope: !382)
!384 = !DILocation(line: 221, column: 13, scope: !379)
!385 = !DILocation(line: 223, column: 17, scope: !386)
!386 = distinct !DILexicalBlock(scope: !382, file: !15, line: 222, column: 13)
!387 = !DILocation(line: 223, column: 24, scope: !386)
!388 = !DILocation(line: 223, column: 27, scope: !386)
!389 = !DILocation(line: 224, column: 13, scope: !386)
!390 = !DILocation(line: 221, column: 34, scope: !382)
!391 = !DILocation(line: 221, column: 13, scope: !382)
!392 = distinct !{!392, !384, !393, !61}
!393 = !DILocation(line: 224, column: 13, scope: !379)
!394 = !DILocation(line: 227, column: 17, scope: !395)
!395 = distinct !DILexicalBlock(scope: !365, file: !15, line: 227, column: 17)
!396 = !DILocation(line: 227, column: 22, scope: !395)
!397 = !DILocation(line: 227, column: 17, scope: !365)
!398 = !DILocation(line: 229, column: 17, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !15, line: 228, column: 13)
!400 = !DILocation(line: 229, column: 24, scope: !399)
!401 = !DILocation(line: 229, column: 30, scope: !399)
!402 = !DILocation(line: 231, column: 23, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !15, line: 231, column: 17)
!404 = !DILocation(line: 231, column: 21, scope: !403)
!405 = !DILocation(line: 231, column: 28, scope: !406)
!406 = distinct !DILexicalBlock(scope: !403, file: !15, line: 231, column: 17)
!407 = !DILocation(line: 231, column: 30, scope: !406)
!408 = !DILocation(line: 231, column: 17, scope: !403)
!409 = !DILocation(line: 233, column: 34, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !15, line: 232, column: 17)
!411 = !DILocation(line: 233, column: 41, scope: !410)
!412 = !DILocation(line: 233, column: 21, scope: !410)
!413 = !DILocation(line: 234, column: 17, scope: !410)
!414 = !DILocation(line: 231, column: 37, scope: !406)
!415 = !DILocation(line: 231, column: 17, scope: !406)
!416 = distinct !{!416, !408, !417, !61}
!417 = !DILocation(line: 234, column: 17, scope: !403)
!418 = !DILocation(line: 235, column: 13, scope: !399)
!419 = !DILocation(line: 238, column: 17, scope: !420)
!420 = distinct !DILexicalBlock(scope: !395, file: !15, line: 237, column: 13)
!421 = !DILocation(line: 240, column: 18, scope: !365)
!422 = !DILocation(line: 240, column: 13, scope: !365)
!423 = !DILocation(line: 242, column: 5, scope: !366)
!424 = !DILocation(line: 243, column: 1, scope: !351)
