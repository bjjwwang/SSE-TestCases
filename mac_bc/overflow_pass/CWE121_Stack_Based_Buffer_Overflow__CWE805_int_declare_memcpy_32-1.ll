; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !38
  %1 = load i32*, i32** %0, align 8, !dbg !39
  store i32* %1, i32** %data1, align 8, !dbg !37
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i32* %arraydecay, i32** %data1, align 8, !dbg !41
  %2 = load i32*, i32** %data1, align 8, !dbg !42
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !43
  store i32* %2, i32** %3, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !48
  %5 = load i32*, i32** %4, align 8, !dbg !49
  store i32* %5, i32** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !52
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !52
  %7 = load i32*, i32** %data2, align 8, !dbg !53
  %8 = bitcast i32* %7 to i8*, !dbg !53
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %9 = bitcast i32* %arraydecay3 to i8*, !dbg !53
  %10 = load i32*, i32** %data2, align 8, !dbg !53
  %11 = bitcast i32* %10 to i8*, !dbg !53
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !53
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #5, !dbg !53
  %13 = load i32*, i32** %data2, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 0, !dbg !54
  %14 = load i32, i32* %arrayidx, align 4, !dbg !54
  call void @printIntLine(i32 noundef %14), !dbg !55
  ret void, !dbg !56
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* noundef null), !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 noundef %conv), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_good(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_bad(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !83, metadata !DIExpression()), !dbg !84
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !85, metadata !DIExpression()), !dbg !86
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !91, metadata !DIExpression()), !dbg !93
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !94
  %1 = load i32*, i32** %0, align 8, !dbg !95
  store i32* %1, i32** %data1, align 8, !dbg !93
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay, i32** %data1, align 8, !dbg !97
  %2 = load i32*, i32** %data1, align 8, !dbg !98
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !99
  store i32* %2, i32** %3, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !101, metadata !DIExpression()), !dbg !103
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !104
  %5 = load i32*, i32** %4, align 8, !dbg !105
  store i32* %5, i32** %data2, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !108
  %7 = load i32*, i32** %data2, align 8, !dbg !109
  %8 = bitcast i32* %7 to i8*, !dbg !109
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %9 = bitcast i32* %arraydecay3 to i8*, !dbg !109
  %10 = load i32*, i32** %data2, align 8, !dbg !109
  %11 = bitcast i32* %10 to i8*, !dbg !109
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !109
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #5, !dbg !109
  %13 = load i32*, i32** %data2, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 0, !dbg !110
  %14 = load i32, i32* %arrayidx, align 4, !dbg !110
  call void @printIntLine(i32 noundef %14), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 23, column: 11, scope: !11)
!20 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 24, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!22 = !DILocation(line: 24, column: 12, scope: !11)
!23 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 25, type: !21)
!24 = !DILocation(line: 25, column: 12, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 26, column: 9, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 27, column: 9, scope: !11)
!35 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 29, type: !17)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!37 = !DILocation(line: 29, column: 15, scope: !36)
!38 = !DILocation(line: 29, column: 23, scope: !36)
!39 = !DILocation(line: 29, column: 22, scope: !36)
!40 = !DILocation(line: 32, column: 16, scope: !36)
!41 = !DILocation(line: 32, column: 14, scope: !36)
!42 = !DILocation(line: 33, column: 21, scope: !36)
!43 = !DILocation(line: 33, column: 10, scope: !36)
!44 = !DILocation(line: 33, column: 19, scope: !36)
!45 = !DILocalVariable(name: "data", scope: !46, file: !12, line: 36, type: !17)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!47 = !DILocation(line: 36, column: 15, scope: !46)
!48 = !DILocation(line: 36, column: 23, scope: !46)
!49 = !DILocation(line: 36, column: 22, scope: !46)
!50 = !DILocalVariable(name: "source", scope: !51, file: !12, line: 38, type: !31)
!51 = distinct !DILexicalBlock(scope: !46, file: !12, line: 37, column: 9)
!52 = !DILocation(line: 38, column: 17, scope: !51)
!53 = !DILocation(line: 40, column: 13, scope: !51)
!54 = !DILocation(line: 41, column: 26, scope: !51)
!55 = !DILocation(line: 41, column: 13, scope: !51)
!56 = !DILocation(line: 44, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_32_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!58 = !DILocation(line: 77, column: 5, scope: !57)
!59 = !DILocation(line: 78, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !61, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!61 = !DISubroutineType(types: !62)
!62 = !{!18, !18, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 89, type: !18)
!67 = !DILocation(line: 89, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 89, type: !63)
!69 = !DILocation(line: 89, column: 27, scope: !60)
!70 = !DILocation(line: 92, column: 22, scope: !60)
!71 = !DILocation(line: 92, column: 12, scope: !60)
!72 = !DILocation(line: 92, column: 5, scope: !60)
!73 = !DILocation(line: 94, column: 5, scope: !60)
!74 = !DILocation(line: 95, column: 5, scope: !60)
!75 = !DILocation(line: 96, column: 5, scope: !60)
!76 = !DILocation(line: 99, column: 5, scope: !60)
!77 = !DILocation(line: 100, column: 5, scope: !60)
!78 = !DILocation(line: 101, column: 5, scope: !60)
!79 = !DILocation(line: 103, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 53, type: !17)
!82 = !DILocation(line: 53, column: 11, scope: !80)
!83 = !DILocalVariable(name: "dataPtr1", scope: !80, file: !12, line: 54, type: !21)
!84 = !DILocation(line: 54, column: 12, scope: !80)
!85 = !DILocalVariable(name: "dataPtr2", scope: !80, file: !12, line: 55, type: !21)
!86 = !DILocation(line: 55, column: 12, scope: !80)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !12, line: 56, type: !26)
!88 = !DILocation(line: 56, column: 9, scope: !80)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !12, line: 57, type: !31)
!90 = !DILocation(line: 57, column: 9, scope: !80)
!91 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 59, type: !17)
!92 = distinct !DILexicalBlock(scope: !80, file: !12, line: 58, column: 5)
!93 = !DILocation(line: 59, column: 15, scope: !92)
!94 = !DILocation(line: 59, column: 23, scope: !92)
!95 = !DILocation(line: 59, column: 22, scope: !92)
!96 = !DILocation(line: 61, column: 16, scope: !92)
!97 = !DILocation(line: 61, column: 14, scope: !92)
!98 = !DILocation(line: 62, column: 21, scope: !92)
!99 = !DILocation(line: 62, column: 10, scope: !92)
!100 = !DILocation(line: 62, column: 19, scope: !92)
!101 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 65, type: !17)
!102 = distinct !DILexicalBlock(scope: !80, file: !12, line: 64, column: 5)
!103 = !DILocation(line: 65, column: 15, scope: !102)
!104 = !DILocation(line: 65, column: 23, scope: !102)
!105 = !DILocation(line: 65, column: 22, scope: !102)
!106 = !DILocalVariable(name: "source", scope: !107, file: !12, line: 67, type: !31)
!107 = distinct !DILexicalBlock(scope: !102, file: !12, line: 66, column: 9)
!108 = !DILocation(line: 67, column: 17, scope: !107)
!109 = !DILocation(line: 69, column: 13, scope: !107)
!110 = !DILocation(line: 70, column: 26, scope: !107)
!111 = !DILocation(line: 70, column: 13, scope: !107)
!112 = !DILocation(line: 73, column: 1, scope: !80)
