; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i4 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %j, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  store i32 10, i32* %data, align 4, !dbg !31
  br label %for.inc, !dbg !33

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !34
  %inc = add nsw i32 %1, 1, !dbg !34
  store i32 %inc, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !35, !llvm.loop !36

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !39
  br label %for.cond1, !dbg !41

for.cond1:                                        ; preds = %for.inc14, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !42
  %cmp2 = icmp slt i32 %2, 1, !dbg !44
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !45

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i4, metadata !46, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !50, metadata !DIExpression()), !dbg !54
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !54
  %4 = load i32, i32* %data, align 4, !dbg !55
  %cmp5 = icmp sge i32 %4, 0, !dbg !57
  br i1 %cmp5, label %if.then, label %if.else, !dbg !58

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !59
  %idxprom = sext i32 %5 to i64, !dbg !61
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !61
  store i32 1, i32* %arrayidx, align 4, !dbg !62
  store i32 0, i32* %i4, align 4, !dbg !63
  br label %for.cond6, !dbg !65

for.cond6:                                        ; preds = %for.inc11, %if.then
  %6 = load i32, i32* %i4, align 4, !dbg !66
  %cmp7 = icmp slt i32 %6, 10, !dbg !68
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !69

for.body8:                                        ; preds = %for.cond6
  %7 = load i32, i32* %i4, align 4, !dbg !70
  %idxprom9 = sext i32 %7 to i64, !dbg !72
  %arrayidx10 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom9, !dbg !72
  %8 = load i32, i32* %arrayidx10, align 4, !dbg !72
  call void @printIntLine(i32 noundef %8), !dbg !73
  br label %for.inc11, !dbg !74

for.inc11:                                        ; preds = %for.body8
  %9 = load i32, i32* %i4, align 4, !dbg !75
  %inc12 = add nsw i32 %9, 1, !dbg !75
  store i32 %inc12, i32* %i4, align 4, !dbg !75
  br label %for.cond6, !dbg !76, !llvm.loop !77

for.end13:                                        ; preds = %for.cond6
  br label %if.end, !dbg !79

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !80
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end13
  br label %for.inc14, !dbg !82

for.inc14:                                        ; preds = %if.end
  %10 = load i32, i32* %j, align 4, !dbg !83
  %inc15 = add nsw i32 %10, 1, !dbg !83
  store i32 %inc15, i32* %j, align 4, !dbg !83
  br label %for.cond1, !dbg !84, !llvm.loop !85

for.end16:                                        ; preds = %for.cond1
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_good() #0 !dbg !88 {
entry:
  call void @goodB2G(), !dbg !89
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* noundef null), !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 noundef %conv), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_good(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_bad(), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !112 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %i4 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32* %k, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32* %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 -1, i32* %data, align 4, !dbg !119
  store i32 0, i32* %i, align 4, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !123
  %cmp = icmp slt i32 %0, 1, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  store i32 10, i32* %data, align 4, !dbg !127
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !130
  %inc = add nsw i32 %1, 1, !dbg !130
  store i32 %inc, i32* %i, align 4, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !134
  br label %for.cond1, !dbg !136

for.cond1:                                        ; preds = %for.inc15, %for.end
  %2 = load i32, i32* %k, align 4, !dbg !137
  %cmp2 = icmp slt i32 %2, 1, !dbg !139
  br i1 %cmp2, label %for.body3, label %for.end17, !dbg !140

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i4, metadata !141, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !145, metadata !DIExpression()), !dbg !146
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !146
  %4 = load i32, i32* %data, align 4, !dbg !147
  %cmp5 = icmp sge i32 %4, 0, !dbg !149
  br i1 %cmp5, label %land.lhs.true, label %if.else, !dbg !150

land.lhs.true:                                    ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !151
  %cmp6 = icmp slt i32 %5, 10, !dbg !152
  br i1 %cmp6, label %if.then, label %if.else, !dbg !153

if.then:                                          ; preds = %land.lhs.true
  %6 = load i32, i32* %data, align 4, !dbg !154
  %idxprom = sext i32 %6 to i64, !dbg !156
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !156
  store i32 1, i32* %arrayidx, align 4, !dbg !157
  store i32 0, i32* %i4, align 4, !dbg !158
  br label %for.cond7, !dbg !160

for.cond7:                                        ; preds = %for.inc12, %if.then
  %7 = load i32, i32* %i4, align 4, !dbg !161
  %cmp8 = icmp slt i32 %7, 10, !dbg !163
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !164

