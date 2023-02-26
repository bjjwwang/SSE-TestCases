; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i12 = alloca i32, align 4
  %buffer13 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.else, !dbg !22

if.then:                                          ; preds = %entry
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !23
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !25
  br label %if.end, !dbg !26

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !27
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call2 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool3 = icmp ne i32 %call2, 0, !dbg !29
  br i1 %tobool3, label %if.then4, label %if.else11, !dbg !31

if.then4:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !36, metadata !DIExpression()), !dbg !40
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !40
  %2 = load i32, i32* %data, align 4, !dbg !41
  %cmp = icmp sge i32 %2, 0, !dbg !43
  br i1 %cmp, label %if.then5, label %if.else9, !dbg !44

if.then5:                                         ; preds = %if.then4
  %3 = load i32, i32* %data, align 4, !dbg !45
  %idxprom = sext i32 %3 to i64, !dbg !47
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !47
  store i32 1, i32* %arrayidx, align 4, !dbg !48
  store i32 0, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.then5
  %4 = load i32, i32* %i, align 4, !dbg !52
  %cmp6 = icmp slt i32 %4, 10, !dbg !54
  br i1 %cmp6, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !56
  %idxprom7 = sext i32 %5 to i64, !dbg !58
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !58
  %6 = load i32, i32* %arrayidx8, align 4, !dbg !58
  call void @printIntLine(i32 noundef %6), !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !61
  %inc = add nsw i32 %7, 1, !dbg !61
  store i32 %inc, i32* %i, align 4, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !66

if.else9:                                         ; preds = %if.then4
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  br label %if.end29, !dbg !69

if.else11:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i12, metadata !70, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer13, metadata !74, metadata !DIExpression()), !dbg !75
  %8 = bitcast [10 x i32]* %buffer13 to i8*, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !75
  %9 = load i32, i32* %data, align 4, !dbg !76
  %cmp14 = icmp sge i32 %9, 0, !dbg !78
  br i1 %cmp14, label %land.lhs.true, label %if.else27, !dbg !79

land.lhs.true:                                    ; preds = %if.else11
  %10 = load i32, i32* %data, align 4, !dbg !80
  %cmp15 = icmp slt i32 %10, 10, !dbg !81
  br i1 %cmp15, label %if.then16, label %if.else27, !dbg !82

if.then16:                                        ; preds = %land.lhs.true
  %11 = load i32, i32* %data, align 4, !dbg !83
  %idxprom17 = sext i32 %11 to i64, !dbg !85
  %arrayidx18 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer13, i64 0, i64 %idxprom17, !dbg !85
  store i32 1, i32* %arrayidx18, align 4, !dbg !86
  store i32 0, i32* %i12, align 4, !dbg !87
  br label %for.cond19, !dbg !89

for.cond19:                                       ; preds = %for.inc24, %if.then16
  %12 = load i32, i32* %i12, align 4, !dbg !90
  %cmp20 = icmp slt i32 %12, 10, !dbg !92
  br i1 %cmp20, label %for.body21, label %for.end26, !dbg !93

for.body21:                                       ; preds = %for.cond19
  %13 = load i32, i32* %i12, align 4, !dbg !94
  %idxprom22 = sext i32 %13 to i64, !dbg !96
  %arrayidx23 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer13, i64 0, i64 %idxprom22, !dbg !96
  %14 = load i32, i32* %arrayidx23, align 4, !dbg !96
  call void @printIntLine(i32 noundef %14), !dbg !97
  br label %for.inc24, !dbg !98

for.inc24:                                        ; preds = %for.body21
  %15 = load i32, i32* %i12, align 4, !dbg !99
  %inc25 = add nsw i32 %15, 1, !dbg !99
  store i32 %inc25, i32* %i12, align 4, !dbg !99
  br label %for.cond19, !dbg !100, !llvm.loop !101

for.end26:                                        ; preds = %for.cond19
  br label %if.end28, !dbg !103

if.else27:                                        ; preds = %land.lhs.true, %if.else11
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  br label %if.end28

if.end28:                                         ; preds = %if.else27, %for.end26
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %if.end10
  ret void, !dbg !106
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_12_good() #0 !dbg !107 {
entry:
  call void @goodB2G(), !dbg !108
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
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !124
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_12_good(), !dbg !125
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !126
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !127
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_12_bad(), !dbg !128
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !129
  ret i32 0, !dbg !130
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !131 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i14 = alloca i32, align 4
  %buffer15 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !132, metadata !DIExpression()), !dbg !133
  store i32 -1, i32* %data, align 4, !dbg !134
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !135
  %tobool = icmp ne i32 %call, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.else, !dbg !137

