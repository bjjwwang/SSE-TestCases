; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02_bad() #0 !dbg !11 {
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
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02_bad.source to i8*), i64 44, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !49, metadata !DIExpression()), !dbg !50
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !51
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !52
  store i64 %call, i64* %sourceLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !57
  %3 = load i64, i64* %sourceLen, align 8, !dbg !59
  %add = add i64 %3, 1, !dbg !60
  %cmp = icmp ult i64 %2, %add, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !65
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !65
  %6 = load i32*, i32** %data, align 8, !dbg !66
  %7 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !66
  store i32 %5, i32* %arrayidx3, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %8, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !75
  call void @printWLine(i32* noundef %9), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @wcslen(i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* noundef null), !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 noundef %conv), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02_good(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02_bad(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !109
  store i32* %arraydecay, i32** %data, align 8, !dbg !112
  %0 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !122
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !123
  store i64 %call, i64* %sourceLen, align 8, !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !128
  %3 = load i64, i64* %sourceLen, align 8, !dbg !130
  %add = add i64 %3, 1, !dbg !131
  %cmp = icmp ult i64 %2, %add, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !136
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !136
  %6 = load i32*, i32** %data, align 8, !dbg !137
  %7 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !137
  store i32 %5, i32* %arrayidx3, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %8, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !145
  call void @printWLine(i32* noundef %9), !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !148 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !155
  store i32* %arraydecay, i32** %data, align 8, !dbg !158
  %0 = load i32*, i32** %data, align 8, !dbg !159
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !159
  store i32 0, i32* %arrayidx, align 4, !dbg !160
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !161, metadata !DIExpression()), !dbg !163
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !163
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !163
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !166, metadata !DIExpression()), !dbg !167
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !168
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !169
  store i64 %call, i64* %sourceLen, align 8, !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !174
  %3 = load i64, i64* %sourceLen, align 8, !dbg !176
  %add = add i64 %3, 1, !dbg !177
  %cmp = icmp ult i64 %2, %add, !dbg !178
  br i1 %cmp, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !182
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !182
  %6 = load i32*, i32** %data, align 8, !dbg !183
  %7 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !183
  store i32 %5, i32* %arrayidx3, align 4, !dbg !185
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !187
  %inc = add i64 %8, 1, !dbg !187
  store i64 %inc, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !191
  call void @printWLine(i32* noundef %9), !dbg !192
  ret void, !dbg !193
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !12, line: 34, column: 5)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!37 = !DILocation(line: 37, column: 14, scope: !35)
!38 = !DILocation(line: 38, column: 9, scope: !35)
!39 = !DILocation(line: 38, column: 17, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 41, type: !30)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!42 = !DILocation(line: 41, column: 17, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 42, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !47)
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 42, column: 16, scope: !41)
!49 = !DILocalVariable(name: "sourceLen", scope: !41, file: !12, line: 42, type: !44)
!50 = !DILocation(line: 42, column: 19, scope: !41)
!51 = !DILocation(line: 43, column: 28, scope: !41)
!52 = !DILocation(line: 43, column: 21, scope: !41)
!53 = !DILocation(line: 43, column: 19, scope: !41)
!54 = !DILocation(line: 46, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !41, file: !12, line: 46, column: 9)
!56 = !DILocation(line: 46, column: 14, scope: !55)
!57 = !DILocation(line: 46, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 46, column: 9)
!59 = !DILocation(line: 46, column: 25, scope: !58)
!60 = !DILocation(line: 46, column: 35, scope: !58)
!61 = !DILocation(line: 46, column: 23, scope: !58)
!62 = !DILocation(line: 46, column: 9, scope: !55)
!63 = !DILocation(line: 48, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !12, line: 47, column: 9)
!65 = !DILocation(line: 48, column: 23, scope: !64)
!66 = !DILocation(line: 48, column: 13, scope: !64)
!67 = !DILocation(line: 48, column: 18, scope: !64)
!68 = !DILocation(line: 48, column: 21, scope: !64)
!69 = !DILocation(line: 49, column: 9, scope: !64)
!70 = !DILocation(line: 46, column: 41, scope: !58)
!71 = !DILocation(line: 46, column: 9, scope: !58)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 49, column: 9, scope: !55)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 50, column: 20, scope: !41)
!76 = !DILocation(line: 50, column: 9, scope: !41)
!77 = !DILocation(line: 52, column: 1, scope: !11)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_02_good", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!79 = !DILocation(line: 119, column: 5, scope: !78)
!80 = !DILocation(line: 120, column: 5, scope: !78)
!81 = !DILocation(line: 121, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 133, type: !83, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!83 = !DISubroutineType(types: !84)
!84 = !{!22, !22, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 133, type: !22)
!89 = !DILocation(line: 133, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 133, type: !85)
!91 = !DILocation(line: 133, column: 27, scope: !82)
!92 = !DILocation(line: 136, column: 22, scope: !82)
!93 = !DILocation(line: 136, column: 12, scope: !82)
!94 = !DILocation(line: 136, column: 5, scope: !82)
!95 = !DILocation(line: 138, column: 5, scope: !82)
!96 = !DILocation(line: 139, column: 5, scope: !82)
!97 = !DILocation(line: 140, column: 5, scope: !82)
!98 = !DILocation(line: 143, column: 5, scope: !82)
!99 = !DILocation(line: 144, column: 5, scope: !82)
!100 = !DILocation(line: 145, column: 5, scope: !82)
!101 = !DILocation(line: 147, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 61, type: !17)
!104 = !DILocation(line: 61, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !12, line: 62, type: !25)
!106 = !DILocation(line: 62, column: 13, scope: !102)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !12, line: 63, type: !30)
!108 = !DILocation(line: 63, column: 13, scope: !102)
!109 = !DILocation(line: 73, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !12, line: 70, column: 5)
!111 = distinct !DILexicalBlock(scope: !102, file: !12, line: 64, column: 8)
!112 = !DILocation(line: 73, column: 14, scope: !110)
!113 = !DILocation(line: 74, column: 9, scope: !110)
!114 = !DILocation(line: 74, column: 17, scope: !110)
!115 = !DILocalVariable(name: "source", scope: !116, file: !12, line: 77, type: !30)
!116 = distinct !DILexicalBlock(scope: !102, file: !12, line: 76, column: 5)
!117 = !DILocation(line: 77, column: 17, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !116, file: !12, line: 78, type: !44)
!119 = !DILocation(line: 78, column: 16, scope: !116)
!120 = !DILocalVariable(name: "sourceLen", scope: !116, file: !12, line: 78, type: !44)
!121 = !DILocation(line: 78, column: 19, scope: !116)
!122 = !DILocation(line: 79, column: 28, scope: !116)
!123 = !DILocation(line: 79, column: 21, scope: !116)
!124 = !DILocation(line: 79, column: 19, scope: !116)
!125 = !DILocation(line: 82, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !116, file: !12, line: 82, column: 9)
!127 = !DILocation(line: 82, column: 14, scope: !126)
!128 = !DILocation(line: 82, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !12, line: 82, column: 9)
!130 = !DILocation(line: 82, column: 25, scope: !129)
!131 = !DILocation(line: 82, column: 35, scope: !129)
!132 = !DILocation(line: 82, column: 23, scope: !129)
!133 = !DILocation(line: 82, column: 9, scope: !126)
!134 = !DILocation(line: 84, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !12, line: 83, column: 9)
!136 = !DILocation(line: 84, column: 23, scope: !135)
!137 = !DILocation(line: 84, column: 13, scope: !135)
!138 = !DILocation(line: 84, column: 18, scope: !135)
!139 = !DILocation(line: 84, column: 21, scope: !135)
!140 = !DILocation(line: 85, column: 9, scope: !135)
!141 = !DILocation(line: 82, column: 41, scope: !129)
!142 = !DILocation(line: 82, column: 9, scope: !129)
!143 = distinct !{!143, !133, !144, !74}
!144 = !DILocation(line: 85, column: 9, scope: !126)
!145 = !DILocation(line: 86, column: 20, scope: !116)
!146 = !DILocation(line: 86, column: 9, scope: !116)
!147 = !DILocation(line: 88, column: 1, scope: !102)
!148 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!149 = !DILocalVariable(name: "data", scope: !148, file: !12, line: 93, type: !17)
!150 = !DILocation(line: 93, column: 15, scope: !148)
!151 = !DILocalVariable(name: "dataBadBuffer", scope: !148, file: !12, line: 94, type: !25)
!152 = !DILocation(line: 94, column: 13, scope: !148)
!153 = !DILocalVariable(name: "dataGoodBuffer", scope: !148, file: !12, line: 95, type: !30)
!154 = !DILocation(line: 95, column: 13, scope: !148)
!155 = !DILocation(line: 100, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !157, file: !12, line: 97, column: 5)
!157 = distinct !DILexicalBlock(scope: !148, file: !12, line: 96, column: 8)
!158 = !DILocation(line: 100, column: 14, scope: !156)
!159 = !DILocation(line: 101, column: 9, scope: !156)
!160 = !DILocation(line: 101, column: 17, scope: !156)
!161 = !DILocalVariable(name: "source", scope: !162, file: !12, line: 104, type: !30)
!162 = distinct !DILexicalBlock(scope: !148, file: !12, line: 103, column: 5)
!163 = !DILocation(line: 104, column: 17, scope: !162)
!164 = !DILocalVariable(name: "i", scope: !162, file: !12, line: 105, type: !44)
!165 = !DILocation(line: 105, column: 16, scope: !162)
!166 = !DILocalVariable(name: "sourceLen", scope: !162, file: !12, line: 105, type: !44)
!167 = !DILocation(line: 105, column: 19, scope: !162)
!168 = !DILocation(line: 106, column: 28, scope: !162)
!169 = !DILocation(line: 106, column: 21, scope: !162)
!170 = !DILocation(line: 106, column: 19, scope: !162)
!171 = !DILocation(line: 109, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !162, file: !12, line: 109, column: 9)
!173 = !DILocation(line: 109, column: 14, scope: !172)
!174 = !DILocation(line: 109, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !12, line: 109, column: 9)
!176 = !DILocation(line: 109, column: 25, scope: !175)
!177 = !DILocation(line: 109, column: 35, scope: !175)
!178 = !DILocation(line: 109, column: 23, scope: !175)
!179 = !DILocation(line: 109, column: 9, scope: !172)
!180 = !DILocation(line: 111, column: 30, scope: !181)
!181 = distinct !DILexicalBlock(scope: !175, file: !12, line: 110, column: 9)
!182 = !DILocation(line: 111, column: 23, scope: !181)
!183 = !DILocation(line: 111, column: 13, scope: !181)
!184 = !DILocation(line: 111, column: 18, scope: !181)
!185 = !DILocation(line: 111, column: 21, scope: !181)
!186 = !DILocation(line: 112, column: 9, scope: !181)
!187 = !DILocation(line: 109, column: 41, scope: !175)
!188 = !DILocation(line: 109, column: 9, scope: !175)
!189 = distinct !{!189, !179, !190, !74}
!190 = !DILocation(line: 112, column: 9, scope: !172)
!191 = !DILocation(line: 113, column: 20, scope: !162)
!192 = !DILocation(line: 113, column: 9, scope: !162)
!193 = !DILocation(line: 115, column: 1, scope: !148)
