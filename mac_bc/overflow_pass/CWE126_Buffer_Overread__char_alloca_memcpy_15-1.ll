; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_memcpy_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !26
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !26
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !29
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !29
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !30
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !30
  store i8 0, i8* %arrayidx2, align 1, !dbg !31
  %10 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  store i8* %10, i8** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx3, align 1, !dbg !42
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  %11 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  %call6 = call i64 @strlen(i8* noundef %arraydecay5), !dbg !43
  %mul = mul i64 %call6, 1, !dbg !43
  %call7 = call i8* @__memcpy_chk(i8* noundef %arraydecay4, i8* noundef %11, i64 noundef %mul, i64 noundef 100) #5, !dbg !43
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx8, align 1, !dbg !45
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @printLine(i8* noundef %arraydecay9), !dbg !47
  ret void, !dbg !48
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
define void @CWE126_Buffer_Overread__char_alloca_memcpy_15_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_15_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_15_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 50, align 16, !dbg !77
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %1 = alloca i8, i64 100, align 16, !dbg !80
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !79
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !81
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !81
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !81
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !81
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !84
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !84
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !84
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !84
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !85
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !85
  store i8 0, i8* %arrayidx2, align 1, !dbg !86
  %10 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !87
  store i8* %10, i8** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !92
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx3, align 1, !dbg !94
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  %11 = load i8*, i8** %data, align 8, !dbg !95
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  %call6 = call i64 @strlen(i8* noundef %arraydecay5), !dbg !95
  %mul = mul i64 %call6, 1, !dbg !95
  %call7 = call i8* @__memcpy_chk(i8* noundef %arraydecay4, i8* noundef %11, i64 noundef %mul, i64 noundef 100) #5, !dbg !95
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx8, align 1, !dbg !97
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  call void @printLine(i8* noundef %arraydecay9), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 50, align 16, !dbg !106
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %1 = alloca i8, i64 100, align 16, !dbg !109
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !108
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !110
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !110
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !110
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !110
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !113
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !113
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !113
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !113
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !114
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !114
  store i8 0, i8* %arrayidx2, align 1, !dbg !115
  %10 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !116
  store i8* %10, i8** %data, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !121
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx3, align 1, !dbg !123
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  %11 = load i8*, i8** %data, align 8, !dbg !124
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  %call6 = call i64 @strlen(i8* noundef %arraydecay5), !dbg !124
  %mul = mul i64 %call6, 1, !dbg !124
  %call7 = call i8* @__memcpy_chk(i8* noundef %arraydecay4, i8* noundef %11, i64 noundef %mul, i64 noundef 100) #5, !dbg !124
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx8, align 1, !dbg !126
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  call void @printLine(i8* noundef %arraydecay9), !dbg !128
  ret void, !dbg !129
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 37, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 5, scope: !13)
!30 = !DILocation(line: 31, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 27, scope: !13)
!32 = !DILocation(line: 36, column: 16, scope: !13)
!33 = !DILocation(line: 36, column: 14, scope: !13)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !14, line: 44, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 44, column: 14, scope: !35)
!40 = !DILocation(line: 45, column: 9, scope: !35)
!41 = !DILocation(line: 46, column: 9, scope: !35)
!42 = !DILocation(line: 46, column: 21, scope: !35)
!43 = !DILocation(line: 49, column: 9, scope: !35)
!44 = !DILocation(line: 50, column: 9, scope: !35)
!45 = !DILocation(line: 50, column: 21, scope: !35)
!46 = !DILocation(line: 51, column: 19, scope: !35)
!47 = !DILocation(line: 51, column: 9, scope: !35)
!48 = !DILocation(line: 53, column: 1, scope: !13)
!49 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_15_good", scope: !14, file: !14, line: 125, type: !15, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!50 = !DILocation(line: 127, column: 5, scope: !49)
!51 = !DILocation(line: 128, column: 5, scope: !49)
!52 = !DILocation(line: 129, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 141, type: !54, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 141, type: !56)
!59 = !DILocation(line: 141, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 141, type: !57)
!61 = !DILocation(line: 141, column: 27, scope: !53)
!62 = !DILocation(line: 144, column: 22, scope: !53)
!63 = !DILocation(line: 144, column: 12, scope: !53)
!64 = !DILocation(line: 144, column: 5, scope: !53)
!65 = !DILocation(line: 146, column: 5, scope: !53)
!66 = !DILocation(line: 147, column: 5, scope: !53)
!67 = !DILocation(line: 148, column: 5, scope: !53)
!68 = !DILocation(line: 151, column: 5, scope: !53)
!69 = !DILocation(line: 152, column: 5, scope: !53)
!70 = !DILocation(line: 153, column: 5, scope: !53)
!71 = !DILocation(line: 155, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 62, type: !3)
!74 = !DILocation(line: 62, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !14, line: 63, type: !3)
!76 = !DILocation(line: 63, column: 12, scope: !72)
!77 = !DILocation(line: 63, column: 36, scope: !72)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !14, line: 64, type: !3)
!79 = !DILocation(line: 64, column: 12, scope: !72)
!80 = !DILocation(line: 64, column: 37, scope: !72)
!81 = !DILocation(line: 65, column: 5, scope: !72)
!82 = !DILocation(line: 66, column: 5, scope: !72)
!83 = !DILocation(line: 66, column: 25, scope: !72)
!84 = !DILocation(line: 67, column: 5, scope: !72)
!85 = !DILocation(line: 68, column: 5, scope: !72)
!86 = !DILocation(line: 68, column: 27, scope: !72)
!87 = !DILocation(line: 77, column: 16, scope: !72)
!88 = !DILocation(line: 77, column: 14, scope: !72)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !14, line: 81, type: !36)
!90 = distinct !DILexicalBlock(scope: !72, file: !14, line: 80, column: 5)
!91 = !DILocation(line: 81, column: 14, scope: !90)
!92 = !DILocation(line: 82, column: 9, scope: !90)
!93 = !DILocation(line: 83, column: 9, scope: !90)
!94 = !DILocation(line: 83, column: 21, scope: !90)
!95 = !DILocation(line: 86, column: 9, scope: !90)
!96 = !DILocation(line: 87, column: 9, scope: !90)
!97 = !DILocation(line: 87, column: 21, scope: !90)
!98 = !DILocation(line: 88, column: 19, scope: !90)
!99 = !DILocation(line: 88, column: 9, scope: !90)
!100 = !DILocation(line: 90, column: 1, scope: !72)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 93, type: !15, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 95, type: !3)
!103 = !DILocation(line: 95, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !14, line: 96, type: !3)
!105 = !DILocation(line: 96, column: 12, scope: !101)
!106 = !DILocation(line: 96, column: 36, scope: !101)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !14, line: 97, type: !3)
!108 = !DILocation(line: 97, column: 12, scope: !101)
!109 = !DILocation(line: 97, column: 37, scope: !101)
!110 = !DILocation(line: 98, column: 5, scope: !101)
!111 = !DILocation(line: 99, column: 5, scope: !101)
!112 = !DILocation(line: 99, column: 25, scope: !101)
!113 = !DILocation(line: 100, column: 5, scope: !101)
!114 = !DILocation(line: 101, column: 5, scope: !101)
!115 = !DILocation(line: 101, column: 27, scope: !101)
!116 = !DILocation(line: 106, column: 16, scope: !101)
!117 = !DILocation(line: 106, column: 14, scope: !101)
!118 = !DILocalVariable(name: "dest", scope: !119, file: !14, line: 114, type: !36)
!119 = distinct !DILexicalBlock(scope: !101, file: !14, line: 113, column: 5)
!120 = !DILocation(line: 114, column: 14, scope: !119)
!121 = !DILocation(line: 115, column: 9, scope: !119)
!122 = !DILocation(line: 116, column: 9, scope: !119)
!123 = !DILocation(line: 116, column: 21, scope: !119)
!124 = !DILocation(line: 119, column: 9, scope: !119)
!125 = !DILocation(line: 120, column: 9, scope: !119)
!126 = !DILocation(line: 120, column: 21, scope: !119)
!127 = !DILocation(line: 121, column: 19, scope: !119)
!128 = !DILocation(line: 121, column: 9, scope: !119)
!129 = !DILocation(line: 123, column: 1, scope: !101)