if.then:                                          ; preds = %entry
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !138
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !140
  br label %if.end, !dbg !141

if.else:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !142
  %call2 = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !144
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call3 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !145
  %tobool4 = icmp ne i32 %call3, 0, !dbg !145
  br i1 %tobool4, label %if.then5, label %if.else13, !dbg !147

if.then5:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !152, metadata !DIExpression()), !dbg !153
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !153
  %3 = load i32, i32* %data, align 4, !dbg !154
  %cmp = icmp sge i32 %3, 0, !dbg !156
  br i1 %cmp, label %land.lhs.true, label %if.else11, !dbg !157

land.lhs.true:                                    ; preds = %if.then5
  %4 = load i32, i32* %data, align 4, !dbg !158
  %cmp6 = icmp slt i32 %4, 10, !dbg !159
  br i1 %cmp6, label %if.then7, label %if.else11, !dbg !160

if.then7:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !161
  %idxprom = sext i32 %5 to i64, !dbg !163
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !163
  store i32 1, i32* %arrayidx, align 4, !dbg !164
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.then7
  %6 = load i32, i32* %i, align 4, !dbg !168
  %cmp8 = icmp slt i32 %6, 10, !dbg !170
  br i1 %cmp8, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !172
  %idxprom9 = sext i32 %7 to i64, !dbg !174
  %arrayidx10 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom9, !dbg !174
  %8 = load i32, i32* %arrayidx10, align 4, !dbg !174
  call void @printIntLine(i32 noundef %8), !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !177
  %inc = add nsw i32 %9, 1, !dbg !177
  store i32 %inc, i32* %i, align 4, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  br label %if.end12, !dbg !181

if.else11:                                        ; preds = %land.lhs.true, %if.then5
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !182
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %for.end
  br label %if.end32, !dbg !184

if.else13:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i14, metadata !185, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer15, metadata !189, metadata !DIExpression()), !dbg !190
  %10 = bitcast [10 x i32]* %buffer15 to i8*, !dbg !190
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !190
  %11 = load i32, i32* %data, align 4, !dbg !191
  %cmp16 = icmp sge i32 %11, 0, !dbg !193
  br i1 %cmp16, label %land.lhs.true17, label %if.else30, !dbg !194

land.lhs.true17:                                  ; preds = %if.else13
  %12 = load i32, i32* %data, align 4, !dbg !195
  %cmp18 = icmp slt i32 %12, 10, !dbg !196
  br i1 %cmp18, label %if.then19, label %if.else30, !dbg !197

if.then19:                                        ; preds = %land.lhs.true17
  %13 = load i32, i32* %data, align 4, !dbg !198
  %idxprom20 = sext i32 %13 to i64, !dbg !200
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer15, i64 0, i64 %idxprom20, !dbg !200
  store i32 1, i32* %arrayidx21, align 4, !dbg !201
  store i32 0, i32* %i14, align 4, !dbg !202
  br label %for.cond22, !dbg !204

for.cond22:                                       ; preds = %for.inc27, %if.then19
  %14 = load i32, i32* %i14, align 4, !dbg !205
  %cmp23 = icmp slt i32 %14, 10, !dbg !207
  br i1 %cmp23, label %for.body24, label %for.end29, !dbg !208

for.body24:                                       ; preds = %for.cond22
  %15 = load i32, i32* %i14, align 4, !dbg !209
  %idxprom25 = sext i32 %15 to i64, !dbg !211
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer15, i64 0, i64 %idxprom25, !dbg !211
  %16 = load i32, i32* %arrayidx26, align 4, !dbg !211
  call void @printIntLine(i32 noundef %16), !dbg !212
  br label %for.inc27, !dbg !213

for.inc27:                                        ; preds = %for.body24
  %17 = load i32, i32* %i14, align 4, !dbg !214
  %inc28 = add nsw i32 %17, 1, !dbg !214
  store i32 %inc28, i32* %i14, align 4, !dbg !214
  br label %for.cond22, !dbg !215, !llvm.loop !216

for.end29:                                        ; preds = %for.cond22
  br label %if.end31, !dbg !218

