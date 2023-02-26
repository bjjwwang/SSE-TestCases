; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 400, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBuffer, align 8, !dbg !30
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  store i32* %2, i32** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !35, metadata !DIExpression()), !dbg !37
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !38
  %4 = load i32*, i32** %3, align 8, !dbg !39
  store i32* %4, i32** %data1, align 8, !dbg !37
  %5 = load i32*, i32** %data1, align 8, !dbg !40
  %call = call i32* @wmemset(i32* noundef %5, i32 noundef 65, i64 noundef 99), !dbg !41
  %6 = load i32*, i32** %data1, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %7 = load i32*, i32** %data1, align 8, !dbg !44
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !45
  store i32* %7, i32** %8, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !47, metadata !DIExpression()), !dbg !49
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !50
  %10 = load i32*, i32** %9, align 8, !dbg !51
  store i32* %10, i32** %data2, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !52, metadata !DIExpression()), !dbg !57
  %11 = bitcast [50 x i32]* %dest to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 200, i1 false), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %i, metadata !58, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !64, metadata !DIExpression()), !dbg !65
  %12 = load i32*, i32** %data2, align 8, !dbg !66
  %call3 = call i64 @wcslen(i32* noundef %12), !dbg !67
  store i64 %call3, i64* %dataLen, align 8, !dbg !68
  store i64 0, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i64, i64* %i, align 8, !dbg !72
  %14 = load i64, i64* %dataLen, align 8, !dbg !74
  %cmp = icmp ult i64 %13, %14, !dbg !75
  br i1 %cmp, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !77
  %16 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx4 = getelementptr inbounds i32, i32* %15, i64 %16, !dbg !77
  %17 = load i32, i32* %arrayidx4, align 4, !dbg !77
  %18 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %18, !dbg !81
  store i32 %17, i32* %arrayidx5, align 4, !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !84
  %inc = add i64 %19, 1, !dbg !84
  store i64 %inc, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !85, !llvm.loop !86

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !89
  store i32 0, i32* %arrayidx6, align 4, !dbg !90
  %20 = load i32*, i32** %data2, align 8, !dbg !91
  call void @printWLine(i32* noundef %20), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_good() #0 !dbg !94 {