for.body9:                                        ; preds = %for.cond7
  %8 = load i32, i32* %i4, align 4, !dbg !165
  %idxprom10 = sext i32 %8 to i64, !dbg !167
  %arrayidx11 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom10, !dbg !167
  %9 = load i32, i32* %arrayidx11, align 4, !dbg !167
  call void @printIntLine(i32 noundef %9), !dbg !168
  br label %for.inc12, !dbg !169

for.inc12:                                        ; preds = %for.body9
  %10 = load i32, i32* %i4, align 4, !dbg !170
  %inc13 = add nsw i32 %10, 1, !dbg !170
  store i32 %inc13, i32* %i4, align 4, !dbg !170
  br label %for.cond7, !dbg !171, !llvm.loop !172

for.end14:                                        ; preds = %for.cond7
  br label %if.end, !dbg !174

if.else:                                          ; preds = %land.lhs.true, %for.body3
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !175
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end14
  br label %for.inc15, !dbg !177

for.inc15:                                        ; preds = %if.end
  %11 = load i32, i32* %k, align 4, !dbg !178
  %inc16 = add nsw i32 %11, 1, !dbg !178
  store i32 %inc16, i32* %k, align 4, !dbg !178
  br label %for.cond1, !dbg !179, !llvm.loop !180

for.end17:                                        ; preds = %for.cond1
  ret void, !dbg !182
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !183 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i32* %j, metadata !186, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata i32* %data, metadata !188, metadata !DIExpression()), !dbg !189
  store i32 -1, i32* %data, align 4, !dbg !190
  store i32 0, i32* %h, align 4, !dbg !191
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !194
  %cmp = icmp slt i32 %0, 1, !dbg !196
  br i1 %cmp, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !198
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !201
  %inc = add nsw i32 %1, 1, !dbg !201
  store i32 %inc, i32* %h, align 4, !dbg !201
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !205
  br label %for.cond1, !dbg !207

for.cond1:                                        ; preds = %for.inc13, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !208
  %cmp2 = icmp slt i32 %2, 1, !dbg !210
  br i1 %cmp2, label %for.body3, label %for.end15, !dbg !211

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !212, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !216, metadata !DIExpression()), !dbg !217
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !217
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !217
  %4 = load i32, i32* %data, align 4, !dbg !218
  %cmp4 = icmp sge i32 %4, 0, !dbg !220
  br i1 %cmp4, label %if.then, label %if.else, !dbg !221

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !222
  %idxprom = sext i32 %5 to i64, !dbg !224
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !224
  store i32 1, i32* %arrayidx, align 4, !dbg !225
  store i32 0, i32* %i, align 4, !dbg !226
  br label %for.cond5, !dbg !228

for.cond5:                                        ; preds = %for.inc10, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !229
  %cmp6 = icmp slt i32 %6, 10, !dbg !231
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !232

for.body7:                                        ; preds = %for.cond5
  %7 = load i32, i32* %i, align 4, !dbg !233
  %idxprom8 = sext i32 %7 to i64, !dbg !235
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !235
  %8 = load i32, i32* %arrayidx9, align 4, !dbg !235
  call void @printIntLine(i32 noundef %8), !dbg !236
  br label %for.inc10, !dbg !237

for.inc10:                                        ; preds = %for.body7
  %9 = load i32, i32* %i, align 4, !dbg !238
  %inc11 = add nsw i32 %9, 1, !dbg !238
  store i32 %inc11, i32* %i, align 4, !dbg !238
  br label %for.cond5, !dbg !239, !llvm.loop !240

for.end12:                                        ; preds = %for.cond5
  br label %if.end, !dbg !242

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !243
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end12
  br label %for.inc13, !dbg !245

for.inc13:                                        ; preds = %if.end
  %10 = load i32, i32* %j, align 4, !dbg !246
  %inc14 = add nsw i32 %10, 1, !dbg !246
  store i32 %inc14, i32* %j, align 4, !dbg !246
  br label %for.cond1, !dbg !247, !llvm.loop !248

