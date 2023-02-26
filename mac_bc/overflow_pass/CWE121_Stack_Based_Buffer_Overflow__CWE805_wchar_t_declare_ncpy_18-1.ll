; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  br label %source, !dbg !34

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !35), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i32* %arraydecay, i32** %data, align 8, !dbg !38
  %0 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !41, metadata !DIExpression()), !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !44
  %call = call i32* @wmemset(i32* noundef %arraydecay2, i32 noundef 67, i64 noundef 99), !dbg !45
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx3, align 4, !dbg !47
  %1 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !49
  %call5 = call i32* @wcsncpy(i32* noundef %1, i32* noundef %arraydecay4, i64 noundef 99), !dbg !50
  %2 = load i32*, i32** %data, align 8, !dbg !51
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !51
  store i32 0, i32* %arrayidx6, align 4, !dbg !52
  %3 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* noundef %3), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcsncpy(i32* noundef, i32* noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  br label %source, !dbg !86

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !87), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !89
  store i32* %arraydecay, i32** %data, align 8, !dbg !90
  %0 = load i32*, i32** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !96
  %call = call i32* @wmemset(i32* noundef %arraydecay2, i32 noundef 67, i64 noundef 99), !dbg !97
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !98
  store i32 0, i32* %arrayidx3, align 4, !dbg !99
  %1 = load i32*, i32** %data, align 8, !dbg !100
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !101
  %call5 = call i32* @wcsncpy(i32* noundef %1, i32* noundef %arraydecay4, i64 noundef 99), !dbg !102
  %2 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !103
  store i32 0, i32* %arrayidx6, align 4, !dbg !104
  %3 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* noundef %3), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 28, column: 5, scope: !11)
!35 = !DILabel(scope: !11, name: "source", file: !12, line: 29)
!36 = !DILocation(line: 29, column: 1, scope: !11)
!37 = !DILocation(line: 32, column: 12, scope: !11)
!38 = !DILocation(line: 32, column: 10, scope: !11)
!39 = !DILocation(line: 33, column: 5, scope: !11)
!40 = !DILocation(line: 33, column: 13, scope: !11)
!41 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 35, type: !30)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!43 = !DILocation(line: 35, column: 17, scope: !42)
!44 = !DILocation(line: 36, column: 17, scope: !42)
!45 = !DILocation(line: 36, column: 9, scope: !42)
!46 = !DILocation(line: 37, column: 9, scope: !42)
!47 = !DILocation(line: 37, column: 23, scope: !42)
!48 = !DILocation(line: 39, column: 17, scope: !42)
!49 = !DILocation(line: 39, column: 23, scope: !42)
!50 = !DILocation(line: 39, column: 9, scope: !42)
!51 = !DILocation(line: 40, column: 9, scope: !42)
!52 = !DILocation(line: 40, column: 21, scope: !42)
!53 = !DILocation(line: 41, column: 20, scope: !42)
!54 = !DILocation(line: 41, column: 9, scope: !42)
!55 = !DILocation(line: 43, column: 1, scope: !11)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_good", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!57 = !DILocation(line: 73, column: 5, scope: !56)
!58 = !DILocation(line: 74, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 86, type: !60, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!60 = !DISubroutineType(types: !61)
!61 = !{!22, !22, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 86, type: !22)
!66 = !DILocation(line: 86, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 86, type: !62)
!68 = !DILocation(line: 86, column: 27, scope: !59)
!69 = !DILocation(line: 89, column: 22, scope: !59)
!70 = !DILocation(line: 89, column: 12, scope: !59)
!71 = !DILocation(line: 89, column: 5, scope: !59)
!72 = !DILocation(line: 91, column: 5, scope: !59)
!73 = !DILocation(line: 92, column: 5, scope: !59)
!74 = !DILocation(line: 93, column: 5, scope: !59)
!75 = !DILocation(line: 96, column: 5, scope: !59)
!76 = !DILocation(line: 97, column: 5, scope: !59)
!77 = !DILocation(line: 98, column: 5, scope: !59)
!78 = !DILocation(line: 100, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 52, type: !17)
!81 = !DILocation(line: 52, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !12, line: 53, type: !25)
!83 = !DILocation(line: 53, column: 13, scope: !79)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !12, line: 54, type: !30)
!85 = !DILocation(line: 54, column: 13, scope: !79)
!86 = !DILocation(line: 55, column: 5, scope: !79)
!87 = !DILabel(scope: !79, name: "source", file: !12, line: 56)
!88 = !DILocation(line: 56, column: 1, scope: !79)
!89 = !DILocation(line: 58, column: 12, scope: !79)
!90 = !DILocation(line: 58, column: 10, scope: !79)
!91 = !DILocation(line: 59, column: 5, scope: !79)
!92 = !DILocation(line: 59, column: 13, scope: !79)
!93 = !DILocalVariable(name: "source", scope: !94, file: !12, line: 61, type: !30)
!94 = distinct !DILexicalBlock(scope: !79, file: !12, line: 60, column: 5)
!95 = !DILocation(line: 61, column: 17, scope: !94)
!96 = !DILocation(line: 62, column: 17, scope: !94)
!97 = !DILocation(line: 62, column: 9, scope: !94)
!98 = !DILocation(line: 63, column: 9, scope: !94)
!99 = !DILocation(line: 63, column: 23, scope: !94)
!100 = !DILocation(line: 65, column: 17, scope: !94)
!101 = !DILocation(line: 65, column: 23, scope: !94)
!102 = !DILocation(line: 65, column: 9, scope: !94)
!103 = !DILocation(line: 66, column: 9, scope: !94)
!104 = !DILocation(line: 66, column: 21, scope: !94)
!105 = !DILocation(line: 67, column: 20, scope: !94)
!106 = !DILocation(line: 67, column: 9, scope: !94)
!107 = !DILocation(line: 69, column: 1, scope: !79)
