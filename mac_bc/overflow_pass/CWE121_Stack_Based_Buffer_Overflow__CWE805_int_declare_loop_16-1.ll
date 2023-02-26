; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  br label %while.body, !dbg !30

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !33
  br label %while.end, !dbg !34

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %while.end
  %1 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %1, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !55
  %3 = load i32, i32* %arrayidx, align 4, !dbg !55
  %4 = load i32*, i32** %data, align 8, !dbg !56
  %5 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !56
  store i32 %3, i32* %arrayidx1, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %6, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !65
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !65
  call void @printIntLine(i32 noundef %8), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_16_good() #0 !dbg !68 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_16_good(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_16_bad(), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  br label %while.body, !dbg !98

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i32* %arraydecay, i32** %data, align 8, !dbg !101
  br label %while.end, !dbg !102

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !105
  call void @llvm.dbg.declare(metadata i64* %i, metadata !106, metadata !DIExpression()), !dbg !108
  store i64 0, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %while.end
  %1 = load i64, i64* %i, align 8, !dbg !112
  %cmp = icmp ult i64 %1, 100, !dbg !114
  br i1 %cmp, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !118
  %3 = load i32, i32* %arrayidx, align 4, !dbg !118
  %4 = load i32*, i32** %data, align 8, !dbg !119
  %5 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !119
  store i32 %3, i32* %arrayidx1, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %6, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !127
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !127
  call void @printIntLine(i32 noundef %8), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_16_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 23, column: 11, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 24, column: 9, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 25, column: 9, scope: !11)
!30 = !DILocation(line: 26, column: 5, scope: !11)
!31 = !DILocation(line: 30, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!33 = !DILocation(line: 30, column: 14, scope: !32)
!34 = !DILocation(line: 31, column: 9, scope: !32)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 34, type: !26)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!37 = !DILocation(line: 34, column: 13, scope: !36)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 35, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 31, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !43, line: 94, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 36, column: 20, scope: !39)
!46 = !DILocation(line: 38, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !12, line: 38, column: 13)
!48 = !DILocation(line: 38, column: 18, scope: !47)
!49 = !DILocation(line: 38, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 38, column: 13)
!51 = !DILocation(line: 38, column: 27, scope: !50)
!52 = !DILocation(line: 38, column: 13, scope: !47)
!53 = !DILocation(line: 40, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 39, column: 13)
!55 = !DILocation(line: 40, column: 27, scope: !54)
!56 = !DILocation(line: 40, column: 17, scope: !54)
!57 = !DILocation(line: 40, column: 22, scope: !54)
!58 = !DILocation(line: 40, column: 25, scope: !54)
!59 = !DILocation(line: 41, column: 13, scope: !54)
!60 = !DILocation(line: 38, column: 35, scope: !50)
!61 = !DILocation(line: 38, column: 13, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 41, column: 13, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 42, column: 26, scope: !39)
!66 = !DILocation(line: 42, column: 13, scope: !39)
!67 = !DILocation(line: 45, column: 1, scope: !11)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_16_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!69 = !DILocation(line: 79, column: 5, scope: !68)
!70 = !DILocation(line: 80, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !72, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DISubroutineType(types: !73)
!73 = !{!18, !18, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !12, line: 92, type: !18)
!78 = !DILocation(line: 92, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !12, line: 92, type: !74)
!80 = !DILocation(line: 92, column: 27, scope: !71)
!81 = !DILocation(line: 95, column: 22, scope: !71)
!82 = !DILocation(line: 95, column: 12, scope: !71)
!83 = !DILocation(line: 95, column: 5, scope: !71)
!84 = !DILocation(line: 97, column: 5, scope: !71)
!85 = !DILocation(line: 98, column: 5, scope: !71)
!86 = !DILocation(line: 99, column: 5, scope: !71)
!87 = !DILocation(line: 102, column: 5, scope: !71)
!88 = !DILocation(line: 103, column: 5, scope: !71)
!89 = !DILocation(line: 104, column: 5, scope: !71)
!90 = !DILocation(line: 106, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 54, type: !17)
!93 = !DILocation(line: 54, column: 11, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 55, type: !21)
!95 = !DILocation(line: 55, column: 9, scope: !91)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 56, type: !26)
!97 = !DILocation(line: 56, column: 9, scope: !91)
!98 = !DILocation(line: 57, column: 5, scope: !91)
!99 = !DILocation(line: 60, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !91, file: !12, line: 58, column: 5)
!101 = !DILocation(line: 60, column: 14, scope: !100)
!102 = !DILocation(line: 61, column: 9, scope: !100)
!103 = !DILocalVariable(name: "source", scope: !104, file: !12, line: 64, type: !26)
!104 = distinct !DILexicalBlock(scope: !91, file: !12, line: 63, column: 5)
!105 = !DILocation(line: 64, column: 13, scope: !104)
!106 = !DILocalVariable(name: "i", scope: !107, file: !12, line: 66, type: !40)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 65, column: 9)
!108 = !DILocation(line: 66, column: 20, scope: !107)
!109 = !DILocation(line: 68, column: 20, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 68, column: 13)
!111 = !DILocation(line: 68, column: 18, scope: !110)
!112 = !DILocation(line: 68, column: 25, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 68, column: 13)
!114 = !DILocation(line: 68, column: 27, scope: !113)
!115 = !DILocation(line: 68, column: 13, scope: !110)
!116 = !DILocation(line: 70, column: 34, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 69, column: 13)
!118 = !DILocation(line: 70, column: 27, scope: !117)
!119 = !DILocation(line: 70, column: 17, scope: !117)
!120 = !DILocation(line: 70, column: 22, scope: !117)
!121 = !DILocation(line: 70, column: 25, scope: !117)
!122 = !DILocation(line: 71, column: 13, scope: !117)
!123 = !DILocation(line: 68, column: 35, scope: !113)
!124 = !DILocation(line: 68, column: 13, scope: !113)
!125 = distinct !{!125, !115, !126, !64}
!126 = !DILocation(line: 71, column: 13, scope: !110)
!127 = !DILocation(line: 72, column: 26, scope: !107)
!128 = !DILocation(line: 72, column: 13, scope: !107)
!129 = !DILocation(line: 75, column: 1, scope: !91)
