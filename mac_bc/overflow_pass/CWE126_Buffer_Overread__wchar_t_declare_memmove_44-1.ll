; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memmove_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !24, metadata !DIExpression()), !dbg !28
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !28
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
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !49
  %1 = load i32*, i32** %data, align 8, !dbg !50
  call void %0(i32* noundef %1), !dbg !49
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !55, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !59
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx, align 4, !dbg !61
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !62
  %1 = load i32*, i32** %data.addr, align 8, !dbg !62
  %2 = bitcast i32* %1 to i8*, !dbg !62
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !62
  %mul = mul i64 %call3, 4, !dbg !62
  %call4 = call i8* @__memmove_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !62
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx5, align 4, !dbg !64
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  call void @printWLine(i32* noundef %arraydecay6), !dbg !66
  ret void, !dbg !67
}

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memmove_44_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* noundef null), !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 noundef %conv), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_44_good(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_44_bad(), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !94, metadata !DIExpression()), !dbg !95
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !95
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
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !110
  %1 = load i32*, i32** %data, align 8, !dbg !111
  call void %0(i32* noundef %1), !dbg !110
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !113 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !120
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !123
  %1 = load i32*, i32** %data.addr, align 8, !dbg !123
  %2 = bitcast i32* %1 to i8*, !dbg !123
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !123
  %mul = mul i64 %call3, 4, !dbg !123
  %call4 = call i8* @__memmove_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !123
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx5, align 4, !dbg !125
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  call void @printWLine(i32* noundef %arraydecay6), !dbg !127
  ret void, !dbg !128
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_44_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memmove_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 39, column: 15, scope: !11)
!24 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 41, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !17}
!28 = !DILocation(line: 41, column: 12, scope: !11)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 42, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 42, column: 13, scope: !11)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 43, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 43, column: 13, scope: !11)
!39 = !DILocation(line: 44, column: 13, scope: !11)
!40 = !DILocation(line: 44, column: 5, scope: !11)
!41 = !DILocation(line: 45, column: 5, scope: !11)
!42 = !DILocation(line: 45, column: 25, scope: !11)
!43 = !DILocation(line: 46, column: 13, scope: !11)
!44 = !DILocation(line: 46, column: 5, scope: !11)
!45 = !DILocation(line: 47, column: 5, scope: !11)
!46 = !DILocation(line: 47, column: 27, scope: !11)
!47 = !DILocation(line: 49, column: 12, scope: !11)
!48 = !DILocation(line: 49, column: 10, scope: !11)
!49 = !DILocation(line: 51, column: 5, scope: !11)
!50 = !DILocation(line: 51, column: 13, scope: !11)
!51 = !DILocation(line: 52, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !26, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!53 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !12, line: 23, type: !17)
!54 = !DILocation(line: 23, column: 31, scope: !52)
!55 = !DILocalVariable(name: "dest", scope: !56, file: !12, line: 26, type: !35)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 25, column: 5)
!57 = !DILocation(line: 26, column: 17, scope: !56)
!58 = !DILocation(line: 27, column: 17, scope: !56)
!59 = !DILocation(line: 27, column: 9, scope: !56)
!60 = !DILocation(line: 28, column: 9, scope: !56)
!61 = !DILocation(line: 28, column: 21, scope: !56)
!62 = !DILocation(line: 31, column: 9, scope: !56)
!63 = !DILocation(line: 32, column: 9, scope: !56)
!64 = !DILocation(line: 32, column: 21, scope: !56)
!65 = !DILocation(line: 33, column: 20, scope: !56)
!66 = !DILocation(line: 33, column: 9, scope: !56)
!67 = !DILocation(line: 35, column: 1, scope: !52)
!68 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_44_good", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!69 = !DILocation(line: 90, column: 5, scope: !68)
!70 = !DILocation(line: 91, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !72, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DISubroutineType(types: !73)
!73 = !{!22, !22, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !12, line: 102, type: !22)
!78 = !DILocation(line: 102, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !12, line: 102, type: !74)
!80 = !DILocation(line: 102, column: 27, scope: !71)
!81 = !DILocation(line: 105, column: 22, scope: !71)
!82 = !DILocation(line: 105, column: 12, scope: !71)
!83 = !DILocation(line: 105, column: 5, scope: !71)
!84 = !DILocation(line: 107, column: 5, scope: !71)
!85 = !DILocation(line: 108, column: 5, scope: !71)
!86 = !DILocation(line: 109, column: 5, scope: !71)
!87 = !DILocation(line: 112, column: 5, scope: !71)
!88 = !DILocation(line: 113, column: 5, scope: !71)
!89 = !DILocation(line: 114, column: 5, scope: !71)
!90 = !DILocation(line: 116, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 75, type: !17)
!93 = !DILocation(line: 75, column: 15, scope: !91)
!94 = !DILocalVariable(name: "funcPtr", scope: !91, file: !12, line: 76, type: !25)
!95 = !DILocation(line: 76, column: 12, scope: !91)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 77, type: !30)
!97 = !DILocation(line: 77, column: 13, scope: !91)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 78, type: !35)
!99 = !DILocation(line: 78, column: 13, scope: !91)
!100 = !DILocation(line: 79, column: 13, scope: !91)
!101 = !DILocation(line: 79, column: 5, scope: !91)
!102 = !DILocation(line: 80, column: 5, scope: !91)
!103 = !DILocation(line: 80, column: 25, scope: !91)
!104 = !DILocation(line: 81, column: 13, scope: !91)
!105 = !DILocation(line: 81, column: 5, scope: !91)
!106 = !DILocation(line: 82, column: 5, scope: !91)
!107 = !DILocation(line: 82, column: 27, scope: !91)
!108 = !DILocation(line: 84, column: 12, scope: !91)
!109 = !DILocation(line: 84, column: 10, scope: !91)
!110 = !DILocation(line: 85, column: 5, scope: !91)
!111 = !DILocation(line: 85, column: 13, scope: !91)
!112 = !DILocation(line: 86, column: 1, scope: !91)
!113 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 59, type: !26, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!114 = !DILocalVariable(name: "data", arg: 1, scope: !113, file: !12, line: 59, type: !17)
!115 = !DILocation(line: 59, column: 35, scope: !113)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !12, line: 62, type: !35)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 61, column: 5)
!118 = !DILocation(line: 62, column: 17, scope: !117)
!119 = !DILocation(line: 63, column: 17, scope: !117)
!120 = !DILocation(line: 63, column: 9, scope: !117)
!121 = !DILocation(line: 64, column: 9, scope: !117)
!122 = !DILocation(line: 64, column: 21, scope: !117)
!123 = !DILocation(line: 67, column: 9, scope: !117)
!124 = !DILocation(line: 68, column: 9, scope: !117)
!125 = !DILocation(line: 68, column: 21, scope: !117)
!126 = !DILocation(line: 69, column: 20, scope: !117)
!127 = !DILocation(line: 69, column: 9, scope: !117)
!128 = !DILocation(line: 71, column: 1, scope: !113)
