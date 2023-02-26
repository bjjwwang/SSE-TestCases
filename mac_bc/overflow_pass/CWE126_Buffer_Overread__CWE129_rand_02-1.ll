; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_rand_02_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
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
  store i32 %cond, i32* %data, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !24, metadata !DIExpression()), !dbg !31
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !31
  %1 = load i32, i32* %data, align 4, !dbg !32
  %cmp = icmp sge i32 %1, 0, !dbg !34
  br i1 %cmp, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !36
  %idxprom = sext i32 %2 to i64, !dbg !38
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !38
  %3 = load i32, i32* %arrayidx, align 4, !dbg !38
  call void @printIntLine(i32 noundef %3), !dbg !39
  br label %if.end, !dbg !40

if.else:                                          ; preds = %cond.end
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_rand_02_good() #0 !dbg !44 {
entry:
  call void @goodB2G1(), !dbg !45
  call void @goodB2G2(), !dbg !46
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @CWE126_Buffer_Overread__CWE129_rand_02_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  call void @CWE126_Buffer_Overread__CWE129_rand_02_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  %call = call i32 @rand(), !dbg !74
  %and = and i32 %call, 1, !dbg !74
  %tobool = icmp ne i32 %and, 0, !dbg !74
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !74

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !74
  %shl = shl i32 %call1, 30, !dbg !74
  %call2 = call i32 @rand(), !dbg !74
  %shl3 = shl i32 %call2, 15, !dbg !74
  %xor = xor i32 %shl, %shl3, !dbg !74
  %call4 = call i32 @rand(), !dbg !74
  %xor5 = xor i32 %xor, %call4, !dbg !74
  br label %cond.end, !dbg !74

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !74
  %shl7 = shl i32 %call6, 30, !dbg !74
  %call8 = call i32 @rand(), !dbg !74
  %shl9 = shl i32 %call8, 15, !dbg !74
  %xor10 = xor i32 %shl7, %shl9, !dbg !74
  %call11 = call i32 @rand(), !dbg !74
  %xor12 = xor i32 %xor10, %call11, !dbg !74
  %sub = sub i32 0, %xor12, !dbg !74
  %sub13 = sub i32 %sub, 1, !dbg !74
  br label %cond.end, !dbg !74

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !74
  store i32 %cond, i32* %data, align 4, !dbg !77
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !78, metadata !DIExpression()), !dbg !82
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !82
  %1 = load i32, i32* %data, align 4, !dbg !83
  %cmp = icmp sge i32 %1, 0, !dbg !85
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !86

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !87
  %cmp14 = icmp slt i32 %2, 10, !dbg !88
  br i1 %cmp14, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !90
  %idxprom = sext i32 %3 to i64, !dbg !92
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !92
  %4 = load i32, i32* %arrayidx, align 4, !dbg !92
  call void @printIntLine(i32 noundef %4), !dbg !93
  br label %if.end, !dbg !94

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !98 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32 -1, i32* %data, align 4, !dbg !101
  %call = call i32 @rand(), !dbg !102
  %and = and i32 %call, 1, !dbg !102
  %tobool = icmp ne i32 %and, 0, !dbg !102
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !102

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !102
  %shl = shl i32 %call1, 30, !dbg !102
  %call2 = call i32 @rand(), !dbg !102
  %shl3 = shl i32 %call2, 15, !dbg !102
  %xor = xor i32 %shl, %shl3, !dbg !102
  %call4 = call i32 @rand(), !dbg !102
  %xor5 = xor i32 %xor, %call4, !dbg !102
  br label %cond.end, !dbg !102

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !102
  %shl7 = shl i32 %call6, 30, !dbg !102
  %call8 = call i32 @rand(), !dbg !102
  %shl9 = shl i32 %call8, 15, !dbg !102
  %xor10 = xor i32 %shl7, %shl9, !dbg !102
  %call11 = call i32 @rand(), !dbg !102
  %xor12 = xor i32 %xor10, %call11, !dbg !102
  %sub = sub i32 0, %xor12, !dbg !102
  %sub13 = sub i32 %sub, 1, !dbg !102
  br label %cond.end, !dbg !102

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !102
  store i32 %cond, i32* %data, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !106, metadata !DIExpression()), !dbg !110
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !110
  %1 = load i32, i32* %data, align 4, !dbg !111
  %cmp = icmp sge i32 %1, 0, !dbg !113
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !114

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !115
  %cmp14 = icmp slt i32 %2, 10, !dbg !116
  br i1 %cmp14, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !118
  %idxprom = sext i32 %3 to i64, !dbg !120
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !120
  %4 = load i32, i32* %arrayidx, align 4, !dbg !120
  call void @printIntLine(i32 noundef %4), !dbg !121
  br label %if.end, !dbg !122

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !126 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !127, metadata !DIExpression()), !dbg !128
  store i32 -1, i32* %data, align 4, !dbg !129
  store i32 7, i32* %data, align 4, !dbg !130
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !133, metadata !DIExpression()), !dbg !137
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !137
  %1 = load i32, i32* %data, align 4, !dbg !138
  %cmp = icmp sge i32 %1, 0, !dbg !140
  br i1 %cmp, label %if.then, label %if.else, !dbg !141

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !142
  %idxprom = sext i32 %2 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !144
  %3 = load i32, i32* %arrayidx, align 4, !dbg !144
  call void @printIntLine(i32 noundef %3), !dbg !145
  br label %if.end, !dbg !146

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !147
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !151, metadata !DIExpression()), !dbg !152
  store i32 -1, i32* %data, align 4, !dbg !153
  store i32 7, i32* %data, align 4, !dbg !154
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !157, metadata !DIExpression()), !dbg !161
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !161
  %1 = load i32, i32* %data, align 4, !dbg !162
  %cmp = icmp sge i32 %1, 0, !dbg !164
  br i1 %cmp, label %if.then, label %if.else, !dbg !165

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !166
  %idxprom = sext i32 %2 to i64, !dbg !168
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !168
  %3 = load i32, i32* %arrayidx, align 4, !dbg !168
  call void @printIntLine(i32 noundef %3), !dbg !169
  br label %if.end, !dbg !170

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !171
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !173
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_02_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !3)
!18 = !DILocation(line: 24, column: 9, scope: !12)
!19 = !DILocation(line: 26, column: 10, scope: !12)
!20 = !DILocation(line: 30, column: 16, scope: !21)
!21 = distinct !DILexicalBlock(scope: !22, file: !13, line: 28, column: 5)
!22 = distinct !DILexicalBlock(scope: !12, file: !13, line: 27, column: 8)
!23 = !DILocation(line: 30, column: 14, scope: !21)
!24 = !DILocalVariable(name: "buffer", scope: !25, file: !13, line: 35, type: !28)
!25 = distinct !DILexicalBlock(scope: !26, file: !13, line: 34, column: 9)
!26 = distinct !DILexicalBlock(scope: !27, file: !13, line: 33, column: 5)
!27 = distinct !DILexicalBlock(scope: !12, file: !13, line: 32, column: 8)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3, size: 320, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 10)
!31 = !DILocation(line: 35, column: 17, scope: !25)
!32 = !DILocation(line: 38, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !25, file: !13, line: 38, column: 17)
!34 = !DILocation(line: 38, column: 22, scope: !33)
!35 = !DILocation(line: 38, column: 17, scope: !25)
!36 = !DILocation(line: 40, column: 37, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !13, line: 39, column: 13)
!38 = !DILocation(line: 40, column: 30, scope: !37)
!39 = !DILocation(line: 40, column: 17, scope: !37)
!40 = !DILocation(line: 41, column: 13, scope: !37)
!41 = !DILocation(line: 44, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !33, file: !13, line: 43, column: 13)
!43 = !DILocation(line: 48, column: 1, scope: !12)
!44 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_02_good", scope: !13, file: !13, line: 180, type: !14, scopeLine: 181, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!45 = !DILocation(line: 182, column: 5, scope: !44)
!46 = !DILocation(line: 183, column: 5, scope: !44)
!47 = !DILocation(line: 184, column: 5, scope: !44)
!48 = !DILocation(line: 185, column: 5, scope: !44)
!49 = !DILocation(line: 186, column: 1, scope: !44)
!50 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 197, type: !51, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!51 = !DISubroutineType(types: !52)
!52 = !{!3, !3, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !13, line: 197, type: !3)
!57 = !DILocation(line: 197, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !13, line: 197, type: !53)
!59 = !DILocation(line: 197, column: 27, scope: !50)
!60 = !DILocation(line: 200, column: 22, scope: !50)
!61 = !DILocation(line: 200, column: 12, scope: !50)
!62 = !DILocation(line: 200, column: 5, scope: !50)
!63 = !DILocation(line: 202, column: 5, scope: !50)
!64 = !DILocation(line: 203, column: 5, scope: !50)
!65 = !DILocation(line: 204, column: 5, scope: !50)
!66 = !DILocation(line: 207, column: 5, scope: !50)
!67 = !DILocation(line: 208, column: 5, scope: !50)
!68 = !DILocation(line: 209, column: 5, scope: !50)
!69 = !DILocation(line: 211, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 55, type: !14, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!71 = !DILocalVariable(name: "data", scope: !70, file: !13, line: 57, type: !3)
!72 = !DILocation(line: 57, column: 9, scope: !70)
!73 = !DILocation(line: 59, column: 10, scope: !70)
!74 = !DILocation(line: 63, column: 16, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !13, line: 61, column: 5)
!76 = distinct !DILexicalBlock(scope: !70, file: !13, line: 60, column: 8)
!77 = !DILocation(line: 63, column: 14, scope: !75)
!78 = !DILocalVariable(name: "buffer", scope: !79, file: !13, line: 73, type: !28)
!79 = distinct !DILexicalBlock(scope: !80, file: !13, line: 72, column: 9)
!80 = distinct !DILexicalBlock(scope: !81, file: !13, line: 71, column: 5)
!81 = distinct !DILexicalBlock(scope: !70, file: !13, line: 65, column: 8)
!82 = !DILocation(line: 73, column: 17, scope: !79)
!83 = !DILocation(line: 75, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !13, line: 75, column: 17)
!85 = !DILocation(line: 75, column: 22, scope: !84)
!86 = !DILocation(line: 75, column: 27, scope: !84)
!87 = !DILocation(line: 75, column: 30, scope: !84)
!88 = !DILocation(line: 75, column: 35, scope: !84)
!89 = !DILocation(line: 75, column: 17, scope: !79)
!90 = !DILocation(line: 77, column: 37, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !13, line: 76, column: 13)
!92 = !DILocation(line: 77, column: 30, scope: !91)
!93 = !DILocation(line: 77, column: 17, scope: !91)
!94 = !DILocation(line: 78, column: 13, scope: !91)
!95 = !DILocation(line: 81, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !84, file: !13, line: 80, column: 13)
!97 = !DILocation(line: 85, column: 1, scope: !70)
!98 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 88, type: !14, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!99 = !DILocalVariable(name: "data", scope: !98, file: !13, line: 90, type: !3)
!100 = !DILocation(line: 90, column: 9, scope: !98)
!101 = !DILocation(line: 92, column: 10, scope: !98)
!102 = !DILocation(line: 96, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !104, file: !13, line: 94, column: 5)
!104 = distinct !DILexicalBlock(scope: !98, file: !13, line: 93, column: 8)
!105 = !DILocation(line: 96, column: 14, scope: !103)
!106 = !DILocalVariable(name: "buffer", scope: !107, file: !13, line: 101, type: !28)
!107 = distinct !DILexicalBlock(scope: !108, file: !13, line: 100, column: 9)
!108 = distinct !DILexicalBlock(scope: !109, file: !13, line: 99, column: 5)
!109 = distinct !DILexicalBlock(scope: !98, file: !13, line: 98, column: 8)
!110 = !DILocation(line: 101, column: 17, scope: !107)
!111 = !DILocation(line: 103, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !13, line: 103, column: 17)
!113 = !DILocation(line: 103, column: 22, scope: !112)
!114 = !DILocation(line: 103, column: 27, scope: !112)
!115 = !DILocation(line: 103, column: 30, scope: !112)
!116 = !DILocation(line: 103, column: 35, scope: !112)
!117 = !DILocation(line: 103, column: 17, scope: !107)
!118 = !DILocation(line: 105, column: 37, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !13, line: 104, column: 13)
!120 = !DILocation(line: 105, column: 30, scope: !119)
!121 = !DILocation(line: 105, column: 17, scope: !119)
!122 = !DILocation(line: 106, column: 13, scope: !119)
!123 = !DILocation(line: 109, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !112, file: !13, line: 108, column: 13)
!125 = !DILocation(line: 113, column: 1, scope: !98)
!126 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 116, type: !14, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!127 = !DILocalVariable(name: "data", scope: !126, file: !13, line: 118, type: !3)
!128 = !DILocation(line: 118, column: 9, scope: !126)
!129 = !DILocation(line: 120, column: 10, scope: !126)
!130 = !DILocation(line: 130, column: 14, scope: !131)
!131 = distinct !DILexicalBlock(scope: !132, file: !13, line: 127, column: 5)
!132 = distinct !DILexicalBlock(scope: !126, file: !13, line: 121, column: 8)
!133 = !DILocalVariable(name: "buffer", scope: !134, file: !13, line: 135, type: !28)
!134 = distinct !DILexicalBlock(scope: !135, file: !13, line: 134, column: 9)
!135 = distinct !DILexicalBlock(scope: !136, file: !13, line: 133, column: 5)
!136 = distinct !DILexicalBlock(scope: !126, file: !13, line: 132, column: 8)
!137 = !DILocation(line: 135, column: 17, scope: !134)
!138 = !DILocation(line: 138, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !13, line: 138, column: 17)
!140 = !DILocation(line: 138, column: 22, scope: !139)
!141 = !DILocation(line: 138, column: 17, scope: !134)
!142 = !DILocation(line: 140, column: 37, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !13, line: 139, column: 13)
!144 = !DILocation(line: 140, column: 30, scope: !143)
!145 = !DILocation(line: 140, column: 17, scope: !143)
!146 = !DILocation(line: 141, column: 13, scope: !143)
!147 = !DILocation(line: 144, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !139, file: !13, line: 143, column: 13)
!149 = !DILocation(line: 148, column: 1, scope: !126)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 151, type: !14, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!151 = !DILocalVariable(name: "data", scope: !150, file: !13, line: 153, type: !3)
!152 = !DILocation(line: 153, column: 9, scope: !150)
!153 = !DILocation(line: 155, column: 10, scope: !150)
!154 = !DILocation(line: 160, column: 14, scope: !155)
!155 = distinct !DILexicalBlock(scope: !156, file: !13, line: 157, column: 5)
!156 = distinct !DILexicalBlock(scope: !150, file: !13, line: 156, column: 8)
!157 = !DILocalVariable(name: "buffer", scope: !158, file: !13, line: 165, type: !28)
!158 = distinct !DILexicalBlock(scope: !159, file: !13, line: 164, column: 9)
!159 = distinct !DILexicalBlock(scope: !160, file: !13, line: 163, column: 5)
!160 = distinct !DILexicalBlock(scope: !150, file: !13, line: 162, column: 8)
!161 = !DILocation(line: 165, column: 17, scope: !158)
!162 = !DILocation(line: 168, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !13, line: 168, column: 17)
!164 = !DILocation(line: 168, column: 22, scope: !163)
!165 = !DILocation(line: 168, column: 17, scope: !158)
!166 = !DILocation(line: 170, column: 37, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !13, line: 169, column: 13)
!168 = !DILocation(line: 170, column: 30, scope: !167)
!169 = !DILocation(line: 170, column: 17, scope: !167)
!170 = !DILocation(line: 171, column: 13, scope: !167)
!171 = !DILocation(line: 174, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !163, file: !13, line: 173, column: 13)
!173 = !DILocation(line: 178, column: 1, scope: !150)
