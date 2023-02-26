; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@globalFive = external global i32, align 4
@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fgets_14_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end5, !dbg !24

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !25, metadata !DIExpression()), !dbg !32
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !35
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !36
  %cmp1 = icmp ne i8* %call, null, !dbg !37
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !38

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !39
  %call4 = call i32 @atoi(i8* noundef %arraydecay3), !dbg !41
  store i32 %call4, i32* %data, align 4, !dbg !42
  br label %if.end, !dbg !43

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !46

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalFive, align 4, !dbg !47
  %cmp6 = icmp eq i32 %3, 5, !dbg !49
  br i1 %cmp6, label %if.then7, label %if.end12, !dbg !50

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !51, metadata !DIExpression()), !dbg !57
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !57
  %5 = load i32, i32* %data, align 4, !dbg !58
  %cmp8 = icmp sge i32 %5, 0, !dbg !60
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !61

if.then9:                                         ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !62
  %idxprom = sext i32 %6 to i64, !dbg !64
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !64
  %7 = load i32, i32* %arrayidx, align 4, !dbg !64
  call void @printIntLine(i32 noundef %7), !dbg !65
  br label %if.end11, !dbg !66

if.else10:                                        ; preds = %if.then7
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %if.then9
  br label %if.end12, !dbg !69

if.end12:                                         ; preds = %if.end11, %if.end5
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i8* @fgets(i8* noundef, i32 noundef, %struct.__sFILE* noundef) #3

declare i32 @atoi(i8* noundef) #3

declare void @printLine(i8* noundef) #3

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fgets_14_good() #0 !dbg !71 {
entry:
  call void @goodB2G1(), !dbg !72
  call void @goodB2G2(), !dbg !73
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* noundef null), !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 noundef %conv), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE126_Buffer_Overread__CWE129_fgets_14_good(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  call void @CWE126_Buffer_Overread__CWE129_fgets_14_bad(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !96 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i32 -1, i32* %data, align 4, !dbg !99
  %0 = load i32, i32* @globalFive, align 4, !dbg !100
  %cmp = icmp eq i32 %0, 5, !dbg !102
  br i1 %cmp, label %if.then, label %if.end5, !dbg !103

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !104, metadata !DIExpression()), !dbg !107
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !108
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !110
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !111
  %cmp1 = icmp ne i8* %call, null, !dbg !112
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !113

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !114
  %call4 = call i32 @atoi(i8* noundef %arraydecay3), !dbg !116
  store i32 %call4, i32* %data, align 4, !dbg !117
  br label %if.end, !dbg !118

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !121

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalFive, align 4, !dbg !122
  %cmp6 = icmp ne i32 %3, 5, !dbg !124
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !125

if.then7:                                         ; preds = %if.end5
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !126
  br label %if.end14, !dbg !128

if.else8:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !129, metadata !DIExpression()), !dbg !132
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !132
  %5 = load i32, i32* %data, align 4, !dbg !133
  %cmp9 = icmp sge i32 %5, 0, !dbg !135
  br i1 %cmp9, label %land.lhs.true, label %if.else12, !dbg !136

land.lhs.true:                                    ; preds = %if.else8
  %6 = load i32, i32* %data, align 4, !dbg !137
  %cmp10 = icmp slt i32 %6, 10, !dbg !138
  br i1 %cmp10, label %if.then11, label %if.else12, !dbg !139

if.then11:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !140
  %idxprom = sext i32 %7 to i64, !dbg !142
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !142
  %8 = load i32, i32* %arrayidx, align 4, !dbg !142
  call void @printIntLine(i32 noundef %8), !dbg !143
  br label %if.end13, !dbg !144

