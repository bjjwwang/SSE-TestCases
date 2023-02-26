; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i30 = alloca i32, align 4
  %buffer31 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !22
  %tobool = icmp ne i32 %call, 0, !dbg !22
  br i1 %tobool, label %if.then, label %if.else5, !dbg !24

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !25, metadata !DIExpression()), !dbg !32
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !35
  %call1 = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !36
  %cmp = icmp ne i8* %call1, null, !dbg !37
  br i1 %cmp, label %if.then2, label %if.else, !dbg !38

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !39
  %call4 = call i32 @atoi(i8* noundef %arraydecay3), !dbg !41
  store i32 %call4, i32* %data, align 4, !dbg !42
  br label %if.end, !dbg !43

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end6, !dbg !46

if.else5:                                         ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !47
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.end
  %call7 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !49
  %tobool8 = icmp ne i32 %call7, 0, !dbg !49
  br i1 %tobool8, label %if.then9, label %if.else29, !dbg !51

if.then9:                                         ; preds = %if.end6
  call void @llvm.dbg.declare(metadata i32* %i, metadata !52, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !56, metadata !DIExpression()), !dbg !57
  %call10 = call i8* @malloc(i64 noundef 40) #6, !dbg !58
  %2 = bitcast i8* %call10 to i32*, !dbg !59
  store i32* %2, i32** %buffer, align 8, !dbg !57
  %3 = load i32*, i32** %buffer, align 8, !dbg !60
  %cmp11 = icmp eq i32* %3, null, !dbg !62
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !63

if.then12:                                        ; preds = %if.then9
  call void @exit(i32 noundef -1) #7, !dbg !64
  unreachable, !dbg !64

if.end13:                                         ; preds = %if.then9
  store i32 0, i32* %i, align 4, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.end13
  %4 = load i32, i32* %i, align 4, !dbg !69
  %cmp14 = icmp slt i32 %4, 10, !dbg !71
  br i1 %cmp14, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !73
  %6 = load i32, i32* %i, align 4, !dbg !75
  %idxprom = sext i32 %6 to i64, !dbg !73
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !78
  %inc = add nsw i32 %7, 1, !dbg !78
  store i32 %inc, i32* %i, align 4, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !83
  %cmp15 = icmp sge i32 %8, 0, !dbg !85
  br i1 %cmp15, label %if.then16, label %if.else27, !dbg !86

if.then16:                                        ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !87
  %10 = load i32, i32* %data, align 4, !dbg !89
  %idxprom17 = sext i32 %10 to i64, !dbg !87
  %arrayidx18 = getelementptr inbounds i32, i32* %9, i64 %idxprom17, !dbg !87
  store i32 1, i32* %arrayidx18, align 4, !dbg !90
  store i32 0, i32* %i, align 4, !dbg !91
  br label %for.cond19, !dbg !93

for.cond19:                                       ; preds = %for.inc24, %if.then16
  %11 = load i32, i32* %i, align 4, !dbg !94
  %cmp20 = icmp slt i32 %11, 10, !dbg !96
  br i1 %cmp20, label %for.body21, label %for.end26, !dbg !97

for.body21:                                       ; preds = %for.cond19
  %12 = load i32*, i32** %buffer, align 8, !dbg !98
  %13 = load i32, i32* %i, align 4, !dbg !100
  %idxprom22 = sext i32 %13 to i64, !dbg !98
  %arrayidx23 = getelementptr inbounds i32, i32* %12, i64 %idxprom22, !dbg !98
  %14 = load i32, i32* %arrayidx23, align 4, !dbg !98
  call void @printIntLine(i32 noundef %14), !dbg !101
  br label %for.inc24, !dbg !102

for.inc24:                                        ; preds = %for.body21
  %15 = load i32, i32* %i, align 4, !dbg !103
  %inc25 = add nsw i32 %15, 1, !dbg !103
  store i32 %inc25, i32* %i, align 4, !dbg !103
  br label %for.cond19, !dbg !104, !llvm.loop !105

for.end26:                                        ; preds = %for.cond19
  br label %if.end28, !dbg !107

if.else27:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  br label %if.end28

if.end28:                                         ; preds = %if.else27, %for.end26
  %16 = load i32*, i32** %buffer, align 8, !dbg !110
  %17 = bitcast i32* %16 to i8*, !dbg !110
  call void @free(i8* noundef %17), !dbg !111
  br label %if.end59, !dbg !112

if.else29:                                        ; preds = %if.end6
  call void @llvm.dbg.declare(metadata i32* %i30, metadata !113, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32** %buffer31, metadata !117, metadata !DIExpression()), !dbg !118
  %call32 = call i8* @malloc(i64 noundef 40) #6, !dbg !119
  %18 = bitcast i8* %call32 to i32*, !dbg !120
  store i32* %18, i32** %buffer31, align 8, !dbg !118
  %19 = load i32*, i32** %buffer31, align 8, !dbg !121
  %cmp33 = icmp eq i32* %19, null, !dbg !123
  br i1 %cmp33, label %if.then34, label %if.end35, !dbg !124

if.then34:                                        ; preds = %if.else29
  call void @exit(i32 noundef -1) #7, !dbg !125
  unreachable, !dbg !125

if.end35:                                         ; preds = %if.else29
  store i32 0, i32* %i30, align 4, !dbg !127
  br label %for.cond36, !dbg !129

for.cond36:                                       ; preds = %for.inc41, %if.end35
  %20 = load i32, i32* %i30, align 4, !dbg !130
  %cmp37 = icmp slt i32 %20, 10, !dbg !132
  br i1 %cmp37, label %for.body38, label %for.end43, !dbg !133

for.body38:                                       ; preds = %for.cond36
  %21 = load i32*, i32** %buffer31, align 8, !dbg !134
  %22 = load i32, i32* %i30, align 4, !dbg !136
  %idxprom39 = sext i32 %22 to i64, !dbg !134
  %arrayidx40 = getelementptr inbounds i32, i32* %21, i64 %idxprom39, !dbg !134
  store i32 0, i32* %arrayidx40, align 4, !dbg !137
  br label %for.inc41, !dbg !138

for.inc41:                                        ; preds = %for.body38
  %23 = load i32, i32* %i30, align 4, !dbg !139
  %inc42 = add nsw i32 %23, 1, !dbg !139
  store i32 %inc42, i32* %i30, align 4, !dbg !139
  br label %for.cond36, !dbg !140, !llvm.loop !141

for.end43:                                        ; preds = %for.cond36
  %24 = load i32, i32* %data, align 4, !dbg !143
  %cmp44 = icmp sge i32 %24, 0, !dbg !145
  br i1 %cmp44, label %land.lhs.true, label %if.else57, !dbg !146

land.lhs.true:                                    ; preds = %for.end43
  %25 = load i32, i32* %data, align 4, !dbg !147
  %cmp45 = icmp slt i32 %25, 10, !dbg !148
  br i1 %cmp45, label %if.then46, label %if.else57, !dbg !149

if.then46:                                        ; preds = %land.lhs.true
  %26 = load i32*, i32** %buffer31, align 8, !dbg !150
  %27 = load i32, i32* %data, align 4, !dbg !152
  %idxprom47 = sext i32 %27 to i64, !dbg !150
  %arrayidx48 = getelementptr inbounds i32, i32* %26, i64 %idxprom47, !dbg !150
  store i32 1, i32* %arrayidx48, align 4, !dbg !153
  store i32 0, i32* %i30, align 4, !dbg !154
  br label %for.cond49, !dbg !156

