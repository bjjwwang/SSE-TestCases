; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 -1, i32* %data, align 4, !dbg !22
  %0 = load i32, i32* @staticFive, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !27
  br label %if.end, !dbg !29

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp1 = icmp eq i32 %1, 5, !dbg !32
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !33

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !38, metadata !DIExpression()), !dbg !42
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !42
  %3 = load i32, i32* %data, align 4, !dbg !43
  %cmp3 = icmp sge i32 %3, 0, !dbg !45
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !46

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !47
  %idxprom = sext i32 %4 to i64, !dbg !49
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !49
  store i32 1, i32* %arrayidx, align 4, !dbg !50
  store i32 0, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !54
  %cmp5 = icmp slt i32 %5, 10, !dbg !56
  br i1 %cmp5, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !58
  %idxprom6 = sext i32 %6 to i64, !dbg !60
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !60
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !60
  call void @printIntLine(i32 noundef %7), !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !63
  %inc = add nsw i32 %8, 1, !dbg !63
  store i32 %inc, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !68

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !69
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !71

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_07_good() #0 !dbg !73 {
entry:
  call void @goodB2G1(), !dbg !74
  call void @goodB2G2(), !dbg !75
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* noundef null), !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 noundef %conv), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_07_good(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_07_bad(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !99 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %data, align 4, !dbg !102
  %0 = load i32, i32* @staticFive, align 4, !dbg !103
  %cmp = icmp eq i32 %0, 5, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !107
  br label %if.end, !dbg !109

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !110
  %cmp1 = icmp ne i32 %1, 5, !dbg !112
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !113

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !114
  br label %if.end11, !dbg !116

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !117, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !121, metadata !DIExpression()), !dbg !122
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !122
  %3 = load i32, i32* %data, align 4, !dbg !123
  %cmp3 = icmp sge i32 %3, 0, !dbg !125
  br i1 %cmp3, label %land.lhs.true, label %if.else9, !dbg !126

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !127
  %cmp4 = icmp slt i32 %4, 10, !dbg !128
  br i1 %cmp4, label %if.then5, label %if.else9, !dbg !129

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !130
  %idxprom = sext i32 %5 to i64, !dbg !132
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !132
  store i32 1, i32* %arrayidx, align 4, !dbg !133
  store i32 0, i32* %i, align 4, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !137
  %cmp6 = icmp slt i32 %6, 10, !dbg !139
  br i1 %cmp6, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !141
  %idxprom7 = sext i32 %7 to i64, !dbg !143
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !143
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !143
  call void @printIntLine(i32 noundef %8), !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !146
  %inc = add nsw i32 %9, 1, !dbg !146
  store i32 %inc, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  br label %if.end10, !dbg !150

if.else9:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !151
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %for.end
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.then2
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !154 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !155, metadata !DIExpression()), !dbg !156
  store i32 -1, i32* %data, align 4, !dbg !157
  %0 = load i32, i32* @staticFive, align 4, !dbg !158
  %cmp = icmp eq i32 %0, 5, !dbg !160
  br i1 %cmp, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !162
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !165
  %cmp1 = icmp eq i32 %1, 5, !dbg !167
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !168

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !169, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !173, metadata !DIExpression()), !dbg !174
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !174
  %3 = load i32, i32* %data, align 4, !dbg !175
  %cmp3 = icmp sge i32 %3, 0, !dbg !177
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !178

land.lhs.true:                                    ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !179
  %cmp4 = icmp slt i32 %4, 10, !dbg !180
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !181

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !182
  %idxprom = sext i32 %5 to i64, !dbg !184
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !184
  store i32 1, i32* %arrayidx, align 4, !dbg !185
  store i32 0, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.then5
  %6 = load i32, i32* %i, align 4, !dbg !189
  %cmp6 = icmp slt i32 %6, 10, !dbg !191
  br i1 %cmp6, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !193
  %idxprom7 = sext i32 %7 to i64, !dbg !195
  %arrayidx8 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !195
  %8 = load i32, i32* %arrayidx8, align 4, !dbg !195
  call void @printIntLine(i32 noundef %8), !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !198
  %inc = add nsw i32 %9, 1, !dbg !198
  store i32 %inc, i32* %i, align 4, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !202

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !203
  br label %if.end9

