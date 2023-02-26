; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_unionType = type { i32* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = alloca i8, i64 40, align 16, !dbg !33
  %1 = bitcast i8* %0 to i32*, !dbg !34
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !36
  %2 = alloca i8, i64 44, align 16, !dbg !37
  %3 = bitcast i8* %2 to i32*, !dbg !38
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !36
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  store i32* %4, i32** %data, align 8, !dbg !40
  %5 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_unionType* %myUnion to i32**, !dbg !44
  store i32* %6, i32** %unionFirst, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !46, metadata !DIExpression()), !dbg !48
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_unionType* %myUnion to i32**, !dbg !49
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !49
  store i32* %7, i32** %data1, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_bad.source to i8*), i64 44, i1 false), !dbg !55
  %9 = load i32*, i32** %data1, align 8, !dbg !56
  %10 = bitcast i32* %9 to i8*, !dbg !56
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !56
  %11 = bitcast i32* %arraydecay to i8*, !dbg !56
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !56
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !56
  %add = add i64 %call, 1, !dbg !56
  %mul = mul i64 %add, 4, !dbg !56
  %12 = load i32*, i32** %data1, align 8, !dbg !56
  %13 = bitcast i32* %12 to i8*, !dbg !56
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !56
  %call3 = call i8* @__memmove_chk(i8* noundef %10, i8* noundef %11, i64 noundef %mul, i64 noundef %14) #5, !dbg !56
  %15 = load i32*, i32** %data1, align 8, !dbg !57
  call void @printWLine(i32* noundef %15), !dbg !58
  ret void, !dbg !59
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* noundef null), !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 noundef %conv), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_good(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_bad(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_unionType* %myUnion, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = alloca i8, i64 40, align 16, !dbg !90
  %1 = bitcast i8* %0 to i32*, !dbg !91
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %2 = alloca i8, i64 44, align 16, !dbg !94
  %3 = bitcast i8* %2 to i32*, !dbg !95
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !93
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !96
  store i32* %4, i32** %data, align 8, !dbg !97
  %5 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  %6 = load i32*, i32** %data, align 8, !dbg !100
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_unionType* %myUnion to i32**, !dbg !101
  store i32* %6, i32** %unionFirst, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !103, metadata !DIExpression()), !dbg !105
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_unionType* %myUnion to i32**, !dbg !106
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !106
  store i32* %7, i32** %data1, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !109
  %9 = load i32*, i32** %data1, align 8, !dbg !110
  %10 = bitcast i32* %9 to i8*, !dbg !110
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !110
  %11 = bitcast i32* %arraydecay to i8*, !dbg !110
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !110
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !110
  %add = add i64 %call, 1, !dbg !110
  %mul = mul i64 %add, 4, !dbg !110
  %12 = load i32*, i32** %data1, align 8, !dbg !110
  %13 = bitcast i32* %12 to i8*, !dbg !110
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !110
  %call3 = call i8* @__memmove_chk(i8* noundef %10, i8* noundef %11, i64 noundef %mul, i64 noundef %14) #5, !dbg !110
  %15 = load i32*, i32** %data1, align 8, !dbg !111
  call void @printWLine(i32* noundef %15), !dbg !112
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_bad", scope: !18, file: !18, line: 34, type: !19, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 36, type: !3)
!23 = !DILocation(line: 36, column: 15, scope: !17)
!24 = !DILocalVariable(name: "myUnion", scope: !17, file: !18, line: 37, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_unionType", file: !18, line: 30, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !18, line: 26, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !18, line: 28, baseType: !3, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !18, line: 29, baseType: !3, size: 64)
!30 = !DILocation(line: 37, column: 84, scope: !17)
!31 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 38, type: !3)
!32 = !DILocation(line: 38, column: 15, scope: !17)
!33 = !DILocation(line: 38, column: 42, scope: !17)
!34 = !DILocation(line: 38, column: 31, scope: !17)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 39, type: !3)
!36 = !DILocation(line: 39, column: 15, scope: !17)
!37 = !DILocation(line: 39, column: 43, scope: !17)
!38 = !DILocation(line: 39, column: 32, scope: !17)
!39 = !DILocation(line: 42, column: 12, scope: !17)
!40 = !DILocation(line: 42, column: 10, scope: !17)
!41 = !DILocation(line: 43, column: 5, scope: !17)
!42 = !DILocation(line: 43, column: 13, scope: !17)
!43 = !DILocation(line: 44, column: 26, scope: !17)
!44 = !DILocation(line: 44, column: 13, scope: !17)
!45 = !DILocation(line: 44, column: 24, scope: !17)
!46 = !DILocalVariable(name: "data", scope: !47, file: !18, line: 46, type: !3)
!47 = distinct !DILexicalBlock(scope: !17, file: !18, line: 45, column: 5)
!48 = !DILocation(line: 46, column: 19, scope: !47)
!49 = !DILocation(line: 46, column: 34, scope: !47)
!50 = !DILocalVariable(name: "source", scope: !51, file: !18, line: 48, type: !52)
!51 = distinct !DILexicalBlock(scope: !47, file: !18, line: 47, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 11)
!55 = !DILocation(line: 48, column: 21, scope: !51)
!56 = !DILocation(line: 51, column: 13, scope: !51)
!57 = !DILocation(line: 52, column: 24, scope: !51)
!58 = !DILocation(line: 52, column: 13, scope: !51)
!59 = !DILocation(line: 55, column: 1, scope: !17)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_34_good", scope: !18, file: !18, line: 85, type: !19, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!61 = !DILocation(line: 87, column: 5, scope: !60)
!62 = !DILocation(line: 88, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 99, type: !64, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!64 = !DISubroutineType(types: !65)
!65 = !{!8, !8, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !18, line: 99, type: !8)
!70 = !DILocation(line: 99, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !18, line: 99, type: !66)
!72 = !DILocation(line: 99, column: 27, scope: !63)
!73 = !DILocation(line: 102, column: 22, scope: !63)
!74 = !DILocation(line: 102, column: 12, scope: !63)
!75 = !DILocation(line: 102, column: 5, scope: !63)
!76 = !DILocation(line: 104, column: 5, scope: !63)
!77 = !DILocation(line: 105, column: 5, scope: !63)
!78 = !DILocation(line: 106, column: 5, scope: !63)
!79 = !DILocation(line: 109, column: 5, scope: !63)
!80 = !DILocation(line: 110, column: 5, scope: !63)
!81 = !DILocation(line: 111, column: 5, scope: !63)
!82 = !DILocation(line: 113, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 62, type: !19, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!84 = !DILocalVariable(name: "data", scope: !83, file: !18, line: 64, type: !3)
!85 = !DILocation(line: 64, column: 15, scope: !83)
!86 = !DILocalVariable(name: "myUnion", scope: !83, file: !18, line: 65, type: !25)
!87 = !DILocation(line: 65, column: 84, scope: !83)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !18, line: 66, type: !3)
!89 = !DILocation(line: 66, column: 15, scope: !83)
!90 = !DILocation(line: 66, column: 42, scope: !83)
!91 = !DILocation(line: 66, column: 31, scope: !83)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !18, line: 67, type: !3)
!93 = !DILocation(line: 67, column: 15, scope: !83)
!94 = !DILocation(line: 67, column: 43, scope: !83)
!95 = !DILocation(line: 67, column: 32, scope: !83)
!96 = !DILocation(line: 70, column: 12, scope: !83)
!97 = !DILocation(line: 70, column: 10, scope: !83)
!98 = !DILocation(line: 71, column: 5, scope: !83)
!99 = !DILocation(line: 71, column: 13, scope: !83)
!100 = !DILocation(line: 72, column: 26, scope: !83)
!101 = !DILocation(line: 72, column: 13, scope: !83)
!102 = !DILocation(line: 72, column: 24, scope: !83)
!103 = !DILocalVariable(name: "data", scope: !104, file: !18, line: 74, type: !3)
!104 = distinct !DILexicalBlock(scope: !83, file: !18, line: 73, column: 5)
!105 = !DILocation(line: 74, column: 19, scope: !104)
!106 = !DILocation(line: 74, column: 34, scope: !104)
!107 = !DILocalVariable(name: "source", scope: !108, file: !18, line: 76, type: !52)
!108 = distinct !DILexicalBlock(scope: !104, file: !18, line: 75, column: 9)
!109 = !DILocation(line: 76, column: 21, scope: !108)
!110 = !DILocation(line: 79, column: 13, scope: !108)
!111 = !DILocation(line: 80, column: 24, scope: !108)
!112 = !DILocation(line: 80, column: 13, scope: !108)
!113 = !DILocation(line: 83, column: 1, scope: !83)
