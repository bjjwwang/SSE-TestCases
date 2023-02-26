; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_rand_41_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
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
  %0 = load i32, i32* %data, align 4, !dbg !22
  call void @badSink(i32 noundef %0), !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !25 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !30, metadata !DIExpression()), !dbg !35
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !35
  %1 = load i32, i32* %data.addr, align 4, !dbg !36
  %cmp = icmp sge i32 %1, 0, !dbg !38
  br i1 %cmp, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !40
  %idxprom = sext i32 %2 to i64, !dbg !42
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !42
  %3 = load i32, i32* %arrayidx, align 4, !dbg !42
  call void @printIntLine(i32 noundef %3), !dbg !43
  br label %if.end, !dbg !44

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !45
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_rand_41_good() #0 !dbg !48 {
entry:
  call void @goodB2G(), !dbg !49
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE126_Buffer_Overread__CWE129_rand_41_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__CWE129_rand_41_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !72 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 -1, i32* %data, align 4, !dbg !75
  %call = call i32 @rand(), !dbg !76
  %and = and i32 %call, 1, !dbg !76
  %tobool = icmp ne i32 %and, 0, !dbg !76
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !76

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !76
  %shl = shl i32 %call1, 30, !dbg !76
  %call2 = call i32 @rand(), !dbg !76
  %shl3 = shl i32 %call2, 15, !dbg !76
  %xor = xor i32 %shl, %shl3, !dbg !76
  %call4 = call i32 @rand(), !dbg !76
  %xor5 = xor i32 %xor, %call4, !dbg !76
  br label %cond.end, !dbg !76

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !76
  %shl7 = shl i32 %call6, 30, !dbg !76
  %call8 = call i32 @rand(), !dbg !76
  %shl9 = shl i32 %call8, 15, !dbg !76
  %xor10 = xor i32 %shl7, %shl9, !dbg !76
  %call11 = call i32 @rand(), !dbg !76
  %xor12 = xor i32 %xor10, %call11, !dbg !76
  %sub = sub i32 0, %xor12, !dbg !76
  %sub13 = sub i32 %sub, 1, !dbg !76
  br label %cond.end, !dbg !76

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !76
  store i32 %cond, i32* %data, align 4, !dbg !77
  %0 = load i32, i32* %data, align 4, !dbg !78
  call void @goodB2GSink(i32 noundef %0), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2GSink(i32 noundef %data) #0 !dbg !81 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !84, metadata !DIExpression()), !dbg !86
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !86
  %1 = load i32, i32* %data.addr, align 4, !dbg !87
  %cmp = icmp sge i32 %1, 0, !dbg !89
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !90

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !91
  %cmp1 = icmp slt i32 %2, 10, !dbg !92
  br i1 %cmp1, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !94
  %idxprom = sext i32 %3 to i64, !dbg !96
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !96
  %4 = load i32, i32* %arrayidx, align 4, !dbg !96
  call void @printIntLine(i32 noundef %4), !dbg !97
  br label %if.end, !dbg !98

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !103, metadata !DIExpression()), !dbg !104
  store i32 -1, i32* %data, align 4, !dbg !105
  store i32 7, i32* %data, align 4, !dbg !106
  %0 = load i32, i32* %data, align 4, !dbg !107
  call void @goodG2BSink(i32 noundef %0), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !110 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !113, metadata !DIExpression()), !dbg !115
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !115
  %1 = load i32, i32* %data.addr, align 4, !dbg !116
  %cmp = icmp sge i32 %1, 0, !dbg !118
  br i1 %cmp, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !120
  %idxprom = sext i32 %2 to i64, !dbg !122
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !122
  %3 = load i32, i32* %arrayidx, align 4, !dbg !122
  call void @printIntLine(i32 noundef %3), !dbg !123
  br label %if.end, !dbg !124

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !125
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_41_bad", scope: !13, file: !13, line: 39, type: !14, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 41, type: !3)
!18 = !DILocation(line: 41, column: 9, scope: !12)
!19 = !DILocation(line: 43, column: 10, scope: !12)
!20 = !DILocation(line: 45, column: 12, scope: !12)
!21 = !DILocation(line: 45, column: 10, scope: !12)
!22 = !DILocation(line: 46, column: 13, scope: !12)
!23 = !DILocation(line: 46, column: 5, scope: !12)
!24 = !DILocation(line: 47, column: 1, scope: !12)
!25 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 22, type: !26, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !3}
!28 = !DILocalVariable(name: "data", arg: 1, scope: !25, file: !13, line: 22, type: !3)
!29 = !DILocation(line: 22, column: 25, scope: !25)
!30 = !DILocalVariable(name: "buffer", scope: !31, file: !13, line: 25, type: !32)
!31 = distinct !DILexicalBlock(scope: !25, file: !13, line: 24, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3, size: 320, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 10)
!35 = !DILocation(line: 25, column: 13, scope: !31)
!36 = !DILocation(line: 28, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !13, line: 28, column: 13)
!38 = !DILocation(line: 28, column: 18, scope: !37)
!39 = !DILocation(line: 28, column: 13, scope: !31)
!40 = !DILocation(line: 30, column: 33, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !13, line: 29, column: 9)
!42 = !DILocation(line: 30, column: 26, scope: !41)
!43 = !DILocation(line: 30, column: 13, scope: !41)
!44 = !DILocation(line: 31, column: 9, scope: !41)
!45 = !DILocation(line: 34, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !37, file: !13, line: 33, column: 9)
!47 = !DILocation(line: 37, column: 1, scope: !25)
!48 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_41_good", scope: !13, file: !13, line: 109, type: !14, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!49 = !DILocation(line: 111, column: 5, scope: !48)
!50 = !DILocation(line: 112, column: 5, scope: !48)
!51 = !DILocation(line: 113, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 124, type: !53, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!53 = !DISubroutineType(types: !54)
!54 = !{!3, !3, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !13, line: 124, type: !3)
!59 = !DILocation(line: 124, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !13, line: 124, type: !55)
!61 = !DILocation(line: 124, column: 27, scope: !52)
!62 = !DILocation(line: 127, column: 22, scope: !52)
!63 = !DILocation(line: 127, column: 12, scope: !52)
!64 = !DILocation(line: 127, column: 5, scope: !52)
!65 = !DILocation(line: 129, column: 5, scope: !52)
!66 = !DILocation(line: 130, column: 5, scope: !52)
!67 = !DILocation(line: 131, column: 5, scope: !52)
!68 = !DILocation(line: 134, column: 5, scope: !52)
!69 = !DILocation(line: 135, column: 5, scope: !52)
!70 = !DILocation(line: 136, column: 5, scope: !52)
!71 = !DILocation(line: 138, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 99, type: !14, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!73 = !DILocalVariable(name: "data", scope: !72, file: !13, line: 101, type: !3)
!74 = !DILocation(line: 101, column: 9, scope: !72)
!75 = !DILocation(line: 103, column: 10, scope: !72)
!76 = !DILocation(line: 105, column: 12, scope: !72)
!77 = !DILocation(line: 105, column: 10, scope: !72)
!78 = !DILocation(line: 106, column: 17, scope: !72)
!79 = !DILocation(line: 106, column: 5, scope: !72)
!80 = !DILocation(line: 107, column: 1, scope: !72)
!81 = distinct !DISubprogram(name: "goodB2GSink", scope: !13, file: !13, line: 83, type: !26, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!82 = !DILocalVariable(name: "data", arg: 1, scope: !81, file: !13, line: 83, type: !3)
!83 = !DILocation(line: 83, column: 29, scope: !81)
!84 = !DILocalVariable(name: "buffer", scope: !85, file: !13, line: 86, type: !32)
!85 = distinct !DILexicalBlock(scope: !81, file: !13, line: 85, column: 5)
!86 = !DILocation(line: 86, column: 13, scope: !85)
!87 = !DILocation(line: 88, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !13, line: 88, column: 13)
!89 = !DILocation(line: 88, column: 18, scope: !88)
!90 = !DILocation(line: 88, column: 23, scope: !88)
!91 = !DILocation(line: 88, column: 26, scope: !88)
!92 = !DILocation(line: 88, column: 31, scope: !88)
!93 = !DILocation(line: 88, column: 13, scope: !85)
!94 = !DILocation(line: 90, column: 33, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !13, line: 89, column: 9)
!96 = !DILocation(line: 90, column: 26, scope: !95)
!97 = !DILocation(line: 90, column: 13, scope: !95)
!98 = !DILocation(line: 91, column: 9, scope: !95)
!99 = !DILocation(line: 94, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !88, file: !13, line: 93, column: 9)
!101 = !DILocation(line: 97, column: 1, scope: !81)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 71, type: !14, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!103 = !DILocalVariable(name: "data", scope: !102, file: !13, line: 73, type: !3)
!104 = !DILocation(line: 73, column: 9, scope: !102)
!105 = !DILocation(line: 75, column: 10, scope: !102)
!106 = !DILocation(line: 78, column: 10, scope: !102)
!107 = !DILocation(line: 79, column: 17, scope: !102)
!108 = !DILocation(line: 79, column: 5, scope: !102)
!109 = !DILocation(line: 80, column: 1, scope: !102)
!110 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 54, type: !26, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!111 = !DILocalVariable(name: "data", arg: 1, scope: !110, file: !13, line: 54, type: !3)
!112 = !DILocation(line: 54, column: 29, scope: !110)
!113 = !DILocalVariable(name: "buffer", scope: !114, file: !13, line: 57, type: !32)
!114 = distinct !DILexicalBlock(scope: !110, file: !13, line: 56, column: 5)
!115 = !DILocation(line: 57, column: 13, scope: !114)
!116 = !DILocation(line: 60, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !13, line: 60, column: 13)
!118 = !DILocation(line: 60, column: 18, scope: !117)
!119 = !DILocation(line: 60, column: 13, scope: !114)
!120 = !DILocation(line: 62, column: 33, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !13, line: 61, column: 9)
!122 = !DILocation(line: 62, column: 26, scope: !121)
!123 = !DILocation(line: 62, column: 13, scope: !121)
!124 = !DILocation(line: 63, column: 9, scope: !121)
!125 = !DILocation(line: 66, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !117, file: !13, line: 65, column: 9)
!127 = !DILocation(line: 69, column: 1, scope: !110)
