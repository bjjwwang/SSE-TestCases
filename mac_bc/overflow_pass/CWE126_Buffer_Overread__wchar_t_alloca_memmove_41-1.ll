; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_badSink(i32* noundef %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !30
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !31
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !34
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !34
  %1 = load i32*, i32** %data.addr, align 8, !dbg !34
  %2 = bitcast i32* %1 to i8*, !dbg !34
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !34
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !34
  %mul = mul i64 %call3, 4, !dbg !34
  %call4 = call i8* @__memmove_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !34
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !35
  store i32 0, i32* %arrayidx5, align 4, !dbg !36
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !37
  call void @printWLine(i32* noundef %arraydecay6), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_bad() #0 !dbg !40 {
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
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !54
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !57
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !58
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !59
  store i32 0, i32* %arrayidx2, align 4, !dbg !60
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !61
  store i32* %8, i32** %data, align 8, !dbg !62
  %9 = load i32*, i32** %data, align 8, !dbg !63
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_badSink(i32* noundef %9), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_goodG2BSink(i32* noundef %data) #0 !dbg !66 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !69, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !73
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !76
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !76
  %1 = load i32*, i32** %data.addr, align 8, !dbg !76
  %2 = bitcast i32* %1 to i8*, !dbg !76
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !76
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !76
  %mul = mul i64 %call3, 4, !dbg !76
  %call4 = call i8* @__memmove_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !76
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx5, align 4, !dbg !78
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !79
  call void @printWLine(i32* noundef %arraydecay6), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* noundef null), !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 noundef %conv), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 200, align 16, !dbg !110
  %1 = bitcast i8* %0 to i32*, !dbg !111
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = alloca i8, i64 400, align 16, !dbg !114
  %3 = bitcast i8* %2 to i32*, !dbg !115
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !113
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !116
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !117
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !120
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !121
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !122
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !122
  store i32 0, i32* %arrayidx2, align 4, !dbg !123
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !124
  store i32* %8, i32** %data, align 8, !dbg !125
  %9 = load i32*, i32** %data, align 8, !dbg !126
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_goodG2BSink(i32* noundef %9), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_badSink", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !3}
!21 = !{}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 23, type: !3)
!23 = !DILocation(line: 23, column: 74, scope: !17)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !18, line: 26, type: !26)
!25 = distinct !DILexicalBlock(scope: !17, file: !18, line: 25, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 26, column: 17, scope: !25)
!30 = !DILocation(line: 27, column: 17, scope: !25)
!31 = !DILocation(line: 27, column: 9, scope: !25)
!32 = !DILocation(line: 28, column: 9, scope: !25)
!33 = !DILocation(line: 28, column: 21, scope: !25)
!34 = !DILocation(line: 31, column: 9, scope: !25)
!35 = !DILocation(line: 32, column: 9, scope: !25)
!36 = !DILocation(line: 32, column: 21, scope: !25)
!37 = !DILocation(line: 33, column: 20, scope: !25)
!38 = !DILocation(line: 33, column: 9, scope: !25)
!39 = !DILocation(line: 35, column: 1, scope: !17)
!40 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_bad", scope: !18, file: !18, line: 37, type: !41, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!41 = !DISubroutineType(types: !42)
!42 = !{null}
!43 = !DILocalVariable(name: "data", scope: !40, file: !18, line: 39, type: !3)
!44 = !DILocation(line: 39, column: 15, scope: !40)
!45 = !DILocalVariable(name: "dataBadBuffer", scope: !40, file: !18, line: 40, type: !3)
!46 = !DILocation(line: 40, column: 15, scope: !40)
!47 = !DILocation(line: 40, column: 42, scope: !40)
!48 = !DILocation(line: 40, column: 31, scope: !40)
!49 = !DILocalVariable(name: "dataGoodBuffer", scope: !40, file: !18, line: 41, type: !3)
!50 = !DILocation(line: 41, column: 15, scope: !40)
!51 = !DILocation(line: 41, column: 43, scope: !40)
!52 = !DILocation(line: 41, column: 32, scope: !40)
!53 = !DILocation(line: 42, column: 13, scope: !40)
!54 = !DILocation(line: 42, column: 5, scope: !40)
!55 = !DILocation(line: 43, column: 5, scope: !40)
!56 = !DILocation(line: 43, column: 25, scope: !40)
!57 = !DILocation(line: 44, column: 13, scope: !40)
!58 = !DILocation(line: 44, column: 5, scope: !40)
!59 = !DILocation(line: 45, column: 5, scope: !40)
!60 = !DILocation(line: 45, column: 27, scope: !40)
!61 = !DILocation(line: 47, column: 12, scope: !40)
!62 = !DILocation(line: 47, column: 10, scope: !40)
!63 = !DILocation(line: 48, column: 63, scope: !40)
!64 = !DILocation(line: 48, column: 5, scope: !40)
!65 = !DILocation(line: 49, column: 1, scope: !40)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_goodG2BSink", scope: !18, file: !18, line: 55, type: !19, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!67 = !DILocalVariable(name: "data", arg: 1, scope: !66, file: !18, line: 55, type: !3)
!68 = !DILocation(line: 55, column: 78, scope: !66)
!69 = !DILocalVariable(name: "dest", scope: !70, file: !18, line: 58, type: !26)
!70 = distinct !DILexicalBlock(scope: !66, file: !18, line: 57, column: 5)
!71 = !DILocation(line: 58, column: 17, scope: !70)
!72 = !DILocation(line: 59, column: 17, scope: !70)
!73 = !DILocation(line: 59, column: 9, scope: !70)
!74 = !DILocation(line: 60, column: 9, scope: !70)
!75 = !DILocation(line: 60, column: 21, scope: !70)
!76 = !DILocation(line: 63, column: 9, scope: !70)
!77 = !DILocation(line: 64, column: 9, scope: !70)
!78 = !DILocation(line: 64, column: 21, scope: !70)
!79 = !DILocation(line: 65, column: 20, scope: !70)
!80 = !DILocation(line: 65, column: 9, scope: !70)
!81 = !DILocation(line: 67, column: 1, scope: !66)
!82 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_41_good", scope: !18, file: !18, line: 84, type: !41, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!83 = !DILocation(line: 86, column: 5, scope: !82)
!84 = !DILocation(line: 87, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 99, type: !86, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!86 = !DISubroutineType(types: !87)
!87 = !{!8, !8, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !18, line: 99, type: !8)
!92 = !DILocation(line: 99, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !18, line: 99, type: !88)
!94 = !DILocation(line: 99, column: 27, scope: !85)
!95 = !DILocation(line: 102, column: 22, scope: !85)
!96 = !DILocation(line: 102, column: 12, scope: !85)
!97 = !DILocation(line: 102, column: 5, scope: !85)
!98 = !DILocation(line: 104, column: 5, scope: !85)
!99 = !DILocation(line: 105, column: 5, scope: !85)
!100 = !DILocation(line: 106, column: 5, scope: !85)
!101 = !DILocation(line: 109, column: 5, scope: !85)
!102 = !DILocation(line: 110, column: 5, scope: !85)
!103 = !DILocation(line: 111, column: 5, scope: !85)
!104 = !DILocation(line: 113, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 70, type: !41, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!106 = !DILocalVariable(name: "data", scope: !105, file: !18, line: 72, type: !3)
!107 = !DILocation(line: 72, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !18, line: 73, type: !3)
!109 = !DILocation(line: 73, column: 15, scope: !105)
!110 = !DILocation(line: 73, column: 42, scope: !105)
!111 = !DILocation(line: 73, column: 31, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !18, line: 74, type: !3)
!113 = !DILocation(line: 74, column: 15, scope: !105)
!114 = !DILocation(line: 74, column: 43, scope: !105)
!115 = !DILocation(line: 74, column: 32, scope: !105)
!116 = !DILocation(line: 75, column: 13, scope: !105)
!117 = !DILocation(line: 75, column: 5, scope: !105)
!118 = !DILocation(line: 76, column: 5, scope: !105)
!119 = !DILocation(line: 76, column: 25, scope: !105)
!120 = !DILocation(line: 77, column: 13, scope: !105)
!121 = !DILocation(line: 77, column: 5, scope: !105)
!122 = !DILocation(line: 78, column: 5, scope: !105)
!123 = !DILocation(line: 78, column: 27, scope: !105)
!124 = !DILocation(line: 80, column: 12, scope: !105)
!125 = !DILocation(line: 80, column: 10, scope: !105)
!126 = !DILocation(line: 81, column: 67, scope: !105)
!127 = !DILocation(line: 81, column: 5, scope: !105)
!128 = !DILocation(line: 82, column: 1, scope: !105)
