; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03_bad() #0 !dbg !17 {
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
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03_bad.source to i8*), i64 44, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !52
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !53
  store i64 %call, i64* %sourceLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !58
  %8 = load i64, i64* %sourceLen, align 8, !dbg !60
  %add = add i64 %8, 1, !dbg !61
  %cmp = icmp ult i64 %7, %add, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !66
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !66
  %11 = load i32*, i32** %data, align 8, !dbg !67
  %12 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !67
  store i32 %10, i32* %arrayidx2, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %13, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !76
  call void @printWLine(i32* noundef %14), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @wcslen(i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* noundef null), !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 noundef %conv), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03_good(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03_bad(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 40, align 16, !dbg !108
  %1 = bitcast i8* %0 to i32*, !dbg !109
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %2 = alloca i8, i64 44, align 16, !dbg !112
  %3 = bitcast i8* %2 to i32*, !dbg !113
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !111
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !114
  store i32* %4, i32** %data, align 8, !dbg !117
  %5 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !127
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !128
  store i64 %call, i64* %sourceLen, align 8, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !133
  %8 = load i64, i64* %sourceLen, align 8, !dbg !135
  %add = add i64 %8, 1, !dbg !136
  %cmp = icmp ult i64 %7, %add, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !141
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !141
  %11 = load i32*, i32** %data, align 8, !dbg !142
  %12 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !142
  store i32 %10, i32* %arrayidx2, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %13, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !150
  call void @printWLine(i32* noundef %14), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %0 = alloca i8, i64 40, align 16, !dbg !158
  %1 = bitcast i8* %0 to i32*, !dbg !159
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !157
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  %2 = alloca i8, i64 44, align 16, !dbg !162
  %3 = bitcast i8* %2 to i32*, !dbg !163
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !161
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !164
  store i32* %4, i32** %data, align 8, !dbg !167
  %5 = load i32*, i32** %data, align 8, !dbg !168
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !168
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !170, metadata !DIExpression()), !dbg !172
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !172
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !175, metadata !DIExpression()), !dbg !176
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !177
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !178
  store i64 %call, i64* %sourceLen, align 8, !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !183
  %8 = load i64, i64* %sourceLen, align 8, !dbg !185
  %add = add i64 %8, 1, !dbg !186
  %cmp = icmp ult i64 %7, %add, !dbg !187
  br i1 %cmp, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !191
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !191
  %11 = load i32*, i32** %data, align 8, !dbg !192
  %12 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !192
  store i32 %10, i32* %arrayidx2, align 4, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !196
  %inc = add i64 %13, 1, !dbg !196
  store i64 %inc, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !200
  call void @printWLine(i32* noundef %14), !dbg !201
  ret void, !dbg !202
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03_bad", scope: !18, file: !18, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !18, line: 34, column: 5)
!34 = distinct !DILexicalBlock(scope: !17, file: !18, line: 33, column: 8)
!35 = !DILocation(line: 37, column: 14, scope: !33)
!36 = !DILocation(line: 38, column: 9, scope: !33)
!37 = !DILocation(line: 38, column: 17, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !18, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !17, file: !18, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DILocation(line: 41, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !18, line: 42, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 31, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !48)
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 42, column: 16, scope: !39)
!50 = !DILocalVariable(name: "sourceLen", scope: !39, file: !18, line: 42, type: !45)
!51 = !DILocation(line: 42, column: 19, scope: !39)
!52 = !DILocation(line: 43, column: 28, scope: !39)
!53 = !DILocation(line: 43, column: 21, scope: !39)
!54 = !DILocation(line: 43, column: 19, scope: !39)
!55 = !DILocation(line: 46, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !39, file: !18, line: 46, column: 9)
!57 = !DILocation(line: 46, column: 14, scope: !56)
!58 = !DILocation(line: 46, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !18, line: 46, column: 9)
!60 = !DILocation(line: 46, column: 25, scope: !59)
!61 = !DILocation(line: 46, column: 35, scope: !59)
!62 = !DILocation(line: 46, column: 23, scope: !59)
!63 = !DILocation(line: 46, column: 9, scope: !56)
!64 = !DILocation(line: 48, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !18, line: 47, column: 9)
!66 = !DILocation(line: 48, column: 23, scope: !65)
!67 = !DILocation(line: 48, column: 13, scope: !65)
!68 = !DILocation(line: 48, column: 18, scope: !65)
!69 = !DILocation(line: 48, column: 21, scope: !65)
!70 = !DILocation(line: 49, column: 9, scope: !65)
!71 = !DILocation(line: 46, column: 41, scope: !59)
!72 = !DILocation(line: 46, column: 9, scope: !59)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 49, column: 9, scope: !56)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 50, column: 20, scope: !39)
!77 = !DILocation(line: 50, column: 9, scope: !39)
!78 = !DILocation(line: 52, column: 1, scope: !17)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_03_good", scope: !18, file: !18, line: 117, type: !19, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!80 = !DILocation(line: 119, column: 5, scope: !79)
!81 = !DILocation(line: 120, column: 5, scope: !79)
!82 = !DILocation(line: 121, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 133, type: !84, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!84 = !DISubroutineType(types: !85)
!85 = !{!8, !8, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !18, line: 133, type: !8)
!90 = !DILocation(line: 133, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !18, line: 133, type: !86)
!92 = !DILocation(line: 133, column: 27, scope: !83)
!93 = !DILocation(line: 136, column: 22, scope: !83)
!94 = !DILocation(line: 136, column: 12, scope: !83)
!95 = !DILocation(line: 136, column: 5, scope: !83)
!96 = !DILocation(line: 138, column: 5, scope: !83)
!97 = !DILocation(line: 139, column: 5, scope: !83)
!98 = !DILocation(line: 140, column: 5, scope: !83)
!99 = !DILocation(line: 143, column: 5, scope: !83)
!100 = !DILocation(line: 144, column: 5, scope: !83)
!101 = !DILocation(line: 145, column: 5, scope: !83)
!102 = !DILocation(line: 147, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 59, type: !19, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!104 = !DILocalVariable(name: "data", scope: !103, file: !18, line: 61, type: !3)
!105 = !DILocation(line: 61, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !18, line: 62, type: !3)
!107 = !DILocation(line: 62, column: 15, scope: !103)
!108 = !DILocation(line: 62, column: 42, scope: !103)
!109 = !DILocation(line: 62, column: 31, scope: !103)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !18, line: 63, type: !3)
!111 = !DILocation(line: 63, column: 15, scope: !103)
!112 = !DILocation(line: 63, column: 43, scope: !103)
!113 = !DILocation(line: 63, column: 32, scope: !103)
!114 = !DILocation(line: 73, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !18, line: 70, column: 5)
!116 = distinct !DILexicalBlock(scope: !103, file: !18, line: 64, column: 8)
!117 = !DILocation(line: 73, column: 14, scope: !115)
!118 = !DILocation(line: 74, column: 9, scope: !115)
!119 = !DILocation(line: 74, column: 17, scope: !115)
!120 = !DILocalVariable(name: "source", scope: !121, file: !18, line: 77, type: !40)
!121 = distinct !DILexicalBlock(scope: !103, file: !18, line: 76, column: 5)
!122 = !DILocation(line: 77, column: 17, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !121, file: !18, line: 78, type: !45)
!124 = !DILocation(line: 78, column: 16, scope: !121)
!125 = !DILocalVariable(name: "sourceLen", scope: !121, file: !18, line: 78, type: !45)
!126 = !DILocation(line: 78, column: 19, scope: !121)
!127 = !DILocation(line: 79, column: 28, scope: !121)
!128 = !DILocation(line: 79, column: 21, scope: !121)
!129 = !DILocation(line: 79, column: 19, scope: !121)
!130 = !DILocation(line: 82, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !121, file: !18, line: 82, column: 9)
!132 = !DILocation(line: 82, column: 14, scope: !131)
!133 = !DILocation(line: 82, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !18, line: 82, column: 9)
!135 = !DILocation(line: 82, column: 25, scope: !134)
!136 = !DILocation(line: 82, column: 35, scope: !134)
!137 = !DILocation(line: 82, column: 23, scope: !134)
!138 = !DILocation(line: 82, column: 9, scope: !131)
!139 = !DILocation(line: 84, column: 30, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !18, line: 83, column: 9)
!141 = !DILocation(line: 84, column: 23, scope: !140)
!142 = !DILocation(line: 84, column: 13, scope: !140)
!143 = !DILocation(line: 84, column: 18, scope: !140)
!144 = !DILocation(line: 84, column: 21, scope: !140)
!145 = !DILocation(line: 85, column: 9, scope: !140)
!146 = !DILocation(line: 82, column: 41, scope: !134)
!147 = !DILocation(line: 82, column: 9, scope: !134)
!148 = distinct !{!148, !138, !149, !75}
!149 = !DILocation(line: 85, column: 9, scope: !131)
!150 = !DILocation(line: 86, column: 20, scope: !121)
!151 = !DILocation(line: 86, column: 9, scope: !121)
!152 = !DILocation(line: 88, column: 1, scope: !103)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 91, type: !19, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!154 = !DILocalVariable(name: "data", scope: !153, file: !18, line: 93, type: !3)
!155 = !DILocation(line: 93, column: 15, scope: !153)
!156 = !DILocalVariable(name: "dataBadBuffer", scope: !153, file: !18, line: 94, type: !3)
!157 = !DILocation(line: 94, column: 15, scope: !153)
!158 = !DILocation(line: 94, column: 42, scope: !153)
!159 = !DILocation(line: 94, column: 31, scope: !153)
!160 = !DILocalVariable(name: "dataGoodBuffer", scope: !153, file: !18, line: 95, type: !3)
!161 = !DILocation(line: 95, column: 15, scope: !153)
!162 = !DILocation(line: 95, column: 43, scope: !153)
!163 = !DILocation(line: 95, column: 32, scope: !153)
!164 = !DILocation(line: 100, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !166, file: !18, line: 97, column: 5)
!166 = distinct !DILexicalBlock(scope: !153, file: !18, line: 96, column: 8)
!167 = !DILocation(line: 100, column: 14, scope: !165)
!168 = !DILocation(line: 101, column: 9, scope: !165)
!169 = !DILocation(line: 101, column: 17, scope: !165)
!170 = !DILocalVariable(name: "source", scope: !171, file: !18, line: 104, type: !40)
!171 = distinct !DILexicalBlock(scope: !153, file: !18, line: 103, column: 5)
!172 = !DILocation(line: 104, column: 17, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !171, file: !18, line: 105, type: !45)
!174 = !DILocation(line: 105, column: 16, scope: !171)
!175 = !DILocalVariable(name: "sourceLen", scope: !171, file: !18, line: 105, type: !45)
!176 = !DILocation(line: 105, column: 19, scope: !171)
!177 = !DILocation(line: 106, column: 28, scope: !171)
!178 = !DILocation(line: 106, column: 21, scope: !171)
!179 = !DILocation(line: 106, column: 19, scope: !171)
!180 = !DILocation(line: 109, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !171, file: !18, line: 109, column: 9)
!182 = !DILocation(line: 109, column: 14, scope: !181)
!183 = !DILocation(line: 109, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !18, line: 109, column: 9)
!185 = !DILocation(line: 109, column: 25, scope: !184)
!186 = !DILocation(line: 109, column: 35, scope: !184)
!187 = !DILocation(line: 109, column: 23, scope: !184)
!188 = !DILocation(line: 109, column: 9, scope: !181)
!189 = !DILocation(line: 111, column: 30, scope: !190)
!190 = distinct !DILexicalBlock(scope: !184, file: !18, line: 110, column: 9)
!191 = !DILocation(line: 111, column: 23, scope: !190)
!192 = !DILocation(line: 111, column: 13, scope: !190)
!193 = !DILocation(line: 111, column: 18, scope: !190)
!194 = !DILocation(line: 111, column: 21, scope: !190)
!195 = !DILocation(line: 112, column: 9, scope: !190)
!196 = !DILocation(line: 109, column: 41, scope: !184)
!197 = !DILocation(line: 109, column: 9, scope: !184)
!198 = distinct !{!198, !188, !199, !75}
!199 = !DILocation(line: 112, column: 9, scope: !181)
!200 = !DILocation(line: 113, column: 20, scope: !171)
!201 = !DILocation(line: 113, column: 9, scope: !171)
!202 = !DILocation(line: 115, column: 1, scope: !153)
