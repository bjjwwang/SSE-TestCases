; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fgets_44_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !26, metadata !DIExpression()), !dbg !32
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !35
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !36
  %cmp = icmp ne i8* %call, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !39
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !41
  store i32 %call2, i32* %data, align 4, !dbg !42
  br label %if.end, !dbg !43

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !46
  %3 = load i32, i32* %data, align 4, !dbg !47
  call void %2(i32 noundef %3), !dbg !46
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !49 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !52, metadata !DIExpression()), !dbg !57
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !57
  %1 = load i32, i32* %data.addr, align 4, !dbg !58
  %cmp = icmp sge i32 %1, 0, !dbg !60
  br i1 %cmp, label %if.then, label %if.else, !dbg !61

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !62
  %idxprom = sext i32 %2 to i64, !dbg !64
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !64
  %3 = load i32, i32* %arrayidx, align 4, !dbg !64
  call void @printIntLine(i32 noundef %3), !dbg !65
  br label %if.end, !dbg !66

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !67
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !69
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i8* @fgets(i8* noundef, i32 noundef, %struct.__sFILE* noundef) #3

declare i32 @atoi(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_fgets_44_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  call void @goodB2G(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* noundef null), !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 noundef %conv), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @CWE126_Buffer_Overread__CWE129_fgets_44_good(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  call void @CWE126_Buffer_Overread__CWE129_fgets_44_bad(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !96, metadata !DIExpression()), !dbg !97
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !97
  store i32 -1, i32* %data, align 4, !dbg !98
  store i32 7, i32* %data, align 4, !dbg !99
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !100
  %1 = load i32, i32* %data, align 4, !dbg !101
  call void %0(i32 noundef %1), !dbg !100
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !103 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !106, metadata !DIExpression()), !dbg !108
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !108
  %1 = load i32, i32* %data.addr, align 4, !dbg !109
  %cmp = icmp sge i32 %1, 0, !dbg !111
  br i1 %cmp, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !113
  %idxprom = sext i32 %2 to i64, !dbg !115
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !115
  %3 = load i32, i32* %arrayidx, align 4, !dbg !115
  call void @printIntLine(i32 noundef %3), !dbg !116
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !121 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !124, metadata !DIExpression()), !dbg !125
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !125
  store i32 -1, i32* %data, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !127, metadata !DIExpression()), !dbg !129
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !129
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !130
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !132
  %call = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 14, %struct.__sFILE* noundef %1), !dbg !133
  %cmp = icmp ne i8* %call, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.else, !dbg !135

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !136
  %call2 = call i32 @atoi(i8* noundef %arraydecay1), !dbg !138
  store i32 %call2, i32* %data, align 4, !dbg !139
  br label %if.end, !dbg !140

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !141
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !143
  %3 = load i32, i32* %data, align 4, !dbg !144
  call void %2(i32 noundef %3), !dbg !143
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2GSink(i32 noundef %data) #0 !dbg !146 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !149, metadata !DIExpression()), !dbg !151
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !151
  %1 = load i32, i32* %data.addr, align 4, !dbg !152
  %cmp = icmp sge i32 %1, 0, !dbg !154
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !155

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !156
  %cmp1 = icmp slt i32 %2, 10, !dbg !157
  br i1 %cmp1, label %if.then, label %if.else, !dbg !158

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !159
  %idxprom = sext i32 %3 to i64, !dbg !161
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !161
  %4 = load i32, i32* %arrayidx, align 4, !dbg !161
  call void @printIntLine(i32 noundef %4), !dbg !162
  br label %if.end, !dbg !163

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !164
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !166
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_44_bad", scope: !13, file: !13, line: 41, type: !14, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_fgets_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 43, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 43, column: 9, scope: !12)
!20 = !DILocalVariable(name: "funcPtr", scope: !12, file: !13, line: 45, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !18}
!24 = !DILocation(line: 45, column: 12, scope: !12)
!25 = !DILocation(line: 47, column: 10, scope: !12)
!26 = !DILocalVariable(name: "inputBuffer", scope: !27, file: !13, line: 49, type: !28)
!27 = distinct !DILexicalBlock(scope: !12, file: !13, line: 48, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 112, elements: !30)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!31}
!31 = !DISubrange(count: 14)
!32 = !DILocation(line: 49, column: 14, scope: !27)
!33 = !DILocation(line: 51, column: 19, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !13, line: 51, column: 13)
!35 = !DILocation(line: 51, column: 49, scope: !34)
!36 = !DILocation(line: 51, column: 13, scope: !34)
!37 = !DILocation(line: 51, column: 56, scope: !34)
!38 = !DILocation(line: 51, column: 13, scope: !27)
!39 = !DILocation(line: 54, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !13, line: 52, column: 9)
!41 = !DILocation(line: 54, column: 20, scope: !40)
!42 = !DILocation(line: 54, column: 18, scope: !40)
!43 = !DILocation(line: 55, column: 9, scope: !40)
!44 = !DILocation(line: 58, column: 13, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !13, line: 57, column: 9)
!46 = !DILocation(line: 62, column: 5, scope: !12)
!47 = !DILocation(line: 62, column: 13, scope: !12)
!48 = !DILocation(line: 63, column: 1, scope: !12)
!49 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 24, type: !22, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!50 = !DILocalVariable(name: "data", arg: 1, scope: !49, file: !13, line: 24, type: !18)
!51 = !DILocation(line: 24, column: 25, scope: !49)
!52 = !DILocalVariable(name: "buffer", scope: !53, file: !13, line: 27, type: !54)
!53 = distinct !DILexicalBlock(scope: !49, file: !13, line: 26, column: 5)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 10)
!57 = !DILocation(line: 27, column: 13, scope: !53)
!58 = !DILocation(line: 30, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !13, line: 30, column: 13)
!60 = !DILocation(line: 30, column: 18, scope: !59)
!61 = !DILocation(line: 30, column: 13, scope: !53)
!62 = !DILocation(line: 32, column: 33, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !13, line: 31, column: 9)
!64 = !DILocation(line: 32, column: 26, scope: !63)
!65 = !DILocation(line: 32, column: 13, scope: !63)
!66 = !DILocation(line: 33, column: 9, scope: !63)
!67 = !DILocation(line: 36, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !59, file: !13, line: 35, column: 9)
!69 = !DILocation(line: 39, column: 1, scope: !49)
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_44_good", scope: !13, file: !13, line: 138, type: !14, scopeLine: 139, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!71 = !DILocation(line: 140, column: 5, scope: !70)
!72 = !DILocation(line: 141, column: 5, scope: !70)
!73 = !DILocation(line: 142, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 152, type: !75, scopeLine: 153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!75 = !DISubroutineType(types: !76)
!76 = !{!18, !18, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !13, line: 152, type: !18)
!80 = !DILocation(line: 152, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !13, line: 152, type: !77)
!82 = !DILocation(line: 152, column: 27, scope: !74)
!83 = !DILocation(line: 155, column: 22, scope: !74)
!84 = !DILocation(line: 155, column: 12, scope: !74)
!85 = !DILocation(line: 155, column: 5, scope: !74)
!86 = !DILocation(line: 157, column: 5, scope: !74)
!87 = !DILocation(line: 158, column: 5, scope: !74)
!88 = !DILocation(line: 159, column: 5, scope: !74)
!89 = !DILocation(line: 162, column: 5, scope: !74)
!90 = !DILocation(line: 163, column: 5, scope: !74)
!91 = !DILocation(line: 164, column: 5, scope: !74)
!92 = !DILocation(line: 166, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 87, type: !14, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!94 = !DILocalVariable(name: "data", scope: !93, file: !13, line: 89, type: !18)
!95 = !DILocation(line: 89, column: 9, scope: !93)
!96 = !DILocalVariable(name: "funcPtr", scope: !93, file: !13, line: 90, type: !21)
!97 = !DILocation(line: 90, column: 12, scope: !93)
!98 = !DILocation(line: 92, column: 10, scope: !93)
!99 = !DILocation(line: 95, column: 10, scope: !93)
!100 = !DILocation(line: 96, column: 5, scope: !93)
!101 = !DILocation(line: 96, column: 13, scope: !93)
!102 = !DILocation(line: 97, column: 1, scope: !93)
!103 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 70, type: !22, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!104 = !DILocalVariable(name: "data", arg: 1, scope: !103, file: !13, line: 70, type: !18)
!105 = !DILocation(line: 70, column: 29, scope: !103)
!106 = !DILocalVariable(name: "buffer", scope: !107, file: !13, line: 73, type: !54)
!107 = distinct !DILexicalBlock(scope: !103, file: !13, line: 72, column: 5)
!108 = !DILocation(line: 73, column: 13, scope: !107)
!109 = !DILocation(line: 76, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !13, line: 76, column: 13)
!111 = !DILocation(line: 76, column: 18, scope: !110)
!112 = !DILocation(line: 76, column: 13, scope: !107)
!113 = !DILocation(line: 78, column: 33, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !13, line: 77, column: 9)
!115 = !DILocation(line: 78, column: 26, scope: !114)
!116 = !DILocation(line: 78, column: 13, scope: !114)
!117 = !DILocation(line: 79, column: 9, scope: !114)
!118 = !DILocation(line: 82, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !110, file: !13, line: 81, column: 9)
!120 = !DILocation(line: 85, column: 1, scope: !103)
!121 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 116, type: !14, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!122 = !DILocalVariable(name: "data", scope: !121, file: !13, line: 118, type: !18)
!123 = !DILocation(line: 118, column: 9, scope: !121)
!124 = !DILocalVariable(name: "funcPtr", scope: !121, file: !13, line: 119, type: !21)
!125 = !DILocation(line: 119, column: 12, scope: !121)
!126 = !DILocation(line: 121, column: 10, scope: !121)
!127 = !DILocalVariable(name: "inputBuffer", scope: !128, file: !13, line: 123, type: !28)
!128 = distinct !DILexicalBlock(scope: !121, file: !13, line: 122, column: 5)
!129 = !DILocation(line: 123, column: 14, scope: !128)
!130 = !DILocation(line: 125, column: 19, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !13, line: 125, column: 13)
!132 = !DILocation(line: 125, column: 49, scope: !131)
!133 = !DILocation(line: 125, column: 13, scope: !131)
!134 = !DILocation(line: 125, column: 56, scope: !131)
!135 = !DILocation(line: 125, column: 13, scope: !128)
!136 = !DILocation(line: 128, column: 25, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !13, line: 126, column: 9)
!138 = !DILocation(line: 128, column: 20, scope: !137)
!139 = !DILocation(line: 128, column: 18, scope: !137)
!140 = !DILocation(line: 129, column: 9, scope: !137)
!141 = !DILocation(line: 132, column: 13, scope: !142)
!142 = distinct !DILexicalBlock(scope: !131, file: !13, line: 131, column: 9)
!143 = !DILocation(line: 135, column: 5, scope: !121)
!144 = !DILocation(line: 135, column: 13, scope: !121)
!145 = !DILocation(line: 136, column: 1, scope: !121)
!146 = distinct !DISubprogram(name: "goodB2GSink", scope: !13, file: !13, line: 100, type: !22, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!147 = !DILocalVariable(name: "data", arg: 1, scope: !146, file: !13, line: 100, type: !18)
!148 = !DILocation(line: 100, column: 29, scope: !146)
!149 = !DILocalVariable(name: "buffer", scope: !150, file: !13, line: 103, type: !54)
!150 = distinct !DILexicalBlock(scope: !146, file: !13, line: 102, column: 5)
!151 = !DILocation(line: 103, column: 13, scope: !150)
!152 = !DILocation(line: 105, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !13, line: 105, column: 13)
!154 = !DILocation(line: 105, column: 18, scope: !153)
!155 = !DILocation(line: 105, column: 23, scope: !153)
!156 = !DILocation(line: 105, column: 26, scope: !153)
!157 = !DILocation(line: 105, column: 31, scope: !153)
!158 = !DILocation(line: 105, column: 13, scope: !150)
!159 = !DILocation(line: 107, column: 33, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !13, line: 106, column: 9)
!161 = !DILocation(line: 107, column: 26, scope: !160)
!162 = !DILocation(line: 107, column: 13, scope: !160)
!163 = !DILocation(line: 108, column: 9, scope: !160)
!164 = !DILocation(line: 111, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !153, file: !13, line: 110, column: 9)
!166 = !DILocation(line: 114, column: 1, scope: !146)
