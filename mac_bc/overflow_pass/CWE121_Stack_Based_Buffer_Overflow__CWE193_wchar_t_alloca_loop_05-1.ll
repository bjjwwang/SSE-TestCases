; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 40, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = alloca i8, i64 44, align 16, !dbg !35
  %3 = bitcast i8* %2 to i32*, !dbg !36
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !34
  %4 = load i32, i32* @staticTrue, align 4, !dbg !37
  %tobool = icmp ne i32 %4, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %5, i32** %data, align 8, !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_bad.source to i8*), i64 44, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !58, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !60
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !61
  store i64 %call, i64* %sourceLen, align 8, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !66
  %9 = load i64, i64* %sourceLen, align 8, !dbg !68
  %add = add i64 %9, 1, !dbg !69
  %cmp = icmp ult i64 %8, %add, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !74
  %11 = load i32, i32* %arrayidx1, align 4, !dbg !74
  %12 = load i32*, i32** %data, align 8, !dbg !75
  %13 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !75
  store i32 %11, i32* %arrayidx2, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %14, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !84
  call void @printWLine(i32* noundef %15), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @wcslen(i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_good() #0 !dbg !87 {
entry:
  call void @goodG2B1(), !dbg !88
  call void @goodG2B2(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* noundef null), !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 noundef %conv), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_good(), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_bad(), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 40, align 16, !dbg !116
  %1 = bitcast i8* %0 to i32*, !dbg !117
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %2 = alloca i8, i64 44, align 16, !dbg !120
  %3 = bitcast i8* %2 to i32*, !dbg !121
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !119
  %4 = load i32, i32* @staticFalse, align 4, !dbg !122
  %tobool = icmp ne i32 %4, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.else, !dbg !124

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !125
  br label %if.end, !dbg !127

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !128
  store i32* %5, i32** %data, align 8, !dbg !130
  %6 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !135
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !140
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !141
  store i64 %call, i64* %sourceLen, align 8, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !146
  %9 = load i64, i64* %sourceLen, align 8, !dbg !148
  %add = add i64 %9, 1, !dbg !149
  %cmp = icmp ult i64 %8, %add, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !154
  %11 = load i32, i32* %arrayidx1, align 4, !dbg !154
  %12 = load i32*, i32** %data, align 8, !dbg !155
  %13 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !155
  store i32 %11, i32* %arrayidx2, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %14, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !163
  call void @printWLine(i32* noundef %15), !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !166 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !167, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !169, metadata !DIExpression()), !dbg !170
  %0 = alloca i8, i64 40, align 16, !dbg !171
  %1 = bitcast i8* %0 to i32*, !dbg !172
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !170
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !173, metadata !DIExpression()), !dbg !174
  %2 = alloca i8, i64 44, align 16, !dbg !175
  %3 = bitcast i8* %2 to i32*, !dbg !176
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !174
  %4 = load i32, i32* @staticTrue, align 4, !dbg !177
  %tobool = icmp ne i32 %4, 0, !dbg !177
  br i1 %tobool, label %if.then, label %if.end, !dbg !179

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !180
  store i32* %5, i32** %data, align 8, !dbg !182
  %6 = load i32*, i32** %data, align 8, !dbg !183
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !183
  store i32 0, i32* %arrayidx, align 4, !dbg !184
  br label %if.end, !dbg !185

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !186, metadata !DIExpression()), !dbg !188
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !188
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !188
  call void @llvm.dbg.declare(metadata i64* %i, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !191, metadata !DIExpression()), !dbg !192
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !193
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !194
  store i64 %call, i64* %sourceLen, align 8, !dbg !195
  store i64 0, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !198

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !199
  %9 = load i64, i64* %sourceLen, align 8, !dbg !201
  %add = add i64 %9, 1, !dbg !202
  %cmp = icmp ult i64 %8, %add, !dbg !203
  br i1 %cmp, label %for.body, label %for.end, !dbg !204

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !205
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !207
  %11 = load i32, i32* %arrayidx1, align 4, !dbg !207
  %12 = load i32*, i32** %data, align 8, !dbg !208
  %13 = load i64, i64* %i, align 8, !dbg !209
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !208
  store i32 %11, i32* %arrayidx2, align 4, !dbg !210
  br label %for.inc, !dbg !211

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !212
  %inc = add i64 %14, 1, !dbg !212
  store i64 %inc, i64* %i, align 8, !dbg !212
  br label %for.cond, !dbg !213, !llvm.loop !214

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data, align 8, !dbg !216
  call void @printWLine(i32* noundef %15), !dbg !217
  ret void, !dbg !218
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 30, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 31, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_bad", scope: !15, file: !15, line: 35, type: !24, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !15, line: 37, type: !5)
!28 = !DILocation(line: 37, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !15, line: 38, type: !5)
!30 = !DILocation(line: 38, column: 15, scope: !23)
!31 = !DILocation(line: 38, column: 42, scope: !23)
!32 = !DILocation(line: 38, column: 31, scope: !23)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !15, line: 39, type: !5)
!34 = !DILocation(line: 39, column: 15, scope: !23)
!35 = !DILocation(line: 39, column: 43, scope: !23)
!36 = !DILocation(line: 39, column: 32, scope: !23)
!37 = !DILocation(line: 40, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !23, file: !15, line: 40, column: 8)
!39 = !DILocation(line: 40, column: 8, scope: !23)
!40 = !DILocation(line: 44, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !15, line: 41, column: 5)
!42 = !DILocation(line: 44, column: 14, scope: !41)
!43 = !DILocation(line: 45, column: 9, scope: !41)
!44 = !DILocation(line: 45, column: 17, scope: !41)
!45 = !DILocation(line: 46, column: 5, scope: !41)
!46 = !DILocalVariable(name: "source", scope: !47, file: !15, line: 48, type: !48)
!47 = distinct !DILexicalBlock(scope: !23, file: !15, line: 47, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 352, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 11)
!51 = !DILocation(line: 48, column: 17, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !47, file: !15, line: 49, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 31, baseType: !55)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !9, line: 94, baseType: !56)
!56 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 49, column: 16, scope: !47)
!58 = !DILocalVariable(name: "sourceLen", scope: !47, file: !15, line: 49, type: !53)
!59 = !DILocation(line: 49, column: 19, scope: !47)
!60 = !DILocation(line: 50, column: 28, scope: !47)
!61 = !DILocation(line: 50, column: 21, scope: !47)
!62 = !DILocation(line: 50, column: 19, scope: !47)
!63 = !DILocation(line: 53, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !47, file: !15, line: 53, column: 9)
!65 = !DILocation(line: 53, column: 14, scope: !64)
!66 = !DILocation(line: 53, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !15, line: 53, column: 9)
!68 = !DILocation(line: 53, column: 25, scope: !67)
!69 = !DILocation(line: 53, column: 35, scope: !67)
!70 = !DILocation(line: 53, column: 23, scope: !67)
!71 = !DILocation(line: 53, column: 9, scope: !64)
!72 = !DILocation(line: 55, column: 30, scope: !73)
!73 = distinct !DILexicalBlock(scope: !67, file: !15, line: 54, column: 9)
!74 = !DILocation(line: 55, column: 23, scope: !73)
!75 = !DILocation(line: 55, column: 13, scope: !73)
!76 = !DILocation(line: 55, column: 18, scope: !73)
!77 = !DILocation(line: 55, column: 21, scope: !73)
!78 = !DILocation(line: 56, column: 9, scope: !73)
!79 = !DILocation(line: 53, column: 41, scope: !67)
!80 = !DILocation(line: 53, column: 9, scope: !67)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 56, column: 9, scope: !64)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 57, column: 20, scope: !47)
!85 = !DILocation(line: 57, column: 9, scope: !47)
!86 = !DILocation(line: 59, column: 1, scope: !23)
!87 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_05_good", scope: !15, file: !15, line: 124, type: !24, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!88 = !DILocation(line: 126, column: 5, scope: !87)
!89 = !DILocation(line: 127, column: 5, scope: !87)
!90 = !DILocation(line: 128, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 140, type: !92, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!92 = !DISubroutineType(types: !93)
!93 = !{!10, !10, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !15, line: 140, type: !10)
!98 = !DILocation(line: 140, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !15, line: 140, type: !94)
!100 = !DILocation(line: 140, column: 27, scope: !91)
!101 = !DILocation(line: 143, column: 22, scope: !91)
!102 = !DILocation(line: 143, column: 12, scope: !91)
!103 = !DILocation(line: 143, column: 5, scope: !91)
!104 = !DILocation(line: 145, column: 5, scope: !91)
!105 = !DILocation(line: 146, column: 5, scope: !91)
!106 = !DILocation(line: 147, column: 5, scope: !91)
!107 = !DILocation(line: 150, column: 5, scope: !91)
!108 = !DILocation(line: 151, column: 5, scope: !91)
!109 = !DILocation(line: 152, column: 5, scope: !91)
!110 = !DILocation(line: 154, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 66, type: !24, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!112 = !DILocalVariable(name: "data", scope: !111, file: !15, line: 68, type: !5)
!113 = !DILocation(line: 68, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !15, line: 69, type: !5)
!115 = !DILocation(line: 69, column: 15, scope: !111)
!116 = !DILocation(line: 69, column: 42, scope: !111)
!117 = !DILocation(line: 69, column: 31, scope: !111)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !15, line: 70, type: !5)
!119 = !DILocation(line: 70, column: 15, scope: !111)
!120 = !DILocation(line: 70, column: 43, scope: !111)
!121 = !DILocation(line: 70, column: 32, scope: !111)
!122 = !DILocation(line: 71, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !111, file: !15, line: 71, column: 8)
!124 = !DILocation(line: 71, column: 8, scope: !111)
!125 = !DILocation(line: 74, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !15, line: 72, column: 5)
!127 = !DILocation(line: 75, column: 5, scope: !126)
!128 = !DILocation(line: 80, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !15, line: 77, column: 5)
!130 = !DILocation(line: 80, column: 14, scope: !129)
!131 = !DILocation(line: 81, column: 9, scope: !129)
!132 = !DILocation(line: 81, column: 17, scope: !129)
!133 = !DILocalVariable(name: "source", scope: !134, file: !15, line: 84, type: !48)
!134 = distinct !DILexicalBlock(scope: !111, file: !15, line: 83, column: 5)
!135 = !DILocation(line: 84, column: 17, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !134, file: !15, line: 85, type: !53)
!137 = !DILocation(line: 85, column: 16, scope: !134)
!138 = !DILocalVariable(name: "sourceLen", scope: !134, file: !15, line: 85, type: !53)
!139 = !DILocation(line: 85, column: 19, scope: !134)
!140 = !DILocation(line: 86, column: 28, scope: !134)
!141 = !DILocation(line: 86, column: 21, scope: !134)
!142 = !DILocation(line: 86, column: 19, scope: !134)
!143 = !DILocation(line: 89, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !134, file: !15, line: 89, column: 9)
!145 = !DILocation(line: 89, column: 14, scope: !144)
!146 = !DILocation(line: 89, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !15, line: 89, column: 9)
!148 = !DILocation(line: 89, column: 25, scope: !147)
!149 = !DILocation(line: 89, column: 35, scope: !147)
!150 = !DILocation(line: 89, column: 23, scope: !147)
!151 = !DILocation(line: 89, column: 9, scope: !144)
!152 = !DILocation(line: 91, column: 30, scope: !153)
!153 = distinct !DILexicalBlock(scope: !147, file: !15, line: 90, column: 9)
!154 = !DILocation(line: 91, column: 23, scope: !153)
!155 = !DILocation(line: 91, column: 13, scope: !153)
!156 = !DILocation(line: 91, column: 18, scope: !153)
!157 = !DILocation(line: 91, column: 21, scope: !153)
!158 = !DILocation(line: 92, column: 9, scope: !153)
!159 = !DILocation(line: 89, column: 41, scope: !147)
!160 = !DILocation(line: 89, column: 9, scope: !147)
!161 = distinct !{!161, !151, !162, !83}
!162 = !DILocation(line: 92, column: 9, scope: !144)
!163 = !DILocation(line: 93, column: 20, scope: !134)
!164 = !DILocation(line: 93, column: 9, scope: !134)
!165 = !DILocation(line: 95, column: 1, scope: !111)
!166 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 98, type: !24, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!167 = !DILocalVariable(name: "data", scope: !166, file: !15, line: 100, type: !5)
!168 = !DILocation(line: 100, column: 15, scope: !166)
!169 = !DILocalVariable(name: "dataBadBuffer", scope: !166, file: !15, line: 101, type: !5)
!170 = !DILocation(line: 101, column: 15, scope: !166)
!171 = !DILocation(line: 101, column: 42, scope: !166)
!172 = !DILocation(line: 101, column: 31, scope: !166)
!173 = !DILocalVariable(name: "dataGoodBuffer", scope: !166, file: !15, line: 102, type: !5)
!174 = !DILocation(line: 102, column: 15, scope: !166)
!175 = !DILocation(line: 102, column: 43, scope: !166)
!176 = !DILocation(line: 102, column: 32, scope: !166)
!177 = !DILocation(line: 103, column: 8, scope: !178)
!178 = distinct !DILexicalBlock(scope: !166, file: !15, line: 103, column: 8)
!179 = !DILocation(line: 103, column: 8, scope: !166)
!180 = !DILocation(line: 107, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !15, line: 104, column: 5)
!182 = !DILocation(line: 107, column: 14, scope: !181)
!183 = !DILocation(line: 108, column: 9, scope: !181)
!184 = !DILocation(line: 108, column: 17, scope: !181)
!185 = !DILocation(line: 109, column: 5, scope: !181)
!186 = !DILocalVariable(name: "source", scope: !187, file: !15, line: 111, type: !48)
!187 = distinct !DILexicalBlock(scope: !166, file: !15, line: 110, column: 5)
!188 = !DILocation(line: 111, column: 17, scope: !187)
!189 = !DILocalVariable(name: "i", scope: !187, file: !15, line: 112, type: !53)
!190 = !DILocation(line: 112, column: 16, scope: !187)
!191 = !DILocalVariable(name: "sourceLen", scope: !187, file: !15, line: 112, type: !53)
!192 = !DILocation(line: 112, column: 19, scope: !187)
!193 = !DILocation(line: 113, column: 28, scope: !187)
!194 = !DILocation(line: 113, column: 21, scope: !187)
!195 = !DILocation(line: 113, column: 19, scope: !187)
!196 = !DILocation(line: 116, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !187, file: !15, line: 116, column: 9)
!198 = !DILocation(line: 116, column: 14, scope: !197)
!199 = !DILocation(line: 116, column: 21, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !15, line: 116, column: 9)
!201 = !DILocation(line: 116, column: 25, scope: !200)
!202 = !DILocation(line: 116, column: 35, scope: !200)
!203 = !DILocation(line: 116, column: 23, scope: !200)
!204 = !DILocation(line: 116, column: 9, scope: !197)
!205 = !DILocation(line: 118, column: 30, scope: !206)
!206 = distinct !DILexicalBlock(scope: !200, file: !15, line: 117, column: 9)
!207 = !DILocation(line: 118, column: 23, scope: !206)
!208 = !DILocation(line: 118, column: 13, scope: !206)
!209 = !DILocation(line: 118, column: 18, scope: !206)
!210 = !DILocation(line: 118, column: 21, scope: !206)
!211 = !DILocation(line: 119, column: 9, scope: !206)
!212 = !DILocation(line: 116, column: 41, scope: !200)
!213 = !DILocation(line: 116, column: 9, scope: !200)
!214 = distinct !{!214, !204, !215, !83}
!215 = !DILocation(line: 119, column: 9, scope: !197)
!216 = !DILocation(line: 120, column: 20, scope: !187)
!217 = !DILocation(line: 120, column: 9, scope: !187)
!218 = !DILocation(line: 122, column: 1, scope: !166)
