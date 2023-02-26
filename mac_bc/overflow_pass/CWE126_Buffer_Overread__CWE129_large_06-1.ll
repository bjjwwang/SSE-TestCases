; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_large_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_large_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_large_06_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  store i32 10, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !23, metadata !DIExpression()), !dbg !30
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !30
  %1 = load i32, i32* %data, align 4, !dbg !31
  %cmp = icmp sge i32 %1, 0, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !35
  %idxprom = sext i32 %2 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !37
  %3 = load i32, i32* %arrayidx, align 4, !dbg !37
  call void @printIntLine(i32 noundef %3), !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !40
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_large_06_good() #0 !dbg !43 {
entry:
  call void @goodB2G1(), !dbg !44
  call void @goodB2G2(), !dbg !45
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__CWE129_large_06_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  call void @CWE126_Buffer_Overread__CWE129_large_06_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !69 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 -1, i32* %data, align 4, !dbg !72
  store i32 10, i32* %data, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !76, metadata !DIExpression()), !dbg !80
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !80
  %1 = load i32, i32* %data, align 4, !dbg !81
  %cmp = icmp sge i32 %1, 0, !dbg !83
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !84

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !85
  %cmp1 = icmp slt i32 %2, 10, !dbg !86
  br i1 %cmp1, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !88
  %idxprom = sext i32 %3 to i64, !dbg !90
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !90
  %4 = load i32, i32* %arrayidx, align 4, !dbg !90
  call void @printIntLine(i32 noundef %4), !dbg !91
  br label %if.end, !dbg !92

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !96 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i32 -1, i32* %data, align 4, !dbg !99
  store i32 10, i32* %data, align 4, !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !103, metadata !DIExpression()), !dbg !107
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !107
  %1 = load i32, i32* %data, align 4, !dbg !108
  %cmp = icmp sge i32 %1, 0, !dbg !110
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !111

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !112
  %cmp1 = icmp slt i32 %2, 10, !dbg !113
  br i1 %cmp1, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !115
  %idxprom = sext i32 %3 to i64, !dbg !117
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !117
  %4 = load i32, i32* %arrayidx, align 4, !dbg !117
  call void @printIntLine(i32 noundef %4), !dbg !118
  br label %if.end, !dbg !119

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !123 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 -1, i32* %data, align 4, !dbg !126
  store i32 7, i32* %data, align 4, !dbg !127
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !130, metadata !DIExpression()), !dbg !134
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !134
  %1 = load i32, i32* %data, align 4, !dbg !135
  %cmp = icmp sge i32 %1, 0, !dbg !137
  br i1 %cmp, label %if.then, label %if.else, !dbg !138

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !139
  %idxprom = sext i32 %2 to i64, !dbg !141
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !141
  %3 = load i32, i32* %arrayidx, align 4, !dbg !141
  call void @printIntLine(i32 noundef %3), !dbg !142
  br label %if.end, !dbg !143

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !144
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !148, metadata !DIExpression()), !dbg !149
  store i32 -1, i32* %data, align 4, !dbg !150
  store i32 7, i32* %data, align 4, !dbg !151
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !154, metadata !DIExpression()), !dbg !158
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !158
  %1 = load i32, i32* %data, align 4, !dbg !159
  %cmp = icmp sge i32 %1, 0, !dbg !161
  br i1 %cmp, label %if.then, label %if.else, !dbg !162

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !163
  %idxprom = sext i32 %2 to i64, !dbg !165
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !165
  %3 = load i32, i32* %arrayidx, align 4, !dbg !165
  call void @printIntLine(i32 noundef %3), !dbg !166
  br label %if.end, !dbg !167

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !168
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_large_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_06_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_large_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 29, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 29, column: 9, scope: !11)
!19 = !DILocation(line: 31, column: 10, scope: !11)
!20 = !DILocation(line: 35, column: 14, scope: !21)
!21 = distinct !DILexicalBlock(scope: !22, file: !12, line: 33, column: 5)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!23 = !DILocalVariable(name: "buffer", scope: !24, file: !12, line: 40, type: !27)
!24 = distinct !DILexicalBlock(scope: !25, file: !12, line: 39, column: 9)
!25 = distinct !DILexicalBlock(scope: !26, file: !12, line: 38, column: 5)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 8)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 40, column: 17, scope: !24)
!31 = !DILocation(line: 43, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !12, line: 43, column: 17)
!33 = !DILocation(line: 43, column: 22, scope: !32)
!34 = !DILocation(line: 43, column: 17, scope: !24)
!35 = !DILocation(line: 45, column: 37, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 44, column: 13)
!37 = !DILocation(line: 45, column: 30, scope: !36)
!38 = !DILocation(line: 45, column: 17, scope: !36)
!39 = !DILocation(line: 46, column: 13, scope: !36)
!40 = !DILocation(line: 49, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !12, line: 48, column: 13)
!42 = !DILocation(line: 53, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_06_good", scope: !12, file: !12, line: 185, type: !13, scopeLine: 186, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!44 = !DILocation(line: 187, column: 5, scope: !43)
!45 = !DILocation(line: 188, column: 5, scope: !43)
!46 = !DILocation(line: 189, column: 5, scope: !43)
!47 = !DILocation(line: 190, column: 5, scope: !43)
!48 = !DILocation(line: 191, column: 1, scope: !43)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 202, type: !50, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!50 = !DISubroutineType(types: !51)
!51 = !{!17, !17, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 202, type: !17)
!56 = !DILocation(line: 202, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 202, type: !52)
!58 = !DILocation(line: 202, column: 27, scope: !49)
!59 = !DILocation(line: 205, column: 22, scope: !49)
!60 = !DILocation(line: 205, column: 12, scope: !49)
!61 = !DILocation(line: 205, column: 5, scope: !49)
!62 = !DILocation(line: 207, column: 5, scope: !49)
!63 = !DILocation(line: 208, column: 5, scope: !49)
!64 = !DILocation(line: 209, column: 5, scope: !49)
!65 = !DILocation(line: 212, column: 5, scope: !49)
!66 = !DILocation(line: 213, column: 5, scope: !49)
!67 = !DILocation(line: 214, column: 5, scope: !49)
!68 = !DILocation(line: 216, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 62, type: !17)
!71 = !DILocation(line: 62, column: 9, scope: !69)
!72 = !DILocation(line: 64, column: 10, scope: !69)
!73 = !DILocation(line: 68, column: 14, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !12, line: 66, column: 5)
!75 = distinct !DILexicalBlock(scope: !69, file: !12, line: 65, column: 8)
!76 = !DILocalVariable(name: "buffer", scope: !77, file: !12, line: 78, type: !27)
!77 = distinct !DILexicalBlock(scope: !78, file: !12, line: 77, column: 9)
!78 = distinct !DILexicalBlock(scope: !79, file: !12, line: 76, column: 5)
!79 = distinct !DILexicalBlock(scope: !69, file: !12, line: 70, column: 8)
!80 = !DILocation(line: 78, column: 17, scope: !77)
!81 = !DILocation(line: 80, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !12, line: 80, column: 17)
!83 = !DILocation(line: 80, column: 22, scope: !82)
!84 = !DILocation(line: 80, column: 27, scope: !82)
!85 = !DILocation(line: 80, column: 30, scope: !82)
!86 = !DILocation(line: 80, column: 35, scope: !82)
!87 = !DILocation(line: 80, column: 17, scope: !77)
!88 = !DILocation(line: 82, column: 37, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !12, line: 81, column: 13)
!90 = !DILocation(line: 82, column: 30, scope: !89)
!91 = !DILocation(line: 82, column: 17, scope: !89)
!92 = !DILocation(line: 83, column: 13, scope: !89)
!93 = !DILocation(line: 86, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !12, line: 85, column: 13)
!95 = !DILocation(line: 90, column: 1, scope: !69)
!96 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 95, type: !17)
!98 = !DILocation(line: 95, column: 9, scope: !96)
!99 = !DILocation(line: 97, column: 10, scope: !96)
!100 = !DILocation(line: 101, column: 14, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !12, line: 99, column: 5)
!102 = distinct !DILexicalBlock(scope: !96, file: !12, line: 98, column: 8)
!103 = !DILocalVariable(name: "buffer", scope: !104, file: !12, line: 106, type: !27)
!104 = distinct !DILexicalBlock(scope: !105, file: !12, line: 105, column: 9)
!105 = distinct !DILexicalBlock(scope: !106, file: !12, line: 104, column: 5)
!106 = distinct !DILexicalBlock(scope: !96, file: !12, line: 103, column: 8)
!107 = !DILocation(line: 106, column: 17, scope: !104)
!108 = !DILocation(line: 108, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !12, line: 108, column: 17)
!110 = !DILocation(line: 108, column: 22, scope: !109)
!111 = !DILocation(line: 108, column: 27, scope: !109)
!112 = !DILocation(line: 108, column: 30, scope: !109)
!113 = !DILocation(line: 108, column: 35, scope: !109)
!114 = !DILocation(line: 108, column: 17, scope: !104)
!115 = !DILocation(line: 110, column: 37, scope: !116)
!116 = distinct !DILexicalBlock(scope: !109, file: !12, line: 109, column: 13)
!117 = !DILocation(line: 110, column: 30, scope: !116)
!118 = !DILocation(line: 110, column: 17, scope: !116)
!119 = !DILocation(line: 111, column: 13, scope: !116)
!120 = !DILocation(line: 114, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !109, file: !12, line: 113, column: 13)
!122 = !DILocation(line: 118, column: 1, scope: !96)
!123 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 121, type: !13, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!124 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 123, type: !17)
!125 = !DILocation(line: 123, column: 9, scope: !123)
!126 = !DILocation(line: 125, column: 10, scope: !123)
!127 = !DILocation(line: 135, column: 14, scope: !128)
!128 = distinct !DILexicalBlock(scope: !129, file: !12, line: 132, column: 5)
!129 = distinct !DILexicalBlock(scope: !123, file: !12, line: 126, column: 8)
!130 = !DILocalVariable(name: "buffer", scope: !131, file: !12, line: 140, type: !27)
!131 = distinct !DILexicalBlock(scope: !132, file: !12, line: 139, column: 9)
!132 = distinct !DILexicalBlock(scope: !133, file: !12, line: 138, column: 5)
!133 = distinct !DILexicalBlock(scope: !123, file: !12, line: 137, column: 8)
!134 = !DILocation(line: 140, column: 17, scope: !131)
!135 = !DILocation(line: 143, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !12, line: 143, column: 17)
!137 = !DILocation(line: 143, column: 22, scope: !136)
!138 = !DILocation(line: 143, column: 17, scope: !131)
!139 = !DILocation(line: 145, column: 37, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !12, line: 144, column: 13)
!141 = !DILocation(line: 145, column: 30, scope: !140)
!142 = !DILocation(line: 145, column: 17, scope: !140)
!143 = !DILocation(line: 146, column: 13, scope: !140)
!144 = !DILocation(line: 149, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !136, file: !12, line: 148, column: 13)
!146 = !DILocation(line: 153, column: 1, scope: !123)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 156, type: !13, scopeLine: 157, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!148 = !DILocalVariable(name: "data", scope: !147, file: !12, line: 158, type: !17)
!149 = !DILocation(line: 158, column: 9, scope: !147)
!150 = !DILocation(line: 160, column: 10, scope: !147)
!151 = !DILocation(line: 165, column: 14, scope: !152)
!152 = distinct !DILexicalBlock(scope: !153, file: !12, line: 162, column: 5)
!153 = distinct !DILexicalBlock(scope: !147, file: !12, line: 161, column: 8)
!154 = !DILocalVariable(name: "buffer", scope: !155, file: !12, line: 170, type: !27)
!155 = distinct !DILexicalBlock(scope: !156, file: !12, line: 169, column: 9)
!156 = distinct !DILexicalBlock(scope: !157, file: !12, line: 168, column: 5)
!157 = distinct !DILexicalBlock(scope: !147, file: !12, line: 167, column: 8)
!158 = !DILocation(line: 170, column: 17, scope: !155)
!159 = !DILocation(line: 173, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !12, line: 173, column: 17)
!161 = !DILocation(line: 173, column: 22, scope: !160)
!162 = !DILocation(line: 173, column: 17, scope: !155)
!163 = !DILocation(line: 175, column: 37, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !12, line: 174, column: 13)
!165 = !DILocation(line: 175, column: 30, scope: !164)
!166 = !DILocation(line: 175, column: 17, scope: !164)
!167 = !DILocation(line: 176, column: 13, scope: !164)
!168 = !DILocation(line: 179, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !160, file: !12, line: 178, column: 13)
!170 = !DILocation(line: 183, column: 1, scope: !147)
