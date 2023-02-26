; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_08-1.c"
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
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_08_bad() #0 !dbg !14 {
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
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !25
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !27
  br label %if.end, !dbg !28

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsTrue(), !dbg !29
  %tobool3 = icmp ne i32 %call2, 0, !dbg !29
  br i1 %tobool3, label %if.then4, label %if.end22, !dbg !31

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !36, metadata !DIExpression()), !dbg !37
  %call5 = call i8* @malloc(i64 noundef 40) #5, !dbg !38
  %1 = bitcast i8* %call5 to i32*, !dbg !39
  store i32* %1, i32** %buffer, align 8, !dbg !37
  %2 = load i32*, i32** %buffer, align 8, !dbg !40
  %cmp = icmp eq i32* %2, null, !dbg !42
  br i1 %cmp, label %if.then6, label %if.end7, !dbg !43

if.then6:                                         ; preds = %if.then4
  call void @exit(i32 noundef -1) #6, !dbg !44
  unreachable, !dbg !44

if.end7:                                          ; preds = %if.then4
  store i32 0, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end7
  %3 = load i32, i32* %i, align 4, !dbg !49
  %cmp8 = icmp slt i32 %3, 10, !dbg !51
  br i1 %cmp8, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !53
  %5 = load i32, i32* %i, align 4, !dbg !55
  %idxprom = sext i32 %5 to i64, !dbg !53
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !58
  %inc = add nsw i32 %6, 1, !dbg !58
  store i32 %inc, i32* %i, align 4, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !63
  %cmp9 = icmp sge i32 %7, 0, !dbg !65
  br i1 %cmp9, label %if.then10, label %if.else, !dbg !66

if.then10:                                        ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !67
  %9 = load i32, i32* %data, align 4, !dbg !69
  %idxprom11 = sext i32 %9 to i64, !dbg !67
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %idxprom11, !dbg !67
  store i32 1, i32* %arrayidx12, align 4, !dbg !70
  store i32 0, i32* %i, align 4, !dbg !71
  br label %for.cond13, !dbg !73

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %10 = load i32, i32* %i, align 4, !dbg !74
  %cmp14 = icmp slt i32 %10, 10, !dbg !76
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !77

for.body15:                                       ; preds = %for.cond13
  %11 = load i32*, i32** %buffer, align 8, !dbg !78
  %12 = load i32, i32* %i, align 4, !dbg !80
  %idxprom16 = sext i32 %12 to i64, !dbg !78
  %arrayidx17 = getelementptr inbounds i32, i32* %11, i64 %idxprom16, !dbg !78
  %13 = load i32, i32* %arrayidx17, align 4, !dbg !78
  call void @printIntLine(i32 noundef %13), !dbg !81
  br label %for.inc18, !dbg !82

for.inc18:                                        ; preds = %for.body15
  %14 = load i32, i32* %i, align 4, !dbg !83
  %inc19 = add nsw i32 %14, 1, !dbg !83
  store i32 %inc19, i32* %i, align 4, !dbg !83
  br label %for.cond13, !dbg !84, !llvm.loop !85

for.end20:                                        ; preds = %for.cond13
  br label %if.end21, !dbg !87

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  br label %if.end21

