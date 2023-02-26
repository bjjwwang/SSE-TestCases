; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !35
  %cmp = icmp slt i32 %0, 1, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay, i32** %data, align 8, !dbg !41
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %1, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !50
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !51, metadata !DIExpression()), !dbg !58
  store i64 0, i64* %i1, align 8, !dbg !59
  br label %for.cond2, !dbg !61

for.cond2:                                        ; preds = %for.inc6, %for.end
  %3 = load i64, i64* %i1, align 8, !dbg !62
  %cmp3 = icmp ult i64 %3, 100, !dbg !64
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !65

for.body4:                                        ; preds = %for.cond2
  %4 = load i64, i64* %i1, align 8, !dbg !66
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !68
  %5 = load i32, i32* %arrayidx, align 4, !dbg !68
  %6 = load i32*, i32** %data, align 8, !dbg !69
  %7 = load i64, i64* %i1, align 8, !dbg !70
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !69
  store i32 %5, i32* %arrayidx5, align 4, !dbg !71
  br label %for.inc6, !dbg !72

for.inc6:                                         ; preds = %for.body4
  %8 = load i64, i64* %i1, align 8, !dbg !73
  %inc7 = add i64 %8, 1, !dbg !73
  store i64 %inc7, i64* %i1, align 8, !dbg !73
  br label %for.cond2, !dbg !74, !llvm.loop !75

