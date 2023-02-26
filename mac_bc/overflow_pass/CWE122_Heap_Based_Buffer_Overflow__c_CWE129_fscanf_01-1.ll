; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01-1.c"
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
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !22
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !27, metadata !DIExpression()), !dbg !28
  %call1 = call i8* @malloc(i64 noundef 40) #5, !dbg !29
  %1 = bitcast i8* %call1 to i32*, !dbg !30
  store i32* %1, i32** %buffer, align 8, !dbg !28
  %2 = load i32*, i32** %buffer, align 8, !dbg !31
  %cmp = icmp eq i32* %2, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !40
  %cmp2 = icmp slt i32 %3, 10, !dbg !42
  br i1 %cmp2, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !44
  %5 = load i32, i32* %i, align 4, !dbg !46
  %idxprom = sext i32 %5 to i64, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %6, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !54
  %cmp3 = icmp sge i32 %7, 0, !dbg !56
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !57

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !58
  %9 = load i32, i32* %data, align 4, !dbg !60
  %idxprom5 = sext i32 %9 to i64, !dbg !58
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !58
  store i32 1, i32* %arrayidx6, align 4, !dbg !61
  store i32 0, i32* %i, align 4, !dbg !62
  br label %for.cond7, !dbg !64

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !65
  %cmp8 = icmp slt i32 %10, 10, !dbg !67
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !68

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !69
  %12 = load i32, i32* %i, align 4, !dbg !71
  %idxprom10 = sext i32 %12 to i64, !dbg !69
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !69
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !69
  call void @printIntLine(i32 noundef %13), !dbg !72
  br label %for.inc12, !dbg !73

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !74
  %inc13 = add nsw i32 %14, 1, !dbg !74
  store i32 %inc13, i32* %i, align 4, !dbg !74
  br label %for.cond7, !dbg !75, !llvm.loop !76

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !78

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !81
  %16 = bitcast i32* %15 to i8*, !dbg !81
  call void @free(i8* noundef %16), !dbg !82
  ret void, !dbg !83
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  call void @goodB2G(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* noundef null), !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 noundef %conv), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_good(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_bad(), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %data, align 4, !dbg !111
  store i32 7, i32* %data, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata i32* %i, metadata !113, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !116, metadata !DIExpression()), !dbg !117
  %call = call i8* @malloc(i64 noundef 40) #5, !dbg !118
  %0 = bitcast i8* %call to i32*, !dbg !119
  store i32* %0, i32** %buffer, align 8, !dbg !117
  %1 = load i32*, i32** %buffer, align 8, !dbg !120
  %cmp = icmp eq i32* %1, null, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !129
  %cmp1 = icmp slt i32 %2, 10, !dbg !131
  br i1 %cmp1, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !133
  %4 = load i32, i32* %i, align 4, !dbg !135
  %idxprom = sext i32 %4 to i64, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !138
  %inc = add nsw i32 %5, 1, !dbg !138
  store i32 %inc, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !142
  %cmp2 = icmp sge i32 %6, 0, !dbg !144
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !145

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !146
  %8 = load i32, i32* %data, align 4, !dbg !148
  %idxprom4 = sext i32 %8 to i64, !dbg !146
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !146
  store i32 1, i32* %arrayidx5, align 4, !dbg !149
  store i32 0, i32* %i, align 4, !dbg !150
  br label %for.cond6, !dbg !152

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !153
  %cmp7 = icmp slt i32 %9, 10, !dbg !155
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !156

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !157
  %11 = load i32, i32* %i, align 4, !dbg !159
  %idxprom9 = sext i32 %11 to i64, !dbg !157
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !157
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !157
  call void @printIntLine(i32 noundef %12), !dbg !160
  br label %for.inc11, !dbg !161

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !162
  %inc12 = add nsw i32 %13, 1, !dbg !162
  store i32 %inc12, i32* %i, align 4, !dbg !162
  br label %for.cond6, !dbg !163, !llvm.loop !164

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !166

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !167
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !169
  %15 = bitcast i32* %14 to i8*, !dbg !169
  call void @free(i8* noundef %15), !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !172 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !173, metadata !DIExpression()), !dbg !174
  store i32 -1, i32* %data, align 4, !dbg !175
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !176
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !177
  call void @llvm.dbg.declare(metadata i32* %i, metadata !178, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !181, metadata !DIExpression()), !dbg !182
  %call1 = call i8* @malloc(i64 noundef 40) #5, !dbg !183
  %1 = bitcast i8* %call1 to i32*, !dbg !184
  store i32* %1, i32** %buffer, align 8, !dbg !182
  %2 = load i32*, i32** %buffer, align 8, !dbg !185
  %cmp = icmp eq i32* %2, null, !dbg !187
  br i1 %cmp, label %if.then, label %if.end, !dbg !188

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !189
  unreachable, !dbg !189

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !191
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !194
  %cmp2 = icmp slt i32 %3, 10, !dbg !196
  br i1 %cmp2, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !198
  %5 = load i32, i32* %i, align 4, !dbg !200
  %idxprom = sext i32 %5 to i64, !dbg !198
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !198
  store i32 0, i32* %arrayidx, align 4, !dbg !201
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !203
  %inc = add nsw i32 %6, 1, !dbg !203
  store i32 %inc, i32* %i, align 4, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !207
  %cmp3 = icmp sge i32 %7, 0, !dbg !209
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !210

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !211
  %cmp4 = icmp slt i32 %8, 10, !dbg !212
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !213

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !214
  %10 = load i32, i32* %data, align 4, !dbg !216
  %idxprom6 = sext i32 %10 to i64, !dbg !214
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !214
  store i32 1, i32* %arrayidx7, align 4, !dbg !217
  store i32 0, i32* %i, align 4, !dbg !218
  br label %for.cond8, !dbg !220

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !221
  %cmp9 = icmp slt i32 %11, 10, !dbg !223
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !224

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !225
  %13 = load i32, i32* %i, align 4, !dbg !227
  %idxprom11 = sext i32 %13 to i64, !dbg !225
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !225
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !225
  call void @printIntLine(i32 noundef %14), !dbg !228
  br label %for.inc13, !dbg !229

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !230
  %inc14 = add nsw i32 %15, 1, !dbg !230
  store i32 %inc14, i32* %i, align 4, !dbg !230
  br label %for.cond8, !dbg !231, !llvm.loop !232

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !234

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !235
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !237
  %17 = bitcast i32* %16 to i8*, !dbg !237
  call void @free(i8* noundef %17), !dbg !238
  ret void, !dbg !239
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 9, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 28, column: 12, scope: !14)
!23 = !DILocation(line: 28, column: 5, scope: !14)
!24 = !DILocalVariable(name: "i", scope: !25, file: !15, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!26 = !DILocation(line: 30, column: 13, scope: !25)
!27 = !DILocalVariable(name: "buffer", scope: !25, file: !15, line: 31, type: !3)
!28 = !DILocation(line: 31, column: 15, scope: !25)
!29 = !DILocation(line: 31, column: 31, scope: !25)
!30 = !DILocation(line: 31, column: 24, scope: !25)
!31 = !DILocation(line: 32, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !15, line: 32, column: 13)
!33 = !DILocation(line: 32, column: 20, scope: !32)
!34 = !DILocation(line: 32, column: 13, scope: !25)
!35 = !DILocation(line: 32, column: 30, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 32, column: 29)
!37 = !DILocation(line: 34, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !25, file: !15, line: 34, column: 9)
!39 = !DILocation(line: 34, column: 14, scope: !38)
!40 = !DILocation(line: 34, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !15, line: 34, column: 9)
!42 = !DILocation(line: 34, column: 23, scope: !41)
!43 = !DILocation(line: 34, column: 9, scope: !38)
!44 = !DILocation(line: 36, column: 13, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 35, column: 9)
!46 = !DILocation(line: 36, column: 20, scope: !45)
!47 = !DILocation(line: 36, column: 23, scope: !45)
!48 = !DILocation(line: 37, column: 9, scope: !45)
!49 = !DILocation(line: 34, column: 30, scope: !41)
!50 = !DILocation(line: 34, column: 9, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 37, column: 9, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 40, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !25, file: !15, line: 40, column: 13)
!56 = !DILocation(line: 40, column: 18, scope: !55)
!57 = !DILocation(line: 40, column: 13, scope: !25)
!58 = !DILocation(line: 42, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !15, line: 41, column: 9)
!60 = !DILocation(line: 42, column: 20, scope: !59)
!61 = !DILocation(line: 42, column: 26, scope: !59)
!62 = !DILocation(line: 44, column: 19, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !15, line: 44, column: 13)
!64 = !DILocation(line: 44, column: 17, scope: !63)
!65 = !DILocation(line: 44, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !15, line: 44, column: 13)
!67 = !DILocation(line: 44, column: 26, scope: !66)
!68 = !DILocation(line: 44, column: 13, scope: !63)
!69 = !DILocation(line: 46, column: 30, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 45, column: 13)
!71 = !DILocation(line: 46, column: 37, scope: !70)
!72 = !DILocation(line: 46, column: 17, scope: !70)
!73 = !DILocation(line: 47, column: 13, scope: !70)
!74 = !DILocation(line: 44, column: 33, scope: !66)
!75 = !DILocation(line: 44, column: 13, scope: !66)
!76 = distinct !{!76, !68, !77, !53}
!77 = !DILocation(line: 47, column: 13, scope: !63)
!78 = !DILocation(line: 48, column: 9, scope: !59)
!79 = !DILocation(line: 51, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !55, file: !15, line: 50, column: 9)
!81 = !DILocation(line: 53, column: 14, scope: !25)
!82 = !DILocation(line: 53, column: 9, scope: !25)
!83 = !DILocation(line: 55, column: 1, scope: !14)
!84 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_good", scope: !15, file: !15, line: 133, type: !16, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!85 = !DILocation(line: 135, column: 5, scope: !84)
!86 = !DILocation(line: 136, column: 5, scope: !84)
!87 = !DILocation(line: 137, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 148, type: !89, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!89 = !DISubroutineType(types: !90)
!90 = !{!4, !4, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !15, line: 148, type: !4)
!95 = !DILocation(line: 148, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !15, line: 148, type: !91)
!97 = !DILocation(line: 148, column: 27, scope: !88)
!98 = !DILocation(line: 151, column: 22, scope: !88)
!99 = !DILocation(line: 151, column: 12, scope: !88)
!100 = !DILocation(line: 151, column: 5, scope: !88)
!101 = !DILocation(line: 153, column: 5, scope: !88)
!102 = !DILocation(line: 154, column: 5, scope: !88)
!103 = !DILocation(line: 155, column: 5, scope: !88)
!104 = !DILocation(line: 158, column: 5, scope: !88)
!105 = !DILocation(line: 159, column: 5, scope: !88)
!106 = !DILocation(line: 160, column: 5, scope: !88)
!107 = !DILocation(line: 162, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 64, type: !4)
!110 = !DILocation(line: 64, column: 9, scope: !108)
!111 = !DILocation(line: 66, column: 10, scope: !108)
!112 = !DILocation(line: 69, column: 10, scope: !108)
!113 = !DILocalVariable(name: "i", scope: !114, file: !15, line: 71, type: !4)
!114 = distinct !DILexicalBlock(scope: !108, file: !15, line: 70, column: 5)
!115 = !DILocation(line: 71, column: 13, scope: !114)
!116 = !DILocalVariable(name: "buffer", scope: !114, file: !15, line: 72, type: !3)
!117 = !DILocation(line: 72, column: 15, scope: !114)
!118 = !DILocation(line: 72, column: 31, scope: !114)
!119 = !DILocation(line: 72, column: 24, scope: !114)
!120 = !DILocation(line: 73, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !114, file: !15, line: 73, column: 13)
!122 = !DILocation(line: 73, column: 20, scope: !121)
!123 = !DILocation(line: 73, column: 13, scope: !114)
!124 = !DILocation(line: 73, column: 30, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 73, column: 29)
!126 = !DILocation(line: 75, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !114, file: !15, line: 75, column: 9)
!128 = !DILocation(line: 75, column: 14, scope: !127)
!129 = !DILocation(line: 75, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !15, line: 75, column: 9)
!131 = !DILocation(line: 75, column: 23, scope: !130)
!132 = !DILocation(line: 75, column: 9, scope: !127)
!133 = !DILocation(line: 77, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !15, line: 76, column: 9)
!135 = !DILocation(line: 77, column: 20, scope: !134)
!136 = !DILocation(line: 77, column: 23, scope: !134)
!137 = !DILocation(line: 78, column: 9, scope: !134)
!138 = !DILocation(line: 75, column: 30, scope: !130)
!139 = !DILocation(line: 75, column: 9, scope: !130)
!140 = distinct !{!140, !132, !141, !53}
!141 = !DILocation(line: 78, column: 9, scope: !127)
!142 = !DILocation(line: 81, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !114, file: !15, line: 81, column: 13)
!144 = !DILocation(line: 81, column: 18, scope: !143)
!145 = !DILocation(line: 81, column: 13, scope: !114)
!146 = !DILocation(line: 83, column: 13, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !15, line: 82, column: 9)
!148 = !DILocation(line: 83, column: 20, scope: !147)
!149 = !DILocation(line: 83, column: 26, scope: !147)
!150 = !DILocation(line: 85, column: 19, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !15, line: 85, column: 13)
!152 = !DILocation(line: 85, column: 17, scope: !151)
!153 = !DILocation(line: 85, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !15, line: 85, column: 13)
!155 = !DILocation(line: 85, column: 26, scope: !154)
!156 = !DILocation(line: 85, column: 13, scope: !151)
!157 = !DILocation(line: 87, column: 30, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 86, column: 13)
!159 = !DILocation(line: 87, column: 37, scope: !158)
!160 = !DILocation(line: 87, column: 17, scope: !158)
!161 = !DILocation(line: 88, column: 13, scope: !158)
!162 = !DILocation(line: 85, column: 33, scope: !154)
!163 = !DILocation(line: 85, column: 13, scope: !154)
!164 = distinct !{!164, !156, !165, !53}
!165 = !DILocation(line: 88, column: 13, scope: !151)
!166 = !DILocation(line: 89, column: 9, scope: !147)
!167 = !DILocation(line: 92, column: 13, scope: !168)
!168 = distinct !DILexicalBlock(scope: !143, file: !15, line: 91, column: 9)
!169 = !DILocation(line: 94, column: 14, scope: !114)
!170 = !DILocation(line: 94, column: 9, scope: !114)
!171 = !DILocation(line: 96, column: 1, scope: !108)
!172 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 99, type: !16, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!173 = !DILocalVariable(name: "data", scope: !172, file: !15, line: 101, type: !4)
!174 = !DILocation(line: 101, column: 9, scope: !172)
!175 = !DILocation(line: 103, column: 10, scope: !172)
!176 = !DILocation(line: 105, column: 12, scope: !172)
!177 = !DILocation(line: 105, column: 5, scope: !172)
!178 = !DILocalVariable(name: "i", scope: !179, file: !15, line: 107, type: !4)
!179 = distinct !DILexicalBlock(scope: !172, file: !15, line: 106, column: 5)
!180 = !DILocation(line: 107, column: 13, scope: !179)
!181 = !DILocalVariable(name: "buffer", scope: !179, file: !15, line: 108, type: !3)
!182 = !DILocation(line: 108, column: 15, scope: !179)
!183 = !DILocation(line: 108, column: 31, scope: !179)
!184 = !DILocation(line: 108, column: 24, scope: !179)
!185 = !DILocation(line: 109, column: 13, scope: !186)
!186 = distinct !DILexicalBlock(scope: !179, file: !15, line: 109, column: 13)
!187 = !DILocation(line: 109, column: 20, scope: !186)
!188 = !DILocation(line: 109, column: 13, scope: !179)
!189 = !DILocation(line: 109, column: 30, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !15, line: 109, column: 29)
!191 = !DILocation(line: 111, column: 16, scope: !192)
!192 = distinct !DILexicalBlock(scope: !179, file: !15, line: 111, column: 9)
!193 = !DILocation(line: 111, column: 14, scope: !192)
!194 = !DILocation(line: 111, column: 21, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !15, line: 111, column: 9)
!196 = !DILocation(line: 111, column: 23, scope: !195)
!197 = !DILocation(line: 111, column: 9, scope: !192)
!198 = !DILocation(line: 113, column: 13, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !15, line: 112, column: 9)
!200 = !DILocation(line: 113, column: 20, scope: !199)
!201 = !DILocation(line: 113, column: 23, scope: !199)
!202 = !DILocation(line: 114, column: 9, scope: !199)
!203 = !DILocation(line: 111, column: 30, scope: !195)
!204 = !DILocation(line: 111, column: 9, scope: !195)
!205 = distinct !{!205, !197, !206, !53}
!206 = !DILocation(line: 114, column: 9, scope: !192)
!207 = !DILocation(line: 116, column: 13, scope: !208)
!208 = distinct !DILexicalBlock(scope: !179, file: !15, line: 116, column: 13)
!209 = !DILocation(line: 116, column: 18, scope: !208)
!210 = !DILocation(line: 116, column: 23, scope: !208)
!211 = !DILocation(line: 116, column: 26, scope: !208)
!212 = !DILocation(line: 116, column: 31, scope: !208)
!213 = !DILocation(line: 116, column: 13, scope: !179)
!214 = !DILocation(line: 118, column: 13, scope: !215)
!215 = distinct !DILexicalBlock(scope: !208, file: !15, line: 117, column: 9)
!216 = !DILocation(line: 118, column: 20, scope: !215)
!217 = !DILocation(line: 118, column: 26, scope: !215)
!218 = !DILocation(line: 120, column: 19, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !15, line: 120, column: 13)
!220 = !DILocation(line: 120, column: 17, scope: !219)
!221 = !DILocation(line: 120, column: 24, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !15, line: 120, column: 13)
!223 = !DILocation(line: 120, column: 26, scope: !222)
!224 = !DILocation(line: 120, column: 13, scope: !219)
!225 = !DILocation(line: 122, column: 30, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !15, line: 121, column: 13)
!227 = !DILocation(line: 122, column: 37, scope: !226)
!228 = !DILocation(line: 122, column: 17, scope: !226)
!229 = !DILocation(line: 123, column: 13, scope: !226)
!230 = !DILocation(line: 120, column: 33, scope: !222)
!231 = !DILocation(line: 120, column: 13, scope: !222)
!232 = distinct !{!232, !224, !233, !53}
!233 = !DILocation(line: 123, column: 13, scope: !219)
!234 = !DILocation(line: 124, column: 9, scope: !215)
!235 = !DILocation(line: 127, column: 13, scope: !236)
!236 = distinct !DILexicalBlock(scope: !208, file: !15, line: 126, column: 9)
!237 = !DILocation(line: 129, column: 14, scope: !179)
!238 = !DILocation(line: 129, column: 9, scope: !179)
!239 = !DILocation(line: 131, column: 1, scope: !172)
