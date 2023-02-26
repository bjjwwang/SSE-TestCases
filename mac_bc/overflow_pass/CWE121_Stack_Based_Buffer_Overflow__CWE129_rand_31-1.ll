; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data14 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %call = call i32 @rand(), !dbg !20
  %and = and i32 %call, 1, !dbg !20
  %tobool = icmp ne i32 %and, 0, !dbg !20
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !20

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !20
  %shl = shl i32 %call1, 30, !dbg !20
  %call2 = call i32 @rand(), !dbg !20
  %shl3 = shl i32 %call2, 15, !dbg !20
  %xor = xor i32 %shl, %shl3, !dbg !20
  %call4 = call i32 @rand(), !dbg !20
  %xor5 = xor i32 %xor, %call4, !dbg !20
  br label %cond.end, !dbg !20

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !20
  %shl7 = shl i32 %call6, 30, !dbg !20
  %call8 = call i32 @rand(), !dbg !20
  %shl9 = shl i32 %call8, 15, !dbg !20
  %xor10 = xor i32 %shl7, %shl9, !dbg !20
  %call11 = call i32 @rand(), !dbg !20
  %xor12 = xor i32 %xor10, %call11, !dbg !20
  %sub = sub i32 0, %xor12, !dbg !20
  %sub13 = sub i32 %sub, 1, !dbg !20
  br label %cond.end, !dbg !20

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !20
  store i32 %cond, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !22, metadata !DIExpression()), !dbg !24
  %0 = load i32, i32* %data, align 4, !dbg !25
  store i32 %0, i32* %dataCopy, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %data14, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = load i32, i32* %dataCopy, align 4, !dbg !28
  store i32 %1, i32* %data14, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !32, metadata !DIExpression()), !dbg !36
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !36
  %3 = load i32, i32* %data14, align 4, !dbg !37
  %cmp = icmp sge i32 %3, 0, !dbg !39
  br i1 %cmp, label %if.then, label %if.else, !dbg !40

if.then:                                          ; preds = %cond.end
  %4 = load i32, i32* %data14, align 4, !dbg !41
  %idxprom = sext i32 %4 to i64, !dbg !43
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !43
  store i32 1, i32* %arrayidx, align 4, !dbg !44
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !48
  %cmp15 = icmp slt i32 %5, 10, !dbg !50
  br i1 %cmp15, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !52
  %idxprom16 = sext i32 %6 to i64, !dbg !54
  %arrayidx17 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom16, !dbg !54
  %7 = load i32, i32* %arrayidx17, align 4, !dbg !54
  call void @printIntLine(i32 noundef %7), !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !57
  %inc = add nsw i32 %8, 1, !dbg !57
  store i32 %inc, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !62

