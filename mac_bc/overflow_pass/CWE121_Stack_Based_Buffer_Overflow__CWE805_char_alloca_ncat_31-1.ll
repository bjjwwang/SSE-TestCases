; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  store i8* %2, i8** %data, align 8, !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %4, i8** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !35
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !36
  store i8* %5, i8** %data1, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx2, align 1, !dbg !45
  %6 = load i8*, i8** %data1, align 8, !dbg !46
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  %7 = load i8*, i8** %data1, align 8, !dbg !46
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !46
  %call = call i8* @__strncat_chk(i8* noundef %6, i8* noundef %arraydecay3, i64 noundef 100, i64 noundef %8) #5, !dbg !46
  %9 = load i8*, i8** %data1, align 8, !dbg !47
  call void @printLine(i8* noundef %9), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_31_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_31_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_31_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 50, align 16, !dbg !77
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %1 = alloca i8, i64 100, align 16, !dbg !80
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !79
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !81
  store i8* %2, i8** %data, align 8, !dbg !82
  %3 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !85, metadata !DIExpression()), !dbg !87
  %4 = load i8*, i8** %data, align 8, !dbg !88
  store i8* %4, i8** %dataCopy, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !89, metadata !DIExpression()), !dbg !90
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !91
  store i8* %5, i8** %data1, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !95
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx2, align 1, !dbg !97
  %6 = load i8*, i8** %data1, align 8, !dbg !98
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !98
  %7 = load i8*, i8** %data1, align 8, !dbg !98
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !98
  %call = call i8* @__strncat_chk(i8* noundef %6, i8* noundef %arraydecay3, i64 noundef 100, i64 noundef %8) #5, !dbg !98
  %9 = load i8*, i8** %data1, align 8, !dbg !99
  call void @printLine(i8* noundef %9), !dbg !100
  ret void, !dbg !101
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_31_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!26 = !DILocation(line: 30, column: 12, scope: !13)
!27 = !DILocation(line: 30, column: 10, scope: !13)
!28 = !DILocation(line: 31, column: 5, scope: !13)
!29 = !DILocation(line: 31, column: 13, scope: !13)
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !14, line: 33, type: !3)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!32 = !DILocation(line: 33, column: 16, scope: !31)
!33 = !DILocation(line: 33, column: 27, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 34, type: !3)
!35 = !DILocation(line: 34, column: 16, scope: !31)
!36 = !DILocation(line: 34, column: 23, scope: !31)
!37 = !DILocalVariable(name: "source", scope: !38, file: !14, line: 36, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !14, line: 35, column: 9)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 36, column: 18, scope: !38)
!43 = !DILocation(line: 37, column: 13, scope: !38)
!44 = !DILocation(line: 38, column: 13, scope: !38)
!45 = !DILocation(line: 38, column: 27, scope: !38)
!46 = !DILocation(line: 40, column: 13, scope: !38)
!47 = !DILocation(line: 41, column: 23, scope: !38)
!48 = !DILocation(line: 41, column: 13, scope: !38)
!49 = !DILocation(line: 44, column: 1, scope: !13)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_31_good", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!51 = !DILocation(line: 75, column: 5, scope: !50)
!52 = !DILocation(line: 76, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 87, type: !54, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 87, type: !56)
!59 = !DILocation(line: 87, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 87, type: !57)
!61 = !DILocation(line: 87, column: 27, scope: !53)
!62 = !DILocation(line: 90, column: 22, scope: !53)
!63 = !DILocation(line: 90, column: 12, scope: !53)
!64 = !DILocation(line: 90, column: 5, scope: !53)
!65 = !DILocation(line: 92, column: 5, scope: !53)
!66 = !DILocation(line: 93, column: 5, scope: !53)
!67 = !DILocation(line: 94, column: 5, scope: !53)
!68 = !DILocation(line: 97, column: 5, scope: !53)
!69 = !DILocation(line: 98, column: 5, scope: !53)
!70 = !DILocation(line: 99, column: 5, scope: !53)
!71 = !DILocation(line: 101, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 53, type: !3)
!74 = !DILocation(line: 53, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !14, line: 54, type: !3)
!76 = !DILocation(line: 54, column: 12, scope: !72)
!77 = !DILocation(line: 54, column: 36, scope: !72)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !14, line: 55, type: !3)
!79 = !DILocation(line: 55, column: 12, scope: !72)
!80 = !DILocation(line: 55, column: 37, scope: !72)
!81 = !DILocation(line: 57, column: 12, scope: !72)
!82 = !DILocation(line: 57, column: 10, scope: !72)
!83 = !DILocation(line: 58, column: 5, scope: !72)
!84 = !DILocation(line: 58, column: 13, scope: !72)
!85 = !DILocalVariable(name: "dataCopy", scope: !86, file: !14, line: 60, type: !3)
!86 = distinct !DILexicalBlock(scope: !72, file: !14, line: 59, column: 5)
!87 = !DILocation(line: 60, column: 16, scope: !86)
!88 = !DILocation(line: 60, column: 27, scope: !86)
!89 = !DILocalVariable(name: "data", scope: !86, file: !14, line: 61, type: !3)
!90 = !DILocation(line: 61, column: 16, scope: !86)
!91 = !DILocation(line: 61, column: 23, scope: !86)
!92 = !DILocalVariable(name: "source", scope: !93, file: !14, line: 63, type: !39)
!93 = distinct !DILexicalBlock(scope: !86, file: !14, line: 62, column: 9)
!94 = !DILocation(line: 63, column: 18, scope: !93)
!95 = !DILocation(line: 64, column: 13, scope: !93)
!96 = !DILocation(line: 65, column: 13, scope: !93)
!97 = !DILocation(line: 65, column: 27, scope: !93)
!98 = !DILocation(line: 67, column: 13, scope: !93)
!99 = !DILocation(line: 68, column: 23, scope: !93)
!100 = !DILocation(line: 68, column: 13, scope: !93)
!101 = !DILocation(line: 71, column: 1, scope: !72)
