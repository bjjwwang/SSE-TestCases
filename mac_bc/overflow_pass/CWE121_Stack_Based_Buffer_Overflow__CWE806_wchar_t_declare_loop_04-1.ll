; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !34
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !50
  %3 = load i32*, i32** %data, align 8, !dbg !51
  %call1 = call i64 @wcslen(i32* noundef %3), !dbg !52
  store i64 %call1, i64* %dataLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !57
  %5 = load i64, i64* %dataLen, align 8, !dbg !59
  %cmp = icmp ult i64 %4, %5, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !62
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !62
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !62
  %9 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !66
  store i32 %8, i32* %arrayidx3, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %10, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !74
  store i32 0, i32* %arrayidx4, align 4, !dbg !75
  %11 = load i32*, i32** %data, align 8, !dbg !76
  call void @printWLine(i32* noundef %11), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_good() #0 !dbg !79 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_good(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_bad(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay, i32** %data, align 8, !dbg !109
  %0 = load i32*, i32** %data, align 8, !dbg !110
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !113
  %1 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !121, metadata !DIExpression()), !dbg !122
  %3 = load i32*, i32** %data, align 8, !dbg !123
  %call1 = call i64 @wcslen(i32* noundef %3), !dbg !124
  store i64 %call1, i64* %dataLen, align 8, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !129
  %5 = load i64, i64* %dataLen, align 8, !dbg !131
  %cmp = icmp ult i64 %4, %5, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !134
  %7 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !134
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !134
  %9 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !138
  store i32 %8, i32* %arrayidx3, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %10, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !145
  store i32 0, i32* %arrayidx4, align 4, !dbg !146
  %11 = load i32*, i32** %data, align 8, !dbg !147
  call void @printWLine(i32* noundef %11), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !155
  store i32* %arraydecay, i32** %data, align 8, !dbg !156
  %0 = load i32*, i32** %data, align 8, !dbg !157
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !160
  %1 = load i32*, i32** %data, align 8, !dbg !161
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !161
  store i32 0, i32* %arrayidx, align 4, !dbg !162
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !163, metadata !DIExpression()), !dbg !165
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !165
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !165
  call void @llvm.dbg.declare(metadata i64* %i, metadata !166, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !168, metadata !DIExpression()), !dbg !169
  %3 = load i32*, i32** %data, align 8, !dbg !170
  %call1 = call i64 @wcslen(i32* noundef %3), !dbg !171
  store i64 %call1, i64* %dataLen, align 8, !dbg !172
  store i64 0, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !176
  %5 = load i64, i64* %dataLen, align 8, !dbg !178
  %cmp = icmp ult i64 %4, %5, !dbg !179
  br i1 %cmp, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !181
  %7 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !181
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !181
  %9 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !185
  store i32 %8, i32* %arrayidx3, align 4, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !188
  %inc = add i64 %10, 1, !dbg !188
  store i64 %inc, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !192
  store i32 0, i32* %arrayidx4, align 4, !dbg !193
  %11 = load i32*, i32** %data, align 8, !dbg !194
  call void @printWLine(i32* noundef %11), !dbg !195
  ret void, !dbg !196
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 32, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 33, column: 13, scope: !11)
!29 = !DILocation(line: 34, column: 12, scope: !11)
!30 = !DILocation(line: 34, column: 10, scope: !11)
!31 = !DILocation(line: 38, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !12, line: 36, column: 5)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 8)
!34 = !DILocation(line: 38, column: 9, scope: !32)
!35 = !DILocation(line: 39, column: 9, scope: !32)
!36 = !DILocation(line: 39, column: 21, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 42, type: !39)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 42, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !12, line: 43, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !47)
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 43, column: 16, scope: !38)
!49 = !DILocalVariable(name: "dataLen", scope: !38, file: !12, line: 43, type: !44)
!50 = !DILocation(line: 43, column: 19, scope: !38)
!51 = !DILocation(line: 44, column: 26, scope: !38)
!52 = !DILocation(line: 44, column: 19, scope: !38)
!53 = !DILocation(line: 44, column: 17, scope: !38)
!54 = !DILocation(line: 46, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !38, file: !12, line: 46, column: 9)
!56 = !DILocation(line: 46, column: 14, scope: !55)
!57 = !DILocation(line: 46, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 46, column: 9)
!59 = !DILocation(line: 46, column: 25, scope: !58)
!60 = !DILocation(line: 46, column: 23, scope: !58)
!61 = !DILocation(line: 46, column: 9, scope: !55)
!62 = !DILocation(line: 48, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !12, line: 47, column: 9)
!64 = !DILocation(line: 48, column: 28, scope: !63)
!65 = !DILocation(line: 48, column: 18, scope: !63)
!66 = !DILocation(line: 48, column: 13, scope: !63)
!67 = !DILocation(line: 48, column: 21, scope: !63)
!68 = !DILocation(line: 49, column: 9, scope: !63)
!69 = !DILocation(line: 46, column: 35, scope: !58)
!70 = !DILocation(line: 46, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 49, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 50, column: 9, scope: !38)
!75 = !DILocation(line: 50, column: 20, scope: !38)
!76 = !DILocation(line: 51, column: 20, scope: !38)
!77 = !DILocation(line: 51, column: 9, scope: !38)
!78 = !DILocation(line: 53, column: 1, scope: !11)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_good", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!80 = !DILocation(line: 118, column: 5, scope: !79)
!81 = !DILocation(line: 119, column: 5, scope: !79)
!82 = !DILocation(line: 120, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 132, type: !84, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DISubroutineType(types: !85)
!85 = !{!22, !22, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !12, line: 132, type: !22)
!90 = !DILocation(line: 132, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !12, line: 132, type: !86)
!92 = !DILocation(line: 132, column: 27, scope: !83)
!93 = !DILocation(line: 135, column: 22, scope: !83)
!94 = !DILocation(line: 135, column: 12, scope: !83)
!95 = !DILocation(line: 135, column: 5, scope: !83)
!96 = !DILocation(line: 137, column: 5, scope: !83)
!97 = !DILocation(line: 138, column: 5, scope: !83)
!98 = !DILocation(line: 139, column: 5, scope: !83)
!99 = !DILocation(line: 142, column: 5, scope: !83)
!100 = !DILocation(line: 143, column: 5, scope: !83)
!101 = !DILocation(line: 144, column: 5, scope: !83)
!102 = !DILocation(line: 146, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 62, type: !17)
!105 = !DILocation(line: 62, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !12, line: 63, type: !25)
!107 = !DILocation(line: 63, column: 13, scope: !103)
!108 = !DILocation(line: 64, column: 12, scope: !103)
!109 = !DILocation(line: 64, column: 10, scope: !103)
!110 = !DILocation(line: 73, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !112, file: !12, line: 71, column: 5)
!112 = distinct !DILexicalBlock(scope: !103, file: !12, line: 65, column: 8)
!113 = !DILocation(line: 73, column: 9, scope: !111)
!114 = !DILocation(line: 74, column: 9, scope: !111)
!115 = !DILocation(line: 74, column: 20, scope: !111)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !12, line: 77, type: !39)
!117 = distinct !DILexicalBlock(scope: !103, file: !12, line: 76, column: 5)
!118 = !DILocation(line: 77, column: 17, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !117, file: !12, line: 78, type: !44)
!120 = !DILocation(line: 78, column: 16, scope: !117)
!121 = !DILocalVariable(name: "dataLen", scope: !117, file: !12, line: 78, type: !44)
!122 = !DILocation(line: 78, column: 19, scope: !117)
!123 = !DILocation(line: 79, column: 26, scope: !117)
!124 = !DILocation(line: 79, column: 19, scope: !117)
!125 = !DILocation(line: 79, column: 17, scope: !117)
!126 = !DILocation(line: 81, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !117, file: !12, line: 81, column: 9)
!128 = !DILocation(line: 81, column: 14, scope: !127)
!129 = !DILocation(line: 81, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 81, column: 9)
!131 = !DILocation(line: 81, column: 25, scope: !130)
!132 = !DILocation(line: 81, column: 23, scope: !130)
!133 = !DILocation(line: 81, column: 9, scope: !127)
!134 = !DILocation(line: 83, column: 23, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !12, line: 82, column: 9)
!136 = !DILocation(line: 83, column: 28, scope: !135)
!137 = !DILocation(line: 83, column: 18, scope: !135)
!138 = !DILocation(line: 83, column: 13, scope: !135)
!139 = !DILocation(line: 83, column: 21, scope: !135)
!140 = !DILocation(line: 84, column: 9, scope: !135)
!141 = !DILocation(line: 81, column: 35, scope: !130)
!142 = !DILocation(line: 81, column: 9, scope: !130)
!143 = distinct !{!143, !133, !144, !73}
!144 = !DILocation(line: 84, column: 9, scope: !127)
!145 = !DILocation(line: 85, column: 9, scope: !117)
!146 = !DILocation(line: 85, column: 20, scope: !117)
!147 = !DILocation(line: 86, column: 20, scope: !117)
!148 = !DILocation(line: 86, column: 9, scope: !117)
!149 = !DILocation(line: 88, column: 1, scope: !103)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!151 = !DILocalVariable(name: "data", scope: !150, file: !12, line: 93, type: !17)
!152 = !DILocation(line: 93, column: 15, scope: !150)
!153 = !DILocalVariable(name: "dataBuffer", scope: !150, file: !12, line: 94, type: !25)
!154 = !DILocation(line: 94, column: 13, scope: !150)
!155 = !DILocation(line: 95, column: 12, scope: !150)
!156 = !DILocation(line: 95, column: 10, scope: !150)
!157 = !DILocation(line: 99, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !159, file: !12, line: 97, column: 5)
!159 = distinct !DILexicalBlock(scope: !150, file: !12, line: 96, column: 8)
!160 = !DILocation(line: 99, column: 9, scope: !158)
!161 = !DILocation(line: 100, column: 9, scope: !158)
!162 = !DILocation(line: 100, column: 20, scope: !158)
!163 = !DILocalVariable(name: "dest", scope: !164, file: !12, line: 103, type: !39)
!164 = distinct !DILexicalBlock(scope: !150, file: !12, line: 102, column: 5)
!165 = !DILocation(line: 103, column: 17, scope: !164)
!166 = !DILocalVariable(name: "i", scope: !164, file: !12, line: 104, type: !44)
!167 = !DILocation(line: 104, column: 16, scope: !164)
!168 = !DILocalVariable(name: "dataLen", scope: !164, file: !12, line: 104, type: !44)
!169 = !DILocation(line: 104, column: 19, scope: !164)
!170 = !DILocation(line: 105, column: 26, scope: !164)
!171 = !DILocation(line: 105, column: 19, scope: !164)
!172 = !DILocation(line: 105, column: 17, scope: !164)
!173 = !DILocation(line: 107, column: 16, scope: !174)
!174 = distinct !DILexicalBlock(scope: !164, file: !12, line: 107, column: 9)
!175 = !DILocation(line: 107, column: 14, scope: !174)
!176 = !DILocation(line: 107, column: 21, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !12, line: 107, column: 9)
!178 = !DILocation(line: 107, column: 25, scope: !177)
!179 = !DILocation(line: 107, column: 23, scope: !177)
!180 = !DILocation(line: 107, column: 9, scope: !174)
!181 = !DILocation(line: 109, column: 23, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !12, line: 108, column: 9)
!183 = !DILocation(line: 109, column: 28, scope: !182)
!184 = !DILocation(line: 109, column: 18, scope: !182)
!185 = !DILocation(line: 109, column: 13, scope: !182)
!186 = !DILocation(line: 109, column: 21, scope: !182)
!187 = !DILocation(line: 110, column: 9, scope: !182)
!188 = !DILocation(line: 107, column: 35, scope: !177)
!189 = !DILocation(line: 107, column: 9, scope: !177)
!190 = distinct !{!190, !180, !191, !73}
!191 = !DILocation(line: 110, column: 9, scope: !174)
!192 = !DILocation(line: 111, column: 9, scope: !164)
!193 = !DILocation(line: 111, column: 20, scope: !164)
!194 = !DILocation(line: 112, column: 20, scope: !164)
!195 = !DILocation(line: 112, column: 9, scope: !164)
!196 = !DILocation(line: 114, column: 1, scope: !150)