if.else:                                          ; preds = %cond.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !63
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  call void @goodB2G(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* noundef null), !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 noundef %conv), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_good(), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_bad(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32 -1, i32* %data, align 4, !dbg !93
  store i32 7, i32* %data, align 4, !dbg !94
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !95, metadata !DIExpression()), !dbg !97
  %0 = load i32, i32* %data, align 4, !dbg !98
  store i32 %0, i32* %dataCopy, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !99, metadata !DIExpression()), !dbg !100
  %1 = load i32, i32* %dataCopy, align 4, !dbg !101
  store i32 %1, i32* %data1, align 4, !dbg !100
  call void @llvm.dbg.declare(metadata i32* %i, metadata !102, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !105, metadata !DIExpression()), !dbg !106
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !106
  %3 = load i32, i32* %data1, align 4, !dbg !107
  %cmp = icmp sge i32 %3, 0, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !111
  %idxprom = sext i32 %4 to i64, !dbg !113
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !113
  store i32 1, i32* %arrayidx, align 4, !dbg !114
  store i32 0, i32* %i, align 4, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !118
  %cmp2 = icmp slt i32 %5, 10, !dbg !120
  br i1 %cmp2, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !122
  %idxprom3 = sext i32 %6 to i64, !dbg !124
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !124
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !124
  call void @printIntLine(i32 noundef %7), !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !127
  %inc = add nsw i32 %8, 1, !dbg !127
  store i32 %inc, i32* %i, align 4, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !131

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !132
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !135 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data14 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !136, metadata !DIExpression()), !dbg !137
  store i32 -1, i32* %data, align 4, !dbg !138
  %call = call i32 @rand(), !dbg !139
  %and = and i32 %call, 1, !dbg !139
  %tobool = icmp ne i32 %and, 0, !dbg !139
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !139

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !139
  %shl = shl i32 %call1, 30, !dbg !139
  %call2 = call i32 @rand(), !dbg !139
  %shl3 = shl i32 %call2, 15, !dbg !139
  %xor = xor i32 %shl, %shl3, !dbg !139
  %call4 = call i32 @rand(), !dbg !139
  %xor5 = xor i32 %xor, %call4, !dbg !139
  br label %cond.end, !dbg !139

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !139
  %shl7 = shl i32 %call6, 30, !dbg !139
  %call8 = call i32 @rand(), !dbg !139
  %shl9 = shl i32 %call8, 15, !dbg !139
  %xor10 = xor i32 %shl7, %shl9, !dbg !139
  %call11 = call i32 @rand(), !dbg !139
  %xor12 = xor i32 %xor10, %call11, !dbg !139
  %sub = sub i32 0, %xor12, !dbg !139
  %sub13 = sub i32 %sub, 1, !dbg !139
  br label %cond.end, !dbg !139

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !139
  store i32 %cond, i32* %data, align 4, !dbg !140
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !141, metadata !DIExpression()), !dbg !143
  %0 = load i32, i32* %data, align 4, !dbg !144
  store i32 %0, i32* %dataCopy, align 4, !dbg !143
  call void @llvm.dbg.declare(metadata i32* %data14, metadata !145, metadata !DIExpression()), !dbg !146
  %1 = load i32, i32* %dataCopy, align 4, !dbg !147
  store i32 %1, i32* %data14, align 4, !dbg !146
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !151, metadata !DIExpression()), !dbg !152
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !152
  %3 = load i32, i32* %data14, align 4, !dbg !153
  %cmp = icmp sge i32 %3, 0, !dbg !155
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !156

