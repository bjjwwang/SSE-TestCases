; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* %data, align 4, !dbg !20
  %call = call i32 @badSource(i32 noundef %0), !dbg !21
  store i32 %call, i32* %data, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !26, metadata !DIExpression()), !dbg !30
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !30
  %2 = load i32, i32* %data, align 4, !dbg !31
  %cmp = icmp sge i32 %2, 0, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !35
  %idxprom = sext i32 %3 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !37
  store i32 1, i32* %arrayidx, align 4, !dbg !38
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !42
  %cmp1 = icmp slt i32 %4, 10, !dbg !44
  br i1 %cmp1, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !46
  %idxprom2 = sext i32 %5 to i64, !dbg !48
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !48
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !48
  call void @printIntLine(i32 noundef %6), !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %7, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !56

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !57
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @badSource(i32 noundef %data) #0 !dbg !60 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 10, i32* %data.addr, align 4, !dbg !65
  %0 = load i32, i32* %data.addr, align 4, !dbg !66
  ret i32 %0, !dbg !67
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_good() #0 !dbg !68 {
entry:
  call void @goodB2G(), !dbg !69
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* noundef null), !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 noundef %conv), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_good(), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_bad(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !92 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i32 -1, i32* %data, align 4, !dbg !95
  %0 = load i32, i32* %data, align 4, !dbg !96
  %call = call i32 @goodB2GSource(i32 noundef %0), !dbg !97
  store i32 %call, i32* %data, align 4, !dbg !98
  call void @llvm.dbg.declare(metadata i32* %i, metadata !99, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !102, metadata !DIExpression()), !dbg !103
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !103
  %2 = load i32, i32* %data, align 4, !dbg !104
  %cmp = icmp sge i32 %2, 0, !dbg !106
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !107

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !108
  %cmp1 = icmp slt i32 %3, 10, !dbg !109
  br i1 %cmp1, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !111
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

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !132
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodB2GSource(i32 noundef %data) #0 !dbg !135 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !136, metadata !DIExpression()), !dbg !137
  store i32 10, i32* %data.addr, align 4, !dbg !138
  %0 = load i32, i32* %data.addr, align 4, !dbg !139
  ret i32 %0, !dbg !140
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !141 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !142, metadata !DIExpression()), !dbg !143
  store i32 -1, i32* %data, align 4, !dbg !144
  %0 = load i32, i32* %data, align 4, !dbg !145
  %call = call i32 @goodG2BSource(i32 noundef %0), !dbg !146
  store i32 %call, i32* %data, align 4, !dbg !147
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !151, metadata !DIExpression()), !dbg !152
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !152
  %2 = load i32, i32* %data, align 4, !dbg !153
  %cmp = icmp sge i32 %2, 0, !dbg !155
  br i1 %cmp, label %if.then, label %if.else, !dbg !156

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !157
  %idxprom = sext i32 %3 to i64, !dbg !159
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !159
  store i32 1, i32* %arrayidx, align 4, !dbg !160
  store i32 0, i32* %i, align 4, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !164
  %cmp1 = icmp slt i32 %4, 10, !dbg !166
  br i1 %cmp1, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !168
  %idxprom2 = sext i32 %5 to i64, !dbg !170
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !170
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !170
  call void @printIntLine(i32 noundef %6), !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !173
  %inc = add nsw i32 %7, 1, !dbg !173
  store i32 %inc, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !177

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !178
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !180
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodG2BSource(i32 noundef %data) #0 !dbg !181 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !182, metadata !DIExpression()), !dbg !183
  store i32 7, i32* %data.addr, align 4, !dbg !184
  %0 = load i32, i32* %data.addr, align 4, !dbg !185
  ret i32 %0, !dbg !186
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 31, column: 9, scope: !11)
!19 = !DILocation(line: 33, column: 10, scope: !11)
!20 = !DILocation(line: 34, column: 22, scope: !11)
!21 = !DILocation(line: 34, column: 12, scope: !11)
!22 = !DILocation(line: 34, column: 10, scope: !11)
!23 = !DILocalVariable(name: "i", scope: !24, file: !12, line: 36, type: !17)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!25 = !DILocation(line: 36, column: 13, scope: !24)
!26 = !DILocalVariable(name: "buffer", scope: !24, file: !12, line: 37, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 37, column: 13, scope: !24)
!31 = !DILocation(line: 40, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !12, line: 40, column: 13)
!33 = !DILocation(line: 40, column: 18, scope: !32)
!34 = !DILocation(line: 40, column: 13, scope: !24)
!35 = !DILocation(line: 42, column: 20, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 41, column: 9)
!37 = !DILocation(line: 42, column: 13, scope: !36)
!38 = !DILocation(line: 42, column: 26, scope: !36)
!39 = !DILocation(line: 44, column: 19, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 44, column: 13)
!41 = !DILocation(line: 44, column: 17, scope: !40)
!42 = !DILocation(line: 44, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 44, column: 13)
!44 = !DILocation(line: 44, column: 26, scope: !43)
!45 = !DILocation(line: 44, column: 13, scope: !40)
!46 = !DILocation(line: 46, column: 37, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 45, column: 13)
!48 = !DILocation(line: 46, column: 30, scope: !47)
!49 = !DILocation(line: 46, column: 17, scope: !47)
!50 = !DILocation(line: 47, column: 13, scope: !47)
!51 = !DILocation(line: 44, column: 33, scope: !43)
!52 = !DILocation(line: 44, column: 13, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 47, column: 13, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 48, column: 9, scope: !36)
!57 = !DILocation(line: 51, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !32, file: !12, line: 50, column: 9)
!59 = !DILocation(line: 54, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 22, type: !61, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!61 = !DISubroutineType(types: !62)
!62 = !{!17, !17}
!63 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !12, line: 22, type: !17)
!64 = !DILocation(line: 22, column: 26, scope: !60)
!65 = !DILocation(line: 25, column: 10, scope: !60)
!66 = !DILocation(line: 26, column: 12, scope: !60)
!67 = !DILocation(line: 26, column: 5, scope: !60)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_42_good", scope: !12, file: !12, line: 130, type: !13, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!69 = !DILocation(line: 132, column: 5, scope: !68)
!70 = !DILocation(line: 133, column: 5, scope: !68)
!71 = !DILocation(line: 134, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 145, type: !73, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!73 = !DISubroutineType(types: !74)
!74 = !{!17, !17, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 145, type: !17)
!79 = !DILocation(line: 145, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 145, type: !75)
!81 = !DILocation(line: 145, column: 27, scope: !72)
!82 = !DILocation(line: 148, column: 22, scope: !72)
!83 = !DILocation(line: 148, column: 12, scope: !72)
!84 = !DILocation(line: 148, column: 5, scope: !72)
!85 = !DILocation(line: 150, column: 5, scope: !72)
!86 = !DILocation(line: 151, column: 5, scope: !72)
!87 = !DILocation(line: 152, column: 5, scope: !72)
!88 = !DILocation(line: 155, column: 5, scope: !72)
!89 = !DILocation(line: 156, column: 5, scope: !72)
!90 = !DILocation(line: 157, column: 5, scope: !72)
!91 = !DILocation(line: 159, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 104, type: !13, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 106, type: !17)
!94 = !DILocation(line: 106, column: 9, scope: !92)
!95 = !DILocation(line: 108, column: 10, scope: !92)
!96 = !DILocation(line: 109, column: 26, scope: !92)
!97 = !DILocation(line: 109, column: 12, scope: !92)
!98 = !DILocation(line: 109, column: 10, scope: !92)
!99 = !DILocalVariable(name: "i", scope: !100, file: !12, line: 111, type: !17)
!100 = distinct !DILexicalBlock(scope: !92, file: !12, line: 110, column: 5)
!101 = !DILocation(line: 111, column: 13, scope: !100)
!102 = !DILocalVariable(name: "buffer", scope: !100, file: !12, line: 112, type: !27)
!103 = !DILocation(line: 112, column: 13, scope: !100)
!104 = !DILocation(line: 114, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !12, line: 114, column: 13)
!106 = !DILocation(line: 114, column: 18, scope: !105)
!107 = !DILocation(line: 114, column: 23, scope: !105)
!108 = !DILocation(line: 114, column: 26, scope: !105)
!109 = !DILocation(line: 114, column: 31, scope: !105)
!110 = !DILocation(line: 114, column: 13, scope: !100)
!111 = !DILocation(line: 116, column: 20, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !12, line: 115, column: 9)
!113 = !DILocation(line: 116, column: 13, scope: !112)
!114 = !DILocation(line: 116, column: 26, scope: !112)
!115 = !DILocation(line: 118, column: 19, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !12, line: 118, column: 13)
!117 = !DILocation(line: 118, column: 17, scope: !116)
!118 = !DILocation(line: 118, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 118, column: 13)
!120 = !DILocation(line: 118, column: 26, scope: !119)
!121 = !DILocation(line: 118, column: 13, scope: !116)
!122 = !DILocation(line: 120, column: 37, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !12, line: 119, column: 13)
!124 = !DILocation(line: 120, column: 30, scope: !123)
!125 = !DILocation(line: 120, column: 17, scope: !123)
!126 = !DILocation(line: 121, column: 13, scope: !123)
!127 = !DILocation(line: 118, column: 33, scope: !119)
!128 = !DILocation(line: 118, column: 13, scope: !119)
!129 = distinct !{!129, !121, !130, !55}
!130 = !DILocation(line: 121, column: 13, scope: !116)
!131 = !DILocation(line: 122, column: 9, scope: !112)
!132 = !DILocation(line: 125, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !105, file: !12, line: 124, column: 9)
!134 = !DILocation(line: 128, column: 1, scope: !92)
!135 = distinct !DISubprogram(name: "goodB2GSource", scope: !12, file: !12, line: 97, type: !61, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!136 = !DILocalVariable(name: "data", arg: 1, scope: !135, file: !12, line: 97, type: !17)
!137 = !DILocation(line: 97, column: 30, scope: !135)
!138 = !DILocation(line: 100, column: 10, scope: !135)
!139 = !DILocation(line: 101, column: 12, scope: !135)
!140 = !DILocation(line: 101, column: 5, scope: !135)
!141 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!142 = !DILocalVariable(name: "data", scope: !141, file: !12, line: 71, type: !17)
!143 = !DILocation(line: 71, column: 9, scope: !141)
!144 = !DILocation(line: 73, column: 10, scope: !141)
!145 = !DILocation(line: 74, column: 26, scope: !141)
!146 = !DILocation(line: 74, column: 12, scope: !141)
!147 = !DILocation(line: 74, column: 10, scope: !141)
!148 = !DILocalVariable(name: "i", scope: !149, file: !12, line: 76, type: !17)
!149 = distinct !DILexicalBlock(scope: !141, file: !12, line: 75, column: 5)
!150 = !DILocation(line: 76, column: 13, scope: !149)
!151 = !DILocalVariable(name: "buffer", scope: !149, file: !12, line: 77, type: !27)
!152 = !DILocation(line: 77, column: 13, scope: !149)
!153 = !DILocation(line: 80, column: 13, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !12, line: 80, column: 13)
!155 = !DILocation(line: 80, column: 18, scope: !154)
!156 = !DILocation(line: 80, column: 13, scope: !149)
!157 = !DILocation(line: 82, column: 20, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !12, line: 81, column: 9)
!159 = !DILocation(line: 82, column: 13, scope: !158)
!160 = !DILocation(line: 82, column: 26, scope: !158)
!161 = !DILocation(line: 84, column: 19, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 84, column: 13)
!163 = !DILocation(line: 84, column: 17, scope: !162)
!164 = !DILocation(line: 84, column: 24, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !12, line: 84, column: 13)
!166 = !DILocation(line: 84, column: 26, scope: !165)
!167 = !DILocation(line: 84, column: 13, scope: !162)
!168 = !DILocation(line: 86, column: 37, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !12, line: 85, column: 13)
!170 = !DILocation(line: 86, column: 30, scope: !169)
!171 = !DILocation(line: 86, column: 17, scope: !169)
!172 = !DILocation(line: 87, column: 13, scope: !169)
!173 = !DILocation(line: 84, column: 33, scope: !165)
!174 = !DILocation(line: 84, column: 13, scope: !165)
!175 = distinct !{!175, !167, !176, !55}
!176 = !DILocation(line: 87, column: 13, scope: !162)
!177 = !DILocation(line: 88, column: 9, scope: !158)
!178 = !DILocation(line: 91, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !154, file: !12, line: 90, column: 9)
!180 = !DILocation(line: 94, column: 1, scope: !141)
!181 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 61, type: !61, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!182 = !DILocalVariable(name: "data", arg: 1, scope: !181, file: !12, line: 61, type: !17)
!183 = !DILocation(line: 61, column: 30, scope: !181)
!184 = !DILocation(line: 65, column: 10, scope: !181)
!185 = !DILocation(line: 66, column: 12, scope: !181)
!186 = !DILocation(line: 66, column: 5, scope: !181)
