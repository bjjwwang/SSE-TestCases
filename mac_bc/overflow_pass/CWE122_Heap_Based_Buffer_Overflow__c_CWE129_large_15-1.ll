; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  store i32 10, i32* %data, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %buffer, align 8, !dbg !27
  %1 = load i32*, i32** %buffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !39
  %cmp1 = icmp slt i32 %2, 10, !dbg !41
  br i1 %cmp1, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !43
  %4 = load i32, i32* %i, align 4, !dbg !45
  %idxprom = sext i32 %4 to i64, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %5, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !53
  %cmp2 = icmp sge i32 %6, 0, !dbg !55
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !56

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !57
  %8 = load i32, i32* %data, align 4, !dbg !59
  %idxprom4 = sext i32 %8 to i64, !dbg !57
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !57
  store i32 1, i32* %arrayidx5, align 4, !dbg !60
  store i32 0, i32* %i, align 4, !dbg !61
  br label %for.cond6, !dbg !63

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !64
  %cmp7 = icmp slt i32 %9, 10, !dbg !66
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !67

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !68
  %11 = load i32, i32* %i, align 4, !dbg !70
  %idxprom9 = sext i32 %11 to i64, !dbg !68
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !68
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !68
  call void @printIntLine(i32 noundef %12), !dbg !71
  br label %for.inc11, !dbg !72

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !73
  %inc12 = add nsw i32 %13, 1, !dbg !73
  store i32 %inc12, i32* %i, align 4, !dbg !73
  br label %for.cond6, !dbg !74, !llvm.loop !75

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !77

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !78
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !80
  %15 = bitcast i32* %14 to i8*, !dbg !80
  call void @free(i8* noundef %15), !dbg !81
  ret void, !dbg !82
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_good() #0 !dbg !83 {
entry:
  call void @goodB2G1(), !dbg !84
  call void @goodB2G2(), !dbg !85
  call void @goodG2B1(), !dbg !86
  call void @goodG2B2(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* noundef null), !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 noundef %conv), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_good(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_bad(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !109 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 -1, i32* %data, align 4, !dbg !112
  store i32 10, i32* %data, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata i32* %i, metadata !114, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !119
  %0 = bitcast i8* %call to i32*, !dbg !120
  store i32* %0, i32** %buffer, align 8, !dbg !118
  %1 = load i32*, i32** %buffer, align 8, !dbg !121
  %cmp = icmp eq i32* %1, null, !dbg !123
  br i1 %cmp, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !130
  %cmp1 = icmp slt i32 %2, 10, !dbg !132
  br i1 %cmp1, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !134
  %4 = load i32, i32* %i, align 4, !dbg !136
  %idxprom = sext i32 %4 to i64, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !139
  %inc = add nsw i32 %5, 1, !dbg !139
  store i32 %inc, i32* %i, align 4, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !143
  %cmp2 = icmp sge i32 %6, 0, !dbg !145
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !146

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !147
  %cmp3 = icmp slt i32 %7, 10, !dbg !148
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !149

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !150
  %9 = load i32, i32* %data, align 4, !dbg !152
  %idxprom5 = sext i32 %9 to i64, !dbg !150
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !150
  store i32 1, i32* %arrayidx6, align 4, !dbg !153
  store i32 0, i32* %i, align 4, !dbg !154
  br label %for.cond7, !dbg !156

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !157
  %cmp8 = icmp slt i32 %10, 10, !dbg !159
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !160

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !161
  %12 = load i32, i32* %i, align 4, !dbg !163
  %idxprom10 = sext i32 %12 to i64, !dbg !161
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !161
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !161
  call void @printIntLine(i32 noundef %13), !dbg !164
  br label %for.inc12, !dbg !165

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !166
  %inc13 = add nsw i32 %14, 1, !dbg !166
  store i32 %inc13, i32* %i, align 4, !dbg !166
  br label %for.cond7, !dbg !167, !llvm.loop !168

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !170

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !171
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !173
  %16 = bitcast i32* %15 to i8*, !dbg !173
  call void @free(i8* noundef %16), !dbg !174
  ret void, !dbg !175
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !176 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !177, metadata !DIExpression()), !dbg !178
  store i32 -1, i32* %data, align 4, !dbg !179
  store i32 10, i32* %data, align 4, !dbg !180
  call void @llvm.dbg.declare(metadata i32* %i, metadata !181, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !184, metadata !DIExpression()), !dbg !185
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !186
  %0 = bitcast i8* %call to i32*, !dbg !187
  store i32* %0, i32** %buffer, align 8, !dbg !185
  %1 = load i32*, i32** %buffer, align 8, !dbg !188
  %cmp = icmp eq i32* %1, null, !dbg !190
  br i1 %cmp, label %if.then, label %if.end, !dbg !191

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !192
  unreachable, !dbg !192

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !197
  %cmp1 = icmp slt i32 %2, 10, !dbg !199
  br i1 %cmp1, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !201
  %4 = load i32, i32* %i, align 4, !dbg !203
  %idxprom = sext i32 %4 to i64, !dbg !201
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !201
  store i32 0, i32* %arrayidx, align 4, !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !206
  %inc = add nsw i32 %5, 1, !dbg !206
  store i32 %inc, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !210
  %cmp2 = icmp sge i32 %6, 0, !dbg !212
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !213

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !214
  %cmp3 = icmp slt i32 %7, 10, !dbg !215
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !216

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !217
  %9 = load i32, i32* %data, align 4, !dbg !219
  %idxprom5 = sext i32 %9 to i64, !dbg !217
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !217
  store i32 1, i32* %arrayidx6, align 4, !dbg !220
  store i32 0, i32* %i, align 4, !dbg !221
  br label %for.cond7, !dbg !223

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !224
  %cmp8 = icmp slt i32 %10, 10, !dbg !226
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !227

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !228
  %12 = load i32, i32* %i, align 4, !dbg !230
  %idxprom10 = sext i32 %12 to i64, !dbg !228
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !228
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !228
  call void @printIntLine(i32 noundef %13), !dbg !231
  br label %for.inc12, !dbg !232

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !233
  %inc13 = add nsw i32 %14, 1, !dbg !233
  store i32 %inc13, i32* %i, align 4, !dbg !233
  br label %for.cond7, !dbg !234, !llvm.loop !235

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !237

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !238
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !240
  %16 = bitcast i32* %15 to i8*, !dbg !240
  call void @free(i8* noundef %16), !dbg !241
  ret void, !dbg !242
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !243 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !244, metadata !DIExpression()), !dbg !245
  store i32 -1, i32* %data, align 4, !dbg !246
  store i32 7, i32* %data, align 4, !dbg !247
  call void @llvm.dbg.declare(metadata i32* %i, metadata !248, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !251, metadata !DIExpression()), !dbg !252
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !253
  %0 = bitcast i8* %call to i32*, !dbg !254
  store i32* %0, i32** %buffer, align 8, !dbg !252
  %1 = load i32*, i32** %buffer, align 8, !dbg !255
  %cmp = icmp eq i32* %1, null, !dbg !257
  br i1 %cmp, label %if.then, label %if.end, !dbg !258

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !259
  unreachable, !dbg !259

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !261
  br label %for.cond, !dbg !263

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !264
  %cmp1 = icmp slt i32 %2, 10, !dbg !266
  br i1 %cmp1, label %for.body, label %for.end, !dbg !267

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !268
  %4 = load i32, i32* %i, align 4, !dbg !270
  %idxprom = sext i32 %4 to i64, !dbg !268
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !268
  store i32 0, i32* %arrayidx, align 4, !dbg !271
  br label %for.inc, !dbg !272

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !273
  %inc = add nsw i32 %5, 1, !dbg !273
  store i32 %inc, i32* %i, align 4, !dbg !273
  br label %for.cond, !dbg !274, !llvm.loop !275

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !277
  %cmp2 = icmp sge i32 %6, 0, !dbg !279
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !280

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !281
  %8 = load i32, i32* %data, align 4, !dbg !283
  %idxprom4 = sext i32 %8 to i64, !dbg !281
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !281
  store i32 1, i32* %arrayidx5, align 4, !dbg !284
  store i32 0, i32* %i, align 4, !dbg !285
  br label %for.cond6, !dbg !287

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !288
  %cmp7 = icmp slt i32 %9, 10, !dbg !290
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !291

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !292
  %11 = load i32, i32* %i, align 4, !dbg !294
  %idxprom9 = sext i32 %11 to i64, !dbg !292
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !292
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !292
  call void @printIntLine(i32 noundef %12), !dbg !295
  br label %for.inc11, !dbg !296

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !297
  %inc12 = add nsw i32 %13, 1, !dbg !297
  store i32 %inc12, i32* %i, align 4, !dbg !297
  br label %for.cond6, !dbg !298, !llvm.loop !299

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !301

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !302
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !304
  %15 = bitcast i32* %14 to i8*, !dbg !304
  call void @free(i8* noundef %15), !dbg !305
  ret void, !dbg !306
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !307 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !308, metadata !DIExpression()), !dbg !309
  store i32 -1, i32* %data, align 4, !dbg !310
  store i32 7, i32* %data, align 4, !dbg !311
  call void @llvm.dbg.declare(metadata i32* %i, metadata !312, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !315, metadata !DIExpression()), !dbg !316
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !317
  %0 = bitcast i8* %call to i32*, !dbg !318
  store i32* %0, i32** %buffer, align 8, !dbg !316
  %1 = load i32*, i32** %buffer, align 8, !dbg !319
  %cmp = icmp eq i32* %1, null, !dbg !321
  br i1 %cmp, label %if.then, label %if.end, !dbg !322

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !323
  unreachable, !dbg !323

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !325
  br label %for.cond, !dbg !327

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !328
  %cmp1 = icmp slt i32 %2, 10, !dbg !330
  br i1 %cmp1, label %for.body, label %for.end, !dbg !331

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !332
  %4 = load i32, i32* %i, align 4, !dbg !334
  %idxprom = sext i32 %4 to i64, !dbg !332
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !332
  store i32 0, i32* %arrayidx, align 4, !dbg !335
  br label %for.inc, !dbg !336

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !337
  %inc = add nsw i32 %5, 1, !dbg !337
  store i32 %inc, i32* %i, align 4, !dbg !337
  br label %for.cond, !dbg !338, !llvm.loop !339

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !341
  %cmp2 = icmp sge i32 %6, 0, !dbg !343
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !344

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !345
  %8 = load i32, i32* %data, align 4, !dbg !347
  %idxprom4 = sext i32 %8 to i64, !dbg !345
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !345
  store i32 1, i32* %arrayidx5, align 4, !dbg !348
  store i32 0, i32* %i, align 4, !dbg !349
  br label %for.cond6, !dbg !351

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !352
  %cmp7 = icmp slt i32 %9, 10, !dbg !354
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !355

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !356
  %11 = load i32, i32* %i, align 4, !dbg !358
  %idxprom9 = sext i32 %11 to i64, !dbg !356
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !356
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !356
  call void @printIntLine(i32 noundef %12), !dbg !359
  br label %for.inc11, !dbg !360

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !361
  %inc12 = add nsw i32 %13, 1, !dbg !361
  store i32 %inc12, i32* %i, align 4, !dbg !361
  br label %for.cond6, !dbg !362, !llvm.loop !363

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !365

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !366
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !368
  %15 = bitcast i32* %14 to i8*, !dbg !368
  call void @free(i8* noundef %15), !dbg !369
  ret void, !dbg !370
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 9, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 31, column: 14, scope: !14)
!23 = !DILocalVariable(name: "i", scope: !24, file: !15, line: 42, type: !4)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!25 = !DILocation(line: 42, column: 13, scope: !24)
!26 = !DILocalVariable(name: "buffer", scope: !24, file: !15, line: 43, type: !3)
!27 = !DILocation(line: 43, column: 15, scope: !24)
!28 = !DILocation(line: 43, column: 31, scope: !24)
!29 = !DILocation(line: 43, column: 24, scope: !24)
!30 = !DILocation(line: 44, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !15, line: 44, column: 13)
!32 = !DILocation(line: 44, column: 20, scope: !31)
!33 = !DILocation(line: 44, column: 13, scope: !24)
!34 = !DILocation(line: 44, column: 30, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 44, column: 29)
!36 = !DILocation(line: 46, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !24, file: !15, line: 46, column: 9)
!38 = !DILocation(line: 46, column: 14, scope: !37)
!39 = !DILocation(line: 46, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !15, line: 46, column: 9)
!41 = !DILocation(line: 46, column: 23, scope: !40)
!42 = !DILocation(line: 46, column: 9, scope: !37)
!43 = !DILocation(line: 48, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 47, column: 9)
!45 = !DILocation(line: 48, column: 20, scope: !44)
!46 = !DILocation(line: 48, column: 23, scope: !44)
!47 = !DILocation(line: 49, column: 9, scope: !44)
!48 = !DILocation(line: 46, column: 30, scope: !40)
!49 = !DILocation(line: 46, column: 9, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 49, column: 9, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 52, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !24, file: !15, line: 52, column: 13)
!55 = !DILocation(line: 52, column: 18, scope: !54)
!56 = !DILocation(line: 52, column: 13, scope: !24)
!57 = !DILocation(line: 54, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 53, column: 9)
!59 = !DILocation(line: 54, column: 20, scope: !58)
!60 = !DILocation(line: 54, column: 26, scope: !58)
!61 = !DILocation(line: 56, column: 19, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 56, column: 13)
!63 = !DILocation(line: 56, column: 17, scope: !62)
!64 = !DILocation(line: 56, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !15, line: 56, column: 13)
!66 = !DILocation(line: 56, column: 26, scope: !65)
!67 = !DILocation(line: 56, column: 13, scope: !62)
!68 = !DILocation(line: 58, column: 30, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 57, column: 13)
!70 = !DILocation(line: 58, column: 37, scope: !69)
!71 = !DILocation(line: 58, column: 17, scope: !69)
!72 = !DILocation(line: 59, column: 13, scope: !69)
!73 = !DILocation(line: 56, column: 33, scope: !65)
!74 = !DILocation(line: 56, column: 13, scope: !65)
!75 = distinct !{!75, !67, !76, !52}
!76 = !DILocation(line: 59, column: 13, scope: !62)
!77 = !DILocation(line: 60, column: 9, scope: !58)
!78 = !DILocation(line: 63, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !54, file: !15, line: 62, column: 9)
!80 = !DILocation(line: 65, column: 14, scope: !24)
!81 = !DILocation(line: 65, column: 9, scope: !24)
!82 = !DILocation(line: 73, column: 1, scope: !14)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_15_good", scope: !15, file: !15, line: 295, type: !16, scopeLine: 296, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!84 = !DILocation(line: 297, column: 5, scope: !83)
!85 = !DILocation(line: 298, column: 5, scope: !83)
!86 = !DILocation(line: 299, column: 5, scope: !83)
!87 = !DILocation(line: 300, column: 5, scope: !83)
!88 = !DILocation(line: 301, column: 1, scope: !83)
!89 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 312, type: !90, scopeLine: 313, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!90 = !DISubroutineType(types: !91)
!91 = !{!4, !4, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !15, line: 312, type: !4)
!96 = !DILocation(line: 312, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !15, line: 312, type: !92)
!98 = !DILocation(line: 312, column: 27, scope: !89)
!99 = !DILocation(line: 315, column: 22, scope: !89)
!100 = !DILocation(line: 315, column: 12, scope: !89)
!101 = !DILocation(line: 315, column: 5, scope: !89)
!102 = !DILocation(line: 317, column: 5, scope: !89)
!103 = !DILocation(line: 318, column: 5, scope: !89)
!104 = !DILocation(line: 319, column: 5, scope: !89)
!105 = !DILocation(line: 322, column: 5, scope: !89)
!106 = !DILocation(line: 323, column: 5, scope: !89)
!107 = !DILocation(line: 324, column: 5, scope: !89)
!108 = !DILocation(line: 326, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!110 = !DILocalVariable(name: "data", scope: !109, file: !15, line: 82, type: !4)
!111 = !DILocation(line: 82, column: 9, scope: !109)
!112 = !DILocation(line: 84, column: 10, scope: !109)
!113 = !DILocation(line: 89, column: 14, scope: !109)
!114 = !DILocalVariable(name: "i", scope: !115, file: !15, line: 104, type: !4)
!115 = distinct !DILexicalBlock(scope: !109, file: !15, line: 103, column: 5)
!116 = !DILocation(line: 104, column: 13, scope: !115)
!117 = !DILocalVariable(name: "buffer", scope: !115, file: !15, line: 105, type: !3)
!118 = !DILocation(line: 105, column: 15, scope: !115)
!119 = !DILocation(line: 105, column: 31, scope: !115)
!120 = !DILocation(line: 105, column: 24, scope: !115)
!121 = !DILocation(line: 106, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !115, file: !15, line: 106, column: 13)
!123 = !DILocation(line: 106, column: 20, scope: !122)
!124 = !DILocation(line: 106, column: 13, scope: !115)
!125 = !DILocation(line: 106, column: 30, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 106, column: 29)
!127 = !DILocation(line: 108, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !115, file: !15, line: 108, column: 9)
!129 = !DILocation(line: 108, column: 14, scope: !128)
!130 = !DILocation(line: 108, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !15, line: 108, column: 9)
!132 = !DILocation(line: 108, column: 23, scope: !131)
!133 = !DILocation(line: 108, column: 9, scope: !128)
!134 = !DILocation(line: 110, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 109, column: 9)
!136 = !DILocation(line: 110, column: 20, scope: !135)
!137 = !DILocation(line: 110, column: 23, scope: !135)
!138 = !DILocation(line: 111, column: 9, scope: !135)
!139 = !DILocation(line: 108, column: 30, scope: !131)
!140 = !DILocation(line: 108, column: 9, scope: !131)
!141 = distinct !{!141, !133, !142, !52}
!142 = !DILocation(line: 111, column: 9, scope: !128)
!143 = !DILocation(line: 113, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !115, file: !15, line: 113, column: 13)
!145 = !DILocation(line: 113, column: 18, scope: !144)
!146 = !DILocation(line: 113, column: 23, scope: !144)
!147 = !DILocation(line: 113, column: 26, scope: !144)
!148 = !DILocation(line: 113, column: 31, scope: !144)
!149 = !DILocation(line: 113, column: 13, scope: !115)
!150 = !DILocation(line: 115, column: 13, scope: !151)
!151 = distinct !DILexicalBlock(scope: !144, file: !15, line: 114, column: 9)
!152 = !DILocation(line: 115, column: 20, scope: !151)
!153 = !DILocation(line: 115, column: 26, scope: !151)
!154 = !DILocation(line: 117, column: 19, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !15, line: 117, column: 13)
!156 = !DILocation(line: 117, column: 17, scope: !155)
!157 = !DILocation(line: 117, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !15, line: 117, column: 13)
!159 = !DILocation(line: 117, column: 26, scope: !158)
!160 = !DILocation(line: 117, column: 13, scope: !155)
!161 = !DILocation(line: 119, column: 30, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !15, line: 118, column: 13)
!163 = !DILocation(line: 119, column: 37, scope: !162)
!164 = !DILocation(line: 119, column: 17, scope: !162)
!165 = !DILocation(line: 120, column: 13, scope: !162)
!166 = !DILocation(line: 117, column: 33, scope: !158)
!167 = !DILocation(line: 117, column: 13, scope: !158)
!168 = distinct !{!168, !160, !169, !52}
!169 = !DILocation(line: 120, column: 13, scope: !155)
!170 = !DILocation(line: 121, column: 9, scope: !151)
!171 = !DILocation(line: 124, column: 13, scope: !172)
!172 = distinct !DILexicalBlock(scope: !144, file: !15, line: 123, column: 9)
!173 = !DILocation(line: 126, column: 14, scope: !115)
!174 = !DILocation(line: 126, column: 9, scope: !115)
!175 = !DILocation(line: 130, column: 1, scope: !109)
!176 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 133, type: !16, scopeLine: 134, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!177 = !DILocalVariable(name: "data", scope: !176, file: !15, line: 135, type: !4)
!178 = !DILocation(line: 135, column: 9, scope: !176)
!179 = !DILocation(line: 137, column: 10, scope: !176)
!180 = !DILocation(line: 142, column: 14, scope: !176)
!181 = !DILocalVariable(name: "i", scope: !182, file: !15, line: 153, type: !4)
!182 = distinct !DILexicalBlock(scope: !176, file: !15, line: 152, column: 5)
!183 = !DILocation(line: 153, column: 13, scope: !182)
!184 = !DILocalVariable(name: "buffer", scope: !182, file: !15, line: 154, type: !3)
!185 = !DILocation(line: 154, column: 15, scope: !182)
!186 = !DILocation(line: 154, column: 31, scope: !182)
!187 = !DILocation(line: 154, column: 24, scope: !182)
!188 = !DILocation(line: 155, column: 13, scope: !189)
!189 = distinct !DILexicalBlock(scope: !182, file: !15, line: 155, column: 13)
!190 = !DILocation(line: 155, column: 20, scope: !189)
!191 = !DILocation(line: 155, column: 13, scope: !182)
!192 = !DILocation(line: 155, column: 30, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !15, line: 155, column: 29)
!194 = !DILocation(line: 157, column: 16, scope: !195)
!195 = distinct !DILexicalBlock(scope: !182, file: !15, line: 157, column: 9)
!196 = !DILocation(line: 157, column: 14, scope: !195)
!197 = !DILocation(line: 157, column: 21, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !15, line: 157, column: 9)
!199 = !DILocation(line: 157, column: 23, scope: !198)
!200 = !DILocation(line: 157, column: 9, scope: !195)
!201 = !DILocation(line: 159, column: 13, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !15, line: 158, column: 9)
!203 = !DILocation(line: 159, column: 20, scope: !202)
!204 = !DILocation(line: 159, column: 23, scope: !202)
!205 = !DILocation(line: 160, column: 9, scope: !202)
!206 = !DILocation(line: 157, column: 30, scope: !198)
!207 = !DILocation(line: 157, column: 9, scope: !198)
!208 = distinct !{!208, !200, !209, !52}
!209 = !DILocation(line: 160, column: 9, scope: !195)
!210 = !DILocation(line: 162, column: 13, scope: !211)
!211 = distinct !DILexicalBlock(scope: !182, file: !15, line: 162, column: 13)
!212 = !DILocation(line: 162, column: 18, scope: !211)
!213 = !DILocation(line: 162, column: 23, scope: !211)
!214 = !DILocation(line: 162, column: 26, scope: !211)
!215 = !DILocation(line: 162, column: 31, scope: !211)
!216 = !DILocation(line: 162, column: 13, scope: !182)
!217 = !DILocation(line: 164, column: 13, scope: !218)
!218 = distinct !DILexicalBlock(scope: !211, file: !15, line: 163, column: 9)
!219 = !DILocation(line: 164, column: 20, scope: !218)
!220 = !DILocation(line: 164, column: 26, scope: !218)
!221 = !DILocation(line: 166, column: 19, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !15, line: 166, column: 13)
!223 = !DILocation(line: 166, column: 17, scope: !222)
!224 = !DILocation(line: 166, column: 24, scope: !225)
!225 = distinct !DILexicalBlock(scope: !222, file: !15, line: 166, column: 13)
!226 = !DILocation(line: 166, column: 26, scope: !225)
!227 = !DILocation(line: 166, column: 13, scope: !222)
!228 = !DILocation(line: 168, column: 30, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !15, line: 167, column: 13)
!230 = !DILocation(line: 168, column: 37, scope: !229)
!231 = !DILocation(line: 168, column: 17, scope: !229)
!232 = !DILocation(line: 169, column: 13, scope: !229)
!233 = !DILocation(line: 166, column: 33, scope: !225)
!234 = !DILocation(line: 166, column: 13, scope: !225)
!235 = distinct !{!235, !227, !236, !52}
!236 = !DILocation(line: 169, column: 13, scope: !222)
!237 = !DILocation(line: 170, column: 9, scope: !218)
!238 = !DILocation(line: 173, column: 13, scope: !239)
!239 = distinct !DILexicalBlock(scope: !211, file: !15, line: 172, column: 9)
!240 = !DILocation(line: 175, column: 14, scope: !182)
!241 = !DILocation(line: 175, column: 9, scope: !182)
!242 = !DILocation(line: 183, column: 1, scope: !176)
!243 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 186, type: !16, scopeLine: 187, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!244 = !DILocalVariable(name: "data", scope: !243, file: !15, line: 188, type: !4)
!245 = !DILocation(line: 188, column: 9, scope: !243)
!246 = !DILocation(line: 190, column: 10, scope: !243)
!247 = !DILocation(line: 200, column: 14, scope: !243)
!248 = !DILocalVariable(name: "i", scope: !249, file: !15, line: 207, type: !4)
!249 = distinct !DILexicalBlock(scope: !243, file: !15, line: 206, column: 5)
!250 = !DILocation(line: 207, column: 13, scope: !249)
!251 = !DILocalVariable(name: "buffer", scope: !249, file: !15, line: 208, type: !3)
!252 = !DILocation(line: 208, column: 15, scope: !249)
!253 = !DILocation(line: 208, column: 31, scope: !249)
!254 = !DILocation(line: 208, column: 24, scope: !249)
!255 = !DILocation(line: 209, column: 13, scope: !256)
!256 = distinct !DILexicalBlock(scope: !249, file: !15, line: 209, column: 13)
!257 = !DILocation(line: 209, column: 20, scope: !256)
!258 = !DILocation(line: 209, column: 13, scope: !249)
!259 = !DILocation(line: 209, column: 30, scope: !260)
!260 = distinct !DILexicalBlock(scope: !256, file: !15, line: 209, column: 29)
!261 = !DILocation(line: 211, column: 16, scope: !262)
!262 = distinct !DILexicalBlock(scope: !249, file: !15, line: 211, column: 9)
!263 = !DILocation(line: 211, column: 14, scope: !262)
!264 = !DILocation(line: 211, column: 21, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !15, line: 211, column: 9)
!266 = !DILocation(line: 211, column: 23, scope: !265)
!267 = !DILocation(line: 211, column: 9, scope: !262)
!268 = !DILocation(line: 213, column: 13, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !15, line: 212, column: 9)
!270 = !DILocation(line: 213, column: 20, scope: !269)
!271 = !DILocation(line: 213, column: 23, scope: !269)
!272 = !DILocation(line: 214, column: 9, scope: !269)
!273 = !DILocation(line: 211, column: 30, scope: !265)
!274 = !DILocation(line: 211, column: 9, scope: !265)
!275 = distinct !{!275, !267, !276, !52}
!276 = !DILocation(line: 214, column: 9, scope: !262)
!277 = !DILocation(line: 217, column: 13, scope: !278)
!278 = distinct !DILexicalBlock(scope: !249, file: !15, line: 217, column: 13)
!279 = !DILocation(line: 217, column: 18, scope: !278)
!280 = !DILocation(line: 217, column: 13, scope: !249)
!281 = !DILocation(line: 219, column: 13, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !15, line: 218, column: 9)
!283 = !DILocation(line: 219, column: 20, scope: !282)
!284 = !DILocation(line: 219, column: 26, scope: !282)
!285 = !DILocation(line: 221, column: 19, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !15, line: 221, column: 13)
!287 = !DILocation(line: 221, column: 17, scope: !286)
!288 = !DILocation(line: 221, column: 24, scope: !289)
!289 = distinct !DILexicalBlock(scope: !286, file: !15, line: 221, column: 13)
!290 = !DILocation(line: 221, column: 26, scope: !289)
!291 = !DILocation(line: 221, column: 13, scope: !286)
!292 = !DILocation(line: 223, column: 30, scope: !293)
!293 = distinct !DILexicalBlock(scope: !289, file: !15, line: 222, column: 13)
!294 = !DILocation(line: 223, column: 37, scope: !293)
!295 = !DILocation(line: 223, column: 17, scope: !293)
!296 = !DILocation(line: 224, column: 13, scope: !293)
!297 = !DILocation(line: 221, column: 33, scope: !289)
!298 = !DILocation(line: 221, column: 13, scope: !289)
!299 = distinct !{!299, !291, !300, !52}
!300 = !DILocation(line: 224, column: 13, scope: !286)
!301 = !DILocation(line: 225, column: 9, scope: !282)
!302 = !DILocation(line: 228, column: 13, scope: !303)
!303 = distinct !DILexicalBlock(scope: !278, file: !15, line: 227, column: 9)
!304 = !DILocation(line: 230, column: 14, scope: !249)
!305 = !DILocation(line: 230, column: 9, scope: !249)
!306 = !DILocation(line: 238, column: 1, scope: !243)
!307 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 241, type: !16, scopeLine: 242, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!308 = !DILocalVariable(name: "data", scope: !307, file: !15, line: 243, type: !4)
!309 = !DILocation(line: 243, column: 9, scope: !307)
!310 = !DILocation(line: 245, column: 10, scope: !307)
!311 = !DILocation(line: 251, column: 14, scope: !307)
!312 = !DILocalVariable(name: "i", scope: !313, file: !15, line: 262, type: !4)
!313 = distinct !DILexicalBlock(scope: !307, file: !15, line: 261, column: 5)
!314 = !DILocation(line: 262, column: 13, scope: !313)
!315 = !DILocalVariable(name: "buffer", scope: !313, file: !15, line: 263, type: !3)
!316 = !DILocation(line: 263, column: 15, scope: !313)
!317 = !DILocation(line: 263, column: 31, scope: !313)
!318 = !DILocation(line: 263, column: 24, scope: !313)
!319 = !DILocation(line: 264, column: 13, scope: !320)
!320 = distinct !DILexicalBlock(scope: !313, file: !15, line: 264, column: 13)
!321 = !DILocation(line: 264, column: 20, scope: !320)
!322 = !DILocation(line: 264, column: 13, scope: !313)
!323 = !DILocation(line: 264, column: 30, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !15, line: 264, column: 29)
!325 = !DILocation(line: 266, column: 16, scope: !326)
!326 = distinct !DILexicalBlock(scope: !313, file: !15, line: 266, column: 9)
!327 = !DILocation(line: 266, column: 14, scope: !326)
!328 = !DILocation(line: 266, column: 21, scope: !329)
!329 = distinct !DILexicalBlock(scope: !326, file: !15, line: 266, column: 9)
!330 = !DILocation(line: 266, column: 23, scope: !329)
!331 = !DILocation(line: 266, column: 9, scope: !326)
!332 = !DILocation(line: 268, column: 13, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !15, line: 267, column: 9)
!334 = !DILocation(line: 268, column: 20, scope: !333)
!335 = !DILocation(line: 268, column: 23, scope: !333)
!336 = !DILocation(line: 269, column: 9, scope: !333)
!337 = !DILocation(line: 266, column: 30, scope: !329)
!338 = !DILocation(line: 266, column: 9, scope: !329)
!339 = distinct !{!339, !331, !340, !52}
!340 = !DILocation(line: 269, column: 9, scope: !326)
!341 = !DILocation(line: 272, column: 13, scope: !342)
!342 = distinct !DILexicalBlock(scope: !313, file: !15, line: 272, column: 13)
!343 = !DILocation(line: 272, column: 18, scope: !342)
!344 = !DILocation(line: 272, column: 13, scope: !313)
!345 = !DILocation(line: 274, column: 13, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !15, line: 273, column: 9)
!347 = !DILocation(line: 274, column: 20, scope: !346)
!348 = !DILocation(line: 274, column: 26, scope: !346)
!349 = !DILocation(line: 276, column: 19, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !15, line: 276, column: 13)
!351 = !DILocation(line: 276, column: 17, scope: !350)
!352 = !DILocation(line: 276, column: 24, scope: !353)
!353 = distinct !DILexicalBlock(scope: !350, file: !15, line: 276, column: 13)
!354 = !DILocation(line: 276, column: 26, scope: !353)
!355 = !DILocation(line: 276, column: 13, scope: !350)
!356 = !DILocation(line: 278, column: 30, scope: !357)
!357 = distinct !DILexicalBlock(scope: !353, file: !15, line: 277, column: 13)
!358 = !DILocation(line: 278, column: 37, scope: !357)
!359 = !DILocation(line: 278, column: 17, scope: !357)
!360 = !DILocation(line: 279, column: 13, scope: !357)
!361 = !DILocation(line: 276, column: 33, scope: !353)
!362 = !DILocation(line: 276, column: 13, scope: !353)
!363 = distinct !{!363, !355, !364, !52}
!364 = !DILocation(line: 279, column: 13, scope: !350)
!365 = !DILocation(line: 280, column: 9, scope: !346)
!366 = !DILocation(line: 283, column: 13, scope: !367)
!367 = distinct !DILexicalBlock(scope: !342, file: !15, line: 282, column: 9)
!368 = !DILocation(line: 285, column: 14, scope: !313)
!369 = !DILocation(line: 285, column: 9, scope: !313)
!370 = !DILocation(line: 293, column: 1, scope: !307)
