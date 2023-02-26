; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_badSink(i32* noundef %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !30
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !31
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %0 = load i32*, i32** %data.addr, align 8, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !35
  %call2 = call i32* @wcscat(i32* noundef %0, i32* noundef %arraydecay1), !dbg !36
  %1 = load i32*, i32** %data.addr, align 8, !dbg !37
  call void @printWLine(i32* noundef %1), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcscat(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_bad() #0 !dbg !40 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = alloca i8, i64 200, align 16, !dbg !47
  %1 = bitcast i8* %0 to i32*, !dbg !48
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !49, metadata !DIExpression()), !dbg !50
  %2 = alloca i8, i64 400, align 16, !dbg !51
  %3 = bitcast i8* %2 to i32*, !dbg !52
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !50
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !53
  store i32* %4, i32** %data, align 8, !dbg !54
  %5 = load i32*, i32** %data, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_badSink(i32* noundef %6), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_goodG2BSink(i32* noundef %data) #0 !dbg !60 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !63, metadata !DIExpression()), !dbg !65
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !66
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !67
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx, align 4, !dbg !69
  %0 = load i32*, i32** %data.addr, align 8, !dbg !70
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !71
  %call2 = call i32* @wcscat(i32* noundef %0, i32* noundef %arraydecay1), !dbg !72
  %1 = load i32*, i32** %data.addr, align 8, !dbg !73
  call void @printWLine(i32* noundef %1), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* noundef null), !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 noundef %conv), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_good(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_bad(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 200, align 16, !dbg !104
  %1 = bitcast i8* %0 to i32*, !dbg !105
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %2 = alloca i8, i64 400, align 16, !dbg !108
  %3 = bitcast i8* %2 to i32*, !dbg !109
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !107
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !110
  store i32* %4, i32** %data, align 8, !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_goodG2BSink(i32* noundef %6), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_badSink", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !3}
!21 = !{}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 23, type: !3)
!23 = !DILocation(line: 23, column: 87, scope: !17)
!24 = !DILocalVariable(name: "source", scope: !25, file: !18, line: 26, type: !26)
!25 = distinct !DILexicalBlock(scope: !17, file: !18, line: 25, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 26, column: 17, scope: !25)
!30 = !DILocation(line: 27, column: 17, scope: !25)
!31 = !DILocation(line: 27, column: 9, scope: !25)
!32 = !DILocation(line: 28, column: 9, scope: !25)
!33 = !DILocation(line: 28, column: 23, scope: !25)
!34 = !DILocation(line: 30, column: 16, scope: !25)
!35 = !DILocation(line: 30, column: 22, scope: !25)
!36 = !DILocation(line: 30, column: 9, scope: !25)
!37 = !DILocation(line: 31, column: 20, scope: !25)
!38 = !DILocation(line: 31, column: 9, scope: !25)
!39 = !DILocation(line: 33, column: 1, scope: !17)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_bad", scope: !18, file: !18, line: 35, type: !41, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!41 = !DISubroutineType(types: !42)
!42 = !{null}
!43 = !DILocalVariable(name: "data", scope: !40, file: !18, line: 37, type: !3)
!44 = !DILocation(line: 37, column: 15, scope: !40)
!45 = !DILocalVariable(name: "dataBadBuffer", scope: !40, file: !18, line: 38, type: !3)
!46 = !DILocation(line: 38, column: 15, scope: !40)
!47 = !DILocation(line: 38, column: 42, scope: !40)
!48 = !DILocation(line: 38, column: 31, scope: !40)
!49 = !DILocalVariable(name: "dataGoodBuffer", scope: !40, file: !18, line: 39, type: !3)
!50 = !DILocation(line: 39, column: 15, scope: !40)
!51 = !DILocation(line: 39, column: 43, scope: !40)
!52 = !DILocation(line: 39, column: 32, scope: !40)
!53 = !DILocation(line: 42, column: 12, scope: !40)
!54 = !DILocation(line: 42, column: 10, scope: !40)
!55 = !DILocation(line: 43, column: 5, scope: !40)
!56 = !DILocation(line: 43, column: 13, scope: !40)
!57 = !DILocation(line: 44, column: 76, scope: !40)
!58 = !DILocation(line: 44, column: 5, scope: !40)
!59 = !DILocation(line: 45, column: 1, scope: !40)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_goodG2BSink", scope: !18, file: !18, line: 51, type: !19, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!61 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !18, line: 51, type: !3)
!62 = !DILocation(line: 51, column: 91, scope: !60)
!63 = !DILocalVariable(name: "source", scope: !64, file: !18, line: 54, type: !26)
!64 = distinct !DILexicalBlock(scope: !60, file: !18, line: 53, column: 5)
!65 = !DILocation(line: 54, column: 17, scope: !64)
!66 = !DILocation(line: 55, column: 17, scope: !64)
!67 = !DILocation(line: 55, column: 9, scope: !64)
!68 = !DILocation(line: 56, column: 9, scope: !64)
!69 = !DILocation(line: 56, column: 23, scope: !64)
!70 = !DILocation(line: 58, column: 16, scope: !64)
!71 = !DILocation(line: 58, column: 22, scope: !64)
!72 = !DILocation(line: 58, column: 9, scope: !64)
!73 = !DILocation(line: 59, column: 20, scope: !64)
!74 = !DILocation(line: 59, column: 9, scope: !64)
!75 = !DILocation(line: 61, column: 1, scope: !60)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_41_good", scope: !18, file: !18, line: 75, type: !41, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!77 = !DILocation(line: 77, column: 5, scope: !76)
!78 = !DILocation(line: 78, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 90, type: !80, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!80 = !DISubroutineType(types: !81)
!81 = !{!8, !8, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !18, line: 90, type: !8)
!86 = !DILocation(line: 90, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !18, line: 90, type: !82)
!88 = !DILocation(line: 90, column: 27, scope: !79)
!89 = !DILocation(line: 93, column: 22, scope: !79)
!90 = !DILocation(line: 93, column: 12, scope: !79)
!91 = !DILocation(line: 93, column: 5, scope: !79)
!92 = !DILocation(line: 95, column: 5, scope: !79)
!93 = !DILocation(line: 96, column: 5, scope: !79)
!94 = !DILocation(line: 97, column: 5, scope: !79)
!95 = !DILocation(line: 100, column: 5, scope: !79)
!96 = !DILocation(line: 101, column: 5, scope: !79)
!97 = !DILocation(line: 102, column: 5, scope: !79)
!98 = !DILocation(line: 104, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 64, type: !41, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!100 = !DILocalVariable(name: "data", scope: !99, file: !18, line: 66, type: !3)
!101 = !DILocation(line: 66, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !18, line: 67, type: !3)
!103 = !DILocation(line: 67, column: 15, scope: !99)
!104 = !DILocation(line: 67, column: 42, scope: !99)
!105 = !DILocation(line: 67, column: 31, scope: !99)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !18, line: 68, type: !3)
!107 = !DILocation(line: 68, column: 15, scope: !99)
!108 = !DILocation(line: 68, column: 43, scope: !99)
!109 = !DILocation(line: 68, column: 32, scope: !99)
!110 = !DILocation(line: 70, column: 12, scope: !99)
!111 = !DILocation(line: 70, column: 10, scope: !99)
!112 = !DILocation(line: 71, column: 5, scope: !99)
!113 = !DILocation(line: 71, column: 13, scope: !99)
!114 = !DILocation(line: 72, column: 80, scope: !99)
!115 = !DILocation(line: 72, column: 5, scope: !99)
!116 = !DILocation(line: 73, column: 1, scope: !99)
