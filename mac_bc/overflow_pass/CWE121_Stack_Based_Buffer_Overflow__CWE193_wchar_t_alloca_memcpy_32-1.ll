; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 40, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = alloca i8, i64 44, align 16, !dbg !35
  %3 = bitcast i8* %2 to i32*, !dbg !36
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !37, metadata !DIExpression()), !dbg !39
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !40
  %5 = load i32*, i32** %4, align 8, !dbg !41
  store i32* %5, i32** %data1, align 8, !dbg !39
  %6 = load i32*, i32** %dataBadBuffer, align 8, !dbg !42
  store i32* %6, i32** %data1, align 8, !dbg !43
  %7 = load i32*, i32** %data1, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  %8 = load i32*, i32** %data1, align 8, !dbg !46
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !47
  store i32* %8, i32** %9, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !49, metadata !DIExpression()), !dbg !51
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !52
  %11 = load i32*, i32** %10, align 8, !dbg !53
  store i32* %11, i32** %data2, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !54, metadata !DIExpression()), !dbg !59
  %12 = bitcast [11 x i32]* %source to i8*, !dbg !59
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %12, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32_bad.source to i8*), i64 44, i1 false), !dbg !59
  %13 = load i32*, i32** %data2, align 8, !dbg !60
  %14 = bitcast i32* %13 to i8*, !dbg !60
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !60
  %15 = bitcast i32* %arraydecay to i8*, !dbg !60
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !60
  %call = call i64 @wcslen(i32* noundef %arraydecay3), !dbg !60
  %add = add i64 %call, 1, !dbg !60
  %mul = mul i64 %add, 4, !dbg !60
  %16 = load i32*, i32** %data2, align 8, !dbg !60
  %17 = bitcast i32* %16 to i8*, !dbg !60
  %18 = call i64 @llvm.objectsize.i64.p0i8(i8* %17, i1 false, i1 true, i1 false), !dbg !60
  %call4 = call i8* @__memcpy_chk(i8* noundef %14, i8* noundef %15, i64 noundef %mul, i64 noundef %18) #5, !dbg !60
  %19 = load i32*, i32** %data2, align 8, !dbg !61
  call void @printWLine(i32* noundef %19), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32_good() #0 !dbg !64 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32_good(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32_bad(), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !90, metadata !DIExpression()), !dbg !91
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !92, metadata !DIExpression()), !dbg !93
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = alloca i8, i64 40, align 16, !dbg !96
  %1 = bitcast i8* %0 to i32*, !dbg !97
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %2 = alloca i8, i64 44, align 16, !dbg !100
  %3 = bitcast i8* %2 to i32*, !dbg !101
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !102, metadata !DIExpression()), !dbg !104
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !105
  %5 = load i32*, i32** %4, align 8, !dbg !106
  store i32* %5, i32** %data1, align 8, !dbg !104
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !107
  store i32* %6, i32** %data1, align 8, !dbg !108
  %7 = load i32*, i32** %data1, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %8 = load i32*, i32** %data1, align 8, !dbg !111
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !112
  store i32* %8, i32** %9, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !114, metadata !DIExpression()), !dbg !116
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !117
  %11 = load i32*, i32** %10, align 8, !dbg !118
  store i32* %11, i32** %data2, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %12 = bitcast [11 x i32]* %source to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %12, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !121
  %13 = load i32*, i32** %data2, align 8, !dbg !122
  %14 = bitcast i32* %13 to i8*, !dbg !122
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !122
  %15 = bitcast i32* %arraydecay to i8*, !dbg !122
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !122
  %call = call i64 @wcslen(i32* noundef %arraydecay3), !dbg !122
  %add = add i64 %call, 1, !dbg !122
  %mul = mul i64 %add, 4, !dbg !122
  %16 = load i32*, i32** %data2, align 8, !dbg !122
  %17 = bitcast i32* %16 to i8*, !dbg !122
  %18 = call i64 @llvm.objectsize.i64.p0i8(i8* %17, i1 false, i1 true, i1 false), !dbg !122
  %call4 = call i8* @__memcpy_chk(i8* noundef %14, i8* noundef %15, i64 noundef %mul, i64 noundef %18) #5, !dbg !122
  %19 = load i32*, i32** %data2, align 8, !dbg !123
  call void @printWLine(i32* noundef %19), !dbg !124
  ret void, !dbg !125
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32_bad", scope: !18, file: !18, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 30, type: !3)
!23 = !DILocation(line: 30, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataPtr1", scope: !17, file: !18, line: 31, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!26 = !DILocation(line: 31, column: 16, scope: !17)
!27 = !DILocalVariable(name: "dataPtr2", scope: !17, file: !18, line: 32, type: !25)
!28 = !DILocation(line: 32, column: 16, scope: !17)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 33, type: !3)
!30 = !DILocation(line: 33, column: 15, scope: !17)
!31 = !DILocation(line: 33, column: 42, scope: !17)
!32 = !DILocation(line: 33, column: 31, scope: !17)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 34, type: !3)
!34 = !DILocation(line: 34, column: 15, scope: !17)
!35 = !DILocation(line: 34, column: 43, scope: !17)
!36 = !DILocation(line: 34, column: 32, scope: !17)
!37 = !DILocalVariable(name: "data", scope: !38, file: !18, line: 36, type: !3)
!38 = distinct !DILexicalBlock(scope: !17, file: !18, line: 35, column: 5)
!39 = !DILocation(line: 36, column: 19, scope: !38)
!40 = !DILocation(line: 36, column: 27, scope: !38)
!41 = !DILocation(line: 36, column: 26, scope: !38)
!42 = !DILocation(line: 39, column: 16, scope: !38)
!43 = !DILocation(line: 39, column: 14, scope: !38)
!44 = !DILocation(line: 40, column: 9, scope: !38)
!45 = !DILocation(line: 40, column: 17, scope: !38)
!46 = !DILocation(line: 41, column: 21, scope: !38)
!47 = !DILocation(line: 41, column: 10, scope: !38)
!48 = !DILocation(line: 41, column: 19, scope: !38)
!49 = !DILocalVariable(name: "data", scope: !50, file: !18, line: 44, type: !3)
!50 = distinct !DILexicalBlock(scope: !17, file: !18, line: 43, column: 5)
!51 = !DILocation(line: 44, column: 19, scope: !50)
!52 = !DILocation(line: 44, column: 27, scope: !50)
!53 = !DILocation(line: 44, column: 26, scope: !50)
!54 = !DILocalVariable(name: "source", scope: !55, file: !18, line: 46, type: !56)
!55 = distinct !DILexicalBlock(scope: !50, file: !18, line: 45, column: 9)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 11)
!59 = !DILocation(line: 46, column: 21, scope: !55)
!60 = !DILocation(line: 49, column: 13, scope: !55)
!61 = !DILocation(line: 50, column: 24, scope: !55)
!62 = !DILocation(line: 50, column: 13, scope: !55)
!63 = !DILocation(line: 53, column: 1, scope: !17)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_32_good", scope: !18, file: !18, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!65 = !DILocation(line: 89, column: 5, scope: !64)
!66 = !DILocation(line: 90, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 101, type: !68, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!68 = !DISubroutineType(types: !69)
!69 = !{!8, !8, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !18, line: 101, type: !8)
!74 = !DILocation(line: 101, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !18, line: 101, type: !70)
!76 = !DILocation(line: 101, column: 27, scope: !67)
!77 = !DILocation(line: 104, column: 22, scope: !67)
!78 = !DILocation(line: 104, column: 12, scope: !67)
!79 = !DILocation(line: 104, column: 5, scope: !67)
!80 = !DILocation(line: 106, column: 5, scope: !67)
!81 = !DILocation(line: 107, column: 5, scope: !67)
!82 = !DILocation(line: 108, column: 5, scope: !67)
!83 = !DILocation(line: 111, column: 5, scope: !67)
!84 = !DILocation(line: 112, column: 5, scope: !67)
!85 = !DILocation(line: 113, column: 5, scope: !67)
!86 = !DILocation(line: 115, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!88 = !DILocalVariable(name: "data", scope: !87, file: !18, line: 62, type: !3)
!89 = !DILocation(line: 62, column: 15, scope: !87)
!90 = !DILocalVariable(name: "dataPtr1", scope: !87, file: !18, line: 63, type: !25)
!91 = !DILocation(line: 63, column: 16, scope: !87)
!92 = !DILocalVariable(name: "dataPtr2", scope: !87, file: !18, line: 64, type: !25)
!93 = !DILocation(line: 64, column: 16, scope: !87)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !18, line: 65, type: !3)
!95 = !DILocation(line: 65, column: 15, scope: !87)
!96 = !DILocation(line: 65, column: 42, scope: !87)
!97 = !DILocation(line: 65, column: 31, scope: !87)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !18, line: 66, type: !3)
!99 = !DILocation(line: 66, column: 15, scope: !87)
!100 = !DILocation(line: 66, column: 43, scope: !87)
!101 = !DILocation(line: 66, column: 32, scope: !87)
!102 = !DILocalVariable(name: "data", scope: !103, file: !18, line: 68, type: !3)
!103 = distinct !DILexicalBlock(scope: !87, file: !18, line: 67, column: 5)
!104 = !DILocation(line: 68, column: 19, scope: !103)
!105 = !DILocation(line: 68, column: 27, scope: !103)
!106 = !DILocation(line: 68, column: 26, scope: !103)
!107 = !DILocation(line: 71, column: 16, scope: !103)
!108 = !DILocation(line: 71, column: 14, scope: !103)
!109 = !DILocation(line: 72, column: 9, scope: !103)
!110 = !DILocation(line: 72, column: 17, scope: !103)
!111 = !DILocation(line: 73, column: 21, scope: !103)
!112 = !DILocation(line: 73, column: 10, scope: !103)
!113 = !DILocation(line: 73, column: 19, scope: !103)
!114 = !DILocalVariable(name: "data", scope: !115, file: !18, line: 76, type: !3)
!115 = distinct !DILexicalBlock(scope: !87, file: !18, line: 75, column: 5)
!116 = !DILocation(line: 76, column: 19, scope: !115)
!117 = !DILocation(line: 76, column: 27, scope: !115)
!118 = !DILocation(line: 76, column: 26, scope: !115)
!119 = !DILocalVariable(name: "source", scope: !120, file: !18, line: 78, type: !56)
!120 = distinct !DILexicalBlock(scope: !115, file: !18, line: 77, column: 9)
!121 = !DILocation(line: 78, column: 21, scope: !120)
!122 = !DILocation(line: 81, column: 13, scope: !120)
!123 = !DILocation(line: 82, column: 24, scope: !120)
!124 = !DILocation(line: 82, column: 13, scope: !120)
!125 = !DILocation(line: 85, column: 1, scope: !87)
