; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 40, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 44, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32, i32* @globalFive, align 4, !dbg !32
  %cmp = icmp eq i32 %4, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %5, i32** %data, align 8, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_bad.source to i8*), i64 44, i1 false), !dbg !47
  %8 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %call = call i32* @wcscpy(i32* noundef %8, i32* noundef %arraydecay), !dbg !50
  %9 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* noundef %9), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32* @wcscpy(i32* noundef, i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* noundef null), !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 noundef %conv), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 40, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %2 = alloca i8, i64 44, align 16, !dbg !87
  %3 = bitcast i8* %2 to i32*, !dbg !88
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !86
  %4 = load i32, i32* @globalFive, align 4, !dbg !89
  %cmp = icmp ne i32 %4, 5, !dbg !91
  br i1 %cmp, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !96
  store i32* %5, i32** %data, align 8, !dbg !98
  %6 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !103
  %8 = load i32*, i32** %data, align 8, !dbg !104
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !105
  %call = call i32* @wcscpy(i32* noundef %8, i32* noundef %arraydecay), !dbg !106
  %9 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* noundef %9), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 40, align 16, !dbg !115
  %1 = bitcast i8* %0 to i32*, !dbg !116
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %2 = alloca i8, i64 44, align 16, !dbg !119
  %3 = bitcast i8* %2 to i32*, !dbg !120
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !118
  %4 = load i32, i32* @globalFive, align 4, !dbg !121
  %cmp = icmp eq i32 %4, 5, !dbg !123
  br i1 %cmp, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !125
  store i32* %5, i32** %data, align 8, !dbg !127
  %6 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  br label %if.end, !dbg !130

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !133
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !133
  %8 = load i32*, i32** %data, align 8, !dbg !134
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !135
  %call = call i32* @wcscpy(i32* noundef %8, i32* noundef %arraydecay), !dbg !136
  %9 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* noundef %9), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_bad", scope: !18, file: !18, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 33, column: 18, scope: !33)
