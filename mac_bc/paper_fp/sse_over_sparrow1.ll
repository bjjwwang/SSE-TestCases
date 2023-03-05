; ModuleID = 'mac_bc/paper_fp/sse_over_sparrow1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/paper_fp/sse_over_sparrow1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_bad() #0 !dbg !12 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call i32 (i64, ...) bitcast (i32 (...)* @ALLOCA to i32 (i64, ...)*)(i64 noundef 200), !dbg !21
  %conv = sext i32 %call to i64, !dbg !22
  %0 = inttoptr i64 %conv to i32*, !dbg !22
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %call1 = call i32 (i64, ...) bitcast (i32 (...)* @ALLOCA to i32 (i64, ...)*)(i64 noundef 400), !dbg !25
  %conv2 = sext i32 %call1 to i64, !dbg !26
  %1 = inttoptr i64 %conv2 to i32*, !dbg !26
  store i32* %1, i32** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !27
  store i32* %2, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !36
  %4 = load i32*, i32** %data, align 8, !dbg !37
  %5 = bitcast i32* %4 to i8*, !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !38
  %6 = bitcast i32* %arraydecay to i8*, !dbg !38
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @ALLOCA(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_good() #0 !dbg !40 {
entry:
  call void @goodG2B1(), !dbg !41
  call void @goodG2B2(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_good(), !dbg !54
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_bad(), !dbg !55
  ret i32 0, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !57 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i32 (i64, ...) bitcast (i32 (...)* @ALLOCA to i32 (i64, ...)*)(i64 noundef 200), !dbg !62
  %conv = sext i32 %call to i64, !dbg !63
  %0 = inttoptr i64 %conv to i32*, !dbg !63
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !64, metadata !DIExpression()), !dbg !65
  %call1 = call i32 (i64, ...) bitcast (i32 (...)* @ALLOCA to i32 (i64, ...)*)(i64 noundef 400), !dbg !66
  %conv2 = sext i32 %call1 to i64, !dbg !67
  %1 = inttoptr i64 %conv2 to i32*, !dbg !67
  store i32* %1, i32** %dataGoodBuffer, align 8, !dbg !65
  %2 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !68
  store i32* %2, i32** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !72, metadata !DIExpression()), !dbg !74
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !74
  %4 = load i32*, i32** %data, align 8, !dbg !75
  %5 = bitcast i32* %4 to i8*, !dbg !76
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !76
  %6 = bitcast i32* %arraydecay to i8*, !dbg !76
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i32 (i64, ...) bitcast (i32 (...)* @ALLOCA to i32 (i64, ...)*)(i64 noundef 200), !dbg !83
  %conv = sext i32 %call to i64, !dbg !84
  %0 = inttoptr i64 %conv to i32*, !dbg !84
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %call1 = call i32 (i64, ...) bitcast (i32 (...)* @ALLOCA to i32 (i64, ...)*)(i64 noundef 400), !dbg !87
  %conv2 = sext i32 %call1 to i64, !dbg !88
  %1 = inttoptr i64 %conv2 to i32*, !dbg !88
  store i32* %1, i32** %dataGoodBuffer, align 8, !dbg !86
  %2 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !89
  store i32* %2, i32** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !95
  %4 = load i32*, i32** %data, align 8, !dbg !96
  %5 = bitcast i32* %4 to i8*, !dbg !97
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !97
  %6 = bitcast i32* %arraydecay to i8*, !dbg !97
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !97
  ret void, !dbg !98
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/paper_fp/sse_over_sparrow1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_bad", scope: !13, file: !13, line: 18, type: !14, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/paper_fp/sse_over_sparrow1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 20, type: !3)
!18 = !DILocation(line: 20, column: 11, scope: !12)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !12, file: !13, line: 21, type: !3)
!20 = !DILocation(line: 21, column: 11, scope: !12)
!21 = !DILocation(line: 21, column: 34, scope: !12)
!22 = !DILocation(line: 21, column: 27, scope: !12)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !12, file: !13, line: 22, type: !3)
!24 = !DILocation(line: 22, column: 11, scope: !12)
!25 = !DILocation(line: 22, column: 35, scope: !12)
!26 = !DILocation(line: 22, column: 28, scope: !12)
!27 = !DILocation(line: 27, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !13, line: 24, column: 5)
!29 = distinct !DILexicalBlock(scope: !12, file: !13, line: 23, column: 8)
!30 = !DILocation(line: 27, column: 14, scope: !28)
!31 = !DILocalVariable(name: "source", scope: !32, file: !13, line: 30, type: !33)
!32 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 30, column: 13, scope: !32)
!37 = !DILocation(line: 32, column: 17, scope: !32)
!38 = !DILocation(line: 32, column: 9, scope: !32)
!39 = !DILocation(line: 34, column: 1, scope: !12)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_02_good", scope: !13, file: !13, line: 78, type: !14, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!41 = !DILocation(line: 80, column: 5, scope: !40)
!42 = !DILocation(line: 81, column: 5, scope: !40)
!43 = !DILocation(line: 82, column: 1, scope: !40)
!44 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 91, type: !45, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!45 = !DISubroutineType(types: !46)
!46 = !{!4, !4, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !13, line: 91, type: !4)
!51 = !DILocation(line: 91, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !13, line: 91, type: !47)
!53 = !DILocation(line: 91, column: 27, scope: !44)
!54 = !DILocation(line: 94, column: 5, scope: !44)
!55 = !DILocation(line: 95, column: 5, scope: !44)
!56 = !DILocation(line: 96, column: 5, scope: !44)
!57 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 39, type: !14, scopeLine: 40, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!58 = !DILocalVariable(name: "data", scope: !57, file: !13, line: 41, type: !3)
!59 = !DILocation(line: 41, column: 11, scope: !57)
!60 = !DILocalVariable(name: "dataBadBuffer", scope: !57, file: !13, line: 42, type: !3)
!61 = !DILocation(line: 42, column: 11, scope: !57)
!62 = !DILocation(line: 42, column: 34, scope: !57)
!63 = !DILocation(line: 42, column: 27, scope: !57)
!64 = !DILocalVariable(name: "dataGoodBuffer", scope: !57, file: !13, line: 43, type: !3)
!65 = !DILocation(line: 43, column: 11, scope: !57)
!66 = !DILocation(line: 43, column: 35, scope: !57)
!67 = !DILocation(line: 43, column: 28, scope: !57)
!68 = !DILocation(line: 51, column: 16, scope: !69)
!69 = distinct !DILexicalBlock(scope: !70, file: !13, line: 49, column: 5)
!70 = distinct !DILexicalBlock(scope: !57, file: !13, line: 44, column: 8)
!71 = !DILocation(line: 51, column: 14, scope: !69)
!72 = !DILocalVariable(name: "source", scope: !73, file: !13, line: 54, type: !33)
!73 = distinct !DILexicalBlock(scope: !57, file: !13, line: 53, column: 5)
!74 = !DILocation(line: 54, column: 13, scope: !73)
!75 = !DILocation(line: 56, column: 17, scope: !73)
!76 = !DILocation(line: 56, column: 9, scope: !73)
!77 = !DILocation(line: 58, column: 1, scope: !57)
!78 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 61, type: !14, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !16)
!79 = !DILocalVariable(name: "data", scope: !78, file: !13, line: 63, type: !3)
!80 = !DILocation(line: 63, column: 11, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !13, line: 64, type: !3)
!82 = !DILocation(line: 64, column: 11, scope: !78)
!83 = !DILocation(line: 64, column: 34, scope: !78)
!84 = !DILocation(line: 64, column: 27, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !13, line: 65, type: !3)
!86 = !DILocation(line: 65, column: 11, scope: !78)
!87 = !DILocation(line: 65, column: 35, scope: !78)
!88 = !DILocation(line: 65, column: 28, scope: !78)
!89 = !DILocation(line: 69, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !91, file: !13, line: 67, column: 5)
!91 = distinct !DILexicalBlock(scope: !78, file: !13, line: 66, column: 8)
!92 = !DILocation(line: 69, column: 14, scope: !90)
!93 = !DILocalVariable(name: "source", scope: !94, file: !13, line: 72, type: !33)
!94 = distinct !DILexicalBlock(scope: !78, file: !13, line: 71, column: 5)
!95 = !DILocation(line: 72, column: 13, scope: !94)
!96 = !DILocation(line: 74, column: 17, scope: !94)
!97 = !DILocation(line: 74, column: 9, scope: !94)
!98 = !DILocation(line: 76, column: 1, scope: !78)
