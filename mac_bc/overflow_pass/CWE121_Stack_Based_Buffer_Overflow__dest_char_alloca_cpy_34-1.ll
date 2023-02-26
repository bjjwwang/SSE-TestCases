; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 50, align 16, !dbg !29
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %1 = alloca i8, i64 100, align 16, !dbg !32
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !31
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %2, i8** %data, align 8, !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !38
  store i8* %4, i8** %unionFirst, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !40, metadata !DIExpression()), !dbg !42
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !43
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !43
  store i8* %5, i8** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx2, align 1, !dbg !52
  %6 = load i8*, i8** %data1, align 8, !dbg !53
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !53
  %7 = load i8*, i8** %data1, align 8, !dbg !53
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !53
  %call = call i8* @__strcpy_chk(i8* noundef %6, i8* noundef %arraydecay3, i64 noundef %8) #5, !dbg !53
  %9 = load i8*, i8** %data1, align 8, !dbg !54
  call void @printLine(i8* noundef %9), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_good() #0 !dbg !57 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_unionType* %myUnion, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 50, align 16, !dbg !86
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %1 = alloca i8, i64 100, align 16, !dbg !89
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !88
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !90
  store i8* %2, i8** %data, align 8, !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !95
  store i8* %4, i8** %unionFirst, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !97, metadata !DIExpression()), !dbg !99
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !100
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !100
  store i8* %5, i8** %data1, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !104
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx2, align 1, !dbg !106
  %6 = load i8*, i8** %data1, align 8, !dbg !107
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  %7 = load i8*, i8** %data1, align 8, !dbg !107
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !107
  %call = call i8* @__strcpy_chk(i8* noundef %6, i8* noundef %arraydecay3, i64 noundef %8) #5, !dbg !107
  %9 = load i8*, i8** %data1, align 8, !dbg !108
  call void @printLine(i8* noundef %9), !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !3)
!19 = !DILocation(line: 31, column: 12, scope: !13)
!20 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_unionType", file: !14, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !14, line: 23, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !14, line: 24, baseType: !3, size: 64)
!26 = !DILocation(line: 32, column: 75, scope: !13)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !3)
!28 = !DILocation(line: 33, column: 12, scope: !13)
!29 = !DILocation(line: 33, column: 36, scope: !13)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !3)
!31 = !DILocation(line: 34, column: 12, scope: !13)
!32 = !DILocation(line: 34, column: 37, scope: !13)
!33 = !DILocation(line: 37, column: 12, scope: !13)
!34 = !DILocation(line: 37, column: 10, scope: !13)
!35 = !DILocation(line: 38, column: 5, scope: !13)
!36 = !DILocation(line: 38, column: 13, scope: !13)
!37 = !DILocation(line: 39, column: 26, scope: !13)
!38 = !DILocation(line: 39, column: 13, scope: !13)
!39 = !DILocation(line: 39, column: 24, scope: !13)
!40 = !DILocalVariable(name: "data", scope: !41, file: !14, line: 41, type: !3)
!41 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!42 = !DILocation(line: 41, column: 16, scope: !41)
!43 = !DILocation(line: 41, column: 31, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !14, line: 43, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !14, line: 42, column: 9)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 43, column: 18, scope: !45)
!50 = !DILocation(line: 44, column: 13, scope: !45)
!51 = !DILocation(line: 45, column: 13, scope: !45)
!52 = !DILocation(line: 45, column: 27, scope: !45)
!53 = !DILocation(line: 47, column: 13, scope: !45)
!54 = !DILocation(line: 48, column: 23, scope: !45)
!55 = !DILocation(line: 48, column: 13, scope: !45)
!56 = !DILocation(line: 51, column: 1, scope: !13)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_34_good", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!58 = !DILocation(line: 83, column: 5, scope: !57)
!59 = !DILocation(line: 84, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 95, type: !61, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !14, line: 95, type: !63)
!66 = !DILocation(line: 95, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !14, line: 95, type: !64)
!68 = !DILocation(line: 95, column: 27, scope: !60)
!69 = !DILocation(line: 98, column: 22, scope: !60)
!70 = !DILocation(line: 98, column: 12, scope: !60)
!71 = !DILocation(line: 98, column: 5, scope: !60)
!72 = !DILocation(line: 100, column: 5, scope: !60)
!73 = !DILocation(line: 101, column: 5, scope: !60)
!74 = !DILocation(line: 102, column: 5, scope: !60)
!75 = !DILocation(line: 105, column: 5, scope: !60)
!76 = !DILocation(line: 106, column: 5, scope: !60)
!77 = !DILocation(line: 107, column: 5, scope: !60)
!78 = !DILocation(line: 109, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!80 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 60, type: !3)
!81 = !DILocation(line: 60, column: 12, scope: !79)
!82 = !DILocalVariable(name: "myUnion", scope: !79, file: !14, line: 61, type: !21)
!83 = !DILocation(line: 61, column: 75, scope: !79)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !14, line: 62, type: !3)
!85 = !DILocation(line: 62, column: 12, scope: !79)
!86 = !DILocation(line: 62, column: 36, scope: !79)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !14, line: 63, type: !3)
!88 = !DILocation(line: 63, column: 12, scope: !79)
!89 = !DILocation(line: 63, column: 37, scope: !79)
!90 = !DILocation(line: 65, column: 12, scope: !79)
!91 = !DILocation(line: 65, column: 10, scope: !79)
!92 = !DILocation(line: 66, column: 5, scope: !79)
!93 = !DILocation(line: 66, column: 13, scope: !79)
!94 = !DILocation(line: 67, column: 26, scope: !79)
!95 = !DILocation(line: 67, column: 13, scope: !79)
!96 = !DILocation(line: 67, column: 24, scope: !79)
!97 = !DILocalVariable(name: "data", scope: !98, file: !14, line: 69, type: !3)
!98 = distinct !DILexicalBlock(scope: !79, file: !14, line: 68, column: 5)
!99 = !DILocation(line: 69, column: 16, scope: !98)
!100 = !DILocation(line: 69, column: 31, scope: !98)
!101 = !DILocalVariable(name: "source", scope: !102, file: !14, line: 71, type: !46)
!102 = distinct !DILexicalBlock(scope: !98, file: !14, line: 70, column: 9)
!103 = !DILocation(line: 71, column: 18, scope: !102)
!104 = !DILocation(line: 72, column: 13, scope: !102)
!105 = !DILocation(line: 73, column: 13, scope: !102)
!106 = !DILocation(line: 73, column: 27, scope: !102)
!107 = !DILocation(line: 75, column: 13, scope: !102)
!108 = !DILocation(line: 76, column: 23, scope: !102)
!109 = !DILocation(line: 76, column: 13, scope: !102)
!110 = !DILocation(line: 79, column: 1, scope: !79)
