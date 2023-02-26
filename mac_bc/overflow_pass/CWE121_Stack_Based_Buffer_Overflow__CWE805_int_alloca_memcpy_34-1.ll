; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 200, align 16, !dbg !29
  %1 = bitcast i8* %0 to i32*, !dbg !30
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = alloca i8, i64 400, align 16, !dbg !33
  %3 = bitcast i8* %2 to i32*, !dbg !34
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !32
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  store i32* %4, i32** %data, align 8, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !38
  store i32* %5, i32** %unionFirst, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !40, metadata !DIExpression()), !dbg !42
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !43
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !43
  store i32* %6, i32** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %7 = bitcast [100 x i32]* %source to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 400, i1 false), !dbg !49
  %8 = load i32*, i32** %data1, align 8, !dbg !50
  %9 = bitcast i32* %8 to i8*, !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %10 = bitcast i32* %arraydecay to i8*, !dbg !50
  %11 = load i32*, i32** %data1, align 8, !dbg !50
  %12 = bitcast i32* %11 to i8*, !dbg !50
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !50
  %call = call i8* @__memcpy_chk(i8* noundef %9, i8* noundef %10, i64 noundef 400, i64 noundef %13) #5, !dbg !50
  %14 = load i32*, i32** %data1, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %14, i64 0, !dbg !51
  %15 = load i32, i32* %arrayidx, align 4, !dbg !51
  call void @printIntLine(i32 noundef %15), !dbg !52
  ret void, !dbg !53
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_good(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_bad(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_unionType* %myUnion, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 200, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %2 = alloca i8, i64 400, align 16, !dbg !88
  %3 = bitcast i8* %2 to i32*, !dbg !89
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !87
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !90
  store i32* %4, i32** %data, align 8, !dbg !91
  %5 = load i32*, i32** %data, align 8, !dbg !92
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !93
  store i32* %5, i32** %unionFirst, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !95, metadata !DIExpression()), !dbg !97
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !98
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !98
  store i32* %6, i32** %data1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %7 = bitcast [100 x i32]* %source to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 400, i1 false), !dbg !101
  %8 = load i32*, i32** %data1, align 8, !dbg !102
  %9 = bitcast i32* %8 to i8*, !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !102
  %10 = bitcast i32* %arraydecay to i8*, !dbg !102
  %11 = load i32*, i32** %data1, align 8, !dbg !102
  %12 = bitcast i32* %11 to i8*, !dbg !102
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !102
  %call = call i8* @__memcpy_chk(i8* noundef %9, i8* noundef %10, i64 noundef 400, i64 noundef %13) #5, !dbg !102
  %14 = load i32*, i32** %data1, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %14, i64 0, !dbg !103
  %15 = load i32, i32* %arrayidx, align 4, !dbg !103
  call void @printIntLine(i32 noundef %15), !dbg !104
  ret void, !dbg !105
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_bad", scope: !14, file: !14, line: 27, type: !15, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 29, type: !3)
!19 = !DILocation(line: 29, column: 11, scope: !13)
!20 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 30, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_unionType", file: !14, line: 23, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 19, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !14, line: 21, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !14, line: 22, baseType: !3, size: 64)
!26 = !DILocation(line: 30, column: 79, scope: !13)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !3)
!28 = !DILocation(line: 31, column: 11, scope: !13)
!29 = !DILocation(line: 31, column: 34, scope: !13)
!30 = !DILocation(line: 31, column: 27, scope: !13)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !3)
!32 = !DILocation(line: 32, column: 11, scope: !13)
!33 = !DILocation(line: 32, column: 35, scope: !13)
!34 = !DILocation(line: 32, column: 28, scope: !13)
!35 = !DILocation(line: 35, column: 12, scope: !13)
!36 = !DILocation(line: 35, column: 10, scope: !13)
!37 = !DILocation(line: 36, column: 26, scope: !13)
!38 = !DILocation(line: 36, column: 13, scope: !13)
!39 = !DILocation(line: 36, column: 24, scope: !13)
!40 = !DILocalVariable(name: "data", scope: !41, file: !14, line: 38, type: !3)
!41 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!42 = !DILocation(line: 38, column: 15, scope: !41)
!43 = !DILocation(line: 38, column: 30, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !14, line: 40, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !14, line: 39, column: 9)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 40, column: 17, scope: !45)
!50 = !DILocation(line: 42, column: 13, scope: !45)
!51 = !DILocation(line: 43, column: 26, scope: !45)
!52 = !DILocation(line: 43, column: 13, scope: !45)
!53 = !DILocation(line: 46, column: 1, scope: !13)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_34_good", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!55 = !DILocation(line: 75, column: 5, scope: !54)
!56 = !DILocation(line: 76, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 87, type: !58, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!58 = !DISubroutineType(types: !59)
!59 = !{!4, !4, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !14, line: 87, type: !4)
!64 = !DILocation(line: 87, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !14, line: 87, type: !60)
!66 = !DILocation(line: 87, column: 27, scope: !57)
!67 = !DILocation(line: 90, column: 22, scope: !57)
!68 = !DILocation(line: 90, column: 12, scope: !57)
!69 = !DILocation(line: 90, column: 5, scope: !57)
!70 = !DILocation(line: 92, column: 5, scope: !57)
!71 = !DILocation(line: 93, column: 5, scope: !57)
!72 = !DILocation(line: 94, column: 5, scope: !57)
!73 = !DILocation(line: 97, column: 5, scope: !57)
!74 = !DILocation(line: 98, column: 5, scope: !57)
!75 = !DILocation(line: 99, column: 5, scope: !57)
!76 = !DILocation(line: 101, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!78 = !DILocalVariable(name: "data", scope: !77, file: !14, line: 55, type: !3)
!79 = !DILocation(line: 55, column: 11, scope: !77)
!80 = !DILocalVariable(name: "myUnion", scope: !77, file: !14, line: 56, type: !21)
!81 = !DILocation(line: 56, column: 79, scope: !77)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !14, line: 57, type: !3)
!83 = !DILocation(line: 57, column: 11, scope: !77)
!84 = !DILocation(line: 57, column: 34, scope: !77)
!85 = !DILocation(line: 57, column: 27, scope: !77)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !14, line: 58, type: !3)
!87 = !DILocation(line: 58, column: 11, scope: !77)
!88 = !DILocation(line: 58, column: 35, scope: !77)
!89 = !DILocation(line: 58, column: 28, scope: !77)
!90 = !DILocation(line: 60, column: 12, scope: !77)
!91 = !DILocation(line: 60, column: 10, scope: !77)
!92 = !DILocation(line: 61, column: 26, scope: !77)
!93 = !DILocation(line: 61, column: 13, scope: !77)
!94 = !DILocation(line: 61, column: 24, scope: !77)
!95 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 63, type: !3)
!96 = distinct !DILexicalBlock(scope: !77, file: !14, line: 62, column: 5)
!97 = !DILocation(line: 63, column: 15, scope: !96)
!98 = !DILocation(line: 63, column: 30, scope: !96)
!99 = !DILocalVariable(name: "source", scope: !100, file: !14, line: 65, type: !46)
!100 = distinct !DILexicalBlock(scope: !96, file: !14, line: 64, column: 9)
!101 = !DILocation(line: 65, column: 17, scope: !100)
!102 = !DILocation(line: 67, column: 13, scope: !100)
!103 = !DILocation(line: 68, column: 26, scope: !100)
!104 = !DILocation(line: 68, column: 13, scope: !100)
!105 = !DILocation(line: 71, column: 1, scope: !77)