entry:
  call void @goodG2B(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* noundef null), !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 noundef %conv), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_good(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_bad(), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !120, metadata !DIExpression()), !dbg !121
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !122, metadata !DIExpression()), !dbg !123
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = alloca i8, i64 400, align 16, !dbg !126
  %1 = bitcast i8* %0 to i32*, !dbg !127
  store i32* %1, i32** %dataBuffer, align 8, !dbg !125
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  store i32* %2, i32** %data, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !130, metadata !DIExpression()), !dbg !132
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !133
  %4 = load i32*, i32** %3, align 8, !dbg !134
  store i32* %4, i32** %data1, align 8, !dbg !132
  %5 = load i32*, i32** %data1, align 8, !dbg !135
  %call = call i32* @wmemset(i32* noundef %5, i32 noundef 65, i64 noundef 49), !dbg !136
  %6 = load i32*, i32** %data1, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 49, !dbg !137
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  %7 = load i32*, i32** %data1, align 8, !dbg !139
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !140
  store i32* %7, i32** %8, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !142, metadata !DIExpression()), !dbg !144
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !145
  %10 = load i32*, i32** %9, align 8, !dbg !146
  store i32* %10, i32** %data2, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !147, metadata !DIExpression()), !dbg !149
  %11 = bitcast [50 x i32]* %dest to i8*, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 200, i1 false), !dbg !149
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !152, metadata !DIExpression()), !dbg !153
  %12 = load i32*, i32** %data2, align 8, !dbg !154
  %call3 = call i64 @wcslen(i32* noundef %12), !dbg !155
  store i64 %call3, i64* %dataLen, align 8, !dbg !156
  store i64 0, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i64, i64* %i, align 8, !dbg !160
  %14 = load i64, i64* %dataLen, align 8, !dbg !162
  %cmp = icmp ult i64 %13, %14, !dbg !163
  br i1 %cmp, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !165
  %16 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx4 = getelementptr inbounds i32, i32* %15, i64 %16, !dbg !165
  %17 = load i32, i32* %arrayidx4, align 4, !dbg !165
  %18 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %18, !dbg !169
  store i32 %17, i32* %arrayidx5, align 4, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %19, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !176
  store i32 0, i32* %arrayidx6, align 4, !dbg !177
  %20 = load i32*, i32** %data2, align 8, !dbg !178
  call void @printWLine(i32* noundef %20), !dbg !179
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataPtr1", scope: !17, file: !18, line: 26, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!26 = !DILocation(line: 26, column: 16, scope: !17)
!27 = !DILocalVariable(name: "dataPtr2", scope: !17, file: !18, line: 27, type: !25)
!28 = !DILocation(line: 27, column: 16, scope: !17)
!29 = !DILocalVariable(name: "dataBuffer", scope: !17, file: !18, line: 28, type: !3)
!30 = !DILocation(line: 28, column: 15, scope: !17)
!31 = !DILocation(line: 28, column: 39, scope: !17)
!32 = !DILocation(line: 28, column: 28, scope: !17)
!33 = !DILocation(line: 29, column: 12, scope: !17)
!34 = !DILocation(line: 29, column: 10, scope: !17)
!35 = !DILocalVariable(name: "data", scope: !36, file: !18, line: 31, type: !3)
!36 = distinct !DILexicalBlock(scope: !17, file: !18, line: 30, column: 5)
!37 = !DILocation(line: 31, column: 19, scope: !36)
!38 = !DILocation(line: 31, column: 27, scope: !36)
!39 = !DILocation(line: 31, column: 26, scope: !36)
!40 = !DILocation(line: 33, column: 17, scope: !36)
!41 = !DILocation(line: 33, column: 9, scope: !36)
!42 = !DILocation(line: 34, column: 9, scope: !36)
!43 = !DILocation(line: 34, column: 21, scope: !36)
!44 = !DILocation(line: 35, column: 21, scope: !36)
!45 = !DILocation(line: 35, column: 10, scope: !36)
!46 = !DILocation(line: 35, column: 19, scope: !36)
!47 = !DILocalVariable(name: "data", scope: !48, file: !18, line: 38, type: !3)
!48 = distinct !DILexicalBlock(scope: !17, file: !18, line: 37, column: 5)
!49 = !DILocation(line: 38, column: 19, scope: !48)
!50 = !DILocation(line: 38, column: 27, scope: !48)
!51 = !DILocation(line: 38, column: 26, scope: !48)
!52 = !DILocalVariable(name: "dest", scope: !53, file: !18, line: 40, type: !54)
!53 = distinct !DILexicalBlock(scope: !48, file: !18, line: 39, column: 9)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 50)
!57 = !DILocation(line: 40, column: 21, scope: !53)
!58 = !DILocalVariable(name: "i", scope: !53, file: !18, line: 41, type: !59)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !60, line: 31, baseType: !61)
!60 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !62)
!62 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!63 = !DILocation(line: 41, column: 20, scope: !53)
!64 = !DILocalVariable(name: "dataLen", scope: !53, file: !18, line: 41, type: !59)
!65 = !DILocation(line: 41, column: 23, scope: !53)
!66 = !DILocation(line: 42, column: 30, scope: !53)
!67 = !DILocation(line: 42, column: 23, scope: !53)
!68 = !DILocation(line: 42, column: 21, scope: !53)
!69 = !DILocation(line: 44, column: 20, scope: !70)
!70 = distinct !DILexicalBlock(scope: !53, file: !18, line: 44, column: 13)
!71 = !DILocation(line: 44, column: 18, scope: !70)
!72 = !DILocation(line: 44, column: 25, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !18, line: 44, column: 13)
!74 = !DILocation(line: 44, column: 29, scope: !73)
!75 = !DILocation(line: 44, column: 27, scope: !73)
!76 = !DILocation(line: 44, column: 13, scope: !70)
!77 = !DILocation(line: 46, column: 27, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !18, line: 45, column: 13)
!79 = !DILocation(line: 46, column: 32, scope: !78)
!80 = !DILocation(line: 46, column: 22, scope: !78)
!81 = !DILocation(line: 46, column: 17, scope: !78)
!82 = !DILocation(line: 46, column: 25, scope: !78)
!83 = !DILocation(line: 47, column: 13, scope: !78)
!84 = !DILocation(line: 44, column: 39, scope: !73)
!85 = !DILocation(line: 44, column: 13, scope: !73)
!86 = distinct !{!86, !76, !87, !88}
!87 = !DILocation(line: 47, column: 13, scope: !70)
!88 = !{!"llvm.loop.mustprogress"}
!89 = !DILocation(line: 48, column: 13, scope: !53)
!90 = !DILocation(line: 48, column: 24, scope: !53)
!91 = !DILocation(line: 49, column: 24, scope: !53)
!92 = !DILocation(line: 49, column: 13, scope: !53)
!93 = !DILocation(line: 52, column: 1, scope: !17)
!94 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_good", scope: !18, file: !18, line: 90, type: !19, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!95 = !DILocation(line: 92, column: 5, scope: !94)
!96 = !DILocation(line: 93, column: 1, scope: !94)
!97 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 104, type: !98, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!98 = !DISubroutineType(types: !99)
!99 = !{!8, !8, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !18, line: 104, type: !8)
!104 = !DILocation(line: 104, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !18, line: 104, type: !100)
!106 = !DILocation(line: 104, column: 27, scope: !97)
!107 = !DILocation(line: 107, column: 22, scope: !97)
!108 = !DILocation(line: 107, column: 12, scope: !97)
!109 = !DILocation(line: 107, column: 5, scope: !97)
!110 = !DILocation(line: 109, column: 5, scope: !97)
!111 = !DILocation(line: 110, column: 5, scope: !97)
!112 = !DILocation(line: 111, column: 5, scope: !97)
!113 = !DILocation(line: 114, column: 5, scope: !97)
!114 = !DILocation(line: 115, column: 5, scope: !97)
!115 = !DILocation(line: 116, column: 5, scope: !97)
!116 = !DILocation(line: 118, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 59, type: !19, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!118 = !DILocalVariable(name: "data", scope: !117, file: !18, line: 61, type: !3)
!119 = !DILocation(line: 61, column: 15, scope: !117)
!120 = !DILocalVariable(name: "dataPtr1", scope: !117, file: !18, line: 62, type: !25)
!121 = !DILocation(line: 62, column: 16, scope: !117)
!122 = !DILocalVariable(name: "dataPtr2", scope: !117, file: !18, line: 63, type: !25)
!123 = !DILocation(line: 63, column: 16, scope: !117)
!124 = !DILocalVariable(name: "dataBuffer", scope: !117, file: !18, line: 64, type: !3)
!125 = !DILocation(line: 64, column: 15, scope: !117)
!126 = !DILocation(line: 64, column: 39, scope: !117)
!127 = !DILocation(line: 64, column: 28, scope: !117)
!128 = !DILocation(line: 65, column: 12, scope: !117)
!129 = !DILocation(line: 65, column: 10, scope: !117)
!130 = !DILocalVariable(name: "data", scope: !131, file: !18, line: 67, type: !3)
!131 = distinct !DILexicalBlock(scope: !117, file: !18, line: 66, column: 5)
!132 = !DILocation(line: 67, column: 19, scope: !131)
!133 = !DILocation(line: 67, column: 27, scope: !131)
!134 = !DILocation(line: 67, column: 26, scope: !131)
!135 = !DILocation(line: 69, column: 17, scope: !131)
!136 = !DILocation(line: 69, column: 9, scope: !131)
!137 = !DILocation(line: 70, column: 9, scope: !131)
!138 = !DILocation(line: 70, column: 20, scope: !131)
!139 = !DILocation(line: 71, column: 21, scope: !131)
!140 = !DILocation(line: 71, column: 10, scope: !131)
!141 = !DILocation(line: 71, column: 19, scope: !131)
!142 = !DILocalVariable(name: "data", scope: !143, file: !18, line: 74, type: !3)
!143 = distinct !DILexicalBlock(scope: !117, file: !18, line: 73, column: 5)
!144 = !DILocation(line: 74, column: 19, scope: !143)
!145 = !DILocation(line: 74, column: 27, scope: !143)
!146 = !DILocation(line: 74, column: 26, scope: !143)
!147 = !DILocalVariable(name: "dest", scope: !148, file: !18, line: 76, type: !54)
!148 = distinct !DILexicalBlock(scope: !143, file: !18, line: 75, column: 9)
!149 = !DILocation(line: 76, column: 21, scope: !148)
!150 = !DILocalVariable(name: "i", scope: !148, file: !18, line: 77, type: !59)
!151 = !DILocation(line: 77, column: 20, scope: !148)
!152 = !DILocalVariable(name: "dataLen", scope: !148, file: !18, line: 77, type: !59)
!153 = !DILocation(line: 77, column: 23, scope: !148)
!154 = !DILocation(line: 78, column: 30, scope: !148)
!155 = !DILocation(line: 78, column: 23, scope: !148)
!156 = !DILocation(line: 78, column: 21, scope: !148)
!157 = !DILocation(line: 80, column: 20, scope: !158)
!158 = distinct !DILexicalBlock(scope: !148, file: !18, line: 80, column: 13)
!159 = !DILocation(line: 80, column: 18, scope: !158)
!160 = !DILocation(line: 80, column: 25, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !18, line: 80, column: 13)
!162 = !DILocation(line: 80, column: 29, scope: !161)
!163 = !DILocation(line: 80, column: 27, scope: !161)
!164 = !DILocation(line: 80, column: 13, scope: !158)
!165 = !DILocation(line: 82, column: 27, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !18, line: 81, column: 13)
!167 = !DILocation(line: 82, column: 32, scope: !166)
!168 = !DILocation(line: 82, column: 22, scope: !166)
!169 = !DILocation(line: 82, column: 17, scope: !166)
!170 = !DILocation(line: 82, column: 25, scope: !166)
!171 = !DILocation(line: 83, column: 13, scope: !166)
!172 = !DILocation(line: 80, column: 39, scope: !161)
!173 = !DILocation(line: 80, column: 13, scope: !161)
!174 = distinct !{!174, !164, !175, !88}
!175 = !DILocation(line: 83, column: 13, scope: !158)
!176 = !DILocation(line: 84, column: 13, scope: !148)
!177 = !DILocation(line: 84, column: 24, scope: !148)
!178 = !DILocation(line: 85, column: 24, scope: !148)
!179 = !DILocation(line: 85, column: 13, scope: !148)
!180 = !DILocation(line: 88, column: 1, scope: !117)
