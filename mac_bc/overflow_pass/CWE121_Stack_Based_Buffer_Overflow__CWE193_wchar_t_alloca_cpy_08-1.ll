; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_bad() #0 !dbg !17 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !32
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_bad.source to i8*), i64 44, i1 false), !dbg !46
  %7 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !48
  %call1 = call i32* @wcscpy(i32* noundef %7, i32* noundef %arraydecay), !dbg !49
  %8 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* noundef %8), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32* @wcscpy(i32* noundef, i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_good() #0 !dbg !53 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_good(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_bad(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !77 {
entry:
  ret i32 1, !dbg !80
}

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
  %call = call i32 @staticReturnsFalse(), !dbg !92
  %tobool = icmp ne i32 %call, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !98
  store i32* %4, i32** %data, align 8, !dbg !100
  %5 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !105
  %7 = load i32*, i32** %data, align 8, !dbg !106
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !107
  %call1 = call i32* @wcscpy(i32* noundef %7, i32* noundef %arraydecay), !dbg !108
  %8 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* noundef %8), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !112 {
entry:
  ret i32 0, !dbg !113
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 40, align 16, !dbg !119
  %1 = bitcast i8* %0 to i32*, !dbg !120
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %2 = alloca i8, i64 44, align 16, !dbg !123
  %3 = bitcast i8* %2 to i32*, !dbg !124
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !122
  %call = call i32 @staticReturnsTrue(), !dbg !125
  %tobool = icmp ne i32 %call, 0, !dbg !125
  br i1 %tobool, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !128
  store i32* %4, i32** %data, align 8, !dbg !130
  %5 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  br label %if.end, !dbg !133

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !134, metadata !DIExpression()), !dbg !136
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !136
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !136
  %7 = load i32*, i32** %data, align 8, !dbg !137
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !138
  %call1 = call i32* @wcscpy(i32* noundef %7, i32* noundef %arraydecay), !dbg !139
  %8 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* noundef %8), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_bad", scope: !18, file: !18, line: 42, type: !19, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 44, type: !3)
