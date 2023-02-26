; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_memcpy_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %data4 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !31
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !31
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !34
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !34
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !35
  store i8 0, i8* %arrayidx2, align 1, !dbg !36
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !37, metadata !DIExpression()), !dbg !39
  %10 = load i8**, i8*** %dataPtr1, align 8, !dbg !40
  %11 = load i8*, i8** %10, align 8, !dbg !41
  store i8* %11, i8** %data3, align 8, !dbg !39
  %12 = load i8*, i8** %dataBadBuffer, align 8, !dbg !42
  store i8* %12, i8** %data3, align 8, !dbg !43
  %13 = load i8*, i8** %data3, align 8, !dbg !44
  %14 = load i8**, i8*** %dataPtr1, align 8, !dbg !45
  store i8* %13, i8** %14, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !47, metadata !DIExpression()), !dbg !49
  %15 = load i8**, i8*** %dataPtr2, align 8, !dbg !50
  %16 = load i8*, i8** %15, align 8, !dbg !51
  store i8* %16, i8** %data4, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !52, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx5, align 1, !dbg !60
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  %17 = load i8*, i8** %data4, align 8, !dbg !61
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  %call8 = call i64 @strlen(i8* noundef %arraydecay7), !dbg !61
  %mul = mul i64 %call8, 1, !dbg !61
  %call9 = call i8* @__memcpy_chk(i8* noundef %arraydecay6, i8* noundef %17, i64 noundef %mul, i64 noundef 100) #5, !dbg !61
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !62
  store i8 0, i8* %arrayidx10, align 1, !dbg !63
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  call void @printLine(i8* noundef %arraydecay11), !dbg !65
  ret void, !dbg !66
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_memcpy_32_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* noundef null), !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 noundef %conv), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_32_good(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_32_bad(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %data4 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 50, align 16, !dbg !97
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %1 = alloca i8, i64 100, align 16, !dbg !100
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !99
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !101
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !101
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !101
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !101
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !104
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !104
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !104
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !104
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !105
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !105
  store i8 0, i8* %arrayidx2, align 1, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !107, metadata !DIExpression()), !dbg !109
  %10 = load i8**, i8*** %dataPtr1, align 8, !dbg !110
  %11 = load i8*, i8** %10, align 8, !dbg !111
  store i8* %11, i8** %data3, align 8, !dbg !109
  %12 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !112
  store i8* %12, i8** %data3, align 8, !dbg !113
  %13 = load i8*, i8** %data3, align 8, !dbg !114
  %14 = load i8**, i8*** %dataPtr1, align 8, !dbg !115
  store i8* %13, i8** %14, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !117, metadata !DIExpression()), !dbg !119
  %15 = load i8**, i8*** %dataPtr2, align 8, !dbg !120
  %16 = load i8*, i8** %15, align 8, !dbg !121
  store i8* %16, i8** %data4, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx5, align 1, !dbg !127
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !128
  %17 = load i8*, i8** %data4, align 8, !dbg !128
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !128
  %call8 = call i64 @strlen(i8* noundef %arraydecay7), !dbg !128
  %mul = mul i64 %call8, 1, !dbg !128
  %call9 = call i8* @__memcpy_chk(i8* noundef %arraydecay6, i8* noundef %17, i64 noundef %mul, i64 noundef 100) #5, !dbg !128
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx10, align 1, !dbg !130
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !131
  call void @printLine(i8* noundef %arraydecay11), !dbg !132
  ret void, !dbg !133
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !13)
!23 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !13)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 28, type: !3)
!26 = !DILocation(line: 28, column: 12, scope: !13)
!27 = !DILocation(line: 28, column: 36, scope: !13)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 29, type: !3)
!29 = !DILocation(line: 29, column: 12, scope: !13)
!30 = !DILocation(line: 29, column: 37, scope: !13)
!31 = !DILocation(line: 30, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 5, scope: !13)
!33 = !DILocation(line: 31, column: 25, scope: !13)
!34 = !DILocation(line: 32, column: 5, scope: !13)
!35 = !DILocation(line: 33, column: 5, scope: !13)
!36 = !DILocation(line: 33, column: 27, scope: !13)
!37 = !DILocalVariable(name: "data", scope: !38, file: !14, line: 35, type: !3)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!39 = !DILocation(line: 35, column: 16, scope: !38)
!40 = !DILocation(line: 35, column: 24, scope: !38)
!41 = !DILocation(line: 35, column: 23, scope: !38)
!42 = !DILocation(line: 37, column: 16, scope: !38)
!43 = !DILocation(line: 37, column: 14, scope: !38)
!44 = !DILocation(line: 38, column: 21, scope: !38)
!45 = !DILocation(line: 38, column: 10, scope: !38)
!46 = !DILocation(line: 38, column: 19, scope: !38)
!47 = !DILocalVariable(name: "data", scope: !48, file: !14, line: 41, type: !3)
!48 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!49 = !DILocation(line: 41, column: 16, scope: !48)
!50 = !DILocation(line: 41, column: 24, scope: !48)
!51 = !DILocation(line: 41, column: 23, scope: !48)
!52 = !DILocalVariable(name: "dest", scope: !53, file: !14, line: 43, type: !54)
!53 = distinct !DILexicalBlock(scope: !48, file: !14, line: 42, column: 9)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 43, column: 18, scope: !53)
!58 = !DILocation(line: 44, column: 13, scope: !53)
!59 = !DILocation(line: 45, column: 13, scope: !53)
!60 = !DILocation(line: 45, column: 25, scope: !53)
!61 = !DILocation(line: 48, column: 13, scope: !53)
!62 = !DILocation(line: 49, column: 13, scope: !53)
!63 = !DILocation(line: 49, column: 25, scope: !53)
!64 = !DILocation(line: 50, column: 23, scope: !53)
!65 = !DILocation(line: 50, column: 13, scope: !53)
!66 = !DILocation(line: 53, column: 1, scope: !13)
!67 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_32_good", scope: !14, file: !14, line: 92, type: !15, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!68 = !DILocation(line: 94, column: 5, scope: !67)
!69 = !DILocation(line: 95, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 106, type: !71, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!71 = !DISubroutineType(types: !72)
!72 = !{!73, !73, !21}
!73 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !14, line: 106, type: !73)
!75 = !DILocation(line: 106, column: 14, scope: !70)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !14, line: 106, type: !21)
!77 = !DILocation(line: 106, column: 27, scope: !70)
!78 = !DILocation(line: 109, column: 22, scope: !70)
!79 = !DILocation(line: 109, column: 12, scope: !70)
!80 = !DILocation(line: 109, column: 5, scope: !70)
!81 = !DILocation(line: 111, column: 5, scope: !70)
!82 = !DILocation(line: 112, column: 5, scope: !70)
!83 = !DILocation(line: 113, column: 5, scope: !70)
!84 = !DILocation(line: 116, column: 5, scope: !70)
!85 = !DILocation(line: 117, column: 5, scope: !70)
!86 = !DILocation(line: 118, column: 5, scope: !70)
!87 = !DILocation(line: 120, column: 5, scope: !70)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!89 = !DILocalVariable(name: "data", scope: !88, file: !14, line: 62, type: !3)
!90 = !DILocation(line: 62, column: 12, scope: !88)
!91 = !DILocalVariable(name: "dataPtr1", scope: !88, file: !14, line: 63, type: !21)
!92 = !DILocation(line: 63, column: 13, scope: !88)
!93 = !DILocalVariable(name: "dataPtr2", scope: !88, file: !14, line: 64, type: !21)
!94 = !DILocation(line: 64, column: 13, scope: !88)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !14, line: 65, type: !3)
!96 = !DILocation(line: 65, column: 12, scope: !88)
!97 = !DILocation(line: 65, column: 36, scope: !88)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !14, line: 66, type: !3)
!99 = !DILocation(line: 66, column: 12, scope: !88)
!100 = !DILocation(line: 66, column: 37, scope: !88)
!101 = !DILocation(line: 67, column: 5, scope: !88)
!102 = !DILocation(line: 68, column: 5, scope: !88)
!103 = !DILocation(line: 68, column: 25, scope: !88)
!104 = !DILocation(line: 69, column: 5, scope: !88)
!105 = !DILocation(line: 70, column: 5, scope: !88)
!106 = !DILocation(line: 70, column: 27, scope: !88)
!107 = !DILocalVariable(name: "data", scope: !108, file: !14, line: 72, type: !3)
!108 = distinct !DILexicalBlock(scope: !88, file: !14, line: 71, column: 5)
!109 = !DILocation(line: 72, column: 16, scope: !108)
!110 = !DILocation(line: 72, column: 24, scope: !108)
!111 = !DILocation(line: 72, column: 23, scope: !108)
!112 = !DILocation(line: 74, column: 16, scope: !108)
!113 = !DILocation(line: 74, column: 14, scope: !108)
!114 = !DILocation(line: 75, column: 21, scope: !108)
!115 = !DILocation(line: 75, column: 10, scope: !108)
!116 = !DILocation(line: 75, column: 19, scope: !108)
!117 = !DILocalVariable(name: "data", scope: !118, file: !14, line: 78, type: !3)
!118 = distinct !DILexicalBlock(scope: !88, file: !14, line: 77, column: 5)
!119 = !DILocation(line: 78, column: 16, scope: !118)
!120 = !DILocation(line: 78, column: 24, scope: !118)
!121 = !DILocation(line: 78, column: 23, scope: !118)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !14, line: 80, type: !54)
!123 = distinct !DILexicalBlock(scope: !118, file: !14, line: 79, column: 9)
!124 = !DILocation(line: 80, column: 18, scope: !123)
!125 = !DILocation(line: 81, column: 13, scope: !123)
!126 = !DILocation(line: 82, column: 13, scope: !123)
!127 = !DILocation(line: 82, column: 25, scope: !123)
!128 = !DILocation(line: 85, column: 13, scope: !123)
!129 = !DILocation(line: 86, column: 13, scope: !123)
!130 = !DILocation(line: 86, column: 25, scope: !123)
!131 = !DILocation(line: 87, column: 23, scope: !123)
!132 = !DILocation(line: 87, column: 13, scope: !123)
!133 = !DILocation(line: 90, column: 1, scope: !88)
