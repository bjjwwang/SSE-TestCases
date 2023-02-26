; ModuleID = 'linux_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_02-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_02-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_02_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %call = call i32 @rand() #5, !dbg !19
  %and = and i32 %call, 1, !dbg !19
  %tobool = icmp ne i32 %and, 0, !dbg !19
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !19

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !19
  %shl = shl i32 %call1, 30, !dbg !19
  %call2 = call i32 @rand() #5, !dbg !19
  %shl3 = shl i32 %call2, 15, !dbg !19
  %xor = xor i32 %shl, %shl3, !dbg !19
  %call4 = call i32 @rand() #5, !dbg !19
  %xor5 = xor i32 %xor, %call4, !dbg !19
  br label %cond.end, !dbg !19

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !19
  %shl7 = shl i32 %call6, 30, !dbg !19
  %call8 = call i32 @rand() #5, !dbg !19
  %shl9 = shl i32 %call8, 15, !dbg !19
  %xor10 = xor i32 %shl7, %shl9, !dbg !19
  %call11 = call i32 @rand() #5, !dbg !19
  %xor12 = xor i32 %xor10, %call11, !dbg !19
  %sub = sub i32 0, %xor12, !dbg !19
  %sub13 = sub i32 %sub, 1, !dbg !19
  br label %cond.end, !dbg !19

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !19
  store i32 %cond, i32* %data, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !23, metadata !DIExpression()), !dbg !30
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !30
  %1 = load i32, i32* %data, align 4, !dbg !31
  %cmp = icmp sge i32 %1, 0, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !35
  %idxprom = sext i32 %2 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !37
  %3 = load i32, i32* %arrayidx, align 4, !dbg !37
  call void @printIntLine(i32 %3), !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %cond.end
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !40
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_02_good() #0 !dbg !43 {
entry:
  call void @goodB2G1(), !dbg !44
  call void @goodB2G2(), !dbg !45
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__CWE129_rand_02_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  call void @CWE126_Buffer_Overread__CWE129_rand_02_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodB2G1() #0 !dbg !69 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 -1, i32* %data, align 4, !dbg !72
  %call = call i32 @rand() #5, !dbg !73
  %and = and i32 %call, 1, !dbg !73
  %tobool = icmp ne i32 %and, 0, !dbg !73
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !73

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !73
  %shl = shl i32 %call1, 30, !dbg !73
  %call2 = call i32 @rand() #5, !dbg !73
  %shl3 = shl i32 %call2, 15, !dbg !73
  %xor = xor i32 %shl, %shl3, !dbg !73
  %call4 = call i32 @rand() #5, !dbg !73
  %xor5 = xor i32 %xor, %call4, !dbg !73
  br label %cond.end, !dbg !73

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !73
  %shl7 = shl i32 %call6, 30, !dbg !73
  %call8 = call i32 @rand() #5, !dbg !73
  %shl9 = shl i32 %call8, 15, !dbg !73
  %xor10 = xor i32 %shl7, %shl9, !dbg !73
  %call11 = call i32 @rand() #5, !dbg !73
  %xor12 = xor i32 %xor10, %call11, !dbg !73
  %sub = sub i32 0, %xor12, !dbg !73
  %sub13 = sub i32 %sub, 1, !dbg !73
  br label %cond.end, !dbg !73

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !73
  store i32 %cond, i32* %data, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !77, metadata !DIExpression()), !dbg !81
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !81
  %1 = load i32, i32* %data, align 4, !dbg !82
  %cmp = icmp sge i32 %1, 0, !dbg !84
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !85

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !86
  %cmp14 = icmp slt i32 %2, 10, !dbg !87
  br i1 %cmp14, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !89
  %idxprom = sext i32 %3 to i64, !dbg !91
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !91
  %4 = load i32, i32* %arrayidx, align 4, !dbg !91
  call void @printIntLine(i32 %4), !dbg !92
  br label %if.end, !dbg !93

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodB2G2() #0 !dbg !97 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 -1, i32* %data, align 4, !dbg !100
  %call = call i32 @rand() #5, !dbg !101
  %and = and i32 %call, 1, !dbg !101
  %tobool = icmp ne i32 %and, 0, !dbg !101
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !101

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #5, !dbg !101
  %shl = shl i32 %call1, 30, !dbg !101
  %call2 = call i32 @rand() #5, !dbg !101
  %shl3 = shl i32 %call2, 15, !dbg !101
  %xor = xor i32 %shl, %shl3, !dbg !101
  %call4 = call i32 @rand() #5, !dbg !101
  %xor5 = xor i32 %xor, %call4, !dbg !101
  br label %cond.end, !dbg !101

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #5, !dbg !101
  %shl7 = shl i32 %call6, 30, !dbg !101
  %call8 = call i32 @rand() #5, !dbg !101
  %shl9 = shl i32 %call8, 15, !dbg !101
  %xor10 = xor i32 %shl7, %shl9, !dbg !101
  %call11 = call i32 @rand() #5, !dbg !101
  %xor12 = xor i32 %xor10, %call11, !dbg !101
  %sub = sub i32 0, %xor12, !dbg !101
  %sub13 = sub i32 %sub, 1, !dbg !101
  br label %cond.end, !dbg !101

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !101
  store i32 %cond, i32* %data, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !105, metadata !DIExpression()), !dbg !109
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !109
  %1 = load i32, i32* %data, align 4, !dbg !110
  %cmp = icmp sge i32 %1, 0, !dbg !112
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !113

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !114
  %cmp14 = icmp slt i32 %2, 10, !dbg !115
  br i1 %cmp14, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !117
  %idxprom = sext i32 %3 to i64, !dbg !119
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !119
  %4 = load i32, i32* %arrayidx, align 4, !dbg !119
  call void @printIntLine(i32 %4), !dbg !120
  br label %if.end, !dbg !121

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !125 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i32 -1, i32* %data, align 4, !dbg !128
  store i32 7, i32* %data, align 4, !dbg !129
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !132, metadata !DIExpression()), !dbg !136
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !136
  %1 = load i32, i32* %data, align 4, !dbg !137
  %cmp = icmp sge i32 %1, 0, !dbg !139
  br i1 %cmp, label %if.then, label %if.else, !dbg !140

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !141
  %idxprom = sext i32 %2 to i64, !dbg !143
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !143
  %3 = load i32, i32* %arrayidx, align 4, !dbg !143
  call void @printIntLine(i32 %3), !dbg !144
  br label %if.end, !dbg !145

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !146
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !150, metadata !DIExpression()), !dbg !151
  store i32 -1, i32* %data, align 4, !dbg !152
  store i32 7, i32* %data, align 4, !dbg !153
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !156, metadata !DIExpression()), !dbg !160
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !160
  %1 = load i32, i32* %data, align 4, !dbg !161
  %cmp = icmp sge i32 %1, 0, !dbg !163
  br i1 %cmp, label %if.then, label %if.else, !dbg !164

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !165
  %idxprom = sext i32 %2 to i64, !dbg !167
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !167
  %3 = load i32, i32* %arrayidx, align 4, !dbg !167
  call void @printIntLine(i32 %3), !dbg !168
  br label %if.end, !dbg !169

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !170
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_02_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !4)
!17 = !DILocation(line: 24, column: 9, scope: !12)
!18 = !DILocation(line: 26, column: 10, scope: !12)
!19 = !DILocation(line: 30, column: 16, scope: !20)
!20 = distinct !DILexicalBlock(scope: !21, file: !13, line: 28, column: 5)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 27, column: 8)
!22 = !DILocation(line: 30, column: 14, scope: !20)
!23 = !DILocalVariable(name: "buffer", scope: !24, file: !13, line: 35, type: !27)
!24 = distinct !DILexicalBlock(scope: !25, file: !13, line: 34, column: 9)
!25 = distinct !DILexicalBlock(scope: !26, file: !13, line: 33, column: 5)
!26 = distinct !DILexicalBlock(scope: !12, file: !13, line: 32, column: 8)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 35, column: 17, scope: !24)
!31 = !DILocation(line: 38, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !13, line: 38, column: 17)
!33 = !DILocation(line: 38, column: 22, scope: !32)
!34 = !DILocation(line: 38, column: 17, scope: !24)
!35 = !DILocation(line: 40, column: 37, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !13, line: 39, column: 13)
!37 = !DILocation(line: 40, column: 30, scope: !36)
!38 = !DILocation(line: 40, column: 17, scope: !36)
!39 = !DILocation(line: 41, column: 13, scope: !36)
!40 = !DILocation(line: 44, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !13, line: 43, column: 13)
!42 = !DILocation(line: 48, column: 1, scope: !12)
!43 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_02_good", scope: !13, file: !13, line: 180, type: !14, scopeLine: 181, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 182, column: 5, scope: !43)
!45 = !DILocation(line: 183, column: 5, scope: !43)
!46 = !DILocation(line: 184, column: 5, scope: !43)
!47 = !DILocation(line: 185, column: 5, scope: !43)
!48 = !DILocation(line: 186, column: 1, scope: !43)
!49 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 197, type: !50, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!4, !4, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !13, line: 197, type: !4)
!56 = !DILocation(line: 197, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !13, line: 197, type: !52)
!58 = !DILocation(line: 197, column: 27, scope: !49)
!59 = !DILocation(line: 200, column: 22, scope: !49)
!60 = !DILocation(line: 200, column: 12, scope: !49)
!61 = !DILocation(line: 200, column: 5, scope: !49)
!62 = !DILocation(line: 202, column: 5, scope: !49)
!63 = !DILocation(line: 203, column: 5, scope: !49)
!64 = !DILocation(line: 204, column: 5, scope: !49)
!65 = !DILocation(line: 207, column: 5, scope: !49)
!66 = !DILocation(line: 208, column: 5, scope: !49)
!67 = !DILocation(line: 209, column: 5, scope: !49)
!68 = !DILocation(line: 211, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodB2G1", scope: !13, file: !13, line: 55, type: !14, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !13, line: 57, type: !4)
!71 = !DILocation(line: 57, column: 9, scope: !69)
!72 = !DILocation(line: 59, column: 10, scope: !69)
!73 = !DILocation(line: 63, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !13, line: 61, column: 5)
!75 = distinct !DILexicalBlock(scope: !69, file: !13, line: 60, column: 8)
!76 = !DILocation(line: 63, column: 14, scope: !74)
!77 = !DILocalVariable(name: "buffer", scope: !78, file: !13, line: 73, type: !27)
!78 = distinct !DILexicalBlock(scope: !79, file: !13, line: 72, column: 9)
!79 = distinct !DILexicalBlock(scope: !80, file: !13, line: 71, column: 5)
!80 = distinct !DILexicalBlock(scope: !69, file: !13, line: 65, column: 8)
!81 = !DILocation(line: 73, column: 17, scope: !78)
!82 = !DILocation(line: 75, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !13, line: 75, column: 17)
!84 = !DILocation(line: 75, column: 22, scope: !83)
!85 = !DILocation(line: 75, column: 27, scope: !83)
!86 = !DILocation(line: 75, column: 30, scope: !83)
!87 = !DILocation(line: 75, column: 35, scope: !83)
!88 = !DILocation(line: 75, column: 17, scope: !78)
!89 = !DILocation(line: 77, column: 37, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !13, line: 76, column: 13)
!91 = !DILocation(line: 77, column: 30, scope: !90)
!92 = !DILocation(line: 77, column: 17, scope: !90)
!93 = !DILocation(line: 78, column: 13, scope: !90)
!94 = !DILocation(line: 81, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !13, line: 80, column: 13)
!96 = !DILocation(line: 85, column: 1, scope: !69)
!97 = distinct !DISubprogram(name: "goodB2G2", scope: !13, file: !13, line: 88, type: !14, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !13, line: 90, type: !4)
!99 = !DILocation(line: 90, column: 9, scope: !97)
!100 = !DILocation(line: 92, column: 10, scope: !97)
!101 = !DILocation(line: 96, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !13, line: 94, column: 5)
!103 = distinct !DILexicalBlock(scope: !97, file: !13, line: 93, column: 8)
!104 = !DILocation(line: 96, column: 14, scope: !102)
!105 = !DILocalVariable(name: "buffer", scope: !106, file: !13, line: 101, type: !27)
!106 = distinct !DILexicalBlock(scope: !107, file: !13, line: 100, column: 9)
!107 = distinct !DILexicalBlock(scope: !108, file: !13, line: 99, column: 5)
!108 = distinct !DILexicalBlock(scope: !97, file: !13, line: 98, column: 8)
!109 = !DILocation(line: 101, column: 17, scope: !106)
!110 = !DILocation(line: 103, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !13, line: 103, column: 17)
!112 = !DILocation(line: 103, column: 22, scope: !111)
!113 = !DILocation(line: 103, column: 27, scope: !111)
!114 = !DILocation(line: 103, column: 30, scope: !111)
!115 = !DILocation(line: 103, column: 35, scope: !111)
!116 = !DILocation(line: 103, column: 17, scope: !106)
!117 = !DILocation(line: 105, column: 37, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !13, line: 104, column: 13)
!119 = !DILocation(line: 105, column: 30, scope: !118)
!120 = !DILocation(line: 105, column: 17, scope: !118)
!121 = !DILocation(line: 106, column: 13, scope: !118)
!122 = !DILocation(line: 109, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !111, file: !13, line: 108, column: 13)
!124 = !DILocation(line: 113, column: 1, scope: !97)
!125 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 116, type: !14, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", scope: !125, file: !13, line: 118, type: !4)
!127 = !DILocation(line: 118, column: 9, scope: !125)
!128 = !DILocation(line: 120, column: 10, scope: !125)
!129 = !DILocation(line: 130, column: 14, scope: !130)
!130 = distinct !DILexicalBlock(scope: !131, file: !13, line: 127, column: 5)
!131 = distinct !DILexicalBlock(scope: !125, file: !13, line: 121, column: 8)
!132 = !DILocalVariable(name: "buffer", scope: !133, file: !13, line: 135, type: !27)
!133 = distinct !DILexicalBlock(scope: !134, file: !13, line: 134, column: 9)
!134 = distinct !DILexicalBlock(scope: !135, file: !13, line: 133, column: 5)
!135 = distinct !DILexicalBlock(scope: !125, file: !13, line: 132, column: 8)
!136 = !DILocation(line: 135, column: 17, scope: !133)
!137 = !DILocation(line: 138, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !13, line: 138, column: 17)
!139 = !DILocation(line: 138, column: 22, scope: !138)
!140 = !DILocation(line: 138, column: 17, scope: !133)
!141 = !DILocation(line: 140, column: 37, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !13, line: 139, column: 13)
!143 = !DILocation(line: 140, column: 30, scope: !142)
!144 = !DILocation(line: 140, column: 17, scope: !142)
!145 = !DILocation(line: 141, column: 13, scope: !142)
!146 = !DILocation(line: 144, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !138, file: !13, line: 143, column: 13)
!148 = !DILocation(line: 148, column: 1, scope: !125)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 151, type: !14, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !13, line: 153, type: !4)
!151 = !DILocation(line: 153, column: 9, scope: !149)
!152 = !DILocation(line: 155, column: 10, scope: !149)
!153 = !DILocation(line: 160, column: 14, scope: !154)
!154 = distinct !DILexicalBlock(scope: !155, file: !13, line: 157, column: 5)
!155 = distinct !DILexicalBlock(scope: !149, file: !13, line: 156, column: 8)
!156 = !DILocalVariable(name: "buffer", scope: !157, file: !13, line: 165, type: !27)
!157 = distinct !DILexicalBlock(scope: !158, file: !13, line: 164, column: 9)
!158 = distinct !DILexicalBlock(scope: !159, file: !13, line: 163, column: 5)
!159 = distinct !DILexicalBlock(scope: !149, file: !13, line: 162, column: 8)
!160 = !DILocation(line: 165, column: 17, scope: !157)
!161 = !DILocation(line: 168, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !13, line: 168, column: 17)
!163 = !DILocation(line: 168, column: 22, scope: !162)
!164 = !DILocation(line: 168, column: 17, scope: !157)
!165 = !DILocation(line: 170, column: 37, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !13, line: 169, column: 13)
!167 = !DILocation(line: 170, column: 30, scope: !166)
!168 = !DILocation(line: 170, column: 17, scope: !166)
!169 = !DILocation(line: 171, column: 13, scope: !166)
!170 = !DILocation(line: 174, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !162, file: !13, line: 173, column: 13)
!172 = !DILocation(line: 178, column: 1, scope: !149)
