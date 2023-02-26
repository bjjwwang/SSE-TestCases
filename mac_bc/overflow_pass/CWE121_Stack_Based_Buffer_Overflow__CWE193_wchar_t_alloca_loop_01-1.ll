; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_bad() #0 !dbg !17 {
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
  store i32* %4, i32** %data, align 8, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_bad.source to i8*), i64 44, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !51
  store i64 %call, i64* %sourceLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !56
  %8 = load i64, i64* %sourceLen, align 8, !dbg !58
  %add = add i64 %8, 1, !dbg !59
  %cmp = icmp ult i64 %7, %add, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !64
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !64
  %11 = load i32*, i32** %data, align 8, !dbg !65
  %12 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !65
  store i32 %10, i32* %arrayidx2, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %13, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !74
  call void @printWLine(i32* noundef %14), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @wcslen(i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* noundef null), !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 noundef %conv), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_good(), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_bad(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 40, align 16, !dbg !105
  %1 = bitcast i8* %0 to i32*, !dbg !106
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %2 = alloca i8, i64 44, align 16, !dbg !109
  %3 = bitcast i8* %2 to i32*, !dbg !110
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !108
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !111
  store i32* %4, i32** %data, align 8, !dbg !112
  %5 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !122
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !123
  store i64 %call, i64* %sourceLen, align 8, !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !128
  %8 = load i64, i64* %sourceLen, align 8, !dbg !130
  %add = add i64 %8, 1, !dbg !131
  %cmp = icmp ult i64 %7, %add, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !136
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !136
  %11 = load i32*, i32** %data, align 8, !dbg !137
  %12 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !137
  store i32 %10, i32* %arrayidx2, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %13, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !145
  call void @printWLine(i32* noundef %14), !dbg !146
  ret void, !dbg !147
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_bad", scope: !18, file: !18, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = !DILocation(line: 35, column: 12, scope: !17)
!33 = !DILocation(line: 35, column: 10, scope: !17)
!34 = !DILocation(line: 36, column: 5, scope: !17)
!35 = !DILocation(line: 36, column: 13, scope: !17)
!36 = !DILocalVariable(name: "source", scope: !37, file: !18, line: 38, type: !38)
!37 = distinct !DILexicalBlock(scope: !17, file: !18, line: 37, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 11)
!41 = !DILocation(line: 38, column: 17, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !37, file: !18, line: 39, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 31, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !46)
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 39, column: 16, scope: !37)
!48 = !DILocalVariable(name: "sourceLen", scope: !37, file: !18, line: 39, type: !43)
!49 = !DILocation(line: 39, column: 19, scope: !37)
!50 = !DILocation(line: 40, column: 28, scope: !37)
!51 = !DILocation(line: 40, column: 21, scope: !37)
!52 = !DILocation(line: 40, column: 19, scope: !37)
!53 = !DILocation(line: 43, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !37, file: !18, line: 43, column: 9)
!55 = !DILocation(line: 43, column: 14, scope: !54)
!56 = !DILocation(line: 43, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !18, line: 43, column: 9)
!58 = !DILocation(line: 43, column: 25, scope: !57)
!59 = !DILocation(line: 43, column: 35, scope: !57)
!60 = !DILocation(line: 43, column: 23, scope: !57)
!61 = !DILocation(line: 43, column: 9, scope: !54)
!62 = !DILocation(line: 45, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !18, line: 44, column: 9)
!64 = !DILocation(line: 45, column: 23, scope: !63)
!65 = !DILocation(line: 45, column: 13, scope: !63)
!66 = !DILocation(line: 45, column: 18, scope: !63)
!67 = !DILocation(line: 45, column: 21, scope: !63)
!68 = !DILocation(line: 46, column: 9, scope: !63)
!69 = !DILocation(line: 43, column: 41, scope: !57)
!70 = !DILocation(line: 43, column: 9, scope: !57)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 46, column: 9, scope: !54)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 47, column: 20, scope: !37)
!75 = !DILocation(line: 47, column: 9, scope: !37)
!76 = !DILocation(line: 49, column: 1, scope: !17)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_good", scope: !18, file: !18, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!78 = !DILocation(line: 81, column: 5, scope: !77)
!79 = !DILocation(line: 82, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 94, type: !81, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!81 = !DISubroutineType(types: !82)
!82 = !{!8, !8, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !18, line: 94, type: !8)
!87 = !DILocation(line: 94, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !18, line: 94, type: !83)
!89 = !DILocation(line: 94, column: 27, scope: !80)
!90 = !DILocation(line: 97, column: 22, scope: !80)
!91 = !DILocation(line: 97, column: 12, scope: !80)
!92 = !DILocation(line: 97, column: 5, scope: !80)
!93 = !DILocation(line: 99, column: 5, scope: !80)
!94 = !DILocation(line: 100, column: 5, scope: !80)
!95 = !DILocation(line: 101, column: 5, scope: !80)
!96 = !DILocation(line: 104, column: 5, scope: !80)
!97 = !DILocation(line: 105, column: 5, scope: !80)
!98 = !DILocation(line: 106, column: 5, scope: !80)
!99 = !DILocation(line: 108, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 56, type: !19, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!101 = !DILocalVariable(name: "data", scope: !100, file: !18, line: 58, type: !3)
!102 = !DILocation(line: 58, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !18, line: 59, type: !3)
!104 = !DILocation(line: 59, column: 15, scope: !100)
!105 = !DILocation(line: 59, column: 42, scope: !100)
!106 = !DILocation(line: 59, column: 31, scope: !100)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !18, line: 60, type: !3)
!108 = !DILocation(line: 60, column: 15, scope: !100)
!109 = !DILocation(line: 60, column: 43, scope: !100)
!110 = !DILocation(line: 60, column: 32, scope: !100)
!111 = !DILocation(line: 63, column: 12, scope: !100)
!112 = !DILocation(line: 63, column: 10, scope: !100)
!113 = !DILocation(line: 64, column: 5, scope: !100)
!114 = !DILocation(line: 64, column: 13, scope: !100)
!115 = !DILocalVariable(name: "source", scope: !116, file: !18, line: 66, type: !38)
!116 = distinct !DILexicalBlock(scope: !100, file: !18, line: 65, column: 5)
!117 = !DILocation(line: 66, column: 17, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !116, file: !18, line: 67, type: !43)
!119 = !DILocation(line: 67, column: 16, scope: !116)
!120 = !DILocalVariable(name: "sourceLen", scope: !116, file: !18, line: 67, type: !43)
!121 = !DILocation(line: 67, column: 19, scope: !116)
!122 = !DILocation(line: 68, column: 28, scope: !116)
!123 = !DILocation(line: 68, column: 21, scope: !116)
!124 = !DILocation(line: 68, column: 19, scope: !116)
!125 = !DILocation(line: 71, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !116, file: !18, line: 71, column: 9)
!127 = !DILocation(line: 71, column: 14, scope: !126)
!128 = !DILocation(line: 71, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !18, line: 71, column: 9)
!130 = !DILocation(line: 71, column: 25, scope: !129)
!131 = !DILocation(line: 71, column: 35, scope: !129)
!132 = !DILocation(line: 71, column: 23, scope: !129)
!133 = !DILocation(line: 71, column: 9, scope: !126)
!134 = !DILocation(line: 73, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !18, line: 72, column: 9)
!136 = !DILocation(line: 73, column: 23, scope: !135)
!137 = !DILocation(line: 73, column: 13, scope: !135)
!138 = !DILocation(line: 73, column: 18, scope: !135)
!139 = !DILocation(line: 73, column: 21, scope: !135)
!140 = !DILocation(line: 74, column: 9, scope: !135)
!141 = !DILocation(line: 71, column: 41, scope: !129)
!142 = !DILocation(line: 71, column: 9, scope: !129)
!143 = distinct !{!143, !133, !144, !73}
!144 = !DILocation(line: 74, column: 9, scope: !126)
!145 = !DILocation(line: 75, column: 20, scope: !116)
!146 = !DILocation(line: 75, column: 9, scope: !116)
!147 = !DILocation(line: 77, column: 1, scope: !100)
