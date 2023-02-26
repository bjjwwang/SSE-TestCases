; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  br label %source, !dbg !30

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !31), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx3, align 1, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %source
  %1 = load i64, i64* %i, align 8, !dbg !53
  %cmp = icmp ult i64 %1, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 %2, !dbg !59
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !59
  %4 = load i8*, i8** %data, align 8, !dbg !60
  %5 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !60
  store i8 %3, i8* %arrayidx5, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %6, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !69
  store i8 0, i8* %arrayidx6, align 1, !dbg !70
  %8 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* noundef %8), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* noundef null), !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 noundef %conv), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_good(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_bad(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  br label %source, !dbg !103

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !104), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !106
  store i8* %arraydecay, i8** %data, align 8, !dbg !107
  %0 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx3, align 1, !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %source
  %1 = load i64, i64* %i, align 8, !dbg !121
  %cmp = icmp ult i64 %1, 100, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 %2, !dbg !127
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !127
  %4 = load i8*, i8** %data, align 8, !dbg !128
  %5 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !128
  store i8 %3, i8* %arrayidx5, align 1, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %6, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !136
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !136
  store i8 0, i8* %arrayidx6, align 1, !dbg !137
  %8 = load i8*, i8** %data, align 8, !dbg !138
  call void @printLine(i8* noundef %8), !dbg !139
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 10, scope: !11)
!30 = !DILocation(line: 28, column: 5, scope: !11)
!31 = !DILabel(scope: !11, name: "source", file: !12, line: 29)
!32 = !DILocation(line: 29, column: 1, scope: !11)
!33 = !DILocation(line: 32, column: 12, scope: !11)
!34 = !DILocation(line: 32, column: 10, scope: !11)
!35 = !DILocation(line: 33, column: 5, scope: !11)
!36 = !DILocation(line: 33, column: 13, scope: !11)
!37 = !DILocalVariable(name: "i", scope: !38, file: !12, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 31, baseType: !41)
!40 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !42, line: 94, baseType: !43)
!42 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!43 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 35, column: 16, scope: !38)
!45 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 36, type: !26)
!46 = !DILocation(line: 36, column: 14, scope: !38)
!47 = !DILocation(line: 37, column: 9, scope: !38)
!48 = !DILocation(line: 38, column: 9, scope: !38)
!49 = !DILocation(line: 38, column: 23, scope: !38)
!50 = !DILocation(line: 40, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !38, file: !12, line: 40, column: 9)
!52 = !DILocation(line: 40, column: 14, scope: !51)
!53 = !DILocation(line: 40, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !12, line: 40, column: 9)
!55 = !DILocation(line: 40, column: 23, scope: !54)
!56 = !DILocation(line: 40, column: 9, scope: !51)
!57 = !DILocation(line: 42, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !12, line: 41, column: 9)
!59 = !DILocation(line: 42, column: 23, scope: !58)
!60 = !DILocation(line: 42, column: 13, scope: !58)
!61 = !DILocation(line: 42, column: 18, scope: !58)
!62 = !DILocation(line: 42, column: 21, scope: !58)
!63 = !DILocation(line: 43, column: 9, scope: !58)
!64 = !DILocation(line: 40, column: 31, scope: !54)
!65 = !DILocation(line: 40, column: 9, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 43, column: 9, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 44, column: 9, scope: !38)
!70 = !DILocation(line: 44, column: 21, scope: !38)
!71 = !DILocation(line: 45, column: 19, scope: !38)
!72 = !DILocation(line: 45, column: 9, scope: !38)
!73 = !DILocation(line: 47, column: 1, scope: !11)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_18_good", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!75 = !DILocation(line: 81, column: 5, scope: !74)
!76 = !DILocation(line: 82, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !78, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 94, type: !80)
!83 = !DILocation(line: 94, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 94, type: !81)
!85 = !DILocation(line: 94, column: 27, scope: !77)
!86 = !DILocation(line: 97, column: 22, scope: !77)
!87 = !DILocation(line: 97, column: 12, scope: !77)
!88 = !DILocation(line: 97, column: 5, scope: !77)
!89 = !DILocation(line: 99, column: 5, scope: !77)
!90 = !DILocation(line: 100, column: 5, scope: !77)
!91 = !DILocation(line: 101, column: 5, scope: !77)
!92 = !DILocation(line: 104, column: 5, scope: !77)
!93 = !DILocation(line: 105, column: 5, scope: !77)
!94 = !DILocation(line: 106, column: 5, scope: !77)
!95 = !DILocation(line: 108, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 56, type: !17)
!98 = !DILocation(line: 56, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !12, line: 57, type: !21)
!100 = !DILocation(line: 57, column: 10, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !12, line: 58, type: !26)
!102 = !DILocation(line: 58, column: 10, scope: !96)
!103 = !DILocation(line: 59, column: 5, scope: !96)
!104 = !DILabel(scope: !96, name: "source", file: !12, line: 60)
!105 = !DILocation(line: 60, column: 1, scope: !96)
!106 = !DILocation(line: 62, column: 12, scope: !96)
!107 = !DILocation(line: 62, column: 10, scope: !96)
!108 = !DILocation(line: 63, column: 5, scope: !96)
!109 = !DILocation(line: 63, column: 13, scope: !96)
!110 = !DILocalVariable(name: "i", scope: !111, file: !12, line: 65, type: !39)
!111 = distinct !DILexicalBlock(scope: !96, file: !12, line: 64, column: 5)
!112 = !DILocation(line: 65, column: 16, scope: !111)
!113 = !DILocalVariable(name: "source", scope: !111, file: !12, line: 66, type: !26)
!114 = !DILocation(line: 66, column: 14, scope: !111)
!115 = !DILocation(line: 67, column: 9, scope: !111)
!116 = !DILocation(line: 68, column: 9, scope: !111)
!117 = !DILocation(line: 68, column: 23, scope: !111)
!118 = !DILocation(line: 70, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !12, line: 70, column: 9)
!120 = !DILocation(line: 70, column: 14, scope: !119)
!121 = !DILocation(line: 70, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 70, column: 9)
!123 = !DILocation(line: 70, column: 23, scope: !122)
!124 = !DILocation(line: 70, column: 9, scope: !119)
!125 = !DILocation(line: 72, column: 30, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 71, column: 9)
!127 = !DILocation(line: 72, column: 23, scope: !126)
!128 = !DILocation(line: 72, column: 13, scope: !126)
!129 = !DILocation(line: 72, column: 18, scope: !126)
!130 = !DILocation(line: 72, column: 21, scope: !126)
!131 = !DILocation(line: 73, column: 9, scope: !126)
!132 = !DILocation(line: 70, column: 31, scope: !122)
!133 = !DILocation(line: 70, column: 9, scope: !122)
!134 = distinct !{!134, !124, !135, !68}
!135 = !DILocation(line: 73, column: 9, scope: !119)
!136 = !DILocation(line: 74, column: 9, scope: !111)
!137 = !DILocation(line: 74, column: 21, scope: !111)
!138 = !DILocation(line: 75, column: 19, scope: !111)
!139 = !DILocation(line: 75, column: 9, scope: !111)
!140 = !DILocation(line: 77, column: 1, scope: !96)