for.cond49:                                       ; preds = %for.inc54, %if.then46
  %28 = load i32, i32* %i30, align 4, !dbg !157
  %cmp50 = icmp slt i32 %28, 10, !dbg !159
  br i1 %cmp50, label %for.body51, label %for.end56, !dbg !160

for.body51:                                       ; preds = %for.cond49
  %29 = load i32*, i32** %buffer31, align 8, !dbg !161
  %30 = load i32, i32* %i30, align 4, !dbg !163
  %idxprom52 = sext i32 %30 to i64, !dbg !161
  %arrayidx53 = getelementptr inbounds i32, i32* %29, i64 %idxprom52, !dbg !161
  %31 = load i32, i32* %arrayidx53, align 4, !dbg !161
  call void @printIntLine(i32 noundef %31), !dbg !164
  br label %for.inc54, !dbg !165

for.inc54:                                        ; preds = %for.body51
  %32 = load i32, i32* %i30, align 4, !dbg !166
  %inc55 = add nsw i32 %32, 1, !dbg !166
  store i32 %inc55, i32* %i30, align 4, !dbg !166
  br label %for.cond49, !dbg !167, !llvm.loop !168

for.end56:                                        ; preds = %for.cond49
  br label %if.end58, !dbg !170

if.else57:                                        ; preds = %land.lhs.true, %for.end43
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !171
  br label %if.end58

if.end58:                                         ; preds = %if.else57, %for.end56
  %33 = load i32*, i32** %buffer31, align 8, !dbg !173
  %34 = bitcast i32* %33 to i8*, !dbg !173
  call void @free(i8* noundef %34), !dbg !174
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %if.end28
  ret void, !dbg !175
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i8* @fgets(i8* noundef, i32 noundef, %struct.__sFILE* noundef) #2

declare i32 @atoi(i8* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

declare void @printIntLine(i32 noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_good() #0 !dbg !176 {
entry:
  call void @goodB2G(), !dbg !177
  call void @goodG2B(), !dbg !178
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !180 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !185, metadata !DIExpression()), !dbg !186
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !187, metadata !DIExpression()), !dbg !188
  %call = call i64 @time(i64* noundef null), !dbg !189
  %conv = trunc i64 %call to i32, !dbg !190
  call void @srand(i32 noundef %conv), !dbg !191
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !192
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_good(), !dbg !193
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !194
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !195
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_bad(), !dbg !196
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !197
  ret i32 0, !dbg !198
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !199 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %inputBuffer6 = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i40 = alloca i32, align 4
  %buffer41 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !200, metadata !DIExpression()), !dbg !201
  store i32 -1, i32* %data, align 4, !dbg !202
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !203
  %tobool = icmp ne i32 %call, 0, !dbg !203
  br i1 %tobool, label %if.then, label %if.else5, !dbg !205

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !206, metadata !DIExpression()), !dbg !209
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !209
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !209
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !210
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !212
  %call1 = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !213
  %cmp = icmp ne i8* %call1, null, !dbg !214
  br i1 %cmp, label %if.then2, label %if.else, !dbg !215

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !216
  %call4 = call i32 @atoi(i8* noundef %arraydecay3), !dbg !218
  store i32 %call4, i32* %data, align 4, !dbg !219
  br label %if.end, !dbg !220

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !221
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end15, !dbg !223

if.else5:                                         ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer6, metadata !224, metadata !DIExpression()), !dbg !227
  %2 = bitcast [14 x i8]* %inputBuffer6 to i8*, !dbg !227
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 14, i1 false), !dbg !227
  %arraydecay7 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer6, i64 0, i64 0, !dbg !228
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !230
  %call8 = call i8* @fgets(i8* noundef %arraydecay7, i32 noundef 14, %struct.__sFILE* noundef %3), !dbg !231
  %cmp9 = icmp ne i8* %call8, null, !dbg !232
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !233

if.then10:                                        ; preds = %if.else5
  %arraydecay11 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer6, i64 0, i64 0, !dbg !234
  %call12 = call i32 @atoi(i8* noundef %arraydecay11), !dbg !236
  store i32 %call12, i32* %data, align 4, !dbg !237
  br label %if.end14, !dbg !238

if.else13:                                        ; preds = %if.else5
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !239
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end
  %call16 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !241
  %tobool17 = icmp ne i32 %call16, 0, !dbg !241
  br i1 %tobool17, label %if.then18, label %if.else39, !dbg !243

if.then18:                                        ; preds = %if.end15
  call void @llvm.dbg.declare(metadata i32* %i, metadata !244, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !248, metadata !DIExpression()), !dbg !249
  %call19 = call i8* @malloc(i64 noundef 40) #6, !dbg !250
  %4 = bitcast i8* %call19 to i32*, !dbg !251
  store i32* %4, i32** %buffer, align 8, !dbg !249
  %5 = load i32*, i32** %buffer, align 8, !dbg !252
  %cmp20 = icmp eq i32* %5, null, !dbg !254
  br i1 %cmp20, label %if.then21, label %if.end22, !dbg !255

if.then21:                                        ; preds = %if.then18
  call void @exit(i32 noundef -1) #7, !dbg !256
  unreachable, !dbg !256

if.end22:                                         ; preds = %if.then18
  store i32 0, i32* %i, align 4, !dbg !258
  br label %for.cond, !dbg !260

for.cond:                                         ; preds = %for.inc, %if.end22
  %6 = load i32, i32* %i, align 4, !dbg !261
  %cmp23 = icmp slt i32 %6, 10, !dbg !263
  br i1 %cmp23, label %for.body, label %for.end, !dbg !264

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %buffer, align 8, !dbg !265
  %8 = load i32, i32* %i, align 4, !dbg !267
  %idxprom = sext i32 %8 to i64, !dbg !265
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom, !dbg !265
  store i32 0, i32* %arrayidx, align 4, !dbg !268
  br label %for.inc, !dbg !269

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !270
  %inc = add nsw i32 %9, 1, !dbg !270
  store i32 %inc, i32* %i, align 4, !dbg !270
  br label %for.cond, !dbg !271, !llvm.loop !272

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %data, align 4, !dbg !274
  %cmp24 = icmp sge i32 %10, 0, !dbg !276
  br i1 %cmp24, label %land.lhs.true, label %if.else37, !dbg !277

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %data, align 4, !dbg !278
  %cmp25 = icmp slt i32 %11, 10, !dbg !279
  br i1 %cmp25, label %if.then26, label %if.else37, !dbg !280

if.then26:                                        ; preds = %land.lhs.true
  %12 = load i32*, i32** %buffer, align 8, !dbg !281
  %13 = load i32, i32* %data, align 4, !dbg !283
  %idxprom27 = sext i32 %13 to i64, !dbg !281
  %arrayidx28 = getelementptr inbounds i32, i32* %12, i64 %idxprom27, !dbg !281
  store i32 1, i32* %arrayidx28, align 4, !dbg !284
  store i32 0, i32* %i, align 4, !dbg !285
  br label %for.cond29, !dbg !287

for.cond29:                                       ; preds = %for.inc34, %if.then26
  %14 = load i32, i32* %i, align 4, !dbg !288
  %cmp30 = icmp slt i32 %14, 10, !dbg !290
  br i1 %cmp30, label %for.body31, label %for.end36, !dbg !291

for.body31:                                       ; preds = %for.cond29
  %15 = load i32*, i32** %buffer, align 8, !dbg !292
  %16 = load i32, i32* %i, align 4, !dbg !294
  %idxprom32 = sext i32 %16 to i64, !dbg !292
  %arrayidx33 = getelementptr inbounds i32, i32* %15, i64 %idxprom32, !dbg !292
  %17 = load i32, i32* %arrayidx33, align 4, !dbg !292
  call void @printIntLine(i32 noundef %17), !dbg !295
  br label %for.inc34, !dbg !296