land.lhs.true:                                    ; preds = %cond.end
  %4 = load i32, i32* %data14, align 4, !dbg !157
  %cmp15 = icmp slt i32 %4, 10, !dbg !158
  br i1 %cmp15, label %if.then, label %if.else, !dbg !159

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %data14, align 4, !dbg !160
  %idxprom = sext i32 %5 to i64, !dbg !162
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !162
  store i32 1, i32* %arrayidx, align 4, !dbg !163
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !167
  %cmp16 = icmp slt i32 %6, 10, !dbg !169
  br i1 %cmp16, label %for.body, label %for.end, !dbg !170

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !171
  %idxprom17 = sext i32 %7 to i64, !dbg !173
  %arrayidx18 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom17, !dbg !173
  %8 = load i32, i32* %arrayidx18, align 4, !dbg !173
  call void @printIntLine(i32 noundef %8), !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !176
  %inc = add nsw i32 %9, 1, !dbg !176
  store i32 %inc, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !180

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !181
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !183
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4}
!3 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !3)
!18 = !DILocation(line: 24, column: 9, scope: !12)
!19 = !DILocation(line: 26, column: 10, scope: !12)
!20 = !DILocation(line: 28, column: 12, scope: !12)
!21 = !DILocation(line: 28, column: 10, scope: !12)
!22 = !DILocalVariable(name: "dataCopy", scope: !23, file: !13, line: 30, type: !3)
!23 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!24 = !DILocation(line: 30, column: 13, scope: !23)
!25 = !DILocation(line: 30, column: 24, scope: !23)
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 31, type: !3)
!27 = !DILocation(line: 31, column: 13, scope: !23)
!28 = !DILocation(line: 31, column: 20, scope: !23)
!29 = !DILocalVariable(name: "i", scope: !30, file: !13, line: 33, type: !3)
!30 = distinct !DILexicalBlock(scope: !23, file: !13, line: 32, column: 9)
!31 = !DILocation(line: 33, column: 17, scope: !30)
!32 = !DILocalVariable(name: "buffer", scope: !30, file: !13, line: 34, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3, size: 320, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 10)
!36 = !DILocation(line: 34, column: 17, scope: !30)
!37 = !DILocation(line: 37, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !13, line: 37, column: 17)
!39 = !DILocation(line: 37, column: 22, scope: !38)
!40 = !DILocation(line: 37, column: 17, scope: !30)
!41 = !DILocation(line: 39, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !13, line: 38, column: 13)
!43 = !DILocation(line: 39, column: 17, scope: !42)
!44 = !DILocation(line: 39, column: 30, scope: !42)
!45 = !DILocation(line: 41, column: 23, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !13, line: 41, column: 17)
!47 = !DILocation(line: 41, column: 21, scope: !46)
!48 = !DILocation(line: 41, column: 28, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !13, line: 41, column: 17)
!50 = !DILocation(line: 41, column: 30, scope: !49)
!51 = !DILocation(line: 41, column: 17, scope: !46)
!52 = !DILocation(line: 43, column: 41, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !13, line: 42, column: 17)
!54 = !DILocation(line: 43, column: 34, scope: !53)
!55 = !DILocation(line: 43, column: 21, scope: !53)
!56 = !DILocation(line: 44, column: 17, scope: !53)
!57 = !DILocation(line: 41, column: 37, scope: !49)
!58 = !DILocation(line: 41, column: 17, scope: !49)
!59 = distinct !{!59, !51, !60, !61}
!60 = !DILocation(line: 44, column: 17, scope: !46)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 45, column: 13, scope: !42)
!63 = !DILocation(line: 48, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !38, file: !13, line: 47, column: 13)
!65 = !DILocation(line: 52, column: 1, scope: !12)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_31_good", scope: !13, file: !13, line: 124, type: !14, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!67 = !DILocation(line: 126, column: 5, scope: !66)
!68 = !DILocation(line: 127, column: 5, scope: !66)
!69 = !DILocation(line: 128, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 138, type: !71, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!71 = !DISubroutineType(types: !72)
!72 = !{!3, !3, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !13, line: 138, type: !3)
!77 = !DILocation(line: 138, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !13, line: 138, type: !73)
!79 = !DILocation(line: 138, column: 27, scope: !70)
!80 = !DILocation(line: 141, column: 22, scope: !70)
!81 = !DILocation(line: 141, column: 12, scope: !70)
!82 = !DILocation(line: 141, column: 5, scope: !70)
!83 = !DILocation(line: 143, column: 5, scope: !70)
!84 = !DILocation(line: 144, column: 5, scope: !70)
!85 = !DILocation(line: 145, column: 5, scope: !70)
!86 = !DILocation(line: 148, column: 5, scope: !70)
!87 = !DILocation(line: 149, column: 5, scope: !70)
!88 = !DILocation(line: 150, column: 5, scope: !70)
!89 = !DILocation(line: 152, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 59, type: !14, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!91 = !DILocalVariable(name: "data", scope: !90, file: !13, line: 61, type: !3)
!92 = !DILocation(line: 61, column: 9, scope: !90)
!93 = !DILocation(line: 63, column: 10, scope: !90)
!94 = !DILocation(line: 66, column: 10, scope: !90)
!95 = !DILocalVariable(name: "dataCopy", scope: !96, file: !13, line: 68, type: !3)
!96 = distinct !DILexicalBlock(scope: !90, file: !13, line: 67, column: 5)
!97 = !DILocation(line: 68, column: 13, scope: !96)
!98 = !DILocation(line: 68, column: 24, scope: !96)
!99 = !DILocalVariable(name: "data", scope: !96, file: !13, line: 69, type: !3)
!100 = !DILocation(line: 69, column: 13, scope: !96)
!101 = !DILocation(line: 69, column: 20, scope: !96)
!102 = !DILocalVariable(name: "i", scope: !103, file: !13, line: 71, type: !3)
!103 = distinct !DILexicalBlock(scope: !96, file: !13, line: 70, column: 9)
!104 = !DILocation(line: 71, column: 17, scope: !103)
!105 = !DILocalVariable(name: "buffer", scope: !103, file: !13, line: 72, type: !33)
!106 = !DILocation(line: 72, column: 17, scope: !103)
!107 = !DILocation(line: 75, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !13, line: 75, column: 17)
!109 = !DILocation(line: 75, column: 22, scope: !108)
!110 = !DILocation(line: 75, column: 17, scope: !103)
!111 = !DILocation(line: 77, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !13, line: 76, column: 13)
!113 = !DILocation(line: 77, column: 17, scope: !112)
!114 = !DILocation(line: 77, column: 30, scope: !112)
!115 = !DILocation(line: 79, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !13, line: 79, column: 17)
!117 = !DILocation(line: 79, column: 21, scope: !116)
!118 = !DILocation(line: 79, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !13, line: 79, column: 17)
!120 = !DILocation(line: 79, column: 30, scope: !119)
!121 = !DILocation(line: 79, column: 17, scope: !116)
!122 = !DILocation(line: 81, column: 41, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !13, line: 80, column: 17)
!124 = !DILocation(line: 81, column: 34, scope: !123)
!125 = !DILocation(line: 81, column: 21, scope: !123)
!126 = !DILocation(line: 82, column: 17, scope: !123)
!127 = !DILocation(line: 79, column: 37, scope: !119)
!128 = !DILocation(line: 79, column: 17, scope: !119)
!129 = distinct !{!129, !121, !130, !61}
!130 = !DILocation(line: 82, column: 17, scope: !116)
!131 = !DILocation(line: 83, column: 13, scope: !112)
!132 = !DILocation(line: 86, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !108, file: !13, line: 85, column: 13)
!134 = !DILocation(line: 90, column: 1, scope: !90)
!135 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 93, type: !14, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!136 = !DILocalVariable(name: "data", scope: !135, file: !13, line: 95, type: !3)
!137 = !DILocation(line: 95, column: 9, scope: !135)
!138 = !DILocation(line: 97, column: 10, scope: !135)
!139 = !DILocation(line: 99, column: 12, scope: !135)
!140 = !DILocation(line: 99, column: 10, scope: !135)
!141 = !DILocalVariable(name: "dataCopy", scope: !142, file: !13, line: 101, type: !3)
!142 = distinct !DILexicalBlock(scope: !135, file: !13, line: 100, column: 5)
!143 = !DILocation(line: 101, column: 13, scope: !142)
!144 = !DILocation(line: 101, column: 24, scope: !142)
!145 = !DILocalVariable(name: "data", scope: !142, file: !13, line: 102, type: !3)
!146 = !DILocation(line: 102, column: 13, scope: !142)
!147 = !DILocation(line: 102, column: 20, scope: !142)
!148 = !DILocalVariable(name: "i", scope: !149, file: !13, line: 104, type: !3)
!149 = distinct !DILexicalBlock(scope: !142, file: !13, line: 103, column: 9)
!150 = !DILocation(line: 104, column: 17, scope: !149)
!151 = !DILocalVariable(name: "buffer", scope: !149, file: !13, line: 105, type: !33)
!152 = !DILocation(line: 105, column: 17, scope: !149)
!153 = !DILocation(line: 107, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !13, line: 107, column: 17)
!155 = !DILocation(line: 107, column: 22, scope: !154)
!156 = !DILocation(line: 107, column: 27, scope: !154)
!157 = !DILocation(line: 107, column: 30, scope: !154)
!158 = !DILocation(line: 107, column: 35, scope: !154)
!159 = !DILocation(line: 107, column: 17, scope: !149)
!160 = !DILocation(line: 109, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !13, line: 108, column: 13)
!162 = !DILocation(line: 109, column: 17, scope: !161)
!163 = !DILocation(line: 109, column: 30, scope: !161)
!164 = !DILocation(line: 111, column: 23, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !13, line: 111, column: 17)
!166 = !DILocation(line: 111, column: 21, scope: !165)
!167 = !DILocation(line: 111, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !13, line: 111, column: 17)
!169 = !DILocation(line: 111, column: 30, scope: !168)
!170 = !DILocation(line: 111, column: 17, scope: !165)
!171 = !DILocation(line: 113, column: 41, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !13, line: 112, column: 17)
!173 = !DILocation(line: 113, column: 34, scope: !172)
!174 = !DILocation(line: 113, column: 21, scope: !172)
!175 = !DILocation(line: 114, column: 17, scope: !172)
!176 = !DILocation(line: 111, column: 37, scope: !168)
!177 = !DILocation(line: 111, column: 17, scope: !168)
!178 = distinct !{!178, !170, !179, !61}
!179 = !DILocation(line: 114, column: 17, scope: !165)
!180 = !DILocation(line: 115, column: 13, scope: !161)
!181 = !DILocation(line: 118, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !154, file: !13, line: 117, column: 13)
!183 = !DILocation(line: 122, column: 1, scope: !135)
