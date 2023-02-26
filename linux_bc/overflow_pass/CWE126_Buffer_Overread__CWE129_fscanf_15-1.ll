; ModuleID = 'linux_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_15-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_15-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !19
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !21, metadata !DIExpression()), !dbg !26
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !26
  %2 = load i32, i32* %data, align 4, !dbg !27
  %cmp = icmp sge i32 %2, 0, !dbg !29
  br i1 %cmp, label %if.then, label %if.else, !dbg !30

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !31
  %idxprom = sext i32 %3 to i64, !dbg !33
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !33
  %4 = load i32, i32* %arrayidx, align 4, !dbg !33
  call void @printIntLine(i32 %4), !dbg !34
  br label %if.end, !dbg !35

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_15_good() #0 !dbg !39 {
entry:
  call void @goodB2G1(), !dbg !40
  call void @goodB2G2(), !dbg !41
  call void @goodG2B1(), !dbg !42
  call void @goodG2B2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE126_Buffer_Overread__CWE129_fscanf_15_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__CWE129_fscanf_15_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodB2G1() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 -1, i32* %data, align 4, !dbg !68
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !69
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !70
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !71, metadata !DIExpression()), !dbg !73
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !73
  %2 = load i32, i32* %data, align 4, !dbg !74
  %cmp = icmp sge i32 %2, 0, !dbg !76
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !77

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !78
  %cmp1 = icmp slt i32 %3, 10, !dbg !79
  br i1 %cmp1, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !81
  %idxprom = sext i32 %4 to i64, !dbg !83
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !83
  %5 = load i32, i32* %arrayidx, align 4, !dbg !83
  call void @printIntLine(i32 %5), !dbg !84
  br label %if.end, !dbg !85

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !86
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodB2G2() #0 !dbg !89 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 -1, i32* %data, align 4, !dbg !92
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !93
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !94
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !95, metadata !DIExpression()), !dbg !97
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !97
  %2 = load i32, i32* %data, align 4, !dbg !98
  %cmp = icmp sge i32 %2, 0, !dbg !100
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !101

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !102
  %cmp1 = icmp slt i32 %3, 10, !dbg !103
  br i1 %cmp1, label %if.then, label %if.else, !dbg !104

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !105
  %idxprom = sext i32 %4 to i64, !dbg !107
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !107
  %5 = load i32, i32* %arrayidx, align 4, !dbg !107
  call void @printIntLine(i32 %5), !dbg !108
  br label %if.end, !dbg !109

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !110
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !113 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 -1, i32* %data, align 4, !dbg !116
  store i32 7, i32* %data, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !118, metadata !DIExpression()), !dbg !120
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !120
  %1 = load i32, i32* %data, align 4, !dbg !121
  %cmp = icmp sge i32 %1, 0, !dbg !123
  br i1 %cmp, label %if.then, label %if.else, !dbg !124

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !125
  %idxprom = sext i32 %2 to i64, !dbg !127
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !127
  %3 = load i32, i32* %arrayidx, align 4, !dbg !127
  call void @printIntLine(i32 %3), !dbg !128
  br label %if.end, !dbg !129

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !130
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !134, metadata !DIExpression()), !dbg !135
  store i32 -1, i32* %data, align 4, !dbg !136
  store i32 7, i32* %data, align 4, !dbg !137
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !138, metadata !DIExpression()), !dbg !140
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !140
  %1 = load i32, i32* %data, align 4, !dbg !141
  %cmp = icmp sge i32 %1, 0, !dbg !143
  br i1 %cmp, label %if.then, label %if.else, !dbg !144

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !145
  %idxprom = sext i32 %2 to i64, !dbg !147
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !147
  %3 = load i32, i32* %arrayidx, align 4, !dbg !147
  call void @printIntLine(i32 %3), !dbg !148
  br label %if.end, !dbg !149

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !150
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_15-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_15_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_fscanf_15-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 31, column: 16, scope: !11)
!20 = !DILocation(line: 31, column: 9, scope: !11)
!21 = !DILocalVariable(name: "buffer", scope: !22, file: !12, line: 42, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 10)
!26 = !DILocation(line: 42, column: 13, scope: !22)
!27 = !DILocation(line: 45, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !12, line: 45, column: 13)
!29 = !DILocation(line: 45, column: 18, scope: !28)
!30 = !DILocation(line: 45, column: 13, scope: !22)
!31 = !DILocation(line: 47, column: 33, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 46, column: 9)
!33 = !DILocation(line: 47, column: 26, scope: !32)
!34 = !DILocation(line: 47, column: 13, scope: !32)
!35 = !DILocation(line: 48, column: 9, scope: !32)
!36 = !DILocation(line: 51, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !28, file: !12, line: 50, column: 9)
!38 = !DILocation(line: 60, column: 1, scope: !11)
!39 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_15_good", scope: !12, file: !12, line: 230, type: !13, scopeLine: 231, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 232, column: 5, scope: !39)
!41 = !DILocation(line: 233, column: 5, scope: !39)
!42 = !DILocation(line: 234, column: 5, scope: !39)
!43 = !DILocation(line: 235, column: 5, scope: !39)
!44 = !DILocation(line: 236, column: 1, scope: !39)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 247, type: !46, scopeLine: 248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!16, !16, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 247, type: !16)
!52 = !DILocation(line: 247, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 247, type: !48)
!54 = !DILocation(line: 247, column: 27, scope: !45)
!55 = !DILocation(line: 250, column: 22, scope: !45)
!56 = !DILocation(line: 250, column: 12, scope: !45)
!57 = !DILocation(line: 250, column: 5, scope: !45)
!58 = !DILocation(line: 252, column: 5, scope: !45)
!59 = !DILocation(line: 253, column: 5, scope: !45)
!60 = !DILocation(line: 254, column: 5, scope: !45)
!61 = !DILocation(line: 257, column: 5, scope: !45)
!62 = !DILocation(line: 258, column: 5, scope: !45)
!63 = !DILocation(line: 259, column: 5, scope: !45)
!64 = !DILocation(line: 261, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "goodB2G1", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 69, type: !16)
!67 = !DILocation(line: 69, column: 9, scope: !65)
!68 = !DILocation(line: 71, column: 10, scope: !65)
!69 = !DILocation(line: 76, column: 16, scope: !65)
!70 = !DILocation(line: 76, column: 9, scope: !65)
!71 = !DILocalVariable(name: "buffer", scope: !72, file: !12, line: 91, type: !23)
!72 = distinct !DILexicalBlock(scope: !65, file: !12, line: 90, column: 5)
!73 = !DILocation(line: 91, column: 13, scope: !72)
!74 = !DILocation(line: 93, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !12, line: 93, column: 13)
!76 = !DILocation(line: 93, column: 18, scope: !75)
!77 = !DILocation(line: 93, column: 23, scope: !75)
!78 = !DILocation(line: 93, column: 26, scope: !75)
!79 = !DILocation(line: 93, column: 31, scope: !75)
!80 = !DILocation(line: 93, column: 13, scope: !72)
!81 = !DILocation(line: 95, column: 33, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !12, line: 94, column: 9)
!83 = !DILocation(line: 95, column: 26, scope: !82)
!84 = !DILocation(line: 95, column: 13, scope: !82)
!85 = !DILocation(line: 96, column: 9, scope: !82)
!86 = !DILocation(line: 99, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !75, file: !12, line: 98, column: 9)
!88 = !DILocation(line: 104, column: 1, scope: !65)
!89 = distinct !DISubprogram(name: "goodB2G2", scope: !12, file: !12, line: 107, type: !13, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 109, type: !16)
!91 = !DILocation(line: 109, column: 9, scope: !89)
!92 = !DILocation(line: 111, column: 10, scope: !89)
!93 = !DILocation(line: 116, column: 16, scope: !89)
!94 = !DILocation(line: 116, column: 9, scope: !89)
!95 = !DILocalVariable(name: "buffer", scope: !96, file: !12, line: 127, type: !23)
!96 = distinct !DILexicalBlock(scope: !89, file: !12, line: 126, column: 5)
!97 = !DILocation(line: 127, column: 13, scope: !96)
!98 = !DILocation(line: 129, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !12, line: 129, column: 13)
!100 = !DILocation(line: 129, column: 18, scope: !99)
!101 = !DILocation(line: 129, column: 23, scope: !99)
!102 = !DILocation(line: 129, column: 26, scope: !99)
!103 = !DILocation(line: 129, column: 31, scope: !99)
!104 = !DILocation(line: 129, column: 13, scope: !96)
!105 = !DILocation(line: 131, column: 33, scope: !106)
!106 = distinct !DILexicalBlock(scope: !99, file: !12, line: 130, column: 9)
!107 = !DILocation(line: 131, column: 26, scope: !106)
!108 = !DILocation(line: 131, column: 13, scope: !106)
!109 = !DILocation(line: 132, column: 9, scope: !106)
!110 = !DILocation(line: 135, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !12, line: 134, column: 9)
!112 = !DILocation(line: 144, column: 1, scope: !89)
!113 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 147, type: !13, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 149, type: !16)
!115 = !DILocation(line: 149, column: 9, scope: !113)
!116 = !DILocation(line: 151, column: 10, scope: !113)
!117 = !DILocation(line: 161, column: 14, scope: !113)
!118 = !DILocalVariable(name: "buffer", scope: !119, file: !12, line: 168, type: !23)
!119 = distinct !DILexicalBlock(scope: !113, file: !12, line: 167, column: 5)
!120 = !DILocation(line: 168, column: 13, scope: !119)
!121 = !DILocation(line: 171, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 171, column: 13)
!123 = !DILocation(line: 171, column: 18, scope: !122)
!124 = !DILocation(line: 171, column: 13, scope: !119)
!125 = !DILocation(line: 173, column: 33, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 172, column: 9)
!127 = !DILocation(line: 173, column: 26, scope: !126)
!128 = !DILocation(line: 173, column: 13, scope: !126)
!129 = !DILocation(line: 174, column: 9, scope: !126)
!130 = !DILocation(line: 177, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !122, file: !12, line: 176, column: 9)
!132 = !DILocation(line: 186, column: 1, scope: !113)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 189, type: !13, scopeLine: 190, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", scope: !133, file: !12, line: 191, type: !16)
!135 = !DILocation(line: 191, column: 9, scope: !133)
!136 = !DILocation(line: 193, column: 10, scope: !133)
!137 = !DILocation(line: 199, column: 14, scope: !133)
!138 = !DILocalVariable(name: "buffer", scope: !139, file: !12, line: 210, type: !23)
!139 = distinct !DILexicalBlock(scope: !133, file: !12, line: 209, column: 5)
!140 = !DILocation(line: 210, column: 13, scope: !139)
!141 = !DILocation(line: 213, column: 13, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !12, line: 213, column: 13)
!143 = !DILocation(line: 213, column: 18, scope: !142)
!144 = !DILocation(line: 213, column: 13, scope: !139)
!145 = !DILocation(line: 215, column: 33, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !12, line: 214, column: 9)
!147 = !DILocation(line: 215, column: 26, scope: !146)
!148 = !DILocation(line: 215, column: 13, scope: !146)
!149 = !DILocation(line: 216, column: 9, scope: !146)
!150 = !DILocation(line: 219, column: 13, scope: !151)
!151 = distinct !DILexicalBlock(scope: !142, file: !12, line: 218, column: 9)
!152 = !DILocation(line: 228, column: 1, scope: !133)
