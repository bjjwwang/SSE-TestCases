; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_bad() #0 !dbg !17 {
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
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_bad.source to i8*), i64 44, i1 false), !dbg !41
  %7 = load i32*, i32** %data, align 8, !dbg !42
  %8 = bitcast i32* %7 to i8*, !dbg !42
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !42
  %9 = bitcast i32* %arraydecay to i8*, !dbg !42
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !42
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !42
  %add = add i64 %call, 1, !dbg !42
  %mul = mul i64 %add, 4, !dbg !42
  %10 = load i32*, i32** %data, align 8, !dbg !42
  %11 = bitcast i32* %10 to i8*, !dbg !42
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !42
  %call2 = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef %mul, i64 noundef %12) #5, !dbg !42
  %13 = load i32*, i32** %data, align 8, !dbg !43
  call void @printWLine(i32* noundef %13), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 40, align 16, !dbg !75
  %1 = bitcast i8* %0 to i32*, !dbg !76
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %2 = alloca i8, i64 44, align 16, !dbg !79
  %3 = bitcast i8* %2 to i32*, !dbg !80
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !78
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !81
  store i32* %4, i32** %data, align 8, !dbg !82
  %5 = load i32*, i32** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !87
  %7 = load i32*, i32** %data, align 8, !dbg !88
  %8 = bitcast i32* %7 to i8*, !dbg !88
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !88
  %9 = bitcast i32* %arraydecay to i8*, !dbg !88
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !88
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !88
  %add = add i64 %call, 1, !dbg !88
  %mul = mul i64 %add, 4, !dbg !88
  %10 = load i32*, i32** %data, align 8, !dbg !88
  %11 = bitcast i32* %10 to i8*, !dbg !88
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !88
  %call2 = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef %mul, i64 noundef %12) #5, !dbg !88
  %13 = load i32*, i32** %data, align 8, !dbg !89
  call void @printWLine(i32* noundef %13), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 40, align 16, !dbg !97
  %1 = bitcast i8* %0 to i32*, !dbg !98
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %2 = alloca i8, i64 44, align 16, !dbg !101
  %3 = bitcast i8* %2 to i32*, !dbg !102
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !100
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !103
  store i32* %4, i32** %data, align 8, !dbg !104
  %5 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !109
  %7 = load i32*, i32** %data, align 8, !dbg !110
  %8 = bitcast i32* %7 to i8*, !dbg !110
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !110
  %9 = bitcast i32* %arraydecay to i8*, !dbg !110
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !110
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !110
  %add = add i64 %call, 1, !dbg !110
  %mul = mul i64 %add, 4, !dbg !110
  %10 = load i32*, i32** %data, align 8, !dbg !110
  %11 = bitcast i32* %10 to i8*, !dbg !110
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !110
  %call2 = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef %mul, i64 noundef %12) #5, !dbg !110
  %13 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* noundef %13), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_bad", scope: !18, file: !18, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = !DILocation(line: 38, column: 16, scope: !17)
