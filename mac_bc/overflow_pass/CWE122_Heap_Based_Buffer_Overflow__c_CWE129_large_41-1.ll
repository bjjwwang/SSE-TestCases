; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  store i32 10, i32* %data, align 4, !dbg !22
  %0 = load i32, i32* %data, align 4, !dbg !23
  call void @badSink(i32 noundef %0), !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !26 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !34, metadata !DIExpression()), !dbg !35
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !36
  %0 = bitcast i8* %call to i32*, !dbg !37
  store i32* %0, i32** %buffer, align 8, !dbg !35
  %1 = load i32*, i32** %buffer, align 8, !dbg !38
  %cmp = icmp eq i32* %1, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !47
  %cmp1 = icmp slt i32 %2, 10, !dbg !49
  br i1 %cmp1, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !51
  %4 = load i32, i32* %i, align 4, !dbg !53
  %idxprom = sext i32 %4 to i64, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !51
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !56
  %inc = add nsw i32 %5, 1, !dbg !56
  store i32 %inc, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !61
  %cmp2 = icmp sge i32 %6, 0, !dbg !63
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !64

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !65
  %8 = load i32, i32* %data.addr, align 4, !dbg !67
  %idxprom4 = sext i32 %8 to i64, !dbg !65
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !65
  store i32 1, i32* %arrayidx5, align 4, !dbg !68
  store i32 0, i32* %i, align 4, !dbg !69
  br label %for.cond6, !dbg !71

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !72
  %cmp7 = icmp slt i32 %9, 10, !dbg !74
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !75

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !76
  %11 = load i32, i32* %i, align 4, !dbg !78
  %idxprom9 = sext i32 %11 to i64, !dbg !76
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !76
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !76
  call void @printIntLine(i32 noundef %12), !dbg !79
  br label %for.inc11, !dbg !80

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !81
  %inc12 = add nsw i32 %13, 1, !dbg !81
  store i32 %inc12, i32* %i, align 4, !dbg !81
  br label %for.cond6, !dbg !82, !llvm.loop !83

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !85

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !88
  %15 = bitcast i32* %14 to i8*, !dbg !88
  call void @free(i8* noundef %15), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_good() #0 !dbg !91 {
