; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i64** %data, metadata !19, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  store i32 0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !38
  %cmp = icmp slt i32 %0, 1, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i64* %arraydecay, i64** %data, align 8, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %1, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !54, metadata !DIExpression()), !dbg !61
  store i64 0, i64* %i1, align 8, !dbg !62
  br label %for.cond2, !dbg !64

for.cond2:                                        ; preds = %for.inc6, %for.end
  %3 = load i64, i64* %i1, align 8, !dbg !65
  %cmp3 = icmp ult i64 %3, 100, !dbg !67
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !68

for.body4:                                        ; preds = %for.cond2
  %4 = load i64, i64* %i1, align 8, !dbg !69
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !71
  %5 = load i64, i64* %arrayidx, align 8, !dbg !71
  %6 = load i64*, i64** %data, align 8, !dbg !72
  %7 = load i64, i64* %i1, align 8, !dbg !73
  %arrayidx5 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !72
  store i64 %5, i64* %arrayidx5, align 8, !dbg !74
  br label %for.inc6, !dbg !75

for.inc6:                                         ; preds = %for.body4
  %8 = load i64, i64* %i1, align 8, !dbg !76
  %inc7 = add i64 %8, 1, !dbg !76
  store i64 %inc7, i64* %i1, align 8, !dbg !76
  br label %for.cond2, !dbg !77, !llvm.loop !78