!23 = !DILocation(line: 44, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 45, type: !3)
!25 = !DILocation(line: 45, column: 15, scope: !17)
!26 = !DILocation(line: 45, column: 42, scope: !17)
!27 = !DILocation(line: 45, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 46, type: !3)
!29 = !DILocation(line: 46, column: 15, scope: !17)
!30 = !DILocation(line: 46, column: 43, scope: !17)
!31 = !DILocation(line: 46, column: 32, scope: !17)
!32 = !DILocation(line: 47, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 47, column: 8)
!34 = !DILocation(line: 47, column: 8, scope: !17)
!35 = !DILocation(line: 51, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !18, line: 48, column: 5)
!37 = !DILocation(line: 51, column: 14, scope: !36)
!38 = !DILocation(line: 52, column: 9, scope: !36)
!39 = !DILocation(line: 52, column: 17, scope: !36)
!40 = !DILocation(line: 53, column: 5, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !42, file: !18, line: 55, type: !43)
!42 = distinct !DILexicalBlock(scope: !17, file: !18, line: 54, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 11)
!46 = !DILocation(line: 55, column: 17, scope: !42)
!47 = !DILocation(line: 57, column: 16, scope: !42)
!48 = !DILocation(line: 57, column: 22, scope: !42)
!49 = !DILocation(line: 57, column: 9, scope: !42)
!50 = !DILocation(line: 58, column: 20, scope: !42)
!51 = !DILocation(line: 58, column: 9, scope: !42)
!52 = !DILocation(line: 60, column: 1, scope: !17)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_08_good", scope: !18, file: !18, line: 113, type: !19, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!54 = !DILocation(line: 115, column: 5, scope: !53)
!55 = !DILocation(line: 116, column: 5, scope: !53)
!56 = !DILocation(line: 117, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 129, type: !58, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!58 = !DISubroutineType(types: !59)
!59 = !{!8, !8, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !18, line: 129, type: !8)
!64 = !DILocation(line: 129, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !18, line: 129, type: !60)
!66 = !DILocation(line: 129, column: 27, scope: !57)
!67 = !DILocation(line: 132, column: 22, scope: !57)
!68 = !DILocation(line: 132, column: 12, scope: !57)
!69 = !DILocation(line: 132, column: 5, scope: !57)
!70 = !DILocation(line: 134, column: 5, scope: !57)
!71 = !DILocation(line: 135, column: 5, scope: !57)
!72 = !DILocation(line: 136, column: 5, scope: !57)
!73 = !DILocation(line: 139, column: 5, scope: !57)
!74 = !DILocation(line: 140, column: 5, scope: !57)
!75 = !DILocation(line: 141, column: 5, scope: !57)
!76 = !DILocation(line: 143, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !18, file: !18, line: 30, type: !78, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!78 = !DISubroutineType(types: !79)
!79 = !{!8}
!80 = !DILocation(line: 32, column: 5, scope: !77)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 67, type: !19, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!82 = !DILocalVariable(name: "data", scope: !81, file: !18, line: 69, type: !3)
!83 = !DILocation(line: 69, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !18, line: 70, type: !3)
!85 = !DILocation(line: 70, column: 15, scope: !81)
!86 = !DILocation(line: 70, column: 42, scope: !81)
!87 = !DILocation(line: 70, column: 31, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !18, line: 71, type: !3)
!89 = !DILocation(line: 71, column: 15, scope: !81)
!90 = !DILocation(line: 71, column: 43, scope: !81)
!91 = !DILocation(line: 71, column: 32, scope: !81)
!92 = !DILocation(line: 72, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !18, line: 72, column: 8)
!94 = !DILocation(line: 72, column: 8, scope: !81)
!95 = !DILocation(line: 75, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !18, line: 73, column: 5)
!97 = !DILocation(line: 76, column: 5, scope: !96)
!98 = !DILocation(line: 81, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !18, line: 78, column: 5)
!100 = !DILocation(line: 81, column: 14, scope: !99)
!101 = !DILocation(line: 82, column: 9, scope: !99)
!102 = !DILocation(line: 82, column: 17, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !18, line: 85, type: !43)
!104 = distinct !DILexicalBlock(scope: !81, file: !18, line: 84, column: 5)
!105 = !DILocation(line: 85, column: 17, scope: !104)
!106 = !DILocation(line: 87, column: 16, scope: !104)
!107 = !DILocation(line: 87, column: 22, scope: !104)
!108 = !DILocation(line: 87, column: 9, scope: !104)
!109 = !DILocation(line: 88, column: 20, scope: !104)
!110 = !DILocation(line: 88, column: 9, scope: !104)
!111 = !DILocation(line: 90, column: 1, scope: !81)
!112 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !18, file: !18, line: 35, type: !78, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!113 = !DILocation(line: 37, column: 5, scope: !112)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 93, type: !19, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!115 = !DILocalVariable(name: "data", scope: !114, file: !18, line: 95, type: !3)
!116 = !DILocation(line: 95, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataBadBuffer", scope: !114, file: !18, line: 96, type: !3)
!118 = !DILocation(line: 96, column: 15, scope: !114)
!119 = !DILocation(line: 96, column: 42, scope: !114)
!120 = !DILocation(line: 96, column: 31, scope: !114)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !114, file: !18, line: 97, type: !3)
!122 = !DILocation(line: 97, column: 15, scope: !114)
!123 = !DILocation(line: 97, column: 43, scope: !114)
!124 = !DILocation(line: 97, column: 32, scope: !114)
!125 = !DILocation(line: 98, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !114, file: !18, line: 98, column: 8)
!127 = !DILocation(line: 98, column: 8, scope: !114)
!128 = !DILocation(line: 102, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !18, line: 99, column: 5)
!130 = !DILocation(line: 102, column: 14, scope: !129)
!131 = !DILocation(line: 103, column: 9, scope: !129)
!132 = !DILocation(line: 103, column: 17, scope: !129)
!133 = !DILocation(line: 104, column: 5, scope: !129)
!134 = !DILocalVariable(name: "source", scope: !135, file: !18, line: 106, type: !43)
!135 = distinct !DILexicalBlock(scope: !114, file: !18, line: 105, column: 5)
!136 = !DILocation(line: 106, column: 17, scope: !135)
!137 = !DILocation(line: 108, column: 16, scope: !135)
!138 = !DILocation(line: 108, column: 22, scope: !135)
!139 = !DILocation(line: 108, column: 9, scope: !135)
!140 = !DILocation(line: 109, column: 20, scope: !135)
!141 = !DILocation(line: 109, column: 9, scope: !135)
!142 = !DILocation(line: 111, column: 1, scope: !114)
