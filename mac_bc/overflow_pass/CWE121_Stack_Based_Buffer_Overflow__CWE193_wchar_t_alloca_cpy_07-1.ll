; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 40, align 16, !dbg !29
  %1 = bitcast i8* %0 to i32*, !dbg !30
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = alloca i8, i64 44, align 16, !dbg !33
  %3 = bitcast i8* %2 to i32*, !dbg !34
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !32
  %4 = load i32, i32* @staticFive, align 4, !dbg !35
  %cmp = icmp eq i32 %4, 5, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  store i32* %5, i32** %data, align 8, !dbg !41
  %6 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07_bad.source to i8*), i64 44, i1 false), !dbg !50
  %8 = load i32*, i32** %data, align 8, !dbg !51
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !52
  %call = call i32* @wcscpy(i32* noundef %8, i32* noundef %arraydecay), !dbg !53
  %9 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* noundef %9), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32* @wcscpy(i32* noundef, i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* noundef null), !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 noundef %conv), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 40, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = alloca i8, i64 44, align 16, !dbg !90
  %3 = bitcast i8* %2 to i32*, !dbg !91
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !89
  %4 = load i32, i32* @staticFive, align 4, !dbg !92
  %cmp = icmp ne i32 %4, 5, !dbg !94
  br i1 %cmp, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end, !dbg !98

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !99
  store i32* %5, i32** %data, align 8, !dbg !101
  %6 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !106
  %8 = load i32*, i32** %data, align 8, !dbg !107
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !108
  %call = call i32* @wcscpy(i32* noundef %8, i32* noundef %arraydecay), !dbg !109
  %9 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* noundef %9), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 40, align 16, !dbg !118
  %1 = bitcast i8* %0 to i32*, !dbg !119
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %2 = alloca i8, i64 44, align 16, !dbg !122
  %3 = bitcast i8* %2 to i32*, !dbg !123
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !121
  %4 = load i32, i32* @staticFive, align 4, !dbg !124
  %cmp = icmp eq i32 %4, 5, !dbg !126
  br i1 %cmp, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !128
  store i32* %5, i32** %data, align 8, !dbg !130
  %6 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  br label %if.end, !dbg !133

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !134, metadata !DIExpression()), !dbg !136
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !136
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !136
  %8 = load i32*, i32** %data, align 8, !dbg !137
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !138
  %call = call i32* @wcscpy(i32* noundef %8, i32* noundef %arraydecay), !dbg !139
  %9 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* noundef %9), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 30, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"Homebrew clang version 14.0.6"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07_bad", scope: !13, file: !13, line: 34, type: !22, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 36, type: !5)
