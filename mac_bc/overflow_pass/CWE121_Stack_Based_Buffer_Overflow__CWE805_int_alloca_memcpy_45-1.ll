; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_goodG2BData = internal global i32* null, align 8, !dbg !9

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 200, align 16, !dbg !27
  %1 = bitcast i8* %0 to i32*, !dbg !28
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 400, align 16, !dbg !31
  %3 = bitcast i8* %2 to i32*, !dbg !32
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !30
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !33
  store i32* %4, i32** %data, align 8, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* noundef null), !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 noundef %conv), !dbg !54
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_good(), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_bad(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !62 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_badData, align 8, !dbg !65
  store i32* %0, i32** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !66, metadata !DIExpression()), !dbg !71
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !71
  %2 = load i32*, i32** %data, align 8, !dbg !72
  %3 = bitcast i32* %2 to i8*, !dbg !72
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !72
  %4 = bitcast i32* %arraydecay to i8*, !dbg !72
  %5 = load i32*, i32** %data, align 8, !dbg !72
  %6 = bitcast i32* %5 to i8*, !dbg !72
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !72
  %call = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #5, !dbg !72
  %8 = load i32*, i32** %data, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !73
  %9 = load i32, i32* %arrayidx, align 4, !dbg !73
  call void @printIntLine(i32 noundef %9), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 200, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %2 = alloca i8, i64 400, align 16, !dbg !85
  %3 = bitcast i8* %2 to i32*, !dbg !86
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !84
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !87
  store i32* %4, i32** %data, align 8, !dbg !88
  %5 = load i32*, i32** %data, align 8, !dbg !89
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_goodG2BData, align 8, !dbg !90
  call void @goodG2BSink(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_goodG2BData, align 8, !dbg !96
  store i32* %0, i32** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !99
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %3 = bitcast i32* %2 to i8*, !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %4 = bitcast i32* %arraydecay to i8*, !dbg !100
  %5 = load i32*, i32** %data, align 8, !dbg !100
  %6 = bitcast i32* %5 to i8*, !dbg !100
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !100
  %call = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #5, !dbg !100
  %8 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !101
  %9 = load i32, i32* %arrayidx, align 4, !dbg !101
  call void @printIntLine(i32 noundef %9), !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_badData", scope: !2, file: !11, line: 19, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_goodG2BData", scope: !2, file: !11, line: 20, type: !5, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_bad", scope: !11, file: !11, line: 35, type: !20, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 37, type: !5)
!24 = !DILocation(line: 37, column: 11, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !11, line: 38, type: !5)
!26 = !DILocation(line: 38, column: 11, scope: !19)
!27 = !DILocation(line: 38, column: 34, scope: !19)
!28 = !DILocation(line: 38, column: 27, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !11, line: 39, type: !5)
!30 = !DILocation(line: 39, column: 11, scope: !19)
!31 = !DILocation(line: 39, column: 35, scope: !19)
!32 = !DILocation(line: 39, column: 28, scope: !19)
!33 = !DILocation(line: 42, column: 12, scope: !19)
!34 = !DILocation(line: 42, column: 10, scope: !19)
!35 = !DILocation(line: 43, column: 79, scope: !19)
!36 = !DILocation(line: 43, column: 77, scope: !19)
!37 = !DILocation(line: 44, column: 5, scope: !19)
!38 = !DILocation(line: 45, column: 1, scope: !19)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_45_good", scope: !11, file: !11, line: 74, type: !20, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!40 = !DILocation(line: 76, column: 5, scope: !39)
!41 = !DILocation(line: 77, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 88, type: !43, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!43 = !DISubroutineType(types: !44)
!44 = !{!6, !6, !45}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !11, line: 88, type: !6)
!49 = !DILocation(line: 88, column: 14, scope: !42)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !11, line: 88, type: !45)
!51 = !DILocation(line: 88, column: 27, scope: !42)
!52 = !DILocation(line: 91, column: 22, scope: !42)
!53 = !DILocation(line: 91, column: 12, scope: !42)
!54 = !DILocation(line: 91, column: 5, scope: !42)
!55 = !DILocation(line: 93, column: 5, scope: !42)
!56 = !DILocation(line: 94, column: 5, scope: !42)
!57 = !DILocation(line: 95, column: 5, scope: !42)
!58 = !DILocation(line: 98, column: 5, scope: !42)
!59 = !DILocation(line: 99, column: 5, scope: !42)
!60 = !DILocation(line: 100, column: 5, scope: !42)
!61 = !DILocation(line: 102, column: 5, scope: !42)
!62 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!63 = !DILocalVariable(name: "data", scope: !62, file: !11, line: 26, type: !5)
!64 = !DILocation(line: 26, column: 11, scope: !62)
!65 = !DILocation(line: 26, column: 18, scope: !62)
!66 = !DILocalVariable(name: "source", scope: !67, file: !11, line: 28, type: !68)
!67 = distinct !DILexicalBlock(scope: !62, file: !11, line: 27, column: 5)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 100)
!71 = !DILocation(line: 28, column: 13, scope: !67)
!72 = !DILocation(line: 30, column: 9, scope: !67)
!73 = !DILocation(line: 31, column: 22, scope: !67)
!74 = !DILocation(line: 31, column: 9, scope: !67)
!75 = !DILocation(line: 33, column: 1, scope: !62)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 63, type: !20, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!77 = !DILocalVariable(name: "data", scope: !76, file: !11, line: 65, type: !5)
!78 = !DILocation(line: 65, column: 11, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !11, line: 66, type: !5)
!80 = !DILocation(line: 66, column: 11, scope: !76)
!81 = !DILocation(line: 66, column: 34, scope: !76)
!82 = !DILocation(line: 66, column: 27, scope: !76)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !11, line: 67, type: !5)
!84 = !DILocation(line: 67, column: 11, scope: !76)
!85 = !DILocation(line: 67, column: 35, scope: !76)
!86 = !DILocation(line: 67, column: 28, scope: !76)
!87 = !DILocation(line: 69, column: 12, scope: !76)
!88 = !DILocation(line: 69, column: 10, scope: !76)
!89 = !DILocation(line: 70, column: 83, scope: !76)
!90 = !DILocation(line: 70, column: 81, scope: !76)
!91 = !DILocation(line: 71, column: 5, scope: !76)
!92 = !DILocation(line: 72, column: 1, scope: !76)
!93 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!94 = !DILocalVariable(name: "data", scope: !93, file: !11, line: 54, type: !5)
!95 = !DILocation(line: 54, column: 11, scope: !93)
!96 = !DILocation(line: 54, column: 18, scope: !93)
!97 = !DILocalVariable(name: "source", scope: !98, file: !11, line: 56, type: !68)
!98 = distinct !DILexicalBlock(scope: !93, file: !11, line: 55, column: 5)
!99 = !DILocation(line: 56, column: 13, scope: !98)
!100 = !DILocation(line: 58, column: 9, scope: !98)
!101 = !DILocation(line: 59, column: 22, scope: !98)
!102 = !DILocation(line: 59, column: 9, scope: !98)
!103 = !DILocation(line: 61, column: 1, scope: !93)