for.end15:                                        ; preds = %for.cond1
  ret void, !dbg !250
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 24, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 24, column: 9, scope: !11)
!19 = !DILocalVariable(name: "j", scope: !11, file: !12, line: 24, type: !17)
!20 = !DILocation(line: 24, column: 11, scope: !11)
!21 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!22 = !DILocation(line: 25, column: 9, scope: !11)
!23 = !DILocation(line: 27, column: 10, scope: !11)
!24 = !DILocation(line: 28, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!26 = !DILocation(line: 28, column: 9, scope: !25)
!27 = !DILocation(line: 28, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !12, line: 28, column: 5)
!29 = !DILocation(line: 28, column: 18, scope: !28)
!30 = !DILocation(line: 28, column: 5, scope: !25)
!31 = !DILocation(line: 31, column: 14, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 29, column: 5)
!33 = !DILocation(line: 32, column: 5, scope: !32)
!34 = !DILocation(line: 28, column: 24, scope: !28)
!35 = !DILocation(line: 28, column: 5, scope: !28)
!36 = distinct !{!36, !30, !37, !38}
!37 = !DILocation(line: 32, column: 5, scope: !25)
!38 = !{!"llvm.loop.mustprogress"}
!39 = !DILocation(line: 33, column: 11, scope: !40)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!41 = !DILocation(line: 33, column: 9, scope: !40)
!42 = !DILocation(line: 33, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 33, column: 5)
!44 = !DILocation(line: 33, column: 18, scope: !43)
!45 = !DILocation(line: 33, column: 5, scope: !40)
!46 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 36, type: !17)
!47 = distinct !DILexicalBlock(scope: !48, file: !12, line: 35, column: 9)
!48 = distinct !DILexicalBlock(scope: !43, file: !12, line: 34, column: 5)
!49 = !DILocation(line: 36, column: 17, scope: !47)
!50 = !DILocalVariable(name: "buffer", scope: !47, file: !12, line: 37, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 10)
!54 = !DILocation(line: 37, column: 17, scope: !47)
!55 = !DILocation(line: 40, column: 17, scope: !56)
!56 = distinct !DILexicalBlock(scope: !47, file: !12, line: 40, column: 17)
!57 = !DILocation(line: 40, column: 22, scope: !56)
!58 = !DILocation(line: 40, column: 17, scope: !47)
!59 = !DILocation(line: 42, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !12, line: 41, column: 13)
!61 = !DILocation(line: 42, column: 17, scope: !60)
!62 = !DILocation(line: 42, column: 30, scope: !60)
!63 = !DILocation(line: 44, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !12, line: 44, column: 17)
!65 = !DILocation(line: 44, column: 21, scope: !64)
!66 = !DILocation(line: 44, column: 28, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !12, line: 44, column: 17)
!68 = !DILocation(line: 44, column: 30, scope: !67)
!69 = !DILocation(line: 44, column: 17, scope: !64)
!70 = !DILocation(line: 46, column: 41, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !12, line: 45, column: 17)
!72 = !DILocation(line: 46, column: 34, scope: !71)
!73 = !DILocation(line: 46, column: 21, scope: !71)
!74 = !DILocation(line: 47, column: 17, scope: !71)
!75 = !DILocation(line: 44, column: 37, scope: !67)
!76 = !DILocation(line: 44, column: 17, scope: !67)
!77 = distinct !{!77, !69, !78, !38}
!78 = !DILocation(line: 47, column: 17, scope: !64)
!79 = !DILocation(line: 48, column: 13, scope: !60)
!80 = !DILocation(line: 51, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !56, file: !12, line: 50, column: 13)
!82 = !DILocation(line: 54, column: 5, scope: !48)
!83 = !DILocation(line: 33, column: 24, scope: !43)
!84 = !DILocation(line: 33, column: 5, scope: !43)
!85 = distinct !{!85, !45, !86, !38}
!86 = !DILocation(line: 54, column: 5, scope: !40)
!87 = !DILocation(line: 55, column: 1, scope: !11)
!88 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_17_good", scope: !12, file: !12, line: 133, type: !13, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!89 = !DILocation(line: 135, column: 5, scope: !88)
!90 = !DILocation(line: 136, column: 5, scope: !88)
!91 = !DILocation(line: 137, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 148, type: !93, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!93 = !DISubroutineType(types: !94)
!94 = !{!17, !17, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !12, line: 148, type: !17)
!99 = !DILocation(line: 148, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !12, line: 148, type: !95)
!101 = !DILocation(line: 148, column: 27, scope: !92)
!102 = !DILocation(line: 151, column: 22, scope: !92)
!103 = !DILocation(line: 151, column: 12, scope: !92)
!104 = !DILocation(line: 151, column: 5, scope: !92)
!105 = !DILocation(line: 153, column: 5, scope: !92)
!106 = !DILocation(line: 154, column: 5, scope: !92)
!107 = !DILocation(line: 155, column: 5, scope: !92)
!108 = !DILocation(line: 158, column: 5, scope: !92)
!109 = !DILocation(line: 159, column: 5, scope: !92)
!110 = !DILocation(line: 160, column: 5, scope: !92)
!111 = !DILocation(line: 162, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!113 = !DILocalVariable(name: "i", scope: !112, file: !12, line: 64, type: !17)
!114 = !DILocation(line: 64, column: 9, scope: !112)
!115 = !DILocalVariable(name: "k", scope: !112, file: !12, line: 64, type: !17)
!116 = !DILocation(line: 64, column: 11, scope: !112)
!117 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 65, type: !17)
!118 = !DILocation(line: 65, column: 9, scope: !112)
!119 = !DILocation(line: 67, column: 10, scope: !112)
!120 = !DILocation(line: 68, column: 11, scope: !121)
!121 = distinct !DILexicalBlock(scope: !112, file: !12, line: 68, column: 5)
!122 = !DILocation(line: 68, column: 9, scope: !121)
!123 = !DILocation(line: 68, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 68, column: 5)
!125 = !DILocation(line: 68, column: 18, scope: !124)
!126 = !DILocation(line: 68, column: 5, scope: !121)
!127 = !DILocation(line: 71, column: 14, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !12, line: 69, column: 5)
!129 = !DILocation(line: 72, column: 5, scope: !128)
!130 = !DILocation(line: 68, column: 24, scope: !124)
!131 = !DILocation(line: 68, column: 5, scope: !124)
!132 = distinct !{!132, !126, !133, !38}
!133 = !DILocation(line: 72, column: 5, scope: !121)
!134 = !DILocation(line: 73, column: 11, scope: !135)
!135 = distinct !DILexicalBlock(scope: !112, file: !12, line: 73, column: 5)
!136 = !DILocation(line: 73, column: 9, scope: !135)
!137 = !DILocation(line: 73, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 73, column: 5)
!139 = !DILocation(line: 73, column: 18, scope: !138)
!140 = !DILocation(line: 73, column: 5, scope: !135)
!141 = !DILocalVariable(name: "i", scope: !142, file: !12, line: 76, type: !17)
!142 = distinct !DILexicalBlock(scope: !143, file: !12, line: 75, column: 9)
!143 = distinct !DILexicalBlock(scope: !138, file: !12, line: 74, column: 5)
!144 = !DILocation(line: 76, column: 17, scope: !142)
!145 = !DILocalVariable(name: "buffer", scope: !142, file: !12, line: 77, type: !51)
!146 = !DILocation(line: 77, column: 17, scope: !142)
!147 = !DILocation(line: 79, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !12, line: 79, column: 17)
!149 = !DILocation(line: 79, column: 22, scope: !148)
!150 = !DILocation(line: 79, column: 27, scope: !148)
!151 = !DILocation(line: 79, column: 30, scope: !148)
!152 = !DILocation(line: 79, column: 35, scope: !148)
!153 = !DILocation(line: 79, column: 17, scope: !142)
!154 = !DILocation(line: 81, column: 24, scope: !155)
!155 = distinct !DILexicalBlock(scope: !148, file: !12, line: 80, column: 13)
!156 = !DILocation(line: 81, column: 17, scope: !155)
!157 = !DILocation(line: 81, column: 30, scope: !155)
!158 = !DILocation(line: 83, column: 23, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !12, line: 83, column: 17)
!160 = !DILocation(line: 83, column: 21, scope: !159)
!161 = !DILocation(line: 83, column: 28, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 83, column: 17)
!163 = !DILocation(line: 83, column: 30, scope: !162)
!164 = !DILocation(line: 83, column: 17, scope: !159)
!165 = !DILocation(line: 85, column: 41, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !12, line: 84, column: 17)
!167 = !DILocation(line: 85, column: 34, scope: !166)
!168 = !DILocation(line: 85, column: 21, scope: !166)
!169 = !DILocation(line: 86, column: 17, scope: !166)
!170 = !DILocation(line: 83, column: 37, scope: !162)
!171 = !DILocation(line: 83, column: 17, scope: !162)
!172 = distinct !{!172, !164, !173, !38}
!173 = !DILocation(line: 86, column: 17, scope: !159)
!174 = !DILocation(line: 87, column: 13, scope: !155)
!175 = !DILocation(line: 90, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !148, file: !12, line: 89, column: 13)
!177 = !DILocation(line: 93, column: 5, scope: !143)
!178 = !DILocation(line: 73, column: 24, scope: !138)
!179 = !DILocation(line: 73, column: 5, scope: !138)
!180 = distinct !{!180, !140, !181, !38}
!181 = !DILocation(line: 93, column: 5, scope: !135)
!182 = !DILocation(line: 94, column: 1, scope: !112)
!183 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!184 = !DILocalVariable(name: "h", scope: !183, file: !12, line: 99, type: !17)
!185 = !DILocation(line: 99, column: 9, scope: !183)
!186 = !DILocalVariable(name: "j", scope: !183, file: !12, line: 99, type: !17)
!187 = !DILocation(line: 99, column: 11, scope: !183)
!188 = !DILocalVariable(name: "data", scope: !183, file: !12, line: 100, type: !17)
!189 = !DILocation(line: 100, column: 9, scope: !183)
!190 = !DILocation(line: 102, column: 10, scope: !183)
!191 = !DILocation(line: 103, column: 11, scope: !192)
!192 = distinct !DILexicalBlock(scope: !183, file: !12, line: 103, column: 5)
!193 = !DILocation(line: 103, column: 9, scope: !192)
!194 = !DILocation(line: 103, column: 16, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !12, line: 103, column: 5)
!196 = !DILocation(line: 103, column: 18, scope: !195)
!197 = !DILocation(line: 103, column: 5, scope: !192)
!198 = !DILocation(line: 107, column: 14, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !12, line: 104, column: 5)
!200 = !DILocation(line: 108, column: 5, scope: !199)
!201 = !DILocation(line: 103, column: 24, scope: !195)
!202 = !DILocation(line: 103, column: 5, scope: !195)
!203 = distinct !{!203, !197, !204, !38}
!204 = !DILocation(line: 108, column: 5, scope: !192)
!205 = !DILocation(line: 109, column: 11, scope: !206)
!206 = distinct !DILexicalBlock(scope: !183, file: !12, line: 109, column: 5)
!207 = !DILocation(line: 109, column: 9, scope: !206)
!208 = !DILocation(line: 109, column: 16, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !12, line: 109, column: 5)
!210 = !DILocation(line: 109, column: 18, scope: !209)
!211 = !DILocation(line: 109, column: 5, scope: !206)
!212 = !DILocalVariable(name: "i", scope: !213, file: !12, line: 112, type: !17)
!213 = distinct !DILexicalBlock(scope: !214, file: !12, line: 111, column: 9)
!214 = distinct !DILexicalBlock(scope: !209, file: !12, line: 110, column: 5)
!215 = !DILocation(line: 112, column: 17, scope: !213)
!216 = !DILocalVariable(name: "buffer", scope: !213, file: !12, line: 113, type: !51)
!217 = !DILocation(line: 113, column: 17, scope: !213)
!218 = !DILocation(line: 116, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !213, file: !12, line: 116, column: 17)
!220 = !DILocation(line: 116, column: 22, scope: !219)
!221 = !DILocation(line: 116, column: 17, scope: !213)
!222 = !DILocation(line: 118, column: 24, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !12, line: 117, column: 13)
!224 = !DILocation(line: 118, column: 17, scope: !223)
!225 = !DILocation(line: 118, column: 30, scope: !223)
!226 = !DILocation(line: 120, column: 23, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !12, line: 120, column: 17)
!228 = !DILocation(line: 120, column: 21, scope: !227)
!229 = !DILocation(line: 120, column: 28, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !12, line: 120, column: 17)
!231 = !DILocation(line: 120, column: 30, scope: !230)
!232 = !DILocation(line: 120, column: 17, scope: !227)
!233 = !DILocation(line: 122, column: 41, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !12, line: 121, column: 17)
!235 = !DILocation(line: 122, column: 34, scope: !234)
!236 = !DILocation(line: 122, column: 21, scope: !234)
!237 = !DILocation(line: 123, column: 17, scope: !234)
!238 = !DILocation(line: 120, column: 37, scope: !230)
!239 = !DILocation(line: 120, column: 17, scope: !230)
!240 = distinct !{!240, !232, !241, !38}
!241 = !DILocation(line: 123, column: 17, scope: !227)
!242 = !DILocation(line: 124, column: 13, scope: !223)
!243 = !DILocation(line: 127, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !219, file: !12, line: 126, column: 13)
!245 = !DILocation(line: 130, column: 5, scope: !214)
!246 = !DILocation(line: 109, column: 24, scope: !209)
!247 = !DILocation(line: 109, column: 5, scope: !209)
!248 = distinct !{!248, !211, !249, !38}
!249 = !DILocation(line: 130, column: 5, scope: !206)
!250 = !DILocation(line: 131, column: 1, scope: !183)