!26 = !DILocation(line: 36, column: 15, scope: !21)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !13, line: 37, type: !5)
!28 = !DILocation(line: 37, column: 15, scope: !21)
!29 = !DILocation(line: 37, column: 42, scope: !21)
!30 = !DILocation(line: 37, column: 31, scope: !21)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !13, line: 38, type: !5)
!32 = !DILocation(line: 38, column: 15, scope: !21)
!33 = !DILocation(line: 38, column: 43, scope: !21)
!34 = !DILocation(line: 38, column: 32, scope: !21)
!35 = !DILocation(line: 39, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !21, file: !13, line: 39, column: 8)
!37 = !DILocation(line: 39, column: 18, scope: !36)
!38 = !DILocation(line: 39, column: 8, scope: !21)
!39 = !DILocation(line: 43, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !13, line: 40, column: 5)
!41 = !DILocation(line: 43, column: 14, scope: !40)
!42 = !DILocation(line: 44, column: 9, scope: !40)
!43 = !DILocation(line: 44, column: 17, scope: !40)
!44 = !DILocation(line: 45, column: 5, scope: !40)
!45 = !DILocalVariable(name: "source", scope: !46, file: !13, line: 47, type: !47)
!46 = distinct !DILexicalBlock(scope: !21, file: !13, line: 46, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 352, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 11)
!50 = !DILocation(line: 47, column: 17, scope: !46)
!51 = !DILocation(line: 49, column: 16, scope: !46)
!52 = !DILocation(line: 49, column: 22, scope: !46)
!53 = !DILocation(line: 49, column: 9, scope: !46)
!54 = !DILocation(line: 50, column: 20, scope: !46)
!55 = !DILocation(line: 50, column: 9, scope: !46)
!56 = !DILocation(line: 52, column: 1, scope: !21)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_07_good", scope: !13, file: !13, line: 105, type: !22, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!58 = !DILocation(line: 107, column: 5, scope: !57)
!59 = !DILocation(line: 108, column: 5, scope: !57)
!60 = !DILocation(line: 109, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 121, type: !62, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!62 = !DISubroutineType(types: !63)
!63 = !{!10, !10, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !13, line: 121, type: !10)
!68 = !DILocation(line: 121, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !13, line: 121, type: !64)
!70 = !DILocation(line: 121, column: 27, scope: !61)
!71 = !DILocation(line: 124, column: 22, scope: !61)
!72 = !DILocation(line: 124, column: 12, scope: !61)
!73 = !DILocation(line: 124, column: 5, scope: !61)
!74 = !DILocation(line: 126, column: 5, scope: !61)
!75 = !DILocation(line: 127, column: 5, scope: !61)
!76 = !DILocation(line: 128, column: 5, scope: !61)
!77 = !DILocation(line: 131, column: 5, scope: !61)
!78 = !DILocation(line: 132, column: 5, scope: !61)
!79 = !DILocation(line: 133, column: 5, scope: !61)
!80 = !DILocation(line: 135, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 59, type: !22, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!82 = !DILocalVariable(name: "data", scope: !81, file: !13, line: 61, type: !5)
!83 = !DILocation(line: 61, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !13, line: 62, type: !5)
!85 = !DILocation(line: 62, column: 15, scope: !81)
!86 = !DILocation(line: 62, column: 42, scope: !81)
!87 = !DILocation(line: 62, column: 31, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !13, line: 63, type: !5)
!89 = !DILocation(line: 63, column: 15, scope: !81)
!90 = !DILocation(line: 63, column: 43, scope: !81)
!91 = !DILocation(line: 63, column: 32, scope: !81)
!92 = !DILocation(line: 64, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !13, line: 64, column: 8)
!94 = !DILocation(line: 64, column: 18, scope: !93)
!95 = !DILocation(line: 64, column: 8, scope: !81)
!96 = !DILocation(line: 67, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !13, line: 65, column: 5)
!98 = !DILocation(line: 68, column: 5, scope: !97)
!99 = !DILocation(line: 73, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !13, line: 70, column: 5)
!101 = !DILocation(line: 73, column: 14, scope: !100)
!102 = !DILocation(line: 74, column: 9, scope: !100)
!103 = !DILocation(line: 74, column: 17, scope: !100)
!104 = !DILocalVariable(name: "source", scope: !105, file: !13, line: 77, type: !47)
!105 = distinct !DILexicalBlock(scope: !81, file: !13, line: 76, column: 5)
!106 = !DILocation(line: 77, column: 17, scope: !105)
!107 = !DILocation(line: 79, column: 16, scope: !105)
!108 = !DILocation(line: 79, column: 22, scope: !105)
!109 = !DILocation(line: 79, column: 9, scope: !105)
!110 = !DILocation(line: 80, column: 20, scope: !105)
!111 = !DILocation(line: 80, column: 9, scope: !105)
!112 = !DILocation(line: 82, column: 1, scope: !81)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 85, type: !22, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!114 = !DILocalVariable(name: "data", scope: !113, file: !13, line: 87, type: !5)
!115 = !DILocation(line: 87, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !13, line: 88, type: !5)
!117 = !DILocation(line: 88, column: 15, scope: !113)
!118 = !DILocation(line: 88, column: 42, scope: !113)
!119 = !DILocation(line: 88, column: 31, scope: !113)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !13, line: 89, type: !5)
!121 = !DILocation(line: 89, column: 15, scope: !113)
!122 = !DILocation(line: 89, column: 43, scope: !113)
!123 = !DILocation(line: 89, column: 32, scope: !113)
!124 = !DILocation(line: 90, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !113, file: !13, line: 90, column: 8)
!126 = !DILocation(line: 90, column: 18, scope: !125)
!127 = !DILocation(line: 90, column: 8, scope: !113)
!128 = !DILocation(line: 94, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !13, line: 91, column: 5)
!130 = !DILocation(line: 94, column: 14, scope: !129)
!131 = !DILocation(line: 95, column: 9, scope: !129)
!132 = !DILocation(line: 95, column: 17, scope: !129)
!133 = !DILocation(line: 96, column: 5, scope: !129)
!134 = !DILocalVariable(name: "source", scope: !135, file: !13, line: 98, type: !47)
!135 = distinct !DILexicalBlock(scope: !113, file: !13, line: 97, column: 5)
!136 = !DILocation(line: 98, column: 17, scope: !135)
!137 = !DILocation(line: 100, column: 16, scope: !135)
!138 = !DILocation(line: 100, column: 22, scope: !135)
!139 = !DILocation(line: 100, column: 9, scope: !135)
!140 = !DILocation(line: 101, column: 20, scope: !135)
!141 = !DILocation(line: 101, column: 9, scope: !135)
!142 = !DILocation(line: 103, column: 1, scope: !113)
