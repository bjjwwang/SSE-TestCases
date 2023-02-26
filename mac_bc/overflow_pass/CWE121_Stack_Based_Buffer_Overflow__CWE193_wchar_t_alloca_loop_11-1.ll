; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 40, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 44, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %call = call i32 (...) @globalReturnsTrue(), !dbg !32
  %tobool = icmp ne i32 %call, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  store i32* %4, i32** %data, align 8, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11_bad.source to i8*), i64 44, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !55
  %call1 = call i64 @wcslen(i32* noundef %arraydecay), !dbg !56
  store i64 %call1, i64* %sourceLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !61
  %8 = load i64, i64* %sourceLen, align 8, !dbg !63
  %add = add i64 %8, 1, !dbg !64
  %cmp = icmp ult i64 %7, %add, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !69
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !69
  %11 = load i32*, i32** %data, align 8, !dbg !70
  %12 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !70
  store i32 %10, i32* %arrayidx3, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %13, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* noundef %14), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11_good() #0 !dbg !82 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* noundef null), !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 noundef %conv), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11_good(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11_bad(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 40, align 16, !dbg !111
  %1 = bitcast i8* %0 to i32*, !dbg !112
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %2 = alloca i8, i64 44, align 16, !dbg !115
  %3 = bitcast i8* %2 to i32*, !dbg !116
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !114
  %call = call i32 (...) @globalReturnsFalse(), !dbg !117
  %tobool = icmp ne i32 %call, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  br label %if.end, !dbg !122

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !123
  store i32* %4, i32** %data, align 8, !dbg !125
  %5 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !135
  %call1 = call i64 @wcslen(i32* noundef %arraydecay), !dbg !136
  store i64 %call1, i64* %sourceLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !141
  %8 = load i64, i64* %sourceLen, align 8, !dbg !143
  %add = add i64 %8, 1, !dbg !144
  %cmp = icmp ult i64 %7, %add, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !149
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !149
  %11 = load i32*, i32** %data, align 8, !dbg !150
  %12 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !150
  store i32 %10, i32* %arrayidx3, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %13, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !158
  call void @printWLine(i32* noundef %14), !dbg !159
  ret void, !dbg !160
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !161 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !164, metadata !DIExpression()), !dbg !165
  %0 = alloca i8, i64 40, align 16, !dbg !166
  %1 = bitcast i8* %0 to i32*, !dbg !167
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !168, metadata !DIExpression()), !dbg !169
  %2 = alloca i8, i64 44, align 16, !dbg !170
  %3 = bitcast i8* %2 to i32*, !dbg !171
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !169
  %call = call i32 (...) @globalReturnsTrue(), !dbg !172
  %tobool = icmp ne i32 %call, 0, !dbg !172
  br i1 %tobool, label %if.then, label %if.end, !dbg !174

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !175
  store i32* %4, i32** %data, align 8, !dbg !177
  %5 = load i32*, i32** %data, align 8, !dbg !178
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !178
  store i32 0, i32* %arrayidx, align 4, !dbg !179
  br label %if.end, !dbg !180

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !181, metadata !DIExpression()), !dbg !183
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !183
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !183
  call void @llvm.dbg.declare(metadata i64* %i, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !186, metadata !DIExpression()), !dbg !187
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !188
  %call1 = call i64 @wcslen(i32* noundef %arraydecay), !dbg !189
  store i64 %call1, i64* %sourceLen, align 8, !dbg !190
  store i64 0, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !194
  %8 = load i64, i64* %sourceLen, align 8, !dbg !196
  %add = add i64 %8, 1, !dbg !197
  %cmp = icmp ult i64 %7, %add, !dbg !198
  br i1 %cmp, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !202
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !202
  %11 = load i32*, i32** %data, align 8, !dbg !203
  %12 = load i64, i64* %i, align 8, !dbg !204
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !203
  store i32 %10, i32* %arrayidx3, align 4, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !207
  %inc = add i64 %13, 1, !dbg !207
  store i64 %inc, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !211
  call void @printWLine(i32* noundef %14), !dbg !212
  ret void, !dbg !213
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11_bad", scope: !18, file: !18, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 30, type: !3)
!23 = !DILocation(line: 30, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 31, type: !3)
!25 = !DILocation(line: 31, column: 15, scope: !17)
!26 = !DILocation(line: 31, column: 42, scope: !17)
!27 = !DILocation(line: 31, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 32, type: !3)
!29 = !DILocation(line: 32, column: 15, scope: !17)
!30 = !DILocation(line: 32, column: 43, scope: !17)
!31 = !DILocation(line: 32, column: 32, scope: !17)
!32 = !DILocation(line: 33, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 33, column: 8)
!34 = !DILocation(line: 33, column: 8, scope: !17)
!35 = !DILocation(line: 37, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !18, line: 34, column: 5)
!37 = !DILocation(line: 37, column: 14, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 17, scope: !36)
!40 = !DILocation(line: 39, column: 5, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !42, file: !18, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !17, file: !18, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 11)
!46 = !DILocation(line: 41, column: 17, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !18, line: 42, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 31, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !51)
!51 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 42, column: 16, scope: !42)
!53 = !DILocalVariable(name: "sourceLen", scope: !42, file: !18, line: 42, type: !48)
!54 = !DILocation(line: 42, column: 19, scope: !42)
!55 = !DILocation(line: 43, column: 28, scope: !42)
!56 = !DILocation(line: 43, column: 21, scope: !42)
!57 = !DILocation(line: 43, column: 19, scope: !42)
!58 = !DILocation(line: 46, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !42, file: !18, line: 46, column: 9)
!60 = !DILocation(line: 46, column: 14, scope: !59)
!61 = !DILocation(line: 46, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !18, line: 46, column: 9)
!63 = !DILocation(line: 46, column: 25, scope: !62)
!64 = !DILocation(line: 46, column: 35, scope: !62)
!65 = !DILocation(line: 46, column: 23, scope: !62)
!66 = !DILocation(line: 46, column: 9, scope: !59)
!67 = !DILocation(line: 48, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !18, line: 47, column: 9)
!69 = !DILocation(line: 48, column: 23, scope: !68)
!70 = !DILocation(line: 48, column: 13, scope: !68)
!71 = !DILocation(line: 48, column: 18, scope: !68)
!72 = !DILocation(line: 48, column: 21, scope: !68)
!73 = !DILocation(line: 49, column: 9, scope: !68)
!74 = !DILocation(line: 46, column: 41, scope: !62)
!75 = !DILocation(line: 46, column: 9, scope: !62)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 49, column: 9, scope: !59)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 50, column: 20, scope: !42)
!80 = !DILocation(line: 50, column: 9, scope: !42)
!81 = !DILocation(line: 52, column: 1, scope: !17)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_11_good", scope: !18, file: !18, line: 117, type: !19, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!83 = !DILocation(line: 119, column: 5, scope: !82)
!84 = !DILocation(line: 120, column: 5, scope: !82)
!85 = !DILocation(line: 121, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 133, type: !87, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!87 = !DISubroutineType(types: !88)
!88 = !{!8, !8, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !18, line: 133, type: !8)
!93 = !DILocation(line: 133, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !18, line: 133, type: !89)
!95 = !DILocation(line: 133, column: 27, scope: !86)
!96 = !DILocation(line: 136, column: 22, scope: !86)
!97 = !DILocation(line: 136, column: 12, scope: !86)
!98 = !DILocation(line: 136, column: 5, scope: !86)
!99 = !DILocation(line: 138, column: 5, scope: !86)
!100 = !DILocation(line: 139, column: 5, scope: !86)
!101 = !DILocation(line: 140, column: 5, scope: !86)
!102 = !DILocation(line: 143, column: 5, scope: !86)
!103 = !DILocation(line: 144, column: 5, scope: !86)
!104 = !DILocation(line: 145, column: 5, scope: !86)
!105 = !DILocation(line: 147, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 59, type: !19, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!107 = !DILocalVariable(name: "data", scope: !106, file: !18, line: 61, type: !3)
!108 = !DILocation(line: 61, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !18, line: 62, type: !3)
!110 = !DILocation(line: 62, column: 15, scope: !106)
!111 = !DILocation(line: 62, column: 42, scope: !106)
!112 = !DILocation(line: 62, column: 31, scope: !106)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !18, line: 63, type: !3)
!114 = !DILocation(line: 63, column: 15, scope: !106)
!115 = !DILocation(line: 63, column: 43, scope: !106)
!116 = !DILocation(line: 63, column: 32, scope: !106)
!117 = !DILocation(line: 64, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !106, file: !18, line: 64, column: 8)
!119 = !DILocation(line: 64, column: 8, scope: !106)
!120 = !DILocation(line: 67, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !18, line: 65, column: 5)
!122 = !DILocation(line: 68, column: 5, scope: !121)
!123 = !DILocation(line: 73, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !18, line: 70, column: 5)
!125 = !DILocation(line: 73, column: 14, scope: !124)
!126 = !DILocation(line: 74, column: 9, scope: !124)
!127 = !DILocation(line: 74, column: 17, scope: !124)
!128 = !DILocalVariable(name: "source", scope: !129, file: !18, line: 77, type: !43)
!129 = distinct !DILexicalBlock(scope: !106, file: !18, line: 76, column: 5)
!130 = !DILocation(line: 77, column: 17, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !18, line: 78, type: !48)
!132 = !DILocation(line: 78, column: 16, scope: !129)
!133 = !DILocalVariable(name: "sourceLen", scope: !129, file: !18, line: 78, type: !48)
!134 = !DILocation(line: 78, column: 19, scope: !129)
!135 = !DILocation(line: 79, column: 28, scope: !129)
!136 = !DILocation(line: 79, column: 21, scope: !129)
!137 = !DILocation(line: 79, column: 19, scope: !129)
!138 = !DILocation(line: 82, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !18, line: 82, column: 9)
!140 = !DILocation(line: 82, column: 14, scope: !139)
!141 = !DILocation(line: 82, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !18, line: 82, column: 9)
!143 = !DILocation(line: 82, column: 25, scope: !142)
!144 = !DILocation(line: 82, column: 35, scope: !142)
!145 = !DILocation(line: 82, column: 23, scope: !142)
!146 = !DILocation(line: 82, column: 9, scope: !139)
!147 = !DILocation(line: 84, column: 30, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !18, line: 83, column: 9)
!149 = !DILocation(line: 84, column: 23, scope: !148)
!150 = !DILocation(line: 84, column: 13, scope: !148)
!151 = !DILocation(line: 84, column: 18, scope: !148)
!152 = !DILocation(line: 84, column: 21, scope: !148)
!153 = !DILocation(line: 85, column: 9, scope: !148)
!154 = !DILocation(line: 82, column: 41, scope: !142)
!155 = !DILocation(line: 82, column: 9, scope: !142)
!156 = distinct !{!156, !146, !157, !78}
!157 = !DILocation(line: 85, column: 9, scope: !139)
!158 = !DILocation(line: 86, column: 20, scope: !129)
!159 = !DILocation(line: 86, column: 9, scope: !129)
!160 = !DILocation(line: 88, column: 1, scope: !106)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 91, type: !19, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!162 = !DILocalVariable(name: "data", scope: !161, file: !18, line: 93, type: !3)
!163 = !DILocation(line: 93, column: 15, scope: !161)
!164 = !DILocalVariable(name: "dataBadBuffer", scope: !161, file: !18, line: 94, type: !3)
!165 = !DILocation(line: 94, column: 15, scope: !161)
!166 = !DILocation(line: 94, column: 42, scope: !161)
!167 = !DILocation(line: 94, column: 31, scope: !161)
!168 = !DILocalVariable(name: "dataGoodBuffer", scope: !161, file: !18, line: 95, type: !3)
!169 = !DILocation(line: 95, column: 15, scope: !161)
!170 = !DILocation(line: 95, column: 43, scope: !161)
!171 = !DILocation(line: 95, column: 32, scope: !161)
!172 = !DILocation(line: 96, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !161, file: !18, line: 96, column: 8)
!174 = !DILocation(line: 96, column: 8, scope: !161)
!175 = !DILocation(line: 100, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !18, line: 97, column: 5)
!177 = !DILocation(line: 100, column: 14, scope: !176)
!178 = !DILocation(line: 101, column: 9, scope: !176)
!179 = !DILocation(line: 101, column: 17, scope: !176)
!180 = !DILocation(line: 102, column: 5, scope: !176)
!181 = !DILocalVariable(name: "source", scope: !182, file: !18, line: 104, type: !43)
!182 = distinct !DILexicalBlock(scope: !161, file: !18, line: 103, column: 5)
!183 = !DILocation(line: 104, column: 17, scope: !182)
!184 = !DILocalVariable(name: "i", scope: !182, file: !18, line: 105, type: !48)
!185 = !DILocation(line: 105, column: 16, scope: !182)
!186 = !DILocalVariable(name: "sourceLen", scope: !182, file: !18, line: 105, type: !48)
!187 = !DILocation(line: 105, column: 19, scope: !182)
!188 = !DILocation(line: 106, column: 28, scope: !182)
!189 = !DILocation(line: 106, column: 21, scope: !182)
!190 = !DILocation(line: 106, column: 19, scope: !182)
!191 = !DILocation(line: 109, column: 16, scope: !192)
!192 = distinct !DILexicalBlock(scope: !182, file: !18, line: 109, column: 9)
!193 = !DILocation(line: 109, column: 14, scope: !192)
!194 = !DILocation(line: 109, column: 21, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !18, line: 109, column: 9)
!196 = !DILocation(line: 109, column: 25, scope: !195)
!197 = !DILocation(line: 109, column: 35, scope: !195)
!198 = !DILocation(line: 109, column: 23, scope: !195)
!199 = !DILocation(line: 109, column: 9, scope: !192)
!200 = !DILocation(line: 111, column: 30, scope: !201)
!201 = distinct !DILexicalBlock(scope: !195, file: !18, line: 110, column: 9)
!202 = !DILocation(line: 111, column: 23, scope: !201)
!203 = !DILocation(line: 111, column: 13, scope: !201)
!204 = !DILocation(line: 111, column: 18, scope: !201)
!205 = !DILocation(line: 111, column: 21, scope: !201)
!206 = !DILocation(line: 112, column: 9, scope: !201)
!207 = !DILocation(line: 109, column: 41, scope: !195)
!208 = !DILocation(line: 109, column: 9, scope: !195)
!209 = distinct !{!209, !199, !210, !78}
!210 = !DILocation(line: 112, column: 9, scope: !192)
!211 = !DILocation(line: 113, column: 20, scope: !182)
!212 = !DILocation(line: 113, column: 9, scope: !182)
!213 = !DILocation(line: 115, column: 1, scope: !161)
