; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_badSink(i32* noundef %data) #0 !dbg !11 {
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
  %1 = bitcast i32* %0 to i8*, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !34
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !34
  %3 = load i32*, i32** %data.addr, align 8, !dbg !34
  %4 = bitcast i32* %3 to i8*, !dbg !34
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !34
  %call2 = call i8* @__memmove_chk(i8* noundef %1, i8* noundef %2, i64 noundef 400, i64 noundef %5) #4, !dbg !34
  %6 = load i32*, i32** %data.addr, align 8, !dbg !35
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !35
  store i32 0, i32* %arrayidx3, align 4, !dbg !36
  %7 = load i32*, i32** %data.addr, align 8, !dbg !37
  call void @printWLine(i32* noundef %7), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_bad() #0 !dbg !40 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !52
  store i32* %arraydecay, i32** %data, align 8, !dbg !53
  %0 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  %1 = load i32*, i32** %data, align 8, !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_badSink(i32* noundef %1), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_goodG2BSink(i32* noundef %data) #0 !dbg !59 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !62, metadata !DIExpression()), !dbg !64
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !65
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !66
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx, align 4, !dbg !68
  %0 = load i32*, i32** %data.addr, align 8, !dbg !69
  %1 = bitcast i32* %0 to i8*, !dbg !69
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !69
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !69
  %3 = load i32*, i32** %data.addr, align 8, !dbg !69
  %4 = bitcast i32* %3 to i8*, !dbg !69
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !69
  %call2 = call i8* @__memmove_chk(i8* noundef %1, i8* noundef %2, i64 noundef 400, i64 noundef %5) #4, !dbg !69
  %6 = load i32*, i32** %data.addr, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !70
  store i32 0, i32* %arrayidx3, align 4, !dbg !71
  %7 = load i32*, i32** %data.addr, align 8, !dbg !72
  call void @printWLine(i32* noundef %7), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* noundef null), !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 noundef %conv), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_good(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_bad(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !105
  store i32* %arraydecay, i32** %data, align 8, !dbg !106
  %0 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %1 = load i32*, i32** %data, align 8, !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_goodG2BSink(i32* noundef %1), !dbg !110
  ret void, !dbg !111
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!23 = !DILocation(line: 23, column: 94, scope: !11)
!24 = !DILocalVariable(name: "source", scope: !25, file: !12, line: 26, type: !26)
!25 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 26, column: 17, scope: !25)
!30 = !DILocation(line: 27, column: 17, scope: !25)
!31 = !DILocation(line: 27, column: 9, scope: !25)
!32 = !DILocation(line: 28, column: 9, scope: !25)
!33 = !DILocation(line: 28, column: 23, scope: !25)
!34 = !DILocation(line: 30, column: 9, scope: !25)
!35 = !DILocation(line: 31, column: 9, scope: !25)
!36 = !DILocation(line: 31, column: 21, scope: !25)
!37 = !DILocation(line: 32, column: 20, scope: !25)
!38 = !DILocation(line: 32, column: 9, scope: !25)
!39 = !DILocation(line: 34, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_bad", scope: !12, file: !12, line: 36, type: !41, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!41 = !DISubroutineType(types: !42)
!42 = !{null}
!43 = !DILocalVariable(name: "data", scope: !40, file: !12, line: 38, type: !15)
!44 = !DILocation(line: 38, column: 15, scope: !40)
!45 = !DILocalVariable(name: "dataBadBuffer", scope: !40, file: !12, line: 39, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 39, column: 13, scope: !40)
!50 = !DILocalVariable(name: "dataGoodBuffer", scope: !40, file: !12, line: 40, type: !26)
!51 = !DILocation(line: 40, column: 13, scope: !40)
!52 = !DILocation(line: 43, column: 12, scope: !40)
!53 = !DILocation(line: 43, column: 10, scope: !40)
!54 = !DILocation(line: 44, column: 5, scope: !40)
!55 = !DILocation(line: 44, column: 13, scope: !40)
!56 = !DILocation(line: 45, column: 83, scope: !40)
!57 = !DILocation(line: 45, column: 5, scope: !40)
!58 = !DILocation(line: 46, column: 1, scope: !40)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_goodG2BSink", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!60 = !DILocalVariable(name: "data", arg: 1, scope: !59, file: !12, line: 52, type: !15)
!61 = !DILocation(line: 52, column: 98, scope: !59)
!62 = !DILocalVariable(name: "source", scope: !63, file: !12, line: 55, type: !26)
!63 = distinct !DILexicalBlock(scope: !59, file: !12, line: 54, column: 5)
!64 = !DILocation(line: 55, column: 17, scope: !63)
!65 = !DILocation(line: 56, column: 17, scope: !63)
!66 = !DILocation(line: 56, column: 9, scope: !63)
!67 = !DILocation(line: 57, column: 9, scope: !63)
!68 = !DILocation(line: 57, column: 23, scope: !63)
!69 = !DILocation(line: 59, column: 9, scope: !63)
!70 = !DILocation(line: 60, column: 9, scope: !63)
!71 = !DILocation(line: 60, column: 21, scope: !63)
!72 = !DILocation(line: 61, column: 20, scope: !63)
!73 = !DILocation(line: 61, column: 9, scope: !63)
!74 = !DILocation(line: 63, column: 1, scope: !59)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_41_good", scope: !12, file: !12, line: 77, type: !41, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!76 = !DILocation(line: 79, column: 5, scope: !75)
!77 = !DILocation(line: 80, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !79, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!79 = !DISubroutineType(types: !80)
!80 = !{!20, !20, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !12, line: 92, type: !20)
!85 = !DILocation(line: 92, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !12, line: 92, type: !81)
!87 = !DILocation(line: 92, column: 27, scope: !78)
!88 = !DILocation(line: 95, column: 22, scope: !78)
!89 = !DILocation(line: 95, column: 12, scope: !78)
!90 = !DILocation(line: 95, column: 5, scope: !78)
!91 = !DILocation(line: 97, column: 5, scope: !78)
!92 = !DILocation(line: 98, column: 5, scope: !78)
!93 = !DILocation(line: 99, column: 5, scope: !78)
!94 = !DILocation(line: 102, column: 5, scope: !78)
!95 = !DILocation(line: 103, column: 5, scope: !78)
!96 = !DILocation(line: 104, column: 5, scope: !78)
!97 = !DILocation(line: 106, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 66, type: !41, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 68, type: !15)
!100 = !DILocation(line: 68, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !12, line: 69, type: !46)
!102 = !DILocation(line: 69, column: 13, scope: !98)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !12, line: 70, type: !26)
!104 = !DILocation(line: 70, column: 13, scope: !98)
!105 = !DILocation(line: 72, column: 12, scope: !98)
!106 = !DILocation(line: 72, column: 10, scope: !98)
!107 = !DILocation(line: 73, column: 5, scope: !98)
!108 = !DILocation(line: 73, column: 13, scope: !98)
!109 = !DILocation(line: 74, column: 87, scope: !98)
!110 = !DILocation(line: 74, column: 5, scope: !98)
!111 = !DILocation(line: 75, column: 1, scope: !98)