!33 = !DILocation(line: 38, column: 14, scope: !17)
!34 = !DILocation(line: 39, column: 9, scope: !17)
!35 = !DILocation(line: 39, column: 17, scope: !17)
!36 = !DILocalVariable(name: "source", scope: !37, file: !18, line: 47, type: !38)
!37 = distinct !DILexicalBlock(scope: !17, file: !18, line: 46, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 11)
!41 = !DILocation(line: 47, column: 17, scope: !37)
!42 = !DILocation(line: 50, column: 9, scope: !37)
!43 = !DILocation(line: 51, column: 20, scope: !37)
!44 = !DILocation(line: 51, column: 9, scope: !37)
!45 = !DILocation(line: 53, column: 1, scope: !17)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_good", scope: !18, file: !18, line: 115, type: !19, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!47 = !DILocation(line: 117, column: 5, scope: !46)
!48 = !DILocation(line: 118, column: 5, scope: !46)
!49 = !DILocation(line: 119, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 131, type: !51, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!51 = !DISubroutineType(types: !52)
!52 = !{!8, !8, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !18, line: 131, type: !8)
!57 = !DILocation(line: 131, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !18, line: 131, type: !53)
!59 = !DILocation(line: 131, column: 27, scope: !50)
!60 = !DILocation(line: 134, column: 22, scope: !50)
!61 = !DILocation(line: 134, column: 12, scope: !50)
!62 = !DILocation(line: 134, column: 5, scope: !50)
!63 = !DILocation(line: 136, column: 5, scope: !50)
!64 = !DILocation(line: 137, column: 5, scope: !50)
!65 = !DILocation(line: 138, column: 5, scope: !50)
!66 = !DILocation(line: 141, column: 5, scope: !50)
!67 = !DILocation(line: 142, column: 5, scope: !50)
!68 = !DILocation(line: 143, column: 5, scope: !50)
!69 = !DILocation(line: 145, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!71 = !DILocalVariable(name: "data", scope: !70, file: !18, line: 62, type: !3)
!72 = !DILocation(line: 62, column: 15, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !18, line: 63, type: !3)
!74 = !DILocation(line: 63, column: 15, scope: !70)
!75 = !DILocation(line: 63, column: 42, scope: !70)
!76 = !DILocation(line: 63, column: 31, scope: !70)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !18, line: 64, type: !3)
!78 = !DILocation(line: 64, column: 15, scope: !70)
!79 = !DILocation(line: 64, column: 43, scope: !70)
!80 = !DILocation(line: 64, column: 32, scope: !70)
!81 = !DILocation(line: 74, column: 16, scope: !70)
!82 = !DILocation(line: 74, column: 14, scope: !70)
!83 = !DILocation(line: 75, column: 9, scope: !70)
!84 = !DILocation(line: 75, column: 17, scope: !70)
!85 = !DILocalVariable(name: "source", scope: !86, file: !18, line: 79, type: !38)
!86 = distinct !DILexicalBlock(scope: !70, file: !18, line: 78, column: 5)
!87 = !DILocation(line: 79, column: 17, scope: !86)
!88 = !DILocation(line: 82, column: 9, scope: !86)
!89 = !DILocation(line: 83, column: 20, scope: !86)
!90 = !DILocation(line: 83, column: 9, scope: !86)
!91 = !DILocation(line: 85, column: 1, scope: !70)
!92 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 88, type: !19, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!93 = !DILocalVariable(name: "data", scope: !92, file: !18, line: 90, type: !3)
!94 = !DILocation(line: 90, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !18, line: 91, type: !3)
!96 = !DILocation(line: 91, column: 15, scope: !92)
!97 = !DILocation(line: 91, column: 42, scope: !92)
!98 = !DILocation(line: 91, column: 31, scope: !92)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !18, line: 92, type: !3)
!100 = !DILocation(line: 92, column: 15, scope: !92)
!101 = !DILocation(line: 92, column: 43, scope: !92)
!102 = !DILocation(line: 92, column: 32, scope: !92)
!103 = !DILocation(line: 98, column: 16, scope: !92)
!104 = !DILocation(line: 98, column: 14, scope: !92)
!105 = !DILocation(line: 99, column: 9, scope: !92)
!106 = !DILocation(line: 99, column: 17, scope: !92)
!107 = !DILocalVariable(name: "source", scope: !108, file: !18, line: 107, type: !38)
!108 = distinct !DILexicalBlock(scope: !92, file: !18, line: 106, column: 5)
!109 = !DILocation(line: 107, column: 17, scope: !108)
!110 = !DILocation(line: 110, column: 9, scope: !108)
!111 = !DILocation(line: 111, column: 20, scope: !108)
!112 = !DILocation(line: 111, column: 9, scope: !108)
!113 = !DILocation(line: 113, column: 1, scope: !92)
