; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 400, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBuffer, align 8, !dbg !30
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  store i32* %2, i32** %data, align 8, !dbg !34
  %3 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %3, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !38
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 99), !dbg !40
  %5 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !56, metadata !DIExpression()), !dbg !57
  %7 = load i32*, i32** %data, align 8, !dbg !58
  %call1 = call i64 @wcslen(i32* noundef %7), !dbg !59
  store i64 %call1, i64* %dataLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !64
  %9 = load i64, i64* %dataLen, align 8, !dbg !66
  %cmp = icmp ult i64 %8, %9, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !69
  %11 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !69
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !69
  %13 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !73
  store i32 %12, i32* %arrayidx3, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %14, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !81
  store i32 0, i32* %arrayidx4, align 4, !dbg !82
  %15 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* noundef %15), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_good() #0 !dbg !86 {
entry:
  call void @goodG2B1(), !dbg !87
  call void @goodG2B2(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 400, align 16, !dbg !115
  %1 = bitcast i8* %0 to i32*, !dbg !116
  store i32* %1, i32** %dataBuffer, align 8, !dbg !114
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  store i32* %2, i32** %data, align 8, !dbg !118
  %3 = load i32, i32* @staticFalse, align 4, !dbg !119
  %tobool = icmp ne i32 %3, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  br label %if.end, !dbg !124

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !125
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !127
  %5 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !135, metadata !DIExpression()), !dbg !136
  %7 = load i32*, i32** %data, align 8, !dbg !137
  %call1 = call i64 @wcslen(i32* noundef %7), !dbg !138
  store i64 %call1, i64* %dataLen, align 8, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !143
  %9 = load i64, i64* %dataLen, align 8, !dbg !145
  %cmp = icmp ult i64 %8, %9, !dbg !146
  br i1 %cmp, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !148
  %11 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !148
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !148
  %13 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !152
  store i32 %12, i32* %arrayidx3, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %14, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !159
  store i32 0, i32* %arrayidx4, align 4, !dbg !160
  %15 = load i32*, i32** %data, align 8, !dbg !161
  call void @printWLine(i32* noundef %15), !dbg !162
  ret void, !dbg !163
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !164 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !167, metadata !DIExpression()), !dbg !168
  %0 = alloca i8, i64 400, align 16, !dbg !169
  %1 = bitcast i8* %0 to i32*, !dbg !170
  store i32* %1, i32** %dataBuffer, align 8, !dbg !168
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !171
  store i32* %2, i32** %data, align 8, !dbg !172
  %3 = load i32, i32* @staticTrue, align 4, !dbg !173
  %tobool = icmp ne i32 %3, 0, !dbg !173
  br i1 %tobool, label %if.then, label %if.end, !dbg !175

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !176
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !178
  %5 = load i32*, i32** %data, align 8, !dbg !179
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !179
  store i32 0, i32* %arrayidx, align 4, !dbg !180
  br label %if.end, !dbg !181

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !182, metadata !DIExpression()), !dbg !184
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !184
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !184
  call void @llvm.dbg.declare(metadata i64* %i, metadata !185, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !187, metadata !DIExpression()), !dbg !188
  %7 = load i32*, i32** %data, align 8, !dbg !189
  %call1 = call i64 @wcslen(i32* noundef %7), !dbg !190
  store i64 %call1, i64* %dataLen, align 8, !dbg !191
  store i64 0, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !195
  %9 = load i64, i64* %dataLen, align 8, !dbg !197
  %cmp = icmp ult i64 %8, %9, !dbg !198
  br i1 %cmp, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !200
  %11 = load i64, i64* %i, align 8, !dbg !202
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !200
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !200
  %13 = load i64, i64* %i, align 8, !dbg !203
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !204
  store i32 %12, i32* %arrayidx3, align 4, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !207
  %inc = add i64 %14, 1, !dbg !207
  store i64 %inc, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !211
  store i32 0, i32* %arrayidx4, align 4, !dbg !212
  %15 = load i32*, i32** %data, align 8, !dbg !213
  call void @printWLine(i32* noundef %15), !dbg !214
  ret void, !dbg !215
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_bad", scope: !15, file: !15, line: 30, type: !24, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !15, line: 32, type: !5)
!28 = !DILocation(line: 32, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !15, line: 33, type: !5)
!30 = !DILocation(line: 33, column: 15, scope: !23)
!31 = !DILocation(line: 33, column: 39, scope: !23)
!32 = !DILocation(line: 33, column: 28, scope: !23)
!33 = !DILocation(line: 34, column: 12, scope: !23)
!34 = !DILocation(line: 34, column: 10, scope: !23)
!35 = !DILocation(line: 35, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !23, file: !15, line: 35, column: 8)
!37 = !DILocation(line: 35, column: 8, scope: !23)
!38 = !DILocation(line: 38, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !15, line: 36, column: 5)
!40 = !DILocation(line: 38, column: 9, scope: !39)
!41 = !DILocation(line: 39, column: 9, scope: !39)
!42 = !DILocation(line: 39, column: 21, scope: !39)
!43 = !DILocation(line: 40, column: 5, scope: !39)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !15, line: 42, type: !46)
!45 = distinct !DILexicalBlock(scope: !23, file: !15, line: 41, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 42, column: 17, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !45, file: !15, line: 43, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 31, baseType: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !9, line: 94, baseType: !54)
!54 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 43, column: 16, scope: !45)
!56 = !DILocalVariable(name: "dataLen", scope: !45, file: !15, line: 43, type: !51)
!57 = !DILocation(line: 43, column: 19, scope: !45)
!58 = !DILocation(line: 44, column: 26, scope: !45)
!59 = !DILocation(line: 44, column: 19, scope: !45)
!60 = !DILocation(line: 44, column: 17, scope: !45)
!61 = !DILocation(line: 46, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !45, file: !15, line: 46, column: 9)
!63 = !DILocation(line: 46, column: 14, scope: !62)
!64 = !DILocation(line: 46, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !15, line: 46, column: 9)
!66 = !DILocation(line: 46, column: 25, scope: !65)
!67 = !DILocation(line: 46, column: 23, scope: !65)
!68 = !DILocation(line: 46, column: 9, scope: !62)
!69 = !DILocation(line: 48, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !15, line: 47, column: 9)
!71 = !DILocation(line: 48, column: 28, scope: !70)
!72 = !DILocation(line: 48, column: 18, scope: !70)
!73 = !DILocation(line: 48, column: 13, scope: !70)
!74 = !DILocation(line: 48, column: 21, scope: !70)
!75 = !DILocation(line: 49, column: 9, scope: !70)
!76 = !DILocation(line: 46, column: 35, scope: !65)
!77 = !DILocation(line: 46, column: 9, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 49, column: 9, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 50, column: 9, scope: !45)
!82 = !DILocation(line: 50, column: 20, scope: !45)
!83 = !DILocation(line: 51, column: 20, scope: !45)
!84 = !DILocation(line: 51, column: 9, scope: !45)
!85 = !DILocation(line: 53, column: 1, scope: !23)
!86 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_05_good", scope: !15, file: !15, line: 116, type: !24, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!87 = !DILocation(line: 118, column: 5, scope: !86)
!88 = !DILocation(line: 119, column: 5, scope: !86)
!89 = !DILocation(line: 120, column: 1, scope: !86)
!90 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 132, type: !91, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!91 = !DISubroutineType(types: !92)
!92 = !{!10, !10, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !15, line: 132, type: !10)
!97 = !DILocation(line: 132, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !15, line: 132, type: !93)
!99 = !DILocation(line: 132, column: 27, scope: !90)
!100 = !DILocation(line: 135, column: 22, scope: !90)
!101 = !DILocation(line: 135, column: 12, scope: !90)
!102 = !DILocation(line: 135, column: 5, scope: !90)
!103 = !DILocation(line: 137, column: 5, scope: !90)
!104 = !DILocation(line: 138, column: 5, scope: !90)
!105 = !DILocation(line: 139, column: 5, scope: !90)
!106 = !DILocation(line: 142, column: 5, scope: !90)
!107 = !DILocation(line: 143, column: 5, scope: !90)
!108 = !DILocation(line: 144, column: 5, scope: !90)
!109 = !DILocation(line: 146, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 60, type: !24, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!111 = !DILocalVariable(name: "data", scope: !110, file: !15, line: 62, type: !5)
!112 = !DILocation(line: 62, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !15, line: 63, type: !5)
!114 = !DILocation(line: 63, column: 15, scope: !110)
!115 = !DILocation(line: 63, column: 39, scope: !110)
!116 = !DILocation(line: 63, column: 28, scope: !110)
!117 = !DILocation(line: 64, column: 12, scope: !110)
!118 = !DILocation(line: 64, column: 10, scope: !110)
!119 = !DILocation(line: 65, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !15, line: 65, column: 8)
!121 = !DILocation(line: 65, column: 8, scope: !110)
!122 = !DILocation(line: 68, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !15, line: 66, column: 5)
!124 = !DILocation(line: 69, column: 5, scope: !123)
!125 = !DILocation(line: 73, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !15, line: 71, column: 5)
!127 = !DILocation(line: 73, column: 9, scope: !126)
!128 = !DILocation(line: 74, column: 9, scope: !126)
!129 = !DILocation(line: 74, column: 20, scope: !126)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !15, line: 77, type: !46)
!131 = distinct !DILexicalBlock(scope: !110, file: !15, line: 76, column: 5)
!132 = !DILocation(line: 77, column: 17, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !131, file: !15, line: 78, type: !51)
!134 = !DILocation(line: 78, column: 16, scope: !131)
!135 = !DILocalVariable(name: "dataLen", scope: !131, file: !15, line: 78, type: !51)
!136 = !DILocation(line: 78, column: 19, scope: !131)
!137 = !DILocation(line: 79, column: 26, scope: !131)
!138 = !DILocation(line: 79, column: 19, scope: !131)
!139 = !DILocation(line: 79, column: 17, scope: !131)
!140 = !DILocation(line: 81, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !131, file: !15, line: 81, column: 9)
!142 = !DILocation(line: 81, column: 14, scope: !141)
!143 = !DILocation(line: 81, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !15, line: 81, column: 9)
!145 = !DILocation(line: 81, column: 25, scope: !144)
!146 = !DILocation(line: 81, column: 23, scope: !144)
!147 = !DILocation(line: 81, column: 9, scope: !141)
!148 = !DILocation(line: 83, column: 23, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !15, line: 82, column: 9)
!150 = !DILocation(line: 83, column: 28, scope: !149)
!151 = !DILocation(line: 83, column: 18, scope: !149)
!152 = !DILocation(line: 83, column: 13, scope: !149)
!153 = !DILocation(line: 83, column: 21, scope: !149)
!154 = !DILocation(line: 84, column: 9, scope: !149)
!155 = !DILocation(line: 81, column: 35, scope: !144)
!156 = !DILocation(line: 81, column: 9, scope: !144)
!157 = distinct !{!157, !147, !158, !80}
!158 = !DILocation(line: 84, column: 9, scope: !141)
!159 = !DILocation(line: 85, column: 9, scope: !131)
!160 = !DILocation(line: 85, column: 20, scope: !131)
!161 = !DILocation(line: 86, column: 20, scope: !131)
!162 = !DILocation(line: 86, column: 9, scope: !131)
!163 = !DILocation(line: 88, column: 1, scope: !110)
!164 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 91, type: !24, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!165 = !DILocalVariable(name: "data", scope: !164, file: !15, line: 93, type: !5)
!166 = !DILocation(line: 93, column: 15, scope: !164)
!167 = !DILocalVariable(name: "dataBuffer", scope: !164, file: !15, line: 94, type: !5)
!168 = !DILocation(line: 94, column: 15, scope: !164)
!169 = !DILocation(line: 94, column: 39, scope: !164)
!170 = !DILocation(line: 94, column: 28, scope: !164)
!171 = !DILocation(line: 95, column: 12, scope: !164)
!172 = !DILocation(line: 95, column: 10, scope: !164)
!173 = !DILocation(line: 96, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !164, file: !15, line: 96, column: 8)
!175 = !DILocation(line: 96, column: 8, scope: !164)
!176 = !DILocation(line: 99, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !15, line: 97, column: 5)
!178 = !DILocation(line: 99, column: 9, scope: !177)
!179 = !DILocation(line: 100, column: 9, scope: !177)
!180 = !DILocation(line: 100, column: 20, scope: !177)
!181 = !DILocation(line: 101, column: 5, scope: !177)
!182 = !DILocalVariable(name: "dest", scope: !183, file: !15, line: 103, type: !46)
!183 = distinct !DILexicalBlock(scope: !164, file: !15, line: 102, column: 5)
!184 = !DILocation(line: 103, column: 17, scope: !183)
!185 = !DILocalVariable(name: "i", scope: !183, file: !15, line: 104, type: !51)
!186 = !DILocation(line: 104, column: 16, scope: !183)
!187 = !DILocalVariable(name: "dataLen", scope: !183, file: !15, line: 104, type: !51)
!188 = !DILocation(line: 104, column: 19, scope: !183)
!189 = !DILocation(line: 105, column: 26, scope: !183)
!190 = !DILocation(line: 105, column: 19, scope: !183)
!191 = !DILocation(line: 105, column: 17, scope: !183)
!192 = !DILocation(line: 107, column: 16, scope: !193)
!193 = distinct !DILexicalBlock(scope: !183, file: !15, line: 107, column: 9)
!194 = !DILocation(line: 107, column: 14, scope: !193)
!195 = !DILocation(line: 107, column: 21, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !15, line: 107, column: 9)
!197 = !DILocation(line: 107, column: 25, scope: !196)
!198 = !DILocation(line: 107, column: 23, scope: !196)
!199 = !DILocation(line: 107, column: 9, scope: !193)
!200 = !DILocation(line: 109, column: 23, scope: !201)
!201 = distinct !DILexicalBlock(scope: !196, file: !15, line: 108, column: 9)
!202 = !DILocation(line: 109, column: 28, scope: !201)
!203 = !DILocation(line: 109, column: 18, scope: !201)
!204 = !DILocation(line: 109, column: 13, scope: !201)
!205 = !DILocation(line: 109, column: 21, scope: !201)
!206 = !DILocation(line: 110, column: 9, scope: !201)
!207 = !DILocation(line: 107, column: 35, scope: !196)
!208 = !DILocation(line: 107, column: 9, scope: !196)
!209 = distinct !{!209, !199, !210, !80}
!210 = !DILocation(line: 110, column: 9, scope: !193)
!211 = !DILocation(line: 111, column: 9, scope: !183)
!212 = !DILocation(line: 111, column: 20, scope: !183)
!213 = !DILocation(line: 112, column: 20, scope: !183)
!214 = !DILocation(line: 112, column: 9, scope: !183)
!215 = !DILocation(line: 114, column: 1, scope: !164)
