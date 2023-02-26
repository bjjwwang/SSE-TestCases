; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_44_bad() #0 !dbg !11 {
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
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  %0 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %1 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !43
  %2 = load i32*, i32** %data, align 8, !dbg !44
  call void %1(i32* noundef %2), !dbg !43
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !53
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  %0 = load i32*, i32** %data.addr, align 8, !dbg !56
  %1 = bitcast i32* %0 to i8*, !dbg !56
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !56
  %3 = load i32*, i32** %data.addr, align 8, !dbg !56
  %4 = bitcast i32* %3 to i8*, !dbg !56
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !56
  %call2 = call i8* @__memcpy_chk(i8* noundef %1, i8* noundef %2, i64 noundef 400, i64 noundef %5) #4, !dbg !56
  %6 = load i32*, i32** %data.addr, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !57
  store i32 0, i32* %arrayidx3, align 4, !dbg !58
  %7 = load i32*, i32** %data.addr, align 8, !dbg !59
  call void @printWLine(i32* noundef %7), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_44_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* noundef null), !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 noundef %conv), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_44_good(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_44_bad(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !88, metadata !DIExpression()), !dbg !89
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !94
  store i32* %arraydecay, i32** %data, align 8, !dbg !95
  %0 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  %1 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !98
  %2 = load i32*, i32** %data, align 8, !dbg !99
  call void %1(i32* noundef %2), !dbg !98
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !101 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !108
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %0 = load i32*, i32** %data.addr, align 8, !dbg !111
  %1 = bitcast i32* %0 to i8*, !dbg !111
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !111
  %3 = load i32*, i32** %data.addr, align 8, !dbg !111
  %4 = bitcast i32* %3 to i8*, !dbg !111
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !111
  %call2 = call i8* @__memcpy_chk(i8* noundef %1, i8* noundef %2, i64 noundef 400, i64 noundef %5) #4, !dbg !111
  %6 = load i32*, i32** %data.addr, align 8, !dbg !112
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !112
  store i32 0, i32* %arrayidx3, align 4, !dbg !113
  %7 = load i32*, i32** %data.addr, align 8, !dbg !114
  call void @printWLine(i32* noundef %7), !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_44_bad", scope: !12, file: !12, line: 36, type: !13, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 38, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 38, column: 15, scope: !11)
!24 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 40, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !17}
!28 = !DILocation(line: 40, column: 12, scope: !11)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 41, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 41, column: 13, scope: !11)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 42, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 42, column: 13, scope: !11)
!39 = !DILocation(line: 45, column: 12, scope: !11)
!40 = !DILocation(line: 45, column: 10, scope: !11)
!41 = !DILocation(line: 46, column: 5, scope: !11)
!42 = !DILocation(line: 46, column: 13, scope: !11)
!43 = !DILocation(line: 48, column: 5, scope: !11)
!44 = !DILocation(line: 48, column: 13, scope: !11)
!45 = !DILocation(line: 49, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !26, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!47 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !12, line: 23, type: !17)
!48 = !DILocation(line: 23, column: 31, scope: !46)
!49 = !DILocalVariable(name: "source", scope: !50, file: !12, line: 26, type: !35)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 25, column: 5)
!51 = !DILocation(line: 26, column: 17, scope: !50)
!52 = !DILocation(line: 27, column: 17, scope: !50)
!53 = !DILocation(line: 27, column: 9, scope: !50)
!54 = !DILocation(line: 28, column: 9, scope: !50)
!55 = !DILocation(line: 28, column: 23, scope: !50)
!56 = !DILocation(line: 30, column: 9, scope: !50)
!57 = !DILocation(line: 31, column: 9, scope: !50)
!58 = !DILocation(line: 31, column: 21, scope: !50)
!59 = !DILocation(line: 32, column: 20, scope: !50)
!60 = !DILocation(line: 32, column: 9, scope: !50)
!61 = !DILocation(line: 34, column: 1, scope: !46)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_44_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!63 = !DILocation(line: 83, column: 5, scope: !62)
!64 = !DILocation(line: 84, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 95, type: !66, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!66 = !DISubroutineType(types: !67)
!67 = !{!22, !22, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 95, type: !22)
!72 = !DILocation(line: 95, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 95, type: !68)
!74 = !DILocation(line: 95, column: 27, scope: !65)
!75 = !DILocation(line: 98, column: 22, scope: !65)
!76 = !DILocation(line: 98, column: 12, scope: !65)
!77 = !DILocation(line: 98, column: 5, scope: !65)
!78 = !DILocation(line: 100, column: 5, scope: !65)
!79 = !DILocation(line: 101, column: 5, scope: !65)
!80 = !DILocation(line: 102, column: 5, scope: !65)
!81 = !DILocation(line: 105, column: 5, scope: !65)
!82 = !DILocation(line: 106, column: 5, scope: !65)
!83 = !DILocation(line: 107, column: 5, scope: !65)
!84 = !DILocation(line: 109, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 71, type: !17)
!87 = !DILocation(line: 71, column: 15, scope: !85)
!88 = !DILocalVariable(name: "funcPtr", scope: !85, file: !12, line: 72, type: !25)
!89 = !DILocation(line: 72, column: 12, scope: !85)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !12, line: 73, type: !30)
!91 = !DILocation(line: 73, column: 13, scope: !85)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !12, line: 74, type: !35)
!93 = !DILocation(line: 74, column: 13, scope: !85)
!94 = !DILocation(line: 76, column: 12, scope: !85)
!95 = !DILocation(line: 76, column: 10, scope: !85)
!96 = !DILocation(line: 77, column: 5, scope: !85)
!97 = !DILocation(line: 77, column: 13, scope: !85)
!98 = !DILocation(line: 78, column: 5, scope: !85)
!99 = !DILocation(line: 78, column: 13, scope: !85)
!100 = !DILocation(line: 79, column: 1, scope: !85)
!101 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 56, type: !26, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!102 = !DILocalVariable(name: "data", arg: 1, scope: !101, file: !12, line: 56, type: !17)
!103 = !DILocation(line: 56, column: 35, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 59, type: !35)
!105 = distinct !DILexicalBlock(scope: !101, file: !12, line: 58, column: 5)
!106 = !DILocation(line: 59, column: 17, scope: !105)
!107 = !DILocation(line: 60, column: 17, scope: !105)
!108 = !DILocation(line: 60, column: 9, scope: !105)
!109 = !DILocation(line: 61, column: 9, scope: !105)
!110 = !DILocation(line: 61, column: 23, scope: !105)
!111 = !DILocation(line: 63, column: 9, scope: !105)
!112 = !DILocation(line: 64, column: 9, scope: !105)
!113 = !DILocation(line: 64, column: 21, scope: !105)
!114 = !DILocation(line: 65, column: 20, scope: !105)
!115 = !DILocation(line: 65, column: 9, scope: !105)
!116 = !DILocation(line: 67, column: 1, scope: !101)