for.inc34:                                        ; preds = %for.body31
  %18 = load i32, i32* %i, align 4, !dbg !297
  %inc35 = add nsw i32 %18, 1, !dbg !297
  store i32 %inc35, i32* %i, align 4, !dbg !297
  br label %for.cond29, !dbg !298, !llvm.loop !299

for.end36:                                        ; preds = %for.cond29
  br label %if.end38, !dbg !301

if.else37:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !302
  br label %if.end38

if.end38:                                         ; preds = %if.else37, %for.end36
  %19 = load i32*, i32** %buffer, align 8, !dbg !304
  %20 = bitcast i32* %19 to i8*, !dbg !304
  call void @free(i8* noundef %20), !dbg !305
  br label %if.end70, !dbg !306

if.else39:                                        ; preds = %if.end15
  call void @llvm.dbg.declare(metadata i32* %i40, metadata !307, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.declare(metadata i32** %buffer41, metadata !311, metadata !DIExpression()), !dbg !312
  %call42 = call i8* @malloc(i64 noundef 40) #6, !dbg !313
  %21 = bitcast i8* %call42 to i32*, !dbg !314
  store i32* %21, i32** %buffer41, align 8, !dbg !312
  %22 = load i32*, i32** %buffer41, align 8, !dbg !315
  %cmp43 = icmp eq i32* %22, null, !dbg !317
  br i1 %cmp43, label %if.then44, label %if.end45, !dbg !318

if.then44:                                        ; preds = %if.else39
  call void @exit(i32 noundef -1) #7, !dbg !319
  unreachable, !dbg !319

if.end45:                                         ; preds = %if.else39
  store i32 0, i32* %i40, align 4, !dbg !321
  br label %for.cond46, !dbg !323

for.cond46:                                       ; preds = %for.inc51, %if.end45
  %23 = load i32, i32* %i40, align 4, !dbg !324
  %cmp47 = icmp slt i32 %23, 10, !dbg !326
  br i1 %cmp47, label %for.body48, label %for.end53, !dbg !327

for.body48:                                       ; preds = %for.cond46
  %24 = load i32*, i32** %buffer41, align 8, !dbg !328
  %25 = load i32, i32* %i40, align 4, !dbg !330
  %idxprom49 = sext i32 %25 to i64, !dbg !328
  %arrayidx50 = getelementptr inbounds i32, i32* %24, i64 %idxprom49, !dbg !328
  store i32 0, i32* %arrayidx50, align 4, !dbg !331
  br label %for.inc51, !dbg !332

for.inc51:                                        ; preds = %for.body48
  %26 = load i32, i32* %i40, align 4, !dbg !333
  %inc52 = add nsw i32 %26, 1, !dbg !333
  store i32 %inc52, i32* %i40, align 4, !dbg !333
  br label %for.cond46, !dbg !334, !llvm.loop !335

for.end53:                                        ; preds = %for.cond46
  %27 = load i32, i32* %data, align 4, !dbg !337
  %cmp54 = icmp sge i32 %27, 0, !dbg !339
  br i1 %cmp54, label %land.lhs.true55, label %if.else68, !dbg !340

land.lhs.true55:                                  ; preds = %for.end53
  %28 = load i32, i32* %data, align 4, !dbg !341
  %cmp56 = icmp slt i32 %28, 10, !dbg !342
  br i1 %cmp56, label %if.then57, label %if.else68, !dbg !343

if.then57:                                        ; preds = %land.lhs.true55
  %29 = load i32*, i32** %buffer41, align 8, !dbg !344
  %30 = load i32, i32* %data, align 4, !dbg !346
  %idxprom58 = sext i32 %30 to i64, !dbg !344
  %arrayidx59 = getelementptr inbounds i32, i32* %29, i64 %idxprom58, !dbg !344
  store i32 1, i32* %arrayidx59, align 4, !dbg !347
  store i32 0, i32* %i40, align 4, !dbg !348
  br label %for.cond60, !dbg !350

for.cond60:                                       ; preds = %for.inc65, %if.then57
  %31 = load i32, i32* %i40, align 4, !dbg !351
  %cmp61 = icmp slt i32 %31, 10, !dbg !353
  br i1 %cmp61, label %for.body62, label %for.end67, !dbg !354

for.body62:                                       ; preds = %for.cond60
  %32 = load i32*, i32** %buffer41, align 8, !dbg !355
  %33 = load i32, i32* %i40, align 4, !dbg !357
  %idxprom63 = sext i32 %33 to i64, !dbg !355
  %arrayidx64 = getelementptr inbounds i32, i32* %32, i64 %idxprom63, !dbg !355
  %34 = load i32, i32* %arrayidx64, align 4, !dbg !355
  call void @printIntLine(i32 noundef %34), !dbg !358
  br label %for.inc65, !dbg !359

for.inc65:                                        ; preds = %for.body62
  %35 = load i32, i32* %i40, align 4, !dbg !360
  %inc66 = add nsw i32 %35, 1, !dbg !360
  store i32 %inc66, i32* %i40, align 4, !dbg !360
  br label %for.cond60, !dbg !361, !llvm.loop !362

for.end67:                                        ; preds = %for.cond60
  br label %if.end69, !dbg !364

if.else68:                                        ; preds = %land.lhs.true55, %for.end53
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !365
  br label %if.end69

if.end69:                                         ; preds = %if.else68, %for.end67
  %36 = load i32*, i32** %buffer41, align 8, !dbg !367
  %37 = bitcast i32* %36 to i8*, !dbg !367
  call void @free(i8* noundef %37), !dbg !368
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.end38
  ret void, !dbg !369
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !370 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i23 = alloca i32, align 4
  %buffer24 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !371, metadata !DIExpression()), !dbg !372
  store i32 -1, i32* %data, align 4, !dbg !373
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !374
  %tobool = icmp ne i32 %call, 0, !dbg !374
  br i1 %tobool, label %if.then, label %if.else, !dbg !376

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !377
  br label %if.end, !dbg !379

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !380
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !382
  %tobool2 = icmp ne i32 %call1, 0, !dbg !382
  br i1 %tobool2, label %if.then3, label %if.else22, !dbg !384

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !385, metadata !DIExpression()), !dbg !388
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !389, metadata !DIExpression()), !dbg !390
  %call4 = call i8* @malloc(i64 noundef 40) #6, !dbg !391
  %0 = bitcast i8* %call4 to i32*, !dbg !392
  store i32* %0, i32** %buffer, align 8, !dbg !390
  %1 = load i32*, i32** %buffer, align 8, !dbg !393
  %cmp = icmp eq i32* %1, null, !dbg !395
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !396

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #7, !dbg !397
  unreachable, !dbg !397

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !399
  br label %for.cond, !dbg !401

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !402
  %cmp7 = icmp slt i32 %2, 10, !dbg !404
  br i1 %cmp7, label %for.body, label %for.end, !dbg !405

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !406
  %4 = load i32, i32* %i, align 4, !dbg !408
  %idxprom = sext i32 %4 to i64, !dbg !406
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !406
  store i32 0, i32* %arrayidx, align 4, !dbg !409
  br label %for.inc, !dbg !410

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !411
  %inc = add nsw i32 %5, 1, !dbg !411
  store i32 %inc, i32* %i, align 4, !dbg !411
  br label %for.cond, !dbg !412, !llvm.loop !413

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !415
  %cmp8 = icmp sge i32 %6, 0, !dbg !417
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !418

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !419
  %8 = load i32, i32* %data, align 4, !dbg !421
  %idxprom10 = sext i32 %8 to i64, !dbg !419
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !419
  store i32 1, i32* %arrayidx11, align 4, !dbg !422
  store i32 0, i32* %i, align 4, !dbg !423
  br label %for.cond12, !dbg !425

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !426
  %cmp13 = icmp slt i32 %9, 10, !dbg !428
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !429

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !430
  %11 = load i32, i32* %i, align 4, !dbg !432
  %idxprom15 = sext i32 %11 to i64, !dbg !430
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !430
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !430
  call void @printIntLine(i32 noundef %12), !dbg !433
  br label %for.inc17, !dbg !434

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !435
  %inc18 = add nsw i32 %13, 1, !dbg !435
  store i32 %inc18, i32* %i, align 4, !dbg !435
  br label %for.cond12, !dbg !436, !llvm.loop !437

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !439

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !440
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !442
  %15 = bitcast i32* %14 to i8*, !dbg !442
  call void @free(i8* noundef %15), !dbg !443
  br label %if.end51, !dbg !444

