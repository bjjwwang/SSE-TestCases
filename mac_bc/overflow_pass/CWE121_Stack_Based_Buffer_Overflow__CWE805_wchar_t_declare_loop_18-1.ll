; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
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
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !50
  %call = call i32* @wmemset(i32* noundef %arraydecay2, i32 noundef 67, i64 noundef 99), !dbg !51
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx3, align 4, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %source
  %1 = load i64, i64* %i, align 8, !dbg !57
  %cmp = icmp ult i64 %1, 100, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 %2, !dbg !63
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !63
  %4 = load i32*, i32** %data, align 8, !dbg !64
  %5 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !64
  store i32 %3, i32* %arrayidx5, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %6, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !73
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !73
  store i32 0, i32* %arrayidx6, align 4, !dbg !74
  %8 = load i32*, i32** %data, align 8, !dbg !75
  call void @printWLine(i32* noundef %8), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_18_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* noundef null), !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 noundef %conv), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_18_good(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_18_bad(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  br label %source, !dbg !108

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !109), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !111
  store i32* %arraydecay, i32** %data, align 8, !dbg !112
  %0 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !120
  %call = call i32* @wmemset(i32* noundef %arraydecay2, i32 noundef 67, i64 noundef 99), !dbg !121
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx3, align 4, !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %source
  %1 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %1, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 %2, !dbg !133
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !133
  %4 = load i32*, i32** %data, align 8, !dbg !134
  %5 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !134
  store i32 %3, i32* %arrayidx5, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %6, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !142
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !142
  store i32 0, i32* %arrayidx6, align 4, !dbg !143
  %8 = load i32*, i32** %data, align 8, !dbg !144
  call void @printWLine(i32* noundef %8), !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!41 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 31, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !46)
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 35, column: 16, scope: !42)
!48 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 36, type: !30)
!49 = !DILocation(line: 36, column: 17, scope: !42)
!50 = !DILocation(line: 37, column: 17, scope: !42)
!51 = !DILocation(line: 37, column: 9, scope: !42)
!52 = !DILocation(line: 38, column: 9, scope: !42)
!53 = !DILocation(line: 38, column: 23, scope: !42)
!54 = !DILocation(line: 40, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !42, file: !12, line: 40, column: 9)
!56 = !DILocation(line: 40, column: 14, scope: !55)
!57 = !DILocation(line: 40, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 40, column: 9)
!59 = !DILocation(line: 40, column: 23, scope: !58)
!60 = !DILocation(line: 40, column: 9, scope: !55)
!61 = !DILocation(line: 42, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !12, line: 41, column: 9)
!63 = !DILocation(line: 42, column: 23, scope: !62)
!64 = !DILocation(line: 42, column: 13, scope: !62)
!65 = !DILocation(line: 42, column: 18, scope: !62)
!66 = !DILocation(line: 42, column: 21, scope: !62)
!67 = !DILocation(line: 43, column: 9, scope: !62)
!68 = !DILocation(line: 40, column: 31, scope: !58)
!69 = !DILocation(line: 40, column: 9, scope: !58)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 43, column: 9, scope: !55)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 44, column: 9, scope: !42)
!74 = !DILocation(line: 44, column: 21, scope: !42)
!75 = !DILocation(line: 45, column: 20, scope: !42)
!76 = !DILocation(line: 45, column: 9, scope: !42)
!77 = !DILocation(line: 47, column: 1, scope: !11)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_18_good", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!79 = !DILocation(line: 81, column: 5, scope: !78)
!80 = !DILocation(line: 82, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !82, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!82 = !DISubroutineType(types: !83)
!83 = !{!22, !22, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 94, type: !22)
!88 = !DILocation(line: 94, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 94, type: !84)
!90 = !DILocation(line: 94, column: 27, scope: !81)
!91 = !DILocation(line: 97, column: 22, scope: !81)
!92 = !DILocation(line: 97, column: 12, scope: !81)
!93 = !DILocation(line: 97, column: 5, scope: !81)
!94 = !DILocation(line: 99, column: 5, scope: !81)
!95 = !DILocation(line: 100, column: 5, scope: !81)
!96 = !DILocation(line: 101, column: 5, scope: !81)
!97 = !DILocation(line: 104, column: 5, scope: !81)
!98 = !DILocation(line: 105, column: 5, scope: !81)
!99 = !DILocation(line: 106, column: 5, scope: !81)
!100 = !DILocation(line: 108, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 56, type: !17)
!103 = !DILocation(line: 56, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !12, line: 57, type: !25)
!105 = !DILocation(line: 57, column: 13, scope: !101)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !12, line: 58, type: !30)
!107 = !DILocation(line: 58, column: 13, scope: !101)
!108 = !DILocation(line: 59, column: 5, scope: !101)
!109 = !DILabel(scope: !101, name: "source", file: !12, line: 60)
!110 = !DILocation(line: 60, column: 1, scope: !101)
!111 = !DILocation(line: 62, column: 12, scope: !101)
!112 = !DILocation(line: 62, column: 10, scope: !101)
!113 = !DILocation(line: 63, column: 5, scope: !101)
!114 = !DILocation(line: 63, column: 13, scope: !101)
!115 = !DILocalVariable(name: "i", scope: !116, file: !12, line: 65, type: !43)
!116 = distinct !DILexicalBlock(scope: !101, file: !12, line: 64, column: 5)
!117 = !DILocation(line: 65, column: 16, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !116, file: !12, line: 66, type: !30)
!119 = !DILocation(line: 66, column: 17, scope: !116)
!120 = !DILocation(line: 67, column: 17, scope: !116)
!121 = !DILocation(line: 67, column: 9, scope: !116)
!122 = !DILocation(line: 68, column: 9, scope: !116)
!123 = !DILocation(line: 68, column: 23, scope: !116)
!124 = !DILocation(line: 70, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !116, file: !12, line: 70, column: 9)
!126 = !DILocation(line: 70, column: 14, scope: !125)
!127 = !DILocation(line: 70, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !12, line: 70, column: 9)
!129 = !DILocation(line: 70, column: 23, scope: !128)
!130 = !DILocation(line: 70, column: 9, scope: !125)
!131 = !DILocation(line: 72, column: 30, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !12, line: 71, column: 9)
!133 = !DILocation(line: 72, column: 23, scope: !132)
!134 = !DILocation(line: 72, column: 13, scope: !132)
!135 = !DILocation(line: 72, column: 18, scope: !132)
!136 = !DILocation(line: 72, column: 21, scope: !132)
!137 = !DILocation(line: 73, column: 9, scope: !132)
!138 = !DILocation(line: 70, column: 31, scope: !128)
!139 = !DILocation(line: 70, column: 9, scope: !128)
!140 = distinct !{!140, !130, !141, !72}
!141 = !DILocation(line: 73, column: 9, scope: !125)
!142 = !DILocation(line: 74, column: 9, scope: !116)
!143 = !DILocation(line: 74, column: 21, scope: !116)
!144 = !DILocation(line: 75, column: 20, scope: !116)
!145 = !DILocation(line: 75, column: 9, scope: !116)
!146 = !DILocation(line: 77, column: 1, scope: !101)
