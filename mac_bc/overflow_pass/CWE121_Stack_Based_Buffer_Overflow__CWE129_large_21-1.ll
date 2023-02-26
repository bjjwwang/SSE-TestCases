; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !7
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !11
@goodG2BStatic = internal global i32 0, align 4, !dbg !13

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 -1, i32* %data, align 4, !dbg !28
  store i32 10, i32* %data, align 4, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32, i32* %data, align 4, !dbg !31
  call void @badSink(i32 noundef %0), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !34 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* @badStatic, align 4, !dbg !39
  %tobool = icmp ne i32 %0, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end5, !dbg !41

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !42, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !46, metadata !DIExpression()), !dbg !50
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !50
  %2 = load i32, i32* %data.addr, align 4, !dbg !51
  %cmp = icmp sge i32 %2, 0, !dbg !53
  br i1 %cmp, label %if.then1, label %if.else, !dbg !54

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !55
  %idxprom = sext i32 %3 to i64, !dbg !57
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !57
  store i32 1, i32* %arrayidx, align 4, !dbg !58
  store i32 0, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !62
  %cmp2 = icmp slt i32 %4, 10, !dbg !64
  br i1 %cmp2, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !66
  %idxprom3 = sext i32 %5 to i64, !dbg !68
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !68
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !68
  call void @printIntLine(i32 noundef %6), !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !71
  %inc = add nsw i32 %7, 1, !dbg !71
  store i32 %inc, i32* %i, align 4, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !76

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !79

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_21_good() #0 !dbg !81 {
entry:
  call void @goodB2G1(), !dbg !82
  call void @goodB2G2(), !dbg !83
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* noundef null), !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 noundef %conv), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_21_good(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_21_bad(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !106 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %data, align 4, !dbg !109
  store i32 10, i32* %data, align 4, !dbg !110
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !111
  %0 = load i32, i32* %data, align 4, !dbg !112
  call void @goodB2G1Sink(i32 noundef %0), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1Sink(i32 noundef %data) #0 !dbg !115 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !118
  %tobool = icmp ne i32 %0, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !121
  br label %if.end7, !dbg !123

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !124, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !128, metadata !DIExpression()), !dbg !129
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !129
  %2 = load i32, i32* %data.addr, align 4, !dbg !130
  %cmp = icmp sge i32 %2, 0, !dbg !132
  br i1 %cmp, label %land.lhs.true, label %if.else6, !dbg !133

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !134
  %cmp1 = icmp slt i32 %3, 10, !dbg !135
  br i1 %cmp1, label %if.then2, label %if.else6, !dbg !136

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !137
  %idxprom = sext i32 %4 to i64, !dbg !139
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !139
  store i32 1, i32* %arrayidx, align 4, !dbg !140
  store i32 0, i32* %i, align 4, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !144
  %cmp3 = icmp slt i32 %5, 10, !dbg !146
  br i1 %cmp3, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !148
  %idxprom4 = sext i32 %6 to i64, !dbg !150
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !150
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !150
  call void @printIntLine(i32 noundef %7), !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !153
  %inc = add nsw i32 %8, 1, !dbg !153
  store i32 %inc, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !157

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !158
  br label %if.end

if.end:                                           ; preds = %if.else6, %for.end
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !161 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !162, metadata !DIExpression()), !dbg !163
  store i32 -1, i32* %data, align 4, !dbg !164
  store i32 10, i32* %data, align 4, !dbg !165
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !166
  %0 = load i32, i32* %data, align 4, !dbg !167
  call void @goodB2G2Sink(i32 noundef %0), !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2Sink(i32 noundef %data) #0 !dbg !170 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !171, metadata !DIExpression()), !dbg !172
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !173
  %tobool = icmp ne i32 %0, 0, !dbg !173
  br i1 %tobool, label %if.then, label %if.end6, !dbg !175

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !176, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !180, metadata !DIExpression()), !dbg !181
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !181
  %2 = load i32, i32* %data.addr, align 4, !dbg !182
  %cmp = icmp sge i32 %2, 0, !dbg !184
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !185

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !186
  %cmp1 = icmp slt i32 %3, 10, !dbg !187
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !188

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !189
  %idxprom = sext i32 %4 to i64, !dbg !191
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !191
  store i32 1, i32* %arrayidx, align 4, !dbg !192
  store i32 0, i32* %i, align 4, !dbg !193
  br label %for.cond, !dbg !195

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !196
  %cmp3 = icmp slt i32 %5, 10, !dbg !198
  br i1 %cmp3, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !200
  %idxprom4 = sext i32 %6 to i64, !dbg !202
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !202
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !202
  call void @printIntLine(i32 noundef %7), !dbg !203
  br label %for.inc, !dbg !204

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !205
  %inc = add nsw i32 %8, 1, !dbg !205
  store i32 %inc, i32* %i, align 4, !dbg !205
  br label %for.cond, !dbg !206, !llvm.loop !207

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !209

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !210
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end6, !dbg !212

