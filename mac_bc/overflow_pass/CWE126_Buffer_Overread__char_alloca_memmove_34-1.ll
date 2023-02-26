; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_memmove_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memmove_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE126_Buffer_Overread__char_alloca_memmove_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_memmove_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__char_alloca_memmove_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__char_alloca_memmove_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 50, align 16, !dbg !29
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %1 = alloca i8, i64 100, align 16, !dbg !32
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !31
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !33
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !33
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !36
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !36
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !36
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !36
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !37
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !37
  store i8 0, i8* %arrayidx2, align 1, !dbg !38
  %10 = load i8*, i8** %dataBadBuffer, align 8, !dbg !39
  store i8* %10, i8** %data, align 8, !dbg !40
  %11 = load i8*, i8** %data, align 8, !dbg !41
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__char_alloca_memmove_34_unionType* %myUnion to i8**, !dbg !42
  store i8* %11, i8** %unionFirst, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !44, metadata !DIExpression()), !dbg !46
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__char_alloca_memmove_34_unionType* %myUnion to i8**, !dbg !47
  %12 = load i8*, i8** %unionSecond, align 8, !dbg !47
  store i8* %12, i8** %data3, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !54
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx4, align 1, !dbg !56
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  %13 = load i8*, i8** %data3, align 8, !dbg !57
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  %call7 = call i64 @strlen(i8* noundef %arraydecay6), !dbg !57
  %mul = mul i64 %call7, 1, !dbg !57
  %call8 = call i8* @__memmove_chk(i8* noundef %arraydecay5, i8* noundef %13, i64 noundef %mul, i64 noundef 100) #5, !dbg !57
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx9, align 1, !dbg !59
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  call void @printLine(i8* noundef %arraydecay10), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_memmove_34_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* noundef null), !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 noundef %conv), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE126_Buffer_Overread__char_alloca_memmove_34_good(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__char_alloca_memmove_34_bad(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__char_alloca_memmove_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__char_alloca_memmove_34_unionType* %myUnion, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 50, align 16, !dbg !92
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %1 = alloca i8, i64 100, align 16, !dbg !95
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !94
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !96
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !96
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !96
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !96
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !99
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !99
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !99
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !99
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !100
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !100
  store i8 0, i8* %arrayidx2, align 1, !dbg !101
  %10 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !102
  store i8* %10, i8** %data, align 8, !dbg !103
  %11 = load i8*, i8** %data, align 8, !dbg !104
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__char_alloca_memmove_34_unionType* %myUnion to i8**, !dbg !105
  store i8* %11, i8** %unionFirst, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !107, metadata !DIExpression()), !dbg !109
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__char_alloca_memmove_34_unionType* %myUnion to i8**, !dbg !110
  %12 = load i8*, i8** %unionSecond, align 8, !dbg !110
  store i8* %12, i8** %data3, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !114
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx4, align 1, !dbg !116
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  %13 = load i8*, i8** %data3, align 8, !dbg !117
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  %call7 = call i64 @strlen(i8* noundef %arraydecay6), !dbg !117
  %mul = mul i64 %call7, 1, !dbg !117
  %call8 = call i8* @__memmove_chk(i8* noundef %arraydecay5, i8* noundef %13, i64 noundef %mul, i64 noundef 100) #5, !dbg !117
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx9, align 1, !dbg !119
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !120
  call void @printLine(i8* noundef %arraydecay10), !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !3)
