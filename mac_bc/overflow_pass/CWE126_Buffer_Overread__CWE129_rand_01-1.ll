; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_rand_01_bad() #0 !dbg !12 {
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
  store i32 %cond, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !22, metadata !DIExpression()), !dbg !27
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !27
  %1 = load i32, i32* %data, align 4, !dbg !28
  %cmp = icmp sge i32 %1, 0, !dbg !30
  br i1 %cmp, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !32
  %idxprom = sext i32 %2 to i64, !dbg !34
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !34
  %3 = load i32, i32* %arrayidx, align 4, !dbg !34
  call void @printIntLine(i32 noundef %3), !dbg !35
  br label %if.end, !dbg !36

if.else:                                          ; preds = %cond.end
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_rand_01_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  call void @goodB2G(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* noundef null), !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 noundef %conv), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @CWE126_Buffer_Overread__CWE129_rand_01_good(), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  call void @CWE126_Buffer_Overread__CWE129_rand_01_bad(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 -1, i32* %data, align 4, !dbg !67
  store i32 7, i32* %data, align 4, !dbg !68
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !69, metadata !DIExpression()), !dbg !71
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !71
  %1 = load i32, i32* %data, align 4, !dbg !72
  %cmp = icmp sge i32 %1, 0, !dbg !74
  br i1 %cmp, label %if.then, label %if.else, !dbg !75

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !76
  %idxprom = sext i32 %2 to i64, !dbg !78
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !78
  %3 = load i32, i32* %arrayidx, align 4, !dbg !78
  call void @printIntLine(i32 noundef %3), !dbg !79
  br label %if.end, !dbg !80

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !81
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !84 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i32 -1, i32* %data, align 4, !dbg !87
  %call = call i32 @rand(), !dbg !88
  %and = and i32 %call, 1, !dbg !88
  %tobool = icmp ne i32 %and, 0, !dbg !88
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !88

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand(), !dbg !88
  %shl = shl i32 %call1, 30, !dbg !88
  %call2 = call i32 @rand(), !dbg !88
  %shl3 = shl i32 %call2, 15, !dbg !88
  %xor = xor i32 %shl, %shl3, !dbg !88
  %call4 = call i32 @rand(), !dbg !88
  %xor5 = xor i32 %xor, %call4, !dbg !88
  br label %cond.end, !dbg !88

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand(), !dbg !88
  %shl7 = shl i32 %call6, 30, !dbg !88
  %call8 = call i32 @rand(), !dbg !88
  %shl9 = shl i32 %call8, 15, !dbg !88
  %xor10 = xor i32 %shl7, %shl9, !dbg !88
  %call11 = call i32 @rand(), !dbg !88
  %xor12 = xor i32 %xor10, %call11, !dbg !88
  %sub = sub i32 0, %xor12, !dbg !88
  %sub13 = sub i32 %sub, 1, !dbg !88
  br label %cond.end, !dbg !88

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !88
  store i32 %cond, i32* %data, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !90, metadata !DIExpression()), !dbg !92
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !92
  %1 = load i32, i32* %data, align 4, !dbg !93
  %cmp = icmp sge i32 %1, 0, !dbg !95
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !96

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i32, i32* %data, align 4, !dbg !97
  %cmp14 = icmp slt i32 %2, 10, !dbg !98
  br i1 %cmp14, label %if.then, label %if.else, !dbg !99

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !100
  %idxprom = sext i32 %3 to i64, !dbg !102
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !102
  %4 = load i32, i32* %arrayidx, align 4, !dbg !102
  call void @printIntLine(i32 noundef %4), !dbg !103
  br label %if.end, !dbg !104