entry:
  call void @goodB2G(), !dbg !92
  call void @goodG2B(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* noundef null), !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 noundef %conv), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_good(), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_bad(), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
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
define internal void @goodB2G() #0 !dbg !115 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 -1, i32* %data, align 4, !dbg !118
  store i32 10, i32* %data, align 4, !dbg !119
  %0 = load i32, i32* %data, align 4, !dbg !120
  call void @goodB2GSink(i32 noundef %0), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2GSink(i32 noundef %data) #0 !dbg !123 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32* %i, metadata !126, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !129, metadata !DIExpression()), !dbg !130
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !131
  %0 = bitcast i8* %call to i32*, !dbg !132
  store i32* %0, i32** %buffer, align 8, !dbg !130
  %1 = load i32*, i32** %buffer, align 8, !dbg !133
  %cmp = icmp eq i32* %1, null, !dbg !135
  br i1 %cmp, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !137
  unreachable, !dbg !137

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !142
  %cmp1 = icmp slt i32 %2, 10, !dbg !144
  br i1 %cmp1, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !146
  %4 = load i32, i32* %i, align 4, !dbg !148
  %idxprom = sext i32 %4 to i64, !dbg !146
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !146
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !151
  %inc = add nsw i32 %5, 1, !dbg !151
  store i32 %inc, i32* %i, align 4, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !155
  %cmp2 = icmp sge i32 %6, 0, !dbg !157
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !158

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !159
  %cmp3 = icmp slt i32 %7, 10, !dbg !160
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !161

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !162
  %9 = load i32, i32* %data.addr, align 4, !dbg !164
  %idxprom5 = sext i32 %9 to i64, !dbg !162
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !162
  store i32 1, i32* %arrayidx6, align 4, !dbg !165
  store i32 0, i32* %i, align 4, !dbg !166
  br label %for.cond7, !dbg !168

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !169
  %cmp8 = icmp slt i32 %10, 10, !dbg !171
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !172

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !173
  %12 = load i32, i32* %i, align 4, !dbg !175
  %idxprom10 = sext i32 %12 to i64, !dbg !173
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !173
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !173
  call void @printIntLine(i32 noundef %13), !dbg !176
  br label %for.inc12, !dbg !177

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !178
  %inc13 = add nsw i32 %14, 1, !dbg !178
  store i32 %inc13, i32* %i, align 4, !dbg !178
  br label %for.cond7, !dbg !179, !llvm.loop !180

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !182

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !183
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !185
  %16 = bitcast i32* %15 to i8*, !dbg !185
  call void @free(i8* noundef %16), !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !188 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !189, metadata !DIExpression()), !dbg !190
  store i32 -1, i32* %data, align 4, !dbg !191
  store i32 7, i32* %data, align 4, !dbg !192
  %0 = load i32, i32* %data, align 4, !dbg !193
  call void @goodG2BSink(i32 noundef %0), !dbg !194
  ret void, !dbg !195
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !196 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i32* %i, metadata !199, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !202, metadata !DIExpression()), !dbg !203
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !204
  %0 = bitcast i8* %call to i32*, !dbg !205
  store i32* %0, i32** %buffer, align 8, !dbg !203
  %1 = load i32*, i32** %buffer, align 8, !dbg !206
  %cmp = icmp eq i32* %1, null, !dbg !208
  br i1 %cmp, label %if.then, label %if.end, !dbg !209

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !210
  unreachable, !dbg !210

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !215
  %cmp1 = icmp slt i32 %2, 10, !dbg !217
  br i1 %cmp1, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !219
  %4 = load i32, i32* %i, align 4, !dbg !221
  %idxprom = sext i32 %4 to i64, !dbg !219
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !219
  store i32 0, i32* %arrayidx, align 4, !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !224
  %inc = add nsw i32 %5, 1, !dbg !224
  store i32 %inc, i32* %i, align 4, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !228
  %cmp2 = icmp sge i32 %6, 0, !dbg !230
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !231

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !232
  %8 = load i32, i32* %data.addr, align 4, !dbg !234
  %idxprom4 = sext i32 %8 to i64, !dbg !232
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !232
  store i32 1, i32* %arrayidx5, align 4, !dbg !235
  store i32 0, i32* %i, align 4, !dbg !236
  br label %for.cond6, !dbg !238

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !239
  %cmp7 = icmp slt i32 %9, 10, !dbg !241
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !242

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !243
  %11 = load i32, i32* %i, align 4, !dbg !245
  %idxprom9 = sext i32 %11 to i64, !dbg !243
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !243
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !243
  call void @printIntLine(i32 noundef %12), !dbg !246
  br label %for.inc11, !dbg !247

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !248
  %inc12 = add nsw i32 %13, 1, !dbg !248
  store i32 %inc12, i32* %i, align 4, !dbg !248
  br label %for.cond6, !dbg !249, !llvm.loop !250

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !252

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !253
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !255
  %15 = bitcast i32* %14 to i8*, !dbg !255
  call void @free(i8* noundef %15), !dbg !256
  ret void, !dbg !257
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_bad", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 54, type: !5)
!20 = !DILocation(line: 54, column: 9, scope: !14)
!21 = !DILocation(line: 56, column: 10, scope: !14)
!22 = !DILocation(line: 58, column: 10, scope: !14)
!23 = !DILocation(line: 59, column: 13, scope: !14)
!24 = !DILocation(line: 59, column: 5, scope: !14)
!25 = !DILocation(line: 60, column: 1, scope: !14)
!26 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 22, type: !27, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !5}
!29 = !DILocalVariable(name: "data", arg: 1, scope: !26, file: !15, line: 22, type: !5)
!30 = !DILocation(line: 22, column: 25, scope: !26)
!31 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 25, type: !5)
!32 = distinct !DILexicalBlock(scope: !26, file: !15, line: 24, column: 5)
!33 = !DILocation(line: 25, column: 13, scope: !32)
!34 = !DILocalVariable(name: "buffer", scope: !32, file: !15, line: 26, type: !4)
!35 = !DILocation(line: 26, column: 15, scope: !32)
!36 = !DILocation(line: 26, column: 31, scope: !32)
!37 = !DILocation(line: 26, column: 24, scope: !32)
!38 = !DILocation(line: 27, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !15, line: 27, column: 13)
!40 = !DILocation(line: 27, column: 20, scope: !39)
!41 = !DILocation(line: 27, column: 13, scope: !32)
!42 = !DILocation(line: 27, column: 30, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 27, column: 29)
!44 = !DILocation(line: 29, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !32, file: !15, line: 29, column: 9)
!46 = !DILocation(line: 29, column: 14, scope: !45)
!47 = !DILocation(line: 29, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !15, line: 29, column: 9)
!49 = !DILocation(line: 29, column: 23, scope: !48)
!50 = !DILocation(line: 29, column: 9, scope: !45)
!51 = !DILocation(line: 31, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !15, line: 30, column: 9)
!53 = !DILocation(line: 31, column: 20, scope: !52)
!54 = !DILocation(line: 31, column: 23, scope: !52)
!55 = !DILocation(line: 32, column: 9, scope: !52)
!56 = !DILocation(line: 29, column: 30, scope: !48)
!57 = !DILocation(line: 29, column: 9, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 32, column: 9, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 35, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !32, file: !15, line: 35, column: 13)
!63 = !DILocation(line: 35, column: 18, scope: !62)
!64 = !DILocation(line: 35, column: 13, scope: !32)
!65 = !DILocation(line: 37, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 36, column: 9)
!67 = !DILocation(line: 37, column: 20, scope: !66)
!68 = !DILocation(line: 37, column: 26, scope: !66)
!69 = !DILocation(line: 39, column: 19, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 39, column: 13)
!71 = !DILocation(line: 39, column: 17, scope: !70)
!72 = !DILocation(line: 39, column: 24, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !15, line: 39, column: 13)
!74 = !DILocation(line: 39, column: 26, scope: !73)
!75 = !DILocation(line: 39, column: 13, scope: !70)
!76 = !DILocation(line: 41, column: 30, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !15, line: 40, column: 13)
!78 = !DILocation(line: 41, column: 37, scope: !77)
!79 = !DILocation(line: 41, column: 17, scope: !77)
!80 = !DILocation(line: 42, column: 13, scope: !77)
!81 = !DILocation(line: 39, column: 33, scope: !73)
!82 = !DILocation(line: 39, column: 13, scope: !73)
!83 = distinct !{!83, !75, !84, !60}
!84 = !DILocation(line: 42, column: 13, scope: !70)
!85 = !DILocation(line: 43, column: 9, scope: !66)
!86 = !DILocation(line: 46, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !62, file: !15, line: 45, column: 9)
!88 = !DILocation(line: 48, column: 14, scope: !32)
!89 = !DILocation(line: 48, column: 9, scope: !32)
!90 = !DILocation(line: 50, column: 1, scope: !26)
!91 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_41_good", scope: !15, file: !15, line: 148, type: !16, scopeLine: 149, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!92 = !DILocation(line: 150, column: 5, scope: !91)
!93 = !DILocation(line: 151, column: 5, scope: !91)
!94 = !DILocation(line: 152, column: 1, scope: !91)
!95 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 163, type: !96, scopeLine: 164, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!96 = !DISubroutineType(types: !97)
!97 = !{!5, !5, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !15, line: 163, type: !5)
!102 = !DILocation(line: 163, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !15, line: 163, type: !98)
!104 = !DILocation(line: 163, column: 27, scope: !95)
!105 = !DILocation(line: 166, column: 22, scope: !95)
!106 = !DILocation(line: 166, column: 12, scope: !95)
!107 = !DILocation(line: 166, column: 5, scope: !95)
!108 = !DILocation(line: 168, column: 5, scope: !95)
!109 = !DILocation(line: 169, column: 5, scope: !95)
!110 = !DILocation(line: 170, column: 5, scope: !95)
!111 = !DILocation(line: 173, column: 5, scope: !95)
!112 = !DILocation(line: 174, column: 5, scope: !95)
!113 = !DILocation(line: 175, column: 5, scope: !95)
!114 = !DILocation(line: 177, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 138, type: !16, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!116 = !DILocalVariable(name: "data", scope: !115, file: !15, line: 140, type: !5)
!117 = !DILocation(line: 140, column: 9, scope: !115)
!118 = !DILocation(line: 142, column: 10, scope: !115)
!119 = !DILocation(line: 144, column: 10, scope: !115)
!120 = !DILocation(line: 145, column: 17, scope: !115)
!121 = !DILocation(line: 145, column: 5, scope: !115)
!122 = !DILocation(line: 146, column: 1, scope: !115)
!123 = distinct !DISubprogram(name: "goodB2GSink", scope: !15, file: !15, line: 109, type: !27, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!124 = !DILocalVariable(name: "data", arg: 1, scope: !123, file: !15, line: 109, type: !5)
!125 = !DILocation(line: 109, column: 29, scope: !123)
!126 = !DILocalVariable(name: "i", scope: !127, file: !15, line: 112, type: !5)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 111, column: 5)
!128 = !DILocation(line: 112, column: 13, scope: !127)
!129 = !DILocalVariable(name: "buffer", scope: !127, file: !15, line: 113, type: !4)
!130 = !DILocation(line: 113, column: 15, scope: !127)
!131 = !DILocation(line: 113, column: 31, scope: !127)
!132 = !DILocation(line: 113, column: 24, scope: !127)
!133 = !DILocation(line: 114, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !127, file: !15, line: 114, column: 13)
!135 = !DILocation(line: 114, column: 20, scope: !134)
!136 = !DILocation(line: 114, column: 13, scope: !127)
!137 = !DILocation(line: 114, column: 30, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !15, line: 114, column: 29)
!139 = !DILocation(line: 116, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !127, file: !15, line: 116, column: 9)
!141 = !DILocation(line: 116, column: 14, scope: !140)
!142 = !DILocation(line: 116, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !15, line: 116, column: 9)
!144 = !DILocation(line: 116, column: 23, scope: !143)
!145 = !DILocation(line: 116, column: 9, scope: !140)
!146 = !DILocation(line: 118, column: 13, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !15, line: 117, column: 9)
!148 = !DILocation(line: 118, column: 20, scope: !147)
!149 = !DILocation(line: 118, column: 23, scope: !147)
!150 = !DILocation(line: 119, column: 9, scope: !147)
!151 = !DILocation(line: 116, column: 30, scope: !143)
!152 = !DILocation(line: 116, column: 9, scope: !143)
!153 = distinct !{!153, !145, !154, !60}
!154 = !DILocation(line: 119, column: 9, scope: !140)
!155 = !DILocation(line: 121, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !127, file: !15, line: 121, column: 13)
!157 = !DILocation(line: 121, column: 18, scope: !156)
!158 = !DILocation(line: 121, column: 23, scope: !156)
!159 = !DILocation(line: 121, column: 26, scope: !156)
!160 = !DILocation(line: 121, column: 31, scope: !156)
!161 = !DILocation(line: 121, column: 13, scope: !127)
!162 = !DILocation(line: 123, column: 13, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !15, line: 122, column: 9)
!164 = !DILocation(line: 123, column: 20, scope: !163)
!165 = !DILocation(line: 123, column: 26, scope: !163)
!166 = !DILocation(line: 125, column: 19, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !15, line: 125, column: 13)
!168 = !DILocation(line: 125, column: 17, scope: !167)
!169 = !DILocation(line: 125, column: 24, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !15, line: 125, column: 13)
!171 = !DILocation(line: 125, column: 26, scope: !170)
!172 = !DILocation(line: 125, column: 13, scope: !167)
!173 = !DILocation(line: 127, column: 30, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !15, line: 126, column: 13)
!175 = !DILocation(line: 127, column: 37, scope: !174)
!176 = !DILocation(line: 127, column: 17, scope: !174)
!177 = !DILocation(line: 128, column: 13, scope: !174)
!178 = !DILocation(line: 125, column: 33, scope: !170)
!179 = !DILocation(line: 125, column: 13, scope: !170)
!180 = distinct !{!180, !172, !181, !60}
!181 = !DILocation(line: 128, column: 13, scope: !167)
!182 = !DILocation(line: 129, column: 9, scope: !163)
!183 = !DILocation(line: 132, column: 13, scope: !184)
!184 = distinct !DILexicalBlock(scope: !156, file: !15, line: 131, column: 9)
!185 = !DILocation(line: 134, column: 14, scope: !127)
!186 = !DILocation(line: 134, column: 9, scope: !127)
!187 = !DILocation(line: 136, column: 1, scope: !123)
!188 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 97, type: !16, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!189 = !DILocalVariable(name: "data", scope: !188, file: !15, line: 99, type: !5)
!190 = !DILocation(line: 99, column: 9, scope: !188)
!191 = !DILocation(line: 101, column: 10, scope: !188)
!192 = !DILocation(line: 104, column: 10, scope: !188)
!193 = !DILocation(line: 105, column: 17, scope: !188)
!194 = !DILocation(line: 105, column: 5, scope: !188)
!195 = !DILocation(line: 106, column: 1, scope: !188)
!196 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 67, type: !27, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!197 = !DILocalVariable(name: "data", arg: 1, scope: !196, file: !15, line: 67, type: !5)
!198 = !DILocation(line: 67, column: 29, scope: !196)
!199 = !DILocalVariable(name: "i", scope: !200, file: !15, line: 70, type: !5)
!200 = distinct !DILexicalBlock(scope: !196, file: !15, line: 69, column: 5)
!201 = !DILocation(line: 70, column: 13, scope: !200)
!202 = !DILocalVariable(name: "buffer", scope: !200, file: !15, line: 71, type: !4)
!203 = !DILocation(line: 71, column: 15, scope: !200)
!204 = !DILocation(line: 71, column: 31, scope: !200)
!205 = !DILocation(line: 71, column: 24, scope: !200)
!206 = !DILocation(line: 72, column: 13, scope: !207)
!207 = distinct !DILexicalBlock(scope: !200, file: !15, line: 72, column: 13)
!208 = !DILocation(line: 72, column: 20, scope: !207)
!209 = !DILocation(line: 72, column: 13, scope: !200)
!210 = !DILocation(line: 72, column: 30, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !15, line: 72, column: 29)
!212 = !DILocation(line: 74, column: 16, scope: !213)
!213 = distinct !DILexicalBlock(scope: !200, file: !15, line: 74, column: 9)
!214 = !DILocation(line: 74, column: 14, scope: !213)
!215 = !DILocation(line: 74, column: 21, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !15, line: 74, column: 9)
!217 = !DILocation(line: 74, column: 23, scope: !216)
!218 = !DILocation(line: 74, column: 9, scope: !213)
!219 = !DILocation(line: 76, column: 13, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !15, line: 75, column: 9)
!221 = !DILocation(line: 76, column: 20, scope: !220)
!222 = !DILocation(line: 76, column: 23, scope: !220)
!223 = !DILocation(line: 77, column: 9, scope: !220)
!224 = !DILocation(line: 74, column: 30, scope: !216)
!225 = !DILocation(line: 74, column: 9, scope: !216)
!226 = distinct !{!226, !218, !227, !60}
!227 = !DILocation(line: 77, column: 9, scope: !213)
!228 = !DILocation(line: 80, column: 13, scope: !229)
!229 = distinct !DILexicalBlock(scope: !200, file: !15, line: 80, column: 13)
!230 = !DILocation(line: 80, column: 18, scope: !229)
!231 = !DILocation(line: 80, column: 13, scope: !200)
!232 = !DILocation(line: 82, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !15, line: 81, column: 9)
!234 = !DILocation(line: 82, column: 20, scope: !233)
!235 = !DILocation(line: 82, column: 26, scope: !233)
!236 = !DILocation(line: 84, column: 19, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !15, line: 84, column: 13)
!238 = !DILocation(line: 84, column: 17, scope: !237)
!239 = !DILocation(line: 84, column: 24, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !15, line: 84, column: 13)
!241 = !DILocation(line: 84, column: 26, scope: !240)
!242 = !DILocation(line: 84, column: 13, scope: !237)
!243 = !DILocation(line: 86, column: 30, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !15, line: 85, column: 13)
!245 = !DILocation(line: 86, column: 37, scope: !244)
!246 = !DILocation(line: 86, column: 17, scope: !244)
!247 = !DILocation(line: 87, column: 13, scope: !244)
!248 = !DILocation(line: 84, column: 33, scope: !240)
!249 = !DILocation(line: 84, column: 13, scope: !240)
!250 = distinct !{!250, !242, !251, !60}
!251 = !DILocation(line: 87, column: 13, scope: !237)
!252 = !DILocation(line: 88, column: 9, scope: !233)
!253 = !DILocation(line: 91, column: 13, scope: !254)
!254 = distinct !DILexicalBlock(scope: !229, file: !15, line: 90, column: 9)
!255 = !DILocation(line: 93, column: 14, scope: !200)
!256 = !DILocation(line: 93, column: 9, scope: !200)
!257 = !DILocation(line: 95, column: 1, scope: !196)
