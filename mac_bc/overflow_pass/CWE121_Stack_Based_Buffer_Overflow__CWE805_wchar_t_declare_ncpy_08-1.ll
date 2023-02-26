; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %call = call i32 @staticReturnsTrue(), !dbg !34
  %tobool = icmp ne i32 %call, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i32* %arraydecay, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !47
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx3, align 4, !dbg !49
  %1 = load i32*, i32** %data, align 8, !dbg !50
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call5 = call i32* @wcsncpy(i32* noundef %1, i32* noundef %arraydecay4, i64 noundef 99), !dbg !52
  %2 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !53
  store i32 0, i32* %arrayidx6, align 4, !dbg !54
  %3 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* noundef %3), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcsncpy(i32* noundef, i32* noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* noundef null), !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 noundef %conv), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_good(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_bad(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !82 {
entry:
  ret i32 1, !dbg !85
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i32 @staticReturnsFalse(), !dbg !93
  %tobool = icmp ne i32 %call, 0, !dbg !93
  br i1 %tobool, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end, !dbg !98

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i32* %arraydecay, i32** %data, align 8, !dbg !101
  %0 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !108
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx3, align 4, !dbg !110
  %1 = load i32*, i32** %data, align 8, !dbg !111
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call5 = call i32* @wcsncpy(i32* noundef %1, i32* noundef %arraydecay4, i64 noundef 99), !dbg !113
  %2 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !114
  store i32 0, i32* %arrayidx6, align 4, !dbg !115
  %3 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* noundef %3), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !119 {
entry:
  ret i32 0, !dbg !120
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %call = call i32 @staticReturnsTrue(), !dbg !128
  %tobool = icmp ne i32 %call, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !131
  store i32* %arraydecay, i32** %data, align 8, !dbg !133
  %0 = load i32*, i32** %data, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  br label %if.end, !dbg !136

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !140
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !141
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !142
  store i32 0, i32* %arrayidx3, align 4, !dbg !143
  %1 = load i32*, i32** %data, align 8, !dbg !144
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !145
  %call5 = call i32* @wcsncpy(i32* noundef %1, i32* noundef %arraydecay4, i64 noundef 99), !dbg !146
  %2 = load i32*, i32** %data, align 8, !dbg !147
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !147
  store i32 0, i32* %arrayidx6, align 4, !dbg !148
  %3 = load i32*, i32** %data, align 8, !dbg !149
  call void @printWLine(i32* noundef %3), !dbg !150
  ret void, !dbg !151
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 40, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 41, column: 13, scope: !11)
!34 = !DILocation(line: 42, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!36 = !DILocation(line: 42, column: 8, scope: !11)
!37 = !DILocation(line: 46, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !12, line: 43, column: 5)
!39 = !DILocation(line: 46, column: 14, scope: !38)
!40 = !DILocation(line: 47, column: 9, scope: !38)
!41 = !DILocation(line: 47, column: 17, scope: !38)
!42 = !DILocation(line: 48, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 50, type: !30)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 49, column: 5)
!45 = !DILocation(line: 50, column: 17, scope: !44)
!46 = !DILocation(line: 51, column: 17, scope: !44)
!47 = !DILocation(line: 51, column: 9, scope: !44)
!48 = !DILocation(line: 52, column: 9, scope: !44)
!49 = !DILocation(line: 52, column: 23, scope: !44)
!50 = !DILocation(line: 54, column: 17, scope: !44)
!51 = !DILocation(line: 54, column: 23, scope: !44)
!52 = !DILocation(line: 54, column: 9, scope: !44)
!53 = !DILocation(line: 55, column: 9, scope: !44)
!54 = !DILocation(line: 55, column: 21, scope: !44)
!55 = !DILocation(line: 56, column: 20, scope: !44)
!56 = !DILocation(line: 56, column: 9, scope: !44)
!57 = !DILocation(line: 58, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_08_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!59 = !DILocation(line: 117, column: 5, scope: !58)
!60 = !DILocation(line: 118, column: 5, scope: !58)
!61 = !DILocation(line: 119, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !63, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!63 = !DISubroutineType(types: !64)
!64 = !{!22, !22, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 131, type: !22)
!69 = !DILocation(line: 131, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 131, type: !65)
!71 = !DILocation(line: 131, column: 27, scope: !62)
!72 = !DILocation(line: 134, column: 22, scope: !62)
!73 = !DILocation(line: 134, column: 12, scope: !62)
!74 = !DILocation(line: 134, column: 5, scope: !62)
!75 = !DILocation(line: 136, column: 5, scope: !62)
!76 = !DILocation(line: 137, column: 5, scope: !62)
!77 = !DILocation(line: 138, column: 5, scope: !62)
!78 = !DILocation(line: 141, column: 5, scope: !62)
!79 = !DILocation(line: 142, column: 5, scope: !62)
!80 = !DILocation(line: 143, column: 5, scope: !62)
!81 = !DILocation(line: 145, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !83, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!83 = !DISubroutineType(types: !84)
!84 = !{!22}
!85 = !DILocation(line: 27, column: 5, scope: !82)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!87 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 67, type: !17)
!88 = !DILocation(line: 67, column: 15, scope: !86)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !12, line: 68, type: !25)
!90 = !DILocation(line: 68, column: 13, scope: !86)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !12, line: 69, type: !30)
!92 = !DILocation(line: 69, column: 13, scope: !86)
!93 = !DILocation(line: 70, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !86, file: !12, line: 70, column: 8)
!95 = !DILocation(line: 70, column: 8, scope: !86)
!96 = !DILocation(line: 73, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !12, line: 71, column: 5)
!98 = !DILocation(line: 74, column: 5, scope: !97)
!99 = !DILocation(line: 78, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !12, line: 76, column: 5)
!101 = !DILocation(line: 78, column: 14, scope: !100)
!102 = !DILocation(line: 79, column: 9, scope: !100)
!103 = !DILocation(line: 79, column: 17, scope: !100)
!104 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 82, type: !30)
!105 = distinct !DILexicalBlock(scope: !86, file: !12, line: 81, column: 5)
!106 = !DILocation(line: 82, column: 17, scope: !105)
!107 = !DILocation(line: 83, column: 17, scope: !105)
!108 = !DILocation(line: 83, column: 9, scope: !105)
!109 = !DILocation(line: 84, column: 9, scope: !105)
!110 = !DILocation(line: 84, column: 23, scope: !105)
!111 = !DILocation(line: 86, column: 17, scope: !105)
!112 = !DILocation(line: 86, column: 23, scope: !105)
!113 = !DILocation(line: 86, column: 9, scope: !105)
!114 = !DILocation(line: 87, column: 9, scope: !105)
!115 = !DILocation(line: 87, column: 21, scope: !105)
!116 = !DILocation(line: 88, column: 20, scope: !105)
!117 = !DILocation(line: 88, column: 9, scope: !105)
!118 = !DILocation(line: 90, column: 1, scope: !86)
!119 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !83, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!120 = !DILocation(line: 32, column: 5, scope: !119)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!122 = !DILocalVariable(name: "data", scope: !121, file: !12, line: 95, type: !17)
!123 = !DILocation(line: 95, column: 15, scope: !121)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !12, line: 96, type: !25)
!125 = !DILocation(line: 96, column: 13, scope: !121)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !12, line: 97, type: !30)
!127 = !DILocation(line: 97, column: 13, scope: !121)
!128 = !DILocation(line: 98, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !121, file: !12, line: 98, column: 8)
!130 = !DILocation(line: 98, column: 8, scope: !121)
!131 = !DILocation(line: 101, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 99, column: 5)
!133 = !DILocation(line: 101, column: 14, scope: !132)
!134 = !DILocation(line: 102, column: 9, scope: !132)
!135 = !DILocation(line: 102, column: 17, scope: !132)
!136 = !DILocation(line: 103, column: 5, scope: !132)
!137 = !DILocalVariable(name: "source", scope: !138, file: !12, line: 105, type: !30)
!138 = distinct !DILexicalBlock(scope: !121, file: !12, line: 104, column: 5)
!139 = !DILocation(line: 105, column: 17, scope: !138)
!140 = !DILocation(line: 106, column: 17, scope: !138)
!141 = !DILocation(line: 106, column: 9, scope: !138)
!142 = !DILocation(line: 107, column: 9, scope: !138)
!143 = !DILocation(line: 107, column: 23, scope: !138)
!144 = !DILocation(line: 109, column: 17, scope: !138)
!145 = !DILocation(line: 109, column: 23, scope: !138)
!146 = !DILocation(line: 109, column: 9, scope: !138)
!147 = !DILocation(line: 110, column: 9, scope: !138)
!148 = !DILocation(line: 110, column: 21, scope: !138)
!149 = !DILocation(line: 111, column: 20, scope: !138)
!150 = !DILocation(line: 111, column: 9, scope: !138)
!151 = !DILocation(line: 113, column: 1, scope: !121)