for.end8:                                         ; preds = %for.cond2
  %9 = load i64*, i64** %data, align 8, !dbg !80
  %arrayidx9 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !80
  %10 = load i64, i64* %arrayidx9, align 8, !dbg !80
  call void @printLongLongLine(i64 noundef %10), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLongLongLine(i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* noundef null), !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 noundef %conv), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_good(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_bad(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 0, i32* %h, align 4, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !118
  %cmp = icmp slt i32 %0, 1, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !122
  store i64* %arraydecay, i64** %data, align 8, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !126
  %inc = add nsw i32 %1, 1, !dbg !126
  store i32 %inc, i32* %h, align 4, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond1, !dbg !138

for.cond1:                                        ; preds = %for.inc5, %for.end
  %3 = load i64, i64* %i, align 8, !dbg !139
  %cmp2 = icmp ult i64 %3, 100, !dbg !141
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !142

for.body3:                                        ; preds = %for.cond1
  %4 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !145
  %5 = load i64, i64* %arrayidx, align 8, !dbg !145
  %6 = load i64*, i64** %data, align 8, !dbg !146
  %7 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx4 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !146
  store i64 %5, i64* %arrayidx4, align 8, !dbg !148
  br label %for.inc5, !dbg !149

for.inc5:                                         ; preds = %for.body3
  %8 = load i64, i64* %i, align 8, !dbg !150
  %inc6 = add i64 %8, 1, !dbg !150
  store i64 %inc6, i64* %i, align 8, !dbg !150
  br label %for.cond1, !dbg !151, !llvm.loop !152

for.end7:                                         ; preds = %for.cond1
  %9 = load i64*, i64** %data, align 8, !dbg !154
  %arrayidx8 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !154
  %10 = load i64, i64* %arrayidx8, align 8, !dbg !154
  call void @printLongLongLine(i64 noundef %10), !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 9, scope: !11)
!19 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !22, line: 30, baseType: !23)
!22 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!23 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!24 = !DILocation(line: 24, column: 15, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 25, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 25, column: 13, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 26, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 26, column: 13, scope: !11)
!35 = !DILocation(line: 27, column: 11, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!37 = !DILocation(line: 27, column: 9, scope: !36)
!38 = !DILocation(line: 27, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 27, column: 5)
!40 = !DILocation(line: 27, column: 18, scope: !39)
!41 = !DILocation(line: 27, column: 5, scope: !36)
!42 = !DILocation(line: 31, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 28, column: 5)
!44 = !DILocation(line: 31, column: 14, scope: !43)
!45 = !DILocation(line: 32, column: 5, scope: !43)
!46 = !DILocation(line: 27, column: 24, scope: !39)
!47 = !DILocation(line: 27, column: 5, scope: !39)
!48 = distinct !{!48, !41, !49, !50}
!49 = !DILocation(line: 32, column: 5, scope: !36)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 34, type: !31)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!53 = !DILocation(line: 34, column: 17, scope: !52)
!54 = !DILocalVariable(name: "i", scope: !55, file: !12, line: 36, type: !56)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 35, column: 9)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 31, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !59, line: 94, baseType: !60)
!59 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!60 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 36, column: 20, scope: !55)
!62 = !DILocation(line: 38, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !55, file: !12, line: 38, column: 13)
!64 = !DILocation(line: 38, column: 18, scope: !63)
!65 = !DILocation(line: 38, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 38, column: 13)
!67 = !DILocation(line: 38, column: 27, scope: !66)
!68 = !DILocation(line: 38, column: 13, scope: !63)
!69 = !DILocation(line: 40, column: 34, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !12, line: 39, column: 13)
!71 = !DILocation(line: 40, column: 27, scope: !70)
!72 = !DILocation(line: 40, column: 17, scope: !70)
!73 = !DILocation(line: 40, column: 22, scope: !70)
!74 = !DILocation(line: 40, column: 25, scope: !70)
!75 = !DILocation(line: 41, column: 13, scope: !70)
!76 = !DILocation(line: 38, column: 35, scope: !66)
!77 = !DILocation(line: 38, column: 13, scope: !66)
!78 = distinct !{!78, !68, !79, !50}
!79 = !DILocation(line: 41, column: 13, scope: !63)
!80 = !DILocation(line: 42, column: 31, scope: !55)
!81 = !DILocation(line: 42, column: 13, scope: !55)
!82 = !DILocation(line: 45, column: 1, scope: !11)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_17_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DILocation(line: 79, column: 5, scope: !83)
!85 = !DILocation(line: 80, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !87, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!87 = !DISubroutineType(types: !88)
!88 = !{!17, !17, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !12, line: 92, type: !17)
!93 = !DILocation(line: 92, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !12, line: 92, type: !89)
!95 = !DILocation(line: 92, column: 27, scope: !86)
!96 = !DILocation(line: 95, column: 22, scope: !86)
!97 = !DILocation(line: 95, column: 12, scope: !86)
!98 = !DILocation(line: 95, column: 5, scope: !86)
!99 = !DILocation(line: 97, column: 5, scope: !86)
!100 = !DILocation(line: 98, column: 5, scope: !86)
!101 = !DILocation(line: 99, column: 5, scope: !86)
!102 = !DILocation(line: 102, column: 5, scope: !86)
!103 = !DILocation(line: 103, column: 5, scope: !86)
!104 = !DILocation(line: 104, column: 5, scope: !86)
!105 = !DILocation(line: 106, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!107 = !DILocalVariable(name: "h", scope: !106, file: !12, line: 54, type: !17)
!108 = !DILocation(line: 54, column: 9, scope: !106)
!109 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 55, type: !20)
!110 = !DILocation(line: 55, column: 15, scope: !106)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !12, line: 56, type: !26)
!112 = !DILocation(line: 56, column: 13, scope: !106)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !12, line: 57, type: !31)
!114 = !DILocation(line: 57, column: 13, scope: !106)
!115 = !DILocation(line: 58, column: 11, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !12, line: 58, column: 5)
!117 = !DILocation(line: 58, column: 9, scope: !116)
!118 = !DILocation(line: 58, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 58, column: 5)
!120 = !DILocation(line: 58, column: 18, scope: !119)
!121 = !DILocation(line: 58, column: 5, scope: !116)
!122 = !DILocation(line: 61, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !12, line: 59, column: 5)
!124 = !DILocation(line: 61, column: 14, scope: !123)
!125 = !DILocation(line: 62, column: 5, scope: !123)
!126 = !DILocation(line: 58, column: 24, scope: !119)
!127 = !DILocation(line: 58, column: 5, scope: !119)
!128 = distinct !{!128, !121, !129, !50}
!129 = !DILocation(line: 62, column: 5, scope: !116)
!130 = !DILocalVariable(name: "source", scope: !131, file: !12, line: 64, type: !31)
!131 = distinct !DILexicalBlock(scope: !106, file: !12, line: 63, column: 5)
!132 = !DILocation(line: 64, column: 17, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !134, file: !12, line: 66, type: !56)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 65, column: 9)
!135 = !DILocation(line: 66, column: 20, scope: !134)
!136 = !DILocation(line: 68, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 68, column: 13)
!138 = !DILocation(line: 68, column: 18, scope: !137)
!139 = !DILocation(line: 68, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 68, column: 13)
!141 = !DILocation(line: 68, column: 27, scope: !140)
!142 = !DILocation(line: 68, column: 13, scope: !137)
!143 = !DILocation(line: 70, column: 34, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !12, line: 69, column: 13)
!145 = !DILocation(line: 70, column: 27, scope: !144)
!146 = !DILocation(line: 70, column: 17, scope: !144)
!147 = !DILocation(line: 70, column: 22, scope: !144)
!148 = !DILocation(line: 70, column: 25, scope: !144)
!149 = !DILocation(line: 71, column: 13, scope: !144)
!150 = !DILocation(line: 68, column: 35, scope: !140)
!151 = !DILocation(line: 68, column: 13, scope: !140)
!152 = distinct !{!152, !142, !153, !50}
!153 = !DILocation(line: 71, column: 13, scope: !137)
!154 = !DILocation(line: 72, column: 31, scope: !134)
!155 = !DILocation(line: 72, column: 13, scope: !134)
!156 = !DILocation(line: 75, column: 1, scope: !106)
