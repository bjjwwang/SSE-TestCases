; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE126_Buffer_Overread__wchar_t_declare_memmove_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__wchar_t_declare_memmove_45_goodG2BData = internal global i32* null, align 8, !dbg !7

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memmove_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !40
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !43
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx3, align 4, !dbg !46
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !47
  store i32* %arraydecay4, i32** %data, align 8, !dbg !48
  %0 = load i32*, i32** %data, align 8, !dbg !49
  store i32* %0, i32** @CWE126_Buffer_Overread__wchar_t_declare_memmove_45_badData, align 8, !dbg !50
  call void @badSink(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memmove_45_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* noundef null), !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 noundef %conv), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_45_good(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_45_bad(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_declare_memmove_45_badData, align 8, !dbg !79
  store i32* %0, i32** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !80, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !83
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !84
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !87
  %2 = load i32*, i32** %data, align 8, !dbg !87
  %3 = bitcast i32* %2 to i8*, !dbg !87
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !87
  %mul = mul i64 %call3, 4, !dbg !87
  %call4 = call i8* @__memmove_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 400) #4, !dbg !87
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx5, align 4, !dbg !89
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !90
  call void @printWLine(i32* noundef %arraydecay6), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !100
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !101
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !105
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx3, align 4, !dbg !107
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay4, i32** %data, align 8, !dbg !109
  %0 = load i32*, i32** %data, align 8, !dbg !110
  store i32* %0, i32** @CWE126_Buffer_Overread__wchar_t_declare_memmove_45_goodG2BData, align 8, !dbg !111
  call void @goodG2BSink(), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_declare_memmove_45_goodG2BData, align 8, !dbg !117
  store i32* %0, i32** %data, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !121
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !122
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !125
  %2 = load i32*, i32** %data, align 8, !dbg !125
  %3 = bitcast i32* %2 to i8*, !dbg !125
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !125
  %mul = mul i64 %call3, 4, !dbg !125
  %call4 = call i8* @__memmove_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 400) #4, !dbg !125
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx5, align 4, !dbg !127
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  call void @printWLine(i32* noundef %arraydecay6), !dbg !129
  ret void, !dbg !130
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
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_45_badData", scope: !2, file: !9, line: 21, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_45_goodG2BData", scope: !2, file: !9, line: 22, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 34, baseType: !13)
!12 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !14, line: 106, baseType: !15)
!14 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_45_bad", scope: !9, file: !9, line: 41, type: !24, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !9, line: 43, type: !10)
!28 = !DILocation(line: 43, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !9, line: 44, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1600, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 44, column: 13, scope: !23)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !9, line: 45, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 45, column: 13, scope: !23)
!39 = !DILocation(line: 46, column: 13, scope: !23)
!40 = !DILocation(line: 46, column: 5, scope: !23)
!41 = !DILocation(line: 47, column: 5, scope: !23)
!42 = !DILocation(line: 47, column: 25, scope: !23)
!43 = !DILocation(line: 48, column: 13, scope: !23)
!44 = !DILocation(line: 48, column: 5, scope: !23)
!45 = !DILocation(line: 49, column: 5, scope: !23)
!46 = !DILocation(line: 49, column: 27, scope: !23)
!47 = !DILocation(line: 51, column: 12, scope: !23)
!48 = !DILocation(line: 51, column: 10, scope: !23)
!49 = !DILocation(line: 52, column: 66, scope: !23)
!50 = !DILocation(line: 52, column: 64, scope: !23)
!51 = !DILocation(line: 53, column: 5, scope: !23)
!52 = !DILocation(line: 54, column: 1, scope: !23)
!53 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_45_good", scope: !9, file: !9, line: 91, type: !24, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!54 = !DILocation(line: 93, column: 5, scope: !53)
!55 = !DILocation(line: 94, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 105, type: !57, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!57 = !DISubroutineType(types: !58)
!58 = !{!15, !15, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !9, line: 105, type: !15)
!63 = !DILocation(line: 105, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !9, line: 105, type: !59)
!65 = !DILocation(line: 105, column: 27, scope: !56)
!66 = !DILocation(line: 108, column: 22, scope: !56)
!67 = !DILocation(line: 108, column: 12, scope: !56)
!68 = !DILocation(line: 108, column: 5, scope: !56)
!69 = !DILocation(line: 110, column: 5, scope: !56)
!70 = !DILocation(line: 111, column: 5, scope: !56)
!71 = !DILocation(line: 112, column: 5, scope: !56)
!72 = !DILocation(line: 115, column: 5, scope: !56)
!73 = !DILocation(line: 116, column: 5, scope: !56)
!74 = !DILocation(line: 117, column: 5, scope: !56)
!75 = !DILocation(line: 119, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 26, type: !24, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!77 = !DILocalVariable(name: "data", scope: !76, file: !9, line: 28, type: !10)
!78 = !DILocation(line: 28, column: 15, scope: !76)
!79 = !DILocation(line: 28, column: 22, scope: !76)
!80 = !DILocalVariable(name: "dest", scope: !81, file: !9, line: 30, type: !35)
!81 = distinct !DILexicalBlock(scope: !76, file: !9, line: 29, column: 5)
!82 = !DILocation(line: 30, column: 17, scope: !81)
!83 = !DILocation(line: 31, column: 17, scope: !81)
!84 = !DILocation(line: 31, column: 9, scope: !81)
!85 = !DILocation(line: 32, column: 9, scope: !81)
!86 = !DILocation(line: 32, column: 21, scope: !81)
!87 = !DILocation(line: 35, column: 9, scope: !81)
!88 = !DILocation(line: 36, column: 9, scope: !81)
!89 = !DILocation(line: 36, column: 21, scope: !81)
!90 = !DILocation(line: 37, column: 20, scope: !81)
!91 = !DILocation(line: 37, column: 9, scope: !81)
!92 = !DILocation(line: 39, column: 1, scope: !76)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 76, type: !24, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!94 = !DILocalVariable(name: "data", scope: !93, file: !9, line: 78, type: !10)
!95 = !DILocation(line: 78, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !9, line: 79, type: !30)
!97 = !DILocation(line: 79, column: 13, scope: !93)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !9, line: 80, type: !35)
!99 = !DILocation(line: 80, column: 13, scope: !93)
!100 = !DILocation(line: 81, column: 13, scope: !93)
!101 = !DILocation(line: 81, column: 5, scope: !93)
!102 = !DILocation(line: 82, column: 5, scope: !93)
!103 = !DILocation(line: 82, column: 25, scope: !93)
!104 = !DILocation(line: 83, column: 13, scope: !93)
!105 = !DILocation(line: 83, column: 5, scope: !93)
!106 = !DILocation(line: 84, column: 5, scope: !93)
!107 = !DILocation(line: 84, column: 27, scope: !93)
!108 = !DILocation(line: 86, column: 12, scope: !93)
!109 = !DILocation(line: 86, column: 10, scope: !93)
!110 = !DILocation(line: 87, column: 70, scope: !93)
!111 = !DILocation(line: 87, column: 68, scope: !93)
!112 = !DILocation(line: 88, column: 5, scope: !93)
!113 = !DILocation(line: 89, column: 1, scope: !93)
!114 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 61, type: !24, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!115 = !DILocalVariable(name: "data", scope: !114, file: !9, line: 63, type: !10)
!116 = !DILocation(line: 63, column: 15, scope: !114)
!117 = !DILocation(line: 63, column: 22, scope: !114)
!118 = !DILocalVariable(name: "dest", scope: !119, file: !9, line: 65, type: !35)
!119 = distinct !DILexicalBlock(scope: !114, file: !9, line: 64, column: 5)
!120 = !DILocation(line: 65, column: 17, scope: !119)
!121 = !DILocation(line: 66, column: 17, scope: !119)
!122 = !DILocation(line: 66, column: 9, scope: !119)
!123 = !DILocation(line: 67, column: 9, scope: !119)
!124 = !DILocation(line: 67, column: 21, scope: !119)
!125 = !DILocation(line: 70, column: 9, scope: !119)
!126 = !DILocation(line: 71, column: 9, scope: !119)
!127 = !DILocation(line: 71, column: 21, scope: !119)
!128 = !DILocation(line: 72, column: 20, scope: !119)
!129 = !DILocation(line: 72, column: 9, scope: !119)
!130 = !DILocation(line: 74, column: 1, scope: !114)