for.end8:                                         ; preds = %for.cond2
  %9 = load i32*, i32** %data, align 8, !dbg !77
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !77
  %10 = load i32, i32* %arrayidx9, align 4, !dbg !77
  call void @printIntLine(i32 noundef %10), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_17_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* noundef null), !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 noundef %conv), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_17_good(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_17_bad(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 0, i32* %h, align 4, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !115
  %cmp = icmp slt i32 %0, 1, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i32* %arraydecay, i32** %data, align 8, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !123
  %inc = add nsw i32 %1, 1, !dbg !123
  store i32 %inc, i32* %h, align 4, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond1, !dbg !135

for.cond1:                                        ; preds = %for.inc5, %for.end
  %3 = load i64, i64* %i, align 8, !dbg !136
  %cmp2 = icmp ult i64 %3, 100, !dbg !138
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !139

for.body3:                                        ; preds = %for.cond1
  %4 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !142
  %5 = load i32, i32* %arrayidx, align 4, !dbg !142
  %6 = load i32*, i32** %data, align 8, !dbg !143
  %7 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !143
  store i32 %5, i32* %arrayidx4, align 4, !dbg !145
  br label %for.inc5, !dbg !146

for.inc5:                                         ; preds = %for.body3
  %8 = load i64, i64* %i, align 8, !dbg !147
  %inc6 = add i64 %8, 1, !dbg !147
  store i64 %inc6, i64* %i, align 8, !dbg !147
  br label %for.cond1, !dbg !148, !llvm.loop !149

for.end7:                                         ; preds = %for.cond1
  %9 = load i32*, i32** %data, align 8, !dbg !151
  %arrayidx8 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !151
  %10 = load i32, i32* %arrayidx8, align 4, !dbg !151
  call void @printIntLine(i32 noundef %10), !dbg !152
  ret void, !dbg !153
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_17_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 9, scope: !11)
!19 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!21 = !DILocation(line: 24, column: 11, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 25, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 25, column: 9, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 26, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 26, column: 9, scope: !11)
!32 = !DILocation(line: 27, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!34 = !DILocation(line: 27, column: 9, scope: !33)
!35 = !DILocation(line: 27, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 27, column: 5)
!37 = !DILocation(line: 27, column: 18, scope: !36)
!38 = !DILocation(line: 27, column: 5, scope: !33)
!39 = !DILocation(line: 31, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 28, column: 5)
!41 = !DILocation(line: 31, column: 14, scope: !40)
!42 = !DILocation(line: 32, column: 5, scope: !40)
!43 = !DILocation(line: 27, column: 24, scope: !36)
!44 = !DILocation(line: 27, column: 5, scope: !36)
!45 = distinct !{!45, !38, !46, !47}
!46 = !DILocation(line: 32, column: 5, scope: !33)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocalVariable(name: "source", scope: !49, file: !12, line: 34, type: !28)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!50 = !DILocation(line: 34, column: 13, scope: !49)
!51 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 36, type: !53)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 35, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 31, baseType: !55)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !56, line: 94, baseType: !57)
!56 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!57 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 36, column: 20, scope: !52)
!59 = !DILocation(line: 38, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !52, file: !12, line: 38, column: 13)
!61 = !DILocation(line: 38, column: 18, scope: !60)
!62 = !DILocation(line: 38, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !12, line: 38, column: 13)
!64 = !DILocation(line: 38, column: 27, scope: !63)
!65 = !DILocation(line: 38, column: 13, scope: !60)
!66 = !DILocation(line: 40, column: 34, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !12, line: 39, column: 13)
!68 = !DILocation(line: 40, column: 27, scope: !67)
!69 = !DILocation(line: 40, column: 17, scope: !67)
!70 = !DILocation(line: 40, column: 22, scope: !67)
!71 = !DILocation(line: 40, column: 25, scope: !67)
!72 = !DILocation(line: 41, column: 13, scope: !67)
!73 = !DILocation(line: 38, column: 35, scope: !63)
!74 = !DILocation(line: 38, column: 13, scope: !63)
!75 = distinct !{!75, !65, !76, !47}
!76 = !DILocation(line: 41, column: 13, scope: !60)
!77 = !DILocation(line: 42, column: 26, scope: !52)
!78 = !DILocation(line: 42, column: 13, scope: !52)
!79 = !DILocation(line: 45, column: 1, scope: !11)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_17_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DILocation(line: 79, column: 5, scope: !80)
!82 = !DILocation(line: 80, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !84, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DISubroutineType(types: !85)
!85 = !{!17, !17, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !12, line: 92, type: !17)
!90 = !DILocation(line: 92, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !12, line: 92, type: !86)
!92 = !DILocation(line: 92, column: 27, scope: !83)
!93 = !DILocation(line: 95, column: 22, scope: !83)
!94 = !DILocation(line: 95, column: 12, scope: !83)
!95 = !DILocation(line: 95, column: 5, scope: !83)
!96 = !DILocation(line: 97, column: 5, scope: !83)
!97 = !DILocation(line: 98, column: 5, scope: !83)
!98 = !DILocation(line: 99, column: 5, scope: !83)
!99 = !DILocation(line: 102, column: 5, scope: !83)
!100 = !DILocation(line: 103, column: 5, scope: !83)
!101 = !DILocation(line: 104, column: 5, scope: !83)
!102 = !DILocation(line: 106, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!104 = !DILocalVariable(name: "h", scope: !103, file: !12, line: 54, type: !17)
!105 = !DILocation(line: 54, column: 9, scope: !103)
!106 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 55, type: !20)
!107 = !DILocation(line: 55, column: 11, scope: !103)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 56, type: !23)
!109 = !DILocation(line: 56, column: 9, scope: !103)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 57, type: !28)
!111 = !DILocation(line: 57, column: 9, scope: !103)
!112 = !DILocation(line: 58, column: 11, scope: !113)
!113 = distinct !DILexicalBlock(scope: !103, file: !12, line: 58, column: 5)
!114 = !DILocation(line: 58, column: 9, scope: !113)
!115 = !DILocation(line: 58, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 58, column: 5)
!117 = !DILocation(line: 58, column: 18, scope: !116)
!118 = !DILocation(line: 58, column: 5, scope: !113)
!119 = !DILocation(line: 61, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !12, line: 59, column: 5)
!121 = !DILocation(line: 61, column: 14, scope: !120)
!122 = !DILocation(line: 62, column: 5, scope: !120)
!123 = !DILocation(line: 58, column: 24, scope: !116)
!124 = !DILocation(line: 58, column: 5, scope: !116)
!125 = distinct !{!125, !118, !126, !47}
!126 = !DILocation(line: 62, column: 5, scope: !113)
!127 = !DILocalVariable(name: "source", scope: !128, file: !12, line: 64, type: !28)
!128 = distinct !DILexicalBlock(scope: !103, file: !12, line: 63, column: 5)
!129 = !DILocation(line: 64, column: 13, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !131, file: !12, line: 66, type: !53)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 65, column: 9)
!132 = !DILocation(line: 66, column: 20, scope: !131)
!133 = !DILocation(line: 68, column: 20, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 68, column: 13)
!135 = !DILocation(line: 68, column: 18, scope: !134)
!136 = !DILocation(line: 68, column: 25, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 68, column: 13)
!138 = !DILocation(line: 68, column: 27, scope: !137)
!139 = !DILocation(line: 68, column: 13, scope: !134)
!140 = !DILocation(line: 70, column: 34, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !12, line: 69, column: 13)
!142 = !DILocation(line: 70, column: 27, scope: !141)
!143 = !DILocation(line: 70, column: 17, scope: !141)
!144 = !DILocation(line: 70, column: 22, scope: !141)
!145 = !DILocation(line: 70, column: 25, scope: !141)
!146 = !DILocation(line: 71, column: 13, scope: !141)
!147 = !DILocation(line: 68, column: 35, scope: !137)
!148 = !DILocation(line: 68, column: 13, scope: !137)
!149 = distinct !{!149, !139, !150, !47}
!150 = !DILocation(line: 71, column: 13, scope: !134)
!151 = !DILocation(line: 72, column: 26, scope: !131)
!152 = !DILocation(line: 72, column: 13, scope: !131)
!153 = !DILocation(line: 75, column: 1, scope: !103)
