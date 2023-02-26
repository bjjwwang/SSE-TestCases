; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %call = call i32 (...) @globalReturnsTrue(), !dbg !34
  %tobool = icmp ne i32 %call, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i32* %arraydecay, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11_bad.source to i8*), i64 44, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !52, metadata !DIExpression()), !dbg !53
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !54
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !55
  store i64 %call2, i64* %sourceLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !60
  %3 = load i64, i64* %sourceLen, align 8, !dbg !62
  %add = add i64 %3, 1, !dbg !63
  %cmp = icmp ult i64 %2, %add, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !68
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !68
  %6 = load i32*, i32** %data, align 8, !dbg !69
  %7 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !69
  store i32 %5, i32* %arrayidx4, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %8, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* noundef %9), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* noundef null), !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 noundef %conv), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call i32 (...) @globalReturnsFalse(), !dbg !112
  %tobool = icmp ne i32 %call, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !118
  store i32* %arraydecay, i32** %data, align 8, !dbg !120
  %0 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !130
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !131
  store i64 %call2, i64* %sourceLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !136
  %3 = load i64, i64* %sourceLen, align 8, !dbg !138
  %add = add i64 %3, 1, !dbg !139
  %cmp = icmp ult i64 %2, %add, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !144
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !144
  %6 = load i32*, i32** %data, align 8, !dbg !145
  %7 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !145
  store i32 %5, i32* %arrayidx4, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %8, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !153
  call void @printWLine(i32* noundef %9), !dbg !154
  ret void, !dbg !155
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %call = call i32 (...) @globalReturnsTrue(), !dbg !163
  %tobool = icmp ne i32 %call, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !166
  store i32* %arraydecay, i32** %data, align 8, !dbg !168
  %0 = load i32*, i32** %data, align 8, !dbg !169
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !169
  store i32 0, i32* %arrayidx, align 4, !dbg !170
  br label %if.end, !dbg !171

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !172, metadata !DIExpression()), !dbg !174
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !174
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %i, metadata !175, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !177, metadata !DIExpression()), !dbg !178
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !179
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !180
  store i64 %call2, i64* %sourceLen, align 8, !dbg !181
  store i64 0, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !185
  %3 = load i64, i64* %sourceLen, align 8, !dbg !187
  %add = add i64 %3, 1, !dbg !188
  %cmp = icmp ult i64 %2, %add, !dbg !189
  br i1 %cmp, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !193
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !193
  %6 = load i32*, i32** %data, align 8, !dbg !194
  %7 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !194
  store i32 %5, i32* %arrayidx4, align 4, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !198
  %inc = add i64 %8, 1, !dbg !198
  store i64 %inc, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !202
  call void @printWLine(i32* noundef %9), !dbg !203
  ret void, !dbg !204
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 30, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 31, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 32, column: 13, scope: !11)
!34 = !DILocation(line: 33, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!36 = !DILocation(line: 33, column: 8, scope: !11)
!37 = !DILocation(line: 37, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !12, line: 34, column: 5)
!39 = !DILocation(line: 37, column: 14, scope: !38)
!40 = !DILocation(line: 38, column: 9, scope: !38)
!41 = !DILocation(line: 38, column: 17, scope: !38)
!42 = !DILocation(line: 39, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 41, type: !30)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!45 = !DILocation(line: 41, column: 17, scope: !44)
!46 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 42, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 31, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !50)
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 42, column: 16, scope: !44)
!52 = !DILocalVariable(name: "sourceLen", scope: !44, file: !12, line: 42, type: !47)
!53 = !DILocation(line: 42, column: 19, scope: !44)
!54 = !DILocation(line: 43, column: 28, scope: !44)
!55 = !DILocation(line: 43, column: 21, scope: !44)
!56 = !DILocation(line: 43, column: 19, scope: !44)
!57 = !DILocation(line: 46, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !12, line: 46, column: 9)
!59 = !DILocation(line: 46, column: 14, scope: !58)
!60 = !DILocation(line: 46, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 46, column: 9)
!62 = !DILocation(line: 46, column: 25, scope: !61)
!63 = !DILocation(line: 46, column: 35, scope: !61)
!64 = !DILocation(line: 46, column: 23, scope: !61)
!65 = !DILocation(line: 46, column: 9, scope: !58)
!66 = !DILocation(line: 48, column: 30, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !12, line: 47, column: 9)
!68 = !DILocation(line: 48, column: 23, scope: !67)
!69 = !DILocation(line: 48, column: 13, scope: !67)
!70 = !DILocation(line: 48, column: 18, scope: !67)
!71 = !DILocation(line: 48, column: 21, scope: !67)
!72 = !DILocation(line: 49, column: 9, scope: !67)
!73 = !DILocation(line: 46, column: 41, scope: !61)
!74 = !DILocation(line: 46, column: 9, scope: !61)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 49, column: 9, scope: !58)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 50, column: 20, scope: !44)
!79 = !DILocation(line: 50, column: 9, scope: !44)
!80 = !DILocation(line: 52, column: 1, scope: !11)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_11_good", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!82 = !DILocation(line: 119, column: 5, scope: !81)
!83 = !DILocation(line: 120, column: 5, scope: !81)
!84 = !DILocation(line: 121, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 133, type: !86, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!86 = !DISubroutineType(types: !87)
!87 = !{!22, !22, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 133, type: !22)
!92 = !DILocation(line: 133, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 133, type: !88)
!94 = !DILocation(line: 133, column: 27, scope: !85)
!95 = !DILocation(line: 136, column: 22, scope: !85)
!96 = !DILocation(line: 136, column: 12, scope: !85)
!97 = !DILocation(line: 136, column: 5, scope: !85)
!98 = !DILocation(line: 138, column: 5, scope: !85)
!99 = !DILocation(line: 139, column: 5, scope: !85)
!100 = !DILocation(line: 140, column: 5, scope: !85)
!101 = !DILocation(line: 143, column: 5, scope: !85)
!102 = !DILocation(line: 144, column: 5, scope: !85)
!103 = !DILocation(line: 145, column: 5, scope: !85)
!104 = !DILocation(line: 147, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 61, type: !17)
!107 = !DILocation(line: 61, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !12, line: 62, type: !25)
!109 = !DILocation(line: 62, column: 13, scope: !105)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !12, line: 63, type: !30)
!111 = !DILocation(line: 63, column: 13, scope: !105)
!112 = !DILocation(line: 64, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !12, line: 64, column: 8)
!114 = !DILocation(line: 64, column: 8, scope: !105)
!115 = !DILocation(line: 67, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 65, column: 5)
!117 = !DILocation(line: 68, column: 5, scope: !116)
!118 = !DILocation(line: 73, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !12, line: 70, column: 5)
!120 = !DILocation(line: 73, column: 14, scope: !119)
!121 = !DILocation(line: 74, column: 9, scope: !119)
!122 = !DILocation(line: 74, column: 17, scope: !119)
!123 = !DILocalVariable(name: "source", scope: !124, file: !12, line: 77, type: !30)
!124 = distinct !DILexicalBlock(scope: !105, file: !12, line: 76, column: 5)
!125 = !DILocation(line: 77, column: 17, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 78, type: !47)
!127 = !DILocation(line: 78, column: 16, scope: !124)
!128 = !DILocalVariable(name: "sourceLen", scope: !124, file: !12, line: 78, type: !47)
!129 = !DILocation(line: 78, column: 19, scope: !124)
!130 = !DILocation(line: 79, column: 28, scope: !124)
!131 = !DILocation(line: 79, column: 21, scope: !124)
!132 = !DILocation(line: 79, column: 19, scope: !124)
!133 = !DILocation(line: 82, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !12, line: 82, column: 9)
!135 = !DILocation(line: 82, column: 14, scope: !134)
!136 = !DILocation(line: 82, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 82, column: 9)
!138 = !DILocation(line: 82, column: 25, scope: !137)
!139 = !DILocation(line: 82, column: 35, scope: !137)
!140 = !DILocation(line: 82, column: 23, scope: !137)
!141 = !DILocation(line: 82, column: 9, scope: !134)
!142 = !DILocation(line: 84, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !12, line: 83, column: 9)
!144 = !DILocation(line: 84, column: 23, scope: !143)
!145 = !DILocation(line: 84, column: 13, scope: !143)
!146 = !DILocation(line: 84, column: 18, scope: !143)
!147 = !DILocation(line: 84, column: 21, scope: !143)
!148 = !DILocation(line: 85, column: 9, scope: !143)
!149 = !DILocation(line: 82, column: 41, scope: !137)
!150 = !DILocation(line: 82, column: 9, scope: !137)
!151 = distinct !{!151, !141, !152, !77}
!152 = !DILocation(line: 85, column: 9, scope: !134)
!153 = !DILocation(line: 86, column: 20, scope: !124)
!154 = !DILocation(line: 86, column: 9, scope: !124)
!155 = !DILocation(line: 88, column: 1, scope: !105)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!157 = !DILocalVariable(name: "data", scope: !156, file: !12, line: 93, type: !17)
!158 = !DILocation(line: 93, column: 15, scope: !156)
!159 = !DILocalVariable(name: "dataBadBuffer", scope: !156, file: !12, line: 94, type: !25)
!160 = !DILocation(line: 94, column: 13, scope: !156)
!161 = !DILocalVariable(name: "dataGoodBuffer", scope: !156, file: !12, line: 95, type: !30)
!162 = !DILocation(line: 95, column: 13, scope: !156)
!163 = !DILocation(line: 96, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !156, file: !12, line: 96, column: 8)
!165 = !DILocation(line: 96, column: 8, scope: !156)
!166 = !DILocation(line: 100, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !12, line: 97, column: 5)
!168 = !DILocation(line: 100, column: 14, scope: !167)
!169 = !DILocation(line: 101, column: 9, scope: !167)
!170 = !DILocation(line: 101, column: 17, scope: !167)
!171 = !DILocation(line: 102, column: 5, scope: !167)
!172 = !DILocalVariable(name: "source", scope: !173, file: !12, line: 104, type: !30)
!173 = distinct !DILexicalBlock(scope: !156, file: !12, line: 103, column: 5)
!174 = !DILocation(line: 104, column: 17, scope: !173)
!175 = !DILocalVariable(name: "i", scope: !173, file: !12, line: 105, type: !47)
!176 = !DILocation(line: 105, column: 16, scope: !173)
!177 = !DILocalVariable(name: "sourceLen", scope: !173, file: !12, line: 105, type: !47)
!178 = !DILocation(line: 105, column: 19, scope: !173)
!179 = !DILocation(line: 106, column: 28, scope: !173)
!180 = !DILocation(line: 106, column: 21, scope: !173)
!181 = !DILocation(line: 106, column: 19, scope: !173)
!182 = !DILocation(line: 109, column: 16, scope: !183)
!183 = distinct !DILexicalBlock(scope: !173, file: !12, line: 109, column: 9)
!184 = !DILocation(line: 109, column: 14, scope: !183)
!185 = !DILocation(line: 109, column: 21, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !12, line: 109, column: 9)
!187 = !DILocation(line: 109, column: 25, scope: !186)
!188 = !DILocation(line: 109, column: 35, scope: !186)
!189 = !DILocation(line: 109, column: 23, scope: !186)
!190 = !DILocation(line: 109, column: 9, scope: !183)
!191 = !DILocation(line: 111, column: 30, scope: !192)
!192 = distinct !DILexicalBlock(scope: !186, file: !12, line: 110, column: 9)
!193 = !DILocation(line: 111, column: 23, scope: !192)
!194 = !DILocation(line: 111, column: 13, scope: !192)
!195 = !DILocation(line: 111, column: 18, scope: !192)
!196 = !DILocation(line: 111, column: 21, scope: !192)
!197 = !DILocation(line: 112, column: 9, scope: !192)
!198 = !DILocation(line: 109, column: 41, scope: !186)
!199 = !DILocation(line: 109, column: 9, scope: !186)
!200 = distinct !{!200, !190, !201, !77}
!201 = !DILocation(line: 112, column: 9, scope: !183)
!202 = !DILocation(line: 113, column: 20, scope: !173)
!203 = !DILocation(line: 113, column: 9, scope: !173)
!204 = !DILocation(line: 115, column: 1, scope: !156)
