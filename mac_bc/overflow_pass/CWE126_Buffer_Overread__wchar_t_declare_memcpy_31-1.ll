; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data5 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !35
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx3, align 4, !dbg !41
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay4, i32** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !44, metadata !DIExpression()), !dbg !46
  %0 = load i32*, i32** %data, align 8, !dbg !47
  store i32* %0, i32** %dataCopy, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !48, metadata !DIExpression()), !dbg !49
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !50
  store i32* %1, i32** %data5, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !53
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call7 = call i32* @wmemset(i32* noundef %arraydecay6, i32 noundef 67, i64 noundef 99), !dbg !55
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx8, align 4, !dbg !57
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %2 = bitcast i32* %arraydecay9 to i8*, !dbg !58
  %3 = load i32*, i32** %data5, align 8, !dbg !58
  %4 = bitcast i32* %3 to i8*, !dbg !58
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call11 = call i64 @wcslen(i32* noundef %arraydecay10), !dbg !58
  %mul = mul i64 %call11, 4, !dbg !58
  %call12 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %4, i64 noundef %mul, i64 noundef 400) #4, !dbg !58
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx13, align 4, !dbg !60
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  call void @printWLine(i32* noundef %arraydecay14), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_31_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* noundef null), !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 noundef %conv), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_31_good(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_31_bad(), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data5 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !94
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !95
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !99
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !100
  store i32 0, i32* %arrayidx3, align 4, !dbg !101
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !102
  store i32* %arraydecay4, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !104, metadata !DIExpression()), !dbg !106
  %0 = load i32*, i32** %data, align 8, !dbg !107
  store i32* %0, i32** %dataCopy, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !108, metadata !DIExpression()), !dbg !109
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !110
  store i32* %1, i32** %data5, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !114
  %call7 = call i32* @wmemset(i32* noundef %arraydecay6, i32 noundef 67, i64 noundef 99), !dbg !115
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx8, align 4, !dbg !117
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %2 = bitcast i32* %arraydecay9 to i8*, !dbg !118
  %3 = load i32*, i32** %data5, align 8, !dbg !118
  %4 = bitcast i32* %3 to i8*, !dbg !118
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %call11 = call i64 @wcslen(i32* noundef %arraydecay10), !dbg !118
  %mul = mul i64 %call11, 4, !dbg !118
  %call12 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %4, i64 noundef %mul, i64 noundef 400) #4, !dbg !118
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx13, align 4, !dbg !120
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !121
  call void @printWLine(i32* noundef %arraydecay14), !dbg !122
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 25, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 13, scope: !11)
!34 = !DILocation(line: 28, column: 13, scope: !11)
!35 = !DILocation(line: 28, column: 5, scope: !11)
!36 = !DILocation(line: 29, column: 5, scope: !11)
!37 = !DILocation(line: 29, column: 25, scope: !11)
!38 = !DILocation(line: 30, column: 13, scope: !11)
!39 = !DILocation(line: 30, column: 5, scope: !11)
!40 = !DILocation(line: 31, column: 5, scope: !11)
!41 = !DILocation(line: 31, column: 27, scope: !11)
!42 = !DILocation(line: 33, column: 12, scope: !11)
!43 = !DILocation(line: 33, column: 10, scope: !11)
!44 = !DILocalVariable(name: "dataCopy", scope: !45, file: !12, line: 35, type: !17)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!46 = !DILocation(line: 35, column: 19, scope: !45)
!47 = !DILocation(line: 35, column: 30, scope: !45)
!48 = !DILocalVariable(name: "data", scope: !45, file: !12, line: 36, type: !17)
!49 = !DILocation(line: 36, column: 19, scope: !45)
!50 = !DILocation(line: 36, column: 26, scope: !45)
!51 = !DILocalVariable(name: "dest", scope: !52, file: !12, line: 38, type: !30)
!52 = distinct !DILexicalBlock(scope: !45, file: !12, line: 37, column: 9)
!53 = !DILocation(line: 38, column: 21, scope: !52)
!54 = !DILocation(line: 39, column: 21, scope: !52)
!55 = !DILocation(line: 39, column: 13, scope: !52)
!56 = !DILocation(line: 40, column: 13, scope: !52)
!57 = !DILocation(line: 40, column: 25, scope: !52)
!58 = !DILocation(line: 43, column: 13, scope: !52)
!59 = !DILocation(line: 44, column: 13, scope: !52)
!60 = !DILocation(line: 44, column: 25, scope: !52)
!61 = !DILocation(line: 45, column: 24, scope: !52)
!62 = !DILocation(line: 45, column: 13, scope: !52)
!63 = !DILocation(line: 48, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_31_good", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!65 = !DILocation(line: 84, column: 5, scope: !64)
!66 = !DILocation(line: 85, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !68, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!68 = !DISubroutineType(types: !69)
!69 = !{!22, !22, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 96, type: !22)
!74 = !DILocation(line: 96, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 96, type: !70)
!76 = !DILocation(line: 96, column: 27, scope: !67)
!77 = !DILocation(line: 99, column: 22, scope: !67)
!78 = !DILocation(line: 99, column: 12, scope: !67)
!79 = !DILocation(line: 99, column: 5, scope: !67)
!80 = !DILocation(line: 101, column: 5, scope: !67)
!81 = !DILocation(line: 102, column: 5, scope: !67)
!82 = !DILocation(line: 103, column: 5, scope: !67)
!83 = !DILocation(line: 106, column: 5, scope: !67)
!84 = !DILocation(line: 107, column: 5, scope: !67)
!85 = !DILocation(line: 108, column: 5, scope: !67)
!86 = !DILocation(line: 110, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 57, type: !17)
!89 = !DILocation(line: 57, column: 15, scope: !87)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !12, line: 58, type: !25)
!91 = !DILocation(line: 58, column: 13, scope: !87)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !12, line: 59, type: !30)
!93 = !DILocation(line: 59, column: 13, scope: !87)
!94 = !DILocation(line: 60, column: 13, scope: !87)
!95 = !DILocation(line: 60, column: 5, scope: !87)
!96 = !DILocation(line: 61, column: 5, scope: !87)
!97 = !DILocation(line: 61, column: 25, scope: !87)
!98 = !DILocation(line: 62, column: 13, scope: !87)
!99 = !DILocation(line: 62, column: 5, scope: !87)
!100 = !DILocation(line: 63, column: 5, scope: !87)
!101 = !DILocation(line: 63, column: 27, scope: !87)
!102 = !DILocation(line: 65, column: 12, scope: !87)
!103 = !DILocation(line: 65, column: 10, scope: !87)
!104 = !DILocalVariable(name: "dataCopy", scope: !105, file: !12, line: 67, type: !17)
!105 = distinct !DILexicalBlock(scope: !87, file: !12, line: 66, column: 5)
!106 = !DILocation(line: 67, column: 19, scope: !105)
!107 = !DILocation(line: 67, column: 30, scope: !105)
!108 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 68, type: !17)
!109 = !DILocation(line: 68, column: 19, scope: !105)
!110 = !DILocation(line: 68, column: 26, scope: !105)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !12, line: 70, type: !30)
!112 = distinct !DILexicalBlock(scope: !105, file: !12, line: 69, column: 9)
!113 = !DILocation(line: 70, column: 21, scope: !112)
!114 = !DILocation(line: 71, column: 21, scope: !112)
!115 = !DILocation(line: 71, column: 13, scope: !112)
!116 = !DILocation(line: 72, column: 13, scope: !112)
!117 = !DILocation(line: 72, column: 25, scope: !112)
!118 = !DILocation(line: 75, column: 13, scope: !112)
!119 = !DILocation(line: 76, column: 13, scope: !112)
!120 = !DILocation(line: 76, column: 25, scope: !112)
!121 = !DILocation(line: 77, column: 24, scope: !112)
!122 = !DILocation(line: 77, column: 13, scope: !112)
!123 = !DILocation(line: 80, column: 1, scope: !87)