if.else12:                                        ; preds = %land.lhs.true, %if.else8
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !145
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %if.then7
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !148 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 -1, i32* %data, align 4, !dbg !151
  %0 = load i32, i32* @globalFive, align 4, !dbg !152
  %cmp = icmp eq i32 %0, 5, !dbg !154
  br i1 %cmp, label %if.then, label %if.end5, !dbg !155

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !156, metadata !DIExpression()), !dbg !159
  %1 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 14, i1 false), !dbg !159
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !160
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !162
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %2), !dbg !163
  %cmp1 = icmp ne i8* %call, null, !dbg !164
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !165

if.then2:                                         ; preds = %if.then
  %arraydecay3 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !166
  %call4 = call i32 @atoi(i8* noundef %arraydecay3), !dbg !168
  store i32 %call4, i32* %data, align 4, !dbg !169
  br label %if.end, !dbg !170

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !171
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5, !dbg !173

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* @globalFive, align 4, !dbg !174
  %cmp6 = icmp eq i32 %3, 5, !dbg !176
  br i1 %cmp6, label %if.then7, label %if.end13, !dbg !177

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !178, metadata !DIExpression()), !dbg !181
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !181
  %5 = load i32, i32* %data, align 4, !dbg !182
  %cmp8 = icmp sge i32 %5, 0, !dbg !184
  br i1 %cmp8, label %land.lhs.true, label %if.else11, !dbg !185

land.lhs.true:                                    ; preds = %if.then7
  %6 = load i32, i32* %data, align 4, !dbg !186
  %cmp9 = icmp slt i32 %6, 10, !dbg !187
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !188

if.then10:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %data, align 4, !dbg !189
  %idxprom = sext i32 %7 to i64, !dbg !191
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !191
  %8 = load i32, i32* %arrayidx, align 4, !dbg !191
  call void @printIntLine(i32 noundef %8), !dbg !192
  br label %if.end12, !dbg !193

if.else11:                                        ; preds = %land.lhs.true, %if.then7
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !194
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.then10
  br label %if.end13, !dbg !196

