; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !7
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  %0 = load i32, i32* @staticTrue, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !28
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool1 = icmp ne i32 %1, 0, !dbg !31
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !33

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !38, metadata !DIExpression()), !dbg !42
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !42
  %3 = load i32, i32* %data, align 4, !dbg !43
  %cmp = icmp sge i32 %3, 0, !dbg !45
  br i1 %cmp, label %if.then3, label %if.else, !dbg !46

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !47
  %idxprom = sext i32 %4 to i64, !dbg !49
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !49
  store i32 1, i32* %arrayidx, align 4, !dbg !50
  store i32 0, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !54
  %cmp4 = icmp slt i32 %5, 10, !dbg !56
  br i1 %cmp4, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !58
  %idxprom5 = sext i32 %6 to i64, !dbg !60
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !60
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !60
  call void @printIntLine(i32 noundef %7), !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !63
  %inc = add nsw i32 %8, 1, !dbg !63
  store i32 %inc, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !68

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !69
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !71

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_good() #0 !dbg !73 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_good(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_bad(), !dbg !96
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !103
  %tobool = icmp ne i32 %0, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !106
  br label %if.end, !dbg !108

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !109
  %tobool1 = icmp ne i32 %1, 0, !dbg !109
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !111

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !112
  br label %if.end10, !dbg !114

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !115, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !119, metadata !DIExpression()), !dbg !120
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !120
  %3 = load i32, i32* %data, align 4, !dbg !121
  %cmp = icmp sge i32 %3, 0, !dbg !123
  br i1 %cmp, label %land.lhs.true, label %if.else8, !dbg !124

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !125
  %cmp3 = icmp slt i32 %4, 10, !dbg !126
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !127

if.then4:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !128
  %idxprom = sext i32 %5 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !130
  store i32 1, i32* %arrayidx, align 4, !dbg !131
  store i32 0, i32* %i, align 4, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.then4
  %6 = load i32, i32* %i, align 4, !dbg !135
  %cmp5 = icmp slt i32 %6, 10, !dbg !137
  br i1 %cmp5, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !139
  %idxprom6 = sext i32 %7 to i64, !dbg !141
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !141
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !141
  call void @printIntLine(i32 noundef %8), !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !144
  %inc = add nsw i32 %9, 1, !dbg !144
  store i32 %inc, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !148

if.else8:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !149
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then2
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !152 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !153, metadata !DIExpression()), !dbg !154
  store i32 -1, i32* %data, align 4, !dbg !155
  %0 = load i32, i32* @staticTrue, align 4, !dbg !156
  %tobool = icmp ne i32 %0, 0, !dbg !156
  br i1 %tobool, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !159
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !162
  %tobool1 = icmp ne i32 %1, 0, !dbg !162
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !164

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !165, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !169, metadata !DIExpression()), !dbg !170
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !170
  %3 = load i32, i32* %data, align 4, !dbg !171
  %cmp = icmp sge i32 %3, 0, !dbg !173
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !174

land.lhs.true:                                    ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !175
  %cmp3 = icmp slt i32 %4, 10, !dbg !176
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !177

if.then4:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !178
  %idxprom = sext i32 %5 to i64, !dbg !180
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !180
  store i32 1, i32* %arrayidx, align 4, !dbg !181
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.then4
  %6 = load i32, i32* %i, align 4, !dbg !185
  %cmp5 = icmp slt i32 %6, 10, !dbg !187
  br i1 %cmp5, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !189
  %idxprom6 = sext i32 %7 to i64, !dbg !191
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !191
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !191
  call void @printIntLine(i32 noundef %8), !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !194
  %inc = add nsw i32 %9, 1, !dbg !194
  store i32 %inc, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !198

