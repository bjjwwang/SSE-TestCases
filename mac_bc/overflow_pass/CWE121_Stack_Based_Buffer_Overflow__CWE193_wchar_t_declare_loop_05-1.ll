; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !7
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* @staticTrue, align 4, !dbg !39
  %tobool = icmp ne i32 %0, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay, i32** %data, align 8, !dbg !44
  %1 = load i32*, i32** %data, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !50
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_bad.source to i8*), i64 44, i1 false), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !57, metadata !DIExpression()), !dbg !58
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !59
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !60
  store i64 %call, i64* %sourceLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !65
  %4 = load i64, i64* %sourceLen, align 8, !dbg !67
  %add = add i64 %4, 1, !dbg !68
  %cmp = icmp ult i64 %3, %add, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !73
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !73
  %7 = load i32*, i32** %data, align 8, !dbg !74
  %8 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !74
  store i32 %6, i32* %arrayidx3, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %9, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* noundef %10), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @wcslen(i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_good() #0 !dbg !86 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i32, i32* @staticFalse, align 4, !dbg !117
  %tobool = icmp ne i32 %0, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  br label %if.end, !dbg !122

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  store i32* %arraydecay, i32** %data, align 8, !dbg !125
  %1 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !135
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !136
  store i64 %call, i64* %sourceLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !141
  %4 = load i64, i64* %sourceLen, align 8, !dbg !143
  %add = add i64 %4, 1, !dbg !144
  %cmp = icmp ult i64 %3, %add, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !149
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !149
  %7 = load i32*, i32** %data, align 8, !dbg !150
  %8 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !150
  store i32 %6, i32* %arrayidx3, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %9, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !158
  call void @printWLine(i32* noundef %10), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !161 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !164, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !166, metadata !DIExpression()), !dbg !167
  %0 = load i32, i32* @staticTrue, align 4, !dbg !168
  %tobool = icmp ne i32 %0, 0, !dbg !168
  br i1 %tobool, label %if.then, label %if.end, !dbg !170

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !171
  store i32* %arraydecay, i32** %data, align 8, !dbg !173
  %1 = load i32*, i32** %data, align 8, !dbg !174
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !174
  store i32 0, i32* %arrayidx, align 4, !dbg !175
  br label %if.end, !dbg !176

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !177, metadata !DIExpression()), !dbg !179
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !179
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %i, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !182, metadata !DIExpression()), !dbg !183
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !184
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !185
  store i64 %call, i64* %sourceLen, align 8, !dbg !186
  store i64 0, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !190
  %4 = load i64, i64* %sourceLen, align 8, !dbg !192
  %add = add i64 %4, 1, !dbg !193
  %cmp = icmp ult i64 %3, %add, !dbg !194
  br i1 %cmp, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !198
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !198
  %7 = load i32*, i32** %data, align 8, !dbg !199
  %8 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !199
  store i32 %6, i32* %arrayidx3, align 4, !dbg !201
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !203
  %inc = add i64 %9, 1, !dbg !203
  store i64 %inc, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !207
  call void @printWLine(i32* noundef %10), !dbg !208
  ret void, !dbg !209
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !9, line: 30, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 31, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_bad", scope: !9, file: !9, line: 35, type: !19, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 37, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !25, line: 34, baseType: !26)
!25 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !27, line: 106, baseType: !10)
!27 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!28 = !DILocation(line: 37, column: 15, scope: !18)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 38, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 38, column: 13, scope: !18)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 39, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 352, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 39, column: 13, scope: !18)
!39 = !DILocation(line: 40, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !18, file: !9, line: 40, column: 8)
!41 = !DILocation(line: 40, column: 8, scope: !18)
!42 = !DILocation(line: 44, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !9, line: 41, column: 5)
!44 = !DILocation(line: 44, column: 14, scope: !43)
!45 = !DILocation(line: 45, column: 9, scope: !43)
!46 = !DILocation(line: 45, column: 17, scope: !43)
!47 = !DILocation(line: 46, column: 5, scope: !43)
!48 = !DILocalVariable(name: "source", scope: !49, file: !9, line: 48, type: !35)
!49 = distinct !DILexicalBlock(scope: !18, file: !9, line: 47, column: 5)
!50 = !DILocation(line: 48, column: 17, scope: !49)
!51 = !DILocalVariable(name: "i", scope: !49, file: !9, line: 49, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 31, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !27, line: 94, baseType: !55)
!55 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 49, column: 16, scope: !49)
!57 = !DILocalVariable(name: "sourceLen", scope: !49, file: !9, line: 49, type: !52)
!58 = !DILocation(line: 49, column: 19, scope: !49)
!59 = !DILocation(line: 50, column: 28, scope: !49)
!60 = !DILocation(line: 50, column: 21, scope: !49)
!61 = !DILocation(line: 50, column: 19, scope: !49)
!62 = !DILocation(line: 53, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !49, file: !9, line: 53, column: 9)
!64 = !DILocation(line: 53, column: 14, scope: !63)
!65 = !DILocation(line: 53, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !9, line: 53, column: 9)
!67 = !DILocation(line: 53, column: 25, scope: !66)
!68 = !DILocation(line: 53, column: 35, scope: !66)
!69 = !DILocation(line: 53, column: 23, scope: !66)
!70 = !DILocation(line: 53, column: 9, scope: !63)
!71 = !DILocation(line: 55, column: 30, scope: !72)
!72 = distinct !DILexicalBlock(scope: !66, file: !9, line: 54, column: 9)
!73 = !DILocation(line: 55, column: 23, scope: !72)
!74 = !DILocation(line: 55, column: 13, scope: !72)
!75 = !DILocation(line: 55, column: 18, scope: !72)
!76 = !DILocation(line: 55, column: 21, scope: !72)
!77 = !DILocation(line: 56, column: 9, scope: !72)
!78 = !DILocation(line: 53, column: 41, scope: !66)
!79 = !DILocation(line: 53, column: 9, scope: !66)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 56, column: 9, scope: !63)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 57, column: 20, scope: !49)
!84 = !DILocation(line: 57, column: 9, scope: !49)
!85 = !DILocation(line: 59, column: 1, scope: !18)
!86 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_05_good", scope: !9, file: !9, line: 124, type: !19, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!87 = !DILocation(line: 126, column: 5, scope: !86)
!88 = !DILocation(line: 127, column: 5, scope: !86)
!89 = !DILocation(line: 128, column: 1, scope: !86)
!90 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 140, type: !91, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!91 = !DISubroutineType(types: !92)
!92 = !{!10, !10, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !9, line: 140, type: !10)
!97 = !DILocation(line: 140, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !9, line: 140, type: !93)
!99 = !DILocation(line: 140, column: 27, scope: !90)
!100 = !DILocation(line: 143, column: 22, scope: !90)
!101 = !DILocation(line: 143, column: 12, scope: !90)
!102 = !DILocation(line: 143, column: 5, scope: !90)
!103 = !DILocation(line: 145, column: 5, scope: !90)
!104 = !DILocation(line: 146, column: 5, scope: !90)
!105 = !DILocation(line: 147, column: 5, scope: !90)
!106 = !DILocation(line: 150, column: 5, scope: !90)
!107 = !DILocation(line: 151, column: 5, scope: !90)
!108 = !DILocation(line: 152, column: 5, scope: !90)
!109 = !DILocation(line: 154, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 66, type: !19, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!111 = !DILocalVariable(name: "data", scope: !110, file: !9, line: 68, type: !23)
!112 = !DILocation(line: 68, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !9, line: 69, type: !30)
!114 = !DILocation(line: 69, column: 13, scope: !110)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !9, line: 70, type: !35)
!116 = !DILocation(line: 70, column: 13, scope: !110)
!117 = !DILocation(line: 71, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !110, file: !9, line: 71, column: 8)
!119 = !DILocation(line: 71, column: 8, scope: !110)
!120 = !DILocation(line: 74, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !9, line: 72, column: 5)
!122 = !DILocation(line: 75, column: 5, scope: !121)
!123 = !DILocation(line: 80, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !9, line: 77, column: 5)
!125 = !DILocation(line: 80, column: 14, scope: !124)
!126 = !DILocation(line: 81, column: 9, scope: !124)
!127 = !DILocation(line: 81, column: 17, scope: !124)
!128 = !DILocalVariable(name: "source", scope: !129, file: !9, line: 84, type: !35)
!129 = distinct !DILexicalBlock(scope: !110, file: !9, line: 83, column: 5)
!130 = !DILocation(line: 84, column: 17, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !9, line: 85, type: !52)
!132 = !DILocation(line: 85, column: 16, scope: !129)
!133 = !DILocalVariable(name: "sourceLen", scope: !129, file: !9, line: 85, type: !52)
!134 = !DILocation(line: 85, column: 19, scope: !129)
!135 = !DILocation(line: 86, column: 28, scope: !129)
!136 = !DILocation(line: 86, column: 21, scope: !129)
!137 = !DILocation(line: 86, column: 19, scope: !129)
!138 = !DILocation(line: 89, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !9, line: 89, column: 9)
!140 = !DILocation(line: 89, column: 14, scope: !139)
!141 = !DILocation(line: 89, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !9, line: 89, column: 9)
!143 = !DILocation(line: 89, column: 25, scope: !142)
!144 = !DILocation(line: 89, column: 35, scope: !142)
!145 = !DILocation(line: 89, column: 23, scope: !142)
!146 = !DILocation(line: 89, column: 9, scope: !139)
!147 = !DILocation(line: 91, column: 30, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !9, line: 90, column: 9)
!149 = !DILocation(line: 91, column: 23, scope: !148)
!150 = !DILocation(line: 91, column: 13, scope: !148)
!151 = !DILocation(line: 91, column: 18, scope: !148)
!152 = !DILocation(line: 91, column: 21, scope: !148)
!153 = !DILocation(line: 92, column: 9, scope: !148)
!154 = !DILocation(line: 89, column: 41, scope: !142)
!155 = !DILocation(line: 89, column: 9, scope: !142)
!156 = distinct !{!156, !146, !157, !82}
!157 = !DILocation(line: 92, column: 9, scope: !139)
!158 = !DILocation(line: 93, column: 20, scope: !129)
!159 = !DILocation(line: 93, column: 9, scope: !129)
!160 = !DILocation(line: 95, column: 1, scope: !110)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 98, type: !19, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!162 = !DILocalVariable(name: "data", scope: !161, file: !9, line: 100, type: !23)
!163 = !DILocation(line: 100, column: 15, scope: !161)
!164 = !DILocalVariable(name: "dataBadBuffer", scope: !161, file: !9, line: 101, type: !30)
!165 = !DILocation(line: 101, column: 13, scope: !161)
!166 = !DILocalVariable(name: "dataGoodBuffer", scope: !161, file: !9, line: 102, type: !35)
!167 = !DILocation(line: 102, column: 13, scope: !161)
!168 = !DILocation(line: 103, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !161, file: !9, line: 103, column: 8)
!170 = !DILocation(line: 103, column: 8, scope: !161)
!171 = !DILocation(line: 107, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !9, line: 104, column: 5)
!173 = !DILocation(line: 107, column: 14, scope: !172)
!174 = !DILocation(line: 108, column: 9, scope: !172)
!175 = !DILocation(line: 108, column: 17, scope: !172)
!176 = !DILocation(line: 109, column: 5, scope: !172)
!177 = !DILocalVariable(name: "source", scope: !178, file: !9, line: 111, type: !35)
!178 = distinct !DILexicalBlock(scope: !161, file: !9, line: 110, column: 5)
!179 = !DILocation(line: 111, column: 17, scope: !178)
!180 = !DILocalVariable(name: "i", scope: !178, file: !9, line: 112, type: !52)
!181 = !DILocation(line: 112, column: 16, scope: !178)
!182 = !DILocalVariable(name: "sourceLen", scope: !178, file: !9, line: 112, type: !52)
!183 = !DILocation(line: 112, column: 19, scope: !178)
!184 = !DILocation(line: 113, column: 28, scope: !178)
!185 = !DILocation(line: 113, column: 21, scope: !178)
!186 = !DILocation(line: 113, column: 19, scope: !178)
!187 = !DILocation(line: 116, column: 16, scope: !188)
!188 = distinct !DILexicalBlock(scope: !178, file: !9, line: 116, column: 9)
!189 = !DILocation(line: 116, column: 14, scope: !188)
!190 = !DILocation(line: 116, column: 21, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !9, line: 116, column: 9)
!192 = !DILocation(line: 116, column: 25, scope: !191)
!193 = !DILocation(line: 116, column: 35, scope: !191)
!194 = !DILocation(line: 116, column: 23, scope: !191)
!195 = !DILocation(line: 116, column: 9, scope: !188)
!196 = !DILocation(line: 118, column: 30, scope: !197)
!197 = distinct !DILexicalBlock(scope: !191, file: !9, line: 117, column: 9)
!198 = !DILocation(line: 118, column: 23, scope: !197)
!199 = !DILocation(line: 118, column: 13, scope: !197)
!200 = !DILocation(line: 118, column: 18, scope: !197)
!201 = !DILocation(line: 118, column: 21, scope: !197)
!202 = !DILocation(line: 119, column: 9, scope: !197)
!203 = !DILocation(line: 116, column: 41, scope: !191)
!204 = !DILocation(line: 116, column: 9, scope: !191)
!205 = distinct !{!205, !195, !206, !82}
!206 = !DILocation(line: 119, column: 9, scope: !188)
!207 = !DILocation(line: 120, column: 20, scope: !178)
!208 = !DILocation(line: 120, column: 9, scope: !178)
!209 = !DILocation(line: 122, column: 1, scope: !161)