!35 = !DILocation(line: 33, column: 8, scope: !17)
!36 = !DILocation(line: 37, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !18, line: 34, column: 5)
!38 = !DILocation(line: 37, column: 14, scope: !37)
!39 = !DILocation(line: 38, column: 9, scope: !37)
!40 = !DILocation(line: 38, column: 17, scope: !37)
!41 = !DILocation(line: 39, column: 5, scope: !37)
!42 = !DILocalVariable(name: "source", scope: !43, file: !18, line: 41, type: !44)
!43 = distinct !DILexicalBlock(scope: !17, file: !18, line: 40, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 11)
!47 = !DILocation(line: 41, column: 17, scope: !43)
!48 = !DILocation(line: 43, column: 16, scope: !43)
!49 = !DILocation(line: 43, column: 22, scope: !43)
!50 = !DILocation(line: 43, column: 9, scope: !43)
!51 = !DILocation(line: 44, column: 20, scope: !43)
!52 = !DILocation(line: 44, column: 9, scope: !43)
!53 = !DILocation(line: 46, column: 1, scope: !17)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_14_good", scope: !18, file: !18, line: 99, type: !19, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!55 = !DILocation(line: 101, column: 5, scope: !54)
!56 = !DILocation(line: 102, column: 5, scope: !54)
!57 = !DILocation(line: 103, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 115, type: !59, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!59 = !DISubroutineType(types: !60)
!60 = !{!8, !8, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !18, line: 115, type: !8)
!65 = !DILocation(line: 115, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !18, line: 115, type: !61)
!67 = !DILocation(line: 115, column: 27, scope: !58)
!68 = !DILocation(line: 118, column: 22, scope: !58)
!69 = !DILocation(line: 118, column: 12, scope: !58)
!70 = !DILocation(line: 118, column: 5, scope: !58)
!71 = !DILocation(line: 120, column: 5, scope: !58)
!72 = !DILocation(line: 121, column: 5, scope: !58)
!73 = !DILocation(line: 122, column: 5, scope: !58)
!74 = !DILocation(line: 125, column: 5, scope: !58)
!75 = !DILocation(line: 126, column: 5, scope: !58)
!76 = !DILocation(line: 127, column: 5, scope: !58)
!77 = !DILocation(line: 129, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!79 = !DILocalVariable(name: "data", scope: !78, file: !18, line: 55, type: !3)
!80 = !DILocation(line: 55, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !18, line: 56, type: !3)
!82 = !DILocation(line: 56, column: 15, scope: !78)
!83 = !DILocation(line: 56, column: 42, scope: !78)
!84 = !DILocation(line: 56, column: 31, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !18, line: 57, type: !3)
!86 = !DILocation(line: 57, column: 15, scope: !78)
!87 = !DILocation(line: 57, column: 43, scope: !78)
!88 = !DILocation(line: 57, column: 32, scope: !78)
!89 = !DILocation(line: 58, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !18, line: 58, column: 8)
!91 = !DILocation(line: 58, column: 18, scope: !90)
!92 = !DILocation(line: 58, column: 8, scope: !78)
!93 = !DILocation(line: 61, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !18, line: 59, column: 5)
!95 = !DILocation(line: 62, column: 5, scope: !94)
!96 = !DILocation(line: 67, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !18, line: 64, column: 5)
!98 = !DILocation(line: 67, column: 14, scope: !97)
!99 = !DILocation(line: 68, column: 9, scope: !97)
!100 = !DILocation(line: 68, column: 17, scope: !97)
!101 = !DILocalVariable(name: "source", scope: !102, file: !18, line: 71, type: !44)
!102 = distinct !DILexicalBlock(scope: !78, file: !18, line: 70, column: 5)
!103 = !DILocation(line: 71, column: 17, scope: !102)
!104 = !DILocation(line: 73, column: 16, scope: !102)
!105 = !DILocation(line: 73, column: 22, scope: !102)
!106 = !DILocation(line: 73, column: 9, scope: !102)
!107 = !DILocation(line: 74, column: 20, scope: !102)
!108 = !DILocation(line: 74, column: 9, scope: !102)
!109 = !DILocation(line: 76, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!111 = !DILocalVariable(name: "data", scope: !110, file: !18, line: 81, type: !3)
!112 = !DILocation(line: 81, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !18, line: 82, type: !3)
!114 = !DILocation(line: 82, column: 15, scope: !110)
!115 = !DILocation(line: 82, column: 42, scope: !110)
!116 = !DILocation(line: 82, column: 31, scope: !110)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !18, line: 83, type: !3)
!118 = !DILocation(line: 83, column: 15, scope: !110)
!119 = !DILocation(line: 83, column: 43, scope: !110)
!120 = !DILocation(line: 83, column: 32, scope: !110)
!121 = !DILocation(line: 84, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !110, file: !18, line: 84, column: 8)
!123 = !DILocation(line: 84, column: 18, scope: !122)
!124 = !DILocation(line: 84, column: 8, scope: !110)
!125 = !DILocation(line: 88, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !18, line: 85, column: 5)
!127 = !DILocation(line: 88, column: 14, scope: !126)
!128 = !DILocation(line: 89, column: 9, scope: !126)
!129 = !DILocation(line: 89, column: 17, scope: !126)
!130 = !DILocation(line: 90, column: 5, scope: !126)
!131 = !DILocalVariable(name: "source", scope: !132, file: !18, line: 92, type: !44)
!132 = distinct !DILexicalBlock(scope: !110, file: !18, line: 91, column: 5)
!133 = !DILocation(line: 92, column: 17, scope: !132)
!134 = !DILocation(line: 94, column: 16, scope: !132)
!135 = !DILocation(line: 94, column: 22, scope: !132)
!136 = !DILocation(line: 94, column: 9, scope: !132)
!137 = !DILocation(line: 95, column: 20, scope: !132)
!138 = !DILocation(line: 95, column: 9, scope: !132)
!139 = !DILocation(line: 97, column: 1, scope: !110)