if.end9:                                          ; preds = %if.else, %for.end
  br label %if.end10, !dbg !205

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !206
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !207 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !208, metadata !DIExpression()), !dbg !209
  store i32 -1, i32* %data, align 4, !dbg !210
  %0 = load i32, i32* @staticFive, align 4, !dbg !211
  %cmp = icmp ne i32 %0, 5, !dbg !213
  br i1 %cmp, label %if.then, label %if.else, !dbg !214

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !215
  br label %if.end, !dbg !217

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !218
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !220
  %cmp1 = icmp eq i32 %1, 5, !dbg !222
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !223

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !224, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !228, metadata !DIExpression()), !dbg !229
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !229
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !229
  %3 = load i32, i32* %data, align 4, !dbg !230
  %cmp3 = icmp sge i32 %3, 0, !dbg !232
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !233

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !234
  %idxprom = sext i32 %4 to i64, !dbg !236
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !236
  store i32 1, i32* %arrayidx, align 4, !dbg !237
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond, !dbg !240

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !241
  %cmp5 = icmp slt i32 %5, 10, !dbg !243
  br i1 %cmp5, label %for.body, label %for.end, !dbg !244

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !245
  %idxprom6 = sext i32 %6 to i64, !dbg !247
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !247
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !247
  call void @printIntLine(i32 noundef %7), !dbg !248
  br label %for.inc, !dbg !249

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !250
  %inc = add nsw i32 %8, 1, !dbg !250
  store i32 %inc, i32* %i, align 4, !dbg !250
  br label %for.cond, !dbg !251, !llvm.loop !252

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !254

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !255
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !257

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !258
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !259 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !260, metadata !DIExpression()), !dbg !261
  store i32 -1, i32* %data, align 4, !dbg !262
  %0 = load i32, i32* @staticFive, align 4, !dbg !263
  %cmp = icmp eq i32 %0, 5, !dbg !265
  br i1 %cmp, label %if.then, label %if.end, !dbg !266

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !267
  br label %if.end, !dbg !269

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !270
  %cmp1 = icmp eq i32 %1, 5, !dbg !272
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !273

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !274, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !278, metadata !DIExpression()), !dbg !279
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !279
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !279
  %3 = load i32, i32* %data, align 4, !dbg !280
  %cmp3 = icmp sge i32 %3, 0, !dbg !282
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !283

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !284
  %idxprom = sext i32 %4 to i64, !dbg !286
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !286
  store i32 1, i32* %arrayidx, align 4, !dbg !287
  store i32 0, i32* %i, align 4, !dbg !288
  br label %for.cond, !dbg !290

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !291
  %cmp5 = icmp slt i32 %5, 10, !dbg !293
  br i1 %cmp5, label %for.body, label %for.end, !dbg !294

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !295
  %idxprom6 = sext i32 %6 to i64, !dbg !297
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !297
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !297
  call void @printIntLine(i32 noundef %7), !dbg !298
  br label %for.inc, !dbg !299

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !300
  %inc = add nsw i32 %8, 1, !dbg !300
  store i32 %inc, i32* %i, align 4, !dbg !300
  br label %for.cond, !dbg !301, !llvm.loop !302

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !304

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !305
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !307

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !308
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !7, line: 23, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0}
!7 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_07_bad", scope: !7, file: !7, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !7, line: 29, type: !8)
!21 = !DILocation(line: 29, column: 9, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 32, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !7, line: 32, column: 8)
!25 = !DILocation(line: 32, column: 18, scope: !24)
!26 = !DILocation(line: 32, column: 8, scope: !16)
!27 = !DILocation(line: 35, column: 14, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !7, line: 33, column: 5)
!29 = !DILocation(line: 36, column: 5, scope: !28)
!30 = !DILocation(line: 37, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !7, line: 37, column: 8)
!32 = !DILocation(line: 37, column: 18, scope: !31)
!33 = !DILocation(line: 37, column: 8, scope: !16)
!34 = !DILocalVariable(name: "i", scope: !35, file: !7, line: 40, type: !8)
!35 = distinct !DILexicalBlock(scope: !36, file: !7, line: 39, column: 9)
!36 = distinct !DILexicalBlock(scope: !31, file: !7, line: 38, column: 5)
!37 = !DILocation(line: 40, column: 17, scope: !35)
!38 = !DILocalVariable(name: "buffer", scope: !35, file: !7, line: 41, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 320, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 10)
!42 = !DILocation(line: 41, column: 17, scope: !35)
!43 = !DILocation(line: 44, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !35, file: !7, line: 44, column: 17)
!45 = !DILocation(line: 44, column: 22, scope: !44)
!46 = !DILocation(line: 44, column: 17, scope: !35)
!47 = !DILocation(line: 46, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !7, line: 45, column: 13)
!49 = !DILocation(line: 46, column: 17, scope: !48)
!50 = !DILocation(line: 46, column: 30, scope: !48)
!51 = !DILocation(line: 48, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !7, line: 48, column: 17)
!53 = !DILocation(line: 48, column: 21, scope: !52)
!54 = !DILocation(line: 48, column: 28, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !7, line: 48, column: 17)
!56 = !DILocation(line: 48, column: 30, scope: !55)
!57 = !DILocation(line: 48, column: 17, scope: !52)
!58 = !DILocation(line: 50, column: 41, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !7, line: 49, column: 17)
!60 = !DILocation(line: 50, column: 34, scope: !59)
!61 = !DILocation(line: 50, column: 21, scope: !59)
!62 = !DILocation(line: 51, column: 17, scope: !59)
!63 = !DILocation(line: 48, column: 37, scope: !55)
!64 = !DILocation(line: 48, column: 17, scope: !55)
!65 = distinct !{!65, !57, !66, !67}
!66 = !DILocation(line: 51, column: 17, scope: !52)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 52, column: 13, scope: !48)
!69 = !DILocation(line: 55, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !44, file: !7, line: 54, column: 13)
!71 = !DILocation(line: 58, column: 5, scope: !36)
!72 = !DILocation(line: 59, column: 1, scope: !16)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_07_good", scope: !7, file: !7, line: 215, type: !17, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!74 = !DILocation(line: 217, column: 5, scope: !73)
!75 = !DILocation(line: 218, column: 5, scope: !73)
!76 = !DILocation(line: 219, column: 5, scope: !73)
!77 = !DILocation(line: 220, column: 5, scope: !73)
!78 = !DILocation(line: 221, column: 1, scope: !73)
!79 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 232, type: !80, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!80 = !DISubroutineType(types: !81)
!81 = !{!8, !8, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !7, line: 232, type: !8)
!86 = !DILocation(line: 232, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !7, line: 232, type: !82)
!88 = !DILocation(line: 232, column: 27, scope: !79)
!89 = !DILocation(line: 235, column: 22, scope: !79)
!90 = !DILocation(line: 235, column: 12, scope: !79)
!91 = !DILocation(line: 235, column: 5, scope: !79)
!92 = !DILocation(line: 237, column: 5, scope: !79)
!93 = !DILocation(line: 238, column: 5, scope: !79)
!94 = !DILocation(line: 239, column: 5, scope: !79)
!95 = !DILocation(line: 242, column: 5, scope: !79)
!96 = !DILocation(line: 243, column: 5, scope: !79)
!97 = !DILocation(line: 244, column: 5, scope: !79)
!98 = !DILocation(line: 246, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodB2G1", scope: !7, file: !7, line: 66, type: !17, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!100 = !DILocalVariable(name: "data", scope: !99, file: !7, line: 68, type: !8)
!101 = !DILocation(line: 68, column: 9, scope: !99)
!102 = !DILocation(line: 70, column: 10, scope: !99)
!103 = !DILocation(line: 71, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !7, line: 71, column: 8)
!105 = !DILocation(line: 71, column: 18, scope: !104)
!106 = !DILocation(line: 71, column: 8, scope: !99)
!107 = !DILocation(line: 74, column: 14, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !7, line: 72, column: 5)
!109 = !DILocation(line: 75, column: 5, scope: !108)
!110 = !DILocation(line: 76, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !7, line: 76, column: 8)
!112 = !DILocation(line: 76, column: 18, scope: !111)
!113 = !DILocation(line: 76, column: 8, scope: !99)
!114 = !DILocation(line: 79, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !7, line: 77, column: 5)
!116 = !DILocation(line: 80, column: 5, scope: !115)
!117 = !DILocalVariable(name: "i", scope: !118, file: !7, line: 84, type: !8)
!118 = distinct !DILexicalBlock(scope: !119, file: !7, line: 83, column: 9)
!119 = distinct !DILexicalBlock(scope: !111, file: !7, line: 82, column: 5)
!120 = !DILocation(line: 84, column: 17, scope: !118)
!121 = !DILocalVariable(name: "buffer", scope: !118, file: !7, line: 85, type: !39)
!122 = !DILocation(line: 85, column: 17, scope: !118)
!123 = !DILocation(line: 87, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !7, line: 87, column: 17)
!125 = !DILocation(line: 87, column: 22, scope: !124)
!126 = !DILocation(line: 87, column: 27, scope: !124)
!127 = !DILocation(line: 87, column: 30, scope: !124)
!128 = !DILocation(line: 87, column: 35, scope: !124)
!129 = !DILocation(line: 87, column: 17, scope: !118)
!130 = !DILocation(line: 89, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !7, line: 88, column: 13)
!132 = !DILocation(line: 89, column: 17, scope: !131)
!133 = !DILocation(line: 89, column: 30, scope: !131)
!134 = !DILocation(line: 91, column: 23, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !7, line: 91, column: 17)
!136 = !DILocation(line: 91, column: 21, scope: !135)
!137 = !DILocation(line: 91, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !7, line: 91, column: 17)
!139 = !DILocation(line: 91, column: 30, scope: !138)
!140 = !DILocation(line: 91, column: 17, scope: !135)
!141 = !DILocation(line: 93, column: 41, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !7, line: 92, column: 17)
!143 = !DILocation(line: 93, column: 34, scope: !142)
!144 = !DILocation(line: 93, column: 21, scope: !142)
!145 = !DILocation(line: 94, column: 17, scope: !142)
!146 = !DILocation(line: 91, column: 37, scope: !138)
!147 = !DILocation(line: 91, column: 17, scope: !138)
!148 = distinct !{!148, !140, !149, !67}
!149 = !DILocation(line: 94, column: 17, scope: !135)
!150 = !DILocation(line: 95, column: 13, scope: !131)
!151 = !DILocation(line: 98, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !124, file: !7, line: 97, column: 13)
!153 = !DILocation(line: 102, column: 1, scope: !99)
!154 = distinct !DISubprogram(name: "goodB2G2", scope: !7, file: !7, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!155 = !DILocalVariable(name: "data", scope: !154, file: !7, line: 107, type: !8)
!156 = !DILocation(line: 107, column: 9, scope: !154)
!157 = !DILocation(line: 109, column: 10, scope: !154)
!158 = !DILocation(line: 110, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !7, line: 110, column: 8)
!160 = !DILocation(line: 110, column: 18, scope: !159)
!161 = !DILocation(line: 110, column: 8, scope: !154)
!162 = !DILocation(line: 113, column: 14, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !7, line: 111, column: 5)
!164 = !DILocation(line: 114, column: 5, scope: !163)
!165 = !DILocation(line: 115, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !154, file: !7, line: 115, column: 8)
!167 = !DILocation(line: 115, column: 18, scope: !166)
!168 = !DILocation(line: 115, column: 8, scope: !154)
!169 = !DILocalVariable(name: "i", scope: !170, file: !7, line: 118, type: !8)
!170 = distinct !DILexicalBlock(scope: !171, file: !7, line: 117, column: 9)
!171 = distinct !DILexicalBlock(scope: !166, file: !7, line: 116, column: 5)
!172 = !DILocation(line: 118, column: 17, scope: !170)
!173 = !DILocalVariable(name: "buffer", scope: !170, file: !7, line: 119, type: !39)
!174 = !DILocation(line: 119, column: 17, scope: !170)
!175 = !DILocation(line: 121, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !170, file: !7, line: 121, column: 17)
!177 = !DILocation(line: 121, column: 22, scope: !176)
!178 = !DILocation(line: 121, column: 27, scope: !176)
!179 = !DILocation(line: 121, column: 30, scope: !176)
!180 = !DILocation(line: 121, column: 35, scope: !176)
!181 = !DILocation(line: 121, column: 17, scope: !170)
!182 = !DILocation(line: 123, column: 24, scope: !183)
!183 = distinct !DILexicalBlock(scope: !176, file: !7, line: 122, column: 13)
!184 = !DILocation(line: 123, column: 17, scope: !183)
!185 = !DILocation(line: 123, column: 30, scope: !183)
!186 = !DILocation(line: 125, column: 23, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !7, line: 125, column: 17)
!188 = !DILocation(line: 125, column: 21, scope: !187)
!189 = !DILocation(line: 125, column: 28, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !7, line: 125, column: 17)
!191 = !DILocation(line: 125, column: 30, scope: !190)
!192 = !DILocation(line: 125, column: 17, scope: !187)
!193 = !DILocation(line: 127, column: 41, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !7, line: 126, column: 17)
!195 = !DILocation(line: 127, column: 34, scope: !194)
!196 = !DILocation(line: 127, column: 21, scope: !194)
!197 = !DILocation(line: 128, column: 17, scope: !194)
!198 = !DILocation(line: 125, column: 37, scope: !190)
!199 = !DILocation(line: 125, column: 17, scope: !190)
!200 = distinct !{!200, !192, !201, !67}
!201 = !DILocation(line: 128, column: 17, scope: !187)
!202 = !DILocation(line: 129, column: 13, scope: !183)
!203 = !DILocation(line: 132, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !176, file: !7, line: 131, column: 13)
!205 = !DILocation(line: 135, column: 5, scope: !171)
!206 = !DILocation(line: 136, column: 1, scope: !154)
!207 = distinct !DISubprogram(name: "goodG2B1", scope: !7, file: !7, line: 139, type: !17, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!208 = !DILocalVariable(name: "data", scope: !207, file: !7, line: 141, type: !8)
!209 = !DILocation(line: 141, column: 9, scope: !207)
!210 = !DILocation(line: 143, column: 10, scope: !207)
!211 = !DILocation(line: 144, column: 8, scope: !212)
!212 = distinct !DILexicalBlock(scope: !207, file: !7, line: 144, column: 8)
!213 = !DILocation(line: 144, column: 18, scope: !212)
!214 = !DILocation(line: 144, column: 8, scope: !207)
!215 = !DILocation(line: 147, column: 9, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !7, line: 145, column: 5)
!217 = !DILocation(line: 148, column: 5, scope: !216)
!218 = !DILocation(line: 153, column: 14, scope: !219)
!219 = distinct !DILexicalBlock(scope: !212, file: !7, line: 150, column: 5)
!220 = !DILocation(line: 155, column: 8, scope: !221)
!221 = distinct !DILexicalBlock(scope: !207, file: !7, line: 155, column: 8)
!222 = !DILocation(line: 155, column: 18, scope: !221)
!223 = !DILocation(line: 155, column: 8, scope: !207)
!224 = !DILocalVariable(name: "i", scope: !225, file: !7, line: 158, type: !8)
!225 = distinct !DILexicalBlock(scope: !226, file: !7, line: 157, column: 9)
!226 = distinct !DILexicalBlock(scope: !221, file: !7, line: 156, column: 5)
!227 = !DILocation(line: 158, column: 17, scope: !225)
!228 = !DILocalVariable(name: "buffer", scope: !225, file: !7, line: 159, type: !39)
!229 = !DILocation(line: 159, column: 17, scope: !225)
!230 = !DILocation(line: 162, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !225, file: !7, line: 162, column: 17)
!232 = !DILocation(line: 162, column: 22, scope: !231)
!233 = !DILocation(line: 162, column: 17, scope: !225)
!234 = !DILocation(line: 164, column: 24, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !7, line: 163, column: 13)
!236 = !DILocation(line: 164, column: 17, scope: !235)
!237 = !DILocation(line: 164, column: 30, scope: !235)
!238 = !DILocation(line: 166, column: 23, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !7, line: 166, column: 17)
!240 = !DILocation(line: 166, column: 21, scope: !239)
!241 = !DILocation(line: 166, column: 28, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !7, line: 166, column: 17)
!243 = !DILocation(line: 166, column: 30, scope: !242)
!244 = !DILocation(line: 166, column: 17, scope: !239)
!245 = !DILocation(line: 168, column: 41, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !7, line: 167, column: 17)
!247 = !DILocation(line: 168, column: 34, scope: !246)
!248 = !DILocation(line: 168, column: 21, scope: !246)
!249 = !DILocation(line: 169, column: 17, scope: !246)
!250 = !DILocation(line: 166, column: 37, scope: !242)
!251 = !DILocation(line: 166, column: 17, scope: !242)
!252 = distinct !{!252, !244, !253, !67}
!253 = !DILocation(line: 169, column: 17, scope: !239)
!254 = !DILocation(line: 170, column: 13, scope: !235)
!255 = !DILocation(line: 173, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !231, file: !7, line: 172, column: 13)
!257 = !DILocation(line: 176, column: 5, scope: !226)
!258 = !DILocation(line: 177, column: 1, scope: !207)
!259 = distinct !DISubprogram(name: "goodG2B2", scope: !7, file: !7, line: 180, type: !17, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!260 = !DILocalVariable(name: "data", scope: !259, file: !7, line: 182, type: !8)
!261 = !DILocation(line: 182, column: 9, scope: !259)
!262 = !DILocation(line: 184, column: 10, scope: !259)
!263 = !DILocation(line: 185, column: 8, scope: !264)
!264 = distinct !DILexicalBlock(scope: !259, file: !7, line: 185, column: 8)
!265 = !DILocation(line: 185, column: 18, scope: !264)
!266 = !DILocation(line: 185, column: 8, scope: !259)
!267 = !DILocation(line: 189, column: 14, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !7, line: 186, column: 5)
!269 = !DILocation(line: 190, column: 5, scope: !268)
!270 = !DILocation(line: 191, column: 8, scope: !271)
!271 = distinct !DILexicalBlock(scope: !259, file: !7, line: 191, column: 8)
!272 = !DILocation(line: 191, column: 18, scope: !271)
!273 = !DILocation(line: 191, column: 8, scope: !259)
!274 = !DILocalVariable(name: "i", scope: !275, file: !7, line: 194, type: !8)
!275 = distinct !DILexicalBlock(scope: !276, file: !7, line: 193, column: 9)
!276 = distinct !DILexicalBlock(scope: !271, file: !7, line: 192, column: 5)
!277 = !DILocation(line: 194, column: 17, scope: !275)
!278 = !DILocalVariable(name: "buffer", scope: !275, file: !7, line: 195, type: !39)
!279 = !DILocation(line: 195, column: 17, scope: !275)
!280 = !DILocation(line: 198, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !275, file: !7, line: 198, column: 17)
!282 = !DILocation(line: 198, column: 22, scope: !281)
!283 = !DILocation(line: 198, column: 17, scope: !275)
!284 = !DILocation(line: 200, column: 24, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !7, line: 199, column: 13)
!286 = !DILocation(line: 200, column: 17, scope: !285)
!287 = !DILocation(line: 200, column: 30, scope: !285)
!288 = !DILocation(line: 202, column: 23, scope: !289)
!289 = distinct !DILexicalBlock(scope: !285, file: !7, line: 202, column: 17)
!290 = !DILocation(line: 202, column: 21, scope: !289)
!291 = !DILocation(line: 202, column: 28, scope: !292)
!292 = distinct !DILexicalBlock(scope: !289, file: !7, line: 202, column: 17)
!293 = !DILocation(line: 202, column: 30, scope: !292)
!294 = !DILocation(line: 202, column: 17, scope: !289)
!295 = !DILocation(line: 204, column: 41, scope: !296)
!296 = distinct !DILexicalBlock(scope: !292, file: !7, line: 203, column: 17)
!297 = !DILocation(line: 204, column: 34, scope: !296)
!298 = !DILocation(line: 204, column: 21, scope: !296)
!299 = !DILocation(line: 205, column: 17, scope: !296)
!300 = !DILocation(line: 202, column: 37, scope: !292)
!301 = !DILocation(line: 202, column: 17, scope: !292)
!302 = distinct !{!302, !294, !303, !67}
!303 = !DILocation(line: 205, column: 17, scope: !289)
!304 = !DILocation(line: 206, column: 13, scope: !285)
!305 = !DILocation(line: 209, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !281, file: !7, line: 208, column: 13)
!307 = !DILocation(line: 212, column: 5, scope: !276)
!308 = !DILocation(line: 213, column: 1, scope: !259)