if.end13:                                         ; preds = %if.end12, %if.end5
  ret void, !dbg !197
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !198 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !199, metadata !DIExpression()), !dbg !200
  store i32 -1, i32* %data, align 4, !dbg !201
  %0 = load i32, i32* @globalFive, align 4, !dbg !202
  %cmp = icmp ne i32 %0, 5, !dbg !204
  br i1 %cmp, label %if.then, label %if.else, !dbg !205

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !206
  br label %if.end, !dbg !208

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !209
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !211
  %cmp1 = icmp eq i32 %1, 5, !dbg !213
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !214

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !215, metadata !DIExpression()), !dbg !218
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !218
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !218
  %3 = load i32, i32* %data, align 4, !dbg !219
  %cmp3 = icmp sge i32 %3, 0, !dbg !221
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !222

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !223
  %idxprom = sext i32 %4 to i64, !dbg !225
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !225
  %5 = load i32, i32* %arrayidx, align 4, !dbg !225
  call void @printIntLine(i32 noundef %5), !dbg !226
  br label %if.end6, !dbg !227

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !228
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !230

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !231
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !232 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !233, metadata !DIExpression()), !dbg !234
  store i32 -1, i32* %data, align 4, !dbg !235
  %0 = load i32, i32* @globalFive, align 4, !dbg !236
  %cmp = icmp eq i32 %0, 5, !dbg !238
  br i1 %cmp, label %if.then, label %if.end, !dbg !239

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !240
  br label %if.end, !dbg !242

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !243
  %cmp1 = icmp eq i32 %1, 5, !dbg !245
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !246

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !247, metadata !DIExpression()), !dbg !250
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !250
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !250
  %3 = load i32, i32* %data, align 4, !dbg !251
  %cmp3 = icmp sge i32 %3, 0, !dbg !253
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !254

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !255
  %idxprom = sext i32 %4 to i64, !dbg !257
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !257
  %5 = load i32, i32* %arrayidx, align 4, !dbg !257
  call void @printIntLine(i32 noundef %5), !dbg !258
  br label %if.end5, !dbg !259

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !260
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !262

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !263
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_14_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 26, column: 9, scope: !12)
!20 = !DILocation(line: 28, column: 10, scope: !12)
!21 = !DILocation(line: 29, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 8)
!23 = !DILocation(line: 29, column: 18, scope: !22)
!24 = !DILocation(line: 29, column: 8, scope: !12)
!25 = !DILocalVariable(name: "inputBuffer", scope: !26, file: !13, line: 32, type: !28)
!26 = distinct !DILexicalBlock(scope: !27, file: !13, line: 31, column: 9)
!27 = distinct !DILexicalBlock(scope: !22, file: !13, line: 30, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 112, elements: !30)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!31}
!31 = !DISubrange(count: 14)
!32 = !DILocation(line: 32, column: 18, scope: !26)
!33 = !DILocation(line: 34, column: 23, scope: !34)
!34 = distinct !DILexicalBlock(scope: !26, file: !13, line: 34, column: 17)
!35 = !DILocation(line: 34, column: 53, scope: !34)
!36 = !DILocation(line: 34, column: 17, scope: !34)
!37 = !DILocation(line: 34, column: 60, scope: !34)
!38 = !DILocation(line: 34, column: 17, scope: !26)
!39 = !DILocation(line: 37, column: 29, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !13, line: 35, column: 13)
!41 = !DILocation(line: 37, column: 24, scope: !40)
!42 = !DILocation(line: 37, column: 22, scope: !40)
!43 = !DILocation(line: 38, column: 13, scope: !40)
!44 = !DILocation(line: 41, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !13, line: 40, column: 13)
!46 = !DILocation(line: 44, column: 5, scope: !27)
!47 = !DILocation(line: 45, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !12, file: !13, line: 45, column: 8)
!49 = !DILocation(line: 45, column: 18, scope: !48)
!50 = !DILocation(line: 45, column: 8, scope: !12)
!51 = !DILocalVariable(name: "buffer", scope: !52, file: !13, line: 48, type: !54)
!52 = distinct !DILexicalBlock(scope: !53, file: !13, line: 47, column: 9)
!53 = distinct !DILexicalBlock(scope: !48, file: !13, line: 46, column: 5)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 10)
!57 = !DILocation(line: 48, column: 17, scope: !52)
!58 = !DILocation(line: 51, column: 17, scope: !59)
!59 = distinct !DILexicalBlock(scope: !52, file: !13, line: 51, column: 17)
!60 = !DILocation(line: 51, column: 22, scope: !59)
!61 = !DILocation(line: 51, column: 17, scope: !52)
!62 = !DILocation(line: 53, column: 37, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !13, line: 52, column: 13)
!64 = !DILocation(line: 53, column: 30, scope: !63)
!65 = !DILocation(line: 53, column: 17, scope: !63)
!66 = !DILocation(line: 54, column: 13, scope: !63)
!67 = !DILocation(line: 57, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !59, file: !13, line: 56, column: 13)
!69 = !DILocation(line: 60, column: 5, scope: !53)
!70 = !DILocation(line: 61, column: 1, scope: !12)
!71 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_14_good", scope: !13, file: !13, line: 215, type: !14, scopeLine: 216, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!72 = !DILocation(line: 217, column: 5, scope: !71)
!73 = !DILocation(line: 218, column: 5, scope: !71)
!74 = !DILocation(line: 219, column: 5, scope: !71)
!75 = !DILocation(line: 220, column: 5, scope: !71)
!76 = !DILocation(line: 221, column: 1, scope: !71)
!77 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 232, type: !78, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!78 = !DISubroutineType(types: !79)
!79 = !{!18, !18, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !13, line: 232, type: !18)
!83 = !DILocation(line: 232, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !13, line: 232, type: !80)
!85 = !DILocation(line: 232, column: 27, scope: !77)
!86 = !DILocation(line: 235, column: 22, scope: !77)
!87 = !DILocation(line: 235, column: 12, scope: !77)
!88 = !DILocation(line: 235, column: 5, scope: !77)
!89 = !DILocation(line: 237, column: 5, scope: !77)
!90 = !DILocation(line: 238, column: 5, scope: !77)
!91 = !DILocation(line: 239, column: 5, scope: !77)
!92 = !DILocation(line: 242, column: 5, scope: !77)
!93 = !DILocation(line: 243, column: 5, scope: !77)
!94 = !DILocation(line: 244, column: 5, scope: !77)
!95 = !DILocation(line: 246, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 68, type: !14, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!97 = !DILocalVariable(name: "data", scope: !96, file: !13, line: 70, type: !18)
!98 = !DILocation(line: 70, column: 9, scope: !96)
!99 = !DILocation(line: 72, column: 10, scope: !96)
!100 = !DILocation(line: 73, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !13, line: 73, column: 8)
!102 = !DILocation(line: 73, column: 18, scope: !101)
!103 = !DILocation(line: 73, column: 8, scope: !96)
!104 = !DILocalVariable(name: "inputBuffer", scope: !105, file: !13, line: 76, type: !28)
!105 = distinct !DILexicalBlock(scope: !106, file: !13, line: 75, column: 9)
!106 = distinct !DILexicalBlock(scope: !101, file: !13, line: 74, column: 5)
!107 = !DILocation(line: 76, column: 18, scope: !105)
!108 = !DILocation(line: 78, column: 23, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !13, line: 78, column: 17)
!110 = !DILocation(line: 78, column: 53, scope: !109)
!111 = !DILocation(line: 78, column: 17, scope: !109)
!112 = !DILocation(line: 78, column: 60, scope: !109)
!113 = !DILocation(line: 78, column: 17, scope: !105)
!114 = !DILocation(line: 81, column: 29, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !13, line: 79, column: 13)
!116 = !DILocation(line: 81, column: 24, scope: !115)
!117 = !DILocation(line: 81, column: 22, scope: !115)
!118 = !DILocation(line: 82, column: 13, scope: !115)
!119 = !DILocation(line: 85, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !109, file: !13, line: 84, column: 13)
!121 = !DILocation(line: 88, column: 5, scope: !106)
!122 = !DILocation(line: 89, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !96, file: !13, line: 89, column: 8)
!124 = !DILocation(line: 89, column: 18, scope: !123)
!125 = !DILocation(line: 89, column: 8, scope: !96)
!126 = !DILocation(line: 92, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !13, line: 90, column: 5)
!128 = !DILocation(line: 93, column: 5, scope: !127)
!129 = !DILocalVariable(name: "buffer", scope: !130, file: !13, line: 97, type: !54)
!130 = distinct !DILexicalBlock(scope: !131, file: !13, line: 96, column: 9)
!131 = distinct !DILexicalBlock(scope: !123, file: !13, line: 95, column: 5)
!132 = !DILocation(line: 97, column: 17, scope: !130)
!133 = !DILocation(line: 99, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !13, line: 99, column: 17)
!135 = !DILocation(line: 99, column: 22, scope: !134)
!136 = !DILocation(line: 99, column: 27, scope: !134)
!137 = !DILocation(line: 99, column: 30, scope: !134)
!138 = !DILocation(line: 99, column: 35, scope: !134)
!139 = !DILocation(line: 99, column: 17, scope: !130)
!140 = !DILocation(line: 101, column: 37, scope: !141)
!141 = distinct !DILexicalBlock(scope: !134, file: !13, line: 100, column: 13)
!142 = !DILocation(line: 101, column: 30, scope: !141)
!143 = !DILocation(line: 101, column: 17, scope: !141)
!144 = !DILocation(line: 102, column: 13, scope: !141)
!145 = !DILocation(line: 105, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !134, file: !13, line: 104, column: 13)
!147 = !DILocation(line: 109, column: 1, scope: !96)
!148 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 112, type: !14, scopeLine: 113, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!149 = !DILocalVariable(name: "data", scope: !148, file: !13, line: 114, type: !18)
!150 = !DILocation(line: 114, column: 9, scope: !148)
!151 = !DILocation(line: 116, column: 10, scope: !148)
!152 = !DILocation(line: 117, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !13, line: 117, column: 8)
!154 = !DILocation(line: 117, column: 18, scope: !153)
!155 = !DILocation(line: 117, column: 8, scope: !148)
!156 = !DILocalVariable(name: "inputBuffer", scope: !157, file: !13, line: 120, type: !28)
!157 = distinct !DILexicalBlock(scope: !158, file: !13, line: 119, column: 9)
!158 = distinct !DILexicalBlock(scope: !153, file: !13, line: 118, column: 5)
!159 = !DILocation(line: 120, column: 18, scope: !157)
!160 = !DILocation(line: 122, column: 23, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 122, column: 17)
!162 = !DILocation(line: 122, column: 53, scope: !161)
!163 = !DILocation(line: 122, column: 17, scope: !161)
!164 = !DILocation(line: 122, column: 60, scope: !161)
!165 = !DILocation(line: 122, column: 17, scope: !157)
!166 = !DILocation(line: 125, column: 29, scope: !167)
!167 = distinct !DILexicalBlock(scope: !161, file: !13, line: 123, column: 13)
!168 = !DILocation(line: 125, column: 24, scope: !167)
!169 = !DILocation(line: 125, column: 22, scope: !167)
!170 = !DILocation(line: 126, column: 13, scope: !167)
!171 = !DILocation(line: 129, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !161, file: !13, line: 128, column: 13)
!173 = !DILocation(line: 132, column: 5, scope: !158)
!174 = !DILocation(line: 133, column: 8, scope: !175)
!175 = distinct !DILexicalBlock(scope: !148, file: !13, line: 133, column: 8)
!176 = !DILocation(line: 133, column: 18, scope: !175)
!177 = !DILocation(line: 133, column: 8, scope: !148)
!178 = !DILocalVariable(name: "buffer", scope: !179, file: !13, line: 136, type: !54)
!179 = distinct !DILexicalBlock(scope: !180, file: !13, line: 135, column: 9)
!180 = distinct !DILexicalBlock(scope: !175, file: !13, line: 134, column: 5)
!181 = !DILocation(line: 136, column: 17, scope: !179)
!182 = !DILocation(line: 138, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !13, line: 138, column: 17)
!184 = !DILocation(line: 138, column: 22, scope: !183)
!185 = !DILocation(line: 138, column: 27, scope: !183)
!186 = !DILocation(line: 138, column: 30, scope: !183)
!187 = !DILocation(line: 138, column: 35, scope: !183)
!188 = !DILocation(line: 138, column: 17, scope: !179)
!189 = !DILocation(line: 140, column: 37, scope: !190)
!190 = distinct !DILexicalBlock(scope: !183, file: !13, line: 139, column: 13)
!191 = !DILocation(line: 140, column: 30, scope: !190)
!192 = !DILocation(line: 140, column: 17, scope: !190)
!193 = !DILocation(line: 141, column: 13, scope: !190)
!194 = !DILocation(line: 144, column: 17, scope: !195)
!195 = distinct !DILexicalBlock(scope: !183, file: !13, line: 143, column: 13)
!196 = !DILocation(line: 147, column: 5, scope: !180)
!197 = !DILocation(line: 148, column: 1, scope: !148)
!198 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 151, type: !14, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!199 = !DILocalVariable(name: "data", scope: !198, file: !13, line: 153, type: !18)
!200 = !DILocation(line: 153, column: 9, scope: !198)
!201 = !DILocation(line: 155, column: 10, scope: !198)
!202 = !DILocation(line: 156, column: 8, scope: !203)
!203 = distinct !DILexicalBlock(scope: !198, file: !13, line: 156, column: 8)
!204 = !DILocation(line: 156, column: 18, scope: !203)
!205 = !DILocation(line: 156, column: 8, scope: !198)
!206 = !DILocation(line: 159, column: 9, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !13, line: 157, column: 5)
!208 = !DILocation(line: 160, column: 5, scope: !207)
!209 = !DILocation(line: 165, column: 14, scope: !210)
!210 = distinct !DILexicalBlock(scope: !203, file: !13, line: 162, column: 5)
!211 = !DILocation(line: 167, column: 8, scope: !212)
!212 = distinct !DILexicalBlock(scope: !198, file: !13, line: 167, column: 8)
!213 = !DILocation(line: 167, column: 18, scope: !212)
!214 = !DILocation(line: 167, column: 8, scope: !198)
!215 = !DILocalVariable(name: "buffer", scope: !216, file: !13, line: 170, type: !54)
!216 = distinct !DILexicalBlock(scope: !217, file: !13, line: 169, column: 9)
!217 = distinct !DILexicalBlock(scope: !212, file: !13, line: 168, column: 5)
!218 = !DILocation(line: 170, column: 17, scope: !216)
!219 = !DILocation(line: 173, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !13, line: 173, column: 17)
!221 = !DILocation(line: 173, column: 22, scope: !220)
!222 = !DILocation(line: 173, column: 17, scope: !216)
!223 = !DILocation(line: 175, column: 37, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !13, line: 174, column: 13)
!225 = !DILocation(line: 175, column: 30, scope: !224)
!226 = !DILocation(line: 175, column: 17, scope: !224)
!227 = !DILocation(line: 176, column: 13, scope: !224)
!228 = !DILocation(line: 179, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !220, file: !13, line: 178, column: 13)
!230 = !DILocation(line: 182, column: 5, scope: !217)
!231 = !DILocation(line: 183, column: 1, scope: !198)
!232 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 186, type: !14, scopeLine: 187, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!233 = !DILocalVariable(name: "data", scope: !232, file: !13, line: 188, type: !18)
!234 = !DILocation(line: 188, column: 9, scope: !232)
!235 = !DILocation(line: 190, column: 10, scope: !232)
!236 = !DILocation(line: 191, column: 8, scope: !237)
!237 = distinct !DILexicalBlock(scope: !232, file: !13, line: 191, column: 8)
!238 = !DILocation(line: 191, column: 18, scope: !237)
!239 = !DILocation(line: 191, column: 8, scope: !232)
!240 = !DILocation(line: 195, column: 14, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !13, line: 192, column: 5)
!242 = !DILocation(line: 196, column: 5, scope: !241)
!243 = !DILocation(line: 197, column: 8, scope: !244)
!244 = distinct !DILexicalBlock(scope: !232, file: !13, line: 197, column: 8)
!245 = !DILocation(line: 197, column: 18, scope: !244)
!246 = !DILocation(line: 197, column: 8, scope: !232)
!247 = !DILocalVariable(name: "buffer", scope: !248, file: !13, line: 200, type: !54)
!248 = distinct !DILexicalBlock(scope: !249, file: !13, line: 199, column: 9)
!249 = distinct !DILexicalBlock(scope: !244, file: !13, line: 198, column: 5)
!250 = !DILocation(line: 200, column: 17, scope: !248)
!251 = !DILocation(line: 203, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !13, line: 203, column: 17)
!253 = !DILocation(line: 203, column: 22, scope: !252)
!254 = !DILocation(line: 203, column: 17, scope: !248)
!255 = !DILocation(line: 205, column: 37, scope: !256)
!256 = distinct !DILexicalBlock(scope: !252, file: !13, line: 204, column: 13)
!257 = !DILocation(line: 205, column: 30, scope: !256)
!258 = !DILocation(line: 205, column: 17, scope: !256)
!259 = !DILocation(line: 206, column: 13, scope: !256)
!260 = !DILocation(line: 209, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !252, file: !13, line: 208, column: 13)
!262 = !DILocation(line: 212, column: 5, scope: !249)
!263 = !DILocation(line: 213, column: 1, scope: !232)
