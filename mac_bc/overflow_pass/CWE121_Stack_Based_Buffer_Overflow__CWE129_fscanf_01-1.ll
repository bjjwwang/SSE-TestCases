; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !20
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !25, metadata !DIExpression()), !dbg !29
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !29
  %2 = load i32, i32* %data, align 4, !dbg !30
  %cmp = icmp sge i32 %2, 0, !dbg !32
  br i1 %cmp, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !34
  %idxprom = sext i32 %3 to i64, !dbg !36
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !36
  store i32 1, i32* %arrayidx, align 4, !dbg !37
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !41
  %cmp1 = icmp slt i32 %4, 10, !dbg !43
  br i1 %cmp1, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !45
  %idxprom2 = sext i32 %5 to i64, !dbg !47
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !47
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !47
  call void @printIntLine(i32 noundef %6), !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %7, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !55

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  call void @goodB2G(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* noundef null), !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 noundef %conv), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_good(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 -1, i32* %data, align 4, !dbg !86
  store i32 7, i32* %data, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32* %i, metadata !88, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !92
  %1 = load i32, i32* %data, align 4, !dbg !93
  %cmp = icmp sge i32 %1, 0, !dbg !95
  br i1 %cmp, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !97
  %idxprom = sext i32 %2 to i64, !dbg !99
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !99
  store i32 1, i32* %arrayidx, align 4, !dbg !100
  store i32 0, i32* %i, align 4, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !104
  %cmp1 = icmp slt i32 %3, 10, !dbg !106
  br i1 %cmp1, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !108
  %idxprom2 = sext i32 %4 to i64, !dbg !110
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !110
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !110
  call void @printIntLine(i32 noundef %5), !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !113
  %inc = add nsw i32 %6, 1, !dbg !113
  store i32 %inc, i32* %i, align 4, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !121 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !122, metadata !DIExpression()), !dbg !123
  store i32 -1, i32* %data, align 4, !dbg !124
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !125
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %data), !dbg !126
  call void @llvm.dbg.declare(metadata i32* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !130, metadata !DIExpression()), !dbg !131
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !131
  %2 = load i32, i32* %data, align 4, !dbg !132
  %cmp = icmp sge i32 %2, 0, !dbg !134
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !135

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !136
  %cmp1 = icmp slt i32 %3, 10, !dbg !137
  br i1 %cmp1, label %if.then, label %if.else, !dbg !138

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !139
  %idxprom = sext i32 %4 to i64, !dbg !141
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !141
  store i32 1, i32* %arrayidx, align 4, !dbg !142
  store i32 0, i32* %i, align 4, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !146
  %cmp2 = icmp slt i32 %5, 10, !dbg !148
  br i1 %cmp2, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !150
  %idxprom3 = sext i32 %6 to i64, !dbg !152
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !152
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !152
  call void @printIntLine(i32 noundef %7), !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !155
  %inc = add nsw i32 %8, 1, !dbg !155
  store i32 %inc, i32* %i, align 4, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !159

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !160
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 24, column: 9, scope: !11)
!19 = !DILocation(line: 26, column: 10, scope: !11)
!20 = !DILocation(line: 28, column: 12, scope: !11)
!21 = !DILocation(line: 28, column: 5, scope: !11)
!22 = !DILocalVariable(name: "i", scope: !23, file: !12, line: 30, type: !17)
!23 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!24 = !DILocation(line: 30, column: 13, scope: !23)
!25 = !DILocalVariable(name: "buffer", scope: !23, file: !12, line: 31, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 31, column: 13, scope: !23)
!30 = !DILocation(line: 34, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !12, line: 34, column: 13)
!32 = !DILocation(line: 34, column: 18, scope: !31)
!33 = !DILocation(line: 34, column: 13, scope: !23)
!34 = !DILocation(line: 36, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 35, column: 9)
!36 = !DILocation(line: 36, column: 13, scope: !35)
!37 = !DILocation(line: 36, column: 26, scope: !35)
!38 = !DILocation(line: 38, column: 19, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 38, column: 13)
!40 = !DILocation(line: 38, column: 17, scope: !39)
!41 = !DILocation(line: 38, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 38, column: 13)
!43 = !DILocation(line: 38, column: 26, scope: !42)
!44 = !DILocation(line: 38, column: 13, scope: !39)
!45 = !DILocation(line: 40, column: 37, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 39, column: 13)
!47 = !DILocation(line: 40, column: 30, scope: !46)
!48 = !DILocation(line: 40, column: 17, scope: !46)
!49 = !DILocation(line: 41, column: 13, scope: !46)
!50 = !DILocation(line: 38, column: 33, scope: !42)
!51 = !DILocation(line: 38, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 41, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 42, column: 9, scope: !35)
!56 = !DILocation(line: 45, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !31, file: !12, line: 44, column: 9)
!58 = !DILocation(line: 48, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!60 = !DILocation(line: 114, column: 5, scope: !59)
!61 = !DILocation(line: 115, column: 5, scope: !59)
!62 = !DILocation(line: 116, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !64, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!64 = !DISubroutineType(types: !65)
!65 = !{!17, !17, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 127, type: !17)
!70 = !DILocation(line: 127, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 127, type: !66)
!72 = !DILocation(line: 127, column: 27, scope: !63)
!73 = !DILocation(line: 130, column: 22, scope: !63)
!74 = !DILocation(line: 130, column: 12, scope: !63)
!75 = !DILocation(line: 130, column: 5, scope: !63)
!76 = !DILocation(line: 132, column: 5, scope: !63)
!77 = !DILocation(line: 133, column: 5, scope: !63)
!78 = !DILocation(line: 134, column: 5, scope: !63)
!79 = !DILocation(line: 137, column: 5, scope: !63)
!80 = !DILocation(line: 138, column: 5, scope: !63)
!81 = !DILocation(line: 139, column: 5, scope: !63)
!82 = !DILocation(line: 141, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 57, type: !17)
!85 = !DILocation(line: 57, column: 9, scope: !83)
!86 = !DILocation(line: 59, column: 10, scope: !83)
!87 = !DILocation(line: 62, column: 10, scope: !83)
!88 = !DILocalVariable(name: "i", scope: !89, file: !12, line: 64, type: !17)
!89 = distinct !DILexicalBlock(scope: !83, file: !12, line: 63, column: 5)
!90 = !DILocation(line: 64, column: 13, scope: !89)
!91 = !DILocalVariable(name: "buffer", scope: !89, file: !12, line: 65, type: !26)
!92 = !DILocation(line: 65, column: 13, scope: !89)
!93 = !DILocation(line: 68, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !12, line: 68, column: 13)
!95 = !DILocation(line: 68, column: 18, scope: !94)
!96 = !DILocation(line: 68, column: 13, scope: !89)
!97 = !DILocation(line: 70, column: 20, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !12, line: 69, column: 9)
!99 = !DILocation(line: 70, column: 13, scope: !98)
!100 = !DILocation(line: 70, column: 26, scope: !98)
!101 = !DILocation(line: 72, column: 19, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 72, column: 13)
!103 = !DILocation(line: 72, column: 17, scope: !102)
!104 = !DILocation(line: 72, column: 24, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !12, line: 72, column: 13)
!106 = !DILocation(line: 72, column: 26, scope: !105)
!107 = !DILocation(line: 72, column: 13, scope: !102)
!108 = !DILocation(line: 74, column: 37, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !12, line: 73, column: 13)
!110 = !DILocation(line: 74, column: 30, scope: !109)
!111 = !DILocation(line: 74, column: 17, scope: !109)
!112 = !DILocation(line: 75, column: 13, scope: !109)
!113 = !DILocation(line: 72, column: 33, scope: !105)
!114 = !DILocation(line: 72, column: 13, scope: !105)
!115 = distinct !{!115, !107, !116, !54}
!116 = !DILocation(line: 75, column: 13, scope: !102)
!117 = !DILocation(line: 76, column: 9, scope: !98)
!118 = !DILocation(line: 79, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !94, file: !12, line: 78, column: 9)
!120 = !DILocation(line: 82, column: 1, scope: !83)
!121 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!122 = !DILocalVariable(name: "data", scope: !121, file: !12, line: 87, type: !17)
!123 = !DILocation(line: 87, column: 9, scope: !121)
!124 = !DILocation(line: 89, column: 10, scope: !121)
!125 = !DILocation(line: 91, column: 12, scope: !121)
!126 = !DILocation(line: 91, column: 5, scope: !121)
!127 = !DILocalVariable(name: "i", scope: !128, file: !12, line: 93, type: !17)
!128 = distinct !DILexicalBlock(scope: !121, file: !12, line: 92, column: 5)
!129 = !DILocation(line: 93, column: 13, scope: !128)
!130 = !DILocalVariable(name: "buffer", scope: !128, file: !12, line: 94, type: !26)
!131 = !DILocation(line: 94, column: 13, scope: !128)
!132 = !DILocation(line: 96, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !12, line: 96, column: 13)
!134 = !DILocation(line: 96, column: 18, scope: !133)
!135 = !DILocation(line: 96, column: 23, scope: !133)
!136 = !DILocation(line: 96, column: 26, scope: !133)
!137 = !DILocation(line: 96, column: 31, scope: !133)
!138 = !DILocation(line: 96, column: 13, scope: !128)
!139 = !DILocation(line: 98, column: 20, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !12, line: 97, column: 9)
!141 = !DILocation(line: 98, column: 13, scope: !140)
!142 = !DILocation(line: 98, column: 26, scope: !140)
!143 = !DILocation(line: 100, column: 19, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !12, line: 100, column: 13)
!145 = !DILocation(line: 100, column: 17, scope: !144)
!146 = !DILocation(line: 100, column: 24, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 100, column: 13)
!148 = !DILocation(line: 100, column: 26, scope: !147)
!149 = !DILocation(line: 100, column: 13, scope: !144)
!150 = !DILocation(line: 102, column: 37, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !12, line: 101, column: 13)
!152 = !DILocation(line: 102, column: 30, scope: !151)
!153 = !DILocation(line: 102, column: 17, scope: !151)
!154 = !DILocation(line: 103, column: 13, scope: !151)
!155 = !DILocation(line: 100, column: 33, scope: !147)
!156 = !DILocation(line: 100, column: 13, scope: !147)
!157 = distinct !{!157, !149, !158, !54}
!158 = !DILocation(line: 103, column: 13, scope: !144)
!159 = !DILocation(line: 104, column: 9, scope: !140)
!160 = !DILocation(line: 107, column: 13, scope: !161)
!161 = distinct !DILexicalBlock(scope: !133, file: !12, line: 106, column: 9)
!162 = !DILocation(line: 110, column: 1, scope: !121)
