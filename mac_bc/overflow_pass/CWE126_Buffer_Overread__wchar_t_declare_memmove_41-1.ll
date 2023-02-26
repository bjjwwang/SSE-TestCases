; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memmove_41_badSink(i32* noundef %data) #0 !dbg !11 {
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
define void @CWE126_Buffer_Overread__wchar_t_declare_memmove_41_bad() #0 !dbg !40 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !52
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !53
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !56
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx3, align 4, !dbg !59
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !60
  store i32* %arraydecay4, i32** %data, align 8, !dbg !61
  %0 = load i32*, i32** %data, align 8, !dbg !62
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_41_badSink(i32* noundef %0), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memmove_41_goodG2BSink(i32* noundef %data) #0 !dbg !65 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !68, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !71
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !72
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !75
  %1 = load i32*, i32** %data.addr, align 8, !dbg !75
  %2 = bitcast i32* %1 to i8*, !dbg !75
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !75
  %mul = mul i64 %call3, 4, !dbg !75
  %call4 = call i8* @__memmove_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !75
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !76
  store i32 0, i32* %arrayidx5, align 4, !dbg !77
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !78
  call void @printWLine(i32* noundef %arraydecay6), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memmove_41_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* noundef null), !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 noundef %conv), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_41_good(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_41_bad(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !111
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !112
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !115
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !116
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !117
  store i32 0, i32* %arrayidx3, align 4, !dbg !118
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i32* %arraydecay4, i32** %data, align 8, !dbg !120
  %0 = load i32*, i32** %data, align 8, !dbg !121
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_41_goodG2BSink(i32* noundef %0), !dbg !122
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 34, baseType: !18)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !19, line: 106, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!23 = !DILocation(line: 23, column: 75, scope: !11)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !12, line: 26, type: !26)
!25 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !27)
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
!39 = !DILocation(line: 35, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_41_bad", scope: !12, file: !12, line: 37, type: !41, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!41 = !DISubroutineType(types: !42)
!42 = !{null}
!43 = !DILocalVariable(name: "data", scope: !40, file: !12, line: 39, type: !15)
!44 = !DILocation(line: 39, column: 15, scope: !40)
!45 = !DILocalVariable(name: "dataBadBuffer", scope: !40, file: !12, line: 40, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 40, column: 13, scope: !40)
!50 = !DILocalVariable(name: "dataGoodBuffer", scope: !40, file: !12, line: 41, type: !26)
!51 = !DILocation(line: 41, column: 13, scope: !40)
!52 = !DILocation(line: 42, column: 13, scope: !40)
!53 = !DILocation(line: 42, column: 5, scope: !40)
!54 = !DILocation(line: 43, column: 5, scope: !40)
!55 = !DILocation(line: 43, column: 25, scope: !40)
!56 = !DILocation(line: 44, column: 13, scope: !40)
!57 = !DILocation(line: 44, column: 5, scope: !40)
!58 = !DILocation(line: 45, column: 5, scope: !40)
!59 = !DILocation(line: 45, column: 27, scope: !40)
!60 = !DILocation(line: 47, column: 12, scope: !40)
!61 = !DILocation(line: 47, column: 10, scope: !40)
!62 = !DILocation(line: 48, column: 64, scope: !40)
!63 = !DILocation(line: 48, column: 5, scope: !40)
!64 = !DILocation(line: 49, column: 1, scope: !40)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_41_goodG2BSink", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!66 = !DILocalVariable(name: "data", arg: 1, scope: !65, file: !12, line: 55, type: !15)
!67 = !DILocation(line: 55, column: 79, scope: !65)
!68 = !DILocalVariable(name: "dest", scope: !69, file: !12, line: 58, type: !26)
!69 = distinct !DILexicalBlock(scope: !65, file: !12, line: 57, column: 5)
!70 = !DILocation(line: 58, column: 17, scope: !69)
!71 = !DILocation(line: 59, column: 17, scope: !69)
!72 = !DILocation(line: 59, column: 9, scope: !69)
!73 = !DILocation(line: 60, column: 9, scope: !69)
!74 = !DILocation(line: 60, column: 21, scope: !69)
!75 = !DILocation(line: 63, column: 9, scope: !69)
!76 = !DILocation(line: 64, column: 9, scope: !69)
!77 = !DILocation(line: 64, column: 21, scope: !69)
!78 = !DILocation(line: 65, column: 20, scope: !69)
!79 = !DILocation(line: 65, column: 9, scope: !69)
!80 = !DILocation(line: 67, column: 1, scope: !65)
!81 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_41_good", scope: !12, file: !12, line: 84, type: !41, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!82 = !DILocation(line: 86, column: 5, scope: !81)
!83 = !DILocation(line: 87, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !85, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!85 = !DISubroutineType(types: !86)
!86 = !{!20, !20, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 99, type: !20)
!91 = !DILocation(line: 99, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 99, type: !87)
!93 = !DILocation(line: 99, column: 27, scope: !84)
!94 = !DILocation(line: 102, column: 22, scope: !84)
!95 = !DILocation(line: 102, column: 12, scope: !84)
!96 = !DILocation(line: 102, column: 5, scope: !84)
!97 = !DILocation(line: 104, column: 5, scope: !84)
!98 = !DILocation(line: 105, column: 5, scope: !84)
!99 = !DILocation(line: 106, column: 5, scope: !84)
!100 = !DILocation(line: 109, column: 5, scope: !84)
!101 = !DILocation(line: 110, column: 5, scope: !84)
!102 = !DILocation(line: 111, column: 5, scope: !84)
!103 = !DILocation(line: 113, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 70, type: !41, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 72, type: !15)
!106 = !DILocation(line: 72, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 73, type: !46)
!108 = !DILocation(line: 73, column: 13, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 74, type: !26)
!110 = !DILocation(line: 74, column: 13, scope: !104)
!111 = !DILocation(line: 75, column: 13, scope: !104)
!112 = !DILocation(line: 75, column: 5, scope: !104)
!113 = !DILocation(line: 76, column: 5, scope: !104)
!114 = !DILocation(line: 76, column: 25, scope: !104)
!115 = !DILocation(line: 77, column: 13, scope: !104)
!116 = !DILocation(line: 77, column: 5, scope: !104)
!117 = !DILocation(line: 78, column: 5, scope: !104)
!118 = !DILocation(line: 78, column: 27, scope: !104)
!119 = !DILocation(line: 80, column: 12, scope: !104)
!120 = !DILocation(line: 80, column: 10, scope: !104)
!121 = !DILocation(line: 81, column: 68, scope: !104)
!122 = !DILocation(line: 81, column: 5, scope: !104)
!123 = !DILocation(line: 82, column: 1, scope: !104)