if.end21:                                         ; preds = %if.else, %for.end20
  %15 = load i32*, i32** %buffer, align 8, !dbg !90
  %16 = bitcast i32* %15 to i8*, !dbg !90
  call void @free(i8* noundef %16), !dbg !91
  br label %if.end22, !dbg !92

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !93
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_08_good() #0 !dbg !94 {
entry:
  call void @goodB2G1(), !dbg !95
  call void @goodB2G2(), !dbg !96
  call void @goodG2B1(), !dbg !97
  call void @goodG2B2(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i64 @time(i64* noundef null), !dbg !110
  %conv = trunc i64 %call to i32, !dbg !111
  call void @srand(i32 noundef %conv), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_08_good(), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_08_bad(), !dbg !117
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !120 {
entry:
  ret i32 1, !dbg !123
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !124 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 -1, i32* %data, align 4, !dbg !127
  %call = call i32 @staticReturnsTrue(), !dbg !128
  %tobool = icmp ne i32 %call, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !131
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !133
  br label %if.end, !dbg !134

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsFalse(), !dbg !135
  %tobool3 = icmp ne i32 %call2, 0, !dbg !135
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !137

if.then4:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !138
  br label %if.end24, !dbg !140

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !141, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !145, metadata !DIExpression()), !dbg !146
  %call5 = call i8* @malloc(i64 noundef 40) #5, !dbg !147
  %1 = bitcast i8* %call5 to i32*, !dbg !148
  store i32* %1, i32** %buffer, align 8, !dbg !146
  %2 = load i32*, i32** %buffer, align 8, !dbg !149
  %cmp = icmp eq i32* %2, null, !dbg !151
  br i1 %cmp, label %if.then6, label %if.end7, !dbg !152

if.then6:                                         ; preds = %if.else
  call void @exit(i32 noundef -1) #6, !dbg !153
  unreachable, !dbg !153

if.end7:                                          ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %if.end7
  %3 = load i32, i32* %i, align 4, !dbg !158
  %cmp8 = icmp slt i32 %3, 10, !dbg !160
  br i1 %cmp8, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !162
  %5 = load i32, i32* %i, align 4, !dbg !164
  %idxprom = sext i32 %5 to i64, !dbg !162
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !167
  %inc = add nsw i32 %6, 1, !dbg !167
  store i32 %inc, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !171
  %cmp9 = icmp sge i32 %7, 0, !dbg !173
  br i1 %cmp9, label %land.lhs.true, label %if.else22, !dbg !174

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !175
  %cmp10 = icmp slt i32 %8, 10, !dbg !176
  br i1 %cmp10, label %if.then11, label %if.else22, !dbg !177

if.then11:                                        ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !178
  %10 = load i32, i32* %data, align 4, !dbg !180
  %idxprom12 = sext i32 %10 to i64, !dbg !178
  %arrayidx13 = getelementptr inbounds i32, i32* %9, i64 %idxprom12, !dbg !178
  store i32 1, i32* %arrayidx13, align 4, !dbg !181
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond14, !dbg !184

for.cond14:                                       ; preds = %for.inc19, %if.then11
  %11 = load i32, i32* %i, align 4, !dbg !185
  %cmp15 = icmp slt i32 %11, 10, !dbg !187
  br i1 %cmp15, label %for.body16, label %for.end21, !dbg !188

for.body16:                                       ; preds = %for.cond14
  %12 = load i32*, i32** %buffer, align 8, !dbg !189
  %13 = load i32, i32* %i, align 4, !dbg !191
  %idxprom17 = sext i32 %13 to i64, !dbg !189
  %arrayidx18 = getelementptr inbounds i32, i32* %12, i64 %idxprom17, !dbg !189
  %14 = load i32, i32* %arrayidx18, align 4, !dbg !189
  call void @printIntLine(i32 noundef %14), !dbg !192
  br label %for.inc19, !dbg !193

for.inc19:                                        ; preds = %for.body16
  %15 = load i32, i32* %i, align 4, !dbg !194
  %inc20 = add nsw i32 %15, 1, !dbg !194
  store i32 %inc20, i32* %i, align 4, !dbg !194
  br label %for.cond14, !dbg !195, !llvm.loop !196

for.end21:                                        ; preds = %for.cond14
  br label %if.end23, !dbg !198

if.else22:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !199
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %for.end21
  %16 = load i32*, i32** %buffer, align 8, !dbg !201
  %17 = bitcast i32* %16 to i8*, !dbg !201
  call void @free(i8* noundef %17), !dbg !202
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then4
  ret void, !dbg !203
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !204 {
entry:
  ret i32 0, !dbg !205
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !206 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 -1, i32* %data, align 4, !dbg !209
  %call = call i32 @staticReturnsTrue(), !dbg !210
  %tobool = icmp ne i32 %call, 0, !dbg !210
  br i1 %tobool, label %if.then, label %if.end, !dbg !212

if.then:                                          ; preds = %entry
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !213
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !215
  br label %if.end, !dbg !216

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @staticReturnsTrue(), !dbg !217
  %tobool3 = icmp ne i32 %call2, 0, !dbg !217
  br i1 %tobool3, label %if.then4, label %if.end23, !dbg !219

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !220, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !224, metadata !DIExpression()), !dbg !225
  %call5 = call i8* @malloc(i64 noundef 40) #5, !dbg !226
  %1 = bitcast i8* %call5 to i32*, !dbg !227
  store i32* %1, i32** %buffer, align 8, !dbg !225
  %2 = load i32*, i32** %buffer, align 8, !dbg !228
  %cmp = icmp eq i32* %2, null, !dbg !230
  br i1 %cmp, label %if.then6, label %if.end7, !dbg !231

if.then6:                                         ; preds = %if.then4
  call void @exit(i32 noundef -1) #6, !dbg !232
  unreachable, !dbg !232

if.end7:                                          ; preds = %if.then4
  store i32 0, i32* %i, align 4, !dbg !234
  br label %for.cond, !dbg !236

for.cond:                                         ; preds = %for.inc, %if.end7
  %3 = load i32, i32* %i, align 4, !dbg !237
  %cmp8 = icmp slt i32 %3, 10, !dbg !239
  br i1 %cmp8, label %for.body, label %for.end, !dbg !240

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !241
  %5 = load i32, i32* %i, align 4, !dbg !243
  %idxprom = sext i32 %5 to i64, !dbg !241
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !241
  store i32 0, i32* %arrayidx, align 4, !dbg !244
  br label %for.inc, !dbg !245

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !246
  %inc = add nsw i32 %6, 1, !dbg !246
  store i32 %inc, i32* %i, align 4, !dbg !246
  br label %for.cond, !dbg !247, !llvm.loop !248

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !250
  %cmp9 = icmp sge i32 %7, 0, !dbg !252
  br i1 %cmp9, label %land.lhs.true, label %if.else, !dbg !253

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !254
  %cmp10 = icmp slt i32 %8, 10, !dbg !255
  br i1 %cmp10, label %if.then11, label %if.else, !dbg !256

if.then11:                                        ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !257
  %10 = load i32, i32* %data, align 4, !dbg !259
  %idxprom12 = sext i32 %10 to i64, !dbg !257
  %arrayidx13 = getelementptr inbounds i32, i32* %9, i64 %idxprom12, !dbg !257
  store i32 1, i32* %arrayidx13, align 4, !dbg !260
  store i32 0, i32* %i, align 4, !dbg !261
  br label %for.cond14, !dbg !263

for.cond14:                                       ; preds = %for.inc19, %if.then11
  %11 = load i32, i32* %i, align 4, !dbg !264
  %cmp15 = icmp slt i32 %11, 10, !dbg !266
  br i1 %cmp15, label %for.body16, label %for.end21, !dbg !267

for.body16:                                       ; preds = %for.cond14
  %12 = load i32*, i32** %buffer, align 8, !dbg !268
  %13 = load i32, i32* %i, align 4, !dbg !270
  %idxprom17 = sext i32 %13 to i64, !dbg !268
  %arrayidx18 = getelementptr inbounds i32, i32* %12, i64 %idxprom17, !dbg !268
  %14 = load i32, i32* %arrayidx18, align 4, !dbg !268
  call void @printIntLine(i32 noundef %14), !dbg !271
  br label %for.inc19, !dbg !272

for.inc19:                                        ; preds = %for.body16
  %15 = load i32, i32* %i, align 4, !dbg !273
  %inc20 = add nsw i32 %15, 1, !dbg !273
  store i32 %inc20, i32* %i, align 4, !dbg !273
  br label %for.cond14, !dbg !274, !llvm.loop !275

for.end21:                                        ; preds = %for.cond14
  br label %if.end22, !dbg !277

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !278
  br label %if.end22

if.end22:                                         ; preds = %if.else, %for.end21
  %16 = load i32*, i32** %buffer, align 8, !dbg !280
  %17 = bitcast i32* %16 to i8*, !dbg !280
  call void @free(i8* noundef %17), !dbg !281
  br label %if.end23, !dbg !282

if.end23:                                         ; preds = %if.end22, %if.end
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
  %call = call i32 @staticReturnsFalse(), !dbg !288
  %tobool = icmp ne i32 %call, 0, !dbg !288
  br i1 %tobool, label %if.then, label %if.else, !dbg !290

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !291
  br label %if.end, !dbg !293

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !294
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !296
  %tobool2 = icmp ne i32 %call1, 0, !dbg !296
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !298

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !299, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !303, metadata !DIExpression()), !dbg !304
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !305
  %0 = bitcast i8* %call4 to i32*, !dbg !306
  store i32* %0, i32** %buffer, align 8, !dbg !304
  %1 = load i32*, i32** %buffer, align 8, !dbg !307
  %cmp = icmp eq i32* %1, null, !dbg !309
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !310

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !311
  unreachable, !dbg !311

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !313
  br label %for.cond, !dbg !315

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !316
  %cmp7 = icmp slt i32 %2, 10, !dbg !318
  br i1 %cmp7, label %for.body, label %for.end, !dbg !319

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !320
  %4 = load i32, i32* %i, align 4, !dbg !322
  %idxprom = sext i32 %4 to i64, !dbg !320
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !320
  store i32 0, i32* %arrayidx, align 4, !dbg !323
  br label %for.inc, !dbg !324

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !325
  %inc = add nsw i32 %5, 1, !dbg !325
  store i32 %inc, i32* %i, align 4, !dbg !325
  br label %for.cond, !dbg !326, !llvm.loop !327

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !329
  %cmp8 = icmp sge i32 %6, 0, !dbg !331
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !332

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !333
  %8 = load i32, i32* %data, align 4, !dbg !335
  %idxprom10 = sext i32 %8 to i64, !dbg !333
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !333
  store i32 1, i32* %arrayidx11, align 4, !dbg !336
  store i32 0, i32* %i, align 4, !dbg !337
  br label %for.cond12, !dbg !339

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !340
  %cmp13 = icmp slt i32 %9, 10, !dbg !342
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !343

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !344
  %11 = load i32, i32* %i, align 4, !dbg !346
  %idxprom15 = sext i32 %11 to i64, !dbg !344
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !344
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !344
  call void @printIntLine(i32 noundef %12), !dbg !347
  br label %for.inc17, !dbg !348

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !349
  %inc18 = add nsw i32 %13, 1, !dbg !349
  store i32 %inc18, i32* %i, align 4, !dbg !349
  br label %for.cond12, !dbg !350, !llvm.loop !351

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !353

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !354
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !356
  %15 = bitcast i32* %14 to i8*, !dbg !356
  call void @free(i8* noundef %15), !dbg !357
  br label %if.end22, !dbg !358

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !359
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !360 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !361, metadata !DIExpression()), !dbg !362
  store i32 -1, i32* %data, align 4, !dbg !363
  %call = call i32 @staticReturnsTrue(), !dbg !364
  %tobool = icmp ne i32 %call, 0, !dbg !364
  br i1 %tobool, label %if.then, label %if.end, !dbg !366

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !367
  br label %if.end, !dbg !369

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !370
  %tobool2 = icmp ne i32 %call1, 0, !dbg !370
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !372

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !373, metadata !DIExpression()), !dbg !376
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !377, metadata !DIExpression()), !dbg !378
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !379
  %0 = bitcast i8* %call4 to i32*, !dbg !380
  store i32* %0, i32** %buffer, align 8, !dbg !378
  %1 = load i32*, i32** %buffer, align 8, !dbg !381
  %cmp = icmp eq i32* %1, null, !dbg !383
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !384

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !385
  unreachable, !dbg !385

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !387
  br label %for.cond, !dbg !389

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !390
  %cmp7 = icmp slt i32 %2, 10, !dbg !392
  br i1 %cmp7, label %for.body, label %for.end, !dbg !393

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !394
  %4 = load i32, i32* %i, align 4, !dbg !396
  %idxprom = sext i32 %4 to i64, !dbg !394
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !394
  store i32 0, i32* %arrayidx, align 4, !dbg !397
  br label %for.inc, !dbg !398

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !399
  %inc = add nsw i32 %5, 1, !dbg !399
  store i32 %inc, i32* %i, align 4, !dbg !399
  br label %for.cond, !dbg !400, !llvm.loop !401

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !403
  %cmp8 = icmp sge i32 %6, 0, !dbg !405
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !406

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !407
  %8 = load i32, i32* %data, align 4, !dbg !409
  %idxprom10 = sext i32 %8 to i64, !dbg !407
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !407
  store i32 1, i32* %arrayidx11, align 4, !dbg !410
  store i32 0, i32* %i, align 4, !dbg !411
  br label %for.cond12, !dbg !413

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !414
  %cmp13 = icmp slt i32 %9, 10, !dbg !416
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !417

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !418
  %11 = load i32, i32* %i, align 4, !dbg !420
  %idxprom15 = sext i32 %11 to i64, !dbg !418
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !418
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !418
  call void @printIntLine(i32 noundef %12), !dbg !421
  br label %for.inc17, !dbg !422

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !423
  %inc18 = add nsw i32 %13, 1, !dbg !423
  store i32 %inc18, i32* %i, align 4, !dbg !423
  br label %for.cond12, !dbg !424, !llvm.loop !425

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !427

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !428
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !430
  %15 = bitcast i32* %14 to i8*, !dbg !430
  call void @free(i8* noundef %15), !dbg !431
  br label %if.end21, !dbg !432

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !433
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_08_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !4)
!20 = !DILocation(line: 37, column: 9, scope: !14)
!21 = !DILocation(line: 39, column: 10, scope: !14)
!22 = !DILocation(line: 40, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 8)
!24 = !DILocation(line: 40, column: 8, scope: !14)
!25 = !DILocation(line: 43, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !15, line: 41, column: 5)
!27 = !DILocation(line: 43, column: 9, scope: !26)
!28 = !DILocation(line: 44, column: 5, scope: !26)
!29 = !DILocation(line: 45, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 8)
!31 = !DILocation(line: 45, column: 8, scope: !14)
!32 = !DILocalVariable(name: "i", scope: !33, file: !15, line: 48, type: !4)
!33 = distinct !DILexicalBlock(scope: !34, file: !15, line: 47, column: 9)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 46, column: 5)
!35 = !DILocation(line: 48, column: 17, scope: !33)
!36 = !DILocalVariable(name: "buffer", scope: !33, file: !15, line: 49, type: !3)
!37 = !DILocation(line: 49, column: 19, scope: !33)
!38 = !DILocation(line: 49, column: 35, scope: !33)
!39 = !DILocation(line: 49, column: 28, scope: !33)
!40 = !DILocation(line: 50, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !15, line: 50, column: 17)
!42 = !DILocation(line: 50, column: 24, scope: !41)
!43 = !DILocation(line: 50, column: 17, scope: !33)
!44 = !DILocation(line: 50, column: 34, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 50, column: 33)
!46 = !DILocation(line: 52, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !33, file: !15, line: 52, column: 13)
!48 = !DILocation(line: 52, column: 18, scope: !47)
!49 = !DILocation(line: 52, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !15, line: 52, column: 13)
!51 = !DILocation(line: 52, column: 27, scope: !50)
!52 = !DILocation(line: 52, column: 13, scope: !47)
!53 = !DILocation(line: 54, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 53, column: 13)
!55 = !DILocation(line: 54, column: 24, scope: !54)
!56 = !DILocation(line: 54, column: 27, scope: !54)
!57 = !DILocation(line: 55, column: 13, scope: !54)
!58 = !DILocation(line: 52, column: 34, scope: !50)
!59 = !DILocation(line: 52, column: 13, scope: !50)
!60 = distinct !{!60, !52, !61, !62}
!61 = !DILocation(line: 55, column: 13, scope: !47)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 58, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !33, file: !15, line: 58, column: 17)
!65 = !DILocation(line: 58, column: 22, scope: !64)
!66 = !DILocation(line: 58, column: 17, scope: !33)
!67 = !DILocation(line: 60, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !15, line: 59, column: 13)
!69 = !DILocation(line: 60, column: 24, scope: !68)
!70 = !DILocation(line: 60, column: 30, scope: !68)
!71 = !DILocation(line: 62, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !15, line: 62, column: 17)
!73 = !DILocation(line: 62, column: 21, scope: !72)
!74 = !DILocation(line: 62, column: 28, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !15, line: 62, column: 17)
!76 = !DILocation(line: 62, column: 30, scope: !75)
!77 = !DILocation(line: 62, column: 17, scope: !72)
!78 = !DILocation(line: 64, column: 34, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 63, column: 17)
!80 = !DILocation(line: 64, column: 41, scope: !79)
!81 = !DILocation(line: 64, column: 21, scope: !79)
!82 = !DILocation(line: 65, column: 17, scope: !79)
!83 = !DILocation(line: 62, column: 37, scope: !75)
!84 = !DILocation(line: 62, column: 17, scope: !75)
!85 = distinct !{!85, !77, !86, !62}
!86 = !DILocation(line: 65, column: 17, scope: !72)
!87 = !DILocation(line: 66, column: 13, scope: !68)
!88 = !DILocation(line: 69, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !64, file: !15, line: 68, column: 13)
!90 = !DILocation(line: 71, column: 18, scope: !33)
!91 = !DILocation(line: 71, column: 13, scope: !33)
!92 = !DILocation(line: 73, column: 5, scope: !34)
!93 = !DILocation(line: 74, column: 1, scope: !14)
!94 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_08_good", scope: !15, file: !15, line: 258, type: !16, scopeLine: 259, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!95 = !DILocation(line: 260, column: 5, scope: !94)
!96 = !DILocation(line: 261, column: 5, scope: !94)
!97 = !DILocation(line: 262, column: 5, scope: !94)
!98 = !DILocation(line: 263, column: 5, scope: !94)
!99 = !DILocation(line: 264, column: 1, scope: !94)
!100 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 275, type: !101, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!101 = !DISubroutineType(types: !102)
!102 = !{!4, !4, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !15, line: 275, type: !4)
!107 = !DILocation(line: 275, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !15, line: 275, type: !103)
!109 = !DILocation(line: 275, column: 27, scope: !100)
!110 = !DILocation(line: 278, column: 22, scope: !100)
!111 = !DILocation(line: 278, column: 12, scope: !100)
!112 = !DILocation(line: 278, column: 5, scope: !100)
!113 = !DILocation(line: 280, column: 5, scope: !100)
!114 = !DILocation(line: 281, column: 5, scope: !100)
!115 = !DILocation(line: 282, column: 5, scope: !100)
!116 = !DILocation(line: 285, column: 5, scope: !100)
!117 = !DILocation(line: 286, column: 5, scope: !100)
!118 = !DILocation(line: 287, column: 5, scope: !100)
!119 = !DILocation(line: 289, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 23, type: !121, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!121 = !DISubroutineType(types: !122)
!122 = !{!4}
!123 = !DILocation(line: 25, column: 5, scope: !120)
!124 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!125 = !DILocalVariable(name: "data", scope: !124, file: !15, line: 83, type: !4)
!126 = !DILocation(line: 83, column: 9, scope: !124)
!127 = !DILocation(line: 85, column: 10, scope: !124)
!128 = !DILocation(line: 86, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !15, line: 86, column: 8)
!130 = !DILocation(line: 86, column: 8, scope: !124)
!131 = !DILocation(line: 89, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !15, line: 87, column: 5)
!133 = !DILocation(line: 89, column: 9, scope: !132)
!134 = !DILocation(line: 90, column: 5, scope: !132)
!135 = !DILocation(line: 91, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !124, file: !15, line: 91, column: 8)
!137 = !DILocation(line: 91, column: 8, scope: !124)
!138 = !DILocation(line: 94, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !15, line: 92, column: 5)
!140 = !DILocation(line: 95, column: 5, scope: !139)
!141 = !DILocalVariable(name: "i", scope: !142, file: !15, line: 99, type: !4)
!142 = distinct !DILexicalBlock(scope: !143, file: !15, line: 98, column: 9)
!143 = distinct !DILexicalBlock(scope: !136, file: !15, line: 97, column: 5)
!144 = !DILocation(line: 99, column: 17, scope: !142)
!145 = !DILocalVariable(name: "buffer", scope: !142, file: !15, line: 100, type: !3)
!146 = !DILocation(line: 100, column: 19, scope: !142)
!147 = !DILocation(line: 100, column: 35, scope: !142)
!148 = !DILocation(line: 100, column: 28, scope: !142)
!149 = !DILocation(line: 101, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !142, file: !15, line: 101, column: 17)
!151 = !DILocation(line: 101, column: 24, scope: !150)
!152 = !DILocation(line: 101, column: 17, scope: !142)
!153 = !DILocation(line: 101, column: 34, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !15, line: 101, column: 33)
!155 = !DILocation(line: 103, column: 20, scope: !156)
!156 = distinct !DILexicalBlock(scope: !142, file: !15, line: 103, column: 13)
!157 = !DILocation(line: 103, column: 18, scope: !156)
!158 = !DILocation(line: 103, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !15, line: 103, column: 13)
!160 = !DILocation(line: 103, column: 27, scope: !159)
!161 = !DILocation(line: 103, column: 13, scope: !156)
!162 = !DILocation(line: 105, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !15, line: 104, column: 13)
!164 = !DILocation(line: 105, column: 24, scope: !163)
!165 = !DILocation(line: 105, column: 27, scope: !163)
!166 = !DILocation(line: 106, column: 13, scope: !163)
!167 = !DILocation(line: 103, column: 34, scope: !159)
!168 = !DILocation(line: 103, column: 13, scope: !159)
!169 = distinct !{!169, !161, !170, !62}
!170 = !DILocation(line: 106, column: 13, scope: !156)
!171 = !DILocation(line: 108, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !142, file: !15, line: 108, column: 17)
!173 = !DILocation(line: 108, column: 22, scope: !172)
!174 = !DILocation(line: 108, column: 27, scope: !172)
!175 = !DILocation(line: 108, column: 30, scope: !172)
!176 = !DILocation(line: 108, column: 35, scope: !172)
!177 = !DILocation(line: 108, column: 17, scope: !142)
!178 = !DILocation(line: 110, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !172, file: !15, line: 109, column: 13)
!180 = !DILocation(line: 110, column: 24, scope: !179)
!181 = !DILocation(line: 110, column: 30, scope: !179)
!182 = !DILocation(line: 112, column: 23, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !15, line: 112, column: 17)
!184 = !DILocation(line: 112, column: 21, scope: !183)
!185 = !DILocation(line: 112, column: 28, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !15, line: 112, column: 17)
!187 = !DILocation(line: 112, column: 30, scope: !186)
!188 = !DILocation(line: 112, column: 17, scope: !183)
!189 = !DILocation(line: 114, column: 34, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !15, line: 113, column: 17)
!191 = !DILocation(line: 114, column: 41, scope: !190)
!192 = !DILocation(line: 114, column: 21, scope: !190)
!193 = !DILocation(line: 115, column: 17, scope: !190)
!194 = !DILocation(line: 112, column: 37, scope: !186)
!195 = !DILocation(line: 112, column: 17, scope: !186)
!196 = distinct !{!196, !188, !197, !62}
!197 = !DILocation(line: 115, column: 17, scope: !183)
!198 = !DILocation(line: 116, column: 13, scope: !179)
!199 = !DILocation(line: 119, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !172, file: !15, line: 118, column: 13)
!201 = !DILocation(line: 121, column: 18, scope: !142)
!202 = !DILocation(line: 121, column: 13, scope: !142)
!203 = !DILocation(line: 124, column: 1, scope: !124)
!204 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 28, type: !121, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!205 = !DILocation(line: 30, column: 5, scope: !204)
!206 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 127, type: !16, scopeLine: 128, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!207 = !DILocalVariable(name: "data", scope: !206, file: !15, line: 129, type: !4)
!208 = !DILocation(line: 129, column: 9, scope: !206)
!209 = !DILocation(line: 131, column: 10, scope: !206)
!210 = !DILocation(line: 132, column: 8, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !15, line: 132, column: 8)
!212 = !DILocation(line: 132, column: 8, scope: !206)
!213 = !DILocation(line: 135, column: 16, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !15, line: 133, column: 5)
!215 = !DILocation(line: 135, column: 9, scope: !214)
!216 = !DILocation(line: 136, column: 5, scope: !214)
!217 = !DILocation(line: 137, column: 8, scope: !218)
!218 = distinct !DILexicalBlock(scope: !206, file: !15, line: 137, column: 8)
!219 = !DILocation(line: 137, column: 8, scope: !206)
!220 = !DILocalVariable(name: "i", scope: !221, file: !15, line: 140, type: !4)
!221 = distinct !DILexicalBlock(scope: !222, file: !15, line: 139, column: 9)
!222 = distinct !DILexicalBlock(scope: !218, file: !15, line: 138, column: 5)
!223 = !DILocation(line: 140, column: 17, scope: !221)
!224 = !DILocalVariable(name: "buffer", scope: !221, file: !15, line: 141, type: !3)
!225 = !DILocation(line: 141, column: 19, scope: !221)
!226 = !DILocation(line: 141, column: 35, scope: !221)
!227 = !DILocation(line: 141, column: 28, scope: !221)
!228 = !DILocation(line: 142, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !221, file: !15, line: 142, column: 17)
!230 = !DILocation(line: 142, column: 24, scope: !229)
!231 = !DILocation(line: 142, column: 17, scope: !221)
!232 = !DILocation(line: 142, column: 34, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !15, line: 142, column: 33)
!234 = !DILocation(line: 144, column: 20, scope: !235)
!235 = distinct !DILexicalBlock(scope: !221, file: !15, line: 144, column: 13)
!236 = !DILocation(line: 144, column: 18, scope: !235)
!237 = !DILocation(line: 144, column: 25, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !15, line: 144, column: 13)
!239 = !DILocation(line: 144, column: 27, scope: !238)
!240 = !DILocation(line: 144, column: 13, scope: !235)
!241 = !DILocation(line: 146, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !15, line: 145, column: 13)
!243 = !DILocation(line: 146, column: 24, scope: !242)
!244 = !DILocation(line: 146, column: 27, scope: !242)
!245 = !DILocation(line: 147, column: 13, scope: !242)
!246 = !DILocation(line: 144, column: 34, scope: !238)
!247 = !DILocation(line: 144, column: 13, scope: !238)
!248 = distinct !{!248, !240, !249, !62}
!249 = !DILocation(line: 147, column: 13, scope: !235)
!250 = !DILocation(line: 149, column: 17, scope: !251)
!251 = distinct !DILexicalBlock(scope: !221, file: !15, line: 149, column: 17)
!252 = !DILocation(line: 149, column: 22, scope: !251)
!253 = !DILocation(line: 149, column: 27, scope: !251)
!254 = !DILocation(line: 149, column: 30, scope: !251)
!255 = !DILocation(line: 149, column: 35, scope: !251)
!256 = !DILocation(line: 149, column: 17, scope: !221)
!257 = !DILocation(line: 151, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !251, file: !15, line: 150, column: 13)
!259 = !DILocation(line: 151, column: 24, scope: !258)
!260 = !DILocation(line: 151, column: 30, scope: !258)
!261 = !DILocation(line: 153, column: 23, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !15, line: 153, column: 17)
!263 = !DILocation(line: 153, column: 21, scope: !262)
!264 = !DILocation(line: 153, column: 28, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !15, line: 153, column: 17)
!266 = !DILocation(line: 153, column: 30, scope: !265)
!267 = !DILocation(line: 153, column: 17, scope: !262)
!268 = !DILocation(line: 155, column: 34, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !15, line: 154, column: 17)
!270 = !DILocation(line: 155, column: 41, scope: !269)
!271 = !DILocation(line: 155, column: 21, scope: !269)
!272 = !DILocation(line: 156, column: 17, scope: !269)
!273 = !DILocation(line: 153, column: 37, scope: !265)
!274 = !DILocation(line: 153, column: 17, scope: !265)
!275 = distinct !{!275, !267, !276, !62}
!276 = !DILocation(line: 156, column: 17, scope: !262)
!277 = !DILocation(line: 157, column: 13, scope: !258)
!278 = !DILocation(line: 160, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !251, file: !15, line: 159, column: 13)
!280 = !DILocation(line: 162, column: 18, scope: !221)
!281 = !DILocation(line: 162, column: 13, scope: !221)
!282 = !DILocation(line: 164, column: 5, scope: !222)
!283 = !DILocation(line: 165, column: 1, scope: !206)
!284 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 168, type: !16, scopeLine: 169, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!285 = !DILocalVariable(name: "data", scope: !284, file: !15, line: 170, type: !4)
!286 = !DILocation(line: 170, column: 9, scope: !284)
!287 = !DILocation(line: 172, column: 10, scope: !284)
!288 = !DILocation(line: 173, column: 8, scope: !289)
!289 = distinct !DILexicalBlock(scope: !284, file: !15, line: 173, column: 8)
!290 = !DILocation(line: 173, column: 8, scope: !284)
!291 = !DILocation(line: 176, column: 9, scope: !292)
!292 = distinct !DILexicalBlock(scope: !289, file: !15, line: 174, column: 5)
!293 = !DILocation(line: 177, column: 5, scope: !292)
!294 = !DILocation(line: 182, column: 14, scope: !295)
!295 = distinct !DILexicalBlock(scope: !289, file: !15, line: 179, column: 5)
!296 = !DILocation(line: 184, column: 8, scope: !297)
!297 = distinct !DILexicalBlock(scope: !284, file: !15, line: 184, column: 8)
!298 = !DILocation(line: 184, column: 8, scope: !284)
!299 = !DILocalVariable(name: "i", scope: !300, file: !15, line: 187, type: !4)
!300 = distinct !DILexicalBlock(scope: !301, file: !15, line: 186, column: 9)
!301 = distinct !DILexicalBlock(scope: !297, file: !15, line: 185, column: 5)
!302 = !DILocation(line: 187, column: 17, scope: !300)
!303 = !DILocalVariable(name: "buffer", scope: !300, file: !15, line: 188, type: !3)
!304 = !DILocation(line: 188, column: 19, scope: !300)
!305 = !DILocation(line: 188, column: 35, scope: !300)
!306 = !DILocation(line: 188, column: 28, scope: !300)
!307 = !DILocation(line: 189, column: 17, scope: !308)
!308 = distinct !DILexicalBlock(scope: !300, file: !15, line: 189, column: 17)
!309 = !DILocation(line: 189, column: 24, scope: !308)
!310 = !DILocation(line: 189, column: 17, scope: !300)
!311 = !DILocation(line: 189, column: 34, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !15, line: 189, column: 33)
!313 = !DILocation(line: 191, column: 20, scope: !314)
!314 = distinct !DILexicalBlock(scope: !300, file: !15, line: 191, column: 13)
!315 = !DILocation(line: 191, column: 18, scope: !314)
!316 = !DILocation(line: 191, column: 25, scope: !317)
!317 = distinct !DILexicalBlock(scope: !314, file: !15, line: 191, column: 13)
!318 = !DILocation(line: 191, column: 27, scope: !317)
!319 = !DILocation(line: 191, column: 13, scope: !314)
!320 = !DILocation(line: 193, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !15, line: 192, column: 13)
!322 = !DILocation(line: 193, column: 24, scope: !321)
!323 = !DILocation(line: 193, column: 27, scope: !321)
!324 = !DILocation(line: 194, column: 13, scope: !321)
!325 = !DILocation(line: 191, column: 34, scope: !317)
!326 = !DILocation(line: 191, column: 13, scope: !317)
!327 = distinct !{!327, !319, !328, !62}
!328 = !DILocation(line: 194, column: 13, scope: !314)
!329 = !DILocation(line: 197, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !300, file: !15, line: 197, column: 17)
!331 = !DILocation(line: 197, column: 22, scope: !330)
!332 = !DILocation(line: 197, column: 17, scope: !300)
!333 = !DILocation(line: 199, column: 17, scope: !334)
!334 = distinct !DILexicalBlock(scope: !330, file: !15, line: 198, column: 13)
!335 = !DILocation(line: 199, column: 24, scope: !334)
!336 = !DILocation(line: 199, column: 30, scope: !334)
!337 = !DILocation(line: 201, column: 23, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !15, line: 201, column: 17)
!339 = !DILocation(line: 201, column: 21, scope: !338)
!340 = !DILocation(line: 201, column: 28, scope: !341)
!341 = distinct !DILexicalBlock(scope: !338, file: !15, line: 201, column: 17)
!342 = !DILocation(line: 201, column: 30, scope: !341)
!343 = !DILocation(line: 201, column: 17, scope: !338)
!344 = !DILocation(line: 203, column: 34, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !15, line: 202, column: 17)
!346 = !DILocation(line: 203, column: 41, scope: !345)
!347 = !DILocation(line: 203, column: 21, scope: !345)
!348 = !DILocation(line: 204, column: 17, scope: !345)
!349 = !DILocation(line: 201, column: 37, scope: !341)
!350 = !DILocation(line: 201, column: 17, scope: !341)
!351 = distinct !{!351, !343, !352, !62}
!352 = !DILocation(line: 204, column: 17, scope: !338)
!353 = !DILocation(line: 205, column: 13, scope: !334)
!354 = !DILocation(line: 208, column: 17, scope: !355)
!355 = distinct !DILexicalBlock(scope: !330, file: !15, line: 207, column: 13)
!356 = !DILocation(line: 210, column: 18, scope: !300)
!357 = !DILocation(line: 210, column: 13, scope: !300)
!358 = !DILocation(line: 212, column: 5, scope: !301)
!359 = !DILocation(line: 213, column: 1, scope: !284)
!360 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 216, type: !16, scopeLine: 217, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!361 = !DILocalVariable(name: "data", scope: !360, file: !15, line: 218, type: !4)
!362 = !DILocation(line: 218, column: 9, scope: !360)
!363 = !DILocation(line: 220, column: 10, scope: !360)
!364 = !DILocation(line: 221, column: 8, scope: !365)
!365 = distinct !DILexicalBlock(scope: !360, file: !15, line: 221, column: 8)
!366 = !DILocation(line: 221, column: 8, scope: !360)
!367 = !DILocation(line: 225, column: 14, scope: !368)
!368 = distinct !DILexicalBlock(scope: !365, file: !15, line: 222, column: 5)
!369 = !DILocation(line: 226, column: 5, scope: !368)
!370 = !DILocation(line: 227, column: 8, scope: !371)
!371 = distinct !DILexicalBlock(scope: !360, file: !15, line: 227, column: 8)
!372 = !DILocation(line: 227, column: 8, scope: !360)
!373 = !DILocalVariable(name: "i", scope: !374, file: !15, line: 230, type: !4)
!374 = distinct !DILexicalBlock(scope: !375, file: !15, line: 229, column: 9)
!375 = distinct !DILexicalBlock(scope: !371, file: !15, line: 228, column: 5)
!376 = !DILocation(line: 230, column: 17, scope: !374)
!377 = !DILocalVariable(name: "buffer", scope: !374, file: !15, line: 231, type: !3)
!378 = !DILocation(line: 231, column: 19, scope: !374)
!379 = !DILocation(line: 231, column: 35, scope: !374)
!380 = !DILocation(line: 231, column: 28, scope: !374)
!381 = !DILocation(line: 232, column: 17, scope: !382)
!382 = distinct !DILexicalBlock(scope: !374, file: !15, line: 232, column: 17)
!383 = !DILocation(line: 232, column: 24, scope: !382)
!384 = !DILocation(line: 232, column: 17, scope: !374)
!385 = !DILocation(line: 232, column: 34, scope: !386)
!386 = distinct !DILexicalBlock(scope: !382, file: !15, line: 232, column: 33)
!387 = !DILocation(line: 234, column: 20, scope: !388)
!388 = distinct !DILexicalBlock(scope: !374, file: !15, line: 234, column: 13)
!389 = !DILocation(line: 234, column: 18, scope: !388)
!390 = !DILocation(line: 234, column: 25, scope: !391)
!391 = distinct !DILexicalBlock(scope: !388, file: !15, line: 234, column: 13)
!392 = !DILocation(line: 234, column: 27, scope: !391)
!393 = !DILocation(line: 234, column: 13, scope: !388)
!394 = !DILocation(line: 236, column: 17, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !15, line: 235, column: 13)
!396 = !DILocation(line: 236, column: 24, scope: !395)
!397 = !DILocation(line: 236, column: 27, scope: !395)
!398 = !DILocation(line: 237, column: 13, scope: !395)
!399 = !DILocation(line: 234, column: 34, scope: !391)
!400 = !DILocation(line: 234, column: 13, scope: !391)
!401 = distinct !{!401, !393, !402, !62}
!402 = !DILocation(line: 237, column: 13, scope: !388)
!403 = !DILocation(line: 240, column: 17, scope: !404)
!404 = distinct !DILexicalBlock(scope: !374, file: !15, line: 240, column: 17)
!405 = !DILocation(line: 240, column: 22, scope: !404)
!406 = !DILocation(line: 240, column: 17, scope: !374)
!407 = !DILocation(line: 242, column: 17, scope: !408)
!408 = distinct !DILexicalBlock(scope: !404, file: !15, line: 241, column: 13)
!409 = !DILocation(line: 242, column: 24, scope: !408)
!410 = !DILocation(line: 242, column: 30, scope: !408)
!411 = !DILocation(line: 244, column: 23, scope: !412)
!412 = distinct !DILexicalBlock(scope: !408, file: !15, line: 244, column: 17)
!413 = !DILocation(line: 244, column: 21, scope: !412)
!414 = !DILocation(line: 244, column: 28, scope: !415)
!415 = distinct !DILexicalBlock(scope: !412, file: !15, line: 244, column: 17)
!416 = !DILocation(line: 244, column: 30, scope: !415)
!417 = !DILocation(line: 244, column: 17, scope: !412)
!418 = !DILocation(line: 246, column: 34, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !15, line: 245, column: 17)
!420 = !DILocation(line: 246, column: 41, scope: !419)
!421 = !DILocation(line: 246, column: 21, scope: !419)
!422 = !DILocation(line: 247, column: 17, scope: !419)
!423 = !DILocation(line: 244, column: 37, scope: !415)
!424 = !DILocation(line: 244, column: 17, scope: !415)
!425 = distinct !{!425, !417, !426, !62}
!426 = !DILocation(line: 247, column: 17, scope: !412)
!427 = !DILocation(line: 248, column: 13, scope: !408)
!428 = !DILocation(line: 251, column: 17, scope: !429)
!429 = distinct !DILexicalBlock(scope: !404, file: !15, line: 250, column: 13)
!430 = !DILocation(line: 253, column: 18, scope: !374)
!431 = !DILocation(line: 253, column: 13, scope: !374)
!432 = !DILocation(line: 255, column: 5, scope: !375)
!433 = !DILocation(line: 256, column: 1, scope: !360)