if.else22:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !445, metadata !DIExpression()), !dbg !448
  call void @llvm.dbg.declare(metadata i32** %buffer24, metadata !449, metadata !DIExpression()), !dbg !450
  %call25 = call i8* @malloc(i64 noundef 40) #6, !dbg !451
  %16 = bitcast i8* %call25 to i32*, !dbg !452
  store i32* %16, i32** %buffer24, align 8, !dbg !450
  %17 = load i32*, i32** %buffer24, align 8, !dbg !453
  %cmp26 = icmp eq i32* %17, null, !dbg !455
  br i1 %cmp26, label %if.then27, label %if.end28, !dbg !456

if.then27:                                        ; preds = %if.else22
  call void @exit(i32 noundef -1) #7, !dbg !457
  unreachable, !dbg !457

if.end28:                                         ; preds = %if.else22
  store i32 0, i32* %i23, align 4, !dbg !459
  br label %for.cond29, !dbg !461

for.cond29:                                       ; preds = %for.inc34, %if.end28
  %18 = load i32, i32* %i23, align 4, !dbg !462
  %cmp30 = icmp slt i32 %18, 10, !dbg !464
  br i1 %cmp30, label %for.body31, label %for.end36, !dbg !465

for.body31:                                       ; preds = %for.cond29
  %19 = load i32*, i32** %buffer24, align 8, !dbg !466
  %20 = load i32, i32* %i23, align 4, !dbg !468
  %idxprom32 = sext i32 %20 to i64, !dbg !466
  %arrayidx33 = getelementptr inbounds i32, i32* %19, i64 %idxprom32, !dbg !466
  store i32 0, i32* %arrayidx33, align 4, !dbg !469
  br label %for.inc34, !dbg !470

for.inc34:                                        ; preds = %for.body31
  %21 = load i32, i32* %i23, align 4, !dbg !471
  %inc35 = add nsw i32 %21, 1, !dbg !471
  store i32 %inc35, i32* %i23, align 4, !dbg !471
  br label %for.cond29, !dbg !472, !llvm.loop !473

for.end36:                                        ; preds = %for.cond29
  %22 = load i32, i32* %data, align 4, !dbg !475
  %cmp37 = icmp sge i32 %22, 0, !dbg !477
  br i1 %cmp37, label %if.then38, label %if.else49, !dbg !478

if.then38:                                        ; preds = %for.end36
  %23 = load i32*, i32** %buffer24, align 8, !dbg !479
  %24 = load i32, i32* %data, align 4, !dbg !481
  %idxprom39 = sext i32 %24 to i64, !dbg !479
  %arrayidx40 = getelementptr inbounds i32, i32* %23, i64 %idxprom39, !dbg !479
  store i32 1, i32* %arrayidx40, align 4, !dbg !482
  store i32 0, i32* %i23, align 4, !dbg !483
  br label %for.cond41, !dbg !485

for.cond41:                                       ; preds = %for.inc46, %if.then38
  %25 = load i32, i32* %i23, align 4, !dbg !486
  %cmp42 = icmp slt i32 %25, 10, !dbg !488
  br i1 %cmp42, label %for.body43, label %for.end48, !dbg !489

for.body43:                                       ; preds = %for.cond41
  %26 = load i32*, i32** %buffer24, align 8, !dbg !490
  %27 = load i32, i32* %i23, align 4, !dbg !492
  %idxprom44 = sext i32 %27 to i64, !dbg !490
  %arrayidx45 = getelementptr inbounds i32, i32* %26, i64 %idxprom44, !dbg !490
  %28 = load i32, i32* %arrayidx45, align 4, !dbg !490
  call void @printIntLine(i32 noundef %28), !dbg !493
  br label %for.inc46, !dbg !494

for.inc46:                                        ; preds = %for.body43
  %29 = load i32, i32* %i23, align 4, !dbg !495
  %inc47 = add nsw i32 %29, 1, !dbg !495
  store i32 %inc47, i32* %i23, align 4, !dbg !495
  br label %for.cond41, !dbg !496, !llvm.loop !497

for.end48:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !499

if.else49:                                        ; preds = %for.end36
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !500
  br label %if.end50