if.else30:                                        ; preds = %land.lhs.true17, %if.else13
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !219
  br label %if.end31

if.end31:                                         ; preds = %if.else30, %for.end29
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end12
  ret void, !dbg !221
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !222 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i11 = alloca i32, align 4
  %buffer12 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !223, metadata !DIExpression()), !dbg !224
  store i32 -1, i32* %data, align 4, !dbg !225
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !226
  %tobool = icmp ne i32 %call, 0, !dbg !226
  br i1 %tobool, label %if.then, label %if.else, !dbg !228

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !229
  br label %if.end, !dbg !231

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !232
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !234
  %tobool2 = icmp ne i32 %call1, 0, !dbg !234
  br i1 %tobool2, label %if.then3, label %if.else10, !dbg !236

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !237, metadata !DIExpression()), !dbg !240
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !241, metadata !DIExpression()), !dbg !242
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !242
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !242
  %1 = load i32, i32* %data, align 4, !dbg !243
  %cmp = icmp sge i32 %1, 0, !dbg !245
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !246

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !247
  %idxprom = sext i32 %2 to i64, !dbg !249
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !249
  store i32 1, i32* %arrayidx, align 4, !dbg !250
  store i32 0, i32* %i, align 4, !dbg !251
  br label %for.cond, !dbg !253

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !254
  %cmp5 = icmp slt i32 %3, 10, !dbg !256
  br i1 %cmp5, label %for.body, label %for.end, !dbg !257

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !258
  %idxprom6 = sext i32 %4 to i64, !dbg !260
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !260
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !260
  call void @printIntLine(i32 noundef %5), !dbg !261
  br label %for.inc, !dbg !262

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !263
  %inc = add nsw i32 %6, 1, !dbg !263
  store i32 %inc, i32* %i, align 4, !dbg !263
  br label %for.cond, !dbg !264, !llvm.loop !265

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !267

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !268
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end27, !dbg !270

if.else10:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i11, metadata !271, metadata !DIExpression()), !dbg !274
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer12, metadata !275, metadata !DIExpression()), !dbg !276
  %7 = bitcast [10 x i32]* %buffer12 to i8*, !dbg !276
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !276
  %8 = load i32, i32* %data, align 4, !dbg !277
  %cmp13 = icmp sge i32 %8, 0, !dbg !279
  br i1 %cmp13, label %if.then14, label %if.else25, !dbg !280

if.then14:                                        ; preds = %if.else10
  %9 = load i32, i32* %data, align 4, !dbg !281
  %idxprom15 = sext i32 %9 to i64, !dbg !283
  %arrayidx16 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom15, !dbg !283
  store i32 1, i32* %arrayidx16, align 4, !dbg !284
  store i32 0, i32* %i11, align 4, !dbg !285
  br label %for.cond17, !dbg !287

for.cond17:                                       ; preds = %for.inc22, %if.then14
  %10 = load i32, i32* %i11, align 4, !dbg !288
  %cmp18 = icmp slt i32 %10, 10, !dbg !290
  br i1 %cmp18, label %for.body19, label %for.end24, !dbg !291

for.body19:                                       ; preds = %for.cond17
  %11 = load i32, i32* %i11, align 4, !dbg !292
  %idxprom20 = sext i32 %11 to i64, !dbg !294
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom20, !dbg !294
  %12 = load i32, i32* %arrayidx21, align 4, !dbg !294
  call void @printIntLine(i32 noundef %12), !dbg !295
  br label %for.inc22, !dbg !296

for.inc22:                                        ; preds = %for.body19
  %13 = load i32, i32* %i11, align 4, !dbg !297
  %inc23 = add nsw i32 %13, 1, !dbg !297
  store i32 %inc23, i32* %i11, align 4, !dbg !297
  br label %for.cond17, !dbg !298, !llvm.loop !299

for.end24:                                        ; preds = %for.cond17
  br label %if.end26, !dbg !301

