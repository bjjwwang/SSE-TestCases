; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  br label %while.body, !dbg !20

while.body:                                       ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !21
  br label %while.end, !dbg !23

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !24

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !25, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !33
  %1 = load i32, i32* %data, align 4, !dbg !34
  %cmp = icmp sge i32 %1, 0, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !38
  %idxprom = sext i32 %2 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !40
  store i32 1, i32* %arrayidx, align 4, !dbg !41
  store i32 0, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !45
  %cmp2 = icmp slt i32 %3, 10, !dbg !47
  br i1 %cmp2, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !49
  %idxprom3 = sext i32 %4 to i64, !dbg !51
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !51
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !51
  call void @printIntLine(i32 noundef %5), !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !54
  %inc = add nsw i32 %6, 1, !dbg !54
  store i32 %inc, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !59

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !60
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end5, !dbg !62

while.end5:                                       ; preds = %if.end
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_16_good() #0 !dbg !64 {
entry:
  call void @goodB2G(), !dbg !65
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* noundef null), !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 noundef %conv), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_16_good(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_16_bad(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !88 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 -1, i32* %data, align 4, !dbg !91
  br label %while.body, !dbg !92

while.body:                                       ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !93
  br label %while.end, !dbg !95

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !96

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !97, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !102
  %1 = load i32, i32* %data, align 4, !dbg !103
  %cmp = icmp sge i32 %1, 0, !dbg !105
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !106

land.lhs.true:                                    ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !107
  %cmp2 = icmp slt i32 %2, 10, !dbg !108
  br i1 %cmp2, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !110
  %idxprom = sext i32 %3 to i64, !dbg !112
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !112
  store i32 1, i32* %arrayidx, align 4, !dbg !113
  store i32 0, i32* %i, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !117
  %cmp3 = icmp slt i32 %4, 10, !dbg !119
  br i1 %cmp3, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !121
  %idxprom4 = sext i32 %5 to i64, !dbg !123
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !123
  %6 = load i32, i32* %arrayidx5, align 4, !dbg !123
  call void @printIntLine(i32 noundef %6), !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !126
  %inc = add nsw i32 %7, 1, !dbg !126
  store i32 %inc, i32* %i, align 4, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !130

if.else:                                          ; preds = %land.lhs.true, %while.body1
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !131
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end6, !dbg !133

while.end6:                                       ; preds = %if.end
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !135 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !136, metadata !DIExpression()), !dbg !137
  store i32 -1, i32* %data, align 4, !dbg !138
  br label %while.body, !dbg !139

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !140
  br label %while.end, !dbg !142

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !143

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !144, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !149
  %1 = load i32, i32* %data, align 4, !dbg !150
  %cmp = icmp sge i32 %1, 0, !dbg !152
  br i1 %cmp, label %if.then, label %if.else, !dbg !153

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !154
  %idxprom = sext i32 %2 to i64, !dbg !156
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !156
  store i32 1, i32* %arrayidx, align 4, !dbg !157
  store i32 0, i32* %i, align 4, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !161
  %cmp2 = icmp slt i32 %3, 10, !dbg !163
  br i1 %cmp2, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !165
  %idxprom3 = sext i32 %4 to i64, !dbg !167
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !167
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !167
  call void @printIntLine(i32 noundef %5), !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !170
  %inc = add nsw i32 %6, 1, !dbg !170
  store i32 %inc, i32* %i, align 4, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !174

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !175
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end5, !dbg !177

while.end5:                                       ; preds = %if.end
  ret void, !dbg !178
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_16_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 24, column: 9, scope: !11)
!19 = !DILocation(line: 26, column: 10, scope: !11)
!20 = !DILocation(line: 27, column: 5, scope: !11)
!21 = !DILocation(line: 30, column: 14, scope: !22)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!23 = !DILocation(line: 31, column: 9, scope: !22)
!24 = !DILocation(line: 33, column: 5, scope: !11)
!25 = !DILocalVariable(name: "i", scope: !26, file: !12, line: 36, type: !17)
!26 = distinct !DILexicalBlock(scope: !27, file: !12, line: 35, column: 9)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!28 = !DILocation(line: 36, column: 17, scope: !26)
!29 = !DILocalVariable(name: "buffer", scope: !26, file: !12, line: 37, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 37, column: 17, scope: !26)
!34 = !DILocation(line: 40, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !26, file: !12, line: 40, column: 17)
!36 = !DILocation(line: 40, column: 22, scope: !35)
!37 = !DILocation(line: 40, column: 17, scope: !26)
!38 = !DILocation(line: 42, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 41, column: 13)
!40 = !DILocation(line: 42, column: 17, scope: !39)
!41 = !DILocation(line: 42, column: 30, scope: !39)
!42 = !DILocation(line: 44, column: 23, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 44, column: 17)
!44 = !DILocation(line: 44, column: 21, scope: !43)
!45 = !DILocation(line: 44, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 44, column: 17)
!47 = !DILocation(line: 44, column: 30, scope: !46)
!48 = !DILocation(line: 44, column: 17, scope: !43)
!49 = !DILocation(line: 46, column: 41, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 45, column: 17)
!51 = !DILocation(line: 46, column: 34, scope: !50)
!52 = !DILocation(line: 46, column: 21, scope: !50)
!53 = !DILocation(line: 47, column: 17, scope: !50)
!54 = !DILocation(line: 44, column: 37, scope: !46)
!55 = !DILocation(line: 44, column: 17, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 47, column: 17, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 48, column: 13, scope: !39)
!60 = !DILocation(line: 51, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !35, file: !12, line: 50, column: 13)
!62 = !DILocation(line: 54, column: 9, scope: !27)
!63 = !DILocation(line: 56, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_16_good", scope: !12, file: !12, line: 136, type: !13, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!65 = !DILocation(line: 138, column: 5, scope: !64)
!66 = !DILocation(line: 139, column: 5, scope: !64)
!67 = !DILocation(line: 140, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 151, type: !69, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!69 = !DISubroutineType(types: !70)
!70 = !{!17, !17, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 151, type: !17)
!75 = !DILocation(line: 151, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 151, type: !71)
!77 = !DILocation(line: 151, column: 27, scope: !68)
!78 = !DILocation(line: 154, column: 22, scope: !68)
!79 = !DILocation(line: 154, column: 12, scope: !68)
!80 = !DILocation(line: 154, column: 5, scope: !68)
!81 = !DILocation(line: 156, column: 5, scope: !68)
!82 = !DILocation(line: 157, column: 5, scope: !68)
!83 = !DILocation(line: 158, column: 5, scope: !68)
!84 = !DILocation(line: 161, column: 5, scope: !68)
!85 = !DILocation(line: 162, column: 5, scope: !68)
!86 = !DILocation(line: 163, column: 5, scope: !68)
!87 = !DILocation(line: 165, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 65, type: !17)
!90 = !DILocation(line: 65, column: 9, scope: !88)
!91 = !DILocation(line: 67, column: 10, scope: !88)
!92 = !DILocation(line: 68, column: 5, scope: !88)
!93 = !DILocation(line: 71, column: 14, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !12, line: 69, column: 5)
!95 = !DILocation(line: 72, column: 9, scope: !94)
!96 = !DILocation(line: 74, column: 5, scope: !88)
!97 = !DILocalVariable(name: "i", scope: !98, file: !12, line: 77, type: !17)
!98 = distinct !DILexicalBlock(scope: !99, file: !12, line: 76, column: 9)
!99 = distinct !DILexicalBlock(scope: !88, file: !12, line: 75, column: 5)
!100 = !DILocation(line: 77, column: 17, scope: !98)
!101 = !DILocalVariable(name: "buffer", scope: !98, file: !12, line: 78, type: !30)
!102 = !DILocation(line: 78, column: 17, scope: !98)
!103 = !DILocation(line: 80, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !12, line: 80, column: 17)
!105 = !DILocation(line: 80, column: 22, scope: !104)
!106 = !DILocation(line: 80, column: 27, scope: !104)
!107 = !DILocation(line: 80, column: 30, scope: !104)
!108 = !DILocation(line: 80, column: 35, scope: !104)
!109 = !DILocation(line: 80, column: 17, scope: !98)
!110 = !DILocation(line: 82, column: 24, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !12, line: 81, column: 13)
!112 = !DILocation(line: 82, column: 17, scope: !111)
!113 = !DILocation(line: 82, column: 30, scope: !111)
!114 = !DILocation(line: 84, column: 23, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !12, line: 84, column: 17)
!116 = !DILocation(line: 84, column: 21, scope: !115)
!117 = !DILocation(line: 84, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 84, column: 17)
!119 = !DILocation(line: 84, column: 30, scope: !118)
!120 = !DILocation(line: 84, column: 17, scope: !115)
!121 = !DILocation(line: 86, column: 41, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 85, column: 17)
!123 = !DILocation(line: 86, column: 34, scope: !122)
!124 = !DILocation(line: 86, column: 21, scope: !122)
!125 = !DILocation(line: 87, column: 17, scope: !122)
!126 = !DILocation(line: 84, column: 37, scope: !118)
!127 = !DILocation(line: 84, column: 17, scope: !118)
!128 = distinct !{!128, !120, !129, !58}
!129 = !DILocation(line: 87, column: 17, scope: !115)
!130 = !DILocation(line: 88, column: 13, scope: !111)
!131 = !DILocation(line: 91, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !104, file: !12, line: 90, column: 13)
!133 = !DILocation(line: 94, column: 9, scope: !99)
!134 = !DILocation(line: 96, column: 1, scope: !88)
!135 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!136 = !DILocalVariable(name: "data", scope: !135, file: !12, line: 101, type: !17)
!137 = !DILocation(line: 101, column: 9, scope: !135)
!138 = !DILocation(line: 103, column: 10, scope: !135)
!139 = !DILocation(line: 104, column: 5, scope: !135)
!140 = !DILocation(line: 108, column: 14, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !12, line: 105, column: 5)
!142 = !DILocation(line: 109, column: 9, scope: !141)
!143 = !DILocation(line: 111, column: 5, scope: !135)
!144 = !DILocalVariable(name: "i", scope: !145, file: !12, line: 114, type: !17)
!145 = distinct !DILexicalBlock(scope: !146, file: !12, line: 113, column: 9)
!146 = distinct !DILexicalBlock(scope: !135, file: !12, line: 112, column: 5)
!147 = !DILocation(line: 114, column: 17, scope: !145)
!148 = !DILocalVariable(name: "buffer", scope: !145, file: !12, line: 115, type: !30)
!149 = !DILocation(line: 115, column: 17, scope: !145)
!150 = !DILocation(line: 118, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !12, line: 118, column: 17)
!152 = !DILocation(line: 118, column: 22, scope: !151)
!153 = !DILocation(line: 118, column: 17, scope: !145)
!154 = !DILocation(line: 120, column: 24, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !12, line: 119, column: 13)
!156 = !DILocation(line: 120, column: 17, scope: !155)
!157 = !DILocation(line: 120, column: 30, scope: !155)
!158 = !DILocation(line: 122, column: 23, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !12, line: 122, column: 17)
!160 = !DILocation(line: 122, column: 21, scope: !159)
!161 = !DILocation(line: 122, column: 28, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 122, column: 17)
!163 = !DILocation(line: 122, column: 30, scope: !162)
!164 = !DILocation(line: 122, column: 17, scope: !159)
!165 = !DILocation(line: 124, column: 41, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !12, line: 123, column: 17)
!167 = !DILocation(line: 124, column: 34, scope: !166)
!168 = !DILocation(line: 124, column: 21, scope: !166)
!169 = !DILocation(line: 125, column: 17, scope: !166)
!170 = !DILocation(line: 122, column: 37, scope: !162)
!171 = !DILocation(line: 122, column: 17, scope: !162)
!172 = distinct !{!172, !164, !173, !58}
!173 = !DILocation(line: 125, column: 17, scope: !159)
!174 = !DILocation(line: 126, column: 13, scope: !155)
!175 = !DILocation(line: 129, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !151, file: !12, line: 128, column: 13)
!177 = !DILocation(line: 132, column: 9, scope: !146)
!178 = !DILocation(line: 134, column: 1, scope: !135)
