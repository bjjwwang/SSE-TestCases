; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !33
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !37
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !38
  store i32 0, i32* %arrayidx2, align 4, !dbg !39
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %8, i32** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !42, metadata !DIExpression()), !dbg !44
  %9 = load i32*, i32** %data, align 8, !dbg !45
  store i32* %9, i32** %dataCopy, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !46, metadata !DIExpression()), !dbg !47
  %10 = load i32*, i32** %dataCopy, align 8, !dbg !48
  store i32* %10, i32** %data3, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call4 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !56
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx5, align 4, !dbg !58
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %11 = bitcast i32* %arraydecay6 to i8*, !dbg !59
  %12 = load i32*, i32** %data3, align 8, !dbg !59
  %13 = bitcast i32* %12 to i8*, !dbg !59
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call8 = call i64 @wcslen(i32* noundef %arraydecay7), !dbg !59
  %mul = mul i64 %call8, 4, !dbg !59
  %call9 = call i8* @__memmove_chk(i8* noundef %11, i8* noundef %13, i64 noundef %mul, i64 noundef 400) #4, !dbg !59
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx10, align 4, !dbg !61
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  call void @printWLine(i32* noundef %arraydecay11), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !68 {
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
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_good(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_bad(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 200, align 16, !dbg !93
  %1 = bitcast i8* %0 to i32*, !dbg !94
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %2 = alloca i8, i64 400, align 16, !dbg !97
  %3 = bitcast i8* %2 to i32*, !dbg !98
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !96
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !99
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !100
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !103
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !104
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !105
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !105
  store i32 0, i32* %arrayidx2, align 4, !dbg !106
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !107
  store i32* %8, i32** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !109, metadata !DIExpression()), !dbg !111
  %9 = load i32*, i32** %data, align 8, !dbg !112
  store i32* %9, i32** %dataCopy, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !113, metadata !DIExpression()), !dbg !114
  %10 = load i32*, i32** %dataCopy, align 8, !dbg !115
  store i32* %10, i32** %data3, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call4 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !120
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx5, align 4, !dbg !122
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %11 = bitcast i32* %arraydecay6 to i8*, !dbg !123
  %12 = load i32*, i32** %data3, align 8, !dbg !123
  %13 = bitcast i32* %12 to i8*, !dbg !123
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %call8 = call i64 @wcslen(i32* noundef %arraydecay7), !dbg !123
  %mul = mul i64 %call8, 4, !dbg !123
  %call9 = call i8* @__memmove_chk(i8* noundef %11, i8* noundef %13, i64 noundef %mul, i64 noundef 400) #4, !dbg !123
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx10, align 4, !dbg !125
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  call void @printWLine(i32* noundef %arraydecay11), !dbg !127
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 42, scope: !17)
!27 = !DILocation(line: 26, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 27, type: !3)
!29 = !DILocation(line: 27, column: 15, scope: !17)
!30 = !DILocation(line: 27, column: 43, scope: !17)
!31 = !DILocation(line: 27, column: 32, scope: !17)
!32 = !DILocation(line: 28, column: 13, scope: !17)
!33 = !DILocation(line: 28, column: 5, scope: !17)
!34 = !DILocation(line: 29, column: 5, scope: !17)
!35 = !DILocation(line: 29, column: 25, scope: !17)
!36 = !DILocation(line: 30, column: 13, scope: !17)
!37 = !DILocation(line: 30, column: 5, scope: !17)
!38 = !DILocation(line: 31, column: 5, scope: !17)
!39 = !DILocation(line: 31, column: 27, scope: !17)
!40 = !DILocation(line: 33, column: 12, scope: !17)
!41 = !DILocation(line: 33, column: 10, scope: !17)
!42 = !DILocalVariable(name: "dataCopy", scope: !43, file: !18, line: 35, type: !3)
!43 = distinct !DILexicalBlock(scope: !17, file: !18, line: 34, column: 5)
!44 = !DILocation(line: 35, column: 19, scope: !43)
!45 = !DILocation(line: 35, column: 30, scope: !43)
!46 = !DILocalVariable(name: "data", scope: !43, file: !18, line: 36, type: !3)
!47 = !DILocation(line: 36, column: 19, scope: !43)
!48 = !DILocation(line: 36, column: 26, scope: !43)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !18, line: 38, type: !51)
!50 = distinct !DILexicalBlock(scope: !43, file: !18, line: 37, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 38, column: 21, scope: !50)
!55 = !DILocation(line: 39, column: 21, scope: !50)
!56 = !DILocation(line: 39, column: 13, scope: !50)
!57 = !DILocation(line: 40, column: 13, scope: !50)
!58 = !DILocation(line: 40, column: 25, scope: !50)
!59 = !DILocation(line: 43, column: 13, scope: !50)
!60 = !DILocation(line: 44, column: 13, scope: !50)
!61 = !DILocation(line: 44, column: 25, scope: !50)
!62 = !DILocation(line: 45, column: 24, scope: !50)
!63 = !DILocation(line: 45, column: 13, scope: !50)
!64 = !DILocation(line: 48, column: 1, scope: !17)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_31_good", scope: !18, file: !18, line: 82, type: !19, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!66 = !DILocation(line: 84, column: 5, scope: !65)
!67 = !DILocation(line: 85, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 96, type: !69, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!69 = !DISubroutineType(types: !70)
!70 = !{!8, !8, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !18, line: 96, type: !8)
!75 = !DILocation(line: 96, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !18, line: 96, type: !71)
!77 = !DILocation(line: 96, column: 27, scope: !68)
!78 = !DILocation(line: 99, column: 22, scope: !68)
!79 = !DILocation(line: 99, column: 12, scope: !68)
!80 = !DILocation(line: 99, column: 5, scope: !68)
!81 = !DILocation(line: 101, column: 5, scope: !68)
!82 = !DILocation(line: 102, column: 5, scope: !68)
!83 = !DILocation(line: 103, column: 5, scope: !68)
!84 = !DILocation(line: 106, column: 5, scope: !68)
!85 = !DILocation(line: 107, column: 5, scope: !68)
!86 = !DILocation(line: 108, column: 5, scope: !68)
!87 = !DILocation(line: 110, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 55, type: !19, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!89 = !DILocalVariable(name: "data", scope: !88, file: !18, line: 57, type: !3)
!90 = !DILocation(line: 57, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !18, line: 58, type: !3)
!92 = !DILocation(line: 58, column: 15, scope: !88)
!93 = !DILocation(line: 58, column: 42, scope: !88)
!94 = !DILocation(line: 58, column: 31, scope: !88)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !18, line: 59, type: !3)
!96 = !DILocation(line: 59, column: 15, scope: !88)
!97 = !DILocation(line: 59, column: 43, scope: !88)
!98 = !DILocation(line: 59, column: 32, scope: !88)
!99 = !DILocation(line: 60, column: 13, scope: !88)
!100 = !DILocation(line: 60, column: 5, scope: !88)
!101 = !DILocation(line: 61, column: 5, scope: !88)
!102 = !DILocation(line: 61, column: 25, scope: !88)
!103 = !DILocation(line: 62, column: 13, scope: !88)
!104 = !DILocation(line: 62, column: 5, scope: !88)
!105 = !DILocation(line: 63, column: 5, scope: !88)
!106 = !DILocation(line: 63, column: 27, scope: !88)
!107 = !DILocation(line: 65, column: 12, scope: !88)
!108 = !DILocation(line: 65, column: 10, scope: !88)
!109 = !DILocalVariable(name: "dataCopy", scope: !110, file: !18, line: 67, type: !3)
!110 = distinct !DILexicalBlock(scope: !88, file: !18, line: 66, column: 5)
!111 = !DILocation(line: 67, column: 19, scope: !110)
!112 = !DILocation(line: 67, column: 30, scope: !110)
!113 = !DILocalVariable(name: "data", scope: !110, file: !18, line: 68, type: !3)
!114 = !DILocation(line: 68, column: 19, scope: !110)
!115 = !DILocation(line: 68, column: 26, scope: !110)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !18, line: 70, type: !51)
!117 = distinct !DILexicalBlock(scope: !110, file: !18, line: 69, column: 9)
!118 = !DILocation(line: 70, column: 21, scope: !117)
!119 = !DILocation(line: 71, column: 21, scope: !117)
!120 = !DILocation(line: 71, column: 13, scope: !117)
!121 = !DILocation(line: 72, column: 13, scope: !117)
!122 = !DILocation(line: 72, column: 25, scope: !117)
!123 = !DILocation(line: 75, column: 13, scope: !117)
!124 = !DILocation(line: 76, column: 13, scope: !117)
!125 = !DILocation(line: 76, column: 25, scope: !117)
!126 = !DILocation(line: 77, column: 24, scope: !117)
!127 = !DILocation(line: 77, column: 13, scope: !117)
!128 = !DILocation(line: 80, column: 1, scope: !88)
