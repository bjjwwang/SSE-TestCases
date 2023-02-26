; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_02_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  store i32* %2, i32** %data, align 8, !dbg !29
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !33
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !48, metadata !DIExpression()), !dbg !49
  %6 = load i32*, i32** %data, align 8, !dbg !50
  %call1 = call i64 @wcslen(i32* noundef %6), !dbg !51
  store i64 %call1, i64* %dataLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !56
  %8 = load i64, i64* %dataLen, align 8, !dbg !58
  %cmp = icmp ult i64 %7, %8, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !61
  %10 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !61
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !61
  %12 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !65
  store i32 %11, i32* %arrayidx3, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %13, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !73
  store i32 0, i32* %arrayidx4, align 4, !dbg !74
  %14 = load i32*, i32** %data, align 8, !dbg !75
  call void @printWLine(i32* noundef %14), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_02_good() #0 !dbg !78 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_02_good(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_02_bad(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 400, align 16, !dbg !107
  %1 = bitcast i8* %0 to i32*, !dbg !108
  store i32* %1, i32** %dataBuffer, align 8, !dbg !106
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  store i32* %2, i32** %data, align 8, !dbg !110
  %3 = load i32*, i32** %data, align 8, !dbg !111
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !114
  %4 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !122, metadata !DIExpression()), !dbg !123
  %6 = load i32*, i32** %data, align 8, !dbg !124
  %call1 = call i64 @wcslen(i32* noundef %6), !dbg !125
  store i64 %call1, i64* %dataLen, align 8, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !130
  %8 = load i64, i64* %dataLen, align 8, !dbg !132
  %cmp = icmp ult i64 %7, %8, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !135
  %10 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !135
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !135
  %12 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !139
  store i32 %11, i32* %arrayidx3, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %13, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !146
  store i32 0, i32* %arrayidx4, align 4, !dbg !147
  %14 = load i32*, i32** %data, align 8, !dbg !148
  call void @printWLine(i32* noundef %14), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  %0 = alloca i8, i64 400, align 16, !dbg !156
  %1 = bitcast i8* %0 to i32*, !dbg !157
  store i32* %1, i32** %dataBuffer, align 8, !dbg !155
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !158
  store i32* %2, i32** %data, align 8, !dbg !159
  %3 = load i32*, i32** %data, align 8, !dbg !160
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !163
  %4 = load i32*, i32** %data, align 8, !dbg !164
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !164
  store i32 0, i32* %arrayidx, align 4, !dbg !165
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !166, metadata !DIExpression()), !dbg !168
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !168
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !168
  call void @llvm.dbg.declare(metadata i64* %i, metadata !169, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !171, metadata !DIExpression()), !dbg !172
  %6 = load i32*, i32** %data, align 8, !dbg !173
  %call1 = call i64 @wcslen(i32* noundef %6), !dbg !174
  store i64 %call1, i64* %dataLen, align 8, !dbg !175
  store i64 0, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !179
  %8 = load i64, i64* %dataLen, align 8, !dbg !181
  %cmp = icmp ult i64 %7, %8, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !184
  %10 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !184
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !184
  %12 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !188
  store i32 %11, i32* %arrayidx3, align 4, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !191
  %inc = add i64 %13, 1, !dbg !191
  store i64 %inc, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !195
  store i32 0, i32* %arrayidx4, align 4, !dbg !196
  %14 = load i32*, i32** %data, align 8, !dbg !197
  call void @printWLine(i32* noundef %14), !dbg !198
  ret void, !dbg !199
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_02_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 39, scope: !17)
!27 = !DILocation(line: 26, column: 28, scope: !17)
!28 = !DILocation(line: 27, column: 12, scope: !17)
!29 = !DILocation(line: 27, column: 10, scope: !17)
!30 = !DILocation(line: 31, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !18, line: 29, column: 5)
!32 = distinct !DILexicalBlock(scope: !17, file: !18, line: 28, column: 8)
!33 = !DILocation(line: 31, column: 9, scope: !31)
!34 = !DILocation(line: 32, column: 9, scope: !31)
!35 = !DILocation(line: 32, column: 21, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !18, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !17, file: !18, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 35, column: 17, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !37, file: !18, line: 36, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 31, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !46)
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 36, column: 16, scope: !37)
!48 = !DILocalVariable(name: "dataLen", scope: !37, file: !18, line: 36, type: !43)
!49 = !DILocation(line: 36, column: 19, scope: !37)
!50 = !DILocation(line: 37, column: 26, scope: !37)
!51 = !DILocation(line: 37, column: 19, scope: !37)
!52 = !DILocation(line: 37, column: 17, scope: !37)
!53 = !DILocation(line: 39, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !37, file: !18, line: 39, column: 9)
!55 = !DILocation(line: 39, column: 14, scope: !54)
!56 = !DILocation(line: 39, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !18, line: 39, column: 9)
!58 = !DILocation(line: 39, column: 25, scope: !57)
!59 = !DILocation(line: 39, column: 23, scope: !57)
!60 = !DILocation(line: 39, column: 9, scope: !54)
!61 = !DILocation(line: 41, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !18, line: 40, column: 9)
!63 = !DILocation(line: 41, column: 28, scope: !62)
!64 = !DILocation(line: 41, column: 18, scope: !62)
!65 = !DILocation(line: 41, column: 13, scope: !62)
!66 = !DILocation(line: 41, column: 21, scope: !62)
!67 = !DILocation(line: 42, column: 9, scope: !62)
!68 = !DILocation(line: 39, column: 35, scope: !57)
!69 = !DILocation(line: 39, column: 9, scope: !57)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 42, column: 9, scope: !54)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 43, column: 9, scope: !37)
!74 = !DILocation(line: 43, column: 20, scope: !37)
!75 = !DILocation(line: 44, column: 20, scope: !37)
!76 = !DILocation(line: 44, column: 9, scope: !37)
!77 = !DILocation(line: 46, column: 1, scope: !17)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_02_good", scope: !18, file: !18, line: 109, type: !19, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!79 = !DILocation(line: 111, column: 5, scope: !78)
!80 = !DILocation(line: 112, column: 5, scope: !78)
!81 = !DILocation(line: 113, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 125, type: !83, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!83 = !DISubroutineType(types: !84)
!84 = !{!8, !8, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !18, line: 125, type: !8)
!89 = !DILocation(line: 125, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !18, line: 125, type: !85)
!91 = !DILocation(line: 125, column: 27, scope: !82)
!92 = !DILocation(line: 128, column: 22, scope: !82)
!93 = !DILocation(line: 128, column: 12, scope: !82)
!94 = !DILocation(line: 128, column: 5, scope: !82)
!95 = !DILocation(line: 130, column: 5, scope: !82)
!96 = !DILocation(line: 131, column: 5, scope: !82)
!97 = !DILocation(line: 132, column: 5, scope: !82)
!98 = !DILocation(line: 135, column: 5, scope: !82)
!99 = !DILocation(line: 136, column: 5, scope: !82)
!100 = !DILocation(line: 137, column: 5, scope: !82)
!101 = !DILocation(line: 139, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!103 = !DILocalVariable(name: "data", scope: !102, file: !18, line: 55, type: !3)
!104 = !DILocation(line: 55, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !18, line: 56, type: !3)
!106 = !DILocation(line: 56, column: 15, scope: !102)
!107 = !DILocation(line: 56, column: 39, scope: !102)
!108 = !DILocation(line: 56, column: 28, scope: !102)
!109 = !DILocation(line: 57, column: 12, scope: !102)
!110 = !DILocation(line: 57, column: 10, scope: !102)
!111 = !DILocation(line: 66, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !18, line: 64, column: 5)
!113 = distinct !DILexicalBlock(scope: !102, file: !18, line: 58, column: 8)
!114 = !DILocation(line: 66, column: 9, scope: !112)
!115 = !DILocation(line: 67, column: 9, scope: !112)
!116 = !DILocation(line: 67, column: 20, scope: !112)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !18, line: 70, type: !38)
!118 = distinct !DILexicalBlock(scope: !102, file: !18, line: 69, column: 5)
!119 = !DILocation(line: 70, column: 17, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !118, file: !18, line: 71, type: !43)
!121 = !DILocation(line: 71, column: 16, scope: !118)
!122 = !DILocalVariable(name: "dataLen", scope: !118, file: !18, line: 71, type: !43)
!123 = !DILocation(line: 71, column: 19, scope: !118)
!124 = !DILocation(line: 72, column: 26, scope: !118)
!125 = !DILocation(line: 72, column: 19, scope: !118)
!126 = !DILocation(line: 72, column: 17, scope: !118)
!127 = !DILocation(line: 74, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !118, file: !18, line: 74, column: 9)
!129 = !DILocation(line: 74, column: 14, scope: !128)
!130 = !DILocation(line: 74, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !18, line: 74, column: 9)
!132 = !DILocation(line: 74, column: 25, scope: !131)
!133 = !DILocation(line: 74, column: 23, scope: !131)
!134 = !DILocation(line: 74, column: 9, scope: !128)
!135 = !DILocation(line: 76, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !18, line: 75, column: 9)
!137 = !DILocation(line: 76, column: 28, scope: !136)
!138 = !DILocation(line: 76, column: 18, scope: !136)
!139 = !DILocation(line: 76, column: 13, scope: !136)
!140 = !DILocation(line: 76, column: 21, scope: !136)
!141 = !DILocation(line: 77, column: 9, scope: !136)
!142 = !DILocation(line: 74, column: 35, scope: !131)
!143 = !DILocation(line: 74, column: 9, scope: !131)
!144 = distinct !{!144, !134, !145, !72}
!145 = !DILocation(line: 77, column: 9, scope: !128)
!146 = !DILocation(line: 78, column: 9, scope: !118)
!147 = !DILocation(line: 78, column: 20, scope: !118)
!148 = !DILocation(line: 79, column: 20, scope: !118)
!149 = !DILocation(line: 79, column: 9, scope: !118)
!150 = !DILocation(line: 81, column: 1, scope: !102)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 84, type: !19, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!152 = !DILocalVariable(name: "data", scope: !151, file: !18, line: 86, type: !3)
!153 = !DILocation(line: 86, column: 15, scope: !151)
!154 = !DILocalVariable(name: "dataBuffer", scope: !151, file: !18, line: 87, type: !3)
!155 = !DILocation(line: 87, column: 15, scope: !151)
!156 = !DILocation(line: 87, column: 39, scope: !151)
!157 = !DILocation(line: 87, column: 28, scope: !151)
!158 = !DILocation(line: 88, column: 12, scope: !151)
!159 = !DILocation(line: 88, column: 10, scope: !151)
!160 = !DILocation(line: 92, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !162, file: !18, line: 90, column: 5)
!162 = distinct !DILexicalBlock(scope: !151, file: !18, line: 89, column: 8)
!163 = !DILocation(line: 92, column: 9, scope: !161)
!164 = !DILocation(line: 93, column: 9, scope: !161)
!165 = !DILocation(line: 93, column: 20, scope: !161)
!166 = !DILocalVariable(name: "dest", scope: !167, file: !18, line: 96, type: !38)
!167 = distinct !DILexicalBlock(scope: !151, file: !18, line: 95, column: 5)
!168 = !DILocation(line: 96, column: 17, scope: !167)
!169 = !DILocalVariable(name: "i", scope: !167, file: !18, line: 97, type: !43)
!170 = !DILocation(line: 97, column: 16, scope: !167)
!171 = !DILocalVariable(name: "dataLen", scope: !167, file: !18, line: 97, type: !43)
!172 = !DILocation(line: 97, column: 19, scope: !167)
!173 = !DILocation(line: 98, column: 26, scope: !167)
!174 = !DILocation(line: 98, column: 19, scope: !167)
!175 = !DILocation(line: 98, column: 17, scope: !167)
!176 = !DILocation(line: 100, column: 16, scope: !177)
!177 = distinct !DILexicalBlock(scope: !167, file: !18, line: 100, column: 9)
!178 = !DILocation(line: 100, column: 14, scope: !177)
!179 = !DILocation(line: 100, column: 21, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !18, line: 100, column: 9)
!181 = !DILocation(line: 100, column: 25, scope: !180)
!182 = !DILocation(line: 100, column: 23, scope: !180)
!183 = !DILocation(line: 100, column: 9, scope: !177)
!184 = !DILocation(line: 102, column: 23, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !18, line: 101, column: 9)
!186 = !DILocation(line: 102, column: 28, scope: !185)
!187 = !DILocation(line: 102, column: 18, scope: !185)
!188 = !DILocation(line: 102, column: 13, scope: !185)
!189 = !DILocation(line: 102, column: 21, scope: !185)
!190 = !DILocation(line: 103, column: 9, scope: !185)
!191 = !DILocation(line: 100, column: 35, scope: !180)
!192 = !DILocation(line: 100, column: 9, scope: !180)
!193 = distinct !{!193, !183, !194, !72}
!194 = !DILocation(line: 103, column: 9, scope: !177)
!195 = !DILocation(line: 104, column: 9, scope: !167)
!196 = !DILocation(line: 104, column: 20, scope: !167)
!197 = !DILocation(line: 105, column: 20, scope: !167)
!198 = !DILocation(line: 105, column: 9, scope: !167)
!199 = !DILocation(line: 107, column: 1, scope: !151)
