; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !29
  %1 = load i32*, i32** %0, align 8, !dbg !30
  store i32* %1, i32** %data1, align 8, !dbg !28
  %2 = alloca i8, i64 10, align 16, !dbg !31
  %3 = bitcast i8* %2 to i32*, !dbg !32
  store i32* %3, i32** %data1, align 8, !dbg !33
  %4 = load i32*, i32** %data1, align 8, !dbg !34
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !35
  store i32* %4, i32** %5, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !37, metadata !DIExpression()), !dbg !39
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !40
  %7 = load i32*, i32** %6, align 8, !dbg !41
  store i32* %7, i32** %data2, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %8 = bitcast [10 x i32]* %source to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !47
  %9 = load i32*, i32** %data2, align 8, !dbg !48
  %10 = bitcast i32* %9 to i8*, !dbg !48
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !48
  %11 = bitcast i32* %arraydecay to i8*, !dbg !48
  %12 = load i32*, i32** %data2, align 8, !dbg !48
  %13 = bitcast i32* %12 to i8*, !dbg !48
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !48
  %call = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %11, i64 noundef 40, i64 noundef %14) #5, !dbg !48
  %15 = load i32*, i32** %data2, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %15, i64 0, !dbg !49
  %16 = load i32, i32* %arrayidx, align 4, !dbg !49
  call void @printIntLine(i32 noundef %16), !dbg !50
  ret void, !dbg !51
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* noundef null), !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 noundef %conv), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_bad(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !78, metadata !DIExpression()), !dbg !79
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !80, metadata !DIExpression()), !dbg !81
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !83, metadata !DIExpression()), !dbg !85
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !86
  %1 = load i32*, i32** %0, align 8, !dbg !87
  store i32* %1, i32** %data1, align 8, !dbg !85
  %2 = alloca i8, i64 40, align 16, !dbg !88
  %3 = bitcast i8* %2 to i32*, !dbg !89
  store i32* %3, i32** %data1, align 8, !dbg !90
  %4 = load i32*, i32** %data1, align 8, !dbg !91
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !92
  store i32* %4, i32** %5, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !94, metadata !DIExpression()), !dbg !96
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !97
  %7 = load i32*, i32** %6, align 8, !dbg !98
  store i32* %7, i32** %data2, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %8 = bitcast [10 x i32]* %source to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !101
  %9 = load i32*, i32** %data2, align 8, !dbg !102
  %10 = bitcast i32* %9 to i8*, !dbg !102
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !102
  %11 = bitcast i32* %arraydecay to i8*, !dbg !102
  %12 = load i32*, i32** %data2, align 8, !dbg !102
  %13 = bitcast i32* %12 to i8*, !dbg !102
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !102
  %call = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %11, i64 noundef 40, i64 noundef %14) #5, !dbg !102
  %15 = load i32*, i32** %data2, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %15, i64 0, !dbg !103
  %16 = load i32, i32* %arrayidx, align 4, !dbg !103
  call void @printIntLine(i32 noundef %16), !dbg !104
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !3)
!19 = !DILocation(line: 23, column: 11, scope: !13)
!20 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 24, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!22 = !DILocation(line: 24, column: 12, scope: !13)
!23 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 25, type: !21)
!24 = !DILocation(line: 25, column: 12, scope: !13)
!25 = !DILocation(line: 26, column: 10, scope: !13)
!26 = !DILocalVariable(name: "data", scope: !27, file: !14, line: 28, type: !3)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 27, column: 5)
!28 = !DILocation(line: 28, column: 15, scope: !27)
!29 = !DILocation(line: 28, column: 23, scope: !27)
!30 = !DILocation(line: 28, column: 22, scope: !27)
!31 = !DILocation(line: 30, column: 23, scope: !27)
!32 = !DILocation(line: 30, column: 16, scope: !27)
!33 = !DILocation(line: 30, column: 14, scope: !27)
!34 = !DILocation(line: 31, column: 21, scope: !27)
!35 = !DILocation(line: 31, column: 10, scope: !27)
!36 = !DILocation(line: 31, column: 19, scope: !27)
!37 = !DILocalVariable(name: "data", scope: !38, file: !14, line: 34, type: !3)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!39 = !DILocation(line: 34, column: 15, scope: !38)
!40 = !DILocation(line: 34, column: 23, scope: !38)
!41 = !DILocation(line: 34, column: 22, scope: !38)
!42 = !DILocalVariable(name: "source", scope: !43, file: !14, line: 36, type: !44)
!43 = distinct !DILexicalBlock(scope: !38, file: !14, line: 35, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 10)
!47 = !DILocation(line: 36, column: 17, scope: !43)
!48 = !DILocation(line: 38, column: 13, scope: !43)
!49 = !DILocation(line: 39, column: 26, scope: !43)
!50 = !DILocation(line: 39, column: 13, scope: !43)
!51 = !DILocation(line: 42, column: 1, scope: !13)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_32_good", scope: !14, file: !14, line: 72, type: !15, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!53 = !DILocation(line: 74, column: 5, scope: !52)
!54 = !DILocation(line: 75, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 86, type: !56, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!56 = !DISubroutineType(types: !57)
!57 = !{!4, !4, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 86, type: !4)
!62 = !DILocation(line: 86, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 86, type: !58)
!64 = !DILocation(line: 86, column: 27, scope: !55)
!65 = !DILocation(line: 89, column: 22, scope: !55)
!66 = !DILocation(line: 89, column: 12, scope: !55)
!67 = !DILocation(line: 89, column: 5, scope: !55)
!68 = !DILocation(line: 91, column: 5, scope: !55)
!69 = !DILocation(line: 92, column: 5, scope: !55)
!70 = !DILocation(line: 93, column: 5, scope: !55)
!71 = !DILocation(line: 96, column: 5, scope: !55)
!72 = !DILocation(line: 97, column: 5, scope: !55)
!73 = !DILocation(line: 98, column: 5, scope: !55)
!74 = !DILocation(line: 100, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!76 = !DILocalVariable(name: "data", scope: !75, file: !14, line: 51, type: !3)
!77 = !DILocation(line: 51, column: 11, scope: !75)
!78 = !DILocalVariable(name: "dataPtr1", scope: !75, file: !14, line: 52, type: !21)
!79 = !DILocation(line: 52, column: 12, scope: !75)
!80 = !DILocalVariable(name: "dataPtr2", scope: !75, file: !14, line: 53, type: !21)
!81 = !DILocation(line: 53, column: 12, scope: !75)
!82 = !DILocation(line: 54, column: 10, scope: !75)
!83 = !DILocalVariable(name: "data", scope: !84, file: !14, line: 56, type: !3)
!84 = distinct !DILexicalBlock(scope: !75, file: !14, line: 55, column: 5)
!85 = !DILocation(line: 56, column: 15, scope: !84)
!86 = !DILocation(line: 56, column: 23, scope: !84)
!87 = !DILocation(line: 56, column: 22, scope: !84)
!88 = !DILocation(line: 58, column: 23, scope: !84)
!89 = !DILocation(line: 58, column: 16, scope: !84)
!90 = !DILocation(line: 58, column: 14, scope: !84)
!91 = !DILocation(line: 59, column: 21, scope: !84)
!92 = !DILocation(line: 59, column: 10, scope: !84)
!93 = !DILocation(line: 59, column: 19, scope: !84)
!94 = !DILocalVariable(name: "data", scope: !95, file: !14, line: 62, type: !3)
!95 = distinct !DILexicalBlock(scope: !75, file: !14, line: 61, column: 5)
!96 = !DILocation(line: 62, column: 15, scope: !95)
!97 = !DILocation(line: 62, column: 23, scope: !95)
!98 = !DILocation(line: 62, column: 22, scope: !95)
!99 = !DILocalVariable(name: "source", scope: !100, file: !14, line: 64, type: !44)
!100 = distinct !DILexicalBlock(scope: !95, file: !14, line: 63, column: 9)
!101 = !DILocation(line: 64, column: 17, scope: !100)
!102 = !DILocation(line: 66, column: 13, scope: !100)
!103 = !DILocation(line: 67, column: 26, scope: !100)
!104 = !DILocation(line: 67, column: 13, scope: !100)
!105 = !DILocation(line: 70, column: 1, scope: !75)
