; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_06_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 200, align 16, !dbg !22
  %1 = bitcast i8* %0 to i32*, !dbg !23
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = alloca i8, i64 400, align 16, !dbg !26
  %3 = bitcast i8* %2 to i32*, !dbg !27
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !25
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !28
  store i32* %4, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  %7 = bitcast i32* %6 to i8*, !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !38
  %8 = bitcast i32* %arraydecay to i8*, !dbg !38
  %9 = load i32*, i32** %data, align 8, !dbg !38
  %10 = bitcast i32* %9 to i8*, !dbg !38
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !38
  %call = call i8* @__memcpy_chk(i8* noundef %7, i8* noundef %8, i64 noundef 400, i64 noundef %11) #5, !dbg !38
  %12 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %12, i64 0, !dbg !39
  %13 = load i32, i32* %arrayidx, align 4, !dbg !39
  call void @printIntLine(i32 noundef %13), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_06_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* noundef null), !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 noundef %conv), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_06_good(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_06_bad(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = alloca i8, i64 200, align 16, !dbg !71
  %1 = bitcast i8* %0 to i32*, !dbg !72
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %2 = alloca i8, i64 400, align 16, !dbg !75
  %3 = bitcast i8* %2 to i32*, !dbg !76
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !74
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !77
  store i32* %4, i32** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !83
  %6 = load i32*, i32** %data, align 8, !dbg !84
  %7 = bitcast i32* %6 to i8*, !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !84
  %8 = bitcast i32* %arraydecay to i8*, !dbg !84
  %9 = load i32*, i32** %data, align 8, !dbg !84
  %10 = bitcast i32* %9 to i8*, !dbg !84
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !84
  %call = call i8* @__memcpy_chk(i8* noundef %7, i8* noundef %8, i64 noundef 400, i64 noundef %11) #5, !dbg !84
  %12 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %12, i64 0, !dbg !85
  %13 = load i32, i32* %arrayidx, align 4, !dbg !85
  call void @printIntLine(i32 noundef %13), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 200, align 16, !dbg !93
  %1 = bitcast i8* %0 to i32*, !dbg !94
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %2 = alloca i8, i64 400, align 16, !dbg !97
  %3 = bitcast i8* %2 to i32*, !dbg !98
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !96
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !99
  store i32* %4, i32** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !105
  %6 = load i32*, i32** %data, align 8, !dbg !106
  %7 = bitcast i32* %6 to i8*, !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %8 = bitcast i32* %arraydecay to i8*, !dbg !106
  %9 = load i32*, i32** %data, align 8, !dbg !106
  %10 = bitcast i32* %9 to i8*, !dbg !106
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !106
  %call = call i8* @__memcpy_chk(i8* noundef %7, i8* noundef %8, i64 noundef 400, i64 noundef %11) #5, !dbg !106
  %12 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %12, i64 0, !dbg !107
  %13 = load i32, i32* %arrayidx, align 4, !dbg !107
  call void @printIntLine(i32 noundef %13), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_06_bad", scope: !14, file: !14, line: 25, type: !15, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 27, type: !3)
!19 = !DILocation(line: 27, column: 11, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 28, type: !3)
!21 = !DILocation(line: 28, column: 11, scope: !13)
!22 = !DILocation(line: 28, column: 34, scope: !13)
!23 = !DILocation(line: 28, column: 27, scope: !13)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 29, type: !3)
!25 = !DILocation(line: 29, column: 11, scope: !13)
!26 = !DILocation(line: 29, column: 35, scope: !13)
!27 = !DILocation(line: 29, column: 28, scope: !13)
!28 = !DILocation(line: 34, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !14, line: 31, column: 5)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 8)
!31 = !DILocation(line: 34, column: 14, scope: !29)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 37, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 37, column: 13, scope: !33)
!38 = !DILocation(line: 39, column: 9, scope: !33)
!39 = !DILocation(line: 40, column: 22, scope: !33)
!40 = !DILocation(line: 40, column: 9, scope: !33)
!41 = !DILocation(line: 42, column: 1, scope: !13)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_06_good", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!43 = !DILocation(line: 93, column: 5, scope: !42)
!44 = !DILocation(line: 94, column: 5, scope: !42)
!45 = !DILocation(line: 95, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 107, type: !47, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!47 = !DISubroutineType(types: !48)
!48 = !{!4, !4, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !14, line: 107, type: !4)
!53 = !DILocation(line: 107, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !14, line: 107, type: !49)
!55 = !DILocation(line: 107, column: 27, scope: !46)
!56 = !DILocation(line: 110, column: 22, scope: !46)
!57 = !DILocation(line: 110, column: 12, scope: !46)
!58 = !DILocation(line: 110, column: 5, scope: !46)
!59 = !DILocation(line: 112, column: 5, scope: !46)
!60 = !DILocation(line: 113, column: 5, scope: !46)
!61 = !DILocation(line: 114, column: 5, scope: !46)
!62 = !DILocation(line: 117, column: 5, scope: !46)
!63 = !DILocation(line: 118, column: 5, scope: !46)
!64 = !DILocation(line: 119, column: 5, scope: !46)
!65 = !DILocation(line: 121, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!67 = !DILocalVariable(name: "data", scope: !66, file: !14, line: 51, type: !3)
!68 = !DILocation(line: 51, column: 11, scope: !66)
!69 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !14, line: 52, type: !3)
!70 = !DILocation(line: 52, column: 11, scope: !66)
!71 = !DILocation(line: 52, column: 34, scope: !66)
!72 = !DILocation(line: 52, column: 27, scope: !66)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !14, line: 53, type: !3)
!74 = !DILocation(line: 53, column: 11, scope: !66)
!75 = !DILocation(line: 53, column: 35, scope: !66)
!76 = !DILocation(line: 53, column: 28, scope: !66)
!77 = !DILocation(line: 62, column: 16, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !14, line: 60, column: 5)
!79 = distinct !DILexicalBlock(scope: !66, file: !14, line: 54, column: 8)
!80 = !DILocation(line: 62, column: 14, scope: !78)
!81 = !DILocalVariable(name: "source", scope: !82, file: !14, line: 65, type: !34)
!82 = distinct !DILexicalBlock(scope: !66, file: !14, line: 64, column: 5)
!83 = !DILocation(line: 65, column: 13, scope: !82)
!84 = !DILocation(line: 67, column: 9, scope: !82)
!85 = !DILocation(line: 68, column: 22, scope: !82)
!86 = !DILocation(line: 68, column: 9, scope: !82)
!87 = !DILocation(line: 70, column: 1, scope: !66)
!88 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!89 = !DILocalVariable(name: "data", scope: !88, file: !14, line: 75, type: !3)
!90 = !DILocation(line: 75, column: 11, scope: !88)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !14, line: 76, type: !3)
!92 = !DILocation(line: 76, column: 11, scope: !88)
!93 = !DILocation(line: 76, column: 34, scope: !88)
!94 = !DILocation(line: 76, column: 27, scope: !88)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !14, line: 77, type: !3)
!96 = !DILocation(line: 77, column: 11, scope: !88)
!97 = !DILocation(line: 77, column: 35, scope: !88)
!98 = !DILocation(line: 77, column: 28, scope: !88)
!99 = !DILocation(line: 81, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !14, line: 79, column: 5)
!101 = distinct !DILexicalBlock(scope: !88, file: !14, line: 78, column: 8)
!102 = !DILocation(line: 81, column: 14, scope: !100)
!103 = !DILocalVariable(name: "source", scope: !104, file: !14, line: 84, type: !34)
!104 = distinct !DILexicalBlock(scope: !88, file: !14, line: 83, column: 5)
!105 = !DILocation(line: 84, column: 13, scope: !104)
!106 = !DILocation(line: 86, column: 9, scope: !104)
!107 = !DILocation(line: 87, column: 22, scope: !104)
!108 = !DILocation(line: 87, column: 9, scope: !104)
!109 = !DILocation(line: 89, column: 1, scope: !88)