if.end50:                                         ; preds = %if.else49, %for.end48
  %30 = load i32*, i32** %buffer24, align 8, !dbg !502
  %31 = bitcast i32* %30 to i8*, !dbg !502
  call void @free(i8* noundef %31), !dbg !503
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.end21
  ret void, !dbg !504
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_bad", scope: !15, file: !15, line: 24, type: !16, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !5)
!20 = !DILocation(line: 26, column: 9, scope: !14)
!21 = !DILocation(line: 28, column: 10, scope: !14)
!22 = !DILocation(line: 29, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 8)
!24 = !DILocation(line: 29, column: 8, scope: !14)
!25 = !DILocalVariable(name: "inputBuffer", scope: !26, file: !15, line: 32, type: !28)
!26 = distinct !DILexicalBlock(scope: !27, file: !15, line: 31, column: 9)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 30, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 112, elements: !30)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!31}
!31 = !DISubrange(count: 14)
!32 = !DILocation(line: 32, column: 18, scope: !26)
!33 = !DILocation(line: 34, column: 23, scope: !34)
!34 = distinct !DILexicalBlock(scope: !26, file: !15, line: 34, column: 17)
!35 = !DILocation(line: 34, column: 53, scope: !34)
!36 = !DILocation(line: 34, column: 17, scope: !34)
!37 = !DILocation(line: 34, column: 60, scope: !34)
!38 = !DILocation(line: 34, column: 17, scope: !26)
!39 = !DILocation(line: 37, column: 29, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !15, line: 35, column: 13)
!41 = !DILocation(line: 37, column: 24, scope: !40)
!42 = !DILocation(line: 37, column: 22, scope: !40)
!43 = !DILocation(line: 38, column: 13, scope: !40)
!44 = !DILocation(line: 41, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !15, line: 40, column: 13)
!46 = !DILocation(line: 44, column: 5, scope: !27)
!47 = !DILocation(line: 49, column: 14, scope: !48)
!48 = distinct !DILexicalBlock(scope: !23, file: !15, line: 46, column: 5)
!49 = !DILocation(line: 51, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !14, file: !15, line: 51, column: 8)
!51 = !DILocation(line: 51, column: 8, scope: !14)
!52 = !DILocalVariable(name: "i", scope: !53, file: !15, line: 54, type: !5)
!53 = distinct !DILexicalBlock(scope: !54, file: !15, line: 53, column: 9)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 52, column: 5)
!55 = !DILocation(line: 54, column: 17, scope: !53)
!56 = !DILocalVariable(name: "buffer", scope: !53, file: !15, line: 55, type: !4)
!57 = !DILocation(line: 55, column: 19, scope: !53)
!58 = !DILocation(line: 55, column: 35, scope: !53)
!59 = !DILocation(line: 55, column: 28, scope: !53)
!60 = !DILocation(line: 56, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !53, file: !15, line: 56, column: 17)
!62 = !DILocation(line: 56, column: 24, scope: !61)
!63 = !DILocation(line: 56, column: 17, scope: !53)
!64 = !DILocation(line: 56, column: 34, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !15, line: 56, column: 33)
!66 = !DILocation(line: 58, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !53, file: !15, line: 58, column: 13)
!68 = !DILocation(line: 58, column: 18, scope: !67)
!69 = !DILocation(line: 58, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !15, line: 58, column: 13)
!71 = !DILocation(line: 58, column: 27, scope: !70)
!72 = !DILocation(line: 58, column: 13, scope: !67)
!73 = !DILocation(line: 60, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !15, line: 59, column: 13)
!75 = !DILocation(line: 60, column: 24, scope: !74)
!76 = !DILocation(line: 60, column: 27, scope: !74)
!77 = !DILocation(line: 61, column: 13, scope: !74)
!78 = !DILocation(line: 58, column: 34, scope: !70)
!79 = !DILocation(line: 58, column: 13, scope: !70)
!80 = distinct !{!80, !72, !81, !82}
!81 = !DILocation(line: 61, column: 13, scope: !67)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 64, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !53, file: !15, line: 64, column: 17)
!85 = !DILocation(line: 64, column: 22, scope: !84)
!86 = !DILocation(line: 64, column: 17, scope: !53)
!87 = !DILocation(line: 66, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 65, column: 13)
!89 = !DILocation(line: 66, column: 24, scope: !88)
!90 = !DILocation(line: 66, column: 30, scope: !88)
!91 = !DILocation(line: 68, column: 23, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 68, column: 17)
!93 = !DILocation(line: 68, column: 21, scope: !92)
!94 = !DILocation(line: 68, column: 28, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !15, line: 68, column: 17)
!96 = !DILocation(line: 68, column: 30, scope: !95)
!97 = !DILocation(line: 68, column: 17, scope: !92)
!98 = !DILocation(line: 70, column: 34, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !15, line: 69, column: 17)
!100 = !DILocation(line: 70, column: 41, scope: !99)
!101 = !DILocation(line: 70, column: 21, scope: !99)
!102 = !DILocation(line: 71, column: 17, scope: !99)
!103 = !DILocation(line: 68, column: 37, scope: !95)
!104 = !DILocation(line: 68, column: 17, scope: !95)
!105 = distinct !{!105, !97, !106, !82}
!106 = !DILocation(line: 71, column: 17, scope: !92)
!107 = !DILocation(line: 72, column: 13, scope: !88)
!108 = !DILocation(line: 75, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !84, file: !15, line: 74, column: 13)
!110 = !DILocation(line: 77, column: 18, scope: !53)
!111 = !DILocation(line: 77, column: 13, scope: !53)
!112 = !DILocation(line: 79, column: 5, scope: !54)
!113 = !DILocalVariable(name: "i", scope: !114, file: !15, line: 83, type: !5)
!114 = distinct !DILexicalBlock(scope: !115, file: !15, line: 82, column: 9)
!115 = distinct !DILexicalBlock(scope: !50, file: !15, line: 81, column: 5)
!116 = !DILocation(line: 83, column: 17, scope: !114)
!117 = !DILocalVariable(name: "buffer", scope: !114, file: !15, line: 84, type: !4)
!118 = !DILocation(line: 84, column: 19, scope: !114)
!119 = !DILocation(line: 84, column: 35, scope: !114)
!120 = !DILocation(line: 84, column: 28, scope: !114)
!121 = !DILocation(line: 85, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !114, file: !15, line: 85, column: 17)
!123 = !DILocation(line: 85, column: 24, scope: !122)
!124 = !DILocation(line: 85, column: 17, scope: !114)
!125 = !DILocation(line: 85, column: 34, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 85, column: 33)
!127 = !DILocation(line: 87, column: 20, scope: !128)
!128 = distinct !DILexicalBlock(scope: !114, file: !15, line: 87, column: 13)
!129 = !DILocation(line: 87, column: 18, scope: !128)
!130 = !DILocation(line: 87, column: 25, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !15, line: 87, column: 13)
!132 = !DILocation(line: 87, column: 27, scope: !131)
!133 = !DILocation(line: 87, column: 13, scope: !128)
!134 = !DILocation(line: 89, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 88, column: 13)
!136 = !DILocation(line: 89, column: 24, scope: !135)
!137 = !DILocation(line: 89, column: 27, scope: !135)
!138 = !DILocation(line: 90, column: 13, scope: !135)
!139 = !DILocation(line: 87, column: 34, scope: !131)
!140 = !DILocation(line: 87, column: 13, scope: !131)
!141 = distinct !{!141, !133, !142, !82}
!142 = !DILocation(line: 90, column: 13, scope: !128)
!143 = !DILocation(line: 92, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !114, file: !15, line: 92, column: 17)
!145 = !DILocation(line: 92, column: 22, scope: !144)
!146 = !DILocation(line: 92, column: 27, scope: !144)
!147 = !DILocation(line: 92, column: 30, scope: !144)
!148 = !DILocation(line: 92, column: 35, scope: !144)
!149 = !DILocation(line: 92, column: 17, scope: !114)
!150 = !DILocation(line: 94, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !144, file: !15, line: 93, column: 13)
!152 = !DILocation(line: 94, column: 24, scope: !151)
!153 = !DILocation(line: 94, column: 30, scope: !151)
!154 = !DILocation(line: 96, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !15, line: 96, column: 17)
!156 = !DILocation(line: 96, column: 21, scope: !155)
!157 = !DILocation(line: 96, column: 28, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !15, line: 96, column: 17)
!159 = !DILocation(line: 96, column: 30, scope: !158)
!160 = !DILocation(line: 96, column: 17, scope: !155)
!161 = !DILocation(line: 98, column: 34, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !15, line: 97, column: 17)
!163 = !DILocation(line: 98, column: 41, scope: !162)
!164 = !DILocation(line: 98, column: 21, scope: !162)
!165 = !DILocation(line: 99, column: 17, scope: !162)
!166 = !DILocation(line: 96, column: 37, scope: !158)
!167 = !DILocation(line: 96, column: 17, scope: !158)
!168 = distinct !{!168, !160, !169, !82}
!169 = !DILocation(line: 99, column: 17, scope: !155)
!170 = !DILocation(line: 100, column: 13, scope: !151)
!171 = !DILocation(line: 103, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !144, file: !15, line: 102, column: 13)
!173 = !DILocation(line: 105, column: 18, scope: !114)
!174 = !DILocation(line: 105, column: 13, scope: !114)
!175 = !DILocation(line: 108, column: 1, scope: !14)
!176 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fgets_12_good", scope: !15, file: !15, line: 292, type: !16, scopeLine: 293, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!177 = !DILocation(line: 294, column: 5, scope: !176)
!178 = !DILocation(line: 295, column: 5, scope: !176)
!179 = !DILocation(line: 296, column: 1, scope: !176)
!180 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 307, type: !181, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!181 = !DISubroutineType(types: !182)
!182 = !{!5, !5, !183}
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64)
!184 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!185 = !DILocalVariable(name: "argc", arg: 1, scope: !180, file: !15, line: 307, type: !5)
!186 = !DILocation(line: 307, column: 14, scope: !180)
!187 = !DILocalVariable(name: "argv", arg: 2, scope: !180, file: !15, line: 307, type: !183)
!188 = !DILocation(line: 307, column: 27, scope: !180)
!189 = !DILocation(line: 310, column: 22, scope: !180)
!190 = !DILocation(line: 310, column: 12, scope: !180)
!191 = !DILocation(line: 310, column: 5, scope: !180)
!192 = !DILocation(line: 312, column: 5, scope: !180)
!193 = !DILocation(line: 313, column: 5, scope: !180)
!194 = !DILocation(line: 314, column: 5, scope: !180)
!195 = !DILocation(line: 317, column: 5, scope: !180)
!196 = !DILocation(line: 318, column: 5, scope: !180)
!197 = !DILocation(line: 319, column: 5, scope: !180)
!198 = !DILocation(line: 321, column: 5, scope: !180)
!199 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 117, type: !16, scopeLine: 118, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!200 = !DILocalVariable(name: "data", scope: !199, file: !15, line: 119, type: !5)
!201 = !DILocation(line: 119, column: 9, scope: !199)
!202 = !DILocation(line: 121, column: 10, scope: !199)
!203 = !DILocation(line: 122, column: 8, scope: !204)
!204 = distinct !DILexicalBlock(scope: !199, file: !15, line: 122, column: 8)
!205 = !DILocation(line: 122, column: 8, scope: !199)
!206 = !DILocalVariable(name: "inputBuffer", scope: !207, file: !15, line: 125, type: !28)
!207 = distinct !DILexicalBlock(scope: !208, file: !15, line: 124, column: 9)
!208 = distinct !DILexicalBlock(scope: !204, file: !15, line: 123, column: 5)
!209 = !DILocation(line: 125, column: 18, scope: !207)
!210 = !DILocation(line: 127, column: 23, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !15, line: 127, column: 17)
!212 = !DILocation(line: 127, column: 53, scope: !211)
!213 = !DILocation(line: 127, column: 17, scope: !211)
!214 = !DILocation(line: 127, column: 60, scope: !211)
!215 = !DILocation(line: 127, column: 17, scope: !207)
!216 = !DILocation(line: 130, column: 29, scope: !217)
!217 = distinct !DILexicalBlock(scope: !211, file: !15, line: 128, column: 13)
!218 = !DILocation(line: 130, column: 24, scope: !217)
!219 = !DILocation(line: 130, column: 22, scope: !217)
!220 = !DILocation(line: 131, column: 13, scope: !217)
!221 = !DILocation(line: 134, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !211, file: !15, line: 133, column: 13)
!223 = !DILocation(line: 137, column: 5, scope: !208)
!224 = !DILocalVariable(name: "inputBuffer", scope: !225, file: !15, line: 141, type: !28)
!225 = distinct !DILexicalBlock(scope: !226, file: !15, line: 140, column: 9)
!226 = distinct !DILexicalBlock(scope: !204, file: !15, line: 139, column: 5)
!227 = !DILocation(line: 141, column: 18, scope: !225)
!228 = !DILocation(line: 143, column: 23, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !15, line: 143, column: 17)
!230 = !DILocation(line: 143, column: 53, scope: !229)
!231 = !DILocation(line: 143, column: 17, scope: !229)
!232 = !DILocation(line: 143, column: 60, scope: !229)
!233 = !DILocation(line: 143, column: 17, scope: !225)
!234 = !DILocation(line: 146, column: 29, scope: !235)
!235 = distinct !DILexicalBlock(scope: !229, file: !15, line: 144, column: 13)
!236 = !DILocation(line: 146, column: 24, scope: !235)
!237 = !DILocation(line: 146, column: 22, scope: !235)
!238 = !DILocation(line: 147, column: 13, scope: !235)
!239 = !DILocation(line: 150, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !229, file: !15, line: 149, column: 13)
!241 = !DILocation(line: 154, column: 8, scope: !242)
!242 = distinct !DILexicalBlock(scope: !199, file: !15, line: 154, column: 8)
!243 = !DILocation(line: 154, column: 8, scope: !199)
!244 = !DILocalVariable(name: "i", scope: !245, file: !15, line: 157, type: !5)
!245 = distinct !DILexicalBlock(scope: !246, file: !15, line: 156, column: 9)
!246 = distinct !DILexicalBlock(scope: !242, file: !15, line: 155, column: 5)
!247 = !DILocation(line: 157, column: 17, scope: !245)
!248 = !DILocalVariable(name: "buffer", scope: !245, file: !15, line: 158, type: !4)
!249 = !DILocation(line: 158, column: 19, scope: !245)
!250 = !DILocation(line: 158, column: 35, scope: !245)
!251 = !DILocation(line: 158, column: 28, scope: !245)
!252 = !DILocation(line: 159, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !245, file: !15, line: 159, column: 17)
!254 = !DILocation(line: 159, column: 24, scope: !253)
!255 = !DILocation(line: 159, column: 17, scope: !245)
!256 = !DILocation(line: 159, column: 34, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !15, line: 159, column: 33)
!258 = !DILocation(line: 161, column: 20, scope: !259)
!259 = distinct !DILexicalBlock(scope: !245, file: !15, line: 161, column: 13)
!260 = !DILocation(line: 161, column: 18, scope: !259)
!261 = !DILocation(line: 161, column: 25, scope: !262)
!262 = distinct !DILexicalBlock(scope: !259, file: !15, line: 161, column: 13)
!263 = !DILocation(line: 161, column: 27, scope: !262)
!264 = !DILocation(line: 161, column: 13, scope: !259)
!265 = !DILocation(line: 163, column: 17, scope: !266)
!266 = distinct !DILexicalBlock(scope: !262, file: !15, line: 162, column: 13)
!267 = !DILocation(line: 163, column: 24, scope: !266)
!268 = !DILocation(line: 163, column: 27, scope: !266)
!269 = !DILocation(line: 164, column: 13, scope: !266)
!270 = !DILocation(line: 161, column: 34, scope: !262)
!271 = !DILocation(line: 161, column: 13, scope: !262)
!272 = distinct !{!272, !264, !273, !82}
!273 = !DILocation(line: 164, column: 13, scope: !259)
!274 = !DILocation(line: 166, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !245, file: !15, line: 166, column: 17)
!276 = !DILocation(line: 166, column: 22, scope: !275)
!277 = !DILocation(line: 166, column: 27, scope: !275)
!278 = !DILocation(line: 166, column: 30, scope: !275)
!279 = !DILocation(line: 166, column: 35, scope: !275)
!280 = !DILocation(line: 166, column: 17, scope: !245)
!281 = !DILocation(line: 168, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !275, file: !15, line: 167, column: 13)
!283 = !DILocation(line: 168, column: 24, scope: !282)
!284 = !DILocation(line: 168, column: 30, scope: !282)
!285 = !DILocation(line: 170, column: 23, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !15, line: 170, column: 17)
!287 = !DILocation(line: 170, column: 21, scope: !286)
!288 = !DILocation(line: 170, column: 28, scope: !289)
!289 = distinct !DILexicalBlock(scope: !286, file: !15, line: 170, column: 17)
!290 = !DILocation(line: 170, column: 30, scope: !289)
!291 = !DILocation(line: 170, column: 17, scope: !286)
!292 = !DILocation(line: 172, column: 34, scope: !293)
!293 = distinct !DILexicalBlock(scope: !289, file: !15, line: 171, column: 17)
!294 = !DILocation(line: 172, column: 41, scope: !293)
!295 = !DILocation(line: 172, column: 21, scope: !293)
!296 = !DILocation(line: 173, column: 17, scope: !293)
!297 = !DILocation(line: 170, column: 37, scope: !289)
!298 = !DILocation(line: 170, column: 17, scope: !289)
!299 = distinct !{!299, !291, !300, !82}
!300 = !DILocation(line: 173, column: 17, scope: !286)
!301 = !DILocation(line: 174, column: 13, scope: !282)
!302 = !DILocation(line: 177, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !275, file: !15, line: 176, column: 13)
!304 = !DILocation(line: 179, column: 18, scope: !245)
!305 = !DILocation(line: 179, column: 13, scope: !245)
!306 = !DILocation(line: 181, column: 5, scope: !246)
!307 = !DILocalVariable(name: "i", scope: !308, file: !15, line: 185, type: !5)
!308 = distinct !DILexicalBlock(scope: !309, file: !15, line: 184, column: 9)
!309 = distinct !DILexicalBlock(scope: !242, file: !15, line: 183, column: 5)
!310 = !DILocation(line: 185, column: 17, scope: !308)
!311 = !DILocalVariable(name: "buffer", scope: !308, file: !15, line: 186, type: !4)
!312 = !DILocation(line: 186, column: 19, scope: !308)
!313 = !DILocation(line: 186, column: 35, scope: !308)
!314 = !DILocation(line: 186, column: 28, scope: !308)
!315 = !DILocation(line: 187, column: 17, scope: !316)
!316 = distinct !DILexicalBlock(scope: !308, file: !15, line: 187, column: 17)
!317 = !DILocation(line: 187, column: 24, scope: !316)
!318 = !DILocation(line: 187, column: 17, scope: !308)
!319 = !DILocation(line: 187, column: 34, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !15, line: 187, column: 33)
!321 = !DILocation(line: 189, column: 20, scope: !322)
!322 = distinct !DILexicalBlock(scope: !308, file: !15, line: 189, column: 13)
!323 = !DILocation(line: 189, column: 18, scope: !322)
!324 = !DILocation(line: 189, column: 25, scope: !325)
!325 = distinct !DILexicalBlock(scope: !322, file: !15, line: 189, column: 13)
!326 = !DILocation(line: 189, column: 27, scope: !325)
!327 = !DILocation(line: 189, column: 13, scope: !322)
!328 = !DILocation(line: 191, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !15, line: 190, column: 13)
!330 = !DILocation(line: 191, column: 24, scope: !329)
!331 = !DILocation(line: 191, column: 27, scope: !329)
!332 = !DILocation(line: 192, column: 13, scope: !329)
!333 = !DILocation(line: 189, column: 34, scope: !325)
!334 = !DILocation(line: 189, column: 13, scope: !325)
!335 = distinct !{!335, !327, !336, !82}
!336 = !DILocation(line: 192, column: 13, scope: !322)
!337 = !DILocation(line: 194, column: 17, scope: !338)
!338 = distinct !DILexicalBlock(scope: !308, file: !15, line: 194, column: 17)
!339 = !DILocation(line: 194, column: 22, scope: !338)
!340 = !DILocation(line: 194, column: 27, scope: !338)
!341 = !DILocation(line: 194, column: 30, scope: !338)
!342 = !DILocation(line: 194, column: 35, scope: !338)
!343 = !DILocation(line: 194, column: 17, scope: !308)
!344 = !DILocation(line: 196, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !338, file: !15, line: 195, column: 13)
!346 = !DILocation(line: 196, column: 24, scope: !345)
!347 = !DILocation(line: 196, column: 30, scope: !345)
!348 = !DILocation(line: 198, column: 23, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !15, line: 198, column: 17)
!350 = !DILocation(line: 198, column: 21, scope: !349)
!351 = !DILocation(line: 198, column: 28, scope: !352)
!352 = distinct !DILexicalBlock(scope: !349, file: !15, line: 198, column: 17)
!353 = !DILocation(line: 198, column: 30, scope: !352)
!354 = !DILocation(line: 198, column: 17, scope: !349)
!355 = !DILocation(line: 200, column: 34, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !15, line: 199, column: 17)
!357 = !DILocation(line: 200, column: 41, scope: !356)
!358 = !DILocation(line: 200, column: 21, scope: !356)
!359 = !DILocation(line: 201, column: 17, scope: !356)
!360 = !DILocation(line: 198, column: 37, scope: !352)
!361 = !DILocation(line: 198, column: 17, scope: !352)
!362 = distinct !{!362, !354, !363, !82}
!363 = !DILocation(line: 201, column: 17, scope: !349)
!364 = !DILocation(line: 202, column: 13, scope: !345)
!365 = !DILocation(line: 205, column: 17, scope: !366)
!366 = distinct !DILexicalBlock(scope: !338, file: !15, line: 204, column: 13)
!367 = !DILocation(line: 207, column: 18, scope: !308)
!368 = !DILocation(line: 207, column: 13, scope: !308)
!369 = !DILocation(line: 210, column: 1, scope: !199)
!370 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 215, type: !16, scopeLine: 216, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!371 = !DILocalVariable(name: "data", scope: !370, file: !15, line: 217, type: !5)
!372 = !DILocation(line: 217, column: 9, scope: !370)
!373 = !DILocation(line: 219, column: 10, scope: !370)
!374 = !DILocation(line: 220, column: 8, scope: !375)
!375 = distinct !DILexicalBlock(scope: !370, file: !15, line: 220, column: 8)
!376 = !DILocation(line: 220, column: 8, scope: !370)
!377 = !DILocation(line: 224, column: 14, scope: !378)
!378 = distinct !DILexicalBlock(scope: !375, file: !15, line: 221, column: 5)
!379 = !DILocation(line: 225, column: 5, scope: !378)
!380 = !DILocation(line: 230, column: 14, scope: !381)
!381 = distinct !DILexicalBlock(scope: !375, file: !15, line: 227, column: 5)
!382 = !DILocation(line: 232, column: 8, scope: !383)
!383 = distinct !DILexicalBlock(scope: !370, file: !15, line: 232, column: 8)
!384 = !DILocation(line: 232, column: 8, scope: !370)
!385 = !DILocalVariable(name: "i", scope: !386, file: !15, line: 235, type: !5)
!386 = distinct !DILexicalBlock(scope: !387, file: !15, line: 234, column: 9)
!387 = distinct !DILexicalBlock(scope: !383, file: !15, line: 233, column: 5)
!388 = !DILocation(line: 235, column: 17, scope: !386)
!389 = !DILocalVariable(name: "buffer", scope: !386, file: !15, line: 236, type: !4)
!390 = !DILocation(line: 236, column: 19, scope: !386)
!391 = !DILocation(line: 236, column: 35, scope: !386)
!392 = !DILocation(line: 236, column: 28, scope: !386)
!393 = !DILocation(line: 237, column: 17, scope: !394)
!394 = distinct !DILexicalBlock(scope: !386, file: !15, line: 237, column: 17)
!395 = !DILocation(line: 237, column: 24, scope: !394)
!396 = !DILocation(line: 237, column: 17, scope: !386)
!397 = !DILocation(line: 237, column: 34, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !15, line: 237, column: 33)
!399 = !DILocation(line: 239, column: 20, scope: !400)
!400 = distinct !DILexicalBlock(scope: !386, file: !15, line: 239, column: 13)
!401 = !DILocation(line: 239, column: 18, scope: !400)
!402 = !DILocation(line: 239, column: 25, scope: !403)
!403 = distinct !DILexicalBlock(scope: !400, file: !15, line: 239, column: 13)
!404 = !DILocation(line: 239, column: 27, scope: !403)
!405 = !DILocation(line: 239, column: 13, scope: !400)
!406 = !DILocation(line: 241, column: 17, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !15, line: 240, column: 13)
!408 = !DILocation(line: 241, column: 24, scope: !407)
!409 = !DILocation(line: 241, column: 27, scope: !407)
!410 = !DILocation(line: 242, column: 13, scope: !407)
!411 = !DILocation(line: 239, column: 34, scope: !403)
!412 = !DILocation(line: 239, column: 13, scope: !403)
!413 = distinct !{!413, !405, !414, !82}
!414 = !DILocation(line: 242, column: 13, scope: !400)
!415 = !DILocation(line: 245, column: 17, scope: !416)
!416 = distinct !DILexicalBlock(scope: !386, file: !15, line: 245, column: 17)
!417 = !DILocation(line: 245, column: 22, scope: !416)
!418 = !DILocation(line: 245, column: 17, scope: !386)
!419 = !DILocation(line: 247, column: 17, scope: !420)
!420 = distinct !DILexicalBlock(scope: !416, file: !15, line: 246, column: 13)
!421 = !DILocation(line: 247, column: 24, scope: !420)
!422 = !DILocation(line: 247, column: 30, scope: !420)
!423 = !DILocation(line: 249, column: 23, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !15, line: 249, column: 17)
!425 = !DILocation(line: 249, column: 21, scope: !424)
!426 = !DILocation(line: 249, column: 28, scope: !427)
!427 = distinct !DILexicalBlock(scope: !424, file: !15, line: 249, column: 17)
!428 = !DILocation(line: 249, column: 30, scope: !427)
!429 = !DILocation(line: 249, column: 17, scope: !424)
!430 = !DILocation(line: 251, column: 34, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !15, line: 250, column: 17)
!432 = !DILocation(line: 251, column: 41, scope: !431)
!433 = !DILocation(line: 251, column: 21, scope: !431)
!434 = !DILocation(line: 252, column: 17, scope: !431)
!435 = !DILocation(line: 249, column: 37, scope: !427)
!436 = !DILocation(line: 249, column: 17, scope: !427)
!437 = distinct !{!437, !429, !438, !82}
!438 = !DILocation(line: 252, column: 17, scope: !424)
!439 = !DILocation(line: 253, column: 13, scope: !420)
!440 = !DILocation(line: 256, column: 17, scope: !441)
!441 = distinct !DILexicalBlock(scope: !416, file: !15, line: 255, column: 13)
!442 = !DILocation(line: 258, column: 18, scope: !386)
!443 = !DILocation(line: 258, column: 13, scope: !386)
!444 = !DILocation(line: 260, column: 5, scope: !387)
!445 = !DILocalVariable(name: "i", scope: !446, file: !15, line: 264, type: !5)
!446 = distinct !DILexicalBlock(scope: !447, file: !15, line: 263, column: 9)
!447 = distinct !DILexicalBlock(scope: !383, file: !15, line: 262, column: 5)
!448 = !DILocation(line: 264, column: 17, scope: !446)
!449 = !DILocalVariable(name: "buffer", scope: !446, file: !15, line: 265, type: !4)
!450 = !DILocation(line: 265, column: 19, scope: !446)
!451 = !DILocation(line: 265, column: 35, scope: !446)
!452 = !DILocation(line: 265, column: 28, scope: !446)
!453 = !DILocation(line: 266, column: 17, scope: !454)
!454 = distinct !DILexicalBlock(scope: !446, file: !15, line: 266, column: 17)
!455 = !DILocation(line: 266, column: 24, scope: !454)
!456 = !DILocation(line: 266, column: 17, scope: !446)
!457 = !DILocation(line: 266, column: 34, scope: !458)
!458 = distinct !DILexicalBlock(scope: !454, file: !15, line: 266, column: 33)
!459 = !DILocation(line: 268, column: 20, scope: !460)
!460 = distinct !DILexicalBlock(scope: !446, file: !15, line: 268, column: 13)
!461 = !DILocation(line: 268, column: 18, scope: !460)
!462 = !DILocation(line: 268, column: 25, scope: !463)
!463 = distinct !DILexicalBlock(scope: !460, file: !15, line: 268, column: 13)
!464 = !DILocation(line: 268, column: 27, scope: !463)
!465 = !DILocation(line: 268, column: 13, scope: !460)
!466 = !DILocation(line: 270, column: 17, scope: !467)
!467 = distinct !DILexicalBlock(scope: !463, file: !15, line: 269, column: 13)
!468 = !DILocation(line: 270, column: 24, scope: !467)
!469 = !DILocation(line: 270, column: 27, scope: !467)
!470 = !DILocation(line: 271, column: 13, scope: !467)
!471 = !DILocation(line: 268, column: 34, scope: !463)
!472 = !DILocation(line: 268, column: 13, scope: !463)
!473 = distinct !{!473, !465, !474, !82}
!474 = !DILocation(line: 271, column: 13, scope: !460)
!475 = !DILocation(line: 274, column: 17, scope: !476)
!476 = distinct !DILexicalBlock(scope: !446, file: !15, line: 274, column: 17)
!477 = !DILocation(line: 274, column: 22, scope: !476)
!478 = !DILocation(line: 274, column: 17, scope: !446)
!479 = !DILocation(line: 276, column: 17, scope: !480)
!480 = distinct !DILexicalBlock(scope: !476, file: !15, line: 275, column: 13)
!481 = !DILocation(line: 276, column: 24, scope: !480)
!482 = !DILocation(line: 276, column: 30, scope: !480)
!483 = !DILocation(line: 278, column: 23, scope: !484)
!484 = distinct !DILexicalBlock(scope: !480, file: !15, line: 278, column: 17)
!485 = !DILocation(line: 278, column: 21, scope: !484)
!486 = !DILocation(line: 278, column: 28, scope: !487)
!487 = distinct !DILexicalBlock(scope: !484, file: !15, line: 278, column: 17)
!488 = !DILocation(line: 278, column: 30, scope: !487)
!489 = !DILocation(line: 278, column: 17, scope: !484)
!490 = !DILocation(line: 280, column: 34, scope: !491)
!491 = distinct !DILexicalBlock(scope: !487, file: !15, line: 279, column: 17)
!492 = !DILocation(line: 280, column: 41, scope: !491)
!493 = !DILocation(line: 280, column: 21, scope: !491)
!494 = !DILocation(line: 281, column: 17, scope: !491)
!495 = !DILocation(line: 278, column: 37, scope: !487)
!496 = !DILocation(line: 278, column: 17, scope: !487)
!497 = distinct !{!497, !489, !498, !82}
!498 = !DILocation(line: 281, column: 17, scope: !484)
!499 = !DILocation(line: 282, column: 13, scope: !480)
!500 = !DILocation(line: 285, column: 17, scope: !501)
!501 = distinct !DILexicalBlock(scope: !476, file: !15, line: 284, column: 13)
!502 = !DILocation(line: 287, column: 18, scope: !446)
!503 = !DILocation(line: 287, column: 13, scope: !446)
!504 = !DILocation(line: 290, column: 1, scope: !370)
