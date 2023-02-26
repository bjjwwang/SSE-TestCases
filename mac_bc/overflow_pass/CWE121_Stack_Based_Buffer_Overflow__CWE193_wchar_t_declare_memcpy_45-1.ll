; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_goodG2BData = internal global i32* null, align 8, !dbg !7
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  %0 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_badData, align 8, !dbg !44
  call void @badSink(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_badData, align 8, !dbg !73
  store i32* %0, i32** %data, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !74, metadata !DIExpression()), !dbg !76
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !76
  %2 = load i32*, i32** %data, align 8, !dbg !77
  %3 = bitcast i32* %2 to i8*, !dbg !77
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !77
  %4 = bitcast i32* %arraydecay to i8*, !dbg !77
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !77
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !77
  %add = add i64 %call, 1, !dbg !77
  %mul = mul i64 %add, 4, !dbg !77
  %5 = load i32*, i32** %data, align 8, !dbg !77
  %6 = bitcast i32* %5 to i8*, !dbg !77
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !77
  %call2 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !77
  %8 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* noundef %8), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @wcslen(i32* noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  store i32* %arraydecay, i32** %data, align 8, !dbg !89
  %0 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_goodG2BData, align 8, !dbg !93
  call void @goodG2BSink(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_goodG2BData, align 8, !dbg !99
  store i32* %0, i32** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !102
  %2 = load i32*, i32** %data, align 8, !dbg !103
  %3 = bitcast i32* %2 to i8*, !dbg !103
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %4 = bitcast i32* %arraydecay to i8*, !dbg !103
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !103
  %add = add i64 %call, 1, !dbg !103
  %mul = mul i64 %add, 4, !dbg !103
  %5 = load i32*, i32** %data, align 8, !dbg !103
  %6 = bitcast i32* %5 to i8*, !dbg !103
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !103
  %call2 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !103
  %8 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* noundef %8), !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_badData", scope: !2, file: !9, line: 26, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_goodG2BData", scope: !2, file: !9, line: 27, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 34, baseType: !13)
!12 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !14, line: 106, baseType: !15)
!14 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_bad", scope: !9, file: !9, line: 43, type: !24, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !9, line: 45, type: !10)
!28 = !DILocation(line: 45, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !9, line: 46, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 46, column: 13, scope: !23)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !9, line: 47, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 352, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 47, column: 13, scope: !23)
!39 = !DILocation(line: 50, column: 12, scope: !23)
!40 = !DILocation(line: 50, column: 10, scope: !23)
!41 = !DILocation(line: 51, column: 5, scope: !23)
!42 = !DILocation(line: 51, column: 13, scope: !23)
!43 = !DILocation(line: 52, column: 84, scope: !23)
!44 = !DILocation(line: 52, column: 82, scope: !23)
!45 = !DILocation(line: 53, column: 5, scope: !23)
!46 = !DILocation(line: 54, column: 1, scope: !23)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_45_good", scope: !9, file: !9, line: 86, type: !24, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!48 = !DILocation(line: 88, column: 5, scope: !47)
!49 = !DILocation(line: 89, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 100, type: !51, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!51 = !DISubroutineType(types: !52)
!52 = !{!15, !15, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !9, line: 100, type: !15)
!57 = !DILocation(line: 100, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !9, line: 100, type: !53)
!59 = !DILocation(line: 100, column: 27, scope: !50)
!60 = !DILocation(line: 103, column: 22, scope: !50)
!61 = !DILocation(line: 103, column: 12, scope: !50)
!62 = !DILocation(line: 103, column: 5, scope: !50)
!63 = !DILocation(line: 105, column: 5, scope: !50)
!64 = !DILocation(line: 106, column: 5, scope: !50)
!65 = !DILocation(line: 107, column: 5, scope: !50)
!66 = !DILocation(line: 110, column: 5, scope: !50)
!67 = !DILocation(line: 111, column: 5, scope: !50)
!68 = !DILocation(line: 112, column: 5, scope: !50)
!69 = !DILocation(line: 114, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 31, type: !24, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!71 = !DILocalVariable(name: "data", scope: !70, file: !9, line: 33, type: !10)
!72 = !DILocation(line: 33, column: 15, scope: !70)
!73 = !DILocation(line: 33, column: 22, scope: !70)
!74 = !DILocalVariable(name: "source", scope: !75, file: !9, line: 35, type: !35)
!75 = distinct !DILexicalBlock(scope: !70, file: !9, line: 34, column: 5)
!76 = !DILocation(line: 35, column: 17, scope: !75)
!77 = !DILocation(line: 38, column: 9, scope: !75)
!78 = !DILocation(line: 39, column: 20, scope: !75)
!79 = !DILocation(line: 39, column: 9, scope: !75)
!80 = !DILocation(line: 41, column: 1, scope: !70)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 73, type: !24, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!82 = !DILocalVariable(name: "data", scope: !81, file: !9, line: 75, type: !10)
!83 = !DILocation(line: 75, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !9, line: 76, type: !30)
!85 = !DILocation(line: 76, column: 13, scope: !81)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !9, line: 77, type: !35)
!87 = !DILocation(line: 77, column: 13, scope: !81)
!88 = !DILocation(line: 80, column: 12, scope: !81)
!89 = !DILocation(line: 80, column: 10, scope: !81)
!90 = !DILocation(line: 81, column: 5, scope: !81)
!91 = !DILocation(line: 81, column: 13, scope: !81)
!92 = !DILocation(line: 82, column: 88, scope: !81)
!93 = !DILocation(line: 82, column: 86, scope: !81)
!94 = !DILocation(line: 83, column: 5, scope: !81)
!95 = !DILocation(line: 84, column: 1, scope: !81)
!96 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 61, type: !24, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!97 = !DILocalVariable(name: "data", scope: !96, file: !9, line: 63, type: !10)
!98 = !DILocation(line: 63, column: 15, scope: !96)
!99 = !DILocation(line: 63, column: 22, scope: !96)
!100 = !DILocalVariable(name: "source", scope: !101, file: !9, line: 65, type: !35)
!101 = distinct !DILexicalBlock(scope: !96, file: !9, line: 64, column: 5)
!102 = !DILocation(line: 65, column: 17, scope: !101)
!103 = !DILocation(line: 68, column: 9, scope: !101)
!104 = !DILocation(line: 69, column: 20, scope: !101)
!105 = !DILocation(line: 69, column: 9, scope: !101)
!106 = !DILocation(line: 71, column: 1, scope: !96)