!19 = !DILocation(line: 31, column: 12, scope: !13)
!20 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__char_alloca_memmove_34_unionType", file: !14, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !14, line: 23, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !14, line: 24, baseType: !3, size: 64)
!26 = !DILocation(line: 32, column: 62, scope: !13)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !3)
!28 = !DILocation(line: 33, column: 12, scope: !13)
!29 = !DILocation(line: 33, column: 36, scope: !13)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !3)
!31 = !DILocation(line: 34, column: 12, scope: !13)
!32 = !DILocation(line: 34, column: 37, scope: !13)
!33 = !DILocation(line: 35, column: 5, scope: !13)
!34 = !DILocation(line: 36, column: 5, scope: !13)
!35 = !DILocation(line: 36, column: 25, scope: !13)
!36 = !DILocation(line: 37, column: 5, scope: !13)
!37 = !DILocation(line: 38, column: 5, scope: !13)
!38 = !DILocation(line: 38, column: 27, scope: !13)
!39 = !DILocation(line: 40, column: 12, scope: !13)
!40 = !DILocation(line: 40, column: 10, scope: !13)
!41 = !DILocation(line: 41, column: 26, scope: !13)
!42 = !DILocation(line: 41, column: 13, scope: !13)
!43 = !DILocation(line: 41, column: 24, scope: !13)
!44 = !DILocalVariable(name: "data", scope: !45, file: !14, line: 43, type: !3)
!45 = distinct !DILexicalBlock(scope: !13, file: !14, line: 42, column: 5)
!46 = !DILocation(line: 43, column: 16, scope: !45)
!47 = !DILocation(line: 43, column: 31, scope: !45)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !14, line: 45, type: !50)
!49 = distinct !DILexicalBlock(scope: !45, file: !14, line: 44, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 45, column: 18, scope: !49)
!54 = !DILocation(line: 46, column: 13, scope: !49)
!55 = !DILocation(line: 47, column: 13, scope: !49)
!56 = !DILocation(line: 47, column: 25, scope: !49)
!57 = !DILocation(line: 50, column: 13, scope: !49)
!58 = !DILocation(line: 51, column: 13, scope: !49)
!59 = !DILocation(line: 51, column: 25, scope: !49)
!60 = !DILocation(line: 52, column: 23, scope: !49)
!61 = !DILocation(line: 52, column: 13, scope: !49)
!62 = !DILocation(line: 55, column: 1, scope: !13)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_34_good", scope: !14, file: !14, line: 90, type: !15, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!64 = !DILocation(line: 92, column: 5, scope: !63)
!65 = !DILocation(line: 93, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 104, type: !67, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !70}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !14, line: 104, type: !69)
!72 = !DILocation(line: 104, column: 14, scope: !66)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !14, line: 104, type: !70)
!74 = !DILocation(line: 104, column: 27, scope: !66)
!75 = !DILocation(line: 107, column: 22, scope: !66)
!76 = !DILocation(line: 107, column: 12, scope: !66)
!77 = !DILocation(line: 107, column: 5, scope: !66)
!78 = !DILocation(line: 109, column: 5, scope: !66)
!79 = !DILocation(line: 110, column: 5, scope: !66)
!80 = !DILocation(line: 111, column: 5, scope: !66)
!81 = !DILocation(line: 114, column: 5, scope: !66)
!82 = !DILocation(line: 115, column: 5, scope: !66)
!83 = !DILocation(line: 116, column: 5, scope: !66)
!84 = !DILocation(line: 118, column: 5, scope: !66)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!86 = !DILocalVariable(name: "data", scope: !85, file: !14, line: 64, type: !3)
!87 = !DILocation(line: 64, column: 12, scope: !85)
!88 = !DILocalVariable(name: "myUnion", scope: !85, file: !14, line: 65, type: !21)
!89 = !DILocation(line: 65, column: 62, scope: !85)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !14, line: 66, type: !3)
!91 = !DILocation(line: 66, column: 12, scope: !85)
!92 = !DILocation(line: 66, column: 36, scope: !85)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !14, line: 67, type: !3)
!94 = !DILocation(line: 67, column: 12, scope: !85)
!95 = !DILocation(line: 67, column: 37, scope: !85)
!96 = !DILocation(line: 68, column: 5, scope: !85)
!97 = !DILocation(line: 69, column: 5, scope: !85)
!98 = !DILocation(line: 69, column: 25, scope: !85)
!99 = !DILocation(line: 70, column: 5, scope: !85)
!100 = !DILocation(line: 71, column: 5, scope: !85)
!101 = !DILocation(line: 71, column: 27, scope: !85)
!102 = !DILocation(line: 73, column: 12, scope: !85)
!103 = !DILocation(line: 73, column: 10, scope: !85)
!104 = !DILocation(line: 74, column: 26, scope: !85)
!105 = !DILocation(line: 74, column: 13, scope: !85)
!106 = !DILocation(line: 74, column: 24, scope: !85)
!107 = !DILocalVariable(name: "data", scope: !108, file: !14, line: 76, type: !3)
!108 = distinct !DILexicalBlock(scope: !85, file: !14, line: 75, column: 5)
!109 = !DILocation(line: 76, column: 16, scope: !108)
!110 = !DILocation(line: 76, column: 31, scope: !108)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !14, line: 78, type: !50)
!112 = distinct !DILexicalBlock(scope: !108, file: !14, line: 77, column: 9)
!113 = !DILocation(line: 78, column: 18, scope: !112)
!114 = !DILocation(line: 79, column: 13, scope: !112)
!115 = !DILocation(line: 80, column: 13, scope: !112)
!116 = !DILocation(line: 80, column: 25, scope: !112)
!117 = !DILocation(line: 83, column: 13, scope: !112)
!118 = !DILocation(line: 84, column: 13, scope: !112)
!119 = !DILocation(line: 84, column: 25, scope: !112)
!120 = !DILocation(line: 85, column: 23, scope: !112)
!121 = !DILocation(line: 85, column: 13, scope: !112)
!122 = !DILocation(line: 88, column: 1, scope: !85)
