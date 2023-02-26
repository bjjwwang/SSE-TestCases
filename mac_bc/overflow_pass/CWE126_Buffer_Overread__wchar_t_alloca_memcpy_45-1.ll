; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 200, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = alloca i8, i64 400, align 16, !dbg !35
  %3 = bitcast i8* %2 to i32*, !dbg !36
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !34
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !38
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !41
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !42
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !43
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !43
  store i32 0, i32* %arrayidx2, align 4, !dbg !44
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  store i32* %8, i32** %data, align 8, !dbg !46
  %9 = load i32*, i32** %data, align 8, !dbg !47
  store i32* %9, i32** @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_badData, align 8, !dbg !48
  call void @badSink(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_badData, align 8, !dbg !77
  store i32* %0, i32** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !78, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !84
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !85
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !88
  %2 = load i32*, i32** %data, align 8, !dbg !88
  %3 = bitcast i32* %2 to i8*, !dbg !88
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !88
  %mul = mul i64 %call3, 4, !dbg !88
  %call4 = call i8* @__memcpy_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 400) #4, !dbg !88
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx5, align 4, !dbg !90
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* noundef %arraydecay6), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 200, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %2 = alloca i8, i64 400, align 16, !dbg !103
  %3 = bitcast i8* %2 to i32*, !dbg !104
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !102
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !105
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !106
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !109
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !110
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !111
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !111
  store i32 0, i32* %arrayidx2, align 4, !dbg !112
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !113
  store i32* %8, i32** %data, align 8, !dbg !114
  %9 = load i32*, i32** %data, align 8, !dbg !115
  store i32* %9, i32** @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_goodG2BData, align 8, !dbg !116
  call void @goodG2BSink(), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_goodG2BData, align 8, !dbg !122
  store i32* %0, i32** %data, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !127
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !130
  %2 = load i32*, i32** %data, align 8, !dbg !130
  %3 = bitcast i32* %2 to i8*, !dbg !130
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !130
  %mul = mul i64 %call3, 4, !dbg !130
  %call4 = call i8* @__memcpy_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 400) #4, !dbg !130
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx5, align 4, !dbg !132
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  call void @printWLine(i32* noundef %arraydecay6), !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_badData", scope: !2, file: !15, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_goodG2BData", scope: !2, file: !15, line: 22, type: !5, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_bad", scope: !15, file: !15, line: 41, type: !24, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !15, line: 43, type: !5)
!28 = !DILocation(line: 43, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !15, line: 44, type: !5)
!30 = !DILocation(line: 44, column: 15, scope: !23)
!31 = !DILocation(line: 44, column: 42, scope: !23)
!32 = !DILocation(line: 44, column: 31, scope: !23)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !15, line: 45, type: !5)
!34 = !DILocation(line: 45, column: 15, scope: !23)
!35 = !DILocation(line: 45, column: 43, scope: !23)
!36 = !DILocation(line: 45, column: 32, scope: !23)
!37 = !DILocation(line: 46, column: 13, scope: !23)
!38 = !DILocation(line: 46, column: 5, scope: !23)
!39 = !DILocation(line: 47, column: 5, scope: !23)
!40 = !DILocation(line: 47, column: 25, scope: !23)
!41 = !DILocation(line: 48, column: 13, scope: !23)
!42 = !DILocation(line: 48, column: 5, scope: !23)
!43 = !DILocation(line: 49, column: 5, scope: !23)
!44 = !DILocation(line: 49, column: 27, scope: !23)
!45 = !DILocation(line: 51, column: 12, scope: !23)
!46 = !DILocation(line: 51, column: 10, scope: !23)
!47 = !DILocation(line: 52, column: 64, scope: !23)
!48 = !DILocation(line: 52, column: 62, scope: !23)
!49 = !DILocation(line: 53, column: 5, scope: !23)
!50 = !DILocation(line: 54, column: 1, scope: !23)
!51 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_45_good", scope: !15, file: !15, line: 91, type: !24, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!52 = !DILocation(line: 93, column: 5, scope: !51)
!53 = !DILocation(line: 94, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 105, type: !55, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!55 = !DISubroutineType(types: !56)
!56 = !{!10, !10, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !15, line: 105, type: !10)
!61 = !DILocation(line: 105, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !15, line: 105, type: !57)
!63 = !DILocation(line: 105, column: 27, scope: !54)
!64 = !DILocation(line: 108, column: 22, scope: !54)
!65 = !DILocation(line: 108, column: 12, scope: !54)
!66 = !DILocation(line: 108, column: 5, scope: !54)
!67 = !DILocation(line: 110, column: 5, scope: !54)
!68 = !DILocation(line: 111, column: 5, scope: !54)
!69 = !DILocation(line: 112, column: 5, scope: !54)
!70 = !DILocation(line: 115, column: 5, scope: !54)
!71 = !DILocation(line: 116, column: 5, scope: !54)
!72 = !DILocation(line: 117, column: 5, scope: !54)
!73 = !DILocation(line: 119, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 26, type: !24, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!75 = !DILocalVariable(name: "data", scope: !74, file: !15, line: 28, type: !5)
!76 = !DILocation(line: 28, column: 15, scope: !74)
!77 = !DILocation(line: 28, column: 22, scope: !74)
!78 = !DILocalVariable(name: "dest", scope: !79, file: !15, line: 30, type: !80)
!79 = distinct !DILexicalBlock(scope: !74, file: !15, line: 29, column: 5)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 100)
!83 = !DILocation(line: 30, column: 17, scope: !79)
!84 = !DILocation(line: 31, column: 17, scope: !79)
!85 = !DILocation(line: 31, column: 9, scope: !79)
!86 = !DILocation(line: 32, column: 9, scope: !79)
!87 = !DILocation(line: 32, column: 21, scope: !79)
!88 = !DILocation(line: 35, column: 9, scope: !79)
!89 = !DILocation(line: 36, column: 9, scope: !79)
!90 = !DILocation(line: 36, column: 21, scope: !79)
!91 = !DILocation(line: 37, column: 20, scope: !79)
!92 = !DILocation(line: 37, column: 9, scope: !79)
!93 = !DILocation(line: 39, column: 1, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 76, type: !24, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!95 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 78, type: !5)
!96 = !DILocation(line: 78, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !15, line: 79, type: !5)
!98 = !DILocation(line: 79, column: 15, scope: !94)
!99 = !DILocation(line: 79, column: 42, scope: !94)
!100 = !DILocation(line: 79, column: 31, scope: !94)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !15, line: 80, type: !5)
!102 = !DILocation(line: 80, column: 15, scope: !94)
!103 = !DILocation(line: 80, column: 43, scope: !94)
!104 = !DILocation(line: 80, column: 32, scope: !94)
!105 = !DILocation(line: 81, column: 13, scope: !94)
!106 = !DILocation(line: 81, column: 5, scope: !94)
!107 = !DILocation(line: 82, column: 5, scope: !94)
!108 = !DILocation(line: 82, column: 25, scope: !94)
!109 = !DILocation(line: 83, column: 13, scope: !94)
!110 = !DILocation(line: 83, column: 5, scope: !94)
!111 = !DILocation(line: 84, column: 5, scope: !94)
!112 = !DILocation(line: 84, column: 27, scope: !94)
!113 = !DILocation(line: 86, column: 12, scope: !94)
!114 = !DILocation(line: 86, column: 10, scope: !94)
!115 = !DILocation(line: 87, column: 68, scope: !94)
!116 = !DILocation(line: 87, column: 66, scope: !94)
!117 = !DILocation(line: 88, column: 5, scope: !94)
!118 = !DILocation(line: 89, column: 1, scope: !94)
!119 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 61, type: !24, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!120 = !DILocalVariable(name: "data", scope: !119, file: !15, line: 63, type: !5)
!121 = !DILocation(line: 63, column: 15, scope: !119)
!122 = !DILocation(line: 63, column: 22, scope: !119)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !15, line: 65, type: !80)
!124 = distinct !DILexicalBlock(scope: !119, file: !15, line: 64, column: 5)
!125 = !DILocation(line: 65, column: 17, scope: !124)
!126 = !DILocation(line: 66, column: 17, scope: !124)
!127 = !DILocation(line: 66, column: 9, scope: !124)
!128 = !DILocation(line: 67, column: 9, scope: !124)
!129 = !DILocation(line: 67, column: 21, scope: !124)
!130 = !DILocation(line: 70, column: 9, scope: !124)
!131 = !DILocation(line: 71, column: 9, scope: !124)
!132 = !DILocation(line: 71, column: 21, scope: !124)
!133 = !DILocation(line: 72, column: 20, scope: !124)
!134 = !DILocation(line: 72, column: 9, scope: !124)
!135 = !DILocation(line: 74, column: 1, scope: !119)