if.else:                                          ; preds = %land.lhs.true, %cond.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !105
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_01_bad", scope: !13, file: !13, line: 22, type: !14, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 24, type: !3)
!18 = !DILocation(line: 24, column: 9, scope: !12)
!19 = !DILocation(line: 26, column: 10, scope: !12)
!20 = !DILocation(line: 28, column: 12, scope: !12)
!21 = !DILocation(line: 28, column: 10, scope: !12)
!22 = !DILocalVariable(name: "buffer", scope: !23, file: !13, line: 30, type: !24)
!23 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 30, column: 13, scope: !23)
!28 = !DILocation(line: 33, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !13, line: 33, column: 13)
!30 = !DILocation(line: 33, column: 18, scope: !29)
!31 = !DILocation(line: 33, column: 13, scope: !23)
!32 = !DILocation(line: 35, column: 33, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 34, column: 9)
!34 = !DILocation(line: 35, column: 26, scope: !33)
!35 = !DILocation(line: 35, column: 13, scope: !33)
!36 = !DILocation(line: 36, column: 9, scope: !33)
!37 = !DILocation(line: 39, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !13, line: 38, column: 9)
!39 = !DILocation(line: 42, column: 1, scope: !12)
!40 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_01_good", scope: !13, file: !13, line: 94, type: !14, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!41 = !DILocation(line: 96, column: 5, scope: !40)
!42 = !DILocation(line: 97, column: 5, scope: !40)
!43 = !DILocation(line: 98, column: 1, scope: !40)
!44 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 109, type: !45, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!45 = !DISubroutineType(types: !46)
!46 = !{!3, !3, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !13, line: 109, type: !3)
!51 = !DILocation(line: 109, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !13, line: 109, type: !47)
!53 = !DILocation(line: 109, column: 27, scope: !44)
!54 = !DILocation(line: 112, column: 22, scope: !44)
!55 = !DILocation(line: 112, column: 12, scope: !44)
!56 = !DILocation(line: 112, column: 5, scope: !44)
!57 = !DILocation(line: 114, column: 5, scope: !44)
!58 = !DILocation(line: 115, column: 5, scope: !44)
!59 = !DILocation(line: 116, column: 5, scope: !44)
!60 = !DILocation(line: 119, column: 5, scope: !44)
!61 = !DILocation(line: 120, column: 5, scope: !44)
!62 = !DILocation(line: 121, column: 5, scope: !44)
!63 = !DILocation(line: 123, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 49, type: !14, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!65 = !DILocalVariable(name: "data", scope: !64, file: !13, line: 51, type: !3)
!66 = !DILocation(line: 51, column: 9, scope: !64)
!67 = !DILocation(line: 53, column: 10, scope: !64)
!68 = !DILocation(line: 56, column: 10, scope: !64)
!69 = !DILocalVariable(name: "buffer", scope: !70, file: !13, line: 58, type: !24)
!70 = distinct !DILexicalBlock(scope: !64, file: !13, line: 57, column: 5)
!71 = !DILocation(line: 58, column: 13, scope: !70)
!72 = !DILocation(line: 61, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !13, line: 61, column: 13)
!74 = !DILocation(line: 61, column: 18, scope: !73)
!75 = !DILocation(line: 61, column: 13, scope: !70)
!76 = !DILocation(line: 63, column: 33, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !13, line: 62, column: 9)
!78 = !DILocation(line: 63, column: 26, scope: !77)
!79 = !DILocation(line: 63, column: 13, scope: !77)
!80 = !DILocation(line: 64, column: 9, scope: !77)
!81 = !DILocation(line: 67, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !73, file: !13, line: 66, column: 9)
!83 = !DILocation(line: 70, column: 1, scope: !64)
!84 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 73, type: !14, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!85 = !DILocalVariable(name: "data", scope: !84, file: !13, line: 75, type: !3)
!86 = !DILocation(line: 75, column: 9, scope: !84)
!87 = !DILocation(line: 77, column: 10, scope: !84)
!88 = !DILocation(line: 79, column: 12, scope: !84)
!89 = !DILocation(line: 79, column: 10, scope: !84)
!90 = !DILocalVariable(name: "buffer", scope: !91, file: !13, line: 81, type: !24)
!91 = distinct !DILexicalBlock(scope: !84, file: !13, line: 80, column: 5)
!92 = !DILocation(line: 81, column: 13, scope: !91)
!93 = !DILocation(line: 83, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !13, line: 83, column: 13)
!95 = !DILocation(line: 83, column: 18, scope: !94)
!96 = !DILocation(line: 83, column: 23, scope: !94)
!97 = !DILocation(line: 83, column: 26, scope: !94)
!98 = !DILocation(line: 83, column: 31, scope: !94)
!99 = !DILocation(line: 83, column: 13, scope: !91)
!100 = !DILocation(line: 85, column: 33, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !13, line: 84, column: 9)
!102 = !DILocation(line: 85, column: 26, scope: !101)
!103 = !DILocation(line: 85, column: 13, scope: !101)
!104 = !DILocation(line: 86, column: 9, scope: !101)
!105 = !DILocation(line: 89, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !94, file: !13, line: 88, column: 9)
!107 = !DILocation(line: 92, column: 1, scope: !84)