if.else:                                          ; preds = %land.lhs.true, %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !199
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !201

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !203 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !204, metadata !DIExpression()), !dbg !205
  store i32 -1, i32* %data, align 4, !dbg !206
  %0 = load i32, i32* @staticFalse, align 4, !dbg !207
  %tobool = icmp ne i32 %0, 0, !dbg !207
  br i1 %tobool, label %if.then, label %if.else, !dbg !209

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !210
  br label %if.end, !dbg !212

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !213
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !215
  %tobool1 = icmp ne i32 %1, 0, !dbg !215
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !217

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !218, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !222, metadata !DIExpression()), !dbg !223
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !223
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !223
  %3 = load i32, i32* %data, align 4, !dbg !224
  %cmp = icmp sge i32 %3, 0, !dbg !226
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !227

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !228
  %idxprom = sext i32 %4 to i64, !dbg !230
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !230
  store i32 1, i32* %arrayidx, align 4, !dbg !231
  store i32 0, i32* %i, align 4, !dbg !232
  br label %for.cond, !dbg !234

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !235
  %cmp4 = icmp slt i32 %5, 10, !dbg !237
  br i1 %cmp4, label %for.body, label %for.end, !dbg !238

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !239
  %idxprom5 = sext i32 %6 to i64, !dbg !241
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !241
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !241
  call void @printIntLine(i32 noundef %7), !dbg !242
  br label %for.inc, !dbg !243

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !244
  %inc = add nsw i32 %8, 1, !dbg !244
  store i32 %inc, i32* %i, align 4, !dbg !244
  br label %for.cond, !dbg !245, !llvm.loop !246

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !248

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !249
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !251

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !252
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !253 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !254, metadata !DIExpression()), !dbg !255
  store i32 -1, i32* %data, align 4, !dbg !256
  %0 = load i32, i32* @staticTrue, align 4, !dbg !257
  %tobool = icmp ne i32 %0, 0, !dbg !257
  br i1 %tobool, label %if.then, label %if.end, !dbg !259

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !260
  br label %if.end, !dbg !262

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !263
  %tobool1 = icmp ne i32 %1, 0, !dbg !263
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !265

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !266, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !270, metadata !DIExpression()), !dbg !271
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !271
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !271
  %3 = load i32, i32* %data, align 4, !dbg !272
  %cmp = icmp sge i32 %3, 0, !dbg !274
  br i1 %cmp, label %if.then3, label %if.else, !dbg !275

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !276
  %idxprom = sext i32 %4 to i64, !dbg !278
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !278
  store i32 1, i32* %arrayidx, align 4, !dbg !279
  store i32 0, i32* %i, align 4, !dbg !280
  br label %for.cond, !dbg !282

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !283
  %cmp4 = icmp slt i32 %5, 10, !dbg !285
  br i1 %cmp4, label %for.body, label %for.end, !dbg !286

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !287
  %idxprom5 = sext i32 %6 to i64, !dbg !289
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !289
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !289
  call void @printIntLine(i32 noundef %7), !dbg !290
  br label %for.inc, !dbg !291

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !292
  %inc = add nsw i32 %8, 1, !dbg !292
  store i32 %inc, i32* %i, align 4, !dbg !292
  br label %for.cond, !dbg !293, !llvm.loop !294

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !296

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !297
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !299

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !300
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !9, line: 23, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 24, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_bad", scope: !9, file: !9, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 30, type: !10)
!23 = !DILocation(line: 30, column: 9, scope: !18)
!24 = !DILocation(line: 32, column: 10, scope: !18)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !9, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 8, scope: !18)
!28 = !DILocation(line: 36, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !9, line: 34, column: 5)
!30 = !DILocation(line: 37, column: 5, scope: !29)
!31 = !DILocation(line: 38, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !9, line: 38, column: 8)
!33 = !DILocation(line: 38, column: 8, scope: !18)
!34 = !DILocalVariable(name: "i", scope: !35, file: !9, line: 41, type: !10)
!35 = distinct !DILexicalBlock(scope: !36, file: !9, line: 40, column: 9)
!36 = distinct !DILexicalBlock(scope: !32, file: !9, line: 39, column: 5)
!37 = !DILocation(line: 41, column: 17, scope: !35)
!38 = !DILocalVariable(name: "buffer", scope: !35, file: !9, line: 42, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 10)
!42 = !DILocation(line: 42, column: 17, scope: !35)
!43 = !DILocation(line: 45, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !35, file: !9, line: 45, column: 17)
!45 = !DILocation(line: 45, column: 22, scope: !44)
!46 = !DILocation(line: 45, column: 17, scope: !35)
!47 = !DILocation(line: 47, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !9, line: 46, column: 13)
!49 = !DILocation(line: 47, column: 17, scope: !48)
!50 = !DILocation(line: 47, column: 30, scope: !48)
!51 = !DILocation(line: 49, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !9, line: 49, column: 17)
!53 = !DILocation(line: 49, column: 21, scope: !52)
!54 = !DILocation(line: 49, column: 28, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !9, line: 49, column: 17)
!56 = !DILocation(line: 49, column: 30, scope: !55)
!57 = !DILocation(line: 49, column: 17, scope: !52)
!58 = !DILocation(line: 51, column: 41, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !9, line: 50, column: 17)
!60 = !DILocation(line: 51, column: 34, scope: !59)
!61 = !DILocation(line: 51, column: 21, scope: !59)
!62 = !DILocation(line: 52, column: 17, scope: !59)
!63 = !DILocation(line: 49, column: 37, scope: !55)
!64 = !DILocation(line: 49, column: 17, scope: !55)
!65 = distinct !{!65, !57, !66, !67}
!66 = !DILocation(line: 52, column: 17, scope: !52)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 53, column: 13, scope: !48)
!69 = !DILocation(line: 56, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !44, file: !9, line: 55, column: 13)
!71 = !DILocation(line: 59, column: 5, scope: !36)
!72 = !DILocation(line: 60, column: 1, scope: !18)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_05_good", scope: !9, file: !9, line: 216, type: !19, scopeLine: 217, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!74 = !DILocation(line: 218, column: 5, scope: !73)
!75 = !DILocation(line: 219, column: 5, scope: !73)
!76 = !DILocation(line: 220, column: 5, scope: !73)
!77 = !DILocation(line: 221, column: 5, scope: !73)
!78 = !DILocation(line: 222, column: 1, scope: !73)
!79 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 233, type: !80, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!80 = !DISubroutineType(types: !81)
!81 = !{!10, !10, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !9, line: 233, type: !10)
!86 = !DILocation(line: 233, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !9, line: 233, type: !82)
!88 = !DILocation(line: 233, column: 27, scope: !79)
!89 = !DILocation(line: 236, column: 22, scope: !79)
!90 = !DILocation(line: 236, column: 12, scope: !79)
!91 = !DILocation(line: 236, column: 5, scope: !79)
!92 = !DILocation(line: 238, column: 5, scope: !79)
!93 = !DILocation(line: 239, column: 5, scope: !79)
!94 = !DILocation(line: 240, column: 5, scope: !79)
!95 = !DILocation(line: 243, column: 5, scope: !79)
!96 = !DILocation(line: 244, column: 5, scope: !79)
!97 = !DILocation(line: 245, column: 5, scope: !79)
!98 = !DILocation(line: 247, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodB2G1", scope: !9, file: !9, line: 67, type: !19, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!100 = !DILocalVariable(name: "data", scope: !99, file: !9, line: 69, type: !10)
!101 = !DILocation(line: 69, column: 9, scope: !99)
!102 = !DILocation(line: 71, column: 10, scope: !99)
!103 = !DILocation(line: 72, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !9, line: 72, column: 8)
!105 = !DILocation(line: 72, column: 8, scope: !99)
!106 = !DILocation(line: 75, column: 14, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !9, line: 73, column: 5)
!108 = !DILocation(line: 76, column: 5, scope: !107)
!109 = !DILocation(line: 77, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !99, file: !9, line: 77, column: 8)
!111 = !DILocation(line: 77, column: 8, scope: !99)
!112 = !DILocation(line: 80, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !9, line: 78, column: 5)
!114 = !DILocation(line: 81, column: 5, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !9, line: 85, type: !10)
!116 = distinct !DILexicalBlock(scope: !117, file: !9, line: 84, column: 9)
!117 = distinct !DILexicalBlock(scope: !110, file: !9, line: 83, column: 5)
!118 = !DILocation(line: 85, column: 17, scope: !116)
!119 = !DILocalVariable(name: "buffer", scope: !116, file: !9, line: 86, type: !39)
!120 = !DILocation(line: 86, column: 17, scope: !116)
!121 = !DILocation(line: 88, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !9, line: 88, column: 17)
!123 = !DILocation(line: 88, column: 22, scope: !122)
!124 = !DILocation(line: 88, column: 27, scope: !122)
!125 = !DILocation(line: 88, column: 30, scope: !122)
!126 = !DILocation(line: 88, column: 35, scope: !122)
!127 = !DILocation(line: 88, column: 17, scope: !116)
!128 = !DILocation(line: 90, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !122, file: !9, line: 89, column: 13)
!130 = !DILocation(line: 90, column: 17, scope: !129)
!131 = !DILocation(line: 90, column: 30, scope: !129)
!132 = !DILocation(line: 92, column: 23, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !9, line: 92, column: 17)
!134 = !DILocation(line: 92, column: 21, scope: !133)
!135 = !DILocation(line: 92, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !9, line: 92, column: 17)
!137 = !DILocation(line: 92, column: 30, scope: !136)
!138 = !DILocation(line: 92, column: 17, scope: !133)
!139 = !DILocation(line: 94, column: 41, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !9, line: 93, column: 17)
!141 = !DILocation(line: 94, column: 34, scope: !140)
!142 = !DILocation(line: 94, column: 21, scope: !140)
!143 = !DILocation(line: 95, column: 17, scope: !140)
!144 = !DILocation(line: 92, column: 37, scope: !136)
!145 = !DILocation(line: 92, column: 17, scope: !136)
!146 = distinct !{!146, !138, !147, !67}
!147 = !DILocation(line: 95, column: 17, scope: !133)
!148 = !DILocation(line: 96, column: 13, scope: !129)
!149 = !DILocation(line: 99, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !122, file: !9, line: 98, column: 13)
!151 = !DILocation(line: 103, column: 1, scope: !99)
!152 = distinct !DISubprogram(name: "goodB2G2", scope: !9, file: !9, line: 106, type: !19, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!153 = !DILocalVariable(name: "data", scope: !152, file: !9, line: 108, type: !10)
!154 = !DILocation(line: 108, column: 9, scope: !152)
!155 = !DILocation(line: 110, column: 10, scope: !152)
!156 = !DILocation(line: 111, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !9, line: 111, column: 8)
!158 = !DILocation(line: 111, column: 8, scope: !152)
!159 = !DILocation(line: 114, column: 14, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !9, line: 112, column: 5)
!161 = !DILocation(line: 115, column: 5, scope: !160)
!162 = !DILocation(line: 116, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !152, file: !9, line: 116, column: 8)
!164 = !DILocation(line: 116, column: 8, scope: !152)
!165 = !DILocalVariable(name: "i", scope: !166, file: !9, line: 119, type: !10)
!166 = distinct !DILexicalBlock(scope: !167, file: !9, line: 118, column: 9)
!167 = distinct !DILexicalBlock(scope: !163, file: !9, line: 117, column: 5)
!168 = !DILocation(line: 119, column: 17, scope: !166)
!169 = !DILocalVariable(name: "buffer", scope: !166, file: !9, line: 120, type: !39)
!170 = !DILocation(line: 120, column: 17, scope: !166)
!171 = !DILocation(line: 122, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !166, file: !9, line: 122, column: 17)
!173 = !DILocation(line: 122, column: 22, scope: !172)
!174 = !DILocation(line: 122, column: 27, scope: !172)
!175 = !DILocation(line: 122, column: 30, scope: !172)
!176 = !DILocation(line: 122, column: 35, scope: !172)
!177 = !DILocation(line: 122, column: 17, scope: !166)
!178 = !DILocation(line: 124, column: 24, scope: !179)
!179 = distinct !DILexicalBlock(scope: !172, file: !9, line: 123, column: 13)
!180 = !DILocation(line: 124, column: 17, scope: !179)
!181 = !DILocation(line: 124, column: 30, scope: !179)
!182 = !DILocation(line: 126, column: 23, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !9, line: 126, column: 17)
!184 = !DILocation(line: 126, column: 21, scope: !183)
!185 = !DILocation(line: 126, column: 28, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !9, line: 126, column: 17)
!187 = !DILocation(line: 126, column: 30, scope: !186)
!188 = !DILocation(line: 126, column: 17, scope: !183)
!189 = !DILocation(line: 128, column: 41, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !9, line: 127, column: 17)
!191 = !DILocation(line: 128, column: 34, scope: !190)
!192 = !DILocation(line: 128, column: 21, scope: !190)
!193 = !DILocation(line: 129, column: 17, scope: !190)
!194 = !DILocation(line: 126, column: 37, scope: !186)
!195 = !DILocation(line: 126, column: 17, scope: !186)
!196 = distinct !{!196, !188, !197, !67}
!197 = !DILocation(line: 129, column: 17, scope: !183)
!198 = !DILocation(line: 130, column: 13, scope: !179)
!199 = !DILocation(line: 133, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !172, file: !9, line: 132, column: 13)
!201 = !DILocation(line: 136, column: 5, scope: !167)
!202 = !DILocation(line: 137, column: 1, scope: !152)
!203 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 140, type: !19, scopeLine: 141, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!204 = !DILocalVariable(name: "data", scope: !203, file: !9, line: 142, type: !10)
!205 = !DILocation(line: 142, column: 9, scope: !203)
!206 = !DILocation(line: 144, column: 10, scope: !203)
!207 = !DILocation(line: 145, column: 8, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !9, line: 145, column: 8)
!209 = !DILocation(line: 145, column: 8, scope: !203)
!210 = !DILocation(line: 148, column: 9, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !9, line: 146, column: 5)
!212 = !DILocation(line: 149, column: 5, scope: !211)
!213 = !DILocation(line: 154, column: 14, scope: !214)
!214 = distinct !DILexicalBlock(scope: !208, file: !9, line: 151, column: 5)
!215 = !DILocation(line: 156, column: 8, scope: !216)
!216 = distinct !DILexicalBlock(scope: !203, file: !9, line: 156, column: 8)
!217 = !DILocation(line: 156, column: 8, scope: !203)
!218 = !DILocalVariable(name: "i", scope: !219, file: !9, line: 159, type: !10)
!219 = distinct !DILexicalBlock(scope: !220, file: !9, line: 158, column: 9)
!220 = distinct !DILexicalBlock(scope: !216, file: !9, line: 157, column: 5)
!221 = !DILocation(line: 159, column: 17, scope: !219)
!222 = !DILocalVariable(name: "buffer", scope: !219, file: !9, line: 160, type: !39)
!223 = !DILocation(line: 160, column: 17, scope: !219)
!224 = !DILocation(line: 163, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !219, file: !9, line: 163, column: 17)
!226 = !DILocation(line: 163, column: 22, scope: !225)
!227 = !DILocation(line: 163, column: 17, scope: !219)
!228 = !DILocation(line: 165, column: 24, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !9, line: 164, column: 13)
!230 = !DILocation(line: 165, column: 17, scope: !229)
!231 = !DILocation(line: 165, column: 30, scope: !229)
!232 = !DILocation(line: 167, column: 23, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !9, line: 167, column: 17)
!234 = !DILocation(line: 167, column: 21, scope: !233)
!235 = !DILocation(line: 167, column: 28, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !9, line: 167, column: 17)
!237 = !DILocation(line: 167, column: 30, scope: !236)
!238 = !DILocation(line: 167, column: 17, scope: !233)
!239 = !DILocation(line: 169, column: 41, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !9, line: 168, column: 17)
!241 = !DILocation(line: 169, column: 34, scope: !240)
!242 = !DILocation(line: 169, column: 21, scope: !240)
!243 = !DILocation(line: 170, column: 17, scope: !240)
!244 = !DILocation(line: 167, column: 37, scope: !236)
!245 = !DILocation(line: 167, column: 17, scope: !236)
!246 = distinct !{!246, !238, !247, !67}
!247 = !DILocation(line: 170, column: 17, scope: !233)
!248 = !DILocation(line: 171, column: 13, scope: !229)
!249 = !DILocation(line: 174, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !225, file: !9, line: 173, column: 13)
!251 = !DILocation(line: 177, column: 5, scope: !220)
!252 = !DILocation(line: 178, column: 1, scope: !203)
!253 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 181, type: !19, scopeLine: 182, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!254 = !DILocalVariable(name: "data", scope: !253, file: !9, line: 183, type: !10)
!255 = !DILocation(line: 183, column: 9, scope: !253)
!256 = !DILocation(line: 185, column: 10, scope: !253)
!257 = !DILocation(line: 186, column: 8, scope: !258)
!258 = distinct !DILexicalBlock(scope: !253, file: !9, line: 186, column: 8)
!259 = !DILocation(line: 186, column: 8, scope: !253)
!260 = !DILocation(line: 190, column: 14, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !9, line: 187, column: 5)
!262 = !DILocation(line: 191, column: 5, scope: !261)
!263 = !DILocation(line: 192, column: 8, scope: !264)
!264 = distinct !DILexicalBlock(scope: !253, file: !9, line: 192, column: 8)
!265 = !DILocation(line: 192, column: 8, scope: !253)
!266 = !DILocalVariable(name: "i", scope: !267, file: !9, line: 195, type: !10)
!267 = distinct !DILexicalBlock(scope: !268, file: !9, line: 194, column: 9)
!268 = distinct !DILexicalBlock(scope: !264, file: !9, line: 193, column: 5)
!269 = !DILocation(line: 195, column: 17, scope: !267)
!270 = !DILocalVariable(name: "buffer", scope: !267, file: !9, line: 196, type: !39)
!271 = !DILocation(line: 196, column: 17, scope: !267)
!272 = !DILocation(line: 199, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !267, file: !9, line: 199, column: 17)
!274 = !DILocation(line: 199, column: 22, scope: !273)
!275 = !DILocation(line: 199, column: 17, scope: !267)
!276 = !DILocation(line: 201, column: 24, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !9, line: 200, column: 13)
!278 = !DILocation(line: 201, column: 17, scope: !277)
!279 = !DILocation(line: 201, column: 30, scope: !277)
!280 = !DILocation(line: 203, column: 23, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !9, line: 203, column: 17)
!282 = !DILocation(line: 203, column: 21, scope: !281)
!283 = !DILocation(line: 203, column: 28, scope: !284)
!284 = distinct !DILexicalBlock(scope: !281, file: !9, line: 203, column: 17)
!285 = !DILocation(line: 203, column: 30, scope: !284)
!286 = !DILocation(line: 203, column: 17, scope: !281)
!287 = !DILocation(line: 205, column: 41, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !9, line: 204, column: 17)
!289 = !DILocation(line: 205, column: 34, scope: !288)
!290 = !DILocation(line: 205, column: 21, scope: !288)
!291 = !DILocation(line: 206, column: 17, scope: !288)
!292 = !DILocation(line: 203, column: 37, scope: !284)
!293 = !DILocation(line: 203, column: 17, scope: !284)
!294 = distinct !{!294, !286, !295, !67}
!295 = !DILocation(line: 206, column: 17, scope: !281)
!296 = !DILocation(line: 207, column: 13, scope: !277)
!297 = !DILocation(line: 210, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !273, file: !9, line: 209, column: 13)
!299 = !DILocation(line: 213, column: 5, scope: !268)
!300 = !DILocation(line: 214, column: 1, scope: !253)