if.else25:                                        ; preds = %if.else10
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !302
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %for.end24
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end9
  ret void, !dbg !304
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_12_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 24, column: 9, scope: !11)
!19 = !DILocation(line: 26, column: 10, scope: !11)
!20 = !DILocation(line: 27, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 8)
!22 = !DILocation(line: 27, column: 8, scope: !11)
!23 = !DILocation(line: 30, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !12, line: 28, column: 5)
!25 = !DILocation(line: 30, column: 9, scope: !24)
!26 = !DILocation(line: 31, column: 5, scope: !24)
!27 = !DILocation(line: 36, column: 14, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !12, line: 33, column: 5)
!29 = !DILocation(line: 38, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 8)
!31 = !DILocation(line: 38, column: 8, scope: !11)
!32 = !DILocalVariable(name: "i", scope: !33, file: !12, line: 41, type: !17)
!33 = distinct !DILexicalBlock(scope: !34, file: !12, line: 40, column: 9)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 39, column: 5)
!35 = !DILocation(line: 41, column: 17, scope: !33)
!36 = !DILocalVariable(name: "buffer", scope: !33, file: !12, line: 42, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 10)
!40 = !DILocation(line: 42, column: 17, scope: !33)
!41 = !DILocation(line: 45, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !33, file: !12, line: 45, column: 17)
!43 = !DILocation(line: 45, column: 22, scope: !42)
!44 = !DILocation(line: 45, column: 17, scope: !33)
!45 = !DILocation(line: 47, column: 24, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 46, column: 13)
!47 = !DILocation(line: 47, column: 17, scope: !46)
!48 = !DILocation(line: 47, column: 30, scope: !46)
!49 = !DILocation(line: 49, column: 23, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 49, column: 17)
!51 = !DILocation(line: 49, column: 21, scope: !50)
!52 = !DILocation(line: 49, column: 28, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 49, column: 17)
!54 = !DILocation(line: 49, column: 30, scope: !53)
!55 = !DILocation(line: 49, column: 17, scope: !50)
!56 = !DILocation(line: 51, column: 41, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 50, column: 17)
!58 = !DILocation(line: 51, column: 34, scope: !57)
!59 = !DILocation(line: 51, column: 21, scope: !57)
!60 = !DILocation(line: 52, column: 17, scope: !57)
!61 = !DILocation(line: 49, column: 37, scope: !53)
!62 = !DILocation(line: 49, column: 17, scope: !53)
!63 = distinct !{!63, !55, !64, !65}
!64 = !DILocation(line: 52, column: 17, scope: !50)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 53, column: 13, scope: !46)
!67 = !DILocation(line: 56, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !42, file: !12, line: 55, column: 13)
!69 = !DILocation(line: 59, column: 5, scope: !34)
!70 = !DILocalVariable(name: "i", scope: !71, file: !12, line: 63, type: !17)
!71 = distinct !DILexicalBlock(scope: !72, file: !12, line: 62, column: 9)
!72 = distinct !DILexicalBlock(scope: !30, file: !12, line: 61, column: 5)
!73 = !DILocation(line: 63, column: 17, scope: !71)
!74 = !DILocalVariable(name: "buffer", scope: !71, file: !12, line: 64, type: !37)
!75 = !DILocation(line: 64, column: 17, scope: !71)
!76 = !DILocation(line: 66, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !71, file: !12, line: 66, column: 17)
!78 = !DILocation(line: 66, column: 22, scope: !77)
!79 = !DILocation(line: 66, column: 27, scope: !77)
!80 = !DILocation(line: 66, column: 30, scope: !77)
!81 = !DILocation(line: 66, column: 35, scope: !77)
!82 = !DILocation(line: 66, column: 17, scope: !71)
!83 = !DILocation(line: 68, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !12, line: 67, column: 13)
!85 = !DILocation(line: 68, column: 17, scope: !84)
!86 = !DILocation(line: 68, column: 30, scope: !84)
!87 = !DILocation(line: 70, column: 23, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !12, line: 70, column: 17)
!89 = !DILocation(line: 70, column: 21, scope: !88)
!90 = !DILocation(line: 70, column: 28, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !12, line: 70, column: 17)
!92 = !DILocation(line: 70, column: 30, scope: !91)
!93 = !DILocation(line: 70, column: 17, scope: !88)
!94 = !DILocation(line: 72, column: 41, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !12, line: 71, column: 17)
!96 = !DILocation(line: 72, column: 34, scope: !95)
!97 = !DILocation(line: 72, column: 21, scope: !95)
!98 = !DILocation(line: 73, column: 17, scope: !95)
!99 = !DILocation(line: 70, column: 37, scope: !91)
!100 = !DILocation(line: 70, column: 17, scope: !91)
!101 = distinct !{!101, !93, !102, !65}
!102 = !DILocation(line: 73, column: 17, scope: !88)
!103 = !DILocation(line: 74, column: 13, scope: !84)
!104 = !DILocation(line: 77, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !77, file: !12, line: 76, column: 13)
!106 = !DILocation(line: 81, column: 1, scope: !11)
!107 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_12_good", scope: !12, file: !12, line: 215, type: !13, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!108 = !DILocation(line: 217, column: 5, scope: !107)
!109 = !DILocation(line: 218, column: 5, scope: !107)
!110 = !DILocation(line: 219, column: 1, scope: !107)
!111 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 230, type: !112, scopeLine: 231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!112 = !DISubroutineType(types: !113)
!113 = !{!17, !17, !114}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!117 = !DILocalVariable(name: "argc", arg: 1, scope: !111, file: !12, line: 230, type: !17)
!118 = !DILocation(line: 230, column: 14, scope: !111)
!119 = !DILocalVariable(name: "argv", arg: 2, scope: !111, file: !12, line: 230, type: !114)
!120 = !DILocation(line: 230, column: 27, scope: !111)
!121 = !DILocation(line: 233, column: 22, scope: !111)
!122 = !DILocation(line: 233, column: 12, scope: !111)
!123 = !DILocation(line: 233, column: 5, scope: !111)
!124 = !DILocation(line: 235, column: 5, scope: !111)
!125 = !DILocation(line: 236, column: 5, scope: !111)
!126 = !DILocation(line: 237, column: 5, scope: !111)
!127 = !DILocation(line: 240, column: 5, scope: !111)
!128 = !DILocation(line: 241, column: 5, scope: !111)
!129 = !DILocation(line: 242, column: 5, scope: !111)
!130 = !DILocation(line: 244, column: 5, scope: !111)
!131 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!132 = !DILocalVariable(name: "data", scope: !131, file: !12, line: 92, type: !17)
!133 = !DILocation(line: 92, column: 9, scope: !131)
!134 = !DILocation(line: 94, column: 10, scope: !131)
!135 = !DILocation(line: 95, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !12, line: 95, column: 8)
!137 = !DILocation(line: 95, column: 8, scope: !131)
!138 = !DILocation(line: 98, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 96, column: 5)
!140 = !DILocation(line: 98, column: 9, scope: !139)
!141 = !DILocation(line: 99, column: 5, scope: !139)
!142 = !DILocation(line: 103, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !12, line: 101, column: 5)
!144 = !DILocation(line: 103, column: 9, scope: !143)
!145 = !DILocation(line: 105, column: 8, scope: !146)
!146 = distinct !DILexicalBlock(scope: !131, file: !12, line: 105, column: 8)
!147 = !DILocation(line: 105, column: 8, scope: !131)
!148 = !DILocalVariable(name: "i", scope: !149, file: !12, line: 108, type: !17)
!149 = distinct !DILexicalBlock(scope: !150, file: !12, line: 107, column: 9)
!150 = distinct !DILexicalBlock(scope: !146, file: !12, line: 106, column: 5)
!151 = !DILocation(line: 108, column: 17, scope: !149)
!152 = !DILocalVariable(name: "buffer", scope: !149, file: !12, line: 109, type: !37)
!153 = !DILocation(line: 109, column: 17, scope: !149)
!154 = !DILocation(line: 111, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !12, line: 111, column: 17)
!156 = !DILocation(line: 111, column: 22, scope: !155)
!157 = !DILocation(line: 111, column: 27, scope: !155)
!158 = !DILocation(line: 111, column: 30, scope: !155)
!159 = !DILocation(line: 111, column: 35, scope: !155)
!160 = !DILocation(line: 111, column: 17, scope: !149)
!161 = !DILocation(line: 113, column: 24, scope: !162)
!162 = distinct !DILexicalBlock(scope: !155, file: !12, line: 112, column: 13)
!163 = !DILocation(line: 113, column: 17, scope: !162)
!164 = !DILocation(line: 113, column: 30, scope: !162)
!165 = !DILocation(line: 115, column: 23, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !12, line: 115, column: 17)
!167 = !DILocation(line: 115, column: 21, scope: !166)
!168 = !DILocation(line: 115, column: 28, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !12, line: 115, column: 17)
!170 = !DILocation(line: 115, column: 30, scope: !169)
!171 = !DILocation(line: 115, column: 17, scope: !166)
!172 = !DILocation(line: 117, column: 41, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !12, line: 116, column: 17)
!174 = !DILocation(line: 117, column: 34, scope: !173)
!175 = !DILocation(line: 117, column: 21, scope: !173)
!176 = !DILocation(line: 118, column: 17, scope: !173)
!177 = !DILocation(line: 115, column: 37, scope: !169)
!178 = !DILocation(line: 115, column: 17, scope: !169)
!179 = distinct !{!179, !171, !180, !65}
!180 = !DILocation(line: 118, column: 17, scope: !166)
!181 = !DILocation(line: 119, column: 13, scope: !162)
!182 = !DILocation(line: 122, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !155, file: !12, line: 121, column: 13)
!184 = !DILocation(line: 125, column: 5, scope: !150)
!185 = !DILocalVariable(name: "i", scope: !186, file: !12, line: 129, type: !17)
!186 = distinct !DILexicalBlock(scope: !187, file: !12, line: 128, column: 9)
!187 = distinct !DILexicalBlock(scope: !146, file: !12, line: 127, column: 5)
!188 = !DILocation(line: 129, column: 17, scope: !186)
!189 = !DILocalVariable(name: "buffer", scope: !186, file: !12, line: 130, type: !37)
!190 = !DILocation(line: 130, column: 17, scope: !186)
!191 = !DILocation(line: 132, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !186, file: !12, line: 132, column: 17)
!193 = !DILocation(line: 132, column: 22, scope: !192)
!194 = !DILocation(line: 132, column: 27, scope: !192)
!195 = !DILocation(line: 132, column: 30, scope: !192)
!196 = !DILocation(line: 132, column: 35, scope: !192)
!197 = !DILocation(line: 132, column: 17, scope: !186)
!198 = !DILocation(line: 134, column: 24, scope: !199)
!199 = distinct !DILexicalBlock(scope: !192, file: !12, line: 133, column: 13)
!200 = !DILocation(line: 134, column: 17, scope: !199)
!201 = !DILocation(line: 134, column: 30, scope: !199)
!202 = !DILocation(line: 136, column: 23, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !12, line: 136, column: 17)
!204 = !DILocation(line: 136, column: 21, scope: !203)
!205 = !DILocation(line: 136, column: 28, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !12, line: 136, column: 17)
!207 = !DILocation(line: 136, column: 30, scope: !206)
!208 = !DILocation(line: 136, column: 17, scope: !203)
!209 = !DILocation(line: 138, column: 41, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !12, line: 137, column: 17)
!211 = !DILocation(line: 138, column: 34, scope: !210)
!212 = !DILocation(line: 138, column: 21, scope: !210)
!213 = !DILocation(line: 139, column: 17, scope: !210)
!214 = !DILocation(line: 136, column: 37, scope: !206)
!215 = !DILocation(line: 136, column: 17, scope: !206)
!216 = distinct !{!216, !208, !217, !65}
!217 = !DILocation(line: 139, column: 17, scope: !203)
!218 = !DILocation(line: 140, column: 13, scope: !199)
!219 = !DILocation(line: 143, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !192, file: !12, line: 142, column: 13)
!221 = !DILocation(line: 147, column: 1, scope: !131)
!222 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 152, type: !13, scopeLine: 153, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!223 = !DILocalVariable(name: "data", scope: !222, file: !12, line: 154, type: !17)
!224 = !DILocation(line: 154, column: 9, scope: !222)
!225 = !DILocation(line: 156, column: 10, scope: !222)
!226 = !DILocation(line: 157, column: 8, scope: !227)
!227 = distinct !DILexicalBlock(scope: !222, file: !12, line: 157, column: 8)
!228 = !DILocation(line: 157, column: 8, scope: !222)
!229 = !DILocation(line: 161, column: 14, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !12, line: 158, column: 5)
!231 = !DILocation(line: 162, column: 5, scope: !230)
!232 = !DILocation(line: 167, column: 14, scope: !233)
!233 = distinct !DILexicalBlock(scope: !227, file: !12, line: 164, column: 5)
!234 = !DILocation(line: 169, column: 8, scope: !235)
!235 = distinct !DILexicalBlock(scope: !222, file: !12, line: 169, column: 8)
!236 = !DILocation(line: 169, column: 8, scope: !222)
!237 = !DILocalVariable(name: "i", scope: !238, file: !12, line: 172, type: !17)
!238 = distinct !DILexicalBlock(scope: !239, file: !12, line: 171, column: 9)
!239 = distinct !DILexicalBlock(scope: !235, file: !12, line: 170, column: 5)
!240 = !DILocation(line: 172, column: 17, scope: !238)
!241 = !DILocalVariable(name: "buffer", scope: !238, file: !12, line: 173, type: !37)
!242 = !DILocation(line: 173, column: 17, scope: !238)
!243 = !DILocation(line: 176, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !238, file: !12, line: 176, column: 17)
!245 = !DILocation(line: 176, column: 22, scope: !244)
!246 = !DILocation(line: 176, column: 17, scope: !238)
!247 = !DILocation(line: 178, column: 24, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !12, line: 177, column: 13)
!249 = !DILocation(line: 178, column: 17, scope: !248)
!250 = !DILocation(line: 178, column: 30, scope: !248)
!251 = !DILocation(line: 180, column: 23, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !12, line: 180, column: 17)
!253 = !DILocation(line: 180, column: 21, scope: !252)
!254 = !DILocation(line: 180, column: 28, scope: !255)
!255 = distinct !DILexicalBlock(scope: !252, file: !12, line: 180, column: 17)
!256 = !DILocation(line: 180, column: 30, scope: !255)
!257 = !DILocation(line: 180, column: 17, scope: !252)
!258 = !DILocation(line: 182, column: 41, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !12, line: 181, column: 17)
!260 = !DILocation(line: 182, column: 34, scope: !259)
!261 = !DILocation(line: 182, column: 21, scope: !259)
!262 = !DILocation(line: 183, column: 17, scope: !259)
!263 = !DILocation(line: 180, column: 37, scope: !255)
!264 = !DILocation(line: 180, column: 17, scope: !255)
!265 = distinct !{!265, !257, !266, !65}
!266 = !DILocation(line: 183, column: 17, scope: !252)
!267 = !DILocation(line: 184, column: 13, scope: !248)
!268 = !DILocation(line: 187, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !244, file: !12, line: 186, column: 13)
!270 = !DILocation(line: 190, column: 5, scope: !239)
!271 = !DILocalVariable(name: "i", scope: !272, file: !12, line: 194, type: !17)
!272 = distinct !DILexicalBlock(scope: !273, file: !12, line: 193, column: 9)
!273 = distinct !DILexicalBlock(scope: !235, file: !12, line: 192, column: 5)
!274 = !DILocation(line: 194, column: 17, scope: !272)
!275 = !DILocalVariable(name: "buffer", scope: !272, file: !12, line: 195, type: !37)
!276 = !DILocation(line: 195, column: 17, scope: !272)
!277 = !DILocation(line: 198, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !272, file: !12, line: 198, column: 17)
!279 = !DILocation(line: 198, column: 22, scope: !278)
!280 = !DILocation(line: 198, column: 17, scope: !272)
!281 = !DILocation(line: 200, column: 24, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !12, line: 199, column: 13)
!283 = !DILocation(line: 200, column: 17, scope: !282)
!284 = !DILocation(line: 200, column: 30, scope: !282)
!285 = !DILocation(line: 202, column: 23, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !12, line: 202, column: 17)
!287 = !DILocation(line: 202, column: 21, scope: !286)
!288 = !DILocation(line: 202, column: 28, scope: !289)
!289 = distinct !DILexicalBlock(scope: !286, file: !12, line: 202, column: 17)
!290 = !DILocation(line: 202, column: 30, scope: !289)
!291 = !DILocation(line: 202, column: 17, scope: !286)
!292 = !DILocation(line: 204, column: 41, scope: !293)
!293 = distinct !DILexicalBlock(scope: !289, file: !12, line: 203, column: 17)
!294 = !DILocation(line: 204, column: 34, scope: !293)
!295 = !DILocation(line: 204, column: 21, scope: !293)
!296 = !DILocation(line: 205, column: 17, scope: !293)
!297 = !DILocation(line: 202, column: 37, scope: !289)
!298 = !DILocation(line: 202, column: 17, scope: !289)
!299 = distinct !{!299, !291, !300, !65}
!300 = !DILocation(line: 205, column: 17, scope: !286)
!301 = !DILocation(line: 206, column: 13, scope: !282)
!302 = !DILocation(line: 209, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !278, file: !12, line: 208, column: 13)
!304 = !DILocation(line: 213, column: 1, scope: !222)
