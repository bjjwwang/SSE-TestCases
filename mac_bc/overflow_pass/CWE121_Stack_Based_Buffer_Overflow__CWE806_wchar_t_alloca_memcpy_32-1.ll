; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_32_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 400, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBuffer, align 8, !dbg !30
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  store i32* %2, i32** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !35, metadata !DIExpression()), !dbg !37
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !38
  %4 = load i32*, i32** %3, align 8, !dbg !39
  store i32* %4, i32** %data1, align 8, !dbg !37
  %5 = load i32*, i32** %data1, align 8, !dbg !40
  %call = call i32* @wmemset(i32* noundef %5, i32 noundef 65, i64 noundef 99), !dbg !41
  %6 = load i32*, i32** %data1, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %7 = load i32*, i32** %data1, align 8, !dbg !44
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !45
  store i32* %7, i32** %8, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !47, metadata !DIExpression()), !dbg !49
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !50
  %10 = load i32*, i32** %9, align 8, !dbg !51
  store i32* %10, i32** %data2, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !52, metadata !DIExpression()), !dbg !57
  %11 = bitcast [50 x i32]* %dest to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 200, i1 false), !dbg !57
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !58
  %12 = bitcast i32* %arraydecay to i8*, !dbg !58
  %13 = load i32*, i32** %data2, align 8, !dbg !58
  %14 = bitcast i32* %13 to i8*, !dbg !58
  %15 = load i32*, i32** %data2, align 8, !dbg !58
  %call3 = call i64 @wcslen(i32* noundef %15), !dbg !58
  %mul = mul i64 %call3, 4, !dbg !58
  %call4 = call i8* @__memcpy_chk(i8* noundef %12, i8* noundef %14, i64 noundef %mul, i64 noundef 200) #5, !dbg !58
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !59
  store i32 0, i32* %arrayidx5, align 4, !dbg !60
  %16 = load i32*, i32** %data2, align 8, !dbg !61
  call void @printWLine(i32* noundef %16), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_32_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* noundef null), !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 noundef %conv), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_32_good(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_32_bad(), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !90, metadata !DIExpression()), !dbg !91
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !92, metadata !DIExpression()), !dbg !93
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = alloca i8, i64 400, align 16, !dbg !96
  %1 = bitcast i8* %0 to i32*, !dbg !97
  store i32* %1, i32** %dataBuffer, align 8, !dbg !95
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  store i32* %2, i32** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !100, metadata !DIExpression()), !dbg !102
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !103
  %4 = load i32*, i32** %3, align 8, !dbg !104
  store i32* %4, i32** %data1, align 8, !dbg !102
  %5 = load i32*, i32** %data1, align 8, !dbg !105
  %call = call i32* @wmemset(i32* noundef %5, i32 noundef 65, i64 noundef 49), !dbg !106
  %6 = load i32*, i32** %data1, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 49, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %7 = load i32*, i32** %data1, align 8, !dbg !109
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !110
  store i32* %7, i32** %8, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !112, metadata !DIExpression()), !dbg !114
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !115
  %10 = load i32*, i32** %9, align 8, !dbg !116
  store i32* %10, i32** %data2, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %11 = bitcast [50 x i32]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 200, i1 false), !dbg !119
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !120
  %12 = bitcast i32* %arraydecay to i8*, !dbg !120
  %13 = load i32*, i32** %data2, align 8, !dbg !120
  %14 = bitcast i32* %13 to i8*, !dbg !120
  %15 = load i32*, i32** %data2, align 8, !dbg !120
  %call3 = call i64 @wcslen(i32* noundef %15), !dbg !120
  %mul = mul i64 %call3, 4, !dbg !120
  %call4 = call i8* @__memcpy_chk(i8* noundef %12, i8* noundef %14, i64 noundef %mul, i64 noundef 200) #5, !dbg !120
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !121
  store i32 0, i32* %arrayidx5, align 4, !dbg !122
  %16 = load i32*, i32** %data2, align 8, !dbg !123
  call void @printWLine(i32* noundef %16), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_32_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataPtr1", scope: !17, file: !18, line: 26, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!26 = !DILocation(line: 26, column: 16, scope: !17)
