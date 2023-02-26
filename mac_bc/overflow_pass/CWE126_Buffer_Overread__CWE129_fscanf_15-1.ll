; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fscanf_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !20
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !21
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !22, metadata !DIExpression()), !dbg !27
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !27
  %2 = load i32, i32* %data, align 4, !dbg !28
  %cmp = icmp sge i32 %2, 0, !dbg !30
  br i1 %cmp, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !32
  %idxprom = sext i32 %3 to i64, !dbg !34
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !34
  %4 = load i32, i32* %arrayidx, align 4, !dbg !34
  call void @printIntLine(i32 noundef %4), !dbg !35
  br label %if.end, !dbg !36

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fscanf_15_good() #0 !dbg !40 {
entry:
  call void @goodB2G1(), !dbg !41
  call void @goodB2G2(), !dbg !42
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* noundef null), !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 noundef %conv), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE126_Buffer_Overread__CWE129_fscanf_15_good(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__CWE129_fscanf_15_bad(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !66 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 -1, i32* %data, align 4, !dbg !69
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !70
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !71
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !72, metadata !DIExpression()), !dbg !74
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !74
  %2 = load i32, i32* %data, align 4, !dbg !75
  %cmp = icmp sge i32 %2, 0, !dbg !77
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !78

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !79
  %cmp1 = icmp slt i32 %3, 10, !dbg !80
  br i1 %cmp1, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !82
  %idxprom = sext i32 %4 to i64, !dbg !84
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !84
  %5 = load i32, i32* %arrayidx, align 4, !dbg !84
  call void @printIntLine(i32 noundef %5), !dbg !85
  br label %if.end, !dbg !86

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !87
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !90 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32 -1, i32* %data, align 4, !dbg !93
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !94
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !95
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !96, metadata !DIExpression()), !dbg !98
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !98
  %2 = load i32, i32* %data, align 4, !dbg !99
  %cmp = icmp sge i32 %2, 0, !dbg !101
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !102

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !103
  %cmp1 = icmp slt i32 %3, 10, !dbg !104
  br i1 %cmp1, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !106
  %idxprom = sext i32 %4 to i64, !dbg !108
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !108
  %5 = load i32, i32* %arrayidx, align 4, !dbg !108
  call void @printIntLine(i32 noundef %5), !dbg !109
  br label %if.end, !dbg !110

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !111
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !114 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 -1, i32* %data, align 4, !dbg !117
  store i32 7, i32* %data, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !119, metadata !DIExpression()), !dbg !121
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !121
  %1 = load i32, i32* %data, align 4, !dbg !122
  %cmp = icmp sge i32 %1, 0, !dbg !124
  br i1 %cmp, label %if.then, label %if.else, !dbg !125

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !126
  %idxprom = sext i32 %2 to i64, !dbg !128
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !128
  %3 = load i32, i32* %arrayidx, align 4, !dbg !128
  call void @printIntLine(i32 noundef %3), !dbg !129
  br label %if.end, !dbg !130

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !131
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i32 -1, i32* %data, align 4, !dbg !137
  store i32 7, i32* %data, align 4, !dbg !138
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !139, metadata !DIExpression()), !dbg !141
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !141
  %1 = load i32, i32* %data, align 4, !dbg !142
  %cmp = icmp sge i32 %1, 0, !dbg !144
  br i1 %cmp, label %if.then, label %if.else, !dbg !145

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !146
  %idxprom = sext i32 %2 to i64, !dbg !148
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !148
  %3 = load i32, i32* %arrayidx, align 4, !dbg !148
  call void @printIntLine(i32 noundef %3), !dbg !149
  br label %if.end, !dbg !150

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !151
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !153
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_15_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 24, column: 9, scope: !11)
!19 = !DILocation(line: 26, column: 10, scope: !11)
!20 = !DILocation(line: 31, column: 16, scope: !11)
!21 = !DILocation(line: 31, column: 9, scope: !11)
!22 = !DILocalVariable(name: "buffer", scope: !23, file: !12, line: 42, type: !24)
!23 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 42, column: 13, scope: !23)
!28 = !DILocation(line: 45, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !12, line: 45, column: 13)
!30 = !DILocation(line: 45, column: 18, scope: !29)
!31 = !DILocation(line: 45, column: 13, scope: !23)
!32 = !DILocation(line: 47, column: 33, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !12, line: 46, column: 9)
!34 = !DILocation(line: 47, column: 26, scope: !33)
!35 = !DILocation(line: 47, column: 13, scope: !33)
!36 = !DILocation(line: 48, column: 9, scope: !33)
!37 = !DILocation(line: 51, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !12, line: 50, column: 9)
!39 = !DILocation(line: 60, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_15_good", scope: !12, file: !12, line: 230, type: !13, scopeLine: 231, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!41 = !DILocation(line: 232, column: 5, scope: !40)
!42 = !DILocation(line: 233, column: 5, scope: !40)
!43 = !DILocation(line: 234, column: 5, scope: !40)
!44 = !DILocation(line: 235, column: 5, scope: !40)
!45 = !DILocation(line: 236, column: 1, scope: !40)
!46 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 247, type: !47, scopeLine: 248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!47 = !DISubroutineType(types: !48)
!48 = !{!17, !17, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !12, line: 247, type: !17)
!53 = !DILocation(line: 247, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !12, line: 247, type: !49)
!55 = !DILocation(line: 247, column: 27, scope: !46)
!56 = !DILocation(line: 250, column: 22, scope: !46)
!57 = !DILocation(line: 250, column: 12, scope: !46)
!58 = !DILocation(line: 250, column: 5, scope: !46)
!59 = !DILocation(line: 252, column: 5, scope: !46)
!60 = !DILocation(line: 253, column: 5, scope: !46)
!61 = !DILocation(line: 254, column: 5, scope: !46)
!62 = !DILocation(line: 257, column: 5, scope: !46)
!63 = !DILocation(line: 258, column: 5, scope: !46)
!64 = !DILocation(line: 259, column: 5, scope: !46)
!65 = !DILocation(line: 261, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!67 = !DILocalVariable(name: "data", scope: !66, file: !12, line: 69, type: !17)
!68 = !DILocation(line: 69, column: 9, scope: !66)
!69 = !DILocation(line: 71, column: 10, scope: !66)
!70 = !DILocation(line: 76, column: 16, scope: !66)
!71 = !DILocation(line: 76, column: 9, scope: !66)
!72 = !DILocalVariable(name: "buffer", scope: !73, file: !12, line: 91, type: !24)
!73 = distinct !DILexicalBlock(scope: !66, file: !12, line: 90, column: 5)
!74 = !DILocation(line: 91, column: 13, scope: !73)
!75 = !DILocation(line: 93, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !12, line: 93, column: 13)
!77 = !DILocation(line: 93, column: 18, scope: !76)
!78 = !DILocation(line: 93, column: 23, scope: !76)
!79 = !DILocation(line: 93, column: 26, scope: !76)
!80 = !DILocation(line: 93, column: 31, scope: !76)
!81 = !DILocation(line: 93, column: 13, scope: !73)
!82 = !DILocation(line: 95, column: 33, scope: !83)
!83 = distinct !DILexicalBlock(scope: !76, file: !12, line: 94, column: 9)
!84 = !DILocation(line: 95, column: 26, scope: !83)
!85 = !DILocation(line: 95, column: 13, scope: !83)
!86 = !DILocation(line: 96, column: 9, scope: !83)
!87 = !DILocation(line: 99, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !76, file: !12, line: 98, column: 9)
!89 = !DILocation(line: 104, column: 1, scope: !66)
!90 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 107, type: !13, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 109, type: !17)
!92 = !DILocation(line: 109, column: 9, scope: !90)
!93 = !DILocation(line: 111, column: 10, scope: !90)
!94 = !DILocation(line: 116, column: 16, scope: !90)
!95 = !DILocation(line: 116, column: 9, scope: !90)
!96 = !DILocalVariable(name: "buffer", scope: !97, file: !12, line: 127, type: !24)
!97 = distinct !DILexicalBlock(scope: !90, file: !12, line: 126, column: 5)
!98 = !DILocation(line: 127, column: 13, scope: !97)
!99 = !DILocation(line: 129, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !12, line: 129, column: 13)
!101 = !DILocation(line: 129, column: 18, scope: !100)
!102 = !DILocation(line: 129, column: 23, scope: !100)
!103 = !DILocation(line: 129, column: 26, scope: !100)
!104 = !DILocation(line: 129, column: 31, scope: !100)
!105 = !DILocation(line: 129, column: 13, scope: !97)
!106 = !DILocation(line: 131, column: 33, scope: !107)
!107 = distinct !DILexicalBlock(scope: !100, file: !12, line: 130, column: 9)
!108 = !DILocation(line: 131, column: 26, scope: !107)
!109 = !DILocation(line: 131, column: 13, scope: !107)
!110 = !DILocation(line: 132, column: 9, scope: !107)
!111 = !DILocation(line: 135, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !100, file: !12, line: 134, column: 9)
!113 = !DILocation(line: 144, column: 1, scope: !90)
!114 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 147, type: !13, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!115 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 149, type: !17)
!116 = !DILocation(line: 149, column: 9, scope: !114)
!117 = !DILocation(line: 151, column: 10, scope: !114)
!118 = !DILocation(line: 161, column: 14, scope: !114)
!119 = !DILocalVariable(name: "buffer", scope: !120, file: !12, line: 168, type: !24)
!120 = distinct !DILexicalBlock(scope: !114, file: !12, line: 167, column: 5)
!121 = !DILocation(line: 168, column: 13, scope: !120)
!122 = !DILocation(line: 171, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 171, column: 13)
!124 = !DILocation(line: 171, column: 18, scope: !123)
!125 = !DILocation(line: 171, column: 13, scope: !120)
!126 = !DILocation(line: 173, column: 33, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 172, column: 9)
!128 = !DILocation(line: 173, column: 26, scope: !127)
!129 = !DILocation(line: 173, column: 13, scope: !127)
!130 = !DILocation(line: 174, column: 9, scope: !127)
!131 = !DILocation(line: 177, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !12, line: 176, column: 9)
!133 = !DILocation(line: 186, column: 1, scope: !114)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 189, type: !13, scopeLine: 190, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!135 = !DILocalVariable(name: "data", scope: !134, file: !12, line: 191, type: !17)
!136 = !DILocation(line: 191, column: 9, scope: !134)
!137 = !DILocation(line: 193, column: 10, scope: !134)
!138 = !DILocation(line: 199, column: 14, scope: !134)
!139 = !DILocalVariable(name: "buffer", scope: !140, file: !12, line: 210, type: !24)
!140 = distinct !DILexicalBlock(scope: !134, file: !12, line: 209, column: 5)
!141 = !DILocation(line: 210, column: 13, scope: !140)
!142 = !DILocation(line: 213, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !12, line: 213, column: 13)
!144 = !DILocation(line: 213, column: 18, scope: !143)
!145 = !DILocation(line: 213, column: 13, scope: !140)
!146 = !DILocation(line: 215, column: 33, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !12, line: 214, column: 9)
!148 = !DILocation(line: 215, column: 26, scope: !147)
!149 = !DILocation(line: 215, column: 13, scope: !147)
!150 = !DILocation(line: 216, column: 9, scope: !147)
!151 = !DILocation(line: 219, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !143, file: !12, line: 218, column: 9)
!153 = !DILocation(line: 228, column: 1, scope: !134)
