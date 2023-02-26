; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11_bad() #0 !dbg !17 {
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
  %call = call i32 (...) @globalReturnsTrue(), !dbg !32
  %tobool = icmp ne i32 %call, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  store i32* %4, i32** %data, align 8, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11_bad.source to i8*), i64 44, i1 false), !dbg !46
  %7 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !48
  %call1 = call i32* @wcscpy(i32* noundef %7, i32* noundef %arraydecay), !dbg !49
  %8 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* noundef %8), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i32* @wcscpy(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* noundef null), !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 noundef %conv), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11_good(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11_bad(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 40, align 16, !dbg !82
  %1 = bitcast i8* %0 to i32*, !dbg !83
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %2 = alloca i8, i64 44, align 16, !dbg !86
  %3 = bitcast i8* %2 to i32*, !dbg !87
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !85
  %call = call i32 (...) @globalReturnsFalse(), !dbg !88
  %tobool = icmp ne i32 %call, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !94
  store i32* %4, i32** %data, align 8, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !101
  %7 = load i32*, i32** %data, align 8, !dbg !102
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %call1 = call i32* @wcscpy(i32* noundef %7, i32* noundef %arraydecay), !dbg !104
  %8 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* noundef %8), !dbg !106
  ret void, !dbg !107
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 40, align 16, !dbg !113
  %1 = bitcast i8* %0 to i32*, !dbg !114
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %2 = alloca i8, i64 44, align 16, !dbg !117
  %3 = bitcast i8* %2 to i32*, !dbg !118
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !116
  %call = call i32 (...) @globalReturnsTrue(), !dbg !119
  %tobool = icmp ne i32 %call, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !122
  store i32* %4, i32** %data, align 8, !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !130
  %7 = load i32*, i32** %data, align 8, !dbg !131
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !132
  %call1 = call i32* @wcscpy(i32* noundef %7, i32* noundef %arraydecay), !dbg !133
  %8 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* noundef %8), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11_bad", scope: !18, file: !18, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 33, column: 8, scope: !17)
!35 = !DILocation(line: 37, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !18, line: 34, column: 5)
!37 = !DILocation(line: 37, column: 14, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 17, scope: !36)
!40 = !DILocation(line: 39, column: 5, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !42, file: !18, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !17, file: !18, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 11)
!46 = !DILocation(line: 41, column: 17, scope: !42)
!47 = !DILocation(line: 43, column: 16, scope: !42)
!48 = !DILocation(line: 43, column: 22, scope: !42)
!49 = !DILocation(line: 43, column: 9, scope: !42)
!50 = !DILocation(line: 44, column: 20, scope: !42)
!51 = !DILocation(line: 44, column: 9, scope: !42)
!52 = !DILocation(line: 46, column: 1, scope: !17)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_11_good", scope: !18, file: !18, line: 99, type: !19, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!54 = !DILocation(line: 101, column: 5, scope: !53)
!55 = !DILocation(line: 102, column: 5, scope: !53)
!56 = !DILocation(line: 103, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 115, type: !58, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!58 = !DISubroutineType(types: !59)
!59 = !{!8, !8, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !18, line: 115, type: !8)
!64 = !DILocation(line: 115, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !18, line: 115, type: !60)
!66 = !DILocation(line: 115, column: 27, scope: !57)
!67 = !DILocation(line: 118, column: 22, scope: !57)
!68 = !DILocation(line: 118, column: 12, scope: !57)
!69 = !DILocation(line: 118, column: 5, scope: !57)
!70 = !DILocation(line: 120, column: 5, scope: !57)
!71 = !DILocation(line: 121, column: 5, scope: !57)
!72 = !DILocation(line: 122, column: 5, scope: !57)
!73 = !DILocation(line: 125, column: 5, scope: !57)
!74 = !DILocation(line: 126, column: 5, scope: !57)
!75 = !DILocation(line: 127, column: 5, scope: !57)
!76 = !DILocation(line: 129, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!78 = !DILocalVariable(name: "data", scope: !77, file: !18, line: 55, type: !3)
!79 = !DILocation(line: 55, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !18, line: 56, type: !3)
!81 = !DILocation(line: 56, column: 15, scope: !77)
!82 = !DILocation(line: 56, column: 42, scope: !77)
!83 = !DILocation(line: 56, column: 31, scope: !77)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !18, line: 57, type: !3)
!85 = !DILocation(line: 57, column: 15, scope: !77)
!86 = !DILocation(line: 57, column: 43, scope: !77)
!87 = !DILocation(line: 57, column: 32, scope: !77)
!88 = !DILocation(line: 58, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !77, file: !18, line: 58, column: 8)
!90 = !DILocation(line: 58, column: 8, scope: !77)
!91 = !DILocation(line: 61, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !18, line: 59, column: 5)
!93 = !DILocation(line: 62, column: 5, scope: !92)
!94 = !DILocation(line: 67, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !18, line: 64, column: 5)
!96 = !DILocation(line: 67, column: 14, scope: !95)
!97 = !DILocation(line: 68, column: 9, scope: !95)
!98 = !DILocation(line: 68, column: 17, scope: !95)
!99 = !DILocalVariable(name: "source", scope: !100, file: !18, line: 71, type: !43)
!100 = distinct !DILexicalBlock(scope: !77, file: !18, line: 70, column: 5)
!101 = !DILocation(line: 71, column: 17, scope: !100)
!102 = !DILocation(line: 73, column: 16, scope: !100)
!103 = !DILocation(line: 73, column: 22, scope: !100)
!104 = !DILocation(line: 73, column: 9, scope: !100)
!105 = !DILocation(line: 74, column: 20, scope: !100)
!106 = !DILocation(line: 74, column: 9, scope: !100)
!107 = !DILocation(line: 76, column: 1, scope: !77)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!109 = !DILocalVariable(name: "data", scope: !108, file: !18, line: 81, type: !3)
!110 = !DILocation(line: 81, column: 15, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !18, line: 82, type: !3)
!112 = !DILocation(line: 82, column: 15, scope: !108)
!113 = !DILocation(line: 82, column: 42, scope: !108)
!114 = !DILocation(line: 82, column: 31, scope: !108)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !18, line: 83, type: !3)
!116 = !DILocation(line: 83, column: 15, scope: !108)
!117 = !DILocation(line: 83, column: 43, scope: !108)
!118 = !DILocation(line: 83, column: 32, scope: !108)
!119 = !DILocation(line: 84, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !108, file: !18, line: 84, column: 8)
!121 = !DILocation(line: 84, column: 8, scope: !108)
!122 = !DILocation(line: 88, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !18, line: 85, column: 5)
!124 = !DILocation(line: 88, column: 14, scope: !123)
!125 = !DILocation(line: 89, column: 9, scope: !123)
!126 = !DILocation(line: 89, column: 17, scope: !123)
!127 = !DILocation(line: 90, column: 5, scope: !123)
!128 = !DILocalVariable(name: "source", scope: !129, file: !18, line: 92, type: !43)
!129 = distinct !DILexicalBlock(scope: !108, file: !18, line: 91, column: 5)
!130 = !DILocation(line: 92, column: 17, scope: !129)
!131 = !DILocation(line: 94, column: 16, scope: !129)
!132 = !DILocation(line: 94, column: 22, scope: !129)
!133 = !DILocation(line: 94, column: 9, scope: !129)
!134 = !DILocation(line: 95, column: 20, scope: !129)
!135 = !DILocation(line: 95, column: 9, scope: !129)
!136 = !DILocation(line: 97, column: 1, scope: !108)