if.end6:                                          ; preds = %if.end, %entry
  ret void, !dbg !213
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !214 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !215, metadata !DIExpression()), !dbg !216
  store i32 -1, i32* %data, align 4, !dbg !217
  store i32 7, i32* %data, align 4, !dbg !218
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !219
  %0 = load i32, i32* %data, align 4, !dbg !220
  call void @goodG2BSink(i32 noundef %0), !dbg !221
  ret void, !dbg !222
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !223 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !224, metadata !DIExpression()), !dbg !225
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !226
  %tobool = icmp ne i32 %0, 0, !dbg !226
  br i1 %tobool, label %if.then, label %if.end5, !dbg !228

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !229, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !233, metadata !DIExpression()), !dbg !234
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !234
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !234
  %2 = load i32, i32* %data.addr, align 4, !dbg !235
  %cmp = icmp sge i32 %2, 0, !dbg !237
  br i1 %cmp, label %if.then1, label %if.else, !dbg !238

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !239
  %idxprom = sext i32 %3 to i64, !dbg !241
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !241
  store i32 1, i32* %arrayidx, align 4, !dbg !242
  store i32 0, i32* %i, align 4, !dbg !243
  br label %for.cond, !dbg !245

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !246
  %cmp2 = icmp slt i32 %4, 10, !dbg !248
  br i1 %cmp2, label %for.body, label %for.end, !dbg !249

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !250
  %idxprom3 = sext i32 %5 to i64, !dbg !252
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !252
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !252
  call void @printIntLine(i32 noundef %6), !dbg !253
  br label %for.inc, !dbg !254

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !255
  %inc = add nsw i32 %7, 1, !dbg !255
  store i32 %inc, i32* %i, align 4, !dbg !255
  br label %for.cond, !dbg !256, !llvm.loop !257

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !259

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !260
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !262

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !263
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !9, line: 23, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7, !11, !13}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !9, line: 67, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !9, line: 68, type: !10, isLocal: true, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !9, line: 69, type: !10, isLocal: true, isDefinition: true)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Homebrew clang version 14.0.6"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_21_bad", scope: !9, file: !9, line: 51, type: !23, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !{}
!26 = !DILocalVariable(name: "data", scope: !22, file: !9, line: 53, type: !10)
!27 = !DILocation(line: 53, column: 9, scope: !22)
!28 = !DILocation(line: 55, column: 10, scope: !22)
!29 = !DILocation(line: 57, column: 10, scope: !22)
!30 = !DILocation(line: 58, column: 15, scope: !22)
!31 = !DILocation(line: 59, column: 13, scope: !22)
!32 = !DILocation(line: 59, column: 5, scope: !22)
!33 = !DILocation(line: 60, column: 1, scope: !22)
!34 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 25, type: !35, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!35 = !DISubroutineType(types: !36)
!36 = !{null, !10}
!37 = !DILocalVariable(name: "data", arg: 1, scope: !34, file: !9, line: 25, type: !10)
!38 = !DILocation(line: 25, column: 25, scope: !34)
!39 = !DILocation(line: 27, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !9, line: 27, column: 8)
!41 = !DILocation(line: 27, column: 8, scope: !34)
!42 = !DILocalVariable(name: "i", scope: !43, file: !9, line: 30, type: !10)
!43 = distinct !DILexicalBlock(scope: !44, file: !9, line: 29, column: 9)
!44 = distinct !DILexicalBlock(scope: !40, file: !9, line: 28, column: 5)
!45 = !DILocation(line: 30, column: 17, scope: !43)
!46 = !DILocalVariable(name: "buffer", scope: !43, file: !9, line: 31, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 10)
!50 = !DILocation(line: 31, column: 17, scope: !43)
!51 = !DILocation(line: 34, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !43, file: !9, line: 34, column: 17)
!53 = !DILocation(line: 34, column: 22, scope: !52)
!54 = !DILocation(line: 34, column: 17, scope: !43)
!55 = !DILocation(line: 36, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !9, line: 35, column: 13)
!57 = !DILocation(line: 36, column: 17, scope: !56)
!58 = !DILocation(line: 36, column: 30, scope: !56)
!59 = !DILocation(line: 38, column: 23, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !9, line: 38, column: 17)
!61 = !DILocation(line: 38, column: 21, scope: !60)
!62 = !DILocation(line: 38, column: 28, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !9, line: 38, column: 17)
!64 = !DILocation(line: 38, column: 30, scope: !63)
!65 = !DILocation(line: 38, column: 17, scope: !60)
!66 = !DILocation(line: 40, column: 41, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !9, line: 39, column: 17)
!68 = !DILocation(line: 40, column: 34, scope: !67)
!69 = !DILocation(line: 40, column: 21, scope: !67)
!70 = !DILocation(line: 41, column: 17, scope: !67)
!71 = !DILocation(line: 38, column: 37, scope: !63)
!72 = !DILocation(line: 38, column: 17, scope: !63)
!73 = distinct !{!73, !65, !74, !75}
!74 = !DILocation(line: 41, column: 17, scope: !60)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 42, column: 13, scope: !56)
!77 = !DILocation(line: 45, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !52, file: !9, line: 44, column: 13)
!79 = !DILocation(line: 48, column: 5, scope: !44)
!80 = !DILocation(line: 49, column: 1, scope: !34)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_21_good", scope: !9, file: !9, line: 189, type: !23, scopeLine: 190, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!82 = !DILocation(line: 191, column: 5, scope: !81)
!83 = !DILocation(line: 192, column: 5, scope: !81)
!84 = !DILocation(line: 193, column: 5, scope: !81)
!85 = !DILocation(line: 194, column: 1, scope: !81)
!86 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 205, type: !87, scopeLine: 206, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!87 = !DISubroutineType(types: !88)
!88 = !{!10, !10, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !9, line: 205, type: !10)
!93 = !DILocation(line: 205, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !9, line: 205, type: !89)
!95 = !DILocation(line: 205, column: 27, scope: !86)
!96 = !DILocation(line: 208, column: 22, scope: !86)
!97 = !DILocation(line: 208, column: 12, scope: !86)
!98 = !DILocation(line: 208, column: 5, scope: !86)
!99 = !DILocation(line: 210, column: 5, scope: !86)
!100 = !DILocation(line: 211, column: 5, scope: !86)
!101 = !DILocation(line: 212, column: 5, scope: !86)
!102 = !DILocation(line: 215, column: 5, scope: !86)
!103 = !DILocation(line: 216, column: 5, scope: !86)
!104 = !DILocation(line: 217, column: 5, scope: !86)
!105 = !DILocation(line: 219, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodB2G1", scope: !9, file: !9, line: 102, type: !23, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!107 = !DILocalVariable(name: "data", scope: !106, file: !9, line: 104, type: !10)
!108 = !DILocation(line: 104, column: 9, scope: !106)
!109 = !DILocation(line: 106, column: 10, scope: !106)
!110 = !DILocation(line: 108, column: 10, scope: !106)
!111 = !DILocation(line: 109, column: 20, scope: !106)
!112 = !DILocation(line: 110, column: 18, scope: !106)
!113 = !DILocation(line: 110, column: 5, scope: !106)
!114 = !DILocation(line: 111, column: 1, scope: !106)
!115 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !9, file: !9, line: 72, type: !35, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!116 = !DILocalVariable(name: "data", arg: 1, scope: !115, file: !9, line: 72, type: !10)
!117 = !DILocation(line: 72, column: 30, scope: !115)
!118 = !DILocation(line: 74, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !9, line: 74, column: 8)
!120 = !DILocation(line: 74, column: 8, scope: !115)
!121 = !DILocation(line: 77, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !9, line: 75, column: 5)
!123 = !DILocation(line: 78, column: 5, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !125, file: !9, line: 82, type: !10)
!125 = distinct !DILexicalBlock(scope: !126, file: !9, line: 81, column: 9)
!126 = distinct !DILexicalBlock(scope: !119, file: !9, line: 80, column: 5)
!127 = !DILocation(line: 82, column: 17, scope: !125)
!128 = !DILocalVariable(name: "buffer", scope: !125, file: !9, line: 83, type: !47)
!129 = !DILocation(line: 83, column: 17, scope: !125)
!130 = !DILocation(line: 85, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !9, line: 85, column: 17)
!132 = !DILocation(line: 85, column: 22, scope: !131)
!133 = !DILocation(line: 85, column: 27, scope: !131)
!134 = !DILocation(line: 85, column: 30, scope: !131)
!135 = !DILocation(line: 85, column: 35, scope: !131)
!136 = !DILocation(line: 85, column: 17, scope: !125)
!137 = !DILocation(line: 87, column: 24, scope: !138)
!138 = distinct !DILexicalBlock(scope: !131, file: !9, line: 86, column: 13)
!139 = !DILocation(line: 87, column: 17, scope: !138)
!140 = !DILocation(line: 87, column: 30, scope: !138)
!141 = !DILocation(line: 89, column: 23, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !9, line: 89, column: 17)
!143 = !DILocation(line: 89, column: 21, scope: !142)
!144 = !DILocation(line: 89, column: 28, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !9, line: 89, column: 17)
!146 = !DILocation(line: 89, column: 30, scope: !145)
!147 = !DILocation(line: 89, column: 17, scope: !142)
!148 = !DILocation(line: 91, column: 41, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !9, line: 90, column: 17)
!150 = !DILocation(line: 91, column: 34, scope: !149)
!151 = !DILocation(line: 91, column: 21, scope: !149)
!152 = !DILocation(line: 92, column: 17, scope: !149)
!153 = !DILocation(line: 89, column: 37, scope: !145)
!154 = !DILocation(line: 89, column: 17, scope: !145)
!155 = distinct !{!155, !147, !156, !75}
!156 = !DILocation(line: 92, column: 17, scope: !142)
!157 = !DILocation(line: 93, column: 13, scope: !138)
!158 = !DILocation(line: 96, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !131, file: !9, line: 95, column: 13)
!160 = !DILocation(line: 100, column: 1, scope: !115)
!161 = distinct !DISubprogram(name: "goodB2G2", scope: !9, file: !9, line: 139, type: !23, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!162 = !DILocalVariable(name: "data", scope: !161, file: !9, line: 141, type: !10)
!163 = !DILocation(line: 141, column: 9, scope: !161)
!164 = !DILocation(line: 143, column: 10, scope: !161)
!165 = !DILocation(line: 145, column: 10, scope: !161)
!166 = !DILocation(line: 146, column: 20, scope: !161)
!167 = !DILocation(line: 147, column: 18, scope: !161)
!168 = !DILocation(line: 147, column: 5, scope: !161)
!169 = !DILocation(line: 148, column: 1, scope: !161)
!170 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !9, file: !9, line: 114, type: !35, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!171 = !DILocalVariable(name: "data", arg: 1, scope: !170, file: !9, line: 114, type: !10)
!172 = !DILocation(line: 114, column: 30, scope: !170)
!173 = !DILocation(line: 116, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !9, line: 116, column: 8)
!175 = !DILocation(line: 116, column: 8, scope: !170)
!176 = !DILocalVariable(name: "i", scope: !177, file: !9, line: 119, type: !10)
!177 = distinct !DILexicalBlock(scope: !178, file: !9, line: 118, column: 9)
!178 = distinct !DILexicalBlock(scope: !174, file: !9, line: 117, column: 5)
!179 = !DILocation(line: 119, column: 17, scope: !177)
!180 = !DILocalVariable(name: "buffer", scope: !177, file: !9, line: 120, type: !47)
!181 = !DILocation(line: 120, column: 17, scope: !177)
!182 = !DILocation(line: 122, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !177, file: !9, line: 122, column: 17)
!184 = !DILocation(line: 122, column: 22, scope: !183)
!185 = !DILocation(line: 122, column: 27, scope: !183)
!186 = !DILocation(line: 122, column: 30, scope: !183)
!187 = !DILocation(line: 122, column: 35, scope: !183)
!188 = !DILocation(line: 122, column: 17, scope: !177)
!189 = !DILocation(line: 124, column: 24, scope: !190)
!190 = distinct !DILexicalBlock(scope: !183, file: !9, line: 123, column: 13)
!191 = !DILocation(line: 124, column: 17, scope: !190)
!192 = !DILocation(line: 124, column: 30, scope: !190)
!193 = !DILocation(line: 126, column: 23, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !9, line: 126, column: 17)
!195 = !DILocation(line: 126, column: 21, scope: !194)
!196 = !DILocation(line: 126, column: 28, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !9, line: 126, column: 17)
!198 = !DILocation(line: 126, column: 30, scope: !197)
!199 = !DILocation(line: 126, column: 17, scope: !194)
!200 = !DILocation(line: 128, column: 41, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !9, line: 127, column: 17)
!202 = !DILocation(line: 128, column: 34, scope: !201)
!203 = !DILocation(line: 128, column: 21, scope: !201)
!204 = !DILocation(line: 129, column: 17, scope: !201)
!205 = !DILocation(line: 126, column: 37, scope: !197)
!206 = !DILocation(line: 126, column: 17, scope: !197)
!207 = distinct !{!207, !199, !208, !75}
!208 = !DILocation(line: 129, column: 17, scope: !194)
!209 = !DILocation(line: 130, column: 13, scope: !190)
!210 = !DILocation(line: 133, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !183, file: !9, line: 132, column: 13)
!212 = !DILocation(line: 136, column: 5, scope: !178)
!213 = !DILocation(line: 137, column: 1, scope: !170)
!214 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 177, type: !23, scopeLine: 178, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!215 = !DILocalVariable(name: "data", scope: !214, file: !9, line: 179, type: !10)
!216 = !DILocation(line: 179, column: 9, scope: !214)
!217 = !DILocation(line: 181, column: 10, scope: !214)
!218 = !DILocation(line: 184, column: 10, scope: !214)
!219 = !DILocation(line: 185, column: 19, scope: !214)
!220 = !DILocation(line: 186, column: 17, scope: !214)
!221 = !DILocation(line: 186, column: 5, scope: !214)
!222 = !DILocation(line: 187, column: 1, scope: !214)
!223 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 151, type: !35, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!224 = !DILocalVariable(name: "data", arg: 1, scope: !223, file: !9, line: 151, type: !10)
!225 = !DILocation(line: 151, column: 29, scope: !223)
!226 = !DILocation(line: 153, column: 8, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !9, line: 153, column: 8)
!228 = !DILocation(line: 153, column: 8, scope: !223)
!229 = !DILocalVariable(name: "i", scope: !230, file: !9, line: 156, type: !10)
!230 = distinct !DILexicalBlock(scope: !231, file: !9, line: 155, column: 9)
!231 = distinct !DILexicalBlock(scope: !227, file: !9, line: 154, column: 5)
!232 = !DILocation(line: 156, column: 17, scope: !230)
!233 = !DILocalVariable(name: "buffer", scope: !230, file: !9, line: 157, type: !47)
!234 = !DILocation(line: 157, column: 17, scope: !230)
!235 = !DILocation(line: 160, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !230, file: !9, line: 160, column: 17)
!237 = !DILocation(line: 160, column: 22, scope: !236)
!238 = !DILocation(line: 160, column: 17, scope: !230)
!239 = !DILocation(line: 162, column: 24, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !9, line: 161, column: 13)
!241 = !DILocation(line: 162, column: 17, scope: !240)
!242 = !DILocation(line: 162, column: 30, scope: !240)
!243 = !DILocation(line: 164, column: 23, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !9, line: 164, column: 17)
!245 = !DILocation(line: 164, column: 21, scope: !244)
!246 = !DILocation(line: 164, column: 28, scope: !247)
!247 = distinct !DILexicalBlock(scope: !244, file: !9, line: 164, column: 17)
!248 = !DILocation(line: 164, column: 30, scope: !247)
!249 = !DILocation(line: 164, column: 17, scope: !244)
!250 = !DILocation(line: 166, column: 41, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !9, line: 165, column: 17)
!252 = !DILocation(line: 166, column: 34, scope: !251)
!253 = !DILocation(line: 166, column: 21, scope: !251)
!254 = !DILocation(line: 167, column: 17, scope: !251)
!255 = !DILocation(line: 164, column: 37, scope: !247)
!256 = !DILocation(line: 164, column: 17, scope: !247)
!257 = distinct !{!257, !249, !258, !75}
!258 = !DILocation(line: 167, column: 17, scope: !244)
!259 = !DILocation(line: 168, column: 13, scope: !240)
!260 = !DILocation(line: 171, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !236, file: !9, line: 170, column: 13)
!262 = !DILocation(line: 174, column: 5, scope: !231)
!263 = !DILocation(line: 175, column: 1, scope: !223)