!27 = !DILocalVariable(name: "dataPtr2", scope: !17, file: !18, line: 27, type: !25)
!28 = !DILocation(line: 27, column: 16, scope: !17)
!29 = !DILocalVariable(name: "dataBuffer", scope: !17, file: !18, line: 28, type: !3)
!30 = !DILocation(line: 28, column: 15, scope: !17)
!31 = !DILocation(line: 28, column: 39, scope: !17)
!32 = !DILocation(line: 28, column: 28, scope: !17)
!33 = !DILocation(line: 29, column: 12, scope: !17)
!34 = !DILocation(line: 29, column: 10, scope: !17)
!35 = !DILocalVariable(name: "data", scope: !36, file: !18, line: 31, type: !3)
!36 = distinct !DILexicalBlock(scope: !17, file: !18, line: 30, column: 5)
!37 = !DILocation(line: 31, column: 19, scope: !36)
!38 = !DILocation(line: 31, column: 27, scope: !36)
!39 = !DILocation(line: 31, column: 26, scope: !36)
!40 = !DILocation(line: 33, column: 17, scope: !36)
!41 = !DILocation(line: 33, column: 9, scope: !36)
!42 = !DILocation(line: 34, column: 9, scope: !36)
!43 = !DILocation(line: 34, column: 21, scope: !36)
!44 = !DILocation(line: 35, column: 21, scope: !36)
!45 = !DILocation(line: 35, column: 10, scope: !36)
!46 = !DILocation(line: 35, column: 19, scope: !36)
!47 = !DILocalVariable(name: "data", scope: !48, file: !18, line: 38, type: !3)
!48 = distinct !DILexicalBlock(scope: !17, file: !18, line: 37, column: 5)
!49 = !DILocation(line: 38, column: 19, scope: !48)
!50 = !DILocation(line: 38, column: 27, scope: !48)
!51 = !DILocation(line: 38, column: 26, scope: !48)
!52 = !DILocalVariable(name: "dest", scope: !53, file: !18, line: 40, type: !54)
!53 = distinct !DILexicalBlock(scope: !48, file: !18, line: 39, column: 9)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 50)
!57 = !DILocation(line: 40, column: 21, scope: !53)
!58 = !DILocation(line: 42, column: 13, scope: !53)
!59 = !DILocation(line: 43, column: 13, scope: !53)
!60 = !DILocation(line: 43, column: 24, scope: !53)
!61 = !DILocation(line: 44, column: 24, scope: !53)
!62 = !DILocation(line: 44, column: 13, scope: !53)
!63 = !DILocation(line: 47, column: 1, scope: !17)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_32_good", scope: !18, file: !18, line: 80, type: !19, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!65 = !DILocation(line: 82, column: 5, scope: !64)
!66 = !DILocation(line: 83, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 94, type: !68, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!68 = !DISubroutineType(types: !69)
!69 = !{!8, !8, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !18, line: 94, type: !8)
!74 = !DILocation(line: 94, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !18, line: 94, type: !70)
!76 = !DILocation(line: 94, column: 27, scope: !67)
!77 = !DILocation(line: 97, column: 22, scope: !67)
!78 = !DILocation(line: 97, column: 12, scope: !67)
!79 = !DILocation(line: 97, column: 5, scope: !67)
!80 = !DILocation(line: 99, column: 5, scope: !67)
!81 = !DILocation(line: 100, column: 5, scope: !67)
!82 = !DILocation(line: 101, column: 5, scope: !67)
!83 = !DILocation(line: 104, column: 5, scope: !67)
!84 = !DILocation(line: 105, column: 5, scope: !67)
!85 = !DILocation(line: 106, column: 5, scope: !67)
!86 = !DILocation(line: 108, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 54, type: !19, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!88 = !DILocalVariable(name: "data", scope: !87, file: !18, line: 56, type: !3)
!89 = !DILocation(line: 56, column: 15, scope: !87)
!90 = !DILocalVariable(name: "dataPtr1", scope: !87, file: !18, line: 57, type: !25)
!91 = !DILocation(line: 57, column: 16, scope: !87)
!92 = !DILocalVariable(name: "dataPtr2", scope: !87, file: !18, line: 58, type: !25)
!93 = !DILocation(line: 58, column: 16, scope: !87)
!94 = !DILocalVariable(name: "dataBuffer", scope: !87, file: !18, line: 59, type: !3)
!95 = !DILocation(line: 59, column: 15, scope: !87)
!96 = !DILocation(line: 59, column: 39, scope: !87)
!97 = !DILocation(line: 59, column: 28, scope: !87)
!98 = !DILocation(line: 60, column: 12, scope: !87)
!99 = !DILocation(line: 60, column: 10, scope: !87)
!100 = !DILocalVariable(name: "data", scope: !101, file: !18, line: 62, type: !3)
!101 = distinct !DILexicalBlock(scope: !87, file: !18, line: 61, column: 5)
!102 = !DILocation(line: 62, column: 19, scope: !101)
!103 = !DILocation(line: 62, column: 27, scope: !101)
!104 = !DILocation(line: 62, column: 26, scope: !101)
!105 = !DILocation(line: 64, column: 17, scope: !101)
!106 = !DILocation(line: 64, column: 9, scope: !101)
!107 = !DILocation(line: 65, column: 9, scope: !101)
!108 = !DILocation(line: 65, column: 20, scope: !101)
!109 = !DILocation(line: 66, column: 21, scope: !101)
!110 = !DILocation(line: 66, column: 10, scope: !101)
!111 = !DILocation(line: 66, column: 19, scope: !101)
!112 = !DILocalVariable(name: "data", scope: !113, file: !18, line: 69, type: !3)
!113 = distinct !DILexicalBlock(scope: !87, file: !18, line: 68, column: 5)
!114 = !DILocation(line: 69, column: 19, scope: !113)
!115 = !DILocation(line: 69, column: 27, scope: !113)
!116 = !DILocation(line: 69, column: 26, scope: !113)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !18, line: 71, type: !54)
!118 = distinct !DILexicalBlock(scope: !113, file: !18, line: 70, column: 9)
!119 = !DILocation(line: 71, column: 21, scope: !118)
!120 = !DILocation(line: 73, column: 13, scope: !118)
!121 = !DILocation(line: 74, column: 13, scope: !118)
!122 = !DILocation(line: 74, column: 24, scope: !118)
!123 = !DILocation(line: 75, column: 24, scope: !118)
!124 = !DILocation(line: 75, column: 13, scope: !118)
!125 = !DILocation(line: 78, column: 1, scope: !87)
