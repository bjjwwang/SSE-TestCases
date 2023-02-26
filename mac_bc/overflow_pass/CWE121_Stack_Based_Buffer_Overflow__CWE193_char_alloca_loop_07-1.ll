; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 11, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %2, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !34
  store i8* %3, i8** %data, align 8, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !55
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !56
  store i64 %call, i64* %sourceLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !61
  %7 = load i64, i64* %sourceLen, align 8, !dbg !63
  %add = add i64 %7, 1, !dbg !64
  %cmp1 = icmp ult i64 %6, %add, !dbg !65
  br i1 %cmp1, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !69
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !69
  %10 = load i8*, i8** %data, align 8, !dbg !70
  %11 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !70
  store i8 %9, i8* %arrayidx3, align 1, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %12, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !79
  call void @printLine(i8* noundef %13), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* noundef null), !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 noundef %conv), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_good(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_bad(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 10, align 16, !dbg !109
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %1 = alloca i8, i64 11, align 16, !dbg !112
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !111
  %2 = load i32, i32* @staticFive, align 4, !dbg !113
  %cmp = icmp ne i32 %2, 5, !dbg !115
  br i1 %cmp, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !120
  store i8* %3, i8** %data, align 8, !dbg !122
  %4 = load i8*, i8** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !132
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !133
  store i64 %call, i64* %sourceLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !138
  %7 = load i64, i64* %sourceLen, align 8, !dbg !140
  %add = add i64 %7, 1, !dbg !141
  %cmp1 = icmp ult i64 %6, %add, !dbg !142
  br i1 %cmp1, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !146
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !146
  %10 = load i8*, i8** %data, align 8, !dbg !147
  %11 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !147
  store i8 %9, i8* %arrayidx3, align 1, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %12, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !155
  call void @printLine(i8* noundef %13), !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !158 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %0 = alloca i8, i64 10, align 16, !dbg !163
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !162
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !164, metadata !DIExpression()), !dbg !165
  %1 = alloca i8, i64 11, align 16, !dbg !166
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !165
  %2 = load i32, i32* @staticFive, align 4, !dbg !167
  %cmp = icmp eq i32 %2, 5, !dbg !169
  br i1 %cmp, label %if.then, label %if.end, !dbg !170

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !171
  store i8* %3, i8** %data, align 8, !dbg !173
  %4 = load i8*, i8** %data, align 8, !dbg !174
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !174
  store i8 0, i8* %arrayidx, align 1, !dbg !175
  br label %if.end, !dbg !176

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !177, metadata !DIExpression()), !dbg !179
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !179
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %i, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !182, metadata !DIExpression()), !dbg !183
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !184
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !185
  store i64 %call, i64* %sourceLen, align 8, !dbg !186
  store i64 0, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !190
  %7 = load i64, i64* %sourceLen, align 8, !dbg !192
  %add = add i64 %7, 1, !dbg !193
  %cmp1 = icmp ult i64 %6, %add, !dbg !194
  br i1 %cmp1, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !198
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !198
  %10 = load i8*, i8** %data, align 8, !dbg !199
  %11 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !199
  store i8 %9, i8* %arrayidx3, align 1, !dbg !201
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !203
  %inc = add i64 %12, 1, !dbg !203
  store i64 %inc, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !207
  call void @printLine(i8* noundef %13), !dbg !208
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
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !9, line: 30, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0}
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_bad", scope: !9, file: !9, line: 34, type: !19, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 36, type: !5)
!23 = !DILocation(line: 36, column: 12, scope: !18)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 37, type: !5)
!25 = !DILocation(line: 37, column: 12, scope: !18)
!26 = !DILocation(line: 37, column: 36, scope: !18)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 38, type: !5)
!28 = !DILocation(line: 38, column: 12, scope: !18)
!29 = !DILocation(line: 38, column: 37, scope: !18)
!30 = !DILocation(line: 39, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !18, file: !9, line: 39, column: 8)
!32 = !DILocation(line: 39, column: 18, scope: !31)
!33 = !DILocation(line: 39, column: 8, scope: !18)
!34 = !DILocation(line: 43, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !9, line: 40, column: 5)
!36 = !DILocation(line: 43, column: 14, scope: !35)
!37 = !DILocation(line: 44, column: 9, scope: !35)
!38 = !DILocation(line: 44, column: 17, scope: !35)
!39 = !DILocation(line: 45, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !9, line: 47, type: !42)
!41 = distinct !DILexicalBlock(scope: !18, file: !9, line: 46, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 47, column: 14, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !9, line: 48, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 31, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !50, line: 94, baseType: !51)
!50 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!51 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 48, column: 16, scope: !41)
!53 = !DILocalVariable(name: "sourceLen", scope: !41, file: !9, line: 48, type: !47)
!54 = !DILocation(line: 48, column: 19, scope: !41)
!55 = !DILocation(line: 49, column: 28, scope: !41)
!56 = !DILocation(line: 49, column: 21, scope: !41)
!57 = !DILocation(line: 49, column: 19, scope: !41)
!58 = !DILocation(line: 52, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !41, file: !9, line: 52, column: 9)
!60 = !DILocation(line: 52, column: 14, scope: !59)
!61 = !DILocation(line: 52, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !9, line: 52, column: 9)
!63 = !DILocation(line: 52, column: 25, scope: !62)
!64 = !DILocation(line: 52, column: 35, scope: !62)
!65 = !DILocation(line: 52, column: 23, scope: !62)
!66 = !DILocation(line: 52, column: 9, scope: !59)
!67 = !DILocation(line: 54, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !9, line: 53, column: 9)
!69 = !DILocation(line: 54, column: 23, scope: !68)
!70 = !DILocation(line: 54, column: 13, scope: !68)
!71 = !DILocation(line: 54, column: 18, scope: !68)
!72 = !DILocation(line: 54, column: 21, scope: !68)
!73 = !DILocation(line: 55, column: 9, scope: !68)
!74 = !DILocation(line: 52, column: 41, scope: !62)
!75 = !DILocation(line: 52, column: 9, scope: !62)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 55, column: 9, scope: !59)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 56, column: 19, scope: !41)
!80 = !DILocation(line: 56, column: 9, scope: !41)
!81 = !DILocation(line: 58, column: 1, scope: !18)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_good", scope: !9, file: !9, line: 123, type: !19, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!83 = !DILocation(line: 125, column: 5, scope: !82)
!84 = !DILocation(line: 126, column: 5, scope: !82)
!85 = !DILocation(line: 127, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 139, type: !87, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!87 = !DISubroutineType(types: !88)
!88 = !{!10, !10, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !9, line: 139, type: !10)
!91 = !DILocation(line: 139, column: 14, scope: !86)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !9, line: 139, type: !89)
!93 = !DILocation(line: 139, column: 27, scope: !86)
!94 = !DILocation(line: 142, column: 22, scope: !86)
!95 = !DILocation(line: 142, column: 12, scope: !86)
!96 = !DILocation(line: 142, column: 5, scope: !86)
!97 = !DILocation(line: 144, column: 5, scope: !86)
!98 = !DILocation(line: 145, column: 5, scope: !86)
!99 = !DILocation(line: 146, column: 5, scope: !86)
!100 = !DILocation(line: 149, column: 5, scope: !86)
!101 = !DILocation(line: 150, column: 5, scope: !86)
!102 = !DILocation(line: 151, column: 5, scope: !86)
!103 = !DILocation(line: 153, column: 5, scope: !86)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 65, type: !19, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!105 = !DILocalVariable(name: "data", scope: !104, file: !9, line: 67, type: !5)
!106 = !DILocation(line: 67, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !9, line: 68, type: !5)
!108 = !DILocation(line: 68, column: 12, scope: !104)
!109 = !DILocation(line: 68, column: 36, scope: !104)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !9, line: 69, type: !5)
!111 = !DILocation(line: 69, column: 12, scope: !104)
!112 = !DILocation(line: 69, column: 37, scope: !104)
!113 = !DILocation(line: 70, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !9, line: 70, column: 8)
!115 = !DILocation(line: 70, column: 18, scope: !114)
!116 = !DILocation(line: 70, column: 8, scope: !104)
!117 = !DILocation(line: 73, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !9, line: 71, column: 5)
!119 = !DILocation(line: 74, column: 5, scope: !118)
!120 = !DILocation(line: 79, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !114, file: !9, line: 76, column: 5)
!122 = !DILocation(line: 79, column: 14, scope: !121)
!123 = !DILocation(line: 80, column: 9, scope: !121)
!124 = !DILocation(line: 80, column: 17, scope: !121)
!125 = !DILocalVariable(name: "source", scope: !126, file: !9, line: 83, type: !42)
!126 = distinct !DILexicalBlock(scope: !104, file: !9, line: 82, column: 5)
!127 = !DILocation(line: 83, column: 14, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !9, line: 84, type: !47)
!129 = !DILocation(line: 84, column: 16, scope: !126)
!130 = !DILocalVariable(name: "sourceLen", scope: !126, file: !9, line: 84, type: !47)
!131 = !DILocation(line: 84, column: 19, scope: !126)
!132 = !DILocation(line: 85, column: 28, scope: !126)
!133 = !DILocation(line: 85, column: 21, scope: !126)
!134 = !DILocation(line: 85, column: 19, scope: !126)
!135 = !DILocation(line: 88, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !9, line: 88, column: 9)
!137 = !DILocation(line: 88, column: 14, scope: !136)
!138 = !DILocation(line: 88, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !9, line: 88, column: 9)
!140 = !DILocation(line: 88, column: 25, scope: !139)
!141 = !DILocation(line: 88, column: 35, scope: !139)
!142 = !DILocation(line: 88, column: 23, scope: !139)
!143 = !DILocation(line: 88, column: 9, scope: !136)
!144 = !DILocation(line: 90, column: 30, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !9, line: 89, column: 9)
!146 = !DILocation(line: 90, column: 23, scope: !145)
!147 = !DILocation(line: 90, column: 13, scope: !145)
!148 = !DILocation(line: 90, column: 18, scope: !145)
!149 = !DILocation(line: 90, column: 21, scope: !145)
!150 = !DILocation(line: 91, column: 9, scope: !145)
!151 = !DILocation(line: 88, column: 41, scope: !139)
!152 = !DILocation(line: 88, column: 9, scope: !139)
!153 = distinct !{!153, !143, !154, !78}
!154 = !DILocation(line: 91, column: 9, scope: !136)
!155 = !DILocation(line: 92, column: 19, scope: !126)
!156 = !DILocation(line: 92, column: 9, scope: !126)
!157 = !DILocation(line: 94, column: 1, scope: !104)
!158 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 97, type: !19, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!159 = !DILocalVariable(name: "data", scope: !158, file: !9, line: 99, type: !5)
!160 = !DILocation(line: 99, column: 12, scope: !158)
!161 = !DILocalVariable(name: "dataBadBuffer", scope: !158, file: !9, line: 100, type: !5)
!162 = !DILocation(line: 100, column: 12, scope: !158)
!163 = !DILocation(line: 100, column: 36, scope: !158)
!164 = !DILocalVariable(name: "dataGoodBuffer", scope: !158, file: !9, line: 101, type: !5)
!165 = !DILocation(line: 101, column: 12, scope: !158)
!166 = !DILocation(line: 101, column: 37, scope: !158)
!167 = !DILocation(line: 102, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !158, file: !9, line: 102, column: 8)
!169 = !DILocation(line: 102, column: 18, scope: !168)
!170 = !DILocation(line: 102, column: 8, scope: !158)
!171 = !DILocation(line: 106, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !9, line: 103, column: 5)
!173 = !DILocation(line: 106, column: 14, scope: !172)
!174 = !DILocation(line: 107, column: 9, scope: !172)
!175 = !DILocation(line: 107, column: 17, scope: !172)
!176 = !DILocation(line: 108, column: 5, scope: !172)
!177 = !DILocalVariable(name: "source", scope: !178, file: !9, line: 110, type: !42)
!178 = distinct !DILexicalBlock(scope: !158, file: !9, line: 109, column: 5)
!179 = !DILocation(line: 110, column: 14, scope: !178)
!180 = !DILocalVariable(name: "i", scope: !178, file: !9, line: 111, type: !47)
!181 = !DILocation(line: 111, column: 16, scope: !178)
!182 = !DILocalVariable(name: "sourceLen", scope: !178, file: !9, line: 111, type: !47)
!183 = !DILocation(line: 111, column: 19, scope: !178)
!184 = !DILocation(line: 112, column: 28, scope: !178)
!185 = !DILocation(line: 112, column: 21, scope: !178)
!186 = !DILocation(line: 112, column: 19, scope: !178)
!187 = !DILocation(line: 115, column: 16, scope: !188)
!188 = distinct !DILexicalBlock(scope: !178, file: !9, line: 115, column: 9)
!189 = !DILocation(line: 115, column: 14, scope: !188)
!190 = !DILocation(line: 115, column: 21, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !9, line: 115, column: 9)
!192 = !DILocation(line: 115, column: 25, scope: !191)
!193 = !DILocation(line: 115, column: 35, scope: !191)
!194 = !DILocation(line: 115, column: 23, scope: !191)
!195 = !DILocation(line: 115, column: 9, scope: !188)
!196 = !DILocation(line: 117, column: 30, scope: !197)
!197 = distinct !DILexicalBlock(scope: !191, file: !9, line: 116, column: 9)
!198 = !DILocation(line: 117, column: 23, scope: !197)
!199 = !DILocation(line: 117, column: 13, scope: !197)
!200 = !DILocation(line: 117, column: 18, scope: !197)
!201 = !DILocation(line: 117, column: 21, scope: !197)
!202 = !DILocation(line: 118, column: 9, scope: !197)
!203 = !DILocation(line: 115, column: 41, scope: !191)
!204 = !DILocation(line: 115, column: 9, scope: !191)
!205 = distinct !{!205, !195, !206, !78}
!206 = !DILocation(line: 118, column: 9, scope: !188)
!207 = !DILocation(line: 119, column: 19, scope: !178)
!208 = !DILocation(line: 119, column: 9, scope: !178)
!209 = !DILocation(line: 121, column: 1, scope: !158)
