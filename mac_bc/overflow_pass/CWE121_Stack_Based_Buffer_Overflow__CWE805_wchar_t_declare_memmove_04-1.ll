; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx2, align 4, !dbg !46
  %1 = load i32*, i32** %data, align 8, !dbg !47
  %2 = bitcast i32* %1 to i8*, !dbg !47
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %3 = bitcast i32* %arraydecay3 to i8*, !dbg !47
  %4 = load i32*, i32** %data, align 8, !dbg !47
  %5 = bitcast i32* %4 to i8*, !dbg !47
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !47
  %call4 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #4, !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !48
  store i32 0, i32* %arrayidx5, align 4, !dbg !49
  %8 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* noundef %8), !dbg !51
  ret void, !dbg !52
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_04_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* noundef null), !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 noundef %conv), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_04_good(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_04_bad(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !84
  store i32* %arraydecay, i32** %data, align 8, !dbg !87
  %0 = load i32*, i32** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !93
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !94
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !95
  store i32 0, i32* %arrayidx2, align 4, !dbg !96
  %1 = load i32*, i32** %data, align 8, !dbg !97
  %2 = bitcast i32* %1 to i8*, !dbg !97
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !97
  %3 = bitcast i32* %arraydecay3 to i8*, !dbg !97
  %4 = load i32*, i32** %data, align 8, !dbg !97
  %5 = bitcast i32* %4 to i8*, !dbg !97
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !97
  %call4 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #4, !dbg !97
  %7 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !98
  store i32 0, i32* %arrayidx5, align 4, !dbg !99
  %8 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* noundef %8), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i32* %arraydecay, i32** %data, align 8, !dbg !113
  %0 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !119
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !120
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx2, align 4, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %2 = bitcast i32* %1 to i8*, !dbg !123
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %3 = bitcast i32* %arraydecay3 to i8*, !dbg !123
  %4 = load i32*, i32** %data, align 8, !dbg !123
  %5 = bitcast i32* %4 to i8*, !dbg !123
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !123
  %call4 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #4, !dbg !123
  %7 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !124
  store i32 0, i32* %arrayidx5, align 4, !dbg !125
  %8 = load i32*, i32** %data, align 8, !dbg !126
  call void @printWLine(i32* noundef %8), !dbg !127
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 32, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 33, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 34, column: 13, scope: !11)
!34 = !DILocation(line: 39, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !12, line: 36, column: 5)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 8)
!37 = !DILocation(line: 39, column: 14, scope: !35)
!38 = !DILocation(line: 40, column: 9, scope: !35)
!39 = !DILocation(line: 40, column: 17, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 43, type: !30)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 5)
!42 = !DILocation(line: 43, column: 17, scope: !41)
!43 = !DILocation(line: 44, column: 17, scope: !41)
!44 = !DILocation(line: 44, column: 9, scope: !41)
!45 = !DILocation(line: 45, column: 9, scope: !41)
!46 = !DILocation(line: 45, column: 23, scope: !41)
!47 = !DILocation(line: 47, column: 9, scope: !41)
!48 = !DILocation(line: 48, column: 9, scope: !41)
!49 = !DILocation(line: 48, column: 21, scope: !41)
!50 = !DILocation(line: 49, column: 20, scope: !41)
!51 = !DILocation(line: 49, column: 9, scope: !41)
!52 = !DILocation(line: 51, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_04_good", scope: !12, file: !12, line: 108, type: !13, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!54 = !DILocation(line: 110, column: 5, scope: !53)
!55 = !DILocation(line: 111, column: 5, scope: !53)
!56 = !DILocation(line: 112, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 124, type: !58, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!58 = !DISubroutineType(types: !59)
!59 = !{!22, !22, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 124, type: !22)
!64 = !DILocation(line: 124, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 124, type: !60)
!66 = !DILocation(line: 124, column: 27, scope: !57)
!67 = !DILocation(line: 127, column: 22, scope: !57)
!68 = !DILocation(line: 127, column: 12, scope: !57)
!69 = !DILocation(line: 127, column: 5, scope: !57)
!70 = !DILocation(line: 129, column: 5, scope: !57)
!71 = !DILocation(line: 130, column: 5, scope: !57)
!72 = !DILocation(line: 131, column: 5, scope: !57)
!73 = !DILocation(line: 134, column: 5, scope: !57)
!74 = !DILocation(line: 135, column: 5, scope: !57)
!75 = !DILocation(line: 136, column: 5, scope: !57)
!76 = !DILocation(line: 138, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 60, type: !17)
!79 = !DILocation(line: 60, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !12, line: 61, type: !25)
!81 = !DILocation(line: 61, column: 13, scope: !77)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !12, line: 62, type: !30)
!83 = !DILocation(line: 62, column: 13, scope: !77)
!84 = !DILocation(line: 71, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !12, line: 69, column: 5)
!86 = distinct !DILexicalBlock(scope: !77, file: !12, line: 63, column: 8)
!87 = !DILocation(line: 71, column: 14, scope: !85)
!88 = !DILocation(line: 72, column: 9, scope: !85)
!89 = !DILocation(line: 72, column: 17, scope: !85)
!90 = !DILocalVariable(name: "source", scope: !91, file: !12, line: 75, type: !30)
!91 = distinct !DILexicalBlock(scope: !77, file: !12, line: 74, column: 5)
!92 = !DILocation(line: 75, column: 17, scope: !91)
!93 = !DILocation(line: 76, column: 17, scope: !91)
!94 = !DILocation(line: 76, column: 9, scope: !91)
!95 = !DILocation(line: 77, column: 9, scope: !91)
!96 = !DILocation(line: 77, column: 23, scope: !91)
!97 = !DILocation(line: 79, column: 9, scope: !91)
!98 = !DILocation(line: 80, column: 9, scope: !91)
!99 = !DILocation(line: 80, column: 21, scope: !91)
!100 = !DILocation(line: 81, column: 20, scope: !91)
!101 = !DILocation(line: 81, column: 9, scope: !91)
!102 = !DILocation(line: 83, column: 1, scope: !77)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 88, type: !17)
!105 = !DILocation(line: 88, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 89, type: !25)
!107 = !DILocation(line: 89, column: 13, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 90, type: !30)
!109 = !DILocation(line: 90, column: 13, scope: !103)
!110 = !DILocation(line: 94, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !112, file: !12, line: 92, column: 5)
!112 = distinct !DILexicalBlock(scope: !103, file: !12, line: 91, column: 8)
!113 = !DILocation(line: 94, column: 14, scope: !111)
!114 = !DILocation(line: 95, column: 9, scope: !111)
!115 = !DILocation(line: 95, column: 17, scope: !111)
!116 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 98, type: !30)
!117 = distinct !DILexicalBlock(scope: !103, file: !12, line: 97, column: 5)
!118 = !DILocation(line: 98, column: 17, scope: !117)
!119 = !DILocation(line: 99, column: 17, scope: !117)
!120 = !DILocation(line: 99, column: 9, scope: !117)
!121 = !DILocation(line: 100, column: 9, scope: !117)
!122 = !DILocation(line: 100, column: 23, scope: !117)
!123 = !DILocation(line: 102, column: 9, scope: !117)
!124 = !DILocation(line: 103, column: 9, scope: !117)
!125 = !DILocation(line: 103, column: 21, scope: !117)
!126 = !DILocation(line: 104, column: 20, scope: !117)
!127 = !DILocation(line: 104, column: 9, scope: !117)
!128 = !DILocation(line: 106, column: 1, scope: !103)
