; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_rand_42_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* %data, align 4, !dbg !20
  %call = call i32 @badSource(i32 noundef %0), !dbg !21
  store i32 %call, i32* %data, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !23, metadata !DIExpression()), !dbg !28
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !28
  %2 = load i32, i32* %data, align 4, !dbg !29
  %cmp = icmp sge i32 %2, 0, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !33
  %idxprom = sext i32 %3 to i64, !dbg !35
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !35
  %4 = load i32, i32* %arrayidx, align 4, !dbg !35
  call void @printIntLine(i32 noundef %4), !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @badSource(i32 noundef %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call i32 @rand(), !dbg !46
  %and = and i32 %call, 1, !dbg !46
  %tobool = icmp ne i32 %and, 0, !dbg !46
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !46

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !46
  %shl = shl i32 %call1, 30, !dbg !46
  %call2 = call i32 @rand(), !dbg !46
  %shl3 = shl i32 %call2, 15, !dbg !46
  %xor = xor i32 %shl, %shl3, !dbg !46
  %call4 = call i32 @rand(), !dbg !46
  %xor5 = xor i32 %xor, %call4, !dbg !46
  br label %cond.end, !dbg !46

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !46
  %shl7 = shl i32 %call6, 30, !dbg !46
  %call8 = call i32 @rand(), !dbg !46
  %shl9 = shl i32 %call8, 15, !dbg !46
  %xor10 = xor i32 %shl7, %shl9, !dbg !46
  %call11 = call i32 @rand(), !dbg !46
  %xor12 = xor i32 %xor10, %call11, !dbg !46
  %sub = sub i32 0, %xor12, !dbg !46
  %sub13 = sub i32 %sub, 1, !dbg !46
  br label %cond.end, !dbg !46

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !46
  store i32 %cond, i32* %data.addr, align 4, !dbg !47
  %0 = load i32, i32* %data.addr, align 4, !dbg !48
  ret i32 %0, !dbg !49
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_rand_42_good() #0 !dbg !50 {
entry:
  call void @goodB2G(), !dbg !51
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE126_Buffer_Overread__CWE129_rand_42_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__CWE129_rand_42_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare i32 @rand() #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 -1, i32* %data, align 4, !dbg !77
  %0 = load i32, i32* %data, align 4, !dbg !78
  %call = call i32 @goodB2GSource(i32 noundef %0), !dbg !79
  store i32 %call, i32* %data, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !81, metadata !DIExpression()), !dbg !83
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !83
  %2 = load i32, i32* %data, align 4, !dbg !84
  %cmp = icmp sge i32 %2, 0, !dbg !86
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !87

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !88
  %cmp1 = icmp slt i32 %3, 10, !dbg !89
  br i1 %cmp1, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !91
  %idxprom = sext i32 %4 to i64, !dbg !93
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !93
  %5 = load i32, i32* %arrayidx, align 4, !dbg !93
  call void @printIntLine(i32 noundef %5), !dbg !94
  br label %if.end, !dbg !95

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodB2GSource(i32 noundef %data) #0 !dbg !99 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !100, metadata !DIExpression()), !dbg !101
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
  store i32 %cond, i32* %data.addr, align 4, !dbg !103
  %0 = load i32, i32* %data.addr, align 4, !dbg !104
  ret i32 %0, !dbg !105
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %data, align 4, !dbg !109
  %0 = load i32, i32* %data, align 4, !dbg !110
  %call = call i32 @goodG2BSource(i32 noundef %0), !dbg !111
  store i32 %call, i32* %data, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !113, metadata !DIExpression()), !dbg !115
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !115
  %2 = load i32, i32* %data, align 4, !dbg !116
  %cmp = icmp sge i32 %2, 0, !dbg !118
  br i1 %cmp, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !120
  %idxprom = sext i32 %3 to i64, !dbg !122
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !122
  %4 = load i32, i32* %arrayidx, align 4, !dbg !122
  call void @printIntLine(i32 noundef %4), !dbg !123
  br label %if.end, !dbg !124

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !125
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodG2BSource(i32 noundef %data) #0 !dbg !128 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !129, metadata !DIExpression()), !dbg !130
  store i32 7, i32* %data.addr, align 4, !dbg !131
  %0 = load i32, i32* %data.addr, align 4, !dbg !132
  ret i32 %0, !dbg !133
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_42_bad", scope: !13, file: !13, line: 29, type: !14, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 9, scope: !12)
!19 = !DILocation(line: 33, column: 10, scope: !12)
!20 = !DILocation(line: 34, column: 22, scope: !12)
!21 = !DILocation(line: 34, column: 12, scope: !12)
!22 = !DILocation(line: 34, column: 10, scope: !12)
!23 = !DILocalVariable(name: "buffer", scope: !24, file: !13, line: 36, type: !25)
!24 = distinct !DILexicalBlock(scope: !12, file: !13, line: 35, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 36, column: 13, scope: !24)
!29 = !DILocation(line: 39, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !24, file: !13, line: 39, column: 13)
!31 = !DILocation(line: 39, column: 18, scope: !30)
!32 = !DILocation(line: 39, column: 13, scope: !24)
!33 = !DILocation(line: 41, column: 33, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !13, line: 40, column: 9)
!35 = !DILocation(line: 41, column: 26, scope: !34)
!36 = !DILocation(line: 41, column: 13, scope: !34)
!37 = !DILocation(line: 42, column: 9, scope: !34)
!38 = !DILocation(line: 45, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !13, line: 44, column: 9)
!40 = !DILocation(line: 48, column: 1, scope: !12)
!41 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 22, type: !42, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!42 = !DISubroutineType(types: !43)
!43 = !{!4, !4}
!44 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !13, line: 22, type: !4)
!45 = !DILocation(line: 22, column: 26, scope: !41)
!46 = !DILocation(line: 25, column: 12, scope: !41)
!47 = !DILocation(line: 25, column: 10, scope: !41)
!48 = !DILocation(line: 26, column: 12, scope: !41)
!49 = !DILocation(line: 26, column: 5, scope: !41)
!50 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_42_good", scope: !13, file: !13, line: 112, type: !14, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!51 = !DILocation(line: 114, column: 5, scope: !50)
!52 = !DILocation(line: 115, column: 5, scope: !50)
!53 = !DILocation(line: 116, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 127, type: !55, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!55 = !DISubroutineType(types: !56)
!56 = !{!4, !4, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !13, line: 127, type: !4)
!61 = !DILocation(line: 127, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !13, line: 127, type: !57)
!63 = !DILocation(line: 127, column: 27, scope: !54)
!64 = !DILocation(line: 130, column: 22, scope: !54)
!65 = !DILocation(line: 130, column: 12, scope: !54)
!66 = !DILocation(line: 130, column: 5, scope: !54)
!67 = !DILocation(line: 132, column: 5, scope: !54)
!68 = !DILocation(line: 133, column: 5, scope: !54)
!69 = !DILocation(line: 134, column: 5, scope: !54)
!70 = !DILocation(line: 137, column: 5, scope: !54)
!71 = !DILocation(line: 138, column: 5, scope: !54)
!72 = !DILocation(line: 139, column: 5, scope: !54)
!73 = !DILocation(line: 141, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 92, type: !14, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!75 = !DILocalVariable(name: "data", scope: !74, file: !13, line: 94, type: !4)
!76 = !DILocation(line: 94, column: 9, scope: !74)
!77 = !DILocation(line: 96, column: 10, scope: !74)
!78 = !DILocation(line: 97, column: 26, scope: !74)
!79 = !DILocation(line: 97, column: 12, scope: !74)
!80 = !DILocation(line: 97, column: 10, scope: !74)
!81 = !DILocalVariable(name: "buffer", scope: !82, file: !13, line: 99, type: !25)
!82 = distinct !DILexicalBlock(scope: !74, file: !13, line: 98, column: 5)
!83 = !DILocation(line: 99, column: 13, scope: !82)
!84 = !DILocation(line: 101, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !13, line: 101, column: 13)
!86 = !DILocation(line: 101, column: 18, scope: !85)
!87 = !DILocation(line: 101, column: 23, scope: !85)
!88 = !DILocation(line: 101, column: 26, scope: !85)
!89 = !DILocation(line: 101, column: 31, scope: !85)
!90 = !DILocation(line: 101, column: 13, scope: !82)
!91 = !DILocation(line: 103, column: 33, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !13, line: 102, column: 9)
!93 = !DILocation(line: 103, column: 26, scope: !92)
!94 = !DILocation(line: 103, column: 13, scope: !92)
!95 = !DILocation(line: 104, column: 9, scope: !92)
!96 = !DILocation(line: 107, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !85, file: !13, line: 106, column: 9)
!98 = !DILocation(line: 110, column: 1, scope: !74)
!99 = distinct !DISubprogram(name: "goodB2GSource", scope: !13, file: !13, line: 85, type: !42, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!100 = !DILocalVariable(name: "data", arg: 1, scope: !99, file: !13, line: 85, type: !4)
!101 = !DILocation(line: 85, column: 30, scope: !99)
!102 = !DILocation(line: 88, column: 12, scope: !99)
!103 = !DILocation(line: 88, column: 10, scope: !99)
!104 = !DILocation(line: 89, column: 12, scope: !99)
!105 = !DILocation(line: 89, column: 5, scope: !99)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 63, type: !14, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!107 = !DILocalVariable(name: "data", scope: !106, file: !13, line: 65, type: !4)
!108 = !DILocation(line: 65, column: 9, scope: !106)
!109 = !DILocation(line: 67, column: 10, scope: !106)
!110 = !DILocation(line: 68, column: 26, scope: !106)
!111 = !DILocation(line: 68, column: 12, scope: !106)
!112 = !DILocation(line: 68, column: 10, scope: !106)
!113 = !DILocalVariable(name: "buffer", scope: !114, file: !13, line: 70, type: !25)
!114 = distinct !DILexicalBlock(scope: !106, file: !13, line: 69, column: 5)
!115 = !DILocation(line: 70, column: 13, scope: !114)
!116 = !DILocation(line: 73, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !13, line: 73, column: 13)
!118 = !DILocation(line: 73, column: 18, scope: !117)
!119 = !DILocation(line: 73, column: 13, scope: !114)
!120 = !DILocation(line: 75, column: 33, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !13, line: 74, column: 9)
!122 = !DILocation(line: 75, column: 26, scope: !121)
!123 = !DILocation(line: 75, column: 13, scope: !121)
!124 = !DILocation(line: 76, column: 9, scope: !121)
!125 = !DILocation(line: 79, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !117, file: !13, line: 78, column: 9)
!127 = !DILocation(line: 82, column: 1, scope: !106)
!128 = distinct !DISubprogram(name: "goodG2BSource", scope: !13, file: !13, line: 55, type: !42, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!129 = !DILocalVariable(name: "data", arg: 1, scope: !128, file: !13, line: 55, type: !4)
!130 = !DILocation(line: 55, column: 30, scope: !128)
!131 = !DILocation(line: 59, column: 10, scope: !128)
!132 = !DILocation(line: 60, column: 12, scope: !128)
!133 = !DILocation(line: 60, column: 5, scope: !128)
